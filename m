Return-Path: <linux-arm-msm+bounces-84335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95077CA3049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9FCF301E93C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD69331A59;
	Thu,  4 Dec 2025 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+24TaRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZA7VrKhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B630AABE
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840912; cv=none; b=g2br5GHSUi2mIEnfA7/iJYYU7WuTbWgHzM9g05pmIRFfdbiN+6umFBrchZC8242YvoAXex8+n/AZ1D3PlZ4kay1fGqPtyArcJ3l+RuNcao6vJUc03eBrmFhpiUy6hy+q0OL7YKzMgiUNUmgHlDgGXgK0KqrWQ1KSNOkR4LHT1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840912; c=relaxed/simple;
	bh=/xThXGvVTKpTEcd2n/nLsU2R+J5IVEQ2yxWAitgFA+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCiypISQNXF2rYDETxxZR5kJz6OKzLJbb2lp6LvjTvXhVX5pcBIFK1ZvvGVREqLDnDwC0oSMoWuFoOznqQlzJupdXAXymCrxaEo+dJ/Uka2J5TVDM5NIO02yGh/cwX1wLh3nEvnITYXXZjy6TEDserOOYZzdCrx1lvIntPA2fVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+24TaRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA7VrKhf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468df9624918
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=; b=n+24TaRmKX91GwTx
	tzgu+YT/FCb6pGv4/4Bnj6ysfFZXuyLJDsum2/sgeHJFjIKdWlXHnKgaMQsVZwZt
	gK5PO4imN5cPGCBPNCXVV6R0a7VLUDwkeTEuQZWWqfMh+rCv7mJAxHMamHPGMw+j
	mSJr5p0KiXW2eBhf0Fp3hPZV20J3v+IoZ8wka1QynMKAaahXFdHO0hGWYAjgNiea
	rarZhkEld6EAeOgC7BhOm47cxjAiSgZk74qRMyp4ZlhYBXICoUWvBd7BSngAJCgS
	CaUmghqP8+j0dwNQdlwhOLiNcd6PsLfR017TBIyGf/h/jzGGjF9WIcK032Wuv4qy
	k7Jyqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h2890-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:35:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed5ff5e770so1302831cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840903; x=1765445703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
        b=ZA7VrKhfRj1mYvE/j13bmyonrx1Zxs4PY971mW2CQTIdkJ6uE2Hos6VoFxnVm3DyCW
         bVKnkcVXmVXQSWNGgHGBatMs0E45kK8gGUsyIhrXcrxS3Zlyr5/ekxg5IypFJKNCel87
         miUF/RTwrKIFBkc3NHwahQww+/vf4LrehUWSy5AsGRSfvwmNh3Yf28pEthdpYmpBQxTG
         BYhdKjn/9a4ur6FOsSDyKwRhFXlva29Hs55aEV16nH4MzCJ3U6jFwD1bwLerjPoviLIS
         WmDHVeYXvuEt6+I96zpoK5z55BYap2QrLqE6mI2InIDDUtDN2jBZvDVl5suU68KuxXfW
         09zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840903; x=1765445703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
        b=bLjxm+esaKwc2cdfToQNMOrp8+KDSdI4LpYHe80xioyD3vqVh9UVQhbPjRzxRK6bbP
         OhN9qihty14PAGx9smKr+4jTNaUtGfLyoz0S25IK5+mzCVi/t4amkLmGMQ1Imt6KXFpq
         YTsLob4M0dtjrFF9X3f/tf8X45TkiSpZeqeONrga9rmr+c9OHbVOIiNvLs6jJaq5rtPs
         lDCQOV6JPcGv8JrIOyWC7y/lye/VsOdPhZ4CNSl/dYH/eeGkDv3t05VRtka1H7gq9cP7
         yDrChlvLqTf7HH3NcZ97qrhzGyhgnxNgUAv2PXi4/FyO+9kSanm+4Kg2UMWBjZwd/Jot
         H8Og==
X-Forwarded-Encrypted: i=1; AJvYcCVOjfMEeMLcF8QaJ/5Bw3ADpBkJNxXwuwJRM+xNpF2loGQ5jiKtqKAmCNJVr2vbQbr4ihoxV87/ABRQ575U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6jiTjGEA5iOZqKkaBkq2pV4r9VI+wNACbzfTfRe6pagJtpro
	zW7LEXvuvhCmyIxd/WN5APV57pSNMtrc8UpiemQ68SYx48ZAiYAhlR+Fj05fYYfinHgMYWe98N+
	2WpCWR9nOI641HrxzNoV7Ii4FxLq3EPllVWUkjgay2vce3tLMJ+F9nGmXZ3y6zZ3Kyocx
X-Gm-Gg: ASbGncuhyEFXrQzLtl/BpCC/iMDWMR+4NLnjU+yMtQrVYHgk6hRfrkAK2Cw1NKiEKiF
	c31N0br9R0v2Jtfuq9aNfOTSy6UDT1gPbjec8S1Aon9R8acG+FM/goW7J1Q9NmRDSRbFVJ0+CIp
	1KJ4jEHVfNOx0KnGv7hhlE7fabFhyWE1Pi73+5l1PPUbTYC8EWPf6H4ckavDYIEYvyBkuFv63tD
	zr3DPD/JgwW3OGr5wPN5rFqUNoEJHLhts0wr9QEhbJ21zf9LzqWqv9Aq1N36S4m94Q5/ofneetE
	wl1Tre7cCVAQN3xUKlPbtAlrQf1VjjFb20TozX24oZxX0dE6tI4u/6wZRUBZitKsKwyP8nqPlda
	UZer2QcNQeIPUQUXImPUaD53ZuuQ2E/1EBVnW6dkLkZY0Z2SD5/0Hl2J0awg658jnXA==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4f01b0eb165mr45162391cf.3.1764840902675;
        Thu, 04 Dec 2025 01:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX+v1eNNwOOMBrWUNa6eWsNBTYHiNNTwNLR0pcIGD5JXevK1bZUv6tKavTcr9qRZQ7sGDnFA==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4f01b0eb165mr45162071cf.3.1764840902230;
        Thu, 04 Dec 2025 01:35:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412dec1sm758405a12.30.2025.12.04.01.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:35:01 -0800 (PST)
Message-ID: <69f7f357-d328-4559-be8a-81a9df790f0a@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:34:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
 <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
 <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX+41qVpVZ6Jhr
 Rb/5LLmG8ceD/Ri8QtZMRgWL61dGIQdC08pJf66XtaNsWK//8RY2FmmH8H6gu9IRWAwNZrct1iF
 zBsx6YBo2qxFOs0jHtXJJge1Q6z/kDXkHqMd41MKjW7KunW7x/NmZREkJLdRZvyYpKbWFBNsPM6
 4qWOrwMSEJB9lMPUGdfuFqLhc84hqbz3Zz6VC540r4ao1VFi0juGkX2lbsfuk/M6EqsEdLy8JNv
 3JX3LI7JdnIVR1JzTuEdlMzgzbRh8BCJKkob2kwDC3Ph9FhGyXonEh2fwJ9q7WgCvE7CzZzPoXy
 q/8wEealS+5vsbD0V/VPYhQ5IDDytIsNYL2v2BNGWjnG+iaj0eFx+98hadNJbnBpon8+aFEm4cR
 DxZdrltHnk55916zi6QOkeiP/BN3ZQ==
X-Proofpoint-GUID: xSYz6CW99_w38gQXA0cA-78Z3GKqE4wX
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=693155c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gmcpGffKwdJZmXMFCqgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xSYz6CW99_w38gQXA0cA-78Z3GKqE4wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040077

On 12/4/25 8:14 AM, Taniya Das wrote:
> 
> 
> On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
>> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>>> Support the clock controller driver for Kaanapali to enable display SW to
>>>> be able to control the clocks.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +/* 257.142858 MHz Configuration */
>>>
>>> This is a bit strange frequency for the boot config.
> 
> The lowest PLL configuration is used as boot config based on the
> MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
> lower frequencies as well.
> 
> 
>> The frequency map lists this odd cookie as the lowest predefined config,
>> perhaps it was pulled from there.
>>
> 
> Correct Konrad.
> 
>> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
>> effort to use the m/n/d registers, instead relying on the PLL to re-clock
>> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
>>
> 
> The m/n is not preferred in the cases where the PLL needs to slew to
> derive a new VCO frequency. That is the reason to keep the divider
> constant as much as possible to derive a particular frequency.

OK this is roughly what I expected, thanks for the explanation.

> 
>> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
>>
> 
> The lowest frequency requirement is 85.7MHz and the frequency is derived
> using
> 257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz
> 
> there is no over-drive at RCG of MDP.

Sorry, you're obviously right, I don't know how I got it backwards..

>> Taniya, we've seen something like this in camera too. Is there a reason
>> the frequency is being set this way?
>>
> 
> We start with the lowest frequency to configure the PLL and frequency
> requirements are decided based on usecases.

I meant the rate-change-through-PLL-reclocking, but you've answered
that above

Konrad

