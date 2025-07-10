Return-Path: <linux-arm-msm+bounces-64436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF2B008BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22DD27BD671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7FF2F272E;
	Thu, 10 Jul 2025 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhDKX7de"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7972F236B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164890; cv=none; b=icfU3/tC9tewiTLQJtRfajkhMq3dz03Gwko34MemNf7eyoW3K+p1SZS8Ij17lCgLQxFWPMtfoW3d2vFMn/WZbkmRn5zvJPWQAeRQQb5i1eym9wA1C62wpZrygUIlhFgIHXmLwrhQijwyKQNBIZV7mUunDfrP0NExZd6HqeoLrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164890; c=relaxed/simple;
	bh=BdI4rced+HRKEB2cmVryNQG/zmpG45m97LWG2DtYv+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCsTCZ5II51nQE+TU/ToOXo4yQ87+1m0EdjqHDUnUzyd/ub2kzKxsCHY7dSwm3L+2NL6ik/3AJuk9QEhE1LwpA9msXDw0aOD4h/mxnFoAbdkLc2N9wKr0RhH32AtPNY5GODwfbXuiD81uVLB3U3x73KIALwk+9BIdUmeMxluu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhDKX7de; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
	b=BhDKX7debLqVpjxzuxVkM1qotKIRsZAow12g1BAXnAJKeQF27jjuOMLk57dIAOuanEkltY
	dOXNBA3zI1qFMPJsDoD9/9vfHljRZWjwY4IvbGvoSufpeapF+SONuQhNOM5XC1Mdp2NAs2
	U+wyuuYR4X88OGOCsnnD7RuA3VRsq/s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-6qoRFGIsNi6whYM8khYRjA-1; Thu, 10 Jul 2025 12:28:07 -0400
X-MC-Unique: 6qoRFGIsNi6whYM8khYRjA-1
X-Mimecast-MFC-AGG-ID: 6qoRFGIsNi6whYM8khYRjA_1752164886
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7da0850c9e5so198683785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164886; x=1752769686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
        b=kHbhenQTKft87IZQSkCnQGI+tWiDBEKlcBolyGzYXl+oFEaPejqnqdoOBBHQ4Zapyw
         tpbtWuwzBWfKzmYlSMVuGXD//M7CnZbSf0Gzy8We9tSJsD0KN2feelhBRKEzyKSE5Ks9
         VeoSf4iMirFLHDCuuUU3VgW5hjwbS97T35dedjmdOPrdfCAcU1qDjmhT9P/lUhdu/Hq3
         JUkBp7dBGdRkrXKvCbmOOfO2hlUYxSalQSqFd0tD8PyHi+1FWIaenh9ZQWobgUaxxYJg
         mICwBlHCP2Yck8fW3/2FQmj826IwAI31H+FQycgC6VED1L8GAVUmoh0hJEb9fm+stfSQ
         CPUw==
X-Forwarded-Encrypted: i=1; AJvYcCWdqThhdOmOLZzzCaF5EvDseRrmfYkL7P2rW7T+ave2qukg1o8baPVq7jNiHM+vHx82wL4GwMPgv8DZudZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmnDPIzfFGV6Y0TXPFCec/sy8j6UaYfvnXffEW5QkUszCT0RV
	qruRhlD7nAcOomkp/eWeyzJgM8JGfi2j8NS96W8a3xvubgJiwVf4uKCXAKzDpIdYTaa0Zr+Yf4w
	1E2iE4HjmFhGPQHsdyZH5nyQih1ayE3msUoB0/lPOs9CbewI9zUSieoex2UwwLU/2LdA=
X-Gm-Gg: ASbGncv+CcaN+OfF8MjRkGz13hc6NharScjcV4fRA+jYl13mHShsUVd7yzNYxNeO9wL
	GsXJWOSsAOuyOexOvPtsqvQWYvlE/0J0pe9SuqYMG/QyrDznAagLiP1gFPT1htA1tJphZJ3/R0x
	Jv2pim7VW3iwFinw9qniTsgp5BOcXduw71gbaprXh4UD5CROG7A0jlkXqMgR7lFwwypiNIb/SoU
	Dpui9Be39A712gWRBwMJZk0+G/Maa4iP2nc08Wq4YVELa3jduNR78uIajF1Fg8ZLr+HklMSjwuK
	dM3wqdaA0ehG26gENC4I8wg9sBVakxiqC6uUpn/JPqjDJ3Rc6ASqubF89+N7
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7dde99531bcmr30412385a.8.1752164885033;
        Thu, 10 Jul 2025 09:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELaboKc3+hjD+wF+4ZlA27Ur9xvHDNgGpesankgXOM9I1Jmb0Ok1BCSCTBE3suBwc7QsxRkg==
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7dde99531bcmr30403485a.8.1752164884325;
        Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:33 -0400
Subject: [PATCH 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-7-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1782;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=BdI4rced+HRKEB2cmVryNQG/zmpG45m97LWG2DtYv+I=;
 b=TGLhjj+IbzrNkeyKAWH/BPgTzIXuHRUMwL4erGFA0ZAfeBxyeP21kE2dmaW8XV4SrlkFC/vcy
 qZPJbO/GVg3D/lDY67azp4PfWKp8qH7F1AEDRFbNeKNdzHsxXleu+Nf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..7d6381553eb8cb5b18b898a734d928d34f98ebb0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,15 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	if (req->rate < HDMI_PCLK_MIN_FREQ)
+		req->rate = HDMI_PCLK_MIN_FREQ;
+	else if (req->rate > HDMI_PCLK_MAX_FREQ)
+		req->rate = HDMI_PCLK_MAX_FREQ;
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +687,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.0


