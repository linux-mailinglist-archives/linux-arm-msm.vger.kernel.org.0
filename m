Return-Path: <linux-arm-msm+bounces-103230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC2oD0Yz32lqQAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F2400F24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1696F3044D04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 06:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502303914FE;
	Wed, 15 Apr 2026 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6llO12+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5503909AC;
	Wed, 15 Apr 2026 06:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235248; cv=none; b=XEifBlT1hX3krsfPsgss5AUlhm4EgNfyVyGilG82ivpqlZzX0m61YzhKdU0NGQdSBVEl5jqp0vi8PcIJsRrzI4TA+MEqZvqnyHT93jyukxcdGi9huY9cqe2NxqEVddd6gN2YCm9917cZPZvtxC/tvV1dJ7Gdn/XoasyeS8jV4rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235248; c=relaxed/simple;
	bh=sIZukYp/MC9yiKpZPIf9DyrYXHRDrgr50n9fS4t8Mvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J+yq5iJqAHm1rCsbEujp6283foRa9ABUYM8FzfmGE2GgWbn+gpj/sXfeY/JiwZdFXQiqA7EgHEG8T11ckInAbABV+fizN46nDbZN9ISFnV7bIU3NP86GElAeYVzyDYCN9QRQUTQtKfCwGfqlax6STUeS97RBqDmCPLKupwMnWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6llO12+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4866C2BCB5;
	Wed, 15 Apr 2026 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776235247;
	bh=sIZukYp/MC9yiKpZPIf9DyrYXHRDrgr50n9fS4t8Mvs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=H6llO12+VeDFIIUkYxwaWB4uyp34T2dL3ObqG83XX1ah7B50s6bHXcsnvaoeyFcAZ
	 Q5W5hBmE+9b8mJfvEcFpXNCqEwwE7xwQ5Z7EX5MVwhHDU5qWeK4Slxybb3w/psg7Xf
	 QvVDrUn3T53gw598Nm8ooJZr9lGh+ixSfuU71IAWtecABEYt5XNOtK2THGsXh+YzGC
	 Nr72WAdHCFcyYFrIq184GCA94DshlVWve4cqPQxgLV8NvYC5dEzJx47sWUh8Xl4yRD
	 eyzQV1PX8Lo0KKa1IeZXmRoox6cYByzAsYj2XTZor2ziDV55UdN/GKUJH+JkN8Gty4
	 azCp07CToqXDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1B8FA0C39;
	Wed, 15 Apr 2026 06:40:47 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Apr 2026 12:10:46 +0530
Subject: [PATCH] arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0y32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3dz8vMTk/PSU4gLdlCRzC9OUVAMLg1RTJaCGgqLUtMwKsGHRsbW
 1AFZZrDVcAAAA
X-Change-ID: 20260415-monacogdsp-db785de080e5
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com, 
 quic_chennak@quicinc.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776235246; l=1445;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=/EG/yomTV06O1VHp8itajNVeYotdDNN6kgP9T9ejF8I=;
 b=AnuUg5syqVnJpw+A6G+a6GG6nuPAgItZu+FyhX/IPzcS5wvq+dDEkVCvjc9+Oqi1t/cc9VFx1
 DB/V0xJlfzOCUXtJcBwccHRtOWufMsq4/0UivfWq4LxYE3xD4zCXNYe
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103230-lists,linux-arm-msm=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,0.0.0.1:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8A7F2400F24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Add GDSP fastrpc compute-cb nodes for monaco SoC.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..ce6ff259cb4a 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7615,6 +7615,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "gpdsp";
 				qcom,remote-pid = <17>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "gdsp0";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x28a1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x28a2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x28a3 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260415-monacogdsp-db785de080e5

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



