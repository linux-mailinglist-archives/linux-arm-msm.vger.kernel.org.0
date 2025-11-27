Return-Path: <linux-arm-msm+bounces-83652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCAAC8FD71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E12EF4EBB4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4662A2F5A0A;
	Thu, 27 Nov 2025 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP+9mUlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmoKtUZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB32F6919
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266343; cv=none; b=TXkh6B/l5IUjPi4H8a/LATj4hYLtK4TkRMCCNqn3ihPr9e9r+bi+z0Bmqt3l1iMG5hkvhrMd2/UEz8TNopYxTvqwTWLsygi7vWZZ8TaDMPt3E+1X4ojHrEFmic/u0yGRqiDkZvZ27vicpXsC5B1wqdxvTBlxpDHctIqWAVCV9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266343; c=relaxed/simple;
	bh=3EtaK/Ap3qzlNULqdLpObX67a8X2lyxz27kHHlljs+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OO+VPi8SrtqngolMtU/M626bSUIsaycrkY5g3TcT0j6zxXlpenfPM/WyGBFhXwrH0we9TqLXYkXyBMPY9RaDr0ZEaKNQjMXl9uXCR7VTgnJXe/J/O6P7BFYe8Q0ViA+MgFhDweoYBZop/V6XdeslNAn09Ho6sy3seZ74/F7mZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP+9mUlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmoKtUZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9UGj3685306
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NB4bZT0vtjfLMUEWEcAirZBlsWCneJ4N9Y0ZGs8z6dE=; b=DP+9mUlrAF9dA2CN
	ynBpnLk9suhdjFl0gmgHsm9s6JIUfI4sWV/n1qtiXudyNBxAddUVSm5PTdVkJOgC
	/lGMI6utQkf0Ig4f74YJPkNVchtw0v3xExskgSG8nuOg9i7pelHAVbenbcuR1Hbn
	e/OlWIsbQfH7fppWe67XW+itGd7ud6K9EGJVL1BO71sjRFWw1Uk4H0s6vh/vMErf
	46UPIeQJGNnxRK1sD4dSGKwHlF4xWCNuOwRgMacxR/b2KZnmlwgK6b/KEsfikBJu
	Wh8w/jUs7WoTMryqbE65fImuLlpGgfr5dAMH0wHpDJo0umMsRzBXC6jOKkJS2qHs
	aarFvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rs7rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:59:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f8a2ba9eso19526495ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266340; x=1764871140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB4bZT0vtjfLMUEWEcAirZBlsWCneJ4N9Y0ZGs8z6dE=;
        b=WmoKtUZ/RIBuhs1IZmOJqfGUkegtALg9s8k+ZykCov9QgtjvuvgiVMqGRIfG2Xg2fy
         jg5dyZA0zPL9+jgU8Ar3rvqBt3woPvm26cjAPBsq9+Fti+grwIRQ5b+jbqUXl9SqW1qH
         NVnE+ohZ5OBrvZp9uerM8P1FAYIro7Vy9hxoXVhOsyxoBqBEKsofTQHlfK1zMMuLBIxM
         Nk0CC22YK2+NM9dyouOriUmLHUEQRHbR39fBHpcygGYbVMpJLLipxSMbU6lt0c6t4I2F
         GoSqZbYV9iOMBEmBrhH1ExwU3sHxYD0zOwWEfRqHk60KKx4YTVoIhfxsm7HNfhuqp/PO
         JIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266340; x=1764871140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NB4bZT0vtjfLMUEWEcAirZBlsWCneJ4N9Y0ZGs8z6dE=;
        b=PaeAQJJHoBxR7mgmNAdMkXnvvSdMNIBOcZQX/YvgCL09O0rRGQ5FWVVqbznxfc7n9S
         E7CATt8/fS7vadU1iMFMSp/LnBgOITpzrC/xXTzcVErFnhxHwgrw91CnsKXeWnhZGtr4
         JprU4PiAvgFs7NvFPrB1tXLIoFOHGpNEEB8V5XjQRD8AnlNQLb1KQYdEKDG5t2HspVtN
         USjDjc82Wk8QxQ7myiAuGuCgTAdL4ivP0UigSLwyo2/SnXVqvfGmKP669MYAsfTlRrWC
         hTD6cqheZvtIelGz+7ptvbWBqdZgaAqxwv3EIhQhvA4n28czyL/rAtYpkGRSxes5lI5u
         W1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6S5goDwEDY2aL58VP7uobqykexRUc8wTFK6OlUrVZYsq9Fy8H6X6Sh48bqTo44Ob4PzjIMnCYQnu9cNIt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7amab3K8WckM/PlKJJl9QLLgR7kTZQc1htbjnL8Sz5oZBaCKI
	ldJAbMFkuf+JbkV+y0C5NLKDC/6gIRVKdIDNQy7QN2PTBZpbo9QA2njNhYgZI/pr7Tmc6uKUTkJ
	qvQ/N3BCeMcgxLrPT11a3el0UWhNsMW4/mD13LZQuakEXmVcHCFpGl4N+EzGwYAGPTpz3
X-Gm-Gg: ASbGnctTJQRljymsbT17uU2EcR/GXxp4UVPlzMCzeJIrcyyfbIEgXYoMsyKTwmRwDc7
	8Bh8/p13TyXrX7DCfgLTMGHTlQUpgi9Iz8ldkLWEx9VXAAjzjHILZOyCWvzQO/S2b7C2MlEKXZI
	8OTZ45ycnUi46tkJrXLVsTkv/B3vZiH78VVT9WFBIuuQ0KjfUy3LApgK8l3RDYHWK9uNBsA7SU+
	5/8su5Xr1fXJ+MMxbsMH7LMeOGm7eUxt9RI5lAAbrzCfqEWzT76brAt0+ObHWMVOapAslgacs3t
	/PBvgMEh3BDEEyAXVPh+Q5XOWJS+AqPFA738dfrjQ9gjx4uM6hBRkeW6ueLCPL+VscZS5920+1I
	pRMDOmHDX6tCdNvKjApSCFD1eu5Qph+OS6nT0UCY3
X-Received: by 2002:a17:902:ebc8:b0:295:290d:4afa with SMTP id d9443c01a7336-29b6bec6564mr247105895ad.23.1764266340191;
        Thu, 27 Nov 2025 09:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwvqIkNus6GsAAdWR8zjoVzWJ7RnYXcx8VVP9ZnJTN3mp1wCnsXH5d/y6jph+qFGzTSrPEKQ==
X-Received: by 2002:a17:902:ebc8:b0:295:290d:4afa with SMTP id d9443c01a7336-29b6bec6564mr247105715ad.23.1764266339743;
        Thu, 27 Nov 2025 09:58:59 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:59 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:43 +0530
Subject: [PATCH v2 8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX3eTpMtPJw4/2
 /ofNnThiAkSQ1FjkEoMqLI70MTiaQRiG1dyNLsC0826eS4uAv+tzktV1gB/oa2OEeAbrm1nPoqr
 zcs6X9EXecr2Z1IZMnERHEBv2N05hdb7WaKeDpYWJwCDSrIbpagKFABlGiQpbDIXxFzyUJCBKFU
 t0eEkiklV22R9kJsVcLXgUg94NJtZQiuJqS8yD6Wd+d/LX5vtnUDe2FgD1zt/ZRA3UzVGArIUs6
 MotN2bmIyj+ZeGpZhx7/obrM/shcSqZpneuDBCfHS2DhRr1fECkb3k46ph/24NdyHWoI2W2SOnw
 DCISWRNO0Zdr8QmzFKRPI7pjOyLUjFCb7jOrMhqdtvrErargfum8Sida5rq4z04RUP9snLzXZyq
 40CpmFJNssCscWO2qp63P99GMxaISg==
X-Proofpoint-ORIG-GUID: ZoMuEPR-cy1QVWniF_7ZGAP4ZUNEwQhT
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69289164 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BHyzMCWm4d9bGE0EpZgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZoMuEPR-cy1QVWniF_7ZGAP4ZUNEwQhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index deab819576d0e18afb0b699b7ec6fa4c155eb5c2..238e205735ed594618b8526651968a4f73b1104e 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -2317,7 +2317,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_17,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_17),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -2339,7 +2339,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_3,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


