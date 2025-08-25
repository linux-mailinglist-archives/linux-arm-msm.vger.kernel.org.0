Return-Path: <linux-arm-msm+bounces-70760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC9B34A33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 20:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6444162A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 18:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208CF313555;
	Mon, 25 Aug 2025 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bI3MsBQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340E1313540
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145995; cv=none; b=bd8/iPhHQ3zRb6VCMrtNTarsfXqQOM82QSIHRBQGnLAtlthPSFo5CK1918nz5DiEYJshBLQuKx+qWnJpnsfCuTJspo5wY3suxmAxN3KwdYMVH3RH+UjBWozNcoge8i5IAsOgimw9fHz7ihmAU9dE1Q/zDT3A2YI/aXCAQJ1BA8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145995; c=relaxed/simple;
	bh=h6RXWbyefgEVEM0BmVWVfZH0vo7yywZji3SwzXVLnjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSWeQzGF+r+Rflfkk8yoIGVkh5EfaphV4X30O2TJ9z5rVJXeJZKubeP1tQetEABlMrZthT7a11tRHOg8oYEs0nvbJSR+GGzJ1tgUERd35heY/tSxyRxrJFbFZRsgQihUOrZ0HkRJ1ImKE9CgZmbcdsZC5Qa1TnW30gVBgp3A6bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bI3MsBQx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGjRpb020181
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=; b=bI3MsBQxfv2wJLFi
	9JQ4xfCD6buVnzIAOl9omrpuyipgxkb4my+UekwMw1mIRL5u4wobnh10a7RRWsVH
	ICZPbjfy5A20ESlgqF1LKjqoY0Dzyujcl0LbFZWq688wrjcN+dwMHcotNzbRfVOf
	f4E7YkAdDKXkIcfzwWAGn7RM2MNuJygWi++JCWUYZQ6qNV7GXQZLomhaL1H7Q8qF
	ayHKhLNJyLxkotC8N6tcgimvj4ZJKQGYvw/LmpR74NbAQXuYZbomAWBj3ktBSnzu
	4wTRAlQwKtdNDjtoiHypCspAHhhrNhezj3gnsrkLA1yatTju0CNpdYWkYPvOXGy9
	6NvTFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unp1a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2461c537540so47591175ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145991; x=1756750791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=;
        b=YP8rGsbwAQUNVgQK4p46CJJVBzsDpbUkCqj4Xaq5HxFN/8RkADNCzVCbVTgejiJ0qy
         a9yAe2DPfIPJIzVw2DlAkR9Ae/FJC8Jq8Zw/D6KdmkUgRbZJrEXica8J+0qSRBauVe7u
         WTSr/8hGBH+1d7UOxJtpzZyxufIV++HDh/+bUaG72JiESMM2wM6sC63Mi5+V0eppuj6u
         DK5dxjjoEiYqZcmCnrh3Ncz6QLx2HZv8Wn3xzidbIj62B1OhJXWcgo2dGUfuRahzpJUV
         iY680ANwPs+hTn5/V/oLzkvveCzp8yObLxfqVTicJr0r6qT/WWm1eYYHO982idHCDW5W
         7ELQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaTRU6iZNR1hvtA0cL0nB5ib0VzcT9jN8850rge76iJe/lfij48jR41p+0OXqySKjtSozKTupGDbPYBNH9@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpia7q3VK/7QzyMRZpUXKSgQci9Dg+Tu0t4RZTEhVhWignK9Y
	mMXIDoIxm/ceFZM9BbqEQRurI8KwPiBtwNpHp14dnwOwRbtPw82VBjsmiOumMrAHWNCK21iwXzl
	1ejlJocWaiyB06eYjltnZcQS29LUkMm9b3cFnm8xa9LbxdaDXjSpRo4vs6MU2sn4P1kxH
X-Gm-Gg: ASbGncur4XsRtgO5vkr6xRPQq2N1DDPJF4A9xssLhonlRK8cdVlL6Md6i4tIzaDSYFr
	72TH/T7nQBw1pFLOt/3H7piDgON9iFwLRAckf/VGuKDQ4bDi40UQRE+/Sr4lWX6EylMXW/GlviK
	sWsvtfezIpk8XZm9c66mYrwrToP97JD49Me+B6gwVqXShahSO37W8BLwoE9ipkoVJsCojce1Ocq
	zqRvu2yvNHGKYiVHFnCpWfow9OyLKvsAiLTMsW9Klnjc7hotGQDZEA5+Ttl8bumhCNvPX9XRQYc
	NKd556BK0W5Mawt1uTzANZjJtQdvrS14uRiRuTD7KRH8saJ2RMKt77TEM+FPW2sT
X-Received: by 2002:a17:903:2105:b0:240:8fa2:15d2 with SMTP id d9443c01a7336-2462ef440eemr109453205ad.33.1756145990740;
        Mon, 25 Aug 2025 11:19:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqGpGu9nyoARN82aFs3nmiW5nNqCgT1gPGMKlJWpANuLc/XS090pHBPwUfr5neFxpCrqXAkg==
X-Received: by 2002:a17:903:2105:b0:240:8fa2:15d2 with SMTP id d9443c01a7336-2462ef440eemr109452925ad.33.1756145990294;
        Mon, 25 Aug 2025 11:19:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:49:12 +0530
Subject: [PATCH v5 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur-clock-controller-v5-v5-5-01b8c8681bcd@oss.qualcomm.com>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 9-mFlsEFwnTCqj5iZ17IVB-Hgj9QiwPL
X-Proofpoint-ORIG-GUID: 9-mFlsEFwnTCqj5iZ17IVB-Hgj9QiwPL
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68aca948 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX49kI3sLmBIMa
 s80hNXrhRy0s+dkJJQ/9WXCYyHPanX7nN3ZX4Bo3qsKXUfcHw8WETxNx5p4Y3v9WEr6DZoiK2XY
 vO89wRchSvzHzsSQpmpxkM50rxn06lJC3kxq9DH58W+gfTfsKc6vrYN3yhecejkjUURdzwo9llf
 uqfnLWZVSG+PrNfkMmZ6oIrWwKDEloqqiYFJI/NRTdlq3YkKr4a4WEd0/lzi7W2cLbapMSVPw5p
 1gTMcK+GWr+nPj7WTV80cZa+J4fkHH+NWOKYyEJ2rIylRqW2OWgJmiuZXNyjIZFJUFc1qvy8uOR
 fiWYYWvuMYwEAm+xgTG/73S0GWOvmnYZcFECwC1hb1xQNfbd3QwY0h0m/qmKteTpdOBUAm4Yye+
 g9V0Tp0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e..0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -29,6 +29,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -192,14 +193,17 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
@@ -233,6 +237,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1


