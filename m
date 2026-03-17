Return-Path: <linux-arm-msm+bounces-98202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG9RJXZquWmZDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:51:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 915412AC5F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A223030437D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82563ECBD6;
	Tue, 17 Mar 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7hGVevM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C7A3EC2F8;
	Tue, 17 Mar 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758487; cv=none; b=mE0EJyWZ90TqWRmkkGvvO4TIRd5E2t2XjJtK83m81cQdWNIs7IMlhjcSn7t6jxzF/skAYm4Rr8ehgZRcnFlKXDd7+rQTClsSJA3Lcsb0ufGfpwMev0F1WfBFDKTFATs8efoNSUcPWlxBtB3CUFI7PT9jKRh6FLE6ryTebUwEqtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758487; c=relaxed/simple;
	bh=k7nHZzZufqsYwm4qn2gQPm3HsosqnZMcJUouIGo4gxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pacQJ7peDBWToRW0/CEZe1m3mlVcCAHGTdYch+kIbG6Y4ppJxbWsIwE1JyN8Pd+zNYyGvmJmSmEbJBMwljRVF+DhjCgzjQt9v4SnZvMXkpAa6E5pC5Bdu/0ACuZ8o160//hoWWiXZaCkhmHiSOnqvZVnXhnh5hGEGp+dxw46fVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7hGVevM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AA0C4CEF7;
	Tue, 17 Mar 2026 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758486;
	bh=k7nHZzZufqsYwm4qn2gQPm3HsosqnZMcJUouIGo4gxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p7hGVevMiO5BzL/snJgSH5+1aeCDyIrJwxYtR6W8IuQUEg23trHTRNi7wt3NGQiCP
	 SVmd0rdRWErc5pLpOT8kcjw0xLwnrOCQWqe5Q0WH+UgmwApsIHfJMaUpzyZ6mmw8Vf
	 cP2JojB2aigW/bk5bENg09PSx+lLJqpp0RWeYbe5S3Jq9pUaaXPA4CU9kpVD30JYlr
	 1+PaKj6UAg5yl5DSOul8il4KX6DU3LO4XnCsZ/da8c0oOJHMx0BRxUyE2hRw1bAEI+
	 vUWYpF5K5Eqy7nA2aGTDYlrUAhYQes3ewq0UwUIrrQZbWI7LGkhulJOigKMw4/kwrU
	 VZrycg5qGRzzA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Mar 2026 15:41:14 +0100
Subject: [PATCH 1/6] arm64: dts: qcom: kaanapali: Fix GIC_ITS range length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-topic-its_range_fixup-v1-1-49be8076adb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773758475; l=814;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ov4JGQYUDS+7Tz5X0bnk6/rOwa2yospE72rnBNVtDkM=;
 b=bUtJEV/6diiMyj0tbZKIxrdrbRFP33tkhYDOI7Q8QN1BdqONs/0XJ935ydSkVugajh+KzK/1v
 MuprYFe3Bw3CAFZyLxsEFspwbcMgTmxO/KaM+A+sgUKCUYQOsPghkCV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98202-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.4.2.128:email,oss.qualcomm.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1.3.102.64:email]
X-Rspamd-Queue-Id: 915412AC5F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the GITS_SGIR register is cut off. Fix it up.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..9be86479ceef 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1239,7 +1239,7 @@ intc: interrupt-controller@17000000 {
 
 			gic_its: msi-controller@17040000 {
 				compatible = "arm,gic-v3-its";
-				reg = <0x0 0x17040000 0x0 0x20000>;
+				reg = <0x0 0x17040000 0x0 0x40000>;
 
 				msi-controller;
 				#msi-cells = <1>;

-- 
2.53.0


