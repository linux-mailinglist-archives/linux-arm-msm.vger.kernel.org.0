Return-Path: <linux-arm-msm+bounces-84301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A5CA29D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 08:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC193021E5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 07:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE8F2C11F6;
	Thu,  4 Dec 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+Phu7H9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaFzdHfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF5217F27
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 07:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764832468; cv=none; b=KLVkbK3H8fpRK2Vmo4VmSgCCF45piQp/3mpJPYFd/HB6bUP2qRHZbMJq09byc6c5e2/zJb5I9dmf7cRW1YgLJ1HZ3qIAWMspIqeiGbDmYiC19a1Ghi/zEuL8eqJ1NOxEhQKHv/H0jmmII4zJ01XXPJK5BliO6pvqsojBCkTdADw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764832468; c=relaxed/simple;
	bh=5C7hKuLAvhvfZz+3GAuTKfQ3xGCGPj/4JPyHPx3D4KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/D1uJFADKn2nmvsR9dPLs31+CN1speORw/5/yP8HFByMYz/OyyC8imC5adSRn04FGOr15Zc/PtJG1bX68KjUVezfPVZV/F6UtzBBTgOnbhGR1bn63+Y7b+AexiAA+zGkeEpKYBMLszmawSyIkUDIEz7fibTQ9BUxBVfH0wDJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+Phu7H9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaFzdHfq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468Y7J559852
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 07:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=; b=e+Phu7H9jZ2KiMcp
	2fxKKyJw0GVqKQFfutfDfVrDZFBrQJvfC5nc1Gqf+CVQ1NPUWYmv3Fr7SsT580OS
	nximFAtXy2KxXsoPv8q33pFrB6oX7i2waI+TWLjOqyKlg911DSJvvwr5A5EerBTD
	OvhIykmJtN880CNL++d6gW51957oBCg+6aD1wQ7+se5ffU0nWV9FMpbnfavUw1XW
	smZBVg3aPjX0ieU8ahJ0kIUKdg4Tj3c6NHnjekPcWRqu8B1ywR8vcAWo8k9JBcvD
	gPChlFBJIgrFq+Tbwdtq1UIGKkQ2483s1oiA2VXFtaHtxQKPkLCwm7aFng0dxQqk
	uvr2ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmh9vjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 07:14:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437863d0easo964056a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764832464; x=1765437264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=;
        b=SaFzdHfqP/+hoP8EgbOjJvK4op/neW6T+1iiArb5VcvFkIUZwuA57q3Np74x8maRgy
         eVZr+a69PSHaThJBQJhsdAu1kyOSrmIDm4hNOD4hVv2YeMhz5tNeiJs13lhX5rqKg+51
         /kvNE2pPmmvBIohxfE42gYyKoQSsaAh6Opb9eR1+4aTwCg+vNQU2fL1IyDZqoeLUkfIJ
         bY0IN+kQZVFLExx3SivXTdJwxTcYHOV5k53QoXXrO4szt0fkxXzdTdCdE4JSU/LLSfCB
         5E5ZRPWLNHaObfKtchapvhqtXtHAcuKq5+cY8+umOuhn04qq2bgcJgnXuEHf2Ihh9/KU
         r8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764832464; x=1765437264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=;
        b=ERMuCwtb4rCUj6B8+VfLmxcqdI/uU/gZOZ/vqKahTSjeOdJ7VG/XWxm0jigBwQGBTT
         Y4Ucor/0TUyo+qk8qJS7R3CdhWCcmCY+Pnkl/hKR+0D/I4vR9TCAqZRE2KuxxtsxS1G3
         hblnCLQPOSEZt/wZu941I6UvTm57MupbkCEXVhleXSz/y96Ujo1ql9xeoMF7v7Xo6Ezx
         TkNKe9xdlYpqBtbDimLvGTj1NFq21sAArk3J+UmCxJTomiSiwcn0TfS3uUxICAY8U+Gi
         vhCQKMVrwqiQA5hyMkh1CVu+bOJEVxAykjdRk1aejU3yAiZnp2mThi0C0G+5Sd5wREfJ
         V+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVvSciGgQDNwb83dqL+HNyFNy0x/yMN9hEMCu4gjDy+BX+VuODqTrWbIG1GnkUoIgESGA7i1bFlDnCZA7cB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc7ODLGCy7R8zqyzR/0f2Ut3awQaAqvHWHIlCLjJI4TIN8USqq
	uCbN5BBxYd35A8iAy72HhVY9ts08JiNTCeWRER6/qDZ0gaEbz51mePYbYKnXUDpFzQy5/28OZGC
	yCKQpNXlahcfvAxUgRyffzZ4uOz0NtNqGdnYr80X89XnGme3lk5IsqfgoZrLYurr12QbN
X-Gm-Gg: ASbGnctoahgB/ogX0sQuP6a7JzNgrEmfkqloIVKFenPz49K10tuhCs18h3NEkIORVij
	fQ1zZdmkgTEy+NSVGbXFVSvSiMVHOrcDn48rYhoVfL/5NcpZne8O8Qu0DHavSDjk/ZEHCPLLpz1
	LtGdxHDnrXY3lJTKax3w60nLwKmzYFIzf4SluYqUrRovbq0cW3r2S80yRUoix2w6lX8TVB9SV3P
	b7iiczyJyMKnkZvEq4KYtI3pEZ5NX0Mht/W8rAiBwdMNBCRXZkvZrAHsyzht2gZYpLoyc/PJDXR
	RwcpCWNSQloJdsAPWUc1vHJBRzhdHTIUb/MTQr+hH03YpQ6oYgFIxXDJk61OrBv0V44efb1E0R0
	nQyboYT97648jNe+nRBxPQJEsQRkcNnSpPvc61A==
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-349126f0736mr5893474a91.27.1764832464464;
        Wed, 03 Dec 2025 23:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMj8ey2LgMUls5vb/bDVMguHBOIr4pbhmoevWwLaJZ3BPPsbZLE6wlw8i1niGvDyiNmkNTEQ==
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-349126f0736mr5893429a91.27.1764832463957;
        Wed, 03 Dec 2025 23:14:23 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f398fa5sm889313a91.8.2025.12.03.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 23:14:23 -0800 (PST)
Message-ID: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:44:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: byJxmEZRoO31fVWsoS9ml6D2bmyXP8SN
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=693134d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JxPSEc7MvJ4Lh0wbHXUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NyBTYWx0ZWRfX7PgZXVVD+F8J
 Tv4LMlntCKfqfj/6Tanqqfzw7zKlvh+Iz4rWRz34I+A6DmbcC7mJHALRXz7OA3hDOlm1rYzbZzX
 VKxs70F887Bn0zPizxILirhE6an7hSj2UABxis2a607O7cl1mDxtZkaKGEdZ+ldJTHjDMeox+c5
 jRbvAGPqg4Rv/EZSxyb3yhjay9pgaUKxA2b5e6Ug+ufMMzCOfaS5TQRSuLiQ/Cf9WmYVRi8nPh2
 plLu2fwFnDrkDhBO45BI+Wp9fV7NrsIN7tuzmrW/zNw576NYy4NNHidr/EquWYcA67f4xnsldbx
 Bp73FKQkDnGlQaQP7jW4esHui1dGJ4gwHM3Kx5L6IZdCiKsczNl/evF9IJy6MVCqZolKtbRKuuR
 jqtnWNAElpG+cPBaBoM5DmjtZQ177A==
X-Proofpoint-ORIG-GUID: byJxmEZRoO31fVWsoS9ml6D2bmyXP8SN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040057



On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>> Support the clock controller driver for Kaanapali to enable display SW to
>>> be able to control the clocks.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +/* 257.142858 MHz Configuration */
>>
>> This is a bit strange frequency for the boot config.

The lowest PLL configuration is used as boot config based on the
MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
lower frequencies as well.


> The frequency map lists this odd cookie as the lowest predefined config,
> perhaps it was pulled from there.
> 

Correct Konrad.

> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
> effort to use the m/n/d registers, instead relying on the PLL to re-clock
> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
> 

The m/n is not preferred in the cases where the PLL needs to slew to
derive a new VCO frequency. That is the reason to keep the divider
constant as much as possible to derive a particular frequency.

> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
> 

The lowest frequency requirement is 85.7MHz and the frequency is derived
using
257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz

there is no over-drive at RCG of MDP.

> Taniya, we've seen something like this in camera too. Is there a reason
> the frequency is being set this way?
> 

We start with the lowest frequency to configure the PLL and frequency
requirements are decided based on usecases.

-- 
Thanks,
Taniya Das


