Return-Path: <linux-arm-msm+bounces-68336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE947B206A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDE5C18C0CBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A8C289374;
	Mon, 11 Aug 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RE9dbemV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600B6288C19
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909803; cv=none; b=EAHqbwBl6zFzuVNbgQ/KDJ99bRNMaR7EOogocXPGbofd4x7Q20IzanVJ7zs1dB0taCumI6ZTuN4LyQTjctl0bhpPVT33tLDF+s6xsRxPCjLj4xdGoObOG/+CnGwOpzALUroL0KuX9z3vQBYfmf9h7EnEjYRRQVb+F4b02VZpVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909803; c=relaxed/simple;
	bh=W4oHtDUPRGuCLmVSKKz7teYp4yrHno03QAMcLtqmgJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCjJE6ndxuPaIefP3DnkbeYfeN1t4DCVYKw/YC4BJw9zHFwzfYnWCjes7DYgkEqqB/PdiqaT47PxzQA3Z0uHCk+LKWkdrKJvSN4kckmxp4S6lFMnVk/87FibSaaxtPWjPfJKaYRn0m1sGBsh8wws8Cckl1fpvhhkxzGAw9JUM28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RE9dbemV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=;
	b=RE9dbemVTecLIMxvYbG/9k6zYHAa5I3iPvs36YZpyr4pppl8fBfgX5GV1yJ2JDka9GBPS2
	kGWXnxvSuVLyYCySsoGCP0OHz6EfafRiyuOxsRpyRpi42/23DjElav6djwyeleVzxD7zq8
	5vnHFi8OV4AEBbwmt5Q7i44gPE2md8M=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-GJdvNoU3PayaQ-_qnPDIMg-1; Mon, 11 Aug 2025 06:56:39 -0400
X-MC-Unique: GJdvNoU3PayaQ-_qnPDIMg-1
X-Mimecast-MFC-AGG-ID: GJdvNoU3PayaQ-_qnPDIMg_1754909799
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b068c25f04so102892651cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909799; x=1755514599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=;
        b=EShBKecVYdPjFYyxG7JFZu46655TpISL901IuzX8CfYGlOCmf/AO7Z0VkoweJ9r0Yf
         eI7+yNuW6p4XwI6LGjelWXlxGfFnHxoTITDrzATEpZqG3NR40qEtpyXt6gcdQYWB4nYd
         pkGSWyw7CBIIz/CyCmNMjRDQChF6tAfrGpRwYUDpXajuGRJf3YtmftoXX8IQ3+11gGod
         ZXwmZ6PPYW58WLZVRI8pDKe0Jm/BssD0PXqA4ybFyzqIrEAvfx2MgvuAtB//Ypr6wSds
         5mlqpJe3xUH2PGyHtNSNjtCiMyz1oivtBKqXj3DdT31EbcDI4HH3Nt6+2hT0kG8KOJt3
         H8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF4kkKj9j58rYOv/LVb3y0HnCPMZlRkkbSgm/g/+hSgq+H/RUsTAmFdZI+XsiUSWuiZiQbXfdcZpWAWFbA@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFhmvcVbH9/kSSbqVJsTgNeP306odow+PKbkSLmp7BXorr0xO
	1DfR4d4mCvyWhvU8EU1JOucQiU37yjWQTjRnaZrbnECzZ5uNeeo2e6Dn+DG5NYu/VOUHx9nS2/E
	f/TiKbNgx+v9KRkE/v8wFzeq7DqPiI1k1qWSC1Uqjl5Kj3RNWZnteGq9aDgz8M5PJ+n0=
X-Gm-Gg: ASbGncukaTxGIe9EvWXoWkvvRZ9muhoBXXw65uyocJyDDJK187CJQDKWMU56clWHlVd
	yNffl3PAvdgAMKdL72UUb2bleABrRsbAfng1+ala4wjZ2m4lMR6gMAh9RopmnrwnUOZUhy9augW
	elvCtIbuyCe3gM0DrlqRyjmjGazFGj5SOvCWLw7bjFEyeBJuuihg/YNCt/ZAVbNO3/yG9hWnHQL
	MX4xkwffiKqc1jw2B5Tsd+/u7Bh+4J/u7iB0ya2Lk8ICfW8MqELIhxVFnZanjUWbuZ8kwuDp1mf
	GQzjFs6xTJMQlohkGntH6VZubwxhGGBjw6chpybU+z7HovwNzm0PNx1wfmQR1TkW+u+HMWdJgDW
	bVa0=
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr247966491cf.3.1754909798764;
        Mon, 11 Aug 2025 03:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETXQEWlFC7Wcyu/io2faEikISODgBHD0p2mDq0e7vALuwZuamzM4hp/NBzXMpTjJQ+LZFp/g==
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr247966191cf.3.1754909798373;
        Mon, 11 Aug 2025 03:56:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:08 -0400
Subject: [PATCH v2 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-4-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1657;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=W4oHtDUPRGuCLmVSKKz7teYp4yrHno03QAMcLtqmgJ4=;
 b=zHi78rLvdAYaZdTIMhwgqH/js0hiXWDnYr4X0BvUbuN6hprJjEDc2ZwgX+szZViPz4W8X1kk2
 ngDBdMEkWVsAVo6sQ7hWvsQkjGQtaqeiQEeV2wywPAakq8QLF6bboSJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.1


