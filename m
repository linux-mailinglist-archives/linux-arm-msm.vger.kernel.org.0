Return-Path: <linux-arm-msm+bounces-46603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF74A23F65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC35916978E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 15:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAD91E7C3F;
	Fri, 31 Jan 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2sXtMx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E771E7C3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335807; cv=none; b=RD6m9GYxWnijvONd94roowPLz4Lv1LJUjdXquv6GOZNSW2/SaFoO1pKpRwrb1KSs5Xphndhyy/eR/aW+SHJjoP5JGdmnzSVAAzapX/Mn6AzzV8Js2PfgttFkjw9zoPX9oQvG82xEzLCsGewxJe427nnPFT7v9qg/0YCs7vEOtZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335807; c=relaxed/simple;
	bh=1sAXbb7jAADLo71PpFTSGgQtXDD+l/u76NbI+0/GtkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juBRxr9x/wXuoD+oKuK6ildLQ9aBkVsvpbszvijDMuwUp9gI8uOUzWoa0OLg6ybCXFwJo8OZoAX97lmioVoqhq0N1JLZV/gcLySAPTLS7oYZOBsdHsazunJxz2KqMR519D2lkgHL6poVnTdiFAThhVX3YZB30kiZ2zbcIN4nzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U2sXtMx0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43616bf3358so2907845e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 07:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738335804; x=1738940604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m17uzmB00GT6kEfgwcoMSj/iyd95VX3uS9lZYb28L7c=;
        b=U2sXtMx0Y2Tyrn7V+9GXzRdB5jYjyygT3ZHlk1a5gZmkcDA51SNyuPb1ah/rEZpeTb
         H0RhDouABgw2TkW77NTK62t9qSOXRYUsThlG76yH0ByS6un1G2YNjQMRi4XQoJtd7Fxx
         LeRs747DJ8h/MeFxFkJBxz4brWxRaYhWlLwxdmMWjvIVHXY+VDZH/BPy1JyKql7er9q+
         +UnyAiUvcgn5aU8IqgiwWL17OSdmVESZhv7oka37iRhO9PdrtOlmkclZbrTD/Fx+TnWt
         /DnYVL3aYh+FlquQwJHSmCj2xHCIv04YLX4IdVgjxRKpmxmLMORPupi9UMwn3CRtu+n7
         8tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738335804; x=1738940604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m17uzmB00GT6kEfgwcoMSj/iyd95VX3uS9lZYb28L7c=;
        b=Cq0JwiRm+k4lXB359QFsXEXhlY0lNLdtUV+RuZkGqZF4tN/4JqWFPsIQ8QYwdwth0k
         +nObdgE2Rmx6uv9nfi1TclFn+k8yD7bnWfJc0WuPcIJdHWmCVB2FLjAWs+w/WJZxxmbj
         R+vrmVwDDqUOAvM3MuPvCVsSMroStXtSguy92woAjeOZSLpfPkzp78PVVLvReQcFxu8o
         W7+JNH3ATSAGl7hNKExqmubaxmQfuLSBLgJKFsLLzj9+UOjz+GPztXGNiKeZSaF0kLB2
         6EIe81EDrYNSsYL2whNKIw4pilstMTIQTQr53q9G+hmhitaXDQihyBmqKbmgmOxQ+rS2
         N2mA==
X-Gm-Message-State: AOJu0YxdOdIWP5X0G3uS7/WRp2kc9Dc8WKzgwTTNDT3aYrhdxUqAEoxJ
	2FtFnjUBM2lklKYRYDEGhkPtciFb46iNR8tU+rQHH4CyYut4Btk6vH6jMSatrv4=
X-Gm-Gg: ASbGncu+YTuiE+Wf+xbigRg5qwocWBJmmfiEijLAxLcxUIcMwdlWhvXjSKoONv6YCyA
	dOJmDMf79Up2Pt3ZWD6/5nkd6ZACnS1ARZAvNQ+igOicUz4H1eYaGQ29sFLi7yjAWEn87NYGS4P
	gRE1oeJ76Vi2f9+ShS2rQ6MAZU0pSNBkOArTCaYORUsTURng9a+l675El79HUTMAcup6cSFEg3+
	ZmfM96MBtLZctRbIvn1jAzAZd3IYJ0I6NJyEq780iHc+UV6CiMK0AAHECgxVgzBYaskwisiQTqG
	vyGuvrmoeEOgPC7+C4wyfsg/Dmp3eWk=
X-Google-Smtp-Source: AGHT+IHa61acfT+KyNQENNAEd0Nj8SRxrL3nqrV5AysWz0NDU8+NBDLu7wkd4aqJgwMag9OUt64tTA==
X-Received: by 2002:a05:600c:4455:b0:438:a240:c62 with SMTP id 5b1f17b1804b1-438dc43c9ffmr39701365e9.8.1738335804305;
        Fri, 31 Jan 2025 07:03:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:03:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 16:02:52 +0100
Subject: [PATCH 3/3] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when
 choosing bitclk source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1sAXbb7jAADLo71PpFTSGgQtXDD+l/u76NbI+0/GtkM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOY0/nyLoJ3CPnbjVkTxAPwcTEhEifYYAuKXJ
 U1YeJo4wEOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmNAAKCRDBN2bmhouD
 16DhEACNy8BVbPJXOrrzsVVDwnau+ETcAxY7IIdQ9JObd8TVWIMy3PeuM3eKAEJCJ37CFfep3nY
 +ebDoCgMut6CmEcOP57zdy+YnCV+Caseuc20ifRjLKQAsta8OJ2iyjTVL3nH6d/ROUGfYaMfOfR
 rfJoce88n0/sCN0G3aeBwvk8kFGdm0zPxIIljWdg7/1lt99vmRDDo9O3XB1aZhrPPelmbEKPXph
 QQsZDu5MYnHYhiZCwpQ4OvAXR5DpVhxhXMjk079rDgFE8FBCjaDeUFOZGgwhlVOHwXoR5CvQBkm
 iHY/1HMqJVhK58xQhgygIQ4SSjGpuU/HKDpdWpy7f6F2FCdEKZk6VGP4NYTWPjkB0v21sHGUw0t
 NEAeQZXh0N49sV2IvJK+hBSJaDecQdFsBcl8T3mEMAJOmv1dcR/fqX/8jEF3cFWZR0UfcLtV4HA
 JtRNxMKk5z9W7uy3ox0nPytAEqWoIPu4PpT4QuF0bi/BhKh5QhKh/w3lfsoz4LXAS5nlet1sd8B
 mbD1GpB3aZxJizYxmAIBXabsVnAaL4mnJ0ZsFM0gdPAcfB7zdWXd9umiaubK4aef6KMvIcnO60O
 CBQd6oPxVjBwecf6pO2TSDYaiM6xUFiP2XjbEOF9af9kHs9mR6rFaAspq/qxYGVUPU7ZfTkqGLo
 O/y6v+ThTBtjsLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce..8a9ee308ccffc3b9d112a994a064d8be06d9c42e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -615,7 +615,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -634,7 +633,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
 
 	return 0;
 }

-- 
2.43.0


