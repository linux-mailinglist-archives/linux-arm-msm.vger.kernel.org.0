Return-Path: <linux-arm-msm+bounces-60813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0AFAD3A8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D58A316CF5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856392D3218;
	Tue, 10 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viBVZIfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371A2BD016
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564392; cv=none; b=gsc6k+c4XgsU3AgaH4OCRVvY7kDYweRQeoitpagZZnLs+FNopPx9wHd3YxShVBTIC+ph3lMk/uSYuCoyaZ1Tqkf0EeNZYfc8T8JlEWOOjny7FhpCGI//Ew9IASp6797eBhYAXSmp2dAoOWTDvlVs7tdNYfemNh7iD398LiBzguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564392; c=relaxed/simple;
	bh=r3bCNGwO02nDr7rPnLE+84z6dEiHu1cfrjHc5wvaEJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phfNRVArjQU2fJpiWPeVSmr/x6UNQhYFPpAqInORB37kmN1z40lQr2JofweJNH5IKHXF7uh+J8rAFRr3fMjmrtpJsRTOkzi3uiT0gyd3wZWytxlsqUI1q2s7OYIH2i+xUWmjPFmBwXiUo3Oe/W+3lyBE6nmFdof7m5PvpsqzEdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viBVZIfd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso5767145e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564389; x=1750169189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqJFAhZImmJLT6F/iwuPqcVqD25Q3l0Dm4UgxTgH1KM=;
        b=viBVZIfdyhKoS6jTqwrHgf1HJgIwk0eYch6n/eGUtVuMfz5wtFuHu+HErWwjeqdohI
         cp/FY/5IXZZ89gfiO1kqUWNIJkWc9U18kQTTENl375jqHJt8NxmaMI7TWR4R6FKS9zQG
         G2//NU08KH1JTdpTkuSLBMFoUFpFc2KRKWT92bnohU8Y8I1Zna/AxAPwMc8WvV+JWWPX
         Z6HAyz/vwfk6fPvVhDyJRH6KrwuJWidw+IoRhysmhx/Zz/9i0enJin74vbk7IrPLHqxA
         zFOt3LQbCf6VSi7gG1BK5rYAkt01ciN3zcn6WxA/RHezo5CcQzGkUH65/oPcAqMaVsTb
         K3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564389; x=1750169189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqJFAhZImmJLT6F/iwuPqcVqD25Q3l0Dm4UgxTgH1KM=;
        b=L6+uf3VyE2ZGe1hO7e+kxGB1SQXfdbbtYVgGTVXwL+quRO/nN0eitrxQsybfx9jdPb
         1k/x4tlda445LkkNw9ogvqPXIkMhYsuZdynq7bmwbYDW5kO3dGmtM2zEqxVP3MVkPWlx
         kcCOFu77jzhkDMKnQf/Zk9bEjUN1dL0ouJBI1GGvwCQfP2YnMjUDsMmyZAH++vQ7LHKd
         GLRAifZzFmMWLdhhOcxSsAkyNgyBgJ3bFLDXEeAZkxcQdH5p4ZporbN9l2fqM8BvQja5
         R/ueCEYvX5Ei+5i/JUNuXhooMY+jOrdrqVl0Tl7NjQEaQpK+T7bGpidyZF8d9funN5Ra
         OeLA==
X-Gm-Message-State: AOJu0YwNuIqTiuGD48nDVkfJAFdRAzAdLi5Iq6HovzO9Yg1N2uPt8eDh
	mScOsnTxbdqz6DnV5qaxgYdfhvMDSle3azwkAfy/BgpE3GzV2cyQnvPYKj2GmkhbVSg=
X-Gm-Gg: ASbGnctOKG5z2jnpTRykm9NIQOIr5owlpNJd/tgEy7rQqe8bt0wlF01bs1SqxChhy6I
	3Uz/Ma+RpM1T3qQPad448aj7nyJrPIb7U1opmx22/hpYleMMRcAPrLR8Y6flHFkGaGf4xhPmDF1
	SZRTih6w9ekoV1ue4taTx/19MqHydllBhpJc8PtPZ/ITZlrh73r3TuPOrItIV4Mr2yPDqrG3V5S
	9zv3aTZDv6D7GmrR14Gz1olIkJXM3wy3Jb2Ex4HZeaxGyf88+r/HRUjEnzrn8zK4JGJoXU/eLf+
	DTJDWGpOu8LjtGo2tjJTHJq2CwSrNPe2emQeT5A8M9THOEqGERNQ1t40wPdv0tXz31+tFVpvqnX
	U8h048g==
X-Google-Smtp-Source: AGHT+IEEJ6z8QUKh5XvglJLU8dvLQFphknatasXcUl6yo3VjJtNGAm6I6i0raNXrO7ZgnDH935MaDw==
X-Received: by 2002:a05:6000:1a8a:b0:3a5:28f9:7175 with SMTP id ffacd0b85a97d-3a533191acfmr4616866f8f.9.1749564388440;
        Tue, 10 Jun 2025 07:06:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:47 +0200
Subject: [PATCH v6 09/17] drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-9-ee633e3ddbff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r3bCNGwO02nDr7rPnLE+84z6dEiHu1cfrjHc5wvaEJQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvGQ72RTtMUU5JnIlCVSvh5DzJZTSCqtoC5f
 BLQ4MyBpFOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xgAKCRDBN2bmhouD
 1zxeEACV+ExG0wpSXh33T1H+6hfRwdZoJkMXq+pm3YaQ+LGLPYYRWRou/s/wAzV1Ggs39lpaqNM
 g3w0Wd/jyxS4Qqtf+ARoEO0NQPFXxXIkGyzlo1KZumESOxLJs479OAWcCPHQ2v0INNhusUyjabc
 tqD0WbEgdnUN7lRLhkfWzAJfH5J55eK2Vs4wZyrueipTtV0JUPIpyBfWNiNaNhUphYeARojUXbs
 75WxP2LwNe4I2/sipeFsBQ6xwd/Hdh1elSXhm5ieoHR0TeyfiYBfnE3LGm2xVyQVm6RpQTj0pik
 hdUKhb4D9e2WM7Y8s04KrtxaxsZk9+Po/K9UceFvpayNfVgZx24wSteHLP2lRGBrh/PQsS5vSth
 PVf4AmohlAJId1pDS2D8KILoF3H8zflnIttuPpXhgD8N5nFMi0gDh53QOXLGBS9GMXPwPvDBpxr
 lLiKK1f17/f8mJjgzIPz6nw6iZCrgFzmr6pdkSNtbvr30xMg0Ah770CXWzl8XMmiKDKxeEISXzF
 S818rKPfELfaJBSanJlOWXPzbPQ3IggHyOEr6dTAPXB86D+7C+LpQBDVH8Q7jxEplJgj0vPsCPL
 kVZTdwGGMJUx+LlhM6/yR8LO/rgULXFTspW6wtwnK/t+jAew9e/FPIvZuPoNbIfvJ3vYUTRCe5y
 ABTKmPoZbjI5mAQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver unconditionally saves current state on first init in
dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
divider registers.  The state is then restored during probe/enable via
msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
dsi_7nm_pll_restore_state().

Restoring calls dsi_pll_7nm_vco_set_rate() with
pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
VCO and messes with clock hierarchy, by setting frequency to 0 to clock
tree.  This makes anyway little sense - VCO rate was not saved, so
should not be restored.

If PLL was not configured configure it to minimum rate to avoid glitches
and configuring entire in clock hierarchy to 0 Hz.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 22f80e99a7a7514085ef80ced1cf78876bcc6ba3..c8b4a84b38340e0f907e0123299b493768454160 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -862,6 +862,12 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_phy_pll_save_state(phy);
+	/*
+	 * Store also proper vco_current_rate, because its value will be used in
+	 * dsi_7nm_pll_restore_state().
+	 */
+	if (!dsi_pll_7nm_vco_recalc_rate(&pll_7nm->clk_hw, VCO_REF_CLK_RATE))
+		pll_7nm->vco_current_rate = pll_7nm->phy->cfg->min_pll_rate;
 
 	return 0;
 }

-- 
2.45.2


