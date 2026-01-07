Return-Path: <linux-arm-msm+bounces-87825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E980CFCF40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 10:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64E32307C081
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5BF32274B;
	Wed,  7 Jan 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I18Pnfui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A08WWes7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B7320A1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779014; cv=none; b=RDV3QSO1bs1CTxSWHZk0PMaV45cfMsQMN6z5p3s6DhjhPZqdtx+P3E88hv/ea4ebfhbAJ3ltPx/n/K5pILHXJUCQ3S53E7r8+Kxvqgth1FW5SzF5poJuuNDLYac7BUVZtvCrBVdneUils+zv+eKgqaXSrgJp59eC44HgQcpJUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779014; c=relaxed/simple;
	bh=rGL+a7GW3mkjYjbhl3ql8cfub6fQeerzdV/sAh0cb+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9UVimfbJkVbePdrcyoO0j5WPa4fPyGrfTjIOJITmaadohMv1B5g4vdBgvmeDW9TEMObxzpf5moFzCAiRiHIUUQu2BX3VY3ccU7r7UXwtwCRmwAcjIVHhf1rQlmKdHqNKtpAVNZYvBixqtMuZ82ulrlXtrRqwRwuUxEuCsSYzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I18Pnfui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A08WWes7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074mBlA1643003
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 09:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=I18PnfuipaqPS9wX
	kF9iKeVqVxwr/RMebUMxFldv4ahClAXpe+Fg+56naXfIltprBLc1G+gFIVD/QhcD
	iDHjCi2dqQSqny8BsV3J+pyga2YvqeDDrll+fmFr4ag7ekC7U9aK0Evj8gXtYmca
	/8CHnwKGTLjLHU6AIVGYZhDVAIhv7nhOzFqjwOHreGrMGb4ZVQdONcmnOZ2TDRYx
	rQZ2f30PyIy66ikpRdw+NbdC4g31a97seoSY1jt40JyvQcTofvYYxfvYObUQPzXt
	qamYSDbSiXx/1CLZUzrIPy0SmwdJ44jdMkQjF1IjEAOVaEyDOVC6lxUnZ1tHSuBn
	+od1sg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfgwad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 09:43:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso2958082a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779010; x=1768383810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=A08WWes7c+pPb41tWucEdLnPzklQCjwJA26Ka+SYRKeH8vmLv3WTGRa0/i1FPdISgC
         2Y/cmEZp2rn0XvsWn1fW6DY+YFPu9VFOzM5T5v1RSYE7zb2wik3VFyrQL5A0PuokGrsl
         uzXPigwk3w2cTosKyn8WhsTNTdZrdR7K0lnB6WmqcBfTznvlfzf/iQlaULbYK55ZXVb8
         4qsYkA4g6LCl3JhgqAaeb2sYsJi/slei51kd4GRpjwjCGhFdztTF7L5EQ7BGZCrknSDw
         q8rZCAi/2Bw9kMDCRihEjF5HAMuNyitkv9qECj1/+W019ShmGGorkgR9znB/QHkjzWtt
         BR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779010; x=1768383810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=Y+ZxSOTMkgyysB5bCOrlhyeVc9AJu0NNyk3a4Zlt8gRM1btX85peQcjuH84/b1CtRx
         FORQH2AXcFHRXpS+BZ2YvtBatDJjkTPn3PJbA3pUPIh98zcyAOAhPBETH5dfdslQqOR7
         pkpqbAS3gDwBPSL6cA/L9NS6iAYLbxK5rsiKLNg4k1MctihiB0wv+Tq9ypJ4Ubp812HT
         +38Qn084z2wcokcg/X+R0Gc7KO24ds8fd3orrPTbiCoTerAcX43Nj/2az1OuPKAxZCPS
         G+zySwxiPadib9kiiFBpPY0EMlXUbwHHFaMkPZVsfQ50Q8TJb8wnPHfggiKOKa6eufbH
         ZXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUiXlTa41T4usTpDwbviVG41Qv3tkBEBUGri0e4xdLBG6xmMUQeLoFT4AqMIZ1MT+w509ltR7Lxg4E1617m@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyU7XHIycWVAD8Xgtz64+hrVulGWYnM2E+fhgxgnetTlYXJZ5
	PRP6KTiymo0gG8zUWZRZvGgMWZ0rDmx/hG/Ngq8E7p5MeQY5gQ4xYiu+FkV9mNLKbCBPF6MTavF
	K+JLlVev+XHW+OZxCziDhFDaZteCwsXFqFLF5jfvLbZlxKln0y9TvFzm6KonUeoSF24fw
X-Gm-Gg: AY/fxX4c05RSg1LX7xIsbjptklvQqJy5JdeOJWrNUMjJaG+klvxgm4hzuj7mF/rjhsG
	1a7RzlWf9s8d9meFiwJ/4BX6ByP7BVhGFrwkHGTa1Sozn6goNFg9Jwmpe0PgGPXWHCspsH9aUp0
	bYGcuPPd5kQCs8PK0geuU4Hd9TzJU+w8MABwXCL8SKlF8U4zk8Z5dOiDJH0TLaR4bmyOhAhK24g
	a9s9xpmRvVpr7jdvjlzLsSJz1jEVC7/WWfkaAXfmivEEZMR9AaiiDYqzZqlpyAoh6Zyl7dJBBhu
	znz94Fofs8MSwTVB2yf6XkLj/c90luvMpOhzuOH0OjwGosjD+jC1r8Dqhapc9tXhzP7m1UehaDU
	T0gMxN7bIXFq6P9V0TLILp3N6Qr+mPkiHFA==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id d2e1a72fcca58-81b7de5c201mr1814971b3a.19.1767779010374;
        Wed, 07 Jan 2026 01:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMv8PnJ3CXFfRzrWhWCZsWCgO5o82SPURinQIFa1qFxjuJZcsiNvT/2i/W8Cd0JCfLWwcqdQ==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id d2e1a72fcca58-81b7de5c201mr1814953b3a.19.1767779009939;
        Wed, 07 Jan 2026 01:43:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:04 +0530
Subject: [PATCH v3 01/11] clk: qcom: clk-alpha-pll: Update the PLL support
 for cal_l
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-1-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX2kz8ZsWeBzzp
 sBSgavwSyy+K5D/t904/sTtmJgiJAs+siWHWSstRci4u4pkHlAwwS6MHUB3g+zUFfcWPk0jmWca
 plBAi/VG5h212TxaYsYvKqHT3c+jPsoonuWA6O4nm7DVgo/Snoqa5Mocg+fsWLy+o11z2t3Mqyo
 Eztp5fdYc+7s4zzvgBZtUl25Jk6KGX6Z7QjVmvxvECHGviA5+Hmz+CL8HcdOTy54DAvNkNgbGdj
 AKD+CPIKh6fsTDtWuX/iO4MtBoR4vuRgsa7TIVQYex/jm7gfMm1FbRujtg71VidVn8z7J1RfDo7
 FOeYSt2sFz1g5pMucn6L5UIi29V3QOa9Qm9+6HX/w1IasDV7mHa+0nioAqHLZ9FLldkaT2zGZ/c
 tmzCHAUvlWSjMu0+k3xkHlf1SfRDZENhxHbS6BHOqcBtnknWzQaMcas+I+JHJ21RmMCaher4Ww+
 /I5ZLkaf/LhTUNGNnEA==
X-Proofpoint-GUID: 6whbsmTd9aAvsGruAybPBgE5ypiKStUf
X-Proofpoint-ORIG-GUID: 6whbsmTd9aAvsGruAybPBgE5ypiKStUf
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e2ac3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078

Recent QCOM PLLs require the CAL_L field to be programmed according to
specific hardware recommendations, rather than using the legacy default
value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
behavior on newer platforms.

To address this, introduce a `cal_l` field in the PLL configuration
structure, allowing CAL_L to be set explicitly based on platform
requirements. This improves flexibility and ensures correct PLL
initialization across different hardware variants.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 6 +++++-
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..6f50f0c4b984e991982ee8914a496c00c4ee063b 100644
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
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..ec5b4e4810300fa787420356bb073c24bb05da62 100644
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
2.34.1


