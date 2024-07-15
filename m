Return-Path: <linux-arm-msm+bounces-26168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D9931443
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDCC280FA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E36B188CDE;
	Mon, 15 Jul 2024 12:32:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5D723BF;
	Mon, 15 Jul 2024 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046721; cv=none; b=Ch8eob6D/6u9mSqLATawB645CpjKqoxdZobg2ow2MzhfbrM+9q9C0y3PgaErzZcR5/zMfTtetggfKTkYR6OhAsvaFI+5r1eHjLIhGvSzhThWtu8A3BN/2PrXXFsL/d5FRMfeFM0+xpITElzrRJ3wXvv7fDK/hIbMUncceRxO9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046721; c=relaxed/simple;
	bh=UEpwc1sCiOSt7JHSYtQnKir00MQWhdJ0PXX7rkpvjJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFAvz74AT6TytMh7ynsdhdEa7xqrQMRcxxqdZZh7FKIepTEvvz6xeYREmW2SXbffhlG6AgG/TW7R38Uurim/6QXeXkCtsMIPulquEQ27lXXl+YFThTOEFJmS+tNjDDzNwSVAbZHVWVF8tSqLGUnSORGsT+KR500Wq5/pqyD23v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 2034320C38;
	Mon, 15 Jul 2024 14:22:14 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 19ECD20C2C;
	Mon, 15 Jul 2024 14:22:14 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Mon, 15 Jul 2024 14:21:18 +0200
Subject: [PATCH v6 5/6] arm64: dts: qcom: msm8998: add HDMI GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-hdmi-tx-v6-5-d27f029627ad@freebox.fr>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
In-Reply-To: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
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

MSM8998 GPIO pin controller reference design defines:

- CEC: pin 31
- DDC: pin 32,33
- HPD: pin 34

Downstream vendor code for reference:

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400

mdss_hdmi_{cec,ddc,hpd}_{active,suspend}

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e5f051f5a92de..ba5e873f0f35f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1434,6 +1434,34 @@ blsp2_spi6_default: blsp2-spi6-default-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			hdmi_cec_default: hdmi-cec-default-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_ddc_default: hdmi-ddc-default-state {
+				pins = "gpio32", "gpio33";
+				function = "hdmi_ddc";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_hpd_default: hdmi-hpd-default-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <16>;
+				bias-pull-down;
+			};
+
+			hdmi_hpd_sleep: hdmi-hpd-sleep-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {

-- 
2.34.1


