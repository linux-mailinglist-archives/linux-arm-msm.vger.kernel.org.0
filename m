Return-Path: <linux-arm-msm+bounces-83438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C9C89253
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 938893ACC93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85D32FE05C;
	Wed, 26 Nov 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhO/tPo7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQbuQDif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477EC2D73BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151057; cv=none; b=m3HTHow8400CoMHaOXvn2OS63R+ZtGDwmubHmjzPwtQDcfyQu9svd5mr9iImbcsUNf+2qXOMQTMgPCKzHDN2Zf1Lv+wGtT1qH9RKUhH4Sb1RTktjmNsugqBGwoabkwysJw1KEKq7hRtUSYeDslYCu5Kduz/v/IUag+PAFUfq7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151057; c=relaxed/simple;
	bh=Y+rAUVC9CBr5o/QXLpwcu8BGidazuogzO8irrnrlFoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LE1iYYgZEAKB/+uA4ck38qL8Vrup/lHkchfBKhDvJ0CKvV2+8FpHwBjg1afasgmq52LwYSAlcxr1PFxeZ1xOYXOpbcUcBxZj+eLvualeuDpRa+7mFogi1SQ8NdFNeArnz0s7soqoCE+TMP4vwV+DqQ3FaxFB1FjY2UtelKqO4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhO/tPo7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQbuQDif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6HBAc3738423
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGHjkKvGZrbPKQ+eUxHkHgCcBPCSnBCoeV5uc2QHR8Y=; b=UhO/tPo7gAnhzWrj
	yDRMpsiKOm8t6zW4bIOuNIOhlFoOF56yUTqpWhvW/dT+A/l3RqH8puajXAKZEBzS
	MZeQiRWioVN1lKspB4KHwkNS9nHmtQ/Ed300ywWqCfyIpL+dGDARph9B3+OPcTx7
	BBOdlhGWV3qrn/ixjcFwEXnB3kpnahLeKSLKfSJ1U5AUURT6JRGsx3dYSRFehxei
	Ny6Zp3WVkBJYUNs8Bkm4voFqiYZ02+17V7+CDzB9bGRwhPaaxKBfz6vKYiXMJZLB
	9s7La67Bi52qrtKzgGpMhVgLsIpoNjh10npUW+p+HJaNvOGBBAIHEVkd66Tb/fUd
	rEktZQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyjd9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7161080a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151054; x=1764755854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGHjkKvGZrbPKQ+eUxHkHgCcBPCSnBCoeV5uc2QHR8Y=;
        b=CQbuQDifXH+O9jX9TX70wJGW/rDpOKz+wV+3pNY2fI1n+8sGkP54bpR9xMV9qlk4yc
         bFJf04fYsw3YfYTvawEyqFjD0XrmEtCwjGA/6nlP70ZuoYI2xl2CoMqmMGaxgkPPGAVW
         szyzoKGcOm/6HSvVGxAklm7cNnS/1WF1nidp0kBqY3szmxPfvWqsqPhbXvqi7g/HLE6I
         pm7MK//sXhUOmPaWAGhX5wb1wpgg23AEYy1qmftwCS14ttUEvuR+t0iyA8p7ca2+ykM7
         Q8iK9eQ3qUG7zvWhldrRDeTdnPugTcmPNOYzPrPl/vSQTsPgTwtZxiJWS0jGevpU09lM
         Czcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151054; x=1764755854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UGHjkKvGZrbPKQ+eUxHkHgCcBPCSnBCoeV5uc2QHR8Y=;
        b=hLNzS4PgOCMVzibqd891o+Nbyg6dPd/P3HWuPjOrqSPPgq8ZsAyT4+RqxQCdS7KOMS
         yboWTTW9rqH2mhvKbXdeoEkU+lE2fej7wx9UBLbQq4sdZbpUKyiIXwK6L4DQBFvWxRQ2
         49h+65v1u8hbjUOKI2Zw2yDZEEklCGM/jTShAqK7rHfMjBSnoexQvaASKOA7pxkOFDHX
         mmxxynZMFNLI0JRV0pqsNp3gLjbtw80Pe8T/VYJSPe7xC5ad5N1hnkTz+zkSW59Tw7Ad
         T1C936rg3y9xSU84xw3ZK3gCq+E1jytECF0AaZj1jwG0lr4ZzfP9rtAuqmavs4N5v78Z
         C1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWigASU9A/egbql1tdk/NDUwGcA9tXhal69cpDn1BhTcCaK4xl42AdljWuS11U2i3clPAOac8Kf44iucsR8@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZ8Ih+3R7dbtsy0PhG/sNM30OIHSTm+0Yn1z2aYrLl4yU374B
	Ywfr8SE3fbP0OG7w1subP1H15JAHtdqtZjAp6Mg7hnuG731W0/WSm3qfuhiO0TcYWmnHvkp1pEQ
	rT1F7c3Kls54EBRd/ZhUbTUZgIce9+L7Ldp+W1P58fzgLGA3escUiI2oAlWqvlQO3DeU+
X-Gm-Gg: ASbGncvL5mF0Z2CgxESc1jpAnbcs4iK9/NW8I6sS6TIZ7edo42HAkL1IENzig/hcNJo
	CnKVZ7D7QyQ4t9BEzq+9tuM+SxvY5eXYlra1MGmFvMPL9mPj8oHEZH6PN3dk6Ir8sXqPBp5xp0X
	SJh8e7p0LGKHxL8jLafgmLvU7HNYXEfHCV1V8Ux50WqIGLSyRd6FfhtwWgZpxaj3Hb+Hj7Joh+P
	V5YUJoq6FgpLfBycRri4jDfFsYS+maCQTzns5SfKRVUvPHqBdnK9Mz+NKPUE/YZXZ61PD8yYCjE
	VzPziFWu12y1kK85QQB+ySMhQTvwWwuTXJoXWTxj59XHg70eSim2+kJrNmNaDnpy2dCuKvS9UyF
	zJ1APTXxVzG9FjcGDqiXIWPRyYige0q/lQQ==
X-Received: by 2002:a17:90b:1c87:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-3475ebf9b44mr5834218a91.12.1764151053949;
        Wed, 26 Nov 2025 01:57:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtEW4LRYSIRE+IwudztBv7bzrzGEOoIeHULVff1LCTLmauW17WjnamV0cOKrTkHkWcFEpCEg==
X-Received: by 2002:a17:90b:1c87:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-3475ebf9b44mr5834192a91.12.1764151053462;
        Wed, 26 Nov 2025 01:57:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:33 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:27:16 +0530
Subject: [PATCH v4 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: vzliIxGBjFjES2whUZwVz2ik6qzhfG21
X-Proofpoint-ORIG-GUID: vzliIxGBjFjES2whUZwVz2ik6qzhfG21
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926cf0e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gxflGWy-rYv13cvyobsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfXykNS4SNPAS56
 5B2HmIXvy89Dh/rZ+54ZHhrhVdKHPAHM5UFOk+O1ZKhBNZ9qme9G6KDA6Rzo/lbZ5ldvkY3kSVo
 JTQLceo//D/LGB+U8OCgILbdYEZcbdVDdGGXDk4yRoKczLlzGQaybgPNRi0dlnVzyJZZ2Nwr/1/
 g38X+fMPEosWqbl+p7XHlE/n6WjtNL4PHEjb+QiqG3RoY3MfFEKZsJOFypybGgH2MO5ZEnJEEr+
 xtLTC/rB2ZlRlB2jU8t7miTo3iCHn5FiDANW2kX1EQgr82dhy0ZxTXFbZtlFB3FC+9NCSSGkUI/
 yR/PGp7ReVyvB59vsuLFJ15/nKpd6FGS4tk9hGsaD5oukQoJX9VW2U01aT4A+0eIw2JtIk24jei
 w6mvgIetAXBuhkAi1/NFb9gpCXZpaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260081

Add the RPMH clocks present in Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a2185a6f321fb60ddc9272582ed67fa9ada6535e..bb2cbd2961d9aa1e4475d5876c1761dbbffe5338 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
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


