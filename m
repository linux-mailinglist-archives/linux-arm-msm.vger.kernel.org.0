Return-Path: <linux-arm-msm+bounces-64446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E38B00A40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 19:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5FB11C47C18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544362F1FEA;
	Thu, 10 Jul 2025 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THsnD/UA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4FC2F1FDA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 17:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169414; cv=none; b=t/hwg4F3f755ZEnVFWu7q59SPtKcFBz+/SPtWrFZxe+sXfgFU8LW8rY/nP5V7XA/sttCV8cYQYnGZvVw+s2JnHQh7mywRAyIn//0VJPxywLDgGGBCaFSpkW32VHRkUxT1cvt7ds5QZlG56x6xPhhYDWmytlo35H4L7DWxaeLguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169414; c=relaxed/simple;
	bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBTaHSfeIhV0wxxRIIRTG91j5ePGQhxGGvpWOMIQ0vZpPLB08QAD++HMcx3rUJ1vo+HsE2n4voBG6J0wj7LSTVI49zI138FFD2vaeKsmjgwvkJBePBfo5SHgDZ5taMhQgLAjhyBo8XHMo7o8mRiYFdg3kgNTDyHkGODGVXofh28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THsnD/UA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
	b=THsnD/UA0hn3cdsOaaayeVsUI/I7PyBZoNLeexfE7Ix1/Ezhzc2P7lFc2zjkmxESmSf6tu
	AsYRJ30KYZKxYjzg/AcTYqrt/nvtIup50+S2gdA6i68A9hw6YAZSwK6BWEdMax69xuNkB8
	bTkykjp5jRN+RTZdyTAWSyQeZ2XzY68=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-AbuEh5rUPK-8PGuLhJrSuA-1; Thu, 10 Jul 2025 13:43:30 -0400
X-MC-Unique: AbuEh5rUPK-8PGuLhJrSuA-1
X-Mimecast-MFC-AGG-ID: AbuEh5rUPK-8PGuLhJrSuA_1752169410
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so409782685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169410; x=1752774210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
        b=BiXkzdbvEHu2JMwEY1dIZAW8pYAF+1eyyEwn4504+1YXVD9FrgsvyTJePd6J9PsM2Q
         m1r4A/UeJLpQARR8S1ec0lv8DHEk4Hs4ynxcV72qZaSkGClYzpgm6zcH2TFukhzU7c44
         IVSRJEXBp2G1Gyz531gdwVz4/40sfYpGUEcTs6IomLGOKWPSJV9B4dnUp+XDoExmdu8w
         Aj6d89+uleZETF9iY7wzsacFy9GvswZy+MESoD0uDuUilM9xBIF33o4rl7+pdPOaNi1Q
         /MJP/mNKepeGA0mnLTdDgLHoUpBuOFY28rno5carYbNsAbVJSRxWJP/1MUczIUsBHWYP
         tn0A==
X-Forwarded-Encrypted: i=1; AJvYcCX5eUI1K8cKQEuE+Q3UGFa0t0k+NqB17gc52CDbkGv6ToEnBIhx2oIODWs9mi7KF50R1vLG1HBOvhUrkUQh@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJQu36AFq/f5PfWl5c2Ax5JANVZe9R8vMA4D3JZ2RGlyTvbXA
	PM4JUQX6x5wlybzReBARvd1Nh9yvMkS+NpetbauHcpE226ZKV+BD9kxCXAlEYIXogoVD29DhCpP
	AgIaxlTHIVQuXYdVfBOuFI1qFWFtd/xK9dLbvZJ8SIp8UQKlHi8wSnjhMrYQjlc4mRYA=
X-Gm-Gg: ASbGncuYq0d3qstn+BEQUzlkAzbnI0nvWZviCxvVdn3cmm6R+6PJ5/fDxKxS2Q391PG
	f2bg7J4Q9tnylKicw5DsLsTJswWdfr0ARf5/Hjdq/eqywUYNN67ApDed2QoB+r2IO1SPLSQaEKP
	7jUPMTn7J5LczwaPKbQhF/isX70EJXMVptuBLLL+cBV0UzrkB+rWJZMTPpNMi4M83RRee8SJIYi
	evCmNkp3I2vRzP59MknQDkQId1OVBFkreNQyhknzogn53eLvnM/7Xla410E0lFHT6Ri9v8OG7hF
	BRmpaDqwNDB9hDOjdZlmocenz+FLyAJvTqH67+PIsVaz2i5VO0O15vfWcCz6
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646710485a.9.1752169409714;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGRA59X5211+zA6+bTuLexmbhranU9s00ouhgxHCHsr1K/Q7uZzJEn/YRVuxvQ5eKEuxqlg==
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646704785a.9.1752169409169;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:05 -0400
Subject: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1532;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
 b=xNXPieWXOwE6YijWTJ3taaQPCPf8/+I1K7+s2EiMedGqecECqqLSQTFSwjhrnG/onGaKSV32p
 isG7Au5aNEyCqmbZJtcC9vC7jvxXBrzxoAluzBC1poKDa0ziZwvE41x
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

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
2.50.0


