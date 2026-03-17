Return-Path: <linux-arm-msm+bounces-98206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCVNE5ZquWmvEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC02AC60F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33663213D27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9D3E9F82;
	Tue, 17 Mar 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccz2JNVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44D301016;
	Tue, 17 Mar 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758507; cv=none; b=fcpJ/ugDF1SjmIDAWgroQq4grELA39hE6/lEH2QaYKZRe6+1F/eW92dURIyXonLS23JvnGZSdGrDc2EGaqDMqHV1HXFMqlB0fYakjjG9h+UomKTJLrVlZO1zg1Z17XHJ0KmX2QoUsSm8OeoxtrrTojCCDD4kgPfDIpnum31P/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758507; c=relaxed/simple;
	bh=mpRF6/ZMq8597i+VUc08asvo+Ot1zx64wsFXj7PTaeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6AqTxXD6j+JeT5roha7jr3acha01TSf57RSIpg4zzVf6BioVPqfwrNjSUgg+4tLViWrCNxQSXT81ua2299SZLK2kxZrAM/R0snUonBLi+93+6EUuSLVtdvFD7j3P1fsRdHagSogDxitVFQQVzzIIPvRZjre3zdS0LseX9vCM2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccz2JNVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5724C19424;
	Tue, 17 Mar 2026 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758507;
	bh=mpRF6/ZMq8597i+VUc08asvo+Ot1zx64wsFXj7PTaeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ccz2JNVjpu8nJ+BA5B/kwIk/XTMUNnsSLEpi7Bl0+OCdUfEenjJiH+1UwL0zHWQlN
	 hcYBBY2/ECbaDgdmaa8Njk0t/UmULIUkr257yCiCsjQABa85zrSb7sYxONfzxFG4nO
	 5QgcaVWSjqieU+22Kg9FsxoKZs7vOPQpoVqIlqd5VipbEA9HDCmkvU1NWOulX3YoV+
	 Kd+MOM+d8p1PyHYinMQyJEVIBHfTv7a52MxWsE7Wp/tmk+CqrehCHyxaRPP4DKR8vk
	 Qrau++0Twnm3bIvtFC7fKGx24hSKE3ShE655e7d+g9aVYqqgFprTjZsU+PilfFK/zA
	 vm4qnbLP1BiVg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Mar 2026 15:41:18 +0100
Subject: [PATCH 5/6] arm64: dts: qcom: sm8650: Fix GIC_ITS range length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-topic-its_range_fixup-v1-5-49be8076adb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773758475; l=791;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2Dgx7t26voHa3kgEypA8ZzM17S/HyzhvBSzcqSNxZyo=;
 b=CgoHUrPKYExQ1jeu/3exYB535PhLmUwW/HjTHwLVdqS8hA+ArTqfj1X4Gjh/EaUcYVUZL1fYr
 1TQrzqOfwZ/AAd1yQKm5NYcNKdugDnafEIgfMWY7w5zAdA0WbJeFyLK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98206-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,1.5.137.32:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E2DC02AC60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the GITS_SGIR register is cut off. Fix it up.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..e411f5b770d1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -7219,7 +7219,7 @@ ppi_cluster2: interrupt-partition-2 {
 
 			gic_its: msi-controller@17140000 {
 				compatible = "arm,gic-v3-its";
-				reg = <0 0x17140000 0 0x20000>;
+				reg = <0 0x17140000 0 0x40000>;
 
 				msi-controller;
 				#msi-cells = <1>;

-- 
2.53.0


