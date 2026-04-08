Return-Path: <linux-arm-msm+bounces-102336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM3EFLdk1mnIEwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 16:22:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF13BD9C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 16:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF47E30ACD18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEB32DA75A;
	Wed,  8 Apr 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPk1ErUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTRuX8ie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D34E3B19D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657769; cv=none; b=ZBN7iQuo3L30TlR1uZCCyPTtIfUaxPHF+TT6EBefHmeG+wbRYyeV5D3+GuNYKra+SOSsoDT2JRYCsEnaMZBgw6ssLHqoL3xE1QwehuxqKuSdTCbh8CbQRT2Ilg1XCkOP1PIGq4gZGK0wAP39hmoamhxf8Jucc216gDu5b43aJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657769; c=relaxed/simple;
	bh=kHzuLPUltd0bXrolfSiSxBpD8dRl1Wvbyu0ExBHkXN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDsgCvbBlHyBfN5QUBHTIxokmmruTyIFSVCT/Sejfi9GPdh1bTg8D4UP2Vnjm8T737NRyUhFUw4JupwLlgPQZA/E8g6YJ3RQMJeW4S+4PBJCzb82ccXHIo0q6If5mCn+v2TE+5vrtgUEofW5r2eXXV2g3vI1qnV6oisAfzJbrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPk1ErUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTRuX8ie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638BOaX21619593
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 14:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7vWGvulMsWRkxYff9fp5OjDYmJ8C29b8Y2wyY8D+UA=; b=UPk1ErUqkKwHqrv4
	KN1Y+9lig3Xk5iPvGD/Il2a8nu6++KXP4vfbmqIMHirn5cQTlg4FgwqrYFNuaeN+
	u6JkABeNPzxqLNNAaLlzmorbjZOZ8JWx3xP1zT9KPbWqVMuFpjjg7BzYYRNuCOFH
	OVdnbR9wygySMBEqRYNDYHjziKMUO852U0gl0UiOPqfMExOI1yuLs8jVZB2Hir7k
	9Bh0qh7L/yu6Xm4sSHmUby/HL4yhWY3vvMye8M/R4f3DA53E2kXtZBMy/Jk+Rg2O
	cSUdkYJTPK49sHhDKDmGszsF/sQjxIaegfnIoeXIuYUln0sbiRhs8bFTJZ7uUEES
	TLkcnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrk519-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 14:16:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so1031225a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775657766; x=1776262566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7vWGvulMsWRkxYff9fp5OjDYmJ8C29b8Y2wyY8D+UA=;
        b=TTRuX8ieJgykPyWeyt5nD9WZ6gQ07eboZ+RCmowVzfXCcByHZ16f4OrNWNGwGbjhhp
         IsQpKgloO3RUbP6Wuuw+RUV7gQqo1q2t4FiXHSoC+GWXvnplrhhrhM2Pl9KOlB6M6cwB
         HikA5QI+gDcnryIsBqV17sml7f3vBiPo6P7QXumkRdq7NvjNOmEEBnAVYzc2LDQoYb0O
         xglHdEZAFKXVP2joNyCgNGlvnxw88xidbX4XlGz9IKheAYNu4+zCyF0ADgjEzEX6yzFl
         InHEMqAHNZLSeK5XH3v1m8ZM/u+/sscAkXY+2ToS9HvCZF23PE5nTWYeTyJMInewfDji
         Z85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657766; x=1776262566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7vWGvulMsWRkxYff9fp5OjDYmJ8C29b8Y2wyY8D+UA=;
        b=oXCqhs+94U3zx5wffz5qL0yilJQiL1SzOIcAxWI5jC1Kn3a2v3m2KKURmNUnDftdHj
         dVnBEw00Rch3+H2OqMj0+CMUwU183tBparHnOxp0iVYVc1hcOt2LF8EqJLf76UjnzhvF
         7L6AHTJ6jkTS5TSPLwGsisAAM3ruvp5PwYf1Eib6Po/aCq4l0G/3PwbKME1b7BIuEMEX
         onJJ3nBB5tvqnNQ8TMwYJR737D2AwGQPCih2s6t05c2d5JnNryBom0uIcdZcNVoHlh56
         PUajAC/DHcD+EzjLUDRsnhE0N4PfUT7F7e2VLiHOiz5K0Wj50jnZs4VP2q21u8nh/M2j
         khTg==
X-Gm-Message-State: AOJu0YxxLZiwqhScID22BmxjAeeGbeTrGgbO4J0HOi7qyTU5XG0HMZXs
	Z16JTeRicPxcJxDnQWFXpRIS0STZdZH/DAiGlImVjjEN9xzF8HQNSj3cacS/k0Kucnd+kazHDNM
	ATxTuwIipiFtOxY+nVUwWNnOjzq6IbkdamPSPeBJx6RZ6egshOdCKDEWqMKz9pnQ2PCP4X9vU7a
	SK
X-Gm-Gg: AeBDiescwdwpsL+GyfWwyKZWhF1RLFUvxi06lFaSzxv721DAHiBrIf6ArKn5EL0zwiB
	0abWjAT1jrlTZJMx5yl67GIdPh3Jh4cn3ZAn62KAU5qfeoR15gfuHrTIKuVaRAlqqSsZeiVXCrR
	/v/2x9Jl2RH3sEL1iCnu+rjRoBKzWiGSWRIqUKwQHrHC+BNMOH7nA4rtMqfsxTIxIq+jpo6i38w
	4PN2LBlT4uXF5dlY8FE0bPns9E+XWsQoTjmOqiZvcWnTGzj5lKDH1czZDo+v7vPyTwpgj64KaZm
	BUEiSm2TrvPYfrw8dnuFbylnCZBc6CkDeZf1FKnIsrBfwLDEf2iuASBBoy3ilKFC88ZDx/5p1kA
	YQ2MnMbocW7cqdswDFCd4TEUC3TUj9TVIV9xyv06Sl0kKaVop
X-Received: by 2002:a17:90b:1802:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35de597275emr15655102a91.6.1775657765465;
        Wed, 08 Apr 2026 07:16:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35de597275emr15655056a91.6.1775657764854;
        Wed, 08 Apr 2026 07:16:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm26261851a91.8.2026.04.08.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:16:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 19:45:47 +0530
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Describe Hawi TLMM
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-hawi-pinctrl-v2-1-fd7f681f5e05@oss.qualcomm.com>
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
In-Reply-To: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775657757; l=4827;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=kHzuLPUltd0bXrolfSiSxBpD8dRl1Wvbyu0ExBHkXN8=;
 b=Jnu4jyweO2IZniw/0pJz6wkk1iFmztPrXFsCJHhbkgbsgJ5hs8JRuJdmSVhab2SkklEhM8CXJ
 9+CdKyMDMiODroP033Ta9g3+NSSfkeI8bE4V2Ahb2iyTAtr5XhVkH1b
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: nq6FMbiwx0pGHuwunHGKLVm7-t4-X6vR
X-Proofpoint-GUID: nq6FMbiwx0pGHuwunHGKLVm7-t4-X6vR
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d66327 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzMiBTYWx0ZWRfX1+PZpIpFCE/u
 eyX1EBXg88s4rz3km5Z1MRH4RcEadSCdjih65RNfhxL/OSZj9xI+3Di0bjJL9w/rYh11VpJWgzk
 aRSNo+Lr4BgzS19WtiW8rri4puwEpmSFO0vLgsXm9ExLO16hTkXPXaleYP6DSSwRh08u9q8q4fh
 hIPDFisgIFEMrlx/1NXI0e54cj/f6C0pE1tBipGgNs//1dRdl5nJgos1Mb0mCIBLoM1XSsI/TXR
 4bBYoI1SGM10insn+iKovZTZGimS9JdQqUqSMH/Z1LFOQ8ie1StyiGf1S23e8CsK8i5hjruCYOq
 KwalBYeUG00SxmtCde87967Y6eTKQwJZivJYnsYLwU6sIrIX5OdQk7acQZcbmdnRKc4ADlIO83+
 QKZ19z+Ot1f0a7dXCfG7E9uGbYvJ5btkx5t0GnWNh3fw0JVtIAElYWa8FODUcadgrALipULqjoe
 n/FnjpRFqkFvXg2nNOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,f100000:email,devicetree.org:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102336-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BAF13BD9C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Top Level Mode Multiplexer (TLMM) in the Qualcomm Hawi SoC
provides GPIO and pinctrl functionality for UFS, SDC and 226
GPIO pins.

Add a DeviceTree binding to describe the TLMM block on Qualcomm's
Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
new file mode 100644
index 000000000000..3b3961789860
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,hawi-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Hawi TLMM block
+
+maintainers:
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Hawi SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,hawi-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-hawi-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-hawi-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-hawi-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c0, cci_i2c1,
+                cci_i2c2, cci_i2c3, cci_i2c4, cci_i2c5, cci_timer, coex_espmi,
+                coex_uart1_rx, coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi,
+                dp_hot, egpio, gcc_gp, gnss_adc, host_rst, i2chub0_se0,
+                i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0, i2s1,
+                ibi_i3c, jitter_bist, mdp_esync0, mdp_esync1, mdp_esync2,
+                mdp_vsync, mdp_vsync_e, mdp_vsync_p, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+                modem_pps_in, modem_pps_out, nav_gpio, nav_gpio0, nav_gpio3,
+                nav_rffe, pcie0_clk_req_n, pcie0_rst_n, pcie1_clk_req_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink,
+                qspi, qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2,
+                qup1_se3, qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0,
+                qup2_se1, qup2_se2, qup2_se3, qup2_se4_01, qup2_se4_23,
+                qup3_se0_01, qup3_se0_23, qup3_se1, qup3_se2, qup3_se3,
+                qup3_se4, qup3_se5, qup4_se0, qup4_se1, qup4_se2, qup4_se3_01,
+                qup4_se3_23, qup4_se3_l3, qup4_se4_01, qup4_se4_23, qup4_se4_l3,
+                rng_rosc, sd_write_protect, sdc4_clk, sdc4_cmd, sdc4_data,
+                sys_throttle, tb_trig_sdc, tmess_rng, tsense_clm, tsense_pwm,
+                uim0, uim1, usb0_hs, usb_phy, vfr, vsense_trigger_mirnat,
+                wcn_sw_ctrl ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,hawi-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.53.0


