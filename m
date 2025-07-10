Return-Path: <linux-arm-msm+bounces-64443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F9B00A29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 19:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5741C421C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65682F0E43;
	Thu, 10 Jul 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdeP9z59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D52F0C7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169405; cv=none; b=chfKtGAznYUmIOfmSbyOIbDA/yEN1SC/Ov9zCXDAYZlpD7fO9I5KjqQBDVwe2/LEDFic4bB9DFUqiM+XmVRu3kXIV9U2n7/i+LwWODMHUB31fG2oUUqVyE+JqPsr0FPQQixGQIW+uCUnU+NJQ7XJRjul4EgGe9QU2DxqjtXE/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169405; c=relaxed/simple;
	bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrj5eHpU4RsMizeyMfWwba/BP0x/LkeKhtIoAkTl2hWtpJSYvReu30rPaJaqPQ2x8IvaRcb2iB0mp50+ezwBaBAf4sQ8pHS+D6M2F6hC9u55meneM+AheFqRV9Blc17cIRd/hwl0HmgEYHvs1P+aqU55vK0cvnaqAk7tramkKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdeP9z59; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
	b=IdeP9z59Mn3OgGRoZbhieLj2FnqngFyTrM/WD/a4I8HRtu84LX2CmBkFsYeVwMp2aJZRmI
	+luLJMSBS7/4fC+29zTjGNBd7Km4ITjd8Nxu+ZII+98TOVtxCv1D+VcPNdvX3DCY9IUfkR
	Hqz6LfYcE2KJbsW+DgrHmRxoqHE1qhM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-1u9xVnleMLC_10QVzQGjsQ-1; Thu, 10 Jul 2025 13:43:21 -0400
X-MC-Unique: 1u9xVnleMLC_10QVzQGjsQ-1
X-Mimecast-MFC-AGG-ID: 1u9xVnleMLC_10QVzQGjsQ_1752169401
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f71b363so20699436d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 10:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169401; x=1752774201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
        b=oajgUwVn4BiWAI6q0z2xqaHnYWX6LV02IeHvEbb1NycXpmylhTM+lVdEACcrhERija
         M+WfUL4bnKmhCqP6Sj7wDT9ULVcdpfWvn/WqWSFOpmqG2JuuD4NvGrAGLbsubVzLttD5
         8leB1I0SCR+IZVPNvl9mShjEVDAdWzrrITWSGFNqvXCfBU9ZJGHljfV4Jti1lC6MtEVb
         QUVugNmAOpYvF8ckvso/GWVqJlq4w0LhSbrcot2rQoUJnx8e6qFpay9nNDW862gtxxO0
         2iuKpjCZEVS39WnU1+ZHa6uWiM6dg/lTWjgQhcy9V3GRBqnqI11pX55iYD3k5niaIEYW
         Q0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYhd28tODT+Vnussb1gspMl/qgE1TXdePqzGB8jclTVTZ0qXyGq57sH+e16JlTVUXiMRHv1hTXWjjkU1eW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2lfeyN7xOA4LQr67mfYXHyXMeVWuhNlt0zzR0bGH2k6kO8Fw
	JXCpR7do/JI+oYMT412FDIshzyFkHnmNFTtyidM54yLeUb/58hRv6qGDg8u1mQyxlJNSHbTzZGT
	k6taRFhQjIuqG8MsysNaqN6g8Q5dd34FfUM9EXD/6ijgRhL6RxN0VfMH73UcLPHetXbA=
X-Gm-Gg: ASbGnctAFdNr13GnFcXHHn/P2vxCX7Mtul8+BeQK8r6ECUCmv1vMHTlnOBOFBnCRSd+
	Pyh5fTQYiAfr/Q+/otNqP95K3pGY0lv+IUpQMJBmTmEDEgNnrpr5Hj3vnBBNOXLW8jxvx0shXNl
	7CdMgUflJvPbcYlV1zQS7Z+KYGCvrlT4i4BvBORX7Ufd0i4XO1dk3ZuaHtIazExaDMzA3RZIPmh
	RyMKU5LR95FZOTGN47875cpHg+Es+mHSqgqRgsV5M0il0DRTq936ToHN1OgSY0g12YpfbsXkBxh
	kYrRi4EqBx3iE55zNBr3YxNUZYzwKgmLJAIkFG8HMDQFltqiehlcWC9KbWhp
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464746d6.16.1752169400856;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneFeZHD+R2IlA/RJ8povEc4F9IjcKH8Fgp0p4dCYgtfr/rKSizrHDLTlvLp9E8FfSRTeZdQ==
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464046d6.16.1752169400264;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:02 -0400
Subject: [PATCH 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-1-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
 b=2cWi9RxWr4DG/uT+Adfe1rLsJLWqf/HsK4V1CHvsD1HqS0tzYLionTpIhnP/uRurPd7gfFmll
 2lm+LwJba1xA78TVoaKVn+hJWZX7dEn9fhckaPz4uGeZs+gsOpWRugK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.0


