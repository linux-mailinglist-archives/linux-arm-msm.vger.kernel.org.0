Return-Path: <linux-arm-msm+bounces-16004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF88A89499B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F315C1C23E53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16DD6FB5;
	Tue,  2 Apr 2024 02:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2bdwpa3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D7134BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026310; cv=none; b=g0XWbnYad1a5eaFeGPETXZzbnRXc26EdG2+2JNr2OEerCyk3ElW5xJuL5+HHkpbB6IRF71qNx8giC8p1lGevNEMtpMQ36At90xvo/xqd4t+zlQiJefeeqeROyaAa7s1tyjskpmQFiP/5j66z4WijLkB8iycOODwMstzXd7iRolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026310; c=relaxed/simple;
	bh=yPu9lShLWjrX8FbgY01q1INaNP1kyI/7w03v1seDbHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yzm2vmbNwxNNTAYsTEdBrRYaTH7OH0skqg3dn2qF/eaAWufKqAeuElPBgQGtMZO9Bnpndl/NCHPbyt7mHtJK1lntP7laZIXhz1Qe2ZyNNJ0gxIOlRaJ8ZM4EJ1VUAY8Q+H8zVs2xXIGTapUffIoMGokH2+r4icfeget0D97/Mvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2bdwpa3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-515d55ab035so1578379e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026307; x=1712631107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nAoWwlePI94p1y2muaLUzxrPgMrou5m/LTN89EwtK0=;
        b=V2bdwpa31fZi45Zjtjad9hf6MMJEOt4eyNSD0jdu1artOfW6vQhns4CeT1PMwdMB56
         7dtyT7yctiGVL1u92f02QPqQpfJ0sOW6y8rz42ADH0uWNPwCv++jZTR3tndJd9fMkSSj
         mHjKO7KTh89y0lYkAaO2BJAT+ku7DPggri5/fWeBnUAKl+BOlpqQxrr6T/bcGORRMvvd
         1spj7GXWyWjplq0OTm2FSxbmCOzh/LFByoCaCrFExT9EmU6gJJAvQVRLg/3EvteAopzc
         kHstR3W8kFb11PhD51WzhlsJzOYkacvK7yl/FGA6XpE03URe9D4R0hSDAEqxiKPRHjiC
         qfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026307; x=1712631107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nAoWwlePI94p1y2muaLUzxrPgMrou5m/LTN89EwtK0=;
        b=twiVKZPMtDorHcOdK7ZTsNVwm1vvEWPMdM5MjZEVbmkKSjbsfIT++EuJYWIWokQ+Es
         HkwEPyk9wb0ST0oKksPdCLhvwi2s+1f0faYWoOKuvQMANF6Q7IHa69J2coZAzWmXUWr5
         7TuwJuHrQRPq+T2GI+wUtzwgNinCVMV/P2QqEBm2ipe/onhYrwHSzRnmHfC7gV87J6CY
         znp352HnnuTo/DLunf1hRS08NW3QL8Rl8Jltd4rd2b1rIkin7AoXVjwUC9HI6XN7QgQJ
         0UbKKdn02rhTQO8vpP8Apa5Q1YwBKtfHjqCyyrnxtS61jOIaZwKAujCD8BL7csehJYCc
         C3zQ==
X-Gm-Message-State: AOJu0YwMQokXgvLStFgAI59nUdIKVojeloz/zh/hC9T4GsGQjiL5OOz9
	TpegYWyokG7z/mlKxOaGyzfssU/L/0IAaa59xmgcpBvlgbfHBX3fh/tpOYEdpUg=
X-Google-Smtp-Source: AGHT+IET2m9gjZhGc5OFILt6GqKIA3041PJsDcEchORoLXq729R52Gnp28l0y/Wvu5IKew3O/PE79Q==
X-Received: by 2002:ac2:47e3:0:b0:513:d640:ff16 with SMTP id b3-20020ac247e3000000b00513d640ff16mr7317518lfp.29.1712026307344;
        Mon, 01 Apr 2024 19:51:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:51:45 +0300
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v2-3-39bf90051d83@linaro.org>
References: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yPu9lShLWjrX8FbgY01q1INaNP1kyI/7w03v1seDbHM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/+s6D2Mv/a6xTE3hAK7CO3aR3c7PdH9/z1
 +f2F8W/QfyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1ZIPCACrEOreU1YwzolZIv5IPL5fLijl5LGwROYqgPHaQAd7CwVQvnEHjCzc6fukZv1RNrNeamU
 50dMOIn0oLKHfkLSNznbMSfBbRh0nKgnYUJvR90HLPp2xfJguu2uB8wpIr8iV+WKkIvvvA5bSgA
 sN1yPCPnZTF6S9A5gmfgr/HLYtsErlEuziswTFDb8XIMdcUWblfb95w2SZ1spLVrKeAcFDBN5Ja
 cGiLF2CMSIaP5jkrBGyjqFheG979zaWjGbFigZesCQSBtnpdVftsquA8JLVcUc+TaY3AxRoctCv
 FP6j2lZ4G9BY9u8zdXRAVxt5aSSA0WnQ1jRVA/aoW+t3ZvxQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 99462b42cfc5..6d74867d3b61 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2804,7 +2804,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SC8180X_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -2877,7 +2877,7 @@ mdss_dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -2963,7 +2963,7 @@ mdss_dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,

-- 
2.39.2


