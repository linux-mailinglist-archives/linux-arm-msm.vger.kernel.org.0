Return-Path: <linux-arm-msm+bounces-63589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE73AF841F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F10D188EF04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A572DBF52;
	Thu,  3 Jul 2025 23:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ABS+xKcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F042DCF74
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584999; cv=none; b=HhvMD18WcR80UvKI0uDhnAS24a9vAV61TczZRGL1se27Lj0VudbpHu74tCOXMJKSn5VuV1HNzr67F71CMU8sHPeUOVMaEpEzTgj5e5i0CPCTNX91UkFsEJMYHj0N9bdyt4XLV58s7rqtKJ3lucCBEh3K4B8QSMFHWVqPNFkpVdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584999; c=relaxed/simple;
	bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyh9tNkSWHYa/VizPKmjz+MAy7O15vAMew/6cYhMW2FcZIbv/hvSwDY52YgIHm9C7LQksi5IvS7GxoqqaVhv85GVcBtMS7/mKPwdloJjKKHZSMB0gCjaxv+m9EfINOgRZPPM8dU6Ms67zaVVcvl9gnMaYXXq/RfKLwEj45AICZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ABS+xKcy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
	b=ABS+xKcyLtjUFwM5fR6iZgxImsPqElYbF4UXC9i+0YV45mTV/dXckVeaAU7jUUYtMsWvbL
	YNcUlDuKJynR583d6Gu4uUbvVq7zrQ3NZVbaPp4dPwL4x1H5NW9Odqfhs7Os2RFpLz4kjb
	JA/fSUZSL2ZBVgzIN8XE74Surm5reqg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-wQddNN9EOSmDh1iytufZrw-1; Thu, 03 Jul 2025 19:23:13 -0400
X-MC-Unique: wQddNN9EOSmDh1iytufZrw-1
X-Mimecast-MFC-AGG-ID: wQddNN9EOSmDh1iytufZrw_1751584993
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafc9f3e1bso6066776d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584993; x=1752189793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
        b=BuVxUQcPkUCELpg8KpR0HoJy8S9PKWE+BYRuVJdmF12gDeMPf0Nt1b52H3jtnR2xfQ
         nJEk4xaudhQa+lSor6YM4MrNOurEDLJl+a3vmGvPWbc+3yvHedy4DfKlZmNdZHyE7QzU
         KvzSrXv4iftVNhj9ctKQFrm9BrkZyq0MwfWocqzvWhktE5PNNfi88d0qkMcu+/ugcuLX
         ppjfHhOOSgyAtkAVpucxG/u4LVNNCHoPnnkiutTBeuNNXQU5TnbTiPX1sFnqgaIgSsE9
         Rn18KECCquW0DnZfE4NoXIvBZZkUCYVw/F31IomyO0+tbkOrf5+7JzdRQPYPJT/uF3Gv
         wxYw==
X-Forwarded-Encrypted: i=1; AJvYcCWxZbTuwYQ5v5iB+d7Z76LhkPb5ccx1h83zzpd0gw7rKyd/OBElzEuqHWJ2p93qGpLmZB+qCuCeMvTvIG5j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Ras8L/pkmsSyvykt+n1Tl1eJvovj0uoO3Zio5dBYDoMRFUtt
	jgD1qCxukBDJVesLZcBZyi3DH/UyvnGER7lKE68DOF5jJlTI8LTU9zicklQR16kW9ZpXLvYN2iU
	UMi+xtcAhENlOrO52XB8SbCBr9eD17OqnDw26Jm6AxWRDbCC8x0VJuGkk+KgdrFc2H1I=
X-Gm-Gg: ASbGncvpuWXLyWb2Am+3rZflPg71EmLzJKrHJKWV3fa9hF95W1bL9YAdlP1Mvreexq+
	LrXEqzIUNFTEjUvmO7rWgmIod6cppb1q8h7YfvPN4Tlg9bjMdD3LNCDujVfPOcnl1+Mp2MYcxe0
	GidBqfAM27fVhS4uoxfwOiGUZZAQbSGw8fRQKXGlfZy/JkHVmw7yZXUSUnvAIFbAXtDMBlRXy9i
	64KUQifaHuwqBxjvzoKJ1teYZD8p2fDJN5vncbxkKdmfVcx4d07mmRzNDMD89lsK6n+o0ULVyTp
	Pd2LjBYUNnyJ0lFHLcY/IhRtyqX7pBFNYc3xcEK4bPGj+HEzq3yQDcgOLUO5kQ==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496306d6.44.1751584992852;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3ipPg2Jg+5GD7hTnCiXfrGoYgoIQ3H/qFVOQMX3H3uHxeS2iTGlz+BWau3PM9f3haP1PQA==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496116d6.44.1751584992485;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:28 -0400
Subject: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1326;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
 b=zf4/vhBsMxt+TAFqD7aUPTk19Bt+lcfBLX/WML5Wb9wvluceirqF+3xXA/SRJdeeVovfmzXVw
 wjKAv88CuWoAzAa7aZ5FVjlB+6EYYOYea3w9xYISlQIYpuJFVJ7J6Lu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..74b052ac1ee10bdeeb59880019fb06ad58db3f74 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,10 +321,10 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_rpmh_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_rpmh_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
@@ -339,7 +339,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.round_rate	= clk_rpmh_round_rate,
+	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.50.0


