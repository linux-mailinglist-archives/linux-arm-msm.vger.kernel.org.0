Return-Path: <linux-arm-msm+bounces-48211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C941A38278
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D9F3B637B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A408E21ADB4;
	Mon, 17 Feb 2025 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGxM+bG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931AC21A456
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793212; cv=none; b=Iyu6doLHRX68sZpOVp1oIewixY3ZXdFqwdQMANNH1FUrgI3S00hoR1DlAMiUhRWwxtyE1Cd06G2UqtCXoQkYSfB6p3wr/nM65c3ZFM732bxRujw8mdOTAlDmd5opfq/UZeTEmgiRsZb8XURA/N+cVzyAXfP0rVNkZKGQeazxTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793212; c=relaxed/simple;
	bh=cMgwWGUQiMQhE6DDyTTBwdxL692z4kYW1HPAGgpjM8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3Ou47NwwLiM8WTMtZ8CpO/S5RnG4FTHsx6/5ogqFnmnIsPyUsmSFrY5wcTgmQ/KkNgHAMyo8+Zw92JRPcPOHvymBaIbU65jDkmbgRhirtV+7ABmVPOhfXuquFffGFD0B/tywja0EMqjeWxZh8Ye4BwZWDQ0zpKa/7zJziNFQiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGxM+bG7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-439702d77f6so642445e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 03:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739793209; x=1740398009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjG3Ku4LdCaIMwepghOAchlIqKd0EIigG675oG9WLrc=;
        b=nGxM+bG73ckge5HUeZ/P6FoF6Dem0rUcsIzWbyKfzfsAy77aTupxkUOceZ0bBwANlN
         YsoZqhMc5C2vasHEYMnLyUDuWo17J+wLK7XnS3LbdQuxs1jakxkN+Hb0j6Ayv0+fyhTE
         tQLf9OUgjaisYirlglsF/fvT8mQHGNumSV6o7Z9i/DjLex7AGEXhj/s+tPTZGiT6tA/N
         hHUi21Ej5annHVdgbo4WA+hJp5ysYGqi3hocgCyMlSoU8KYGsvhOqwAGzroFkoIgUi84
         kFca+g3s2CgcIDOgne+bypJn3fKfOoFM9sfl6Ai2XFTyNWuBbNZhMHWcQabyPi9qgwRC
         ydFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793209; x=1740398009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjG3Ku4LdCaIMwepghOAchlIqKd0EIigG675oG9WLrc=;
        b=lo7rrlHSEhwU9D0uWN615KTBF9OQ2ZCFgYg7lu9cvljSsAK5p61HvX3nummGTMZojj
         EcM7z6gDvi5LTi3kRnX5mXgnmcq46+ala5IlWckVhnvMZiDLKvbg36qpyaWkyL7+UDRF
         C0mBbtobavD0yM1DwiDpNsV0k8VxgoIDgA3qvWHGRIovY4cOD+WdJiQV/h7Rp/0tnryX
         YSgv5uUESqncd3Wn4vv1nzwb4GEyCLEtwrT70Q6iK9chK3mB8TYUoUc2+GwcZn/c+dQ3
         YDn7hyKrWif7cfoa3gKIhmRwx9oijjvSNjPWxuxd/RkBHsdYZPa4RTVqonx8oF0WbMRr
         8s5A==
X-Gm-Message-State: AOJu0Yz9+jHXt53ViyntM6pgFEvrhKLeFWe7TgtuGxINCnLokkCIhXpp
	lhRy+SxBdGxeBc4Ib9mBZsyknPTv8Wna4nHveaM9ja5wexJgSKgiII07Ng6uHIA=
X-Gm-Gg: ASbGncvQELSInq/x6zp1TlYcsFnrXampyKRW+qf272dLGcF13wKHNRk2x0Vnf21Zyal
	KoQ1mFn0C9QxcVUMhfHCeWevZVGLXCuIpS5/kIRwTheWYjrnzDfo13UCBbQYMg2ebaTv/uKkbmo
	7dlO52uoQEga8dxYTO6iACMlwu66piSBSbY0XebSzDBtebsZAHjQ/MyytuwEp7hoigM2P3XCFSI
	xqwBGC6Ujh9w1BYgD/QLGKuwxWymrs0n4VfgROb7eEq1trRc9Tq/8tuPWDi/rIX/T6S0nnjv4Ky
	pD42c9xmb1/4R99M7qk7OARKLiJRRE4=
X-Google-Smtp-Source: AGHT+IGCd23PgjMv6+NwPn2SnlycPmlxTO7A7R1Yt8hyOG8pqhgRXI6SsHsJrv0uj9+65L4ln5dvmA==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-4398c806c54mr3587435e9.4.1739793208873;
        Mon, 17 Feb 2025 03:53:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:53:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:16 +0100
Subject: [PATCH v4 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-3-106b0d1df51e@linaro.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cMgwWGUQiMQhE6DDyTTBwdxL692z4kYW1HPAGgpjM8I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMwmW8N/wWnJUe63RdHqlkXLabaoe3us7+9F
 W18wvNn3WiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjMAAKCRDBN2bmhouD
 11VZD/9TfKW1EzYYS82ibwofKiQ/x2ymfpqm54bQmJkcevXw1P8/nnlYtgGxgMlrkpHePMQ8nur
 gSOaafs1WOQHkXEy1r7cyhg7SZoZfN2+le13cheLS9XvhGH4CiYyDQSemvoFK40j36DKOIw8AwZ
 vzK8kYynKIrSWUae6CAFNZYC0BQCo7gZSwC69En9lD393lR9ebR0DeMMjpXkS9FFigA8AvjF9TN
 6DdhNHQ8B8C9ronXrt5RsxHsiP3hp8h6tfkUCUAKWZaVHU6q4exvLoBir9jc+wUW+6OlWFO11wX
 UDH7mopLEK9gkZ+iih8TGSQ+/XMHNbViO7/NX7GvGPVr/sWhTLLUWTMss+zfd3qdZ70M2T9UGFG
 FkNva0yKB0aOXAr6ixhvXCcMKMBdcriy5eC5LkwFmv8fYnNORxJt+lF1QqT+APbH1KIo6EJH1R9
 seTfXKJkEORbvLPzXsvqzT2xT1OWXn1ldNVfW+M2uuKXSNsIyhIwa17OlfmRG2SL1VD4WRXRjpM
 SzOu2EZ79y1qP2wYcRecljM8FoLdqyKYHtltrE34l7T/lsqXSJOPTR/k4vdD34iDAiQ8h9iCS2W
 L3fyHIjhEO0b21XrDXXHE+2woTggARx2to0P7OMTPNzp4RL4CqMMYuCTvNOPzQqiqMNu+UijqIA
 sDvEMK9O5ulFqmw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Define bitfields (move here parts from patch #4)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 4 ++--
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 388017db45d802c4ef1299296f932c4182512aae..798168180c1ab6c96ec2384f854302720cb27932 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -617,7 +617,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -636,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
+				    DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL(data));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index cfaf78c028b1325682889a5c2d8fffd0268122cf..35f7f40e405b7dd9687725eae754522a7136725e 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -16,6 +16,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00014" name="CLK_CFG1">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
+		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0


