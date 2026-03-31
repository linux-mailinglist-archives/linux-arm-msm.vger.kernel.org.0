Return-Path: <linux-arm-msm+bounces-100937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMIGKhVby2lJGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:26:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915936415E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DEB1305A897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDD036D4E1;
	Tue, 31 Mar 2026 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2Dw4oBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuugEoVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9236215B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934685; cv=none; b=cx+GumTjOr31jmVj7rc67+Qfzz5r3vwworpjIUYHUgoKyu07X1D9d+0GpIPBm4JBXjbg9Jl+0fALnspBBuyzgV80SBtj/2vZoSMM27mG8dZlROt3qxS+eKL0ATh3Y5m7WwV6k6Ie6HazNIv54D4jkrZu34F2Skfpso/+s0rdD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934685; c=relaxed/simple;
	bh=DHYJYO3wXSFgCC6+uxk8R1Ye3F0J1gMgx29yqTPfgGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrdAvD2TAE/+IzxTMtB1sviV3rHt6NZ27IMjZbJfE6xNivPYC/8LE0imFkZ+BvcTfLq5wBcrdvZdj4+S6ejqbn1rqSE213tjH/9sstxd2A5ks77Pan0su+oFd7GrgJ6xKQiMY1mjwcvf/mz5+nlsrk2iESV4ycmdhbwSu7dcWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2Dw4oBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuugEoVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4mFe14053489
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=; b=A2Dw4oBT+nuUUzVZ
	g9g5GrQftKEf1LD9yEjFMGRrIsitcbBC2GcAqt/Fjhri1wTIiUvqGu7HjSsVnARA
	+hP+dSq1qM6ocKnue+1MT8Bd2/Lfb1QMMO3NmfdwgQDfpuuM7hkoX2b3lGJYNf70
	Rf5ny70S+ERfK32JUGP0xZf0skSJjmwChmyN+IKUDTC+dtRJ4vSgAwgz/7SZ6XFx
	uMJIJfmVmLsL33Km/vVrtmA30c5Bn0AHx80EJ/QLI3y77xPoKQlmNDbGHKhvzeoa
	LYbzY1A/Dtu6GE3NJjkOZy2GQBt54MgHvX5EtsLCf3ljtr7hLLDjE82Xhgy/HCkf
	nGXvbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx39t7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c714cb672so2992032b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 22:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934683; x=1775539483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=;
        b=FuugEoVt4Jd5RseQ+H20UpiSp8Y8O//Byl5sdI4TIoo/gI6IyJx8tomdyRK929Z8jZ
         bBiEDR06pOdLKaJPJq6u/mTncu48MurIUzyKnBRYOBUsr1xuc0pzspTnzfR1+9fitqwr
         sR3pCOCB2vkvXhnZYtTfyczNLpxhc2/lO7sLqeJivVjg3K9Av79wxvxaBgn3WBp5FdUd
         raqfzxNEaen/H2oqH/ce51eEZ02ZZV+CHht82B+v/ptK44+ahs21QQvFJuAlraPXpWWH
         JQQbcPZ4yoLxIgyNowI6H2CgP1lM/LSUHIeEFHjXfC0AfOzu2RlLWmDZKzGqFEfAczCK
         gZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934683; x=1775539483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=;
        b=GVrCDfXuHGSY9p7rLuJRYp4iNTYK2Q+1Bs8jnaTJceC7Gyxd0xS96TMpJiiqbxa6cN
         NUrlpX83NvyTMykc6er4BfqQqoxraZfmbAE1GlXiXfP6zCxiRAJKapLLw7ybwCe9HpZ9
         vd7JgytW5udRxDI3Gw7yzEx+4SQQPnO8XAuNU50lTgVX+Mkxvxbi8VqskTMJ9srpeEAt
         15qhIBre99DvcJ7QjXVVtqaIXFghp9BaAfoFBAHogH9jnfUO9Yb25noPDVNdZIYbvjll
         VnpE9UuGeyipbSy1YV6aq88AbxfUc/Rh2m3CIyGPnwhZ+CNUywYqfReEd0Xeg2T5pKua
         i32g==
X-Forwarded-Encrypted: i=1; AJvYcCVtT7K+v3ej3JH1Q3fcAQH8RU84kM+NyqL+APEb300OiAiAzloeL+NcEQVJ6s2GA9ML1c4w49mRbmCxlkzY@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3BsL2wB+hBX8EF8wOGPItl4DM135lWjmUtOzfFpyYDh5FI33
	P5bWh2ae2zJDcfUroUJ/sx5BhCsUV/SUPdQAoup/wp0xajQi/AAvYnOslmbUOxymvzJD8n4yT/S
	mba+t9b21Ud/neEoLGmkCHy7ZqKiMrBO8Xq82t0b4gbBFFIY7Fs2B4HkNPtvCuPFKL7CTXKrxcF
	IK
X-Gm-Gg: ATEYQzwH6IpVh46MIbZYi9/PvzURRf12BOtcdW1TJrqWonvy2NPiWp28PtgP8w/aTSg
	1KysnhVG7KQZ9J5OE7ZiptBA42DeLelrg3sxy0L6FMBPsIBgQi05XzKSR3c59QekMN/BQXzYc4c
	NEyEjOwhSEIfxMYiShBjxh60hnv2rkZeIP3tDg1dX7miGzi+zVFwIicZhPPCR5KnrQzdWuYkp1r
	MPxQqrI3f1SlfmC7tWJFGzXOVJx9cGE0kfSEUF0otN1tcsw6NmITRnWSd/6cjwEuLF8cNnYYNnb
	BhoDtpedD5iAPHCmOhfNs7c0VaAkk5UXJvdrYDJwm9nFKB5wDLp9hf14fOc7p/dxhJ/RqtC8qxg
	ASU3Ffm3Zm7UKNi1iK3yrLjOcxfFQqQodqzZySeAVKPjmNorwQmrZ
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr14695208b3a.47.1774934682726;
        Mon, 30 Mar 2026 22:24:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr14695171b3a.47.1774934682212;
        Mon, 30 Mar 2026 22:24:42 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:41 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:10 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-1-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb5a9c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=E1hum5-uswxXays7BlUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: BuTR2_3Ydt2lfr3dX1L57gzfXewzIUAK
X-Proofpoint-GUID: BuTR2_3Ydt2lfr3dX1L57gzfXewzIUAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfX6BKs/Fls/nwm
 jaVbgjmm1d3bOFOu1HphcTn/EeuBoKV70FGC16o+ZGte1g9k33/Je+bVXP6OL1yWZ1YMROrv5Qe
 XCAKRJnv6ZHWZV4JmnIYUtI9sMSYCGygpael/spi2zsCpgLQw5hN8KMVZ13ylILA3eJ/Xd+2woJ
 qQVmHd1gdtCPCCb4rU9xURKNFn/ZVi6Gk1xsI5xGoRsI7v2j1nSRYAoA8V2HwwE8CgMhcpW7PmL
 VXHfMBNQEujjdVJvM7A4NkdqzbT1G+gW0iEstm8DBzonA6OGqSFp9oHVNs1L5IAA2QWK2ZUL6S2
 KD5DbelsfRk88/XBFrJIypg223ivTfkmKEy3E7PxIAPoThRrj5qCm6PsPS1Pd/l/MjXzlzHp7/9
 2fFJaFxLacrQowv/zi4Y6uFVIJ9U2OemtZuuKhKmtVTDoWZHI3F5BmhXazUg9m5Ek4cTj0/5UqS
 O2jfYnMr9pdoE2HM4bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100937-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0915936415E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

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


