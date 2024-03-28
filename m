Return-Path: <linux-arm-msm+bounces-15536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EAC88FBDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 10:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA14129A32F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 09:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462817C08E;
	Thu, 28 Mar 2024 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uezifShB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4857317D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618988; cv=none; b=nwazNQhWlm0fBqoB4Dq23swGIsevN/1lvDYoiJKZtlJ98c6x6KlgT3SBllJumjk+E80NMbijnP4JQ2rRLMQroVakc5wR9xisu+Zi8bKhoFeswsmC2jlZPMqLc4ZjUrJig659dTosFLiUqh/dVoXFieMUENCucuyylLdyCXJ4hTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618988; c=relaxed/simple;
	bh=jS0gUBcbIu+ubLTGyGNXFxfk5voz45VrMtkV8CJFN7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eq+A9+mgARL2leUJFSKZrbts/sZQ74Kdnas6JZ26YyM28tIZP31xHTOEbhX4fTBbItzFEXLXYOItY181kqLp6LkVMhmI/lZ/RyUBkbsoPCv92ctV1OMZyn7NSE9YJiLwHd1XwrnGPgJt01olMU8SN7jQ/d8ia4taj+6e2St9TqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uezifShB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56be32b9775so817532a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711618985; x=1712223785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMlfiDzriuD+cu/wjObegNb+/syb0i9il2tTyX7RS7Q=;
        b=uezifShBlSM/+BjlXimMZwxeD8ucKhZm8FeO91hzzezNwdmiZ7etVOTGla0/vJMZKi
         5ffhpDGXPT32GTrpkRuh1KHHYstyGVA3lZ9iPz3UwlR2J5+E3NgM1O2ApgVBBnnEQkgt
         DUKvSjBJjZiQdcPVZ4JLJtwhtMr4fWT0N3FAKD6qUFEG+Ivtts+Jnc74L2LHjOgd8ZJv
         6VBhjvq4G/QQwBvG6sbHMlenZJa0IKj6eP8ZiZQIM7XVWI0wgX/UGbokgPsIdtg8v70M
         mkJYAwNDDQOd0px0nYCegZpxvuRI3usYiBMzxVSNukfZmN1qzOEiHAvwIbJBcd11bQ6f
         SYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618985; x=1712223785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMlfiDzriuD+cu/wjObegNb+/syb0i9il2tTyX7RS7Q=;
        b=vvpoYzgd/pL/DNNFJw6IcO7TyByTvU9rjj7uCtwfsBI9runSh1hN03o0c5xOovGcZv
         citNqx44MbW8gIbK/TPUaLESJa3chFUVDIKw91bUHkT2JiRFH0f63WNyuJLaN2CNJUg9
         l10uv/SGNQr9C52AKAU8P1WwwHPJmFiYKm82Dh6kcB2jA0t6wSukvn4qA+D5wTUsl4AA
         TVtgURjqUfwYcV1YGL/lAEFv+cpSdMfaFIhpOidsXGyJbYMNmCrqIGx5E6Us11J8QJFU
         Ea4QDkZcZaKJR5jjJ7IYfC8dCNeX9oB1PV12QAimTioeiyl3dWsqXVA+Jgk/DXVlao6a
         6Lng==
X-Forwarded-Encrypted: i=1; AJvYcCUG8r8UiCSFCCVmVYPuvpiHtdFCK73MDwAFCUFZ19yx9X6/3TGAysTTI4uzl7g3e/WPF+TzKXNHCnFHPIOykKNxkxOQZbef1jkoeMHQGw==
X-Gm-Message-State: AOJu0YxCE0PowwO4EvG7ScGfysjQJeEiUbLt/tMefHFB7Npxy5kmh11I
	BT9kRei0vtZvbwUgYA/UnZRsl+MNKs7NFEFskgDGOURdsh8GBmILNzGvMUVGhdk=
X-Google-Smtp-Source: AGHT+IHdcM/mh0t3Gi4q9lyyrXi7Rv7pOtysjwB3fu9r0BHc1uHuutv4DERQBvDamLZ59FU09Yffcg==
X-Received: by 2002:a50:9e65:0:b0:565:7ce5:abdc with SMTP id z92-20020a509e65000000b005657ce5abdcmr1494032ede.10.1711618984945;
        Thu, 28 Mar 2024 02:43:04 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l2-20020aa7c302000000b005645961ad39sm631362edq.47.2024.03.28.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 02:43:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 28 Mar 2024 10:42:46 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add DisplayPort controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the node for the DisplayPort controller found on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 24bcec3366ef..d7cf4b5ceea6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2033,6 +2033,14 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2070,6 +2078,86 @@ opp-560000000 {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM6350_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp_out: endpoint {
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm6350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;

-- 
2.44.0


