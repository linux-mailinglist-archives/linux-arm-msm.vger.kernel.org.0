Return-Path: <linux-arm-msm+bounces-74698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BDB9C6A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C3517B61B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 22:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5648A2C1585;
	Wed, 24 Sep 2025 22:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOZID/tC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F62C0F6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754755; cv=none; b=EP5ad0ebBLGWBCNxsIhfPQWwRMDahyW49+orcwtsF/14ix3n1aI4ear/sFC0wzWlffki336Z3Vu4/qoFb/jWUc/hrbTqb65SktTMIe8+kJBzmfuwhROaYwBhkq6gPU8OU3FHdEp/robNbosaRuxx+XUaddf3Nc5b6b/r6J4oHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754755; c=relaxed/simple;
	bh=+c/O0m1x3edzUIFa+04pkOmgDXQIUrfeFCvIyQf9n54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1mxoMp2vI03kArZyj1GllLX9W3daPhnDe2QC/+kESsm/0MUmNId7FV5vrKRNStaeQXRyQq5Ub7hLE2QoNz7XvQc1WpyCM+CJ1EJoUwUGW8kDF4urKW1hABYnm/upn2p5H9VhoxF96s8FN+OaYnBauXBaJ9EeBd+hrpEuMVuKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOZID/tC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCAsD3002792
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilihenFi2/I8yXXbcTtIdczEo4jrckamvqpegFyURUM=; b=QOZID/tCngXRv41W
	oxDXegY9YOiCSrY0IjjPTySzxWWXheZ4KHWKz2WbdaQ9fKaTn1n+dxTlY0URKsgz
	s5SCdDKuJ/kYxfGXDFkGjbTSZS5VGSk0UqeGPZiv5MDUMgpJ3DOS7fzfOtO6+3Xw
	aGLACWqFAka6cRwXoOKg+GonJX3gOLl/n6KIfzlz5Z/WKOjrBbBj+aBJz+vP7XbY
	ovZx3ivrILR4ZpUr5LC1o52qBSgx/sROWDRJzb51h3rV83Gs/FTChZhO4oYKV/kJ
	XEpWCLklLZThEubW3RNKl/CDlpC6XD6hiSEUnZ8zTdGF5KHi7mk+4eTMtHxjTgu4
	eTcFbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0h62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f29b9e2aaso617522b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754752; x=1759359552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilihenFi2/I8yXXbcTtIdczEo4jrckamvqpegFyURUM=;
        b=p4XSd3uUuRLs+/0iuddSdbggLxzu5DiH9pXF+R6evirzRqHekBZeKz7AcbADnZAQYU
         ONeVs0vthklePrnBas8PcsQQgTp53tsgsIWKacDiE883sC8vs4VSTm3nEHWtaCzDEI/i
         uLX7RV6SPqZlJ6ADWpHApJRfPv7FcTvaMvbFs1Iy7G4vmzPNLFwaYv6SjLgr81onKnDl
         4XuXGOIs4e9UZzndDSDqHIQAmkIS9LAnnIuJolCu9oNccHnCQ9x9gelO7i7Xl/RubKaZ
         M2IwYTSyWyKJ2pAzRN/gLlPZjh2ha6vZInoLHXjVROLdodD9BOf9gBAxvd+cC90at9BP
         6dYw==
X-Gm-Message-State: AOJu0Yy0T6NVgNCu0euoOGsbKRGVYW3c5Hiv/9Evdg27t3wxbTU0b+B/
	8VXwTZaJxxZWeT8meO84CVHgJ9mcuSEg5f08aWbjzYZPcpKF7aqz1E6seF/H7tJfbGmfFieB+oX
	DizF+ctPxHGLO7cdFeLcCX/wvF9/9B3fo0sRuoqYlZ/WXVCgJGMypa9TIjc0jD0FbdWwX
X-Gm-Gg: ASbGnct15t1en4D4vj4ErvRaAQ50X2uya6J8oLSFQ+j5pd5Y/5LAeZf0XeRIJxN6gHz
	Cj6yDqrF9ta6l6EeLU1zRdYFNiORxxC4CBbuxxJAgrFftpCE7SGoM+IW35xK3faLgigsaB9+YKX
	s6UFfxT3CfXzIym/KTXfeAUhYeCVeEnCfGXJdZv4Aws8kSuC7JJqpOgwqCpecadgnn19RUo0Tpm
	LFqTMGr3q2yHGqM8oLMm9kzkFD7Hqnj7NKwm/eftAJa4usM6fW+DssMPog6xuKlz9a6E2njDsYr
	rjx6jMXGipF1MhsaeTjewLRD7ShOJnwopkfnYp9s0R8H9unWWkxJlwaoV1hysewVqvJGgYT8B1L
	s021iuCXwvWPXu4I=
X-Received: by 2002:a05:6a00:180e:b0:780:fcae:de6d with SMTP id d2e1a72fcca58-780fce9ffb1mr1665190b3a.18.1758754752100;
        Wed, 24 Sep 2025 15:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj14HxxZ3uzbiCi78rxXYfPoMzU2YTSNowqWs2CPk3vaeSHv2I6TKn2g4BeyUdIWrIcWkvkA==
X-Received: by 2002:a05:6a00:180e:b0:780:fcae:de6d with SMTP id d2e1a72fcca58-780fce9ffb1mr1665164b3a.18.1758754751687;
        Wed, 24 Sep 2025 15:59:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:58:59 -0700
Subject: [PATCH 7/9] clk: qcom: clk-alpha-pll: Update the PLL support for
 cal_l
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=1911;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=TftNAWn7+tFc/FivZsdhBulxwhyQfojqz0h3+kX/lVg=;
 b=+7YP53ADOyVjQbtECZrmeUC37vzZf4qyLNQsaSmA7xfg5pTZoy/AlzFMISPBhFUUkYn1lFRUJ
 0Lf3xL9758eAsF9ln0zWDOJv0FMWx2fybG/FLvB3yDBOACHyNWIQ1xF
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: uMCAHwPKNURONdChUmAJZCDKjxYYV5fG
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d477c0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=oquIAzZO8Z25OepLYD0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXzn6Fe5BA8/ZJ
 03UjbUvNrtcHkBfhTMUZdJ3x7j88DDfB20h99QAqi+Dp+wBOO8V5Nf/dIqnHCezDys4onlyDweW
 IMqRmoHXlEvB2ur/5qZSiNGLko9SnUiGCw16Wb+63nAlV5oMRmqBm/8jx8ILvoVTunlD4DfG8Pl
 K24Gg2G7ospr8v4o/56Dr/HRQPv0Qc1CG1+O1cNVwofC9EH+fwbdGBupNiBJn89XCbfMukr3QR8
 AtFUI+T52QiNDWeO6J55g1G7oLkOv1Kh4qPFk/+HCJGZdvv/YtpeObA+YtD5ahbx80ci6JKJrjC
 UngcMibeS/iG9eyDqPL3ixKpdLAyvC7HOovVgab3F+HrskzLBO/L6MebGwxe1JnYpVP3F9HScgO
 qHcp+9F/
X-Proofpoint-ORIG-GUID: uMCAHwPKNURONdChUmAJZCDKjxYYV5fG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

From: Taniya Das <taniya.das@oss.qualcomm.com>

Recent QCOM PLLs require the CAL_L field to be programmed according to
specific hardware recommendations, rather than using the legacy default
value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
behavior on newer platforms.

To address this, introduce a `cal_l` field in the PLL configuration
structure, allowing CAL_L to be set explicitly based on platform
requirements. This improves flexibility and ensures correct PLL
initialization across different hardware variants.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 6 +++++-
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c1..6f50f0c4b984 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2338,7 +2338,11 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
-	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	if (config->cal_l)
+		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	else
+		lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
 	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18cc..ec5b4e481030 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -128,6 +128,7 @@ struct clk_alpha_pll_postdiv {
 
 struct alpha_pll_config {
 	u32 l;
+	u32 cal_l;
 	u32 alpha;
 	u32 alpha_hi;
 	u32 config_ctl_val;

-- 
2.25.1


