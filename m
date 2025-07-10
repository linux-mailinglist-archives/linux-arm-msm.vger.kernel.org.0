Return-Path: <linux-arm-msm+bounces-64444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3FBB00A3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 19:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7209E64753B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C4B2F19AD;
	Thu, 10 Jul 2025 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8bvczu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C05279DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 17:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169408; cv=none; b=DOhlleu5ltRXx//tvKCM2zis+K5NmCbi0ctMt5gmkGm4BXm7KMaRoSWXsYLsaMNlFLgwyDGEKsa1yWq3p1QGrs5KWTEL6A5uk4yP6TJTJw1HWKGdudwmJOhLGiFWbsxgll2fENi4vNFN48ew0QZggg5G2St54yoANZfE00owz0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169408; c=relaxed/simple;
	bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sNcJPLQ+DL+xkgnoaBFY/0p+kpekojxhdLUy+wSeEqZMfLnOi3amJByyVBHiEc/P5qftyRDb5ANgEtR1v0uwDJBZddcClWbJVV5xJMEYbOx58VihnZ9hnvOmdrDxZH8V4lBBs88TJduSceo8T55XdZFSp4SDHteLdaTrS6X2ylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8bvczu7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
	b=P8bvczu7pfaLqeHwdII1Seo4HNcCHsD6JR18CdMR2zlf/uCtDBjnpgRHvKsHCq3yzDfQOr
	Gwydx6C4YI/uZP8HM36D46YukvH/jy1m1tbkiEDA8ntyylgY7eF9p91o4VOSABlOfDW0nR
	1qFuvpuA4+VCRHBP33L3C6mmRtBP7T0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-Hbfvi16BNF-X3QxpuYchAQ-1; Thu, 10 Jul 2025 13:43:25 -0400
X-MC-Unique: Hbfvi16BNF-X3QxpuYchAQ-1
X-Mimecast-MFC-AGG-ID: Hbfvi16BNF-X3QxpuYchAQ_1752169405
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faf265c3c5so19384946d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169404; x=1752774204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
        b=Kmyn+LhnE4mBlDStA8NwYNhcBviqAk62H/s3R+unMLKPVonTfiIc4ImSzrJYTAZ25X
         xclHJwGgTp5LXVgFsTFFRX7qX8y1DwHKSHvPUCEKoeDWZGVxeQ7u6NR2WBf7O45iCekD
         0Aa4h1+k8r2YOdJZZygyj0IKQhuqF5kOczsK7KvrzsEwlFcnML7ptR217Lp5pDUenL6h
         xU1atANfBp6YYFKNvHNw6wQ/99hQOrm+ubOu9zJ+N0tql1GC/+73qGKYM5k6CGl7aX0T
         ywDkIfOp2juLux0W9qC9gJKh4sqygr/ctM7uG2vaLyCJX22if0uqVmZD1U+nyC0cnQ1h
         ayqg==
X-Forwarded-Encrypted: i=1; AJvYcCV+b114OmGBIFjT8vZIHFNMWbSYxwg4FygM8oY/D2MjNgcOcgeLbNiChQ990FBxfu6qfHuLH406DuhNRvLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcGUGm/9uWfM00RuAWLdTRerK0q/aolL9y36C7hMWRAu/sRpg
	8bKAVBMER4qor4yWrS5y2/T3ijZZ4QwY1zr4BOIh3x1b/F40zEQiIX4GBU6tCHTKoEEgooOxFGQ
	4Y99NcatFGWgTfbP1xBi4vquvDz0NkIrMMcZiL3cMi101fgHAvpkujg1o5LGiF5nssAIHDlTKPN
	F/Tg==
X-Gm-Gg: ASbGncsUfb0LlaWV7gITD6u7AeyrqGak0JyLdwK1XLBK/syAp7E6CzPmhhJ+IzYgutL
	hROTC2A3BJL+Wuwtng7SG9iBgYSzPfTedGjNHtQTlKTG86nwmZFjkA5wxN3fmtrijUm3Wc8luKT
	HUVHYGA4/SgIReaStMJJBwiCHwhYa1IWngAeQpGMtjSzNuqJTBOwR3r+pbIf+VWdESIFG5M/2ke
	+es8pZbRnH9yuMt5f3Ap9reOu8HJR/LK24s1p0FMloCvc7qJAZ2025oanxrQJFJssTIxoQvDJjN
	eXI80Fx3KLI4OGjyd6bATjfToS1vecKMw3n6PeQGJ5PEdAuhCUgpXD8+1P/A
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644776d6.43.1752169403796;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFibFyJAqH2Tkc8cSfyuj43nonhKwPGrbHTb1n3BZYj/b4JFbj4juY9nmJvfEsNrJfVGljjaQ==
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644146d6.43.1752169403246;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:03 -0400
Subject: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1675;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
 b=dJ/qA0hGF/+fQfe0crsCUgeeRXp3uEEF5tBBbhlI5F6XFBRbvTidAvVYatP+DdWjLDW+J4Np0
 hf2I1m8Rc9fCuxnysHNHHy4FFC3Lx0PLz51pJGMCy+rQ/pwYO2VWCbI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.0


