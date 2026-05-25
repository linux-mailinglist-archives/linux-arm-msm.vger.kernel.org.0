Return-Path: <linux-arm-msm+bounces-109629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IHFL5IoFGrfKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7955C95F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81CBC3014C41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC4E3E9C0E;
	Mon, 25 May 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyujLfCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hqp2rLuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC83E95B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705992; cv=none; b=dy4fR7TX5ErilJvqtyTSLy5jXdWx5Sv6U4yE33i08n6oeyfQscK4VBkTHuQZQFNkPWz42KMfs6JAdY7KAZWX9/88ahI86f9ha4eTpXj/5ZNpMUg8w7jdeg0a/kCg1979nXTGY/6rxIuVQxJYb+7kA9ZDvCYApSLrHI4o8u2guNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705992; c=relaxed/simple;
	bh=41QQEsNriEBz6yXk/FYaQ9SbHf1IVwArxBrG16YlvOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTA9Y5NeAo2XQICTL9xp9P4n7/HLOeWvuPrvzII+wzy3SocnpQPqYMVV4rXBM44fMbMKQf7GnTmSbs91e8oHWGo4enZlmCD2v2Q3mwLuiW5I5do8OxIEsCQkFOqkFWMyLXiNnjqhplTIrpwClKgQhONEV/ToIhLlfecpKsdXKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyujLfCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hqp2rLuX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7NqQ92211897
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=; b=hyujLfCl+/Vz1yng
	AFNgFf2wEJWfZp9aFWHwcwlwSswmQv17YNi5t/Vm+gEwzFN4h+pdHGCbwCIdg3J+
	9axuVT/NuLlIFaqZ3Q9c1VyBqeSyZmgsdFNCR2solExGuVsH0PQhfQLLMurY13sG
	FxefoQYHKLKo1L4xNY1xbJ2hp6eU2OnmhGqmXelmrPZBaJxgMSPmgRsj9lDM8kXX
	IM+nHRnZD6Ojm21sMIHDgVBOAJduFByFgybaxPBDaDlna83pLsZO2BkFRIwrttZV
	MW0xJfzq8oFfp+Q7iKiHU6lvOfUUnUQltWnDl0UDTWPcbGtBHxwFRcl3xa8IOBOu
	/8vPFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p9yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:46:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so209725445ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705987; x=1780310787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=Hqp2rLuXMXMycYXH9I0phcaMOa+PAeCI9gLu0GhjZtC60v6imQAHAzdKuCT+ViFJAE
         5NR16HcjZAQ/vovZt7pj52ors7nVzSFx3Fv5LSWpfxwNBSPt9w98X2N2HvBqE+qb6F+b
         dL4mhQDpMFcGtZiUIi4rKPrqP16/1mNY6cxHmeIYL/9rnLxVW0gZOXcF+KNcoO5LD0o6
         ruGKqQUzzAVxKwuD+M+XhfGZFgljeRGM78caEnHQh2xxrcCqoHL5KDG6y8NetX3O32EW
         JDKpKSFt5MIeSHZC9sjLAuFYd2oJw/aSiquVn8l0fSPvNuyx3gG0In411ZlbdSgU3bkz
         8VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705987; x=1780310787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=KMmBBwWk1xxirDwMQLsdSZDcl30z0fqA8li48Oo4DeTN4AWGwjHnRe+oqTrCd50mmJ
         6Ag8uKNzTQW2DDDyeN7ppSsweIG0nb9jOOwE0CHPHe/zuhm626BJhZjf/TO5mfVgXj2x
         2HE9+fV0iUHS1KMozB5bEG7fQqFojd8Tks24fjvXEiCjn2m5QNIPmOEU+iIgNTYL9o3L
         WD/fGaOCEd5Ql8CkA+Zi4ZvJQ4mJQF/zBf3mDfdqfYUdZqTXgryEWJ2oTFqDa6RxL30p
         ResWu6pb8tOcj8YEEHLlfP3QJ8teHxmhUuQAE9igdA2w9ZCWV/VboqDol8VXPtsdEves
         O3CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cUSNIP7wvopr8Nv9fFhjNjKdveORmRaujvlAM3sduljroAzvEapa6ArAx8k1xTLxja2zluPe/1Dbaco5s@vger.kernel.org
X-Gm-Message-State: AOJu0YxqLne33vPk+DJRGKG1Vi+3ty2Wi0C9PouoCSJoQMLHIWJ7KtIm
	DnJh7rWZQeVuLo22N4977gI6Bxcgj1MQeXn5BqzR19SQMstNv+vhGWXLZRH8i9KQDy7+3qx84FL
	G9s8r6axqIg7eMWpQOTg1//gWSnY8Iv0ZBJ/ioIXWdrZlovph3K6uMxurw1nqVy+TJv9Y
X-Gm-Gg: Acq92OHq2Mot+7dPZkN3vs3p4D2tKI4xow0I4NiD75gYWeWrKAzNgI1cIXczJhvojlg
	+WNZuSQ3xmZtxetyZaXonsF5gBmht76klTHc3qmHyADwFVtjyNWUsL85d1D4FJzfFZ3sX8al2h0
	jgzaxlvpCCPQDdec6LPJx7NJkFVoiib64LnHRSSBeWB/TwgYXm/MKzs3hMdQWPNj0oWDE/F1Iwn
	O7DT6NmgZFysYBq99dY+tJ93ygnosFqKXLJC7kKpJHt6fFGvbV2ay5gJUwZ0sLSIVAP+FKh41Gy
	jfCcM/w2tGhm57EWKCRWkHMGBeVcivgBfagCkS4cUQyTK2HfN2qSx36vp5lGhySfj700qfEleck
	8kRxYUJDLETX2xMP0/XVLtQglnX4jnMBjYo0nuXOVVLOZQg==
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809985ad.9.1779705986965;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809375ad.9.1779705986325;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:04 +0530
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: jGJKPn8J9fCy2sz3SsuxnvX8DIB8vn4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX+P376exvKOEY
 IwCBiL1xO/OmSUVBjWaH/oblIAs5fTDb7IumiI+vYCjO4TccQd97ATNKsr38mjZeSKaOEupbzMr
 LT+WptdHMWY11jGQS5ldVck4qhYx7BjYmKv1rIcStcyFQIQhYXAzoYFLXHrHrjoNwjbsTtMBwvw
 govhAYNtIK+y4DspSa4KkbbzH5wOmRlX+C3MwexzruAeXYO62F94QVuo0CiApBeZhQCzmCjO6s/
 VwrfKqjRkL1+XTzCFWraQU0rd08EtWpWdzhDiUU0pzBTpgFpDTzFxU+iZzH3KTBtUoh6yuHZQnl
 OHp77IeuL0TWqs7NPLp1DA8rYuHqvSIIfdDZhGZxDf/O3y95IqTqB29aswu70WWol5i4inLCzfp
 NGoep+O3dVJWT1u4ireuUU5kgwuxWBz8jTRGaZH2CtrAgwtFjxp9+QFXfo58g11Xk/YV+Q9dk1J
 X+ifvlLkGIOxOAVroEA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a142884 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jGJKPn8J9fCy2sz3SsuxnvX8DIB8vn4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109629-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B7955C95F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1


