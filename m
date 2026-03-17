Return-Path: <linux-arm-msm+bounces-98204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBZUHYtruWmvEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:56:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA72AC774
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76F203255AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67E03ECBE3;
	Tue, 17 Mar 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sii8nsql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16683E9F76;
	Tue, 17 Mar 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758497; cv=none; b=nNd6FQxHDgFF0IZlE8z+UO+PN0xGg4bIEliPuVUa6talTnqL8q5rtC+jKdXYOM4aqewTJbDJIour7VSRo4E1tHGTjYO4PCShuQ0sX3kE+JH3m9u8NV0/tzyn+mNAmDokc2M6fPoq0qYyqkNFAzOF1hWtWSP4UNVJso90bD2g5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758497; c=relaxed/simple;
	bh=J+ele563bLep0xRPuk6NBG/vQwrP5Vlo47Rd5hTDtSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWzWTddCP/S/LnlbtCFg+qUOPbfX1s0/xn5jeO7qBO/pOhHKTDmsmSVvWMxOGI6/kZJ9VY7fZEz6pJ/GMk3QjqGeaR8OnrkUBxR45X0w6fcKoZJvK4NicSXTWSNltrqxHqpKNISAufI5XNHqXxfaGZVYSafMWB6l2xjb9AS86FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sii8nsql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DD3C4CEF7;
	Tue, 17 Mar 2026 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758497;
	bh=J+ele563bLep0xRPuk6NBG/vQwrP5Vlo47Rd5hTDtSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sii8nsql6lHEP0YGPfJq16zjII2hsg2VjEfwbw/cSVWkfI91HaU8oOsspBFMx/66b
	 sXPHHX5IhvNySmEBQOOTBk9fbdgKOiW/SiEVKqIaos/vl3j9eYMzol4Dq+rbPC3cin
	 Isbg6bgWhbGB0XSPARBynERz92ixNHq+XfLrG8SdHzF2G3bsU/Ka6qXN4hBIt72SQf
	 gntVZobREdqqCt0CUDyY+TDIs/+ZfxVKwn3Bsy9kj4O4h/15QbEGEO5D0aEpIHYvhv
	 lsq21bMLv8ypvH27qmze4DT8UktC2vLDUHiSp6sDMGF5jg6Ds1f1urR6nOnloGFhvI
	 WGO4GDA7NTrlw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Mar 2026 15:41:16 +0100
Subject: [PATCH 3/6] arm64: dts: qcom: sm8450: Fix GIC_ITS range length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-topic-its_range_fixup-v1-3-49be8076adb1@oss.qualcomm.com>
References: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
In-Reply-To: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tengfei Fan <tengfei.fan@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jishnu Prakash <quic_jprakash@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773758475; l=812;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MV1RGdaGMDoCB0P7jePlxEjkHpwLUd+82N5zh8U+6Kw=;
 b=1B2DpPFvOZpmb1/stEdqBif/xA5KrCTFJ3QdoNzs/IU2JmPNTOvH76WXdcQJ6dwB90ZXMco0m
 PeFs9hjMB2WA6XxzxqUkBOIm7ydfSt0vos+Hx3MPJ/cm94IR/EPT+Kr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98204-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.5.137.32:email,qualcomm.com:email,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1.4.236.224:email]
X-Rspamd-Queue-Id: E0BA72AC774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the GITS_SGIR register is cut off. Fix it up.

Fixes: fc8b0b9b630d ("arm64: dts: qcom: sm8450 add ITS device tree node")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index fd2d5648b92a..1f31d3eea4f0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5104,7 +5104,7 @@ intc: interrupt-controller@17100000 {
 
 			gic_its: msi-controller@17140000 {
 				compatible = "arm,gic-v3-its";
-				reg = <0x0 0x17140000 0x0 0x20000>;
+				reg = <0x0 0x17140000 0x0 0x40000>;
 				msi-controller;
 				#msi-cells = <1>;
 			};

-- 
2.53.0


