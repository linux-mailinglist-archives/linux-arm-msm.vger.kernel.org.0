Return-Path: <linux-arm-msm+bounces-48531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A774DA3C4ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613F716CF97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAA71FE46A;
	Wed, 19 Feb 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bqce8OIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4E1F417A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982227; cv=none; b=cSVZqdPDOgEADnQ7pnrOl/XCfn67G9aDVLZUkVKjVGefHPtb+D8fWuSztnCSZhzTspXSX6i4bSg+rdnF3AmKc3YP/rXvCHJTxufNEMiuFeUUX+PjvFyVKDVQb8q57d7ENUXO29OcQFSE4mueUCuzj0BtFkq7mEm07/Hu4uS1zQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982227; c=relaxed/simple;
	bh=HoJJKf2KbkS2X5DYSjb3aYDsagjrOYDoT6ljyujy3rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUIsqoLbkG8VTdbus/TyMAqZ4GrZLRMpTNeaSgVtXvlQP99o0EPX/NP9opEuR8u0LuSgiZUVUQFy9tl4YD0fL/n0iTRbTXNfMuiNQb8dzLlgX2ra71GW7ZWUMwbzW25ZdKd19AQt5cSUeAt9eepzTUXuL9WZs2S3ZHA/IH2eYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bqce8OIL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38c62ef85daso784737f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 08:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739982224; x=1740587024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flx79lLhyjNJ1uQQH7Feun8sDQLsABUenRP8+0wgvY4=;
        b=Bqce8OILCsI8PpzoDy81ejrnPJWbEoNqHqzCjUwno7EWC/AWHE4WuOMNPmd7p/tivB
         82wbgIBwOjA+F7o0RSHeAKBBLsZxM2V2S97UvRUrovjBek3zYWLW9Q7y7JlbvsUywaWc
         DaSTOodUfaPq2nRFk7kFmjSGIw24iiNzb6Vmn0zg3PWjiYi2n6C6HWLCUln298IqdIEB
         xVNWFX8MZvLRKaxJFE79TUbuc+X87bhnhbPPLCZNxIbY6NE7JYL7E4gah/XcYN3tZND9
         sZg7NQ0v+MjcI073kaxZw8mCpGqC8j3dMvWcXSJkYoICqW7LsY+qXzaSCIn4oWACzCH2
         Ak9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739982224; x=1740587024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flx79lLhyjNJ1uQQH7Feun8sDQLsABUenRP8+0wgvY4=;
        b=oNN8LbUHi8jKjRy10Mmu19FY1FPbmXHKDlIkYnNvRtMQP7a7P//zaEemnRaUhEqmck
         GCVt0JgGaQgutKW/tfydfDSehSiELBWDweEskPDWZBdTZUo5bsof6KZMXyJjIBHpd7Cg
         Kxq0FephYBi7K37145OTPMJrXI2n2kInAKHJzZKRHTbFbqQVDSb1kDdTKtwtiw523dW9
         /3EYjWYM5JQEWZZVP9PKAJ1eW8pZBZWv4rCnCWcEhvfGZohYP5I8W51V0UojkpnDELX2
         UlgJy5NGh488yz68kmdPPwDAewniyQB+6+KKUTIFmuOKDok4KoS95voBrttIHtwoX4Nl
         eV/g==
X-Gm-Message-State: AOJu0YyYCJlOXvbPjL9ldpCdH8ppIFANQYMVC3MUg8zQhbyS11LNckyb
	6f12sPQOvJXsYL/G0+Sm9q/YJzmS+rOPUUlNbn5HZGokfztseJa2VSmYfK24nu4=
X-Gm-Gg: ASbGncs1/k/hNTHGoQio7Nn19pr9xsE6LP6LC9L5npYLz9P3/fMfop7MmD9AYp6a3oy
	WyLEDfXZmrCxuOzDnnFRUrQouhgUhAPgHbQ4J7DQXHaR5DtL34/ci6lrcuQ+TI6dfbYaNdWUeku
	CfLTbbRQaCg/6TYrpBBfR/LzpijszWUghgrK+iw/UKUDDQyH3wpzbK6wFY8hzD6YFewqwuXIrQd
	hX/2K4ohmCmcs9Ql0+sebdKlvNoJ4A8aJtQ/vG5bC0+0zyOMQwvn3IicFdRoeRRhxGe2mCh/fvP
	bxGDKRjB/CRMbTdTgLYPMCJseI5EnUs=
X-Google-Smtp-Source: AGHT+IGKoVneTQvKJC5CNmJtYrFVOs50kNrFcO6oV1uqtn6asl3HDOg8xjQNibJEhGg4neAkUWVmNQ==
X-Received: by 2002:a5d:598f:0:b0:38f:20b5:2c80 with SMTP id ffacd0b85a97d-38f33f2cbcdmr6538286f8f.6.1739982223890;
        Wed, 19 Feb 2025 08:23:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fe5esm18442417f8f.99.2025.02.19.08.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:23:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 19 Feb 2025 17:23:32 +0100
Subject: [PATCH v5 1/2] drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update()
 when registering PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HoJJKf2KbkS2X5DYSjb3aYDsagjrOYDoT6ljyujy3rA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBntgWKtcucSVVrV+JpQB35XSs5L2SAmKtx22d+5
 q+mpsfbjMaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7YFigAKCRDBN2bmhouD
 16gmD/949j1pjmbpzNX0ZwnPqFTYiEuKoDTSR+KqMSaBI88QYFyOIlLcJTY5hCT+xCVAAhqfnk1
 vcUGlcvzGISUvAVQGIUiSo/Db8E4CYSgM6PhIvlT1MespJwLYvFxyCUC7qojzNhwhHP6qYJdmyH
 vBOtk52PjNUMQ+H6+fYw6CoTXDgsGw7vcAu1g8v588Aaw+3pb9mAZvsO8UJDhIeqctuqmUkAE23
 V/qy9NvSpcHgknXJo7QbukF9JJABXX66dlxU6MKQ0k9OZ5dhuBZVAF/Me/eS1cokF5OT9LxJDof
 gxNeclLnZzq7dhGNbmGv1EB46R8j6bvnP0a5e8S6RA9xgf+wVOed7VFpY6GZPLAAE7EHXsQ5A7j
 +9CJP65N2HHB1Fap3vJC1ffg/Fod1phdQfLGe4ug/5uej5kwZSIZMWxdqmF4HF4JbIwIhcj2aFa
 4IIwjbS0cmzT5REOARFcRszKjlKrjohPr/4rC56nNW5DnmqbaAox6jC3u+7z6at4VCy6FGGxbUv
 ObCQx3xVVW+JKR17q6Uiqfta4vKcL2UhfdX8HKWdDM2UKV5HXXRIOtPDGpfIp9H0qYgOMhcg5mC
 rN6jplRFeSTYwqenJUHWzaL5i+zSoVdcHVXD9ZhMY9gDbj4l5ukslomn2zApoGQmRl5sLyfZrhO
 KZ3TrCcPn8mxoAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Newly added dsi_pll_cmn_clk_cfg1_update() wrapper protects concurrent
updates to PHY_CMN_CLK_CFG1 register between driver and Common Clock
Framework.  pll_7nm_register() still used in one place previous
readl+writel, which can be simplified with this new wrapper.

This is purely for readability and simplification and should have no
functional impact, because the code touched here is before clock is
registered via CCF, so there is no concurrency issue.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 8 +++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 798168180c1ab6c96ec2384f854302720cb27932..2fca469b10b33ac2350de5ab8a606704e84800ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -736,11 +736,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	 * don't register a pclk_mux clock and just use post_out_div instead
 	 */
 	if (pll_7nm->phy->cphy_mode) {
-		u32 data;
-
-		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-
+		dsi_pll_cmn_clk_cfg1_update(pll_7nm,
+					    DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+					    DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3));
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
 		snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_7nm->phy->id);
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index 35f7f40e405b7dd9687725eae754522a7136725e..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -17,6 +17,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
 		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
+		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0


