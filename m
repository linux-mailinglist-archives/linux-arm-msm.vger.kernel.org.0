Return-Path: <linux-arm-msm+bounces-90658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELczMvRmeGnTpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:19:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C690B04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 328123012E8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5712BFC7B;
	Tue, 27 Jan 2026 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7HZ+8Cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baQMd4e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8B1D9346
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498324; cv=none; b=qOX3+GUuMwp85Fvt5K7Lu+4pcLTahguvglXOUKPFymepiqR5ZDNc21Nwtaciz6jT1yqSjQiGzOzhE0ysBY5vx61ySq9kG9gWv90eeyNhDK8fjAM0OsL2fZcS1URsUDMThpiHJt49XJM0ToInS9SwaYwBbSSsBM1xBpjCLnXckro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498324; c=relaxed/simple;
	bh=u/gcLJpfpJxT/pi95+CXFpFlJBn2QF6Kqdv8Rf0Lsk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F++ZzCcMH++6OxzaWvaZoGnEx1qOhGVMBMcxe8l+LeWUXpTjsmwoY094gm4AxKNaBg2c6avGYd9/zLr022Cjsa2WbJrZ3SP6p/We2baVxY7izs9k5diRkz6F/1f1u/neRGwxmvjPBprkYMMEU3yWQrWaG+OR8mvxi7c1qdY43Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7HZ+8Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baQMd4e8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UTJY1900665
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Tsmmop7/zsQC4lFClI1UApD+zoiGQHA8odp8ezZQZI=; b=p7HZ+8CzaI3rXbfw
	1LgBZoUi6z94UUq3plrhy4VC1Aoasq+n8UdVD3n2KNPT3P4H97jveFvNA7PjDdlG
	VGXwVADM4LEZITQdSVjveHc0phVobC6BamvBiImSX4RQb/Ofs2Gc/WRrgExdEpNj
	7xLJm1ZobvlHwbRvQylA5ZkIqjGWum1Ht28r52KyY+7EHhEP4STQABojyn2t/78n
	YSdHxin0A5hVnYfyLsMVIgP24cj1g1VFj67B66l1Xfd0ll/MeJKZ8o8wcANgSPIl
	+PQLERY7AlREumJTXalRT2toQWTqUq1Oskn3lLhj5vm9z8A5Vtdbt4ss8BCrXpp7
	MnAGEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxadptnuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:18:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7a98ba326so58982975ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769498322; x=1770103122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tsmmop7/zsQC4lFClI1UApD+zoiGQHA8odp8ezZQZI=;
        b=baQMd4e8XJVNl/RBg2lvgizrvDGmPzwbB1d+QLEewSu4mVeUlHC9J8BgVok67W3Cvz
         GorVw8isRuxbKv5JLNG+ORSzZWrltWCDyR/tM0OdKE3nXqPgFISAIwKz4GI3Bd1H3E4D
         lQ1K1KbLXru5FOy2IxCOvPKYwg9PLB3S7ZltU3O1io1oQOAQ5KaTqpuSaN0hQC5+AQOt
         vFGxS/EMP5sgZ226yum5Nwe+fYo05QBjV53h7eYjDAUwP70x9mhChaR7NM+4jwmTDXjn
         ZWbcTdpGYLIaku7kjB4zxkPpaasMva8rudEMq+Anzvfy+pO5RQEcNtyA7vJprEkrxYSF
         diGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498322; x=1770103122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Tsmmop7/zsQC4lFClI1UApD+zoiGQHA8odp8ezZQZI=;
        b=lwbdLb7OAohxSG3PFEjMD6+LpVYrpBZlfG6xURF7r489p8sHLkE3aMprsayaH30sZs
         WBlQNqOspN9ULlwbz4On0X6etk/WQlNWn3I/4BfXio/PeaPdvEJyiZGZAPSkn+DAINCm
         mCX+34kHDaI8QBQSDC4IGq00+cvcba6Mxf6yo4BCePhQmMtem262kee/nZ7/ppPNh+dy
         PUHAvg/JkLtrqHCe3GMhGgeDfNWSPOc0fxbX47z/w8Mqp5ZtT5JWZEC+HmDJFcwy9pfF
         7iExg3tmzEkMC404O+6j7qittCAGCBiVRuUajs1dOLF7ERWek+WQpLxvYr8x7cA5Gga/
         i7/g==
X-Forwarded-Encrypted: i=1; AJvYcCWJU2VCKv6Ib9QHTpubYxGKn0dvRYRW2HYTWsqYH3FaMKVRIQBE9aas2w3Kj3mJxhAuoofWfi1RdMZG+bP+@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkCjGEzWbcNFfpJzMclzf0cqkiRriN47txX/hpYVrLNS8iFY3
	Ej2R8cDVOWM3utTYPtPmgDRvPL+6e815L9MtinE6gvrF6oDTamBOF9YvZu4/RP3991u1oEo6FZZ
	+LYgVOMOWb6ID9OA6xzWPbIKqwkb4LbhI/f1SRYnVn0/SBPScAUsZrlexPgFfcLGoKNeg
X-Gm-Gg: AZuq6aLA548yuCS4w/3ONB0o5c5osZwGxJUnxQ5ToDM4+uxyE8+Uo9GhiW7aor65s0v
	t12b8Eu/qFPsa8wgzKQD7kAKTH27hfsIIwbSDmy6GwNqVWDlPz72T5tjSlhr3ZajYc+djtc8g31
	s2A+cD66tkr3Q7Z8OJ2P7UjCLjppJxiimS2c+VwQGMuLd6qz5hcVHEju6EW8J7OBKOrSVlB3zog
	IkBE2Tn/F1BOTXOAwFARCygCeJn0FGWEbn/K/HaDJChUYh6pAX73/76rn/CP76OsDKiY+zXpRMJ
	J2XKkrZG9kWfKI1bxpSZ7kmDr9aXKWaLXS2vsgityf9c0r5pHL4NlYmVqg3A2JD9KzzDwtGzpj9
	o/zkKk48DPbhzz/w09N7Pk6f8AQZRcFFwDg==
X-Received: by 2002:a17:902:cf09:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a871272221mr8527205ad.10.1769498321727;
        Mon, 26 Jan 2026 23:18:41 -0800 (PST)
X-Received: by 2002:a17:902:cf09:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a871272221mr8526945ad.10.1769498321147;
        Mon, 26 Jan 2026 23:18:41 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a817f21707sm88084525ad.28.2026.01.26.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:18:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:45:49 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: document the Glymur GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-glymur_gpucc-v1-1-547334c81ba2@oss.qualcomm.com>
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: CzUAsbQaqED3rdeu4_EElFwB0QPK1vvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1OCBTYWx0ZWRfX0s2d9TTi6aGo
 i1QvOpvLuc4nnY2dTQTKjMCXWuijNvwMM3ch8ZhsM0pHLv+VGCbwePjiLojazAfoyNbX2XC378K
 wYslxu2+/tKvBa74GRtnKwr/yJLqOeW9f+j9ILW6XUj3J4XhgqiRswtBskdkyjoaK5wFwl48mRK
 PUmioKTyuU8U/8kAdJq9X0PJ7KUMX1oV4tvoQKnrdcM5bGY1yf97e4bLfYgMDb0eTd4gYxNnZVM
 imEGA63obieWy/AWgLFkrGtRn3NBPXATmE0SC/qS69jt7agHVawM4ZDNaAAqe/y9klfuu0TaL/w
 uW8pZ7B6ia9R2jFeYrartG8Gzo78CJn8FpvDTBQldMvVP7kvXeQUGxBBSB50PZzieeDJQA6n80O
 6axVc5piFAzraouUz+UFoCyNvdm0tn3ZSjkhlJP925KL8V01ftj4OpOYWNK4SF6LwZo+YMvbVMb
 LaR9ao0BN1n/Pn2q6+A==
X-Authority-Analysis: v=2.4 cv=GvdPO01C c=1 sm=1 tr=0 ts=697866d2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ybfv-g1EFY7sfChbOUEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CzUAsbQaqED3rdeu4_EElFwB0QPK1vvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90658-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F1C690B04
X-Rspamd-Action: no action

Glymur SoC has Qualcomm GX(graphics) clock controller and also the
Graphics clock controller. The GX graphics clock controller helps in the
recovery of the Graphics subsystem.

Add bindings documentation for the Glymur Graphics Clock and Graphics
power domain Controller for Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  4 +-
 include/dt-bindings/clock/qcom,glymur-gpucc.h      | 51 ++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 5490a975f3db7d253a17cc13a67f6c44e0d47ef3..55bf3f8110171e9d14a2d0f7ba8e0089a31177cc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-gxclkctl
       - qcom,kaanapali-gxclkctl
 
   power-domains:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 6feaa32569f9a852c2049fee00ee7a2e2aefb558..5993804c91fa564b29f8dd0650c9efad498f543d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -13,7 +13,8 @@ description: |
   Qualcomm graphics clock control module provides the clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also::
+  See also:
+    include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
@@ -27,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
diff --git a/include/dt-bindings/clock/qcom,glymur-gpucc.h b/include/dt-bindings/clock/qcom,glymur-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..35f5abb848fd0349137e2eb5b4c58bbf095a821a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_GLYMUR_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DPM_CLK						8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_GX_ACCU_SHIFT_CLK				13
+#define GPU_CC_GX_ACD_AHB_FF_CLK				14
+#define GPU_CC_GX_AHB_FF_CLK					15
+#define GPU_CC_GX_GMU_CLK					16
+#define GPU_CC_GX_RCG_AHB_FF_CLK				17
+#define GPU_CC_HUB_AON_CLK					18
+#define GPU_CC_HUB_CLK_SRC					19
+#define GPU_CC_HUB_CX_INT_CLK					20
+#define GPU_CC_HUB_DIV_CLK_SRC					21
+#define GPU_CC_MEMNOC_GFX_CLK					22
+#define GPU_CC_PLL0						23
+#define GPU_CC_PLL0_OUT_EVEN					24
+#define GPU_CC_RSCC_HUB_AON_CLK					25
+#define GPU_CC_RSCC_XO_AON_CLK					26
+#define GPU_CC_SLEEP_CLK					27
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.34.1


