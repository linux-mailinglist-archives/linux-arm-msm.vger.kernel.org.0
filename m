Return-Path: <linux-arm-msm+bounces-66960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A07B147C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E1531AA2708
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFD0239E81;
	Tue, 29 Jul 2025 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA2+efW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5282451C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767784; cv=none; b=cp6+CVzqj4L+IM+xIAjkCTf/XzmmZBPnMgFB3XBpptnc5X1QqH0EZUwgdrTBaR5PvMBD/jg+4f2hXrnV1y3atB1QM/DYJCx9V1+b9Zsp7j9fjTG0dEHoR07CCR1De+vSLqeEE1Q0/xxBrhwSW1bgY/SlNkrcBr67uWe7MYkF67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767784; c=relaxed/simple;
	bh=Ea0XH5QnnMd0RooqHYz8fkr1Sqoxpl6YgOdzQWVRygk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=io8Lm1aTXj9gM1ToS8w7kfAoDBiV4seFVjBGfVbWgPL7FbJS9SET7+fxU0NpTA0k6RysHBiub/GWZHSB4U417haG3hAcKg3WoZf/h9VwPuYdr8BjUI50pJkmsjRQ5YFVnVe1k0O0oixfh/Jo4IxUgpUqztknrkkv1dXRJNNNkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA2+efW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SMgsXj012164
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABiB2EaBL0RQGTqrly8CkIvf54XuMQfSPZGXYHXlM6I=; b=jA2+efW4v5n6fnYL
	HjjKFBO3jkWJErEFAZhRJYeNbgOCcixJwTXFh+s72bqH3JhlR1akjAVujKVcEzxN
	5hmDRRlY90ixZTGhG9TMVM/DN5ET2mUK9XLLHgKITjezkJ0hqurM5YNZ6W9UKGHm
	4taY23Az8stHmNMbXea0Rt6FjFaeEuY7lYBZfnDeFM4NtLs5yAlXrP8CKKls4Nt1
	I25q0M9jHPlcWMDWYHI4seCVbyT+YpBXXzN0VEpHDt86ZGj2QznaCfxMjz9S0L+P
	xJizjgenI9eEEtPaawuWZ+juOO11PC2Ep573nQ0LbbFpIUFpmEZLLzFxMj6E91yS
	znyYwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk6vvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-240607653f4so5303665ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767781; x=1754372581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABiB2EaBL0RQGTqrly8CkIvf54XuMQfSPZGXYHXlM6I=;
        b=hTnXU+1asnhoYAy/Ywy6KMhIv+WrzeCA211hIx5R7fqLItT3z5FbmPnYJDdlhT4V1Q
         Vx48Z91ffPhA6qS6w/KvcW/+NAPih29obX06Qrj7dR9zDuIByS9fJpUMbgMeG7DT9pgV
         7dTN2S5k7FWBA24Kv4Cr9EALwrgo2aCJpSrs1fl7Eazw8s3xCryWsqC81E1pVmx6C3l4
         IM/yOwtxNgYoQQi/depkOXQbbdZpuejehqtmnI++hlL5w8YoHbzPLaRgh6nudvM/tVxT
         NkFGrMialvTwjjk3ATbN78F1dqGS8K3k9LcSt5vERmtdFR3bskfN8spBD49EV7ix8JD9
         dwew==
X-Gm-Message-State: AOJu0YxCrhOep+0/f2ejsy41ZYP9ad+HcjUKOd7VlGpLcYnCjcyRRB64
	HFRInnWbSrIsGWLkk7ogMCskFsh67Tdmv0REcOTzQxlQMhul0l0lCcE4APzjHzZvxfahZ9zA5vv
	uqso8vRxQZ+JexsVSjvsr29QcO/ZE+QR1YK6yF2Mltn/Sb6CXmykTXOBzkItXbzD+etXD
X-Gm-Gg: ASbGnctK1RIrQzViUwQskuCJpnRSj02sUItWhzHdBeuSh9l/HdtQ9Ba3jS3t3Bk6nuz
	9qGuTIws9gLgSskqFLZYU8HWXJdmuigdOZAa9MJqZzFfIoe2rsW32Hl2okRlHWdNfnUfqBa8+DS
	NcJmA3Dq4710NgzIL4jekzCnlVNV2w4p/xzIOaJ83zZg5O6UoB4PvhDLoojXgihqQf2NG4if9DM
	pnJF/D2OavCv1nrO0WcOTBkkrD4fDb10+MQXkIKTjaUWduYmskFRTJn0imjjo4Mf7ziYgiEp2tP
	Vp5tkxSvU3X5lEwFDczEkYl4hWVk5GUZeGI0yvyuFrEZ/iIeFU7Pjmwu+ZAayYbT
X-Received: by 2002:a17:902:dacd:b0:234:a734:4ab1 with SMTP id d9443c01a7336-23fb307cde0mr217608455ad.3.1753767781205;
        Mon, 28 Jul 2025 22:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK2HfQt/aXVHTNGav8XxlNFH6DIHxFwfWkOfqcuf7P72UZ3A45H1KrBdKTpa7wMe4454xOjg==
X-Received: by 2002:a17:902:dacd:b0:234:a734:4ab1 with SMTP id d9443c01a7336-23fb307cde0mr217608075ad.3.1753767780731;
        Mon, 28 Jul 2025 22:43:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:43:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:38 +0530
Subject: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-4-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=68885f66 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HMeQyL50y89bOeNLT1wA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iPjQO5jXmsjPEJ0zEmHd6OXhA7hSeNuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX1uJ3c5mBD/f+
 49N/m0lx6ZSeDD8EEK4D31+yzvmdsZVXKSCe4m60MtHlchlTH1kjMuwBr0b9srr2vMlLh+IAJQi
 dN0e18bIDoGEt8153x5t3kR7xzP7iWYFBtZCAV8pRJW32Lck9fAexcKVz19jsYGv5sjJp36EKiq
 XCQB5WwjqJjib6VNGqjGsmoSTInxb7r0mvGzFVDkxCaTZ2KeY/EpAAWqDpVd3hRfWrUIMVj/+x8
 NuKSYFFTHvzA1uDAnpfgwmY7mLI6fmoyU/f5mNenIr1ztItLZe7CoxD7alXb3pfteLxs3GOve46
 6hnnpzfJ6WQYevMi0NXbSLfi2accaK1oABBp14dBsQY2Utj4gXRwMpjc1GjQUKeMmIYyGync6fy
 GtEPGp2Zyu1YhgKk6q7ch+1SUW++sg3Nq2H7eYrEPRwI1xoJexfhDLcXtqznI+eexsjwnBm2
X-Proofpoint-ORIG-GUID: iPjQO5jXmsjPEJ0zEmHd6OXhA7hSeNuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290041

Add RPMH clock support for the Glymur SoC to allow enable/disable of the
clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..1bc1333087b4cacfe39793dd19d6bef3d17790ab 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -388,6 +388,11 @@ DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -854,6 +859,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clka_optional = true,
 };
 
+static struct clk_hw *glymur_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_glymur = {
+	.clks = glymur_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -943,6 +964,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},

-- 
2.34.1


