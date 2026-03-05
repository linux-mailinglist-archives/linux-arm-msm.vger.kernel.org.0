Return-Path: <linux-arm-msm+bounces-95605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGGLDMliqWmB6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:02:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CF2103C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 488003097DE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5664537B03C;
	Thu,  5 Mar 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBJpjotO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32649364EA7;
	Thu,  5 Mar 2026 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708185; cv=none; b=krU860pDuee/bBdLJ7vnMj8eE0UuOJcdIac1tkfIy7DGvtoYpyrP62WexaAYbiF0XlW9fQXFh/twjckfa8kNusEqClP6BoikQpTYRve3qiJRRv/TUD1K606z8AAj3+f3bBB7ZKi5ubeVlN/VvvyIuKaMl8/19soQAmciDolpQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708185; c=relaxed/simple;
	bh=R562p+iYLgaAvgi46C7G2V0rnDxgDNxtnokyQ3BvKd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+3EBGn/OMpZGIjymjvmIKlhWt1R2MrlQ9gptrRD+OCsB6K1La2ULuSrk8YoRFK0YerqCkpgKnZIY+yPH2/uFJ92Wp5CmSRKGsS4/ZUwwkHkz3ItrPZKuGaVbE0KI7yMVbDZY+WnlFXhQKqw98PbakcCrtRXKkVRXTQj7aE70Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBJpjotO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C911C19423;
	Thu,  5 Mar 2026 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708184;
	bh=R562p+iYLgaAvgi46C7G2V0rnDxgDNxtnokyQ3BvKd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IBJpjotOVd6qIXtUbSvh2qB4sNCWdyJk9E58OUUDRV/Ga+96MDKWLfcUQ0EidlWv5
	 YalAhbPBg/fVsqrDma0MxCYeAWebJCP3XvOTU1XZKGl4pV19t7+uOFMxZ9fsEM0gCc
	 GhXpF929yEnqSe+iXT0inIFmrWl8Aj/HhwVVm7dNYMxIAlK/e+GT/Uf3B/RPqMNCOr
	 DXLjjjTryuurMxqnn+KnT5yahTa1KOvIFiiA3moHZ0r5LofQuKiNy4xJf0vCp9ZCFA
	 rH9fMBlraUgg0pMK4608woZL+fVuNlW8UnWa8LEhKxF1Bq0m3lB+pK7HB6DYwa4hhS
	 Me0r5MfdI2XOA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 05 Mar 2026 11:55:46 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8650: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-topic-ipa_mem_dts-v2-7-5cb5b90902bf@oss.qualcomm.com>
References: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
In-Reply-To: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708147; l=1411;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9ECLL/8mqiUeScco9do9Wp7XjdsYtHzSREVi601Hpxc=;
 b=GBPaCOZ6tXbf5aR+70ZHfSNx0Pc1+C4FV+5EBUSltHIX4e838l5r7AR2ZxQanA8b88hyrgKib
 PacXVaMwF4fD/pwh2OyBiJicd25BubaB3gIPtoXErDwx7hIKX6jKjYD
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: DA4CF2103C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.31.64:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.228.225.192:email,linaro.org:email,oss.qualcomm.com:mid,qualcomm.com:email,0.223.255.192:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..63f9ca1f9be0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4393,6 +4393,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -7078,6 +7080,20 @@ funnel_apss_out_funnel_in1: endpoint {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sm8650-imem", "syscon", "simple-mfd";
+			reg = <0 0x14680000 0 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			ipa_modem_tables: modem-tables@8000 {
+				reg = <0x8000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.53.0


