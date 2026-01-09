Return-Path: <linux-arm-msm+bounces-88173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63539D07219
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CDBE3028F64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905AE1C862D;
	Fri,  9 Jan 2026 04:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akkoRoVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0D29D26C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933243; cv=none; b=lkoIq70mhZOe196AEgmAAbEQIzuQ8XpIhEYOjZgjEEliIZyJl06twDGpFWK5Pr9Mpitj3LwsR/X1verr0N9vWrUytnenN1kZ8if27yA1Zozo9Cc/Lehh4ybMI3kDeXWI9q48uLXmL1TozU8KvgdP6xz3gCwz8GeL6x9ShYFGQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933243; c=relaxed/simple;
	bh=5f6p0MjIoVb94q6Yxdkk6cMxfowH7rGbCR5LyjqAQyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CG3p0SP2B9MRfA9B+wsU9xLa78L6iY+oVI4YdD+yBt/BLQLQd+H0OjPeMuk9vXZSSyoTsD49l6c1nfIeGs4gsqA3IUptUaoC3VrY51hvlfgjuuDAsrHaJaN21RlnEoMxVD/KHMjlw0Sr+rgtepKOxD3soj4wH3CZJzEopvz6708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akkoRoVL; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-450b5338459so2434851b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933240; x=1768538040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRS9gGAPNZv0m+OPKpcvbvMDMuzC8rP8cL50+cIuJ0c=;
        b=akkoRoVL2ooyD0aS66WYGUlwVjVpI6hifX+HiJliL3WQlvlk9qq5xMIPnRXMSXFdS5
         pfKghQQGsescD1Sx/rzRp6ualLsuhK2Ma+stXU4S78hFHEsmYpRthZmJMCBnlXGCcvuj
         Njxca8mYlMvmhjM/HymVZRyzyUoIm2Ab/CZhn1ENywLk5zzZMFsLNrfyqKwbrmIE0pae
         7P1tmCl5OCq1DbTEjkjrn7XcwC5TnfEhhjSaQm0y34MCAxnP4juK5J8ZWqealSYSJIql
         eIxJyd7wg7BEJoiLKS/X7ZbGdUg4RgpIuqdoHTpiC8f2E0C1nrvL1SLgioy3vPNlhfCb
         +vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933240; x=1768538040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRS9gGAPNZv0m+OPKpcvbvMDMuzC8rP8cL50+cIuJ0c=;
        b=nVf8hZF5QhdOJIndxMHQBT7qRWeSiXZX/Vs3KMgyYR7Je35qH30enS5VHWzoiB7QZK
         VsOxBAkhiwTOVAoOuyeIjP0tg4rYXl1kilXioQvYeO4Jk/CBu6eXv/DIoNMKenAMKbAQ
         2Y+Szw0dlzBiFZCS5crv1ActNSojnJz8Y7QmNgfg4d1hbXTFI0nJ9X4Zev638kf3imUZ
         dBtMTq2ku6HkkMPzmGtUF9II1boH6nMcrgR7DE47KUodaQmIeald03pQv4y7gB+JVncN
         qzdU2/nwjPoy9/Mg76VqGhrawZ+3Z/RjrywmJn39xxLdxjS2TAzR1GZzkSLwqVuIplq8
         HCAg==
X-Forwarded-Encrypted: i=1; AJvYcCXIuxXCioY2+cs5PAnSfLt4uFnRPM1yA9jpgh6k+XNnCd3r59RiBi7QMrijoLFitMiuu3dlRkXCumZt4FKn@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZaACK/laE4dSTFEWjlAa2hV3dGhOJnZtoCTNv96LisXNTcTs
	z2m2FtO79v90xauLY43gJSnGynt8xD/DJIafmG+Q4UqVaJOCL/lUr7Xp
X-Gm-Gg: AY/fxX5rxf4J21SfEfatn6R8FPLDbdXWeBLHskIG2Pualm1RRTdAlh6S2gWw1M7S+2I
	5SaGCJTLGJMrr0GJZbev1EI/7spgU3ngTbO3K4QhirvyH6DIicoVD0iDt1KOmfR17VNMeT5EyIY
	kOtWNAsmpo3If0ex6zLUDqdTnswA3+tko7VsgswhwcsB4P1tvPyB/8oNsk3/8ss7USP5P1bG/7s
	uyXpu7jMKUT5YBAaAAWZqTd5V/aeUere1x8l0a5zR/theRYgOzBZ59h28oYp9J02ayZ2AbutyE9
	aIsZZjEZBNi37SaLQqb5lSj77Ax6pYQkBttWDOy3TJGLsOro4fbPyMtG7K5gXccF2zp+21zazfK
	znQoLgF5ho/bjWcAN+jqQOFteT5WXove09jPUfDELYk1Zo46RcjZkAgZpCfPB7dtMENWr61UN44
	Bqf0A7TDAO8eg4I6QD31B11ttaxlbCaiLHHRPl1QywfXyQP6LsiVKKY/4rIazLV1RFGgr/YS86P
	NoRJ7qTqeMuBVLxUBlmFD5EzK5E
X-Google-Smtp-Source: AGHT+IH8qFTLvCobTc/CYdKIqn0h+JliChB6LnP/bfX/6ft/VEkThcEwU+4hDQ5PgxrGSgk2Rnoa/w==
X-Received: by 2002:a05:6808:6a89:b0:44f:8b8b:5dcd with SMTP id 5614622812f47-45a6be987admr3631854b6e.50.1767933239894;
        Thu, 08 Jan 2026 20:33:59 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:33:58 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
Date: Thu,  8 Jan 2026 22:33:36 -0600
Message-ID: <20260109043352.3072933-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three of the clocks from struct q6v5_wcss are not populated, and are
not used. Remove them.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - no changes. Moved patch to the start of series.
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88..07bba47eb084 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -123,10 +123,7 @@ struct q6v5_wcss {
 	struct clk *ahbs_cbcr;
 	struct clk *tcm_slave_cbcr;
 	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_sleep_cbcr;
 	struct clk *qdsp6ss_axim_cbcr;
-	struct clk *qdsp6ss_xo_cbcr;
-	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
-- 
2.45.1


