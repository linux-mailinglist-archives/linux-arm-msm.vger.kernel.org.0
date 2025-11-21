Return-Path: <linux-arm-msm+bounces-82900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38194C7B25F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 18:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E39335D944
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFE1350A29;
	Fri, 21 Nov 2025 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObFOOSAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIW8sXuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFB350D6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747811; cv=none; b=ESgyqnE0quDimCQDhBQZjP4gs1brAkz1FMafd7W5R2La/WEDhGbCRft2bLkzLWHZkyjarCCCOLuxziy/gBjVJfJmDnDjX9Ye4GIo6pCWZHd7559WrVhBOd0bKLysFSrD+oTD7btevIRYeC3GulmyQx0SFqXN8zFO+QnGJZiDCic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747811; c=relaxed/simple;
	bh=ZVWDlh+/Xsn6DDxCrzSIDVLLN5JDvQzk8ly8UD1foQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7tfXQkXaDlE+SLnhXqN4Ap3l4kOeL9mM5k1TEqkmDy3tCG+gARjESbAd9tJrN7UK2QJmaP3FIzSD4SI2v6oipme+GvUT6NgmjjA+RtzXtlG7eWx2xeOMW33HIwuB34u77T5A8PdB66DhSCaiZRL1XvWkBS4+5PoA5APbPoEV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObFOOSAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIW8sXuH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALDYEi91638465
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7zLRovQLnfFzAWundusPfszZbOzT0qbIZqUGlay+rE=; b=ObFOOSAsRcNnZZJ2
	xXkJ+Ixs+yDyBEf8S8VKbLBvt4boEogNkZb+yA8iOgLt5ENPli0mQcZjPVtVU8U2
	/lLvZ4ekCC78vz1LIMG2IehwnPGhwSM8KMQ/7wrVZY5MKmcOrAviJNfOU1+9sv3G
	2y40j+hI6W6G8+J65XCFygd/phVLKEVgKCFLCdB81YUEifSZFKZnBLMVy1pHHcZN
	tJSK+mRxSk0MBOO6IzsD5H/wrkbwsf4Qls+7cU1on6TOboJD2FFK4LU5vjbvPzQo
	tNaG54xIX3YMBRwUf5WkrFV17vABi1CKS4X6EDIHqk/2kD31TKKOwCN/56csnyde
	6Tgcbw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagaumvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bf15b82042so3311534b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763747803; x=1764352603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7zLRovQLnfFzAWundusPfszZbOzT0qbIZqUGlay+rE=;
        b=TIW8sXuH+3gloyXlNoDquqKBl7iARFgpEULwShHGJUZY4jmrWGg+iJc+ZsmjZnRIBq
         tFztbDy/EBtSJRshDivZjD2sFxtBwswcazQOWGD5TVBt6pe8NrIMRVOpoqF19jSXVN0z
         DWw78K8D2vCqG/tyJvlLDGk0WdMrwTFeHZftWV9hSSuD8MQ+ZF149nJH6+7KtQEqhO3p
         /Fhu3sg7Koln3LW5ZiSNK/JZZITbpCiesjd5v+vp/3O5O3t69JhxKhnabdPUxDlDFhx1
         pPBGhs9K9OR555o4HBk47gwxrOfpL2MauHs7rRfdoxg/K6Yobb5Z7XyFHa/W0FXuUmbA
         cTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747803; x=1764352603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G7zLRovQLnfFzAWundusPfszZbOzT0qbIZqUGlay+rE=;
        b=t2jwww4EglSJk2j+81RlE0oTD7xj5ysvS2Re6XrYBOJVSMIBCKVE9YKkkNiWQvEdQg
         ZBvaM1L+Vw0EnXdXylJxPeXehu0vUUiDZZasTRDZylacLPv96eER5bKAZJYXNYGiOyHP
         dnIB9AgpgN8ZCJRN44nYDM1OlvvJkQCbqWyf/fxSXlow5TRBXn3RGCfhuBR3awAy6jhy
         TceLExQvEB0V/MEBw1egvKDAMxCA6EJ2IODRSbNuUsDOJV4G1vqP1T5t5FRCIMeSbnPB
         cEm3d0+KLsef5aWVmKRFT1gPavVslgSrj13oyrOOWUXA98KfVQfwMD1UkRFHk/pl0zCh
         0FTw==
X-Forwarded-Encrypted: i=1; AJvYcCXpjcLCWvqNNeiqAECg/vGEQn8qA3LdyDGUQxaxUvi1oKfdq/fsjrlo+SKR+hY+Tx55RjroX1ea67Kb6Aix@vger.kernel.org
X-Gm-Message-State: AOJu0YwOoEFl3R93eVKvCvzYobbJCba94gCjoQ+QtZTy6sjsNCF2q4Mv
	GQt8q/OdR/QyAgaahUuV0TXWIBivQaqssiL0ydV7FqP5foh2IVcHd5/qs2eMEb8sttECWoGJtYZ
	wz7vYWc8mD0SSIaKNZ09fGvG7iatqL893PYacFLgjALGcvxmKM9+cLWy8H4S305isLiXr
X-Gm-Gg: ASbGncsjFBsSPx5Chuy7szBAcoQxkRZKDcqp09NMMMjCFnZqzkPTDXX5yoAqP4+ZCEK
	TeOa5DQxtFdKeXD6Eb28naw49hveOIVw1S8xWvewIcbyV3L5oIZo+FbW0PnJxN0gUx1IaAGVPES
	2fystLJMnBNGq+C8ed+/PgAyBG4KcXoZp2QBQ4HP1MvamSqqK7ptWnsSOafdYeaf5ZzhEdAb3fk
	JvokNZ+T6ctLlCv4h2WKu+xYTYgVJDium9HWSHXfSp5fNY5CflUrlgon1Gtr9vFOC6gI8oRuSeo
	P5tZpFRK251QA/zRCcqw2Z/zhWwDJZc9Kvwap5pd+7tKvAK7Cj/QFDnDF9KePHNSoNFm7NMY5fy
	iJ/dVRVfIO7O+QWWyl+BlFIEI6ND23KlpWA==
X-Received: by 2002:a05:6a00:23d5:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7c58c7a7601mr3856793b3a.14.1763747802934;
        Fri, 21 Nov 2025 09:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9IrLKOvKvH3L3/dRSDJrMrFn5NOnMwZJJ0Plqlu4O+PsbIpNzMiWEB+dM6cJA2aAlobsqBA==
X-Received: by 2002:a05:6a00:23d5:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7c58c7a7601mr3856760b3a.14.1763747802430;
        Fri, 21 Nov 2025 09:56:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471060sm6727883b3a.15.2025.11.21.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:56:41 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 23:26:27 +0530
Subject: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=6920a7db cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gxflGWy-rYv13cvyobsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEzNCBTYWx0ZWRfXxM6+SAfU/NVV
 jMuvtWjp3UIDdTFJ4TCgPDpWX3iPpts6y9/CVX4rk2u6NGwaq3LOFOICfq7TsXsAXdpupNhqH50
 OboBBRieouPG0dwWAkpEd+jLT/NXlXCcr+ugtMi4L+LnmTUTi4tfLGCTgzOMtQIAQHNElJZzYj4
 zY6OXQb+bqrwT9t9OrwvR+rcG0jQJdT5vmFxAiFYG7K8a3RfxjYSWdV3BSgnxm1ccAc4U8WrmZ2
 wUGaTBwy2hDQgE/azaLXmgwQcUhpzVrrms5KY1Q/NsB/2TkXpSczM2q+e2Hf7vDLI/9BCmErdzd
 yNbIK6illI19zOr4HTb2q8IS13XMHWvRXSliLk+cIALQxI5sIxc2MZEMc9c13DzlUDbGV6vMB0c
 Eiw5ogGmqQUx3luRPm+/1rV9/5Vx9A==
X-Proofpoint-ORIG-GUID: re0oc1lHmLmmNUOoaRZ0JTcVHldLxUK6
X-Proofpoint-GUID: re0oc1lHmLmmNUOoaRZ0JTcVHldLxUK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210134

Add the RPMH clocks present in Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
 
+DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
+
+DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+
+DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -901,6 +913,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
 	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
 };
 
+static struct clk_hw *kaanapali_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
+	.clks = kaanapali_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -991,6 +1031,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.34.1


