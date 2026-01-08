Return-Path: <linux-arm-msm+bounces-88060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A977FD04499
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96AAF30E3F89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E953843900D;
	Thu,  8 Jan 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKNkTeMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI9Pt/zg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0848A2A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867834; cv=none; b=oJW+UFr0cgQ8kVxrYKFkmQfRtreRJuMl6GjbXOJmz99e5SCQ9/G6cvLuLoE3S+BACYCEpDgR/639NJuEaUhEDwP2nzTteRz9g3qzBZCSlpMayaBKQTaITVfggxu+yfl0OhrMbMNJDxW485G3eP8BxNUY5bhDVQfj/fhjsgFmmhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867834; c=relaxed/simple;
	bh=TUTWgpNm1TPO3rhQkPk8Rp5XfBeBRk/H26ZsFO0CRho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnfYNKDyuacDmHdW14EcOhx5yPeWWQX8JR8E3AskrPhd6iko0YziCu3S+WFGPPoRcjzEeBCx8xkxQvlhj9bow/3p0UqiKlK4VuObTfZRfC3AE3DAK9FI2Xs6NckBkH/Wmj1PLLKssdEhwLTIVNjm3F/ASl9zOCRox1WLwf01N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKNkTeMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI9Pt/zg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6083n12X2593287
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 10:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87P6R0ap1kQ5Ug+b9yjjfz1CXJ5er0/QhW3Gccn4SkY=; b=XKNkTeMKZpuwgBbH
	Kao9iWr68bd8ub/kxt1sk3r6XDVIfc1eLOdQSJpxhFgI+s8hIRrA8GWZyOAJmdp5
	iqMvddwtwa7ZpsS/0dD/2NtzHPFEmop8sY5o7nD1LGEWK52X/V7G0/QS082/OTHt
	Tw68LnJmibjiLq7bdIsLEMtmpvH+udU2teuPNJ8L+qmB5L2W+r5a3tdp5/9UrkWM
	ix/x2TJ4fgWaDc7n6M8YM1EsoLOZqswgQDElUcKFKk/forAxIqTADbSb17dPMLdk
	Vzy3t++FUrsSTkm4MCN14QSDmqIzxsgWxJYC5XeQgw0uYOy71jWm8hw2p9sKdLWm
	aRQjIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn294ax5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 10:23:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so106023885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 02:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767867822; x=1768472622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87P6R0ap1kQ5Ug+b9yjjfz1CXJ5er0/QhW3Gccn4SkY=;
        b=KI9Pt/zgfjU7fpIylnYWDM7d6fZXbfQTSqCir0XaLoMikTpTKKE5ZNHL6Eu7mGNAnX
         dML3aFSOGK/6pCQp5JCTg33FkIR+qxmm7U2Jj8QiGOEKI4/ntRpVALE6u5IQ2PaqCFHJ
         ubzaXjD8bYGMHdvc3zBwDGPFlb3S9qD+qstQMaLl3uRajW66W89Ca9R11LhcmZUGfDzX
         k9298j1wisKYdEnxtdIYXOm3rVBO9I2kAc1quToQ6DMfvqlw3Vt8nelUL1ZWgTRy6Wds
         N2acWBM5ViBmiBnlfRVmY2kcaXB+zT2vm6ANd5HBG+xbMpgr2VwXZ7J8pvelTN+boFEJ
         wFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867822; x=1768472622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87P6R0ap1kQ5Ug+b9yjjfz1CXJ5er0/QhW3Gccn4SkY=;
        b=AI3MqSPKX06P6r3tpQ7FuTu04HYHNhb7oIzrw8JlsjIgF0puQSuaPyKE6H686+rB+F
         Bq4f2kcHqwZU2abrNWybH2+IDLhiQaNyzKjDB41epKL8Lzk9bgB8toOu6YJpiKb2PVRC
         ouMvtS71FI9eHrbvOb7JxQF7QUqEDh0qvtZd4qZijczq7BObM2IguAwiUgLzuJ1I8e2a
         m9qoCqU4WyLVZH2oqe7UjtdqHeIkZ8deKfIF1azMj9yaA9sqAYvV9suFZsMJ5Gei1RTX
         JjGpHweWLEMVq2wFvwjvmFXWYIU3kCXDzgG4d9E0VBb/sLur0pibjX7HjxoSb9QxvfUW
         wJfA==
X-Gm-Message-State: AOJu0YxGq54IeA4deMpNqulZFmt0J6F5NYokLgNTCmSeSg47M5uP/hnJ
	j0y48D6nhyfFnoAkra3hIRS3ax0H3/SMMrap7WrInkrRpIRQ0j1n/tCxXgLXaozPwPgrLgYK/BP
	MB6WsqHQND0gDNs5xt6syixSWVKgq91Uc16SvUvQIAmWMKlwVHsyl3vV7o5KdUS1uGzW/
X-Gm-Gg: AY/fxX7LGCOhmajqkQ/gJGXUWTFq6RCU3Ag6DD/mYtP4T3YIjsQ+ZSTfYaMImTz3KjE
	uJM5HZqjWhjDl/bq0dLvZa7XZCevnaWVrHF9d59Qf+m7R7txTGwkOx9+CsHBOea4M9h+NLqUNlK
	gjd9M7eksI8BE0+O2eqLRkpiILtlwiL4nVQYEPNYcwEhlI1v8cgFzmTY6N43JcNU79KUuvsQ7Kp
	hDmz+FVBhJc/FuqHNnb5ME9/X8+AqT+cJUUyDDyFh49s/SRmDHjvF2JXKNlnn2hR4Y4HDN/dP8e
	2FazwKZMyabFXZHWmyprsJVPPegplLusezrRgo+BTx9FwKgvO46MVzug0wYiVMKFgP3srialSoh
	1RUK+XzInOPEzRtdP6nUX5SasHdEov42uqaaFHLUTuR8y24V4gukoNPQTliF+SUQmoRI=
X-Received: by 2002:a05:620a:370a:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8c3893e7e43mr552673785a.6.1767867822134;
        Thu, 08 Jan 2026 02:23:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0KFQ2Bsta73gDJBBrdKOWowFphVPDnjRGLBkPCmSRLk4U75oKm+O91pIOUnBTTCaQqi6q8g==
X-Received: by 2002:a05:620a:370a:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8c3893e7e43mr552672285a.6.1767867821686;
        Thu, 08 Jan 2026 02:23:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65c07sm7171853a12.23.2026.01.08.02.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 02:23:41 -0800 (PST)
Message-ID: <d03335ba-2870-483b-aa35-89be284c219e@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 11:23:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
 <0ff8041a-c876-419e-8f18-7656e29549a3@oss.qualcomm.com>
 <b132680b-5e85-4239-a42f-f6e79471486b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b132680b-5e85-4239-a42f-f6e79471486b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d816WK0dIjpqMlzNMw2tNZDIAMK3ADyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2OSBTYWx0ZWRfX7CnkLJ5EvjFa
 dZLuuVxcwoiQxWgUaTcyguoj13z7GLwFcXWUT+oreoU61x7gpQUW7Bn9efswjNkU7FaSFJTpiWT
 CQNplH5u1tXPWt30IH+A0OXng+3zKQCt9GZknJFwNH73myDDrBKYpzfWPPFCeDEbAWsHyzkv6Rq
 iM3XgJBOjfgwv1AJdspxJ2RlMM3OLVY9USC5hP+cZm4D2IY0I3GpBT4iX+c53PX4nay19+Wt7vu
 dQcIj3Wvt/TM23byFZmrl/+0c70xTH7g4tB1n+VPYbm+dT+HPFaLwRXAucLGhX3IRXLqnmw/ldC
 255Llt1eD0wL0Q2LAvIVMXMFk1Gm4URjY6BsbCahNkY9vHf/P/O/EtiSfFfGUOIDdVqU1JeqUHo
 /QRx53BToOfGm5W6y1vqwVqdGuXByueezWzpLerbbcfmwHpbf+dFEFtWJLj/ilOoCtcZtFVPB5r
 qwF2yfyO95Cc2hqCPng==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f85af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1sg49MWMQMLtxiueOoAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: d816WK0dIjpqMlzNMw2tNZDIAMK3ADyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080069

On 1/8/26 7:39 AM, Jie Luo wrote:
> 
> 
> On 1/7/2026 8:16 PM, Konrad Dybcio wrote:
>> On 1/7/26 6:35 AM, Luo Jie wrote:
>>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>>> becomes twice the actual output.
>>>
>>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>>> rate = (parent_rate / ref_div) * 2 * factor.
>>>
>>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>>> IPQ5424, IPQ5018) that use ref_div = 1.
>>>
>>> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
>>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>>> index dafbf5732048..369798d1ce42 100644
>>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
>>> @@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>>>  					     unsigned long parent_rate)
>>>  {
>>>  	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
>>> -	u32 val, factor;
>>> +	u32 val, factor, ref_div;
>>>  
>>>  	/*
>>>  	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
>>> @@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>>>  	 */
>>>  	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
>>>  	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
>>> +	if (WARN_ON(factor == 0))
>>> +		factor = 1;
>>
>> FWIW the docs tell me the value of this field is '192' on IPQ5332..
>>
>> Konrad
> 
> Although the register description lists the default value as 192, the
> actual runtime value is 125 on IPQ5332, as shown in the dump below.
> 
> # devmem 0x9B794
> 0x00006C7D
> 
> # cat /sys/kernel/debug/clk/clk_summary | grep cmn_pll -B 2
>  xo-clk                              1       1        0        48000000
>   0          0     50000      Y   deviceless
> no_connection_id
>     ref-48mhz-clk                    2       2        0        48000000
>   0          0     50000      Y      deviceless
> no_connection_id
>        cmn_pll                       3       3        0
> 6000000000  0          0     50000      Y         deviceless
>          no_connection_id

Aaah I totally forgot about the xo rate in the calculations.. 1 vs 2
vs 100-something threw me off :)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


