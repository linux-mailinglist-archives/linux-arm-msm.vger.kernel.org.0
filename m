Return-Path: <linux-arm-msm+bounces-61295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B9FAD9F24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D92175401
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968001E5B72;
	Sat, 14 Jun 2025 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDKuxPYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EB1DB546
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927046; cv=none; b=a3SbKp6Ia+Ao5cgEGC5tebUdJ53A5RP9/0ATXwt3GypiUjjseYMhyKGN7ADwKPe7Yy3o6q52TF+aT43xlRFBJ3pAz0ekOgohETyIRlsidwtFtI+UM7ZtRKxRmM6/FZWuEGRYYCiob9bEm4oS3+0vLqAbKVnlVD2yEKAf/cias2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927046; c=relaxed/simple;
	bh=zAo8PQ1kIpBM1SD/j60V6KNaG3hiL9Q7UDeeuB5Xfpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuxRZz/dXmI+x/8HfRjr938FbOumHBevJn2+mW92AHDENfYBdTXuMwWsYY3f6+s6Ugv8YyAISpo1YF5OhuyuYHs5Ma0BdMxObSYS1tDBBQjYmDvS1vsnvJzy1KetAfD0WIy1mpVsjtZJmSZvHn9t+DU3KpbuVpfrxyhuVw9AUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDKuxPYn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EDRffd010713
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=; b=UDKuxPYnC4bK/zSP
	qjZzLRQmMiLyjHi7cOmLs3MXUjrYKquJxPrs1f9I6+I0hl5/PETBkSTnYf2iI0jF
	EMtozgAt/iqpMHItsXUFVjrtRt7p65SVdI/tfdQrlS/AOxyBXGxsH7GlJW+u1Sia
	asYaodCQQCUX0TH5XsfLRozMdD6Qr9eYHOl5jUR1THq8/bD7irP7aNO8z9S7Nx3b
	RnzVqlGiMZuMqiCXKcwEFQjE2EcTeY/F2NZFiDncMBDTxmOwGP1ACK7hGlgMNfUd
	5dyWxRO4pE5FmLc+FB7UgReIg4t6pVw/v5os8IVPgqXnskbS3zqB4tAI+JdCFXbk
	tYAX6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8wqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:50:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5ae436badso6597861cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 11:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749927043; x=1750531843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=;
        b=Z34MTMTORTZPU3P3lf1VZcezwX1GOihGqtdF+u1TsF46Ei6hTKkixWiTW7gKRsTys/
         PgibtFUPetsKiVCrSAX6jwhHVdF8avIPkeHHUPVzmu//GA1e9npiZl8HAYYcoABbVoFu
         j/4M0DaSgVVcny/mSticMV0aPC3M9V6EAUaw8UZarBcg4ej6eyFMcG3xeFGGDKANBHDQ
         6YGn8vRezGQv+zv08UpC55373kqVz0aVknKP9JcwiFbBZ2i9Cgzyww+fh21TH09OWF7/
         8xiz0uArgzDD2U4qMXNv/w/l9hzWqvuL872fvo2MJvXHGKnYLXv6uF4qGE7Zbc7mNbj/
         M8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCX2HC1fN9npfO87o4oP0T/k7H266Q3nCDVzsalzJkQM5bE7BdSABExbJEIEu0ijz9qUej+YQt7R5DMBF/fr@vger.kernel.org
X-Gm-Message-State: AOJu0YylFWDepgs8zHZElSZ/w97ccNrkKCL8DMiRtzdwOhb6C+MZNpcU
	9jEHVjZclH1B8xC+AG40dvy5oYnFfyhn5BQX4SvftKj/m9h7n0SvTmSMx8twna7f1LP6J1Z7J51
	cHZs/BsL67emiHShIxIj/qxrOnJtl6eRCemMGj9wRGoMZU4PFE9yWpzVoL5c5IyNFGl4K
X-Gm-Gg: ASbGncuSuGPplRNEiztclR7ch/0SwnWVMiBUkNyWaF2efCsQrLFxs+OCocP52aNdpCq
	tfLs3ZCd4GsdSDP/6gv8yABPM7mNtW7jg/AtbQt1LS7bmsZaExtVAketQ3jtFBP4Pl5UhpxAO3g
	ybbjYC4uSEekfczSBL79g90mizIlYbvspLPJBle6NfnG8LxsbXIPFZ9lCV88V1T7NDkgtD9W+0V
	uTn49Edftsd87kDL+xNHdf2r2GnXpmm8orfge6LU+zsRH4yrkP4CDonAIvxXdlV0ZldOexW9vVF
	M52PcTLhhula65JV9WsTbPjnorZj25oUDs35d65njIEawRVidm2NWLcWil3Y3vWU0/UYHnSazOP
	7ON8=
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22004561cf.6.1749927042637;
        Sat, 14 Jun 2025 11:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx8dYFput+x1zrfRR/vwybI6ORi4SG7FUVUMwmj0jEta6iK89coF3n7ZV/SrKjJMpi0fdbrQ==
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22004301cf.6.1749927042208;
        Sat, 14 Jun 2025 11:50:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfade680d4sm186158466b.10.2025.06.14.11.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:50:41 -0700 (PDT)
Message-ID: <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:50:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1OCBTYWx0ZWRfX6p5CvduKYDIi
 Z3zeeU+XDKEIyavF5u/4xexNkqczrqc8eWWXKokdv3UjNTzWD5vmgLW6WnSKsmS04Zb3yBE0nDL
 zi56j03l/xmBctxCacUiML9DCv9hNc8bjiBf/DXCLhaPGbNT2jcY7DzbGQSqudB8BtTnrU15izq
 RZQYafBZyiQQMOypEnUmYBBYAb/Sl6Lsb1THpCcdfF9Ykqu5jZOTjlUkXoiZKv+vhgp28j3Pbwr
 IhmmFgKDr5wkaKUhJADnxrQ9iezufxPgye8ByyqEmjH0PayYVfbaYHyLncHEx176QgDwDU/0agr
 mh9hbxMeq55snTOTMGjnOQ97ngYjLy6MtxF0Qs6sEy43HebrvjMe0/TwwJY3GIb3WJ+CPBtxjrD
 /C77patV9wZsTHT2L/WLjVqAO3fmx63zGJo2mvfnr/EebBHk8EQysD4JpKVwyXOMnI+fJdoo
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dc484 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=b3DFIE2h8Nkn-kLj-EYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uKs4UOdNqIjiiIppNyym1NqII8CZVoOI
X-Proofpoint-GUID: uKs4UOdNqIjiiIppNyym1NqII8CZVoOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140158

On 6/12/25 11:55 AM, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 171 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..5e4a755b849970281e7742ef83219b7eeaa406c3 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2960,3 +2960,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	int ret;
> +	u32 val;
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);

There's an ever sweeter sugar-syntax for this case - regmap_set_bits()

> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	mb();

Since you read the value of PLL_MODE back, the barrier is unnecessary

[...]

> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	/* Ensure that the write above goes before slewing the PLL */
> +	mb();

Here however, the write may not arrive at the clock controller before you
proceed to slew_update()

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
> +	unsigned long calibration_freq, freq_hz;
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *parent;
> +	const struct pll_vco *vco;
> +	u32 l;
> +	int rc;
> +	u64 a;

A reverse-Christmas-tree sorting would be nice 

Konrad

