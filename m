Return-Path: <linux-arm-msm+bounces-30616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D596B09F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B927D2868B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 05:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6784D8A7;
	Wed,  4 Sep 2024 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FX1Uk6mA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A67F9;
	Wed,  4 Sep 2024 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725428865; cv=none; b=ACDDqrg1xPAQpH5S8sO7c36Ex7hKfOKnFfSggb7MeaZZUbznB1UQGHcU67K9Zl0mEFIOtFvF8eEFp/7doFbss6NG+vDJMs4V2aDlDmQmeeXSzknBs0cT3MuJxj/73XQMPc7HyGXEPpoTKQdUw0dr6gsXtBswOjsA7lT6acS2QVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725428865; c=relaxed/simple;
	bh=9+Zsq3U+7RUDbpauXfVLl3TJuE2Hu/j2MRyiO5J/M/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SvKGbyLH8QXfgcsHdNdTnBf8h2pzkmYlYkm2ZoRSigqLEp7/oCnwq+H7uf5i554FRQ1NTLM0PXpPxbYk4Ij1iQCFbZilvOK4zlOdAHR642MtTBMFZlQjLqDFejGYz82zPqdqjl5geQk5UOK0AaSMZnUUISzE69NCJMBVMOMYKLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FX1Uk6mA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2053a0bd0a6so39452545ad.3;
        Tue, 03 Sep 2024 22:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725428863; x=1726033663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPZLARY2mhwLV2+TjRBGHBdo6FGrkaEkzsDd0dO5Ygc=;
        b=FX1Uk6mAAWir/PB7ogVMHnjeNq393UpQJYqGhMrydL7gVvnfr7TBIs70CwHnJXZW1/
         e4SmTwf3MLQ1t+elSwjfsDJbxfQ0vDnd3M9GXgvk9hq54l+UYDBKuJRD9yzwwdf3yWzM
         Lcns5EYxdsFy2NgAJjn+4EYIs61u8tJJ+JusfeJs2soRsmvE/pdL9r/2diggVret4QXx
         stWshZwWohe1y8sABEIssd1w7TsPf79rnJ01y7RCy5gG0E2RhmP0NS849j9GzGVXzVtW
         o3YekfV0YXOXMLP6ZH9KdDu1CxOn0NecOUIvZXzKi0U+taemZpsWM6oIWDjtNh3LNvRK
         e5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725428863; x=1726033663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPZLARY2mhwLV2+TjRBGHBdo6FGrkaEkzsDd0dO5Ygc=;
        b=NSBl51N4GeGPpSqFMuxKlkjIVsElP76McFygvzV+T2KVorGvR18JAb6oQbZdjkLnKq
         v17kzX6kir6XWdK5OCh/ryBcl2tioynpozd8pbejWti4dVHoz1fG3pi9QHk04bs1CADe
         QgGeoHczvvHoSDyo4bL2AzxfqrzPiFOUY/xRGlEZ6M2zweERIRrszRz+mDa/UslmPf6+
         0Lf6r7Yq7aqhQiynsRxittFXTFeC0gOPkTuUo9dp3uW/MhhZtsVPgrIcCIZ7VD4IZMKC
         +DYvZYnTwUN+0EdkspN6f9ngk2RiV1I077pC39hXuXGq1E7Hjh3iMmL0Xo+NhaULrA+B
         Kksg==
X-Forwarded-Encrypted: i=1; AJvYcCWg1hCwzh67l0p2yyBd/7xjAux2U7zYFS3MyfidogUYGJQ011ApBTk2bp34JthuwNps239u5z/nYqovyjr5@vger.kernel.org, AJvYcCXSQRR41Rr+UP0mXhg25ciDJgTv8ThdIsXWDMIoWzHABRpC2JXpRO8gTY1cKY8ItD69FPySryRR6RPO8Qh1@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBWDvWOwQvW0/CSubzv0k3Jvyg2I8xu92xPLxfhOoqook3+k0
	aXl9C1jpkgDSe4AqvdOPKR7T677OtY5kiieWmUbrKWkyNM1EVS05
X-Google-Smtp-Source: AGHT+IF+Kl9oj/3kcgU89pp4fO+QtscwVY1/SnnNYQ6U/J7Q1U5ipNByGKzJC9sEAPR9TvXFZFxTtg==
X-Received: by 2002:a17:902:eccc:b0:206:b8b7:85f with SMTP id d9443c01a7336-206b8b78f2fmr7240825ad.3.1725428863100;
        Tue, 03 Sep 2024 22:47:43 -0700 (PDT)
Received: from fedora.. ([106.219.164.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea67bc6sm6536055ad.258.2024.09.03.22.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:47:42 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	andersson@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] soc: qcom: apr: Fix some parenthesis alignment coding style issues
Date: Wed,  4 Sep 2024 11:17:35 +0530
Message-ID: <20240904054735.7952-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Issue reported by checkpatch:
- CHECK: Alignment should match open parenthesis

It has no functional changes.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/soc/qcom/apr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 4fbff3a890e2..db1326bdb170 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -88,7 +88,7 @@ void gpr_free_port(gpr_port_t *port)
 EXPORT_SYMBOL_GPL(gpr_free_port);
 
 gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
-				gpr_port_cb cb,	void *priv)
+			   gpr_port_cb cb, void *priv)
 {
 	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
 	gpr_port_t *port;
@@ -159,7 +159,7 @@ static void apr_dev_release(struct device *dev)
 }
 
 static int apr_callback(struct rpmsg_device *rpdev, void *buf,
-				  int len, void *priv, u32 addr)
+			int len, void *priv, u32 addr)
 {
 	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
 	struct apr_rx_buf *abuf;
@@ -222,9 +222,9 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 	}
 
 	if (hdr->src_domain >= APR_DOMAIN_MAX ||
-			hdr->dest_domain >= APR_DOMAIN_MAX ||
-			hdr->src_svc >= APR_SVC_MAX ||
-			hdr->dest_svc >= APR_SVC_MAX) {
+	    hdr->dest_domain >= APR_DOMAIN_MAX ||
+	    hdr->src_svc >= APR_SVC_MAX ||
+	    hdr->dest_svc >= APR_SVC_MAX) {
 		dev_err(apr->dev, "APR: Wrong APR header\n");
 		return -EINVAL;
 	}
-- 
2.46.0


