Return-Path: <linux-arm-msm+bounces-62439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ECFAE81E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 434B3188C910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BCF205E02;
	Wed, 25 Jun 2025 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKhbwi0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882725C802
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852056; cv=none; b=M/HCMqA3eDerktjOwYDyc8ippJsZm2lC3T3rT3YURh0YSfQNuGiPo0CAYBMeDu0DlQkUF8LSfQ3c8p7LG4ucsIAEA+UkVi4noj8KkvpbtssC4XbCpPnzsDjYlZI2h6XHgxLQz6NlgKlVAwurPcc4oq//EDUKT1Zh8jJxzKrRV7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852056; c=relaxed/simple;
	bh=H6Ux8Hu+A7NcbgXUY+irrhi4jCk8KQ7ofE6RNJ+jxTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYaVqrrQs4PwnDUsxxN/DD29tcTj/xBp/a3zhRIdCyCeuQseMJ1MklUJH4ZTbst+HL505b+RgigNg3nvNM8m4Ife7JQjyHZr+vLRVe8mffzXb/Eznu/c0t1k3go2o4vrwTEg2DGj0xndFPZs9IB9tCDOV6qvmp56n5qTs1riIRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKhbwi0l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBXFqb027585
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R6FqCG7b8R+qhzgHna3f9JAx
	3Wwa0Pc3B238JWiWJdY=; b=dKhbwi0lp4Iz7gAelPuOZdLiUUGKwi17dtuEDlSK
	lnEuhOx+kPGKhZidKhkI4h27FRDAU8eAs7iMTStfhog3aJWxhWviWTwWYlZmbE7T
	2BtMH5t8Z3kfdSroA23iY8VHQ65aNaU+A9gCEzafXX6Q+mgfCan0+V2PKvxLeWCa
	tRNyH9RTNE7T/wHkjlmu86G8GZp4qqzvN+Oa1jC/ISkdyEcA8zmyhBHSY4448IGz
	TPgjwI7xWoNy6hfaRP5vC0oI3Aw13spL9TmM49O/QV8WdPhrJepRywYApSpN53ls
	TiWvGWCllnRxEJ6POH39r+yAHBZMseF0FTSvdoUbF4fduA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqp7fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:47:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so1320144385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852052; x=1751456852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6FqCG7b8R+qhzgHna3f9JAx3Wwa0Pc3B238JWiWJdY=;
        b=BPB7t+vA/XqQSSWXWHwaAn0B53v69WUi1n4ND5cc/4CJLEKZEJxKMYoUJsXQ/o85Vw
         ZWJfZhHv1IXIDYtrIsTLSitxOAKNpZqszDRFtVdq0VIpYXZyMn3VHWExJVi1JYbrABh2
         /cgIrv+i+m633VTnyCvXMFiXqIREdLZ8+dIGbvoITXfVFhIAuYNtKrpgNbMNT6yd//5Y
         F2zD9+fxuicrvL5NsHjuKQdqk9v9Y8df3I3yf6pwQpnRKErizRSSgOQ8Cr2YKUyGxkcb
         AulDwaiC4JbXI95zsxE3HUscGob+7DvvUNGtRB5CGwSUzT4vqAh4FmcSPt81a4Lxci/F
         o72w==
X-Forwarded-Encrypted: i=1; AJvYcCUY/yw35jPCp+t3lTGuD6eURZ4aesXa8XvGUXvVID4BAn04AfYi30RhdaJk8t3mXa8r0+YN9ueYkg97n0ZI@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfsuY/EKFW+fD76Lv+68LE+2d+udkSE8yBKo7eTbYxVbeYcC7
	vhyR/tOoN+MkdAmarx+oDDhZAsuCZhvqLnF1eVqsEn4xg/dyGOb6Ma2qAwy/iyYizdDxjeXa+se
	Sr8UtHXFBnLRWarkjsWKAZMNnSQS6F3KnU8GrCye+UatP2JhCPRgXout4NAewrQddHGxWLC0EHu
	kWbAw=
X-Gm-Gg: ASbGncuWW2f7PNCB2gSUk38yA+RNrtmrw8oRNrpZ40j4BGLYg+5u1L7bMJNnvDe+1yE
	uLBF7cmdfl3AC6Mt1ciVQ4Jl/+YDeHwzMWKNlQ2e0cRTTxuk+oe15pWS18p0g5yV+g66Z0gJflk
	EI4PcFqana0+lLVIFNkojuvNi0hYQQSvW0DbTaxQuML8jo6KgPRo6CoNLEvpZECTvC1KOqKgY1E
	gHR0vnHA5ApoY+JtcKXHv5apFjMI2DdfgNaSc1zhLOiXTqn7OjIPqNMDc+9V81ZatzkXL9N24Kz
	7gbSQmCpsYTx64x0fGHTua4MREnjAWQuWOlfbArDuGbdrBxxxbgnr6b/aa1N2g0wpng9kwVG2XD
	W9AAf0LNrpIe/UAvsLoFPKcq8PsKeqcVBWbk=
X-Received: by 2002:a05:620a:4444:b0:7d3:ed55:c92b with SMTP id af79cd13be357-7d42974b899mr326665685a.38.1750852052247;
        Wed, 25 Jun 2025 04:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwN9V0DIMaqLW3c8P1cQrAhb/E9grjRFPmdzpe/w+9SMMXrfRLILkEXZLWzYsCSaZ100tLfQ==
X-Received: by 2002:a05:620a:4444:b0:7d3:ed55:c92b with SMTP id af79cd13be357-7d42974b899mr326662985a.38.1750852051789;
        Wed, 25 Jun 2025 04:47:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc0easm2167738e87.208.2025.06.25.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:47:30 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Message-ID: <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
X-Proofpoint-ORIG-GUID: aGFyEjcQrtLJGU4fKKiFqASMYsZ59ShB
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685be1d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=2-BSLW4CMbL1kKF9A54A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aGFyEjcQrtLJGU4fKKiFqASMYsZ59ShB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NyBTYWx0ZWRfX0w52mt2x/s0x
 Rb1C+2bLrafo/LXLWA0nEXhbkfjhCcSKlkOtGINLDEigKzwH3a+g7URqntDmZcT36LjWyKFVruK
 KnJ0AtUGbPO3HrgrRcP6humkRgGIm9xcaMPnjpwrN6UPNY0FhiXf3FxbGOLBjTRXsXIE6ELcvcL
 T+kADvjM3z73mV08hpZ+QFM/byEXliz9+eqCndzXbmhw9oqj9tG73csoF7lXidf1YRw10kHsRT0
 NembEDgFe8AtFS5BSmqKmmFW1SN+yRG2nXOutaFH9i+KXGlEn1OeU/nBI113ny2ZyrFVxgoWIRc
 ejb3N9uAxsZWZPhNIm+uadoHE+0ZHlp62uAdQOc4O9yapjuSqGdWv/J2KEYaSfcZcfUMw0sLW59
 X+nrBCYbx1aXIASZF9GWrz8KMMCcwvpmBuhYrBtusNIQOmOZhM4RgOCjef8roqDtvZXGTw5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250087

On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 170 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index d8e1cd1263317814da2d0414600988de4b87c56f..354ebf48435f1ef7f76ead05e9ca882085dcc46d 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -3017,3 +3017,172 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
>  	}
>  }
>  EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	u32 val;
> +	int ret;
> +
> +	regmap_set_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE);
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	udelay(1);
> +
> +	return wait_for_pll_enable_lock(pll);
> +}
> +
> +static int clk_alpha_pll_slew_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	const struct pll_vco *curr_vco, *vco;
> +	unsigned long freq_hz;
> +	u64 a;
> +	u32 l;
> +
> +	freq_hz = alpha_pll_round_rate(rate, parent_rate, &l, &a, ALPHA_REG_BITWIDTH);
> +	if (freq_hz != rate) {
> +		pr_err("alpha_pll: Call clk_set_rate with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	curr_vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +	if (!curr_vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	vco = alpha_pll_find_vco(pll, freq_hz);
> +	if (!vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Dynamic pll update will not support switching frequencies across
> +	 * vco ranges. In those cases fall back to normal alpha set rate.
> +	 */
> +	if (curr_vco->val != vco->val)
> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
> +
> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));

We have code that does this in __clk_alpha_pll_set_rate() and now you
are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
PLL_USER_CTL / PLL_VCO_MASK into a helper function.

> +
> +	/* Ensure that the write above goes before slewing the PLL */
> +	mb();
> +
> +	if (clk_hw_is_enabled(hw))
> +		return clk_alpha_pll_slew_update(pll);
> +
> +	return 0;
> +}
> +
> +/*
> + * Slewing plls should be bought up at frequency which is in the middle of the
> + * desired VCO range. So after bringing up the pll at calibration freq, set it
> + * back to desired frequency(that was set by previous clk_set_rate).
> + */
> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *parent;
> +	const struct pll_vco *vco;
> +	unsigned long calibration_freq, freq_hz;
> +	u64 a;
> +	u32 l;
> +	int rc;
> +
> +	parent = clk_hw_get_parent(hw);
> +	if (!parent) {
> +		pr_err("alpha pll: no valid parent found\n");
> +		return -EINVAL;
> +	}
> +
> +	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +	if (!vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * As during slewing plls vco_sel won't be allowed to change, vco table
> +	 * should have only one entry table, i.e. index = 0, find the
> +	 * calibration frequency.
> +	 */
> +	calibration_freq = (pll->vco_table[0].min_freq + pll->vco_table[0].max_freq) / 2;
> +
> +	freq_hz = alpha_pll_round_rate(calibration_freq, clk_hw_get_rate(parent),
> +					&l, &a, ALPHA_REG_BITWIDTH);
> +	if (freq_hz != calibration_freq) {
> +		pr_err("alpha_pll: call clk_set_rate with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup PLL for calibration frequency */
> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_VCO_MASK << PLL_VCO_SHIFT,
> +				vco->val << PLL_VCO_SHIFT);
> +
> +	/* Bringup the pll at calibration frequency */
> +	rc = clk_alpha_pll_enable(hw);
> +	if (rc) {
> +		pr_err("alpha pll calibration failed\n");
> +		return rc;
> +	}
> +
> +	/*
> +	 * PLL is already running at calibration frequency.
> +	 * So slew pll to the previously set frequency.
> +	 */
> +	freq_hz = alpha_pll_round_rate(clk_hw_get_rate(hw),
> +			clk_hw_get_rate(parent), &l, &a, ALPHA_REG_BITWIDTH);
> +
> +	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
> +		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
> +
> +	/* Setup the PLL for the new frequency */
> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
> +
> +	return clk_alpha_pll_slew_update(pll);
> +}
> +
> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
> +{
> +	int rc;
> +
> +	rc = clk_alpha_pll_calibrate(hw);
> +	if (rc)
> +		return rc;
> +
> +	return clk_alpha_pll_enable(hw);
> +}
> +
> +const struct clk_ops clk_alpha_pll_slew_ops = {
> +	.enable = clk_alpha_pll_slew_enable,
> +	.disable = clk_alpha_pll_disable,
> +	.recalc_rate = clk_alpha_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = clk_alpha_pll_slew_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_slew_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066..ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -206,6 +206,7 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>  #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
>  
>  extern const struct clk_ops clk_alpha_pll_regera_ops;
> +extern const struct clk_ops clk_alpha_pll_slew_ops;
>  
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

