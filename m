Return-Path: <linux-arm-msm+bounces-98207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK0XNKBruWl6EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:56:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA802AC7A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E207232986BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41743EBF16;
	Tue, 17 Mar 2026 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0/eh4n9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032C301016;
	Tue, 17 Mar 2026 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758512; cv=none; b=VpdFPgj1oC0oi5ozoWNzXFDxZOYJgzRH5CUChusDKIMqklibnJSmN46y7sqfm6HnyXSdJNez8Yw3mFSzyi39Iw8zQb+yHweJsNuz3WKjxZWCiwXz4DSKpG8O+FxB7adnSqidQ6Ypq7gOrtUd8gruNOpOuq06oT0VOIXvxQFA+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758512; c=relaxed/simple;
	bh=z3YXx0LCjH1mJwUKyn7MRhMVpiIDBfsko6DnOJNiokE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPsq2obcYdwIRlG7NVh95qup03d6DyQEG/ZMGZTp9pIs9wQjNQmzjqKYuQ7EzQdApDNpwCjVruAzsVWvKGEcEAWaDyYJRqbnUwBE6gaLBrgMh4HtJrBqdlJ+koieEzt6MBHJt+H/c1a5LwR6hnJDZoZRB3o8H43UyAlYqMHfHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0/eh4n9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E691CC19424;
	Tue, 17 Mar 2026 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758512;
	bh=z3YXx0LCjH1mJwUKyn7MRhMVpiIDBfsko6DnOJNiokE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O0/eh4n9sW75qeM9vEldSMlfyqOJ1Vdc7hc2xfrxMTAnjRW6cYWDyZdRoUf9ntQiv
	 ssQwgJmN9SzktHE5jWxFIvxxhJDhzwb/lAt4T/0erPOogrpOkdOc1g30P+cmygrNTS
	 Pj08N031i6vjtcDI1ldjcWUki0Q3zUn3ZjS7XvxVoLjim2gr9Ds/RarJYU9KopzTaG
	 1d2/W0yDPEzLgMEvCgev2Q6HWZ1npVADdUw16hNcxL2XBQ6+pm8BsluZ2++Mic5pZA
	 l2Z7sJiIjM9VWy8K+zL9uC5PdFgNXcPQfPEcApZ/s0JWk55/ZAJ+ro7bpwrKmgJCg+
	 SO8FByygcKbZw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Mar 2026 15:41:19 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: sm8750: Fix GIC_ITS range length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-topic-its_range_fixup-v1-6-49be8076adb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773758475; l=796;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XbcnE3Jrn4Fw+kZkercW8VwU79ST4EZI5xCdtUdrmBY=;
 b=k/VS0KyXrZyj9GibgdD7zD+MVtRVwbzHKzjCOe8JPFKIb8HbxkeFCB1rGDpoBu5r1QQ+fvRDS
 ZulPXZlmLUAAIOsahEKYtVAhcJQIitueYlBIt/Euzi0RujYQ/ZFxUqC
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
	TAGGED_FROM(0.00)[bounces-98207-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.244.36.0:email,oss.qualcomm.com:mid,qualcomm.com:email,0.244.192.64:email]
X-Rspamd-Queue-Id: 4CA802AC7A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the GITS_SGIR register is cut off. Fix it up.

Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..04d47f1347ee 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4658,7 +4658,7 @@ intc: interrupt-controller@16000000 {
 
 			gic_its: msi-controller@16040000 {
 				compatible = "arm,gic-v3-its";
-				reg = <0x0 0x16040000 0x0 0x20000>;
+				reg = <0x0 0x16040000 0x0 0x40000>;
 
 				msi-controller;
 				#msi-cells = <1>;

-- 
2.53.0


