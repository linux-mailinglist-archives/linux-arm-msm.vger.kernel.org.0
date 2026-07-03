Return-Path: <linux-arm-msm+bounces-116360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nXIVLtDaR2pqgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FEB70407D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:52:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=xDagRRgY;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116360-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116360-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 266C73035F26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85626288C0E;
	Fri,  3 Jul 2026 15:51:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670562D249B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:51:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093915; cv=none; b=SGmHg4Qm19QmkYbSBmwolkPFM0LPa3cCk3wuCPaF1ROQE7P4jySRx8Mex5/zCPEKJlDEE6/U+SFoxxHqnknjuqvjy5ohbCgOxnfObigWS9bVyW21/mj5iP4z14pvOEV+8CxWRY15W7QHdBEy5ym6HwNPBI2efav84F/7odOzL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093915; c=relaxed/simple;
	bh=ZCx6qP1lmZfVMYjvzFCAoZUtXdJ2YSWsQt2fa8HD81E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZODifdy3NQivqsXPGEGEUdLG3GR5uqEePZlb38VjKG2lomipzP3fvizEt6aUNZxzDPPUfFZ9x4niD2uto6FS4mmvGUwikQ8BLyPIFprKm4GxIHLTqKmmPbH64bGgR0KFJkzsIqnmDsW86uu9/oS7lQFWsozmajk9iIXYs2JRT0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDagRRgY; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5279015e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093912; x=1783698712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B5cvNATVNpF+B31kgabQD31W93tRfITznE+mSWo7FQ=;
        b=xDagRRgY/Sni2AGc86ycv4ZafqbVqgDUHnMlHShMY79I5hQtX4UR9kaapsiVDHlydM
         SSeDlj481NU8DbrKm7WEE8qE1mPJJpXn9RNL3Yz0I2QX1u1PnB/16K3azn2Ojzm8uHcO
         6e8F6a/HFwasuZdr9fG97oa1y2RGUaHJWEfyCQod8OM0D45osNHNww6Xcy7OpECJCAEC
         ENw5F0ErUxNXJpCoU0j1hkiwmySILfrv+Yh8iPGy5uo4JOH4HkCQnUOQLKIWZawYeHcZ
         XIBgRNOfTCoPU6nvF8qtrqqOe9iXJnsj+9ua60uWQbY5UnXniTtHpTrr73PXpETSyph2
         vZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093912; x=1783698712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B5cvNATVNpF+B31kgabQD31W93tRfITznE+mSWo7FQ=;
        b=fL+oAM7Pw19lG5E7axUblp3Fkn3hSMr+H37Rlm5pWuklSBdGKq5RIDeP+HqWKc5LJJ
         UWHTmAiH3MCXsrFYcoK+/8eNDuGV6BS7O4Da955U/SaPFzZv98mBZ+Rsdx4V37mGHios
         BJG+4LuIUJlHmT3CDRH98uak2FQ26Mh9B0WCwNdqLIu8kH81WSaLDAhmISliYf9e6Eaj
         pgpUW+nFX/K5/1Qx/4p8x0MHEmYun3CyEKBXnMV/YC5fqu6LblICTxI5ESJ7hQ0EhbLs
         vZAfpd/bSqKFmVw4mMgKLcQ72XxIUApgxtYmc0R980ToFh5pypwC63CtWMujAZzDQs+8
         BiOw==
X-Gm-Message-State: AOJu0YzOI6AfkB6Ybtyoxx1s7KRnH8qpKqN+Rw9jy+kibn/Bzhjyt6am
	MBCM/rNLUrS4eVi3JA/VLRiYBvDWfvkHWbz6QY4xZT4ECMYlzfGSn6uZg+9IwHKAzug=
X-Gm-Gg: AfdE7clWArnrZoaXUhHzh9cFsx6zzNHq2zE72eWXTPCVpYX2UMiWsLqKufjSith/WUk
	PfvtwtzYWDwywcUBPmNoMwaUvnpu6d8WYsaao4EZ0HNaGYd194+6JP1HM4NEp9PQ0NljiRT/ww9
	X1O8TRfSNG7C91JPmEeOUEhCR5cabusVjw41xjEjaVsh/eVWmBH6hTOOC6j/+iBQcIJWwL92KtJ
	0RcZDLP22PJx1gUswNilYrhb/Oi7w2dGPy5cI8NxLig4W04evKfQky2iA43vB36TNDFIxQ95FpX
	GIcm/4xgzwRhBJfv1U8qYA5z3mfA+1O5rreOBvq5iquoJhhuysQT2lxJHMrcjtShIx3mJwg3fQH
	fHc5x+6DV6V1leU8NNA5uqzVVcJaNOrDMBAuVBJNhhNaLd9odkEr3hMfNmECpNre7GcH1aVyP9f
	W4faqIhw==
X-Received: by 2002:a05:600c:c16d:b0:493:a5da:e5d2 with SMTP id 5b1f17b1804b1-493d0f3c14cmr3998955e9.26.1783093911819;
        Fri, 03 Jul 2026 08:51:51 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:51 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:45 +0100
Subject: [PATCH 1/7] arm64: dts: qcom: x1e80100: Add ICP/BPS/IPE nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-1-595df9e67790@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9427; i=bod@kernel.org;
 h=from:subject:message-id; bh=ZCx6qP1lmZfVMYjvzFCAoZUtXdJ2YSWsQt2fa8HD81E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qSpiq4hnorAkWniu1feJvwcGyq1WRnXVnKS
 pwGap4S/YaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfakgAKCRAicTuzoY3I
 OmpcD/sGaVGvjKmdql8vVuVJCEMY1712FU1uF7gt8sEwJFu2xnRmb5m59TaW777HWnBOsr3tUhd
 gyqlDWMCCSrdQaa/32g45+/3QNhK3j5TrYO80NXVEXz7AEIj4h6iQjstZho7sFzMvByZHa/Ku63
 0WnLV9Gk2veYPx0G1Ov6hXg7wh/1da0tVQzDOHQ6G5FxLMX7avX5hsIvD3Ou8w9/UOdHSnnKyVm
 HPPJFV58vfr7jwFn85Vagj0qzyWIMg2MlgkVtVS3Fa0uW6ZGRthUeJRYqUstS9GHF2dpQpsAICN
 DUH7FJmdHViugDOb7yEwUOY2rpqMln/gT3sxAp1QCzbN/Ts3sIa1ZueG8VpE21Y+bpFNwdPrdm5
 TBFLYhEn1a8ymUDbO40i1WMZ2A2a9emdn+R1VTI3ilKLu+xmQ9myEW7G69G/IlPOV4NwryTPmO4
 qOnN7HQ3yFmgdixrl2hFegKjeIvuLYxT3JV/QC9VxninuYTc8FT9MVt7B0Vz43LiA+KDKIMEnWt
 ZQKbPhxlLTYIhS6m+NSzB0aeOm3x7u2MQO9J6PMbhLhX4DkAJ9JvnzzXUTTkSj9pW1y/gi7q99j
 lF1IBFXIVXvJUjJEi8hTomeh6DYNkCUK08kdRmDk+JRXbI6t4wVrVwDY1aRbnxl+T/okeVOxf8Z
 +aDcUvIEWQbOIZQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116360-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48FEB70407D

This is a very rough outline of adding the ICP, BPS and IPE to Hamoa. It
does so assuming the relevant devices are sub-nodes of the existing
binding.

Yaml for this binding has not been made yet.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 250 +++++++++++++++++++++++++++++++++++-
 1 file changed, 243 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 5c7f86005e824..40ab1c649dc6e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -645,7 +645,7 @@ cvp_mem: cvp@8da00000 {
 			no-map;
 		};
 
-		camera_mem: camera@8e100000 {
+		camera_fw_mem: camera@8e100000 {
 			reg = <0x0 0x8e100000 0x0 0x800000>;
 			no-map;
 		};
@@ -706,6 +706,13 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		camera_icp_mem: camera_icp_mem {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x11000000>;
+			alignment = <0x0 0x00100000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5495,7 +5502,10 @@ cci1_i2c1: i2c-bus@1 {
 		};
 
 		camss: isp@acb6000 {
-			compatible = "qcom,x1e80100-camss";
+			compatible = "qcom,x1e80100-camss", "simple-mfd";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 
 			reg = <0 0x0acb6000 0 0x1000>,
 			      <0 0x0acb7000 0 0x2000>,
@@ -5602,11 +5612,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					     "sf_mnoc",
 					     "sf_icp_mnoc";
 
-			iommus = <&apps_smmu 0x800 0x60>,
-				 <&apps_smmu 0x860 0x60>,
-				 <&apps_smmu 0x1860 0x60>,
-				 <&apps_smmu 0x18e0 0x00>,
-				 <&apps_smmu 0x19a0 0x20>;
+			iommus = <&apps_smmu 0x800 0x60>, //IFE0/1 IFE_LITE 0/1 non-protected stream read - S1 IFE HLOS
+				 <&apps_smmu 0x820 0x60>, //IFE0/1 IFE_LITE 0/1 non-protected stream write - S1 IFE HLOS
+				 <&apps_smmu 0x840 0x60>, //SFE0 non-protected read - S1 IFE HLOS
+				 <&apps_smmu 0x860 0x60>, //SFE0 non-protected write - S1 IFE HLOS
+				 <&apps_smmu 0x18a0 0x0>; //CDM IFE non-protected stream - S1 IFE HLOS
 
 			phys = <&csiphy0 PHY_TYPE_DPHY>, <&csiphy1 PHY_TYPE_DPHY>,
 			       <&csiphy2 PHY_TYPE_DPHY>, <&csiphy4 PHY_TYPE_DPHY>;
@@ -5662,6 +5672,232 @@ camss_csiphy4_inep0: endpoint@0 {
 					};
 				};
 			};
+
+			icp: icp@ac01000 {
+				compatible = "qcom,x1e80100-camss-icp";
+
+				reg = <0 0xac01000 0 0x400>,
+				      <0 0xac01800 0 0x400>,
+				      <0 0xac04000 0 0x1000>;
+				reg-names = "csr", "cirq", "wd";
+
+				interrupts = <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>;
+
+				/*
+				 * ICP clocks plus BPS/IPE clocks.
+				 * ICP firmware expects BPS/IPE to be clocked before boot.
+				 */
+				clocks = <&camcc CAM_CC_ICP_AHB_CLK>,
+					 <&camcc CAM_CC_ICP_CLK>,
+					 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+					 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+					 <&camcc CAM_CC_CPAS_AHB_CLK>,
+					 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+					 /* BPS clocks */
+					 <&camcc CAM_CC_BPS_AHB_CLK>,
+					 <&camcc CAM_CC_BPS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_BPS_CLK>,
+					 <&camcc CAM_CC_CPAS_BPS_CLK>,
+					 /* IPE clocks */
+					 <&camcc CAM_CC_IPE_NPS_AHB_CLK>,
+					 <&camcc CAM_CC_IPE_NPS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_IPE_PPS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_IPE_NPS_CLK>,
+					 <&camcc CAM_CC_IPE_PPS_CLK>,
+					 <&camcc CAM_CC_CPAS_IPE_NPS_CLK>;
+
+				clock-names = "ahb", "core", "debug_xo",
+					      "gcc_hf_axi", "gcc_sf_axi",
+					      "cpas_ahb", "cpas_fast_ahb", "core_ahb",
+					      "camnoc_axi_rt", "camnoc_axi_nrt",
+					      "bps_ahb", "bps_fast_ahb", "bps", "cpas_bps",
+					      "ipe_ahb", "ipe_nps_fast_ahb", "ipe_pps_fast_ahb",
+					      "ipe_nps", "ipe_pps", "cpas_ipe";
+
+				/* Set operational clock rates to enable PLLs */
+				assigned-clocks = <&camcc CAM_CC_BPS_CLK_SRC>,
+						  <&camcc CAM_CC_IPE_NPS_CLK_SRC>,
+						  <&camcc CAM_CC_ICP_CLK_SRC>;
+				assigned-clock-rates = <480000000>,   /* BPS: 480 MHz */
+						       <480000000>,   /* IPE: 480 MHz */
+						       <480000000>;   /* ICP: 480 MHz */
+
+				/*
+				 * Power domains: TITAN_TOP plus BPS and IPE GDSCs.
+				 * ICP firmware expects BPS/IPE powered before boot.
+				 */
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&camcc CAM_CC_BPS_GDSC>,
+						<&camcc CAM_CC_IPE_0_GDSC>;
+				power-domain-names = "top", "bps", "ipe";
+
+				resets = <&camcc CAM_CC_ICP_BCR>,
+					 <&camcc CAM_CC_BPS_BCR>,
+					 <&camcc CAM_CC_IPE_0_BCR>;
+				reset-names = "icp", "bps", "ipe";
+
+				/*
+				 * ICP SMMU contexts
+				 * Multiple stream IDs for processor and DMA
+				 */
+				iommus = <&apps_smmu 0x1900 0x0>;	// S1 ICP_IPE_BPS_CDM CPU shared stream
+
+				interconnect-names = "ahb",
+						     "hf_0",
+						     "sf_0",
+						     "sf_icp";
+				interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ALWAYS>,
+						<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+						<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+						<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+				memory-region = <&camera_fw_mem>, <&camera_icp_mem>;
+				firmware-name = "qcom/x1e80100/CAMERA_ICP";
+
+				operating-points-v2 = <&icp_opp_table>;
+
+				icp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-480000000 {
+						opp-hz = /bits/ 64 <480000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			ipe: ipe@ac42000 {
+				compatible = "qcom,x1e80100-camss-ipe";
+
+				reg = <0 0xac42000 0 0x16000>;
+
+				qcom,icp = <&icp>;
+
+				clocks = <&camcc CAM_CC_IPE_NPS_AHB_CLK>,
+					 <&camcc CAM_CC_IPE_NPS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_IPE_PPS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_IPE_NPS_CLK>,
+					 <&camcc CAM_CC_IPE_PPS_CLK>,
+					 <&camcc CAM_CC_CPAS_IPE_NPS_CLK>;
+				clock-names = "ahb", "nps_fast_ahb", "pps_fast_ahb",
+					      "nps", "pps", "cpas";
+
+				power-domains = <&camcc CAM_CC_IPE_0_GDSC>;
+
+				iommus = <&apps_smmu 0x1980 0x20>,	// S1_ICP_IPE_BPS_CDM non-protected CMD IPE0 read
+					 <&apps_smmu 0x1820 0x60>,	// S1_ICP_IPE_BPS_CDM non-protected IPE0 write
+					 <&apps_smmu 0x1800 0x60>;	// S1_ICP_IPE_BPS_CDM non-protected IPE0 read
+				dma-coherent;
+
+				interconnects = <&mmss_noc MASTER_CAMNOC_SF 0
+						 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "mem";
+
+				ubwc-fetch-cfg = <0x7083>;
+				ubwc-write-cfg = <0x1620f>;
+
+				operating-points-v2 = <&ipe_opp_table>;
+
+				ipe_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					opp-364000000 {
+						opp-hz = /bits/ 64 <364000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-700000000 {
+						opp-hz = /bits/ 64 <700000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			bps: bps@ac2c000 {
+				compatible = "qcom,x1e80100-camss-bps";
+
+				reg = <0 0xac2c000 0 0x8000>;
+
+				qcom,icp = <&icp>;
+
+				clocks = <&camcc CAM_CC_BPS_AHB_CLK>,
+					 <&camcc CAM_CC_BPS_FAST_AHB_CLK>,
+					 <&camcc CAM_CC_BPS_CLK>,
+					 <&camcc CAM_CC_CPAS_BPS_CLK>;
+				clock-names = "ahb", "fast_ahb", "core", "cpas";
+
+				power-domains = <&camcc CAM_CC_BPS_GDSC>;
+
+				iommus = <&apps_smmu 0x1840 0x60>,	// S1_ICP_IPE_BPS_CDM non-protected BPS0 read
+					 <&apps_smmu 0x1860 0x60>,	// S1_ICP_IPE_BPS_CDM non-protected BPS0 write
+					 <&apps_smmu 0x19a0 0x20>;	// S1_ICP_IPE_BPS_CDM non-protected BPS0 CMD read
+				dma-coherent;
+
+				interconnects = <&mmss_noc MASTER_CAMNOC_SF 0
+						 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "mem";
+
+				ubwc-fetch-cfg = <0x7083>;
+				ubwc-write-cfg = <0x1620f>;
+
+				operating-points-v2 = <&bps_opp_table>;
+
+				bps_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		csiphy_opp_table: opp-table-csiphy {

-- 
2.54.0


