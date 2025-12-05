Return-Path: <linux-arm-msm+bounces-84458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB464CA78A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 787583181B1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AD729D26C;
	Fri,  5 Dec 2025 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7BD2kD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYVGLOBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A210290D81
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936736; cv=none; b=UAsvEAwUw8u6CqQA2FBWbpIE1evsfVs3xWdahpyuESJGxvsGMaQwyggP0QqR4DyWDTM69BeWDytMGnDEouIyLGlcAKYqmmhLk57pY7C0bmmeLL16CvPlhxGATxVL6s5UCKn1zHtj2V8yykawjRz6sEsfUhHngev5drAk5e9yRiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936736; c=relaxed/simple;
	bh=aVwn2y330HaQw1xOwfB3lS9U454n+YnID4doe2Cu3gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4dBz48UZ89vzwVbzCjbWC7kO0ZU8hPor/w8Q70h7WJPCYNMnlAMwqK9M9vWEpz/o0qsSwP6tXLF7Z2y/UzQakuOHngDYk69uJKTL0JBTOENuM3n048V3EUx3r2NRij6qBZkrBn8PWF9/Uw+J5z0UIggy9HuBUsV4anu0xZB1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7BD2kD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYVGLOBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B54Jxoj3643664
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 12:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXe/ESWLSpyiDTiiz1o6w1zfmo3SmKepSqEQzhZ9jiw=; b=l7BD2kD+vxvbmFIC
	hi/L52M51x7bTjnKUQ4upCp8Y0acd0yOqqn+bijb6vBz5LI6bcAShJ96d2U2EM/N
	Eiamn/yZ18H4PdQUfc72DJwKpuHIGRe9+y0e2Lgf8WcbLKYMA08gG/GBA81LeLeo
	x72QxEeNOcjorerdDHg74lVjTQkk1XsyFjvQFjwkVhGqYBHDH0xMaQrgfARl7kO0
	GRrCQ0WcJZsLbL510YSVwgfsCwijohJP1G8nzuuTIJZaZdliZb72iPQiXII5H3cF
	iocRiahK2bpi0O2HkvOL0F4f7vvfzHa//m7vEKeVbwjrQohM7iS+1l61i6M3GSjJ
	Mp1EjQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9as8v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:12:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so2323442b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 04:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764936729; x=1765541529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXe/ESWLSpyiDTiiz1o6w1zfmo3SmKepSqEQzhZ9jiw=;
        b=hYVGLOBO/8Avh1cmQoIPseyLu34nUAXBA5Ggzu1KKUalcs2TzWxabn782yVyNjaeVu
         HErAxyAx4M6KirZTxAxuferjI15W6YIVOdft/IkiNuzAytD0dXeXSgpROe+f9tuNnVIn
         fF6hdYITH9uPZ1PUxaKgKza8g024JA3Wqs3jlrxOsrnCL7TjcA5rQXU/zEotzEzI2Fo6
         6RxEn01z2/esELa+GUw6V1tqgTC5jaZy7NDosJdbASWuGxKzGfYC+4223A2DLI9p9/1L
         q+OS2+3gpUqTTdsU8yoghHiM8+YO+FXCWdeiTHIEDITGgo5diJP8mhbvmfuPxLEFb2Z1
         BFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936729; x=1765541529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXe/ESWLSpyiDTiiz1o6w1zfmo3SmKepSqEQzhZ9jiw=;
        b=FBtU5qXXFglAbYOoCKDO71qybF5RGFf4gZldxdQ8VBqcQ7ZLTku6NvCLUSgEkvmkF1
         4+7CkflYwTwokUomwlM99NmqCenNGmKV5Zz1ld93ejRzelyvQrZaeKyn8Rf4MUb6HaAz
         0POBbDqmNbLHACOa6vGq0s6Jo4fUUO+JjgTIdZLhgfxEFF/z4Fecq4bvVcDORj46cp9T
         0zqZU+N0wSrOn9hUQUct/fbUkN3dNYTteO4vJBC+EPts/+H8A4NPembwwSntoUEL+XkX
         n3idbaisGlEkfmXGn1XKkxb73iHQsQOibIwI7M8f2b8MUdT1/6EiPNAqafOAeHo/wBli
         NdoQ==
X-Gm-Message-State: AOJu0Yz+gxZk2NkhCKVwEinEyqp/VOkhEtJkYW+qDhUrjaiXb9lv8mDt
	2AvGVsBvAqoYjhB/c3N1Eion5wOAXhmmjjUyxYNZRlUF5grAUrbrC0Nn27bDCmVGAn2HEBhAGYk
	zDhIeeIQ0Py3nW79fa0W5dSpdUFYT3hK5sHWiRDql1+6yZ7LydIn6dzWw69csYjh7IFnDbZI458
	uLrV0=
X-Gm-Gg: ASbGnctFHVcIOc3Si7UdE5qY+bRq0hAJvNfAPyQWPnYm2OvwgNulimtVfVaB1DAqVzk
	SPF5yUs6xnodsplFjvc0Zvtz+eETse1KrpmL77xDZ+oq4tXqkgV7IRJYYKjZI84IxvbUmyF6k4T
	1HgdLX8dhy88u6rLwUOJkAqDCuh9kvLA7PmRu3ChPHo4gB/YMqsseJkXTZZBB0ShmOJ+xLZmEnC
	e/MWt2/dzNhnX+SBgqULJ+2sSiv9Xlv8Xw3kFCw/wy1TZCpHuOajrYsGXleCfQGiuSkEvtQd591
	aLIejLT921kFI98s5k3q/QtPS1ezeSQBl8+nmLRptt5bmZZV0/FNgFla7hH6bR4rMjgZTWuCW4i
	uIjUzR6kDl5+VkZGd77Elv+oUWRR9VEq6qVaulaU3ZvVXivingvFfFvCkwczlviArye3VeA780V
	M=
X-Received: by 2002:a05:6a00:c87:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7e22b97f52bmr6933397b3a.25.1764936729444;
        Fri, 05 Dec 2025 04:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQGzsbV3F4h3oMJrcer/uaLOYOw/gOuUSGKFkmONiPaPx6GSGi3mUcqUkgXbtMW7h7XsDUVQ==
X-Received: by 2002:a05:6a00:c87:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7e22b97f52bmr6933360b3a.25.1764936728956;
        Fri, 05 Dec 2025 04:12:08 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2af658d84sm5030638b3a.60.2025.12.05.04.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 04:12:07 -0800 (PST)
Message-ID: <a548702e-c509-48bf-b3c3-97f67a95bcac@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 20:11:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
 <6e12f446-7792-44da-9e06-99729c3b066d@oss.qualcomm.com>
 <a3077c95-e6c3-420a-b65e-e4e584009c6c@oss.qualcomm.com>
 <898e5a54-3a79-4fdc-bb51-f1eb6a79dc0e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <898e5a54-3a79-4fdc-bb51-f1eb6a79dc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=6932cc1a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9yv6RJPhSQAcbpPXtOcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 4rMeDZueEuoJYWhwbdj3N7uDpoyGL-Hs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NyBTYWx0ZWRfX1ePMlIzIynjm
 Q8l+R68xA1D3UD7EkXWkJhqMRxX6h/EnZvIBHrkRGjaeN4Oi1B8jSSpjiw+RZ3UWKfWeMlH/tv7
 b95sFn2898MTqGa0Ie5dLnHbEDf0qKIWivI3Q3QMS2JTcDPbhDqyGgqbTMc1o+5eAE2d4mfQWEM
 KEF28g07lqgkKxjrO67R/mpt9m7PwOKyPXapwfdwBzg/mJgdvI32HDZwH32ra3Js8KvxUA9ToE1
 jMgZUkrydSO0LH7bigSCp8SBJYUett87Kwu3sNc87yLbxZEZXFI7Gf4gU1L1ohY4Q5MHLGO3cb2
 Fi8seaAXzSNbaMApdtZZxGm6kzuBDM85jjkZ1Mv4B8eCOberOBQm10pUwzK6XElX1O5D9/uqcxE
 woDi9SoEuy8GzBJWk/8k3VYaJsFkKw==
X-Proofpoint-ORIG-GUID: 4rMeDZueEuoJYWhwbdj3N7uDpoyGL-Hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050087



On 12/4/2025 9:48 PM, Konrad Dybcio wrote:
> On 12/4/25 9:09 AM, Jie Luo wrote:
>>
>>
>> On 12/1/2025 9:52 PM, Konrad Dybcio wrote:
>>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>>> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
>>>> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
>>>> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
>>>>
>>>> Add IPQ5332-specific clock definitions and of_device_id entry.
>>>>
>>>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
>>>> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
>>>
>>> I can't really find the source for most of these, but I see that there's both
>>> a 200 and a 300 MHz output to NSS
>>>
>>> Konrad
>>
>> Both IPQ5332_XO_24MHZ_CLK and IPQ5332_SLEEP_32KHZ_CLK are intended to be
>> used as the input clocks to the GCC block. IPQ5332_PCS_31P25MHZ_CLK
>> provides the reference clock for the Ethernet PCS, and
>> IPQ5332_ETH_50MHZ_CLK is the source clock for the PCS PLL on IPQ5332.
>> On this platform the Ethernet clocking path is:
>> CMN PLL ETH 50 MHz output → PCS PLL (divider + gate) → attached PHY or
>> switch.
> 
> What about that 200 MHz NSS output? Is it just renamed to PPE?
> 
> Konrad

On the IPQ5332 platform, the PPE operates at 200 MHz.
IPQ5332_PPE_200MHZ_CLK is the 200 MHz reference clock for the Packet
Processing Engine (PPE), sourced via the NSS clock controller.

The IPQ5332_NSS_300MHZ_CLK refers to the 300 MHz clock that is supplied
to other NSS blocks, for example, crypto (EIP) block. This is also
sourced via the NSS clock controller.

