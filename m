Return-Path: <linux-arm-msm+bounces-102464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL5NHLJv12lzOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:21:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374F3C8656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57FDD300678E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACBB3B3C08;
	Thu,  9 Apr 2026 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+4jdapk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqEpphxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717463B38B8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726505; cv=none; b=mBULXHbxQS0ylYAvMVbdSqeYN6/c0JJR2LE1qEVpvsKjAKfI8uXUIBfaZs3nQYlaeJFxXpYd1b2WUCznfsp4f+IqGoLzE48z/07SFW9fGhVhfzk3NBOp9oWdSXDN8o2qoCE2N9RjBvB69iB53K7zcyx11+bKj9EZ0+nHep1p6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726505; c=relaxed/simple;
	bh=9LVPDuJ+bbF3M//gO5UB8E/RBRqneTorEHz9vTPLB4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R59aQwjgHZXL2h1IQqmLhY7q7Y01mCX9fAe42fBuao1lBJNtLxnHXuxDioRErCR9mr9mC3X631Zk/3y22/y6EdpEcFVOsmdJEi5tf3kcJsMKnnhPWspvghe6ptuEWSuztl1fL4DaHybU25/kO2hRRKxU3ovsi6vk+2rkp/R0ZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+4jdapk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqEpphxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397Rjob4047459
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=; b=P+4jdapkl4NECgSf
	+oXs3ETcyEQR4PKBVeaoJGKDjTsIEh/IVjtVMER2NN9y4drEERi8pijBvfAxZdJ8
	HjdyY8YWHvnk6MOW2Pm6NnUXIU2B2cGpDWFQ8OWPfXwp0K6NOwzt1C7P8C6ni1PQ
	IOTmWCxUEeJ23I2r8MKrZuJ/EcvPw1VotrLcUMOpth0Guk5cKMeVURQZcrhJnBwZ
	9sFZN5tC1neXIDZcp9HsXrNuSXi/eK/Ijylbq9geqXMmL71rdrmih7aoKMYnLqio
	TIQTWPqb73jdc7sIpZQEjhJn6H/MmpgQVisFdc+kzK4wuzdJyFklx5gVK566QQRj
	W3YCVA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtd73brd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:21:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23c909256so8447225ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726495; x=1776331295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=kqEpphxezovsIJXRn00/R+LZOiDw2yZsNjsFQGkyUqjZRqhFz9dbg25u7m8GpCYmFs
         7DR2Cg0mVyb+2Q5+KAHRDL63TpgmKqEyrXENJicYMwvCm63Dxwi1a1w3mDIVt6bc2Fkj
         WKEyHgeZfIPkTGeOkWvETVKmw/Shw0njA07hgA+sodLGxmIOcF67h8SuKjaxw75STHRm
         d3pg3W5KYcW2+IwpxAonyuTQViaN5+VxXVXA/E77JFebcXeiYzpltKo471QxtkoBUujy
         5DSyfVGejOblDhIbXi3epWoOIjGGS9yF+67f8uisgDliWXqF4Scks7uJGdbZcHrBLx2q
         3niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726495; x=1776331295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=DnWTYMAmtwkjGhIK9NkxRCDA2zxMPW7+LRfrg86yiv5749/jHDm71cysla99lExDgH
         VSKSuIlVbh3YZK0h0Pjgp97h9Lg/ZNaYNcDyg14rcVG0DdZ+aY0h1KHnX5gdWHlJGRF0
         rVnmV/b3iXJtDSahEPV3XvA6DJbw9MiIuqBi2QY1jzznKiOBe+5vrrUfrmKk+KVvFm+y
         5U+r2iTqub8hX8aLpflPD8s9QwMBGStQvEeklmxrVdoYNZNzA45jcn6EW4Wz3Iy61Vig
         7tjR5j5qLdjeFWmAKAijfVh3Hu0yPnybA/9XxdanFwSRXdZUzw6IcvM+7Ega6d/2TwQ1
         yjrA==
X-Forwarded-Encrypted: i=1; AJvYcCXNRizVC7YkZbhcw7swKWn65dzNin8nPRJQf58fDPlUsG2rAWzPH4U6kxaTzz5WbyQbrzfYqtWfZ0RgLxO0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywee2ROw81QqbYXu5s8UVPkr2ZhDofUV0DPe/yQk+ylw3b9sBM9
	GdKnhmkgBYhAttvG4eJkGAjdiWoRLLfVfxaW2MrWuftul63xcFhUQbRCvz8OsXaI0OB8K3Vkl0g
	IIVd5cUAZINqFnF37frUVbxSxcwTzL3ZgQuwMUd/sX0zUBSXwuXLeAOuM5tp+Rc2v7JnO
X-Gm-Gg: AeBDievQJ6MYeAFHzZ+5yRQWHS11CrhzK9wJnJiDPeV9AWM6BEQYCKVLDWeZRAIJ/UB
	05QZZK++YbiFw00p4uWYr6xXNHa6Cr2QissrvzmZp9ntj/9ZagOjt1MsTnPsWieJo1Q1V9zrQvO
	F00nWMjGfZzO0gUOIBLgM7A5iKAKZC669h7eDLMORBhcV8scZhCVtfvVo+DQTwrHSBeVgtImdkp
	NLsXeXweHDwn5zSbfjfj9IrG5055jVTMTFn1LcIW+nSLC9cNblKfERW7BMTjMWEs+sMFYaljcsB
	CQ8JbWSUnbJPwxWTAgxIfttdGQJQ/Gtj9Y2KaX4Sd7N0dbUkRpYz7qCtEoXr2Z4pswhLJNrzW2M
	fQ4ecXG8I0B2d98qPyUEmxlaVnEQEvyhwC9m8SiCRveuYhz+Bx94d
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr261183425ad.4.1775726494754;
        Thu, 09 Apr 2026 02:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr261182815ad.4.1775726494146;
        Thu, 09 Apr 2026 02:21:34 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:33 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:03 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-1-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QoRuG1yd c=1 sm=1 tr=0 ts=69d76f9f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=F2P3E8UZIP7xQym9adoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0MQUs2KkpJBg2WMR_FP8gwii6q-sRQSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX2DHZE++EkunT
 y7xAvK6FaqWgJEWJO5Vk0gtaV3/YzU14Qjbc5x/vxDcwkR2fG8Czc7l22jhOZ3zjLTZ4xClRVvi
 Jhli9NvOTwjTMZ3RdffYaaoFRqs9eEFr+ZsxobK0PCIPpouRz5HzVUGRIXmUOZURQhCL/YuSk9T
 GV5loAS421CtL/5E/0ZHwa03LkyfP3zH0FDOwkSfzb1EIfDMV8gXYMBaGsIEuSywgMOIHqaP+EI
 UVzq8GVTS9lEs1m+RxBsp0spUvP29KCgPO0oxmKeVHY10A9+UW5qPtKnLRI+WJJopcjCLpn9Kqb
 mH1RY+xaXAq9mQwmKw+t5UpA6PN+eZalwDtdYZllO4hoCkSzfuuNJ+Vn+OnmLLhDBrMOD/WYzSc
 H5yr819lffZzz/Gy6Gau7IrhoskL7/oPvSLT86QbOGu2nPrl1jdntykaOXQpf6RTihYhYoL0EAI
 E6Slmz65uhndB56AyNw==
X-Proofpoint-GUID: 0MQUs2KkpJBg2WMR_FP8gwii6q-sRQSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102464-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3374F3C8656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


