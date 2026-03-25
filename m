Return-Path: <linux-arm-msm+bounces-99854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pb6JKrKw2mVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:44:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5133241DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7E43306DF59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE603CF054;
	Wed, 25 Mar 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxFExful";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgrcIs4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38D3CCA1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438876; cv=none; b=ZYlCih/rdAukQ2JT16Nu0qf3qNc15RTdpz1Gh6snnQsmPbYaCeI/0+OEJ/yVLI/XgVzlM2hsemeD7pTI1S0fYAGqeh7HgcOuwBxbjUY9MfqyaY9OfggmOBD85f1welyQs5ou+FNNefoRoF5Kt1/loqaROeqVMoySdYheUh9Khms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438876; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvzgxKnIqyArc+DxoindXpz224Enr5Ac8+6PHeih+Oyj3GFoWT7u788c5uyuwHBY+vcUnhxTFZyWDP5yHq/sDrxvSqsGfvNPgEDEZoViRUcHtiYisZclk9B8pxmND5bYbksdLEpnt+qmfcpbBAlKC7TYZokfNAZxaF1vfTNE4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxFExful; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgrcIs4G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGT951895529
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=SxFExfulq98ZuKSX
	tZ2c7Qmr6fFDjQneqq4dAmfIQzMC2rRpJwHB181i5pk62Cu9BzHmIbqxxZQWkjAs
	4ZU+u1vWDJYoSHWFDO7TKs6vOFqom4QwTcYZP/ThQrT7V5L35GDAr1d6c3VDI8wx
	LlXyg+OWa33BzFlD6wHaBB16AAmiPCoSYFrV5Uy8V4g8GUkR6/mxzp7DIM/xzDiV
	yfCx3/1zPmXqJRiQWLUmCa6XJYguOjuAn/Pe3XqhGrfZmc4wWGDS1j+QnpT68OAT
	cmaYr0wpwyQX3zm9Dq5lxQWFQJ7ZsHIFF/lxvN+mCOI8L2LTfapusqBDcMO1j0Di
	XcAjpA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhkv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b059ab124dso68962345ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438874; x=1775043674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=GgrcIs4Gq7GMFc/dA81ZKqkySiapNtinJ340AjCToOLmcVg+bRqYicvDc4qLweEaZe
         Urmv5Xb4Grao6IG/f+DVGIdy7lXmvaoFoKydqOcT7dugZFznT7JLUMPJ3hsEPDMss5kX
         mrccFSAjQJ72vOOFDsG1MX3OrR4vu6X18B5IpQP3VqMiqHv13HT1RvJ+fVWDK5ArUzV2
         B7qT1CQJJmHnIfK1rpjLBrLJtNdqZYdYibChoGB33Nsx51XhowD4kAnf6wItnIV1GPGA
         Tba+ptlGqweOmpsOPxfC2y8724NxuKiSRN5PMTGrRNgUfAicgzAZLHziX/QuYZ6hf2hh
         8Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438874; x=1775043674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=Nz8BHsXRlurOf9ur8tBp3oxAWPVf2nrIP3jCL+njf7FRSHyRZygS6wzsodjwU8hsT/
         2PkBFIBTf3GrwIwr15EYqaR6bRiibN2mnsDcLO4sJwUOnBWhAYZ5Z7WpvzLWYJUN/zlY
         eJmIhnDIgcVhB6+84Tl1XNRCJMuW/ZVziUJeDsYSJ7GKFjWkehCoMLPKtab9+dzZhcnw
         f1oMNdVswPp/b3XiRXZ27qE+WpTLkPLyP6RQVqA2w2ZtMiObLKfiJqbqsBXYm9PdBCVn
         W6LL/hdYoyiJfcKICkHEgIUALRq4BZnPxyzymPwJp4YmGIDYVUrwGMSpLTOv+BEUFoim
         5p2Q==
X-Gm-Message-State: AOJu0YysPcGg6zLgu9XCKESgQYK9XeDiIJf33G7AQ2x/SAQYlauEYFO5
	TM0XLF3qzmsnswWqQJZweOQtA/sG+OfKysTaJtVDjEaPl+W7Oamnuk52ZLlQtLCzSKnqVdzx0iN
	NspmsSfoiXUJkFOTB0FKwy5sD3S6VW0mB33UsKvqomcRvSGHRFg0zhA6RcuoSIDizOdlU
X-Gm-Gg: ATEYQzxB342IjX9lrn3fsZ4hp7F1AAjhv9yCal+tl6M3E2yCfwpmQ6/wqXLLPwajzWt
	7W5Mxa6/x6HmXaGVza8Xb6mX0NoDDiKd0v6edaOzkz/rXb9103NhyWDS1g6QwdOB6dLNlqWiZM8
	zMDu7RSij78LBToeNodGOdMMIPvqzzCiKuc4Df+kATomnz3jBpeFTKlG/gkxyIVixa/3dIPCunG
	u2ulibRmictclzsbQxbjO5la5qkPlWRsGGCavIyRoVUgM4+Fci4brg9hRnmjvy3JQRpGwVTzgOS
	0IqqXUS+ECAaK0mexRk2Sih3RQCPUKYJDnutNxXd3LhpM/YDqZxdF/h0XsKNimoDUE/y4bIwr/1
	JUg741Ex2p7GPCL8XCkbj7KgBQxI3hJ/RsDqcFCqAbq/76jAc0OI/LF8d+dD6PdEeCyRNrK8BsJ
	KNNgG3zpblpzzFrYdHA6H3kvLGYu4NgfSsNQ==
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr36671735ad.10.1774438873617;
        Wed, 25 Mar 2026 04:41:13 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr36671265ad.10.1774438873121;
        Wed, 25 Mar 2026 04:41:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:51 +0530
Subject: [PATCH v6 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-1-a8e888d09f0f@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=B9ryd+vvxFBe91fPiXtBVsao3vJGX75CubyOgVKHhW8onikmhOqcycrY1iFvnvVmd18gEPdp1
 7Bw/TAqo6hjCXi6GxfeHqku/7ad5QyoUzQvGWdonay8KioiUUuzHd/n
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfXyK0p+0I2fZO4
 945lwaXai0WeEKavxYv6sz1KLopACA2XyBHqVCzrlTCthqF3e8C/V9IVipdwddt6XLEX+YJX/6h
 HUH2vWeR2INTCXJA0qQhqpRPO4BignJPOkUVLrkvwfCeGl32osu7zMnclYUvghvqwmmFur//gvq
 WnMv+JxHJ0TR4XeFZcta0krFStI8wbvKnO5E3xDZPi7VZWBgJ26T32sMrLXna4lJTcEMcxsgf8b
 4TNhffiy6pceuPbz7Z9Ezmj0qlkTpVzK2KqTPPR3pEr8z5DK/g4Me7P1fOG6AZPa5MNXM+FqRmg
 h7tlwxBlhChGCaUicGMhKHiV3bqeEQLVT4iPjd7k+fnJK7SEUJlHGB/5x9Vcr15tS0bVL6nMPJ2
 /TD7sZum/tlxHcVwOhJwO/F1HL921zuh5EQOYqKTwapNYsq9ktFaq97ICtXSHhjPu7I09rbMgwq
 iRsWlXWTDuo4rL8mfgw==
X-Proofpoint-GUID: Jl66syoeWcs2bAAs_YZK1_PZjaPbrTrC
X-Proofpoint-ORIG-GUID: Jl66syoeWcs2bAAs_YZK1_PZjaPbrTrC
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3c9da cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-99854-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.76:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A5133241DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
new file mode 100644
index 000000000000..ac5a08f8f76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on different MCU chips. The EC handles things like fan control,
+  temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-crd-ec
+              - qcom,hamoa-iot-evk-ec
+          - const: qcom,hamoa-crd-ec
+      - enum:
+          - qcom,hamoa-crd-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "qcom,hamoa-crd-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...

-- 
2.34.1


