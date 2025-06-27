Return-Path: <linux-arm-msm+bounces-62780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C0AEB7D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8FE560C8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A511E2D3EF4;
	Fri, 27 Jun 2025 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EM1YY02A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EC22D3207
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027832; cv=none; b=UWB5uFjWgJmKl57AHnR2iARSaeUtP83+L8wQSZYfw676va4CzGYA1t15Jn7km2rqc6pmhQCFjSCtOQOaNHH3JpgbjRyb4PicApFsBuE1582uIzyMyzT+c1EJPav3a4/ylNDY/Z1p9gNVJN3mn5R2ZxDE1Qu1TQPke2y30U7sztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027832; c=relaxed/simple;
	bh=nA0EBTgDXpgCH6r8MZS4yR/dLw++4gxjwURZnOL3HLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5xBUJ5vGyoZvBl3F053m8C4GPzu3JT3/674KjVzG7hcP4TZDNJvhahLiM1quYMxhV5DqhIXXTl7znmd0426lV2yc0u97oGKkz30ocCsPoUC8YvPW9KGMLP7ppMnNjqkkAdolYlOC6EgFNO8Po/NxUke4EX7GkB8aiyQ0CdfzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM1YY02A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCAhvW027650
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=; b=EM1YY02An5mDhU0+
	NViwHpVc8NBW7ga7Au6K48EHg4vnqIuQK0bSLXfjvv4tmYU8+bAzrhq5hdUWRMLx
	+JEwpC38U94p1yUCPUaxn2k30V4iqXSlN3MUwfjk/2rRCexYvX/D3OSjSdpcXGg6
	u9kHSy382DEfp+NDV+MRUQwtdmIPLZkPeXiB6RAjHVSHt+FV9DlbPl3WxPaffEW3
	pNDaTyWrP1hQoPm0xtnpMhcjZmDwnBdIbwKiZusM5X3FOue2Q86OQuHwPInWtcRe
	YD4uvl+7DpjwA4q+4lnk2+G0J5TAkFogcCAPcPjsAXitQxk9N5zFItUp+lU+JdOa
	/RxM0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26h7vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ceb5b5140eso291010085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027828; x=1751632628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=;
        b=vJ/a0KQQa7IIBrUBIJBzxQrU7RCz28TKIKzAB1nv6qoM37q714iHXCLt8JQlzOMG0k
         pJu2ERbyk3F6SryHkzvnMtDcd2tQzIV323M2uRkxcec9GvXVrAzCofuJPRezb12NQ7p2
         zgl2hPLFi5bOBFd1JSG9dRGs0H4MXFCZSn6z/faxmDL7Q7sAazImCQdqnWLvcHsf6GVh
         6NhPLGUO1YHbiy7/usR10O6VyBeBt2IU2lci6nI1W3GsO5BEKZjvN+NsetBioHyaWE4v
         uHf/6DT5BJas+Fe5CLi5kocNU3PYEUTRZMZptCApjPJL0D1mCMM0TzGdNvmj2fSXIaoE
         vsBg==
X-Forwarded-Encrypted: i=1; AJvYcCX9qwdW99MKAIDm41E7i8dsYpuwFSb8jDErLNastVawPJQKYTqa2ciljBlVttBFpHoOM7FwryfYN7E4VryZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpx7JCpfqApEE0zPWtS6GcOVVZXObuyK1ed/VldJiAREuzVsjl
	buYEqP2x/YE+WttEsL8kmonz/6qWn/KKqZc91qQdHjMmwWb1h3fYubxZ+22lJTVpO5vcWMQEhqD
	UGMVupxdm9Ne95oH/zr7JS8kPUh59Po72diVh8esQy7FjKCi2RuaN7M8IGbs7ad0gkcm4gaODys
	ou
X-Gm-Gg: ASbGncvAFY1yP0scnyTcJsX6vQZdzL6oDhitnIXeJqwpiEAAuRHQYnhIaqFRA2ehum5
	DoIOJUgAFwFl5Yo0huIyRXJJPYvNSVJnoeMGbrRWLXVp2nY3uxrgjaygeNdHPz5FqayIk4jD1U5
	cq3uK/5Iu6WRhP4HPWsYrowIE290kq5PH29I1jq3pS5enIkgUAhmDz7X6vKIsiptW/1eovB/5QB
	1VSiomSbJj4YKYRX0XRywfnz6Y594aliufeiUtG575usOHIkD4TQfjRfr6BqSmIguF8/eNcm9Au
	5sQ/ND7i6cTHNvj/XyRECaP4d/Sk2h0gnd5xiSUELWaIFTD0vSejZUGazOXSv9xKzhrba/PM
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465645285a.56.1751027827329;
        Fri, 27 Jun 2025 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxBke75XiU4P29zUlVR89IlIUHFxI4koZUgqia/W7QYIrDc/FKS/y6TSYgHEYIi97FOYfMQ==
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465640985a.56.1751027826895;
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c4f24sm430368e87.143.2025.06.27.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Message-ID: <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:37:09 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
 <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
 <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX6wQ6pRHD0uHW
 pS+ozSoY+jj8/18C+sSL9/FBmgpctLT/sHeUEb09Exo09h0HMr7NiIH3vG1guxovytk04VXHWH/
 CJR3bRGKv7IMrlw/GozBwnfTG2iZuHIn4SbEbMY3mKM/LCXlgLd2zLk/CCxiqz3LtBY0B+nieO+
 f0GtnY5bS39m9EP9Y62s02GPaMilCm0JFrPC43KLq9CjbX8NYl4FTYXEoz6UWMYAnMCCQ3FjooS
 fTI5mDWDd6XqBx3VU6wzFYN8W1JMvrBm75pz5/jsGwT7GPCbbBqcwBVLW9T32XJaILGzfDVYFeV
 TT3481x2b6kAtZqg88XQG+CYPhW6MiI2j+/D6d6R7/CM6B9RUx60ekTEiqqz+cC8BJQ+qVf4qYw
 w4LBtYlMCIByHm3hCij9JjCRxfLNDphLDulXiEHSiW2r1eWVzCks+um+KX7ozkXw/va2VfSI
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685e9075 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=-U2GbryNtLgmjeNmToIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kRNMen0GtYaXPqt5NidJdZyr-2-sFwEZ
X-Proofpoint-ORIG-GUID: kRNMen0GtYaXPqt5NidJdZyr-2-sFwEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270104

On 27/06/2025 13:13, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>>   2 files changed, 170 insertions(+)
>>>
> 
>>> +	/*
>>> +	 * Dynamic pll update will not support switching frequencies across
>>> +	 * vco ranges. In those cases fall back to normal alpha set rate.
>>> +	 */
>>> +	if (curr_vco->val != vco->val)
>>> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>>> +
>>> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>> +
>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>
>> We have code that does this in __clk_alpha_pll_set_rate() and now you
>> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
>> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
>>
> 
> Dmitry, I was thinking of implementing the following as a reusable
> helper since it can be leveraged by most of the functions. I'd
> appreciate your suggestions or feedback.

The code below looks good to me. Please use 'alpha' instead of 'a'.

> 
> static void clk_alpha_pll_update_configs(struct clk_alpha_pll *pll,
> const struct pll_vco *vco, u32 l, u64 a, u32 alpha_width, bool alpha_en)
> {
> 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> 
> 	if (alpha_width > ALPHA_BITWIDTH)
> 		a <<= alpha_width - ALPHA_BITWIDTH;
> 
> 	if (alpha_width > 32)
> 		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> 
> 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> 
> 	if (vco) {
> 		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> 				   PLL_VCO_MASK << PLL_VCO_SHIFT,
> 				   vco->val << PLL_VCO_SHIFT);
> 	}
> 
> 	if (alpha_en)
> 		regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
> }
> 
> 
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>> +
>>> +	if (clk_hw_is_enabled(hw))
>>> +		return clk_alpha_pll_slew_update(pll);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Slewing plls should be bought up at frequency which is in the middle of the
>>> + * desired VCO range. So after bringing up the pll at calibration freq, set it
>>> + * back to desired frequency(that was set by previous clk_set_rate).
> 
>>>
>>
> 


-- 
With best wishes
Dmitry

