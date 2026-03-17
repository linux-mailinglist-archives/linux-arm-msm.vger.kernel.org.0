Return-Path: <linux-arm-msm+bounces-98205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKH9KjxquWmvEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:50:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4672AC580
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72B2F328AAE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F903EB80E;
	Tue, 17 Mar 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcUnntg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA73EB80A;
	Tue, 17 Mar 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758502; cv=none; b=g6NNy0FmrrsAPHETUkeK0BAfHmRHvpXT4u6NOd1dIBKkfDzzVLDabLPiuKq0VdxOyz0QlzSjzBRu74HL3yG5YfjkPUpkYzunKiRImtSVEVXFmdh1RA+kLSOsK97SOjG4CPZPmLYk1Ez/7GGHUqZ2TgNO0l1UmpXVvKJrNaVVguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758502; c=relaxed/simple;
	bh=VguNReQz0nW/u9xO2S9/pIFo3Y7Onnyt4xDFGA5dLGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYySo5BUO+LfOerWGyz8Dczpoqv/6RDCKCLrf3Ix9N9OlZEEZ3GYCu03A+0akMrLptU19sRoluxvhdLJCZ1bjqBwWP4IMvaIB84POPti++eUxMZsFD4fizWeaz6oKG1upFL8oTn13TedsulmG9G5qw6XRiyF1MU3SCHq9HF3r3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcUnntg7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC175C2BCB0;
	Tue, 17 Mar 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758502;
	bh=VguNReQz0nW/u9xO2S9/pIFo3Y7Onnyt4xDFGA5dLGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WcUnntg7H2NMyZHTDQxKq9Mlir6dbEWassSoYfl/9mHaaMy14dd56xoJgdfBqcKFw
	 d2qlNJt/qOdL+phb3je/g/nh3oRzApLUKB2+9Jknmp9bfCcKpy+TRaDBZgMZzXYzyM
	 y2IlPsfsGyygok3PSZB3kZ9l/5AEhLv7OXRGL8K0hBCJ9KbjdCTW7sI3nglZADzVDy
	 VwmKoEBh756Qd8uBSmegV33c0aMaN6F0nDfEeAbkTFUINXQPro+0cjK4zpne8+uGp3
	 PH2LUC8Lc0eOYjqu/SXe3AzcbCek8wr6onNVrr67xAqDRlUGKofHeiyu22Am7BofSh
	 60GPHT7nyO6mQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Mar 2026 15:41:17 +0100
Subject: [PATCH 4/6] arm64: dts: qcom: sm8550: Fix GIC_ITS range length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-topic-its_range_fixup-v1-4-49be8076adb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773758475; l=793;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lgf0qVgrgdEc34dWC0C3bqqV8w4w1NxbIBjbxxWx8/M=;
 b=1jxYbl77xvGWpr2bKJymGxVgJyWMsVqd2zwYTDPAHd7WfhSUCOgVcmdqgPJUp6apvgDyPNosy
 S55YkQVEQJJC8y0nxKbypNJJ7NNjoohw7avsf8NhbHJyvkhgfjqOOA9
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
	TAGGED_FROM(0.00)[bounces-98205-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email,1.5.137.32:email]
X-Rspamd-Queue-Id: 2C4672AC580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the GITS_SGIR register is cut off. Fix it up.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..0fc86967bbeb 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5274,7 +5274,7 @@ ppi_cluster3: interrupt-partition-3 {
 
 			gic_its: msi-controller@17140000 {
 				compatible = "arm,gic-v3-its";
-				reg = <0 0x17140000 0 0x20000>;
+				reg = <0 0x17140000 0 0x40000>;
 				msi-controller;
 				#msi-cells = <1>;
 			};

-- 
2.53.0


