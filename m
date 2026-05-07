Return-Path: <linux-arm-msm+bounces-106236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBjIELIl/GkWMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:40:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D34E328C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B5F30325B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C249F32BF5A;
	Thu,  7 May 2026 05:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7bThpzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bC2ZolgH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0A33123B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132340; cv=none; b=L/r39N9lrqOzY9ciok5IeSZyCYiy1+L3i52m9ulkpe6/cga99mpdvek06/l8vQJn9nP0bk97IuZiXVjcmvz3PdnSLFLuiDO1yzRqqqGSkkPxVC5PSSJJh9kyDxFYfSAA5pT97II6e6p2lwIKIdm4OtLMenEabqotIYy5Rad7EkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132340; c=relaxed/simple;
	bh=9LVPDuJ+bbF3M//gO5UB8E/RBRqneTorEHz9vTPLB4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUcpfZce1BukywR+sMim8RjYMbi1t75SI43Jzpd786qBR2ltvA4nR0wSI45uIygpeNmzydkc0XP9fytIwnynIFKWiJOgoEP2Jo3+Kx0phhlSWsGo6FRapj7tOEdYKJowMPdnajiCAHN488394lQa/PAoGxlGKYAcN7Hr7XA99BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7bThpzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bC2ZolgH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475M8VA3156931
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=; b=M7bThpzr2dUJHR2u
	evBoRBs1LEvaMcJ39WkViK9ejYhhYF1hykWaGLD/SqvzBZslELNlPoOZ4UZ8uq/e
	DcVkNapLTQut3jX+xYtBui4mFsZccZLwUCpwe10gI1A/WKomywT1e8QubkdbeBBA
	hBTY9Wf/10QrhVVMK5bJaVCASv3SmPIcvIghyNwBgAaZyc19Up0CMUGWyh6zOsxc
	BHF7WObH6NQDnHjVILG7+qtUQyLxmislIvPJqq9pNgPKUIuZc/rnRPJ2joh8CxsG
	y2KTdfxI1o0UJO9Ge244a1kkWQ/l8nvyfWmAdc50KtgAKge7XbfqmMSxpPK+W8xJ
	X462sg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf01ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:38:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83536dc3be5so429372b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132337; x=1778737137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=bC2ZolgHmESzwXi1QZmTRgZMpffQQvd3O8RHlFQEtJf9uiRz8U6gTj+RdZhZP8WYXj
         iszvDoSInIK7SEhT1iVFLSk6wQerezpKcL0ds70NaJJpjwZmJvl/DgSrys7KKmE7YDt0
         oBUEULcOhk9XtmYJlItZQxAFKW+4lemJhtrGg6vLTQBeE0ZrON+iwv4xaNrK1M+UurTo
         hshUp/gmTFYD4thSIXyinjbOImKDX79Kge9rvSdQzJGPuT3CbpNJ67u9e3L3rdBJMkV9
         M1bZnMq/DXIiMh1PzM28E4U0bMg+YrxIO7D2EK312MgBPtsrror0/AVyb//PN6uM89nc
         DiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132337; x=1778737137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=FREYI4ufbPo/b+WFZImJjeiSqrKqDzYmUcxjgBE3Y6WHk1swALWqtL35hMwRLEnojk
         9DhemiP2puizkfQDCDypZFqWThsuEizYTEKkG241pzqH9nNN/5VxR0zY8MRA5rRrTaYy
         VE9FeADqNDbCoWJmh6crTn/hergWtPkkA5mVj1MMQFrKmZvPfdh48XswLMxNvIqu/qn5
         SJTLmrkpxLAOACn1XqktowyrI5XvKhE/lg5C0rAi52mzdsL1DyTUqK9pInjMAdgiFX0X
         GN74ls/t/pDyANGUKn2jXfzX35RyCxpzToArE6v0NL1v/qbgBXosPdVoqLPKPsRbXLpu
         vwVA==
X-Gm-Message-State: AOJu0YyPATh4tQiAqoxi8AO1QB3xp5kXtNCqK/LqCZgBYpC/fVz56Qru
	LTDO9WADTYsyInmsYMuDHoEgrWogZYO+BxEiVOY7Co2dNSCokmws4q1EEo3DK41WPRsKLG64vxH
	6VIdicoPmsE8zAPCSS9XJaqsnxIJrOr4TyEK7xW9bdGtCCeq5LnHi5YTavszntwoQu57+
X-Gm-Gg: AeBDievLa3ukvFU9JiDuB8+kNqH330yHb0F6YRMYJOSwMmZGVDg1KNj1LfyGB3Lp4ls
	TBbA5wVRUNv4UXO3Yx7RqxzZkYSiGaIdZBlnrqnZIHtZx4rzOmWH29KD6iqG8WQJrPQ0AI7pAGd
	7JawR53y4mcLIWGTJMCA3ApC4dK7jL+qGrh/hwGPk6S777JWa4VOsCT9poSP0dy4ncK0Gh23pUJ
	PpEmeJua+DBTLun+dQ+Tjteatwy9OKwQIIaIkG2OQIalILxbrUGfIAqoyDbPKkn2aIWPF11vE8Y
	rqpaWgBiy28odDsPjWsEwoZvdycsSp515fWvtRcZgTfUUh5IaO9CRJ2Esao9dVgu19u9Q4+z3nM
	wtRhN8cMTcCQcwoSIafvC/F9ZCczdkF+q3JDb9DPQ+PoySLF7POQFpeE4lsG+EK0=
X-Received: by 2002:a05:6a00:4148:b0:835:3f51:7305 with SMTP id d2e1a72fcca58-83a5bfbfa17mr6533769b3a.15.1778132334612;
        Wed, 06 May 2026 22:38:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4148:b0:835:3f51:7305 with SMTP id d2e1a72fcca58-83a5bfbfa17mr6533686b3a.15.1778132333571;
        Wed, 06 May 2026 22:38:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:26 +0530
Subject: [PATCH v5 1/6] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-1-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX+LhIXdapBkGF
 7x/1Nd3fUAyq44wkql/GmeXafm4/E9X+KkmlfEMZ2J4L9fuKGRf8ddtEszGBKBzVEgyniTU4vRD
 IjD8HLVR0uyQjlEjVQ5cbrbJ2JvMRviGhXAXmbbiRKOvc67KLC9FCp/xMgKjVQ3Fvh1puAt8BIm
 RB8gi8YDhtx8uHZHrukcLZQDm4au/6dGAs+vImmfM2H2Z95yiLMIFmF0HQ3qNjO3ouhaYf3Gl06
 L7eap1TK76ZLZdSWQJ4gqJfJveZRPGkGpx/vLlvUkI7iBAdkW3cbU5shr65Qx9ZsVY3BUnv9Q/K
 FjabNtv8gtmrJBrvRDhKITxIcTz7YDmLsEftRE2N5gLvDSDr+E4E1ggoXKNW9ODdxWyJ9DgAM/7
 7QTHNHoDroeZH5SECuHIihFgPPuHg33p1BLsxmMpWSR1/iqxo7cCyny6rlg/wqpKuoQqv9CQ+CM
 nxc0/zyC/25pWC8mXbA==
X-Proofpoint-ORIG-GUID: ej3DnLkGkQRmwe2bYRrDBZw7ezLGki8h
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc2572 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=F2P3E8UZIP7xQym9adoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ej3DnLkGkQRmwe2bYRrDBZw7ezLGki8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070052
X-Rspamd-Queue-Id: A16D34E328C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106236-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  | 48 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 7bbf120d928cc506a4f7aaeaa1c24e5da760e450..5d77029bfaf8830e2bc0c3b8f323c818ee48dba2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -20,6 +20,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
+    include/dt-bindings/clock/qcom,x1p42100-videocc.h
 
 properties:
   compatible:
@@ -32,6 +33,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -70,6 +72,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..996408d1a0c32e175e5d4dd65c09bdc8dd47dacf
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_CLK					0
+#define VIDEO_CC_MVS0_CLK_SRC					1
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				2
+#define VIDEO_CC_MVS0C_CLK					3
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS1_CLK					5
+#define VIDEO_CC_MVS1_CLK_SRC					6
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS1C_CLK					8
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				9
+#define VIDEO_CC_PLL0						10
+#define VIDEO_CC_PLL1						11
+#define VIDEO_CC_MVS0_SHIFT_CLK					12
+#define VIDEO_CC_MVS0C_SHIFT_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_MVS1C_SHIFT_CLK				15
+#define VIDEO_CC_XO_CLK_SRC					16
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0C_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS1C_GDSC					2
+#define VIDEO_CC_MVS1_GDSC					3
+
+/* VIDEO_CC resets */
+#define CVP_VIDEO_CC_INTERFACE_BCR				0
+#define CVP_VIDEO_CC_MVS0_BCR					1
+#define CVP_VIDEO_CC_MVS0C_BCR					2
+#define CVP_VIDEO_CC_MVS1_BCR					3
+#define CVP_VIDEO_CC_MVS1C_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS1C_CLK_ARES					6
+#define VIDEO_CC_XO_CLK_ARES					7
+#define VIDEO_CC_MVS0_BSE_BCR					8
+
+#endif

-- 
2.34.1


