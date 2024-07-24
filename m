Return-Path: <linux-arm-msm+bounces-26967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E193B360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 17:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12907283A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 15:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9216E15B111;
	Wed, 24 Jul 2024 15:11:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4757155739;
	Wed, 24 Jul 2024 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721833884; cv=none; b=qQGTG7mT6gAHu2X22UljUeTrjAzFlVF4Er68Ux6B9wewNTSXxjInN9CvDhHSOQsc1C2EFqNvPfAB0M1cG1AA9HA7BiXLKxiyjp2E+4298XDZjZUdZ6d9c+GmiY+6lfVJ0gBAr4tCPj6gqUMJBM12UCkRe/AYEe2Iw2juOQtNMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721833884; c=relaxed/simple;
	bh=hVOBMR0WMRaGugqwkxG5LTFeTAvlAEfxXnR4loSOMw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wc3Ht4/bYQ7PWGfR1iLdQ+RCYLqRXyd99dctl7T/sOPnTs3dBtnstgzHLvFtCiT4dA5RcS//1CDeen4ByeyoSxkvhvfWQYxWXAVZSMbeP5ZQh1oEJtJGukgrnwava7DZVgAe8ADq9NZsyaqBBtOo07Ar626roF7EGJtKTZtwoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 0E56E208A3;
	Wed, 24 Jul 2024 17:01:55 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id EE7942081E;
	Wed, 24 Jul 2024 17:01:54 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Wed, 24 Jul 2024 17:01:36 +0200
Subject: [PATCH v7 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-hdmi-tx-v7-3-e44a20553464@freebox.fr>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

Current driver already supports the msm8998 HDMI TX.
We just need to add the compatible string.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 24abcb7254cc4..0bfee41c2e71a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
+	{ .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },

-- 
2.34.1


