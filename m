Return-Path: <linux-arm-msm+bounces-60810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFF4AD3A7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2C21786D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF31D2C17B4;
	Tue, 10 Jun 2025 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2KtoO9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025692C1788
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564385; cv=none; b=A4FC157s/sFAY/6hmIn4EjLokVDdmmNWcjQU2QRhDtbZFkYUtu0xqf/ZfvtnfsUFiLTYvLv/U/kpd6LcaXmKGXnY/te5GqZVkEY3EUwmh8YoTuxzRtU7Ff6TdzdvORF7GMZ9Xgnn7UrWCLqD2nv3xe3ZL7iZQw/xxJHHfE57dyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564385; c=relaxed/simple;
	bh=hOZPlM1KyWeQGK+fAet9Nxs5Wt17jNDUM1Ff6e36WS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwiTXSR3rikxBMP3l4jBpyR1y8TwzTX+F0IkqtuW3vLOzFZUjci+GzOi77HCIrRsMiowYZZH5maZvH61oxwUFtVDOWhmLIi3XS5OYVNcBU+Pfql9P99Ze4lNTFjTVFe8GHNckaUNkh6qPTfYSS29LEMdbD6bf+ZdjWbnOU7TnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2KtoO9t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-44ff4081975so1375345e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564382; x=1750169182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c08nNQiRjpMuZiP/f1jVDn68latr5bwhdLQgcHIbV2Q=;
        b=M2KtoO9t0tnmiOKPKbKIwiL/wOTAYzLD7/5ictVkbGj6PVVqXgD0bkb3QQPBbtGj5a
         fkzN/UWJJjE+C5/MDdrBkWSaRJw094HFiayM/Sy9M5Q5l3PQqnyjMx/AYBlqig3TVThG
         2X+Am8JaOYtpxW/gG3TsgemAaVI/n/raMgQv7YdQoLKdT0S1NelesWZOBe9dcVt9LFSh
         Vg4m4qNnTfGpI6uZuJrA1W6pCmVcZj7/Gt++uvdXBtZrSnjpsbc0GgZvbFOxqmL/GWAB
         qbHnw1BaIsCoHHWkafHeVlPEZtQH8gSG+QVWgnD/isp9ZKxbmJExEca2xGsIemAT3n69
         GcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564382; x=1750169182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c08nNQiRjpMuZiP/f1jVDn68latr5bwhdLQgcHIbV2Q=;
        b=MaVIkimymZmif1/tAb8KTq+MnnUIqS3oVZagBEQ6Iw5/CUG3fjsVzqTgZ7bTYV7qbS
         jozC21NyTE5iOoka8Lma/7t4C+qga4MpC2RGE6Zdd0M2xurb/jgSh8Ceeu51t/QD1yqD
         2VljF9oeasKpNBrrxa+VHAxawQdo/EXNCe3Kz3B0/Mj+BCA27wtD3ELH0/fKYwHwSTiF
         FNR8g72u6aDGhnDDBqM/q236m+dQ+5Mq6RaOrbOYYzMHweKwypM9lS0xxSwWfMb1GWVu
         sWj22mevY+1fYTtQlYYmggjRPzXLsE1/fDcPzgVt4ipboTAg1w4ATRkrsy9HPyfKJ9es
         bcjQ==
X-Gm-Message-State: AOJu0YwuwCEsskHwTR3SF58ufv1XT3u0KaFaEHRJUhpZNvlwH+vekWya
	U7DbAHxfSx11YvLTlhzgral4UmfZNa6DlMsShH4x79r1TBJXSJvxTOUEl0oVggeEroBVZgs9pcw
	ioMaV/bI=
X-Gm-Gg: ASbGnctBP/KEWQrfNkMChZ7BlwibdHVPrzPdnPkJ1HFgWp3sGjtPZvtpPsF4u1vssxV
	2AYUlMNQn2nMm+D0FCdg2cSsDU9erq5y7fuPUSDb2ghSju0XUczSjJHaZ7U40g3nkB9APYMlTy3
	14dy/WV7of8taT+pYg9iEln9vCPAatf4wICXWEIe5UztFqUthaVJ5/7pBfoHph6dbYRU38iXOA7
	CWCfDNGyi7nDQZpuAQESeLtZLcVzBDfgTJ3uhz+s9HyzXj/GhrOZKemagaHN8h+dGnLP9eo82M9
	s2z5wpM7kLpNdKy54qGSKX1O/zlVYt/jtdKJ2G6YBuHexIa64t1MhkG+OWNaefaxJAIaLrD5xMT
	Jc/D17A==
X-Google-Smtp-Source: AGHT+IHDxukPheSrxBOvxKpZYaa8h9T+95Gg5jKYThUcUHQbgCqlc/EbIO/Sp6kjBnRf7HNWZ6eJEQ==
X-Received: by 2002:a05:600c:c04b:20b0:441:c5ee:cdb4 with SMTP id 5b1f17b1804b1-452a470122cmr33063215e9.4.1749564381956;
        Tue, 10 Jun 2025 07:06:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:44 +0200
Subject: [PATCH v6 06/17] drm/msm/dsi/phy: Toggle back buffer resync after
 preparing PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-6-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hOZPlM1KyWeQGK+fAet9Nxs5Wt17jNDUM1Ff6e36WS0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvEFaGVfcvc7I+WsKnLa00SN5QPTkSzfiWGJ
 PahrGboSN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xAAKCRDBN2bmhouD
 1/FCD/996DPQkeSTgHdKYXZwdFyt3uizbqcoRQhLkEEg860tSjn7Kte3DUkvlR7EWtxQc1vwNij
 h6zflWghpo2l50dYyFTsw/N7CR6NRHryv3B7+nv+2r33l7WcaoFYkGM4FsAkCJKMPl6bGpRNQvA
 9jYFY0BIHeuFg8AXYSEvLhDdZ8R+Zdx37F7ax1PugZeMApDCjDLkq9ba2ok7D7AoApGrHVyuZce
 kRFTFCEytra1l3KwEc4Mn+XdmielljNWWsKSC6JX9ReyWvrwewEpGU7twwfCxB7LwVqmnbhzP/Y
 OpmQ2JKetVRFnfrvaNuaTttsyTjub1lLnKUP5t23B8qKg2BrTwdsdVbvD8j6L0ykRwn9BMAaOAu
 z9dNv2P7/vnLpPNE1JmD8TbtHsmK15kV34zypREhkFVycSF8QAeMOA1Mr2SY5MXginxjTNRkS3H
 DHBBUWus08o+ao5tXURP0ryJuFyaWOJ+omsvAmjClWK2RIWoZLvhOAoPHumWwrZ7c/FLW3Fm3XN
 7CIJpoOxTfq/cRbfsadOyaALh7+jFh5l6qhA5aFXQionaHY2c+4Nxh680d/6/sTx/hEyXCmoXD6
 wl5tCEHIljBGjnYYUs2fMNCaFMtpUQeNbctmXaAWguGng2Fehbc2OAm4mwDti2rpffedGvjZJix
 lW03btC9avV5Gvg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

According to Hardware Programming Guide for DSI PHY, the retime buffer
resync should be done after PLL clock users (byte_clk and intf_byte_clk)
are enabled.  Downstream also does it as part of configuring the PLL.

Driver was only turning off the resync FIFO buffer, but never bringing it
on again.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6:
1. Fix typo in commit msg

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c19890358b7479c85c793aa7470904127c2d0206..f0ff6c9fbc2e6d28c96c08114c0f417708d70b10 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -467,6 +467,10 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	if (pll_7nm->slave)
 		dsi_pll_enable_global_clk(pll_7nm->slave);
 
+	writel(0x1, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+	if (pll_7nm->slave)
+		writel(0x1, pll_7nm->slave->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+
 error:
 	return rc;
 }

-- 
2.45.2


