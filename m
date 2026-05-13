Return-Path: <linux-arm-msm+bounces-107322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Gl0CPqEBGrVKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB96534A67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B086132A8A85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E721C2E6CB3;
	Wed, 13 May 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgHOGwyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2u0Zcgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893243126D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679665; cv=none; b=LXe7CVc8r9y+e+D/ghyhQ0fWFOb3OnOKI0QOdjnENdjfE2WwxS3dQlBAZnqjiErYiPCsa5SRRrYN0WzgCgw+g3fZ/3VnvXcLRggcbpT5iMqysCKzm9lB0qmzUuGlv1wt12rci66dcV7XkiOhk0QEY/WAe6A+dix6VFdJFBMOzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679665; c=relaxed/simple;
	bh=SerrYLkCZYUr0xfvtsQ2ytwhAZ/g+vYA8m23pQmL9nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HObdVZw5Cz5tzEJUp8uC+SQDjJFcDjWe3/RXAFxxgYUGvdh7LgRGUrJU7G8LuETK9v6DfxvK1FL9yBi4vbcLq5av5wdFnawx+ONBbBGkKzvkvopEBOIRfQ/d8dcR4jNSSf5czHbCvy9RANuRMyCMOU3Eem0k6bH/WeODTzfP8Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgHOGwyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2u0Zcgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rLn04082617
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JswDgSjfnV0AZgkGaR61BVdAxtT3/FmLy7VTcw+dNvY=; b=FgHOGwyNCI/jVOTi
	z2KXHSDCODLJYN4LOEy2RsqRVMzIjMstt8RNPPM8g/5QehVwi4LErX7IST7BlLcJ
	7OvBB+HW2nPaLcKIpI7WpKbJf36MkvFVsv4LpwzU/9ALKOYf4ALvMbmlhsoSXcUl
	pS8ygRPE4MPjkFxd1jXV041kjOBPSLkD542m1iINZlylQ9eI630PN6Cb8o8GJVSJ
	clej+LJc54VW5UvMBHIszgqVmXz4/pM9WZJXcrLE9tZ5X3w56Bf/JbfexOErKMvK
	Ok9TkDaaKxUMwq+Ml6K5m+9XbaAamfFMa1lj5O9wxfDmoDo4MV2zbFnNPu9BXcx/
	Hfbagw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e113v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:41:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366122e01fcso7733548a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679663; x=1779284463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JswDgSjfnV0AZgkGaR61BVdAxtT3/FmLy7VTcw+dNvY=;
        b=h2u0ZcgiZYkHXn0XrJV6a93UW8e1TEXgfKiQ+OcL1aNIidhMHXcE4gRuUXhe+Syq39
         6d+io4Zj+WrYNo0uPEz2kwWbph2FAq9qKf9l2Ifiiq78PP+R2Gr0FMPI/k4cnz1uCfrH
         HtwHC70qtlf76UzpxXns8+KsZdkJngmhCC56uxvgjT0LRroYXo6z96pdTyRVmhrUXqq/
         yzDE/KVEjkKHCe/UGn/aXx6BPvSIxCuVsZDUtRnfBm2rsdiFEdyYSh5C0zV77a6uPmqJ
         CVa7BUaDd0WQd4QOhiU5x+wyqFwFG7qwJqJ8QrXL2RJBnPwUMbs2UQ0NASDb8L0zsuar
         rdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679663; x=1779284463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JswDgSjfnV0AZgkGaR61BVdAxtT3/FmLy7VTcw+dNvY=;
        b=PqBBzysAUJL2S4Je1ATJ4FxxP69/dXXvQE0GpIfUPNl2GB945u4LqkPfxAK1V360t1
         EUMsAoQH4ZR0lJtMo94WIRk0QRs7R77lRpuGXL2dy79XPHnzkl7ikvAeiSGTj3zMjKqc
         EnrKL9R1Frzdx19NSuowmeSTb8Ik9Wa3K0bDEpAsS0sIQ3kQ4tsjGdAMZnvsn4+ZALBb
         izY0Pk+3ibQ7JHc1Bjdy4E+jDCiNzWZrwcK/adMENmFZHZidqcN1OsuFd8LNZfgp3jWx
         Mpn/nSbZ4BrTWavccO8kXZaOZjL26kV4aNxvQ/3up4QnOAInqv1licUX33pKHN/Eynuo
         e+cw==
X-Forwarded-Encrypted: i=1; AFNElJ/2j9+uoNR8MrISDKzHHiCqpN9IFO5PVcPjeu7G5FTHKzDysvnKOPW0nfbSdb7FgBuZAo6I6EFI2EubN1AB@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9m0dOqu2g+8Wq2TU7PiG1ifgqQkP8uIxLCYSO2fR0rLtHo82
	Eu6Fsfp0MzCcjHNU9JTn386+D0uTqKnPxrTNCUXQXcKSNv83NHedcMqMzBVmQ5VZPe7Psiliqlo
	yrItupzax2uJP1AFCbvPgQaCzAedCv2gA1xQGPn99BhCDoWObSLLvpYistaPIpdUy8fG2
X-Gm-Gg: Acq92OFGDCfjg5MKqn7C4WOD79a4GeJZbovVxP2yme2xCazV0HFBywo+N1emHRdEylY
	+zQPP7F4ZqaiPcMqY+YyIkA+d88BsLECKMcRSIy3sEG0daG2SchFgNXFVXNRAbUG35hJkWcuSZO
	dkkHcUmi669TOfeBd0mGePn3tpoKjXcLM9qa4EDxeau1vtK5hX1XMB8+IajnkwsTTNArVF6xKEV
	eULQ87YQUoxg1erbrIIoLLd0lV0vAmSO3jgQ2DOgY0CLWl/CfHuhIJ0o4fES6Fp0/wdDdv1izO3
	GsRPeoiukVIXHFcWtYvyB2B8wnB2UW1FloOQQlZmqi8hzsbAg4inXtn+gzQE6Fl+FwzfecXpw9w
	QP0agSVIwZr8BkbCtVW2EMFxhGwmZ9m//HHwc1SPvBgNpXXgHjDBc
X-Received: by 2002:a17:90b:1c8d:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-368f3e5d5a9mr3648999a91.16.1778679662106;
        Wed, 13 May 2026 06:41:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8d:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-368f3e5d5a9mr3648957a91.16.1778679661395;
        Wed, 13 May 2026 06:41:01 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:41:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:10:37 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add Shikra GPU clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-shikra-dispcc-gpucc-v1-2-5fd673146ab2@oss.qualcomm.com>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: y7YLjmrliIfHz2MsCpjbcHLU5OQU3Gbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX+mgk3QgnllsT
 zm4THSkklrLBU4Tyenn2j1Pw87SXbBoPmK3EejG6Dbmz2O7x3UYr3E/1crH1I0buq1YET08aECK
 GzTnJihZdmMq9N6ELkToXYUdHgdyBTD35enogVdLPRLD02F7Tmy+aSL21AniunEOHfPzztDwIMz
 7gaJFAkHD/kjjOnKiXWpGv2tU23Og2woZYHm3oc4kwqB7i3JxhC2/JOnR37q1FNvb0kQISF+Q3O
 Bx436A8J4K+aw6csN9ucM5bieP0FIF2dJghiuiHNsY8xszld12waG74TsWOwWiksedQVaYGqau9
 IkJyAUq1QFZox+qcJpcJo72gJx9baDuoeItxRaRrNJDBO3OMlgubUONZz1OhfI4JZzrRttGGKAS
 2rDixthaXakgLx0vJh9U/jLGvpWl1i98yLLZDoIUGqvgGpo1o/j9+RMlu9O953byrcYizrMqVd2
 YcEY6JCPKoQEiccLb/A==
X-Proofpoint-GUID: y7YLjmrliIfHz2MsCpjbcHLU5OQU3Gbx
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a047f6f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lM1BZXIhDmX_0k9ByEcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141
X-Rspamd-Queue-Id: 8AB96534A67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107322-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree bindings for the GPU clock controller on the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |  6 +++-
 include/dt-bindings/clock/qcom,shikra-gpucc.h      | 37 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
index 104ba10ca5737ee1ed94fcb2df5a38bda9c86d14..5f0f94074e43034c2241283241e10551ae90ee24 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
@@ -7,17 +7,21 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Graphics Clock & Reset Controller on SM6115
 
 maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
   - Konrad Dybcio <konradybcio@kernel.org>
 
 description: |
   Qualcomm graphics clock control module provides clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also: include/dt-bindings/clock/qcom,sm6115-gpucc.h
+  See also:
+    include/dt-bindings/clock/qcom,shikra-gpucc.h
+    include/dt-bindings/clock/qcom,sm6115-gpucc.h
 
 properties:
   compatible:
     enum:
+      - qcom,shikra-gpucc
       - qcom,sm6115-gpucc
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,shikra-gpucc.h b/include/dt-bindings/clock/qcom,shikra-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..60714f6cc6cd2c37a0a4caba4473259756bb9d31
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-gpucc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SHIKRA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0						0
+#define GPU_CC_AHB_CLK						1
+#define GPU_CC_CRC_AHB_CLK					2
+#define GPU_CC_CX_GFX3D_CLK					3
+#define GPU_CC_CX_GFX3D_SLV_CLK					4
+#define GPU_CC_CX_GMU_CLK					5
+#define GPU_CC_CX_SNOC_DVM_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_GMU_CLK_SRC					9
+#define GPU_CC_GPU_SMMU_VOTE_CLK				10
+#define GPU_CC_GX_CXO_CLK					11
+#define GPU_CC_GX_GFX3D_CLK					12
+#define GPU_CC_GX_GFX3D_CLK_SRC					13
+#define GPU_CC_SLEEP_CLK					14
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_CX_BCR						0
+#define GPU_CC_GFX3D_AON_BCR					1
+#define GPU_CC_GMU_BCR						2
+#define GPU_CC_GX_BCR						3
+#define GPU_CC_XO_BCR						4
+
+#endif

-- 
2.34.1


