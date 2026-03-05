Return-Path: <linux-arm-msm+bounces-95601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKHEDKthqWnj6QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:57:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B19972102CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36F5130470DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF01937AA84;
	Thu,  5 Mar 2026 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8/eiqQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD10370D4A;
	Thu,  5 Mar 2026 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708165; cv=none; b=pgn+afdVjedyZXppGgDY6Yx4xaHqLtI2cgxNHgqqOCeoVwl7GuuYRxGCYsOs+AWatl/9XpZGsn8xi/sPeHJYj6UIlFI+4zdVAFbi83PFxnw+QQp7+ZNAaUEPFY5urxsQBPuc5RCyeKjPQag6ABLEtY3hoF/uHKHLv7LtLLvsk2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708165; c=relaxed/simple;
	bh=/0W0T54i/ZCa4VF3EnNGqRTSKo25iOc1GWvAvMScmpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPTF4+4OQyu0b9kkl9vgWHrL2xbpXlnHdekB+dZ4Qy5hJm+2pgCudJ84k7hVfu0/nW7ZRCflKTgpD4uAw8wQUy1LuRuAc4rRSAhQJM3Zgz+l+NhmwGUjmCEGE7zv2hee6rpI1ba4yqAVkUWPf391CSj1+Bd9XGAfA7PHu9pwz4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8/eiqQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54C6C116C6;
	Thu,  5 Mar 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708165;
	bh=/0W0T54i/ZCa4VF3EnNGqRTSKo25iOc1GWvAvMScmpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r8/eiqQxCqxwms8fSuQFvvhj7Uv0rBbTSPF7v+NJYoUGBvQklOKvi/+y2SERuo5/Z
	 BJEaHZA/pO5dilqceS+SC91EyhL7UAyuYFUsnehIfXd8e+v6ahN2G6/g6tTp7lFfRs
	 i4/Abso0EvOfQ+0z2V4bVfRhMTv5uvaGCBtIEj1KXAwxCy8ZuUFUiMNuYST30fNfpT
	 Q8nH8BffeHmEEEEaDxwOWdwy0cTwMqC6vnlBfDgE1XYRz7lkEU9u7kG/jGI1kURaDF
	 S2gAEji+drYomWGcB6UOdZ+xlRO6rjPJZNvsiCV8kTe4uoOOJ8T72WXq4Rb51jvaqj
	 uqNNHrhUYYadA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 05 Mar 2026 11:55:42 +0100
Subject: [PATCH v2 3/7] arm64: dts: qcom: sdm845: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-topic-ipa_mem_dts-v2-3-5cb5b90902bf@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708147; l=1049;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gIFfsopVyT8iBAPOPwfyxSgJ0mOzB8o3XCDcXmZlViI=;
 b=PCkNYKqqMh2Ke+HrjWVU7NM/GG4S4TCh+ulZQvdoa4UuUoVXkoJ4zZmWh3kJ55aY+uQKW9a2y
 9zFgrc7KqHYDnjAFvQOEib2coBfICOe9RAyR8ZcRbeZFWoJ2xjNo52P
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: B19972102CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1e40000:email,oss.qualcomm.com:mid,3f94c:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,3d000:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba..b749f545d6ca 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2780,6 +2780,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -5134,6 +5136,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			ipa_modem_tables: modem-tables@3d000 {
+				reg = <0x3d000 0x2000>;
+			};
+
 			pil-reloc@3f94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x3f94c 0xc8>;

-- 
2.53.0


