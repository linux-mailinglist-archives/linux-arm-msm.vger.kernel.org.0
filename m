Return-Path: <linux-arm-msm+bounces-87780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4223CFC13D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DF98303C60F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA46026F28A;
	Wed,  7 Jan 2026 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHSkDbrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbMzPkRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F4265CBE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764117; cv=none; b=uuf5TNtjGpTLmf+bmnIbc/czP3uPz+kotdBiqJaiH6BF4dcRd7WYwTd5Nkso/rGlN2AZ2LzYn449U8mhZz79U78fiELwh8lW745qn3cgHP43HUou+TMbIS2DHNiR+npS2izJa1tgtXR0WTSp4osNPnfVOZ0DzJq5KNNA8W1DJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764117; c=relaxed/simple;
	bh=6KcYHw//2sUplPbK8U1Bd+hDAoWkJLtkjZfQ8HvTz7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Of9AtpmK7vS5/y7NPMSWRBCYg0XSdiFT9CuCgndd9ddiYBwftJ4ehCwHvQZkxv/mF4qKRQar/JzmAQIGtNN0Zr4ZH0SFARy8m2Owd5WDGioj0HtjbxTlWW+yQ0dMsiUbieVSOBPNauKHfNuZ1mMUWs3QS+hhVA3XN1GBdqr6jCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHSkDbrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbMzPkRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073dGgn4091593
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gaj3FGhPYKk+8z7S9CPgUXh1ipZIspnmHtAZVmFliws=; b=lHSkDbrlNFmfVPed
	qXmv0wshmHvZ5jO4lFQWFhKLEtrsToLfHmUWlaahTgEe0dH5i/PbOIBHRnYALcUM
	mxvOsH+2JNxhfo9AvNQlUtEbAkythJVzZYDpWCu4s5zsv6ZhB02dOgn+ESJ4LbsT
	u574ODIBbXy4M2vdEDOWbFiqQzHz/odFnEbKqI+9IIvPna1YlwtUUyVaHBU4xC87
	HNnZDrEI2HUGXps12bqgmrxep08CpIhUJOdE7LwIhTI03orQWGY157NUCa5ggG3r
	02cQpai03aSpp/my5lxckNos9yON34BWajXWYQsI2NcUWXIhH/7HxL4ZpWMbaLBv
	nd4Otg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyunb71d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:35:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac363a9465so892313eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764114; x=1768368914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gaj3FGhPYKk+8z7S9CPgUXh1ipZIspnmHtAZVmFliws=;
        b=fbMzPkRdWaqwim5if1s5TR+WAAyfed3uFf0DM2DMjJAnc1AsP9Yw6fsCL9ruCbKGSs
         LnBBXnHjHc5fRM73Afe/vujIMVLVXCtB2GJl4pEJYixF+AcTPd3h/Tjwp1Yo0TmPye7j
         gNgBZlrJtEvlK0ZRVVEjjT4OKtjuou9vLLodj5VejHgMm+Iv4ru4iqYNDLnBDTQpiIia
         UDvG9GhBuyto7MJ2fEz+AkKcmF1UpMlh0f95p3a3IUh+1FX1A30yzRciq2CTkV2jZlwB
         kRG0ih7UGvkTs7ZbycQqEq1L5xFNOkObisiUWE+VJj5eqvpRwdNFDqYibavcSsr4qeMg
         +4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764114; x=1768368914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gaj3FGhPYKk+8z7S9CPgUXh1ipZIspnmHtAZVmFliws=;
        b=ZNoyXYNw4+WKSn977ZCEF/AKhZl4gJiRgxoenFZYBT+MhNP6VaAKfbpZ8zMlTR6OLP
         h/aioKAl94ueJb76T0n07jOtX20fg+Y6BydWj73+OahjsGfZ+6+7ugqLXh9JDsm+12ao
         wMwL3uzdpFYoll3eBE6Oa/BgLx6dnWt6N+FkRQIXgyTFD6b5Md9+7UHHZcxboHgCpA+u
         KxmmkQ8j6MgEHuYli36xBPqgrmRxTpiW9YZj/KFAV35H9iYHC5YfQsNXt2VxXlgU18xf
         c5SodMIpkQ+9xGRxdND/jd35wY7b8rcPJoadTVEZNs+obMjNh6CO/cnAp9lO+wx9SFOR
         UkMw==
X-Gm-Message-State: AOJu0YxBzDUXgsFUm+ei5eZBT2fQFcfCwssvsuGi/7f+dWZ6jLJdmgdu
	gpnmGGW2bNhLs8lhWFaFl7TYiA6RlDZpT1dsc5T8JT9pM7JuTNSKo1IWBWDbVAygx4HJNmgkWW7
	jLwglJh5yYAYxNjEJKQGpNyABN69EY5Ndw1/dML9Pn5Ip2IXGqXek9Bs3qnaCDEwclR9U
X-Gm-Gg: AY/fxX5V8JXMn7mTLEJ/zTED0AwVfdM8ZD6T/yr3v83o4All5UfwFf7LYpNrvKwxK9i
	jZafqav8HQeTtqYFtxCxxeLfzjH/Bhw0RTzLrIFhPK/6v5K2rHdNGowrU3iEWHnMEbLVU2bcp+5
	FKRajzpACuWEWTVtPhFadtGDeMaoYPilMpD4B7KZWSo8rmNijcY10DzuOmPm2QWkrGxlNnsm5Oa
	/zKG3U8uVArrVARIso/PcsvVeP0y/S2YN/HvJFq9ozedhclVJheOvaXjQVZhpLPA9EzR6vS1qXL
	lTe0IOZY484B7YeB02qBJRU/l5ulJDWv5Rwws9W37J2s8ksKUQTLFtwqT0QEtZqVFeFL9zjkjF+
	rVJjCtWSiFsjHn1V63NPxiDKy8wEQsAIxz9q6h5/WffvhVjDdobyx
X-Received: by 2002:a05:7301:1001:b0:2ae:5ece:a223 with SMTP id 5a478bee46e88-2b17d238b56mr1083036eec.8.1767764114013;
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAq+ZtdAcknsGaIaPLtgnpySHduFJzXfHxD+tcTHf1ko0mmdW7VyooccCBBdWrfjKfzYgDpQ==
X-Received: by 2002:a05:7301:1001:b0:2ae:5ece:a223 with SMTP id 5a478bee46e88-2b17d238b56mr1083016eec.8.1767764113508;
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:10 -0800
Subject: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=1994;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=6KcYHw//2sUplPbK8U1Bd+hDAoWkJLtkjZfQ8HvTz7E=;
 b=nrET/LLy2cTDXNL6ak5fCp9zpgjbFF9KXciJoKzrv+3VCA1DJ6ppy8QH4s9mnj87lg3Lek/dc
 K/uo+dYQ064BW8CSJ9eEn2AcvgThn1BpPWXOa8NKXHNVbdcn0yUmwlD
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfX3bZmIdGvPMPT
 +iwbHYbMxDFoWtI2GyMJAXZexawjkBDwEZUZfecR2rc81E5wPQ2nEFZx3N2Aadz8vKuwzSaSO2r
 vOoTrU3ot+S3pxO/4nzEG9ejZHvchv3Lr8o/C4Zc2PlftyGhT+9lIQRNS0AdK1g65tYcqMlibnr
 JZCj/oKnojNxl8JHTKuaiRIpD+iIG8yBAEOCV5WiFH484CKKn42LncQxmx9EYnUS16hLKM02eJ7
 /+Wpn57of9m1wk7S7JzewYR1dn4JyBhqcHLilDCHL1sbUstiywfNt2nfm3nuSCq72Ph5B/l6LSx
 d+ZSRPuBzx0kiuL/oucGuL2ZYCuaeHvwqYDvTOgHhCJHq+Jz+dL8IMpOj7M7yFHwdD/VQTGehFb
 GkrhVoXUMvk/H3kc+j42Tc9nYRkKuEigTF0dIgEmYh6UDxB6LbZXkwSwYp+066sl4x/ew45LcoE
 mM3E26fylLLpaSkyqHg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695df093 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S55vJYNB7fQppqqD1sAA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: xixoKaizZw_fDCC0q00TZ_vWY-Lqmi7H
X-Proofpoint-ORIG-GUID: xixoKaizZw_fDCC0q00TZ_vWY-Lqmi7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070042

The clk_cmn_pll_recalc_rate() function must account for the reference clock
divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
with a reference divider other than 1 calculate incorrect CMN PLL rates.
For example, on IPQ5332 where the reference divider is 2, the computed rate
becomes twice the actual output.

Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
applying the 2 * FACTOR scaling. This yields the correct rate calculation:
rate = (parent_rate / ref_div) * 2 * factor.

Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
IPQ5424, IPQ5018) that use ref_div = 1.

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafbf5732048..369798d1ce42 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
 	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
-	u32 val, factor;
+	u32 val, factor, ref_div;
 
 	/*
 	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
@@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
 	 */
 	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
 	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
+	if (WARN_ON(factor == 0))
+		factor = 1;
 
-	return parent_rate * 2 * factor;
+	regmap_read(cmn_pll->regmap, CMN_PLL_REFCLK_CONFIG, &val);
+	ref_div = FIELD_GET(CMN_PLL_REFCLK_DIV, val);
+	if (WARN_ON(ref_div == 0))
+		ref_div = 1;
+
+	return div_u64((u64)parent_rate * 2 * factor, ref_div);
 }
 
 static int clk_cmn_pll_determine_rate(struct clk_hw *hw,

-- 
2.43.0


