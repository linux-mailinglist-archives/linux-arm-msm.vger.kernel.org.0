Return-Path: <linux-arm-msm+bounces-81361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811AC5159E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68C1B3A35F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27022FD695;
	Wed, 12 Nov 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcehQdir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAsbqoQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0B2C0296
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939278; cv=none; b=ipDfpOTuoFaS1ddTv+Q3w5o+S34xCsPF2XgW+JKmkBIYHuTnJLV9D/wvjC8nWXgRdzvtCXqgNrlzkCUvBC48lO1bpnxeVklAGDOmJCCT4hpdPKR993MZ4jU4w1P+lULxGiCFshpmVuOGBs2drgcdMXNgAdbV6iiVx23FofqpLcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939278; c=relaxed/simple;
	bh=p/3gdJ0mEWz4X0Zw7w1a/Dom8p0nO9b3dR4aFzb7OLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btCnBEUTmX+MJIp1dgq6IYS2VjDQF0a8P9Y1cTGDg6sYtXnhStfxFIL0bsF1/3KKzjRCHmwAHMSOReg7k1EIay2kOQkAulWUXuOv+tgKaTxQ1RyEwHZ6ROZG5YEgQPoVghTHs0/Lc2dPnfQHn9rmTqL96xqOHkF9zEiTf81aB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcehQdir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAsbqoQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC1iCHL4076899
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkA+4SpVmmeTiao6KIqZ4pvqPqOwV4VDAKwhI/CEjf8=; b=NcehQdirr5n3hmeP
	/7bwgJEhQ8aKIJRmaHh8K2vVoGAmx4KtGdfqx6ljdaU7SRykOpSnHG2obj4nHFGK
	tR8HDnad7YTQLNppdAr0pyIyMV2DHBHB/MJEAvGXkWCg+rAInGaU3L2U627axl19
	A9iF/8LnT9ssi6onQSUoojLAxoNoY2REqs4F/rci/KEvMnFI+WVBviSSucgoHkOQ
	yUuu+4J4kGEzDVp+1s4BOBPBrCbRANzK7vo//v7U1jP/IQnfY4hthv8HkKqzNqKw
	pzu6k202MFLzIctSlsgagq5CzjwQ46i1Fe5vHFEd1AwlYtr1oTzRVFca2JaoDDmw
	i0048A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acguah6dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:21:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-882384d1cc2so853516d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762939275; x=1763544075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkA+4SpVmmeTiao6KIqZ4pvqPqOwV4VDAKwhI/CEjf8=;
        b=eAsbqoQncV/P62M+dFyrxBIGR7TPymNEA6h46e6rAiyEakPWKX/tNVKRgq7fbJALwT
         wh0mw19GnTchBESfU6AFMo0FaUpQbGLn9vmk/T1fAV9uMOFW65iW6ibS9hm6SNZn14cI
         ueHi37tQBVI0H0/4O2hgIQmiNliKjIyG4OiPvx6yVUljwdv/QGpmr9WGBiO1nzi/XW+s
         7kQsfHuspdWoWQ0lkMdffejsQsqAS5972dbrT8cCNrngrOSQwOpBfZOf+4BdOKR3iYHr
         lWBFobb2LgwawRvUWzm5kfXEVGKwRZUZvUmog7K3cy3NW3ByNd/fuhSGEnC3GPcY/aO3
         CPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939275; x=1763544075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkA+4SpVmmeTiao6KIqZ4pvqPqOwV4VDAKwhI/CEjf8=;
        b=T+wtXEflqenAsx68Uf2C/0syly3XXTDMwsK8TIaRRBnyjzGbs10kGCQ5gykcZOnmT4
         VlkZsJKcsUDzmiy4a2IO8Zj0VXN0+Ni7zhASPJIkhr1/D72PmZnbLwyWcJOw9lIeqNMR
         ZIq7030wmVJdEHPbGKdBx8m6lZDNHz2Tu6SBrG2W5uihSSljcFMYu9Z1m8vQhTHwzaQL
         4oVNPIdKLP7fZbCVPoL2avGXVX4x/I7AHM7MdRAgpfVr3tZKNAt2XgkjqvkJzbtGWDXW
         rmXEyaEqSVhi2LJ6zKDymuGyyKycxqh363e0sPsv2KKwbAPaxGvtFxuwZIBANbHkTcMp
         posg==
X-Forwarded-Encrypted: i=1; AJvYcCWnJPSMuv62na2E5iJqvp2eSfbWh4HvIsEiU3id6895hQ4jxzvmM7WLCsthJZ8f0ElejWyhlAyWcM8qFskZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yztwk06w4/kDIOPtYJG2saQvOv+uVkXdmWncmTGxtJqRkKGbJwp
	gw2y/FB71VjHO8bEckomlrMheRgf6kCeRVMm+9ENuuFozGbK0ORuopLLBBele1ONDiO2NA/N6oV
	sOcJuLjoK+lU4I+vWEKoRIQIlPtnKUjWfI+YLSwLElKzIS8JpytpQgqbhZvUCQSKNGV/O
X-Gm-Gg: ASbGnctXSDwJJMxytu1u7oqrM8Bd17FSSnEXx0yJx9Vowia6FOQdwIYTynDE4PHZlWN
	Of55Eza9v7vNwBcvtPUBPEtCaGQE/5Zfk/dQCEWAwb299/q99/FXqPm+1+3mWZHZJFKvvG4dCXe
	bwQVFDGYwIUHvg+dTIpHMp5gBstbcXR2GFCHa1Ux8N44jNvMxYSRbU4Lj6nBWSCHjyTARodx4tj
	w3RvxyrJyEH6/1l8VnsL0BbYqj3C4n+zJ76kmNK1pAaNLcdAWjQcAKoYKeWhKXZ6g4Ti/yox1zB
	dizfpq3dbfa51Y2UkCMeH64dxfiwKaQxtVxk1PAj1mQbK2z1u46956xfbBEwnoU0McK//6faXlh
	h5LrvbFORKMKaexZfltG3EoBfdRrsCKl2a42/7t9Od0i3SYoK9esLtlym
X-Received: by 2002:a05:622a:1808:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4eddbd6f1bdmr17859381cf.8.1762939275338;
        Wed, 12 Nov 2025 01:21:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1gI36KuIEWI4rn/hNy3hzO7bxb+zuycrzvicz8tGoIOMN6OA9SGPB+GEKzLD3Tiqg9VPG8Q==
X-Received: by 2002:a05:622a:1808:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4eddbd6f1bdmr17859171cf.8.1762939274937;
        Wed, 12 Nov 2025 01:21:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf407a22sm1557621166b.29.2025.11.12.01.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:21:14 -0800 (PST)
Message-ID: <ec38f267-2d44-446d-b538-78f849ffec9a@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
 <swma6lyjfmyhl5ookdzvpjn5qresgsze5wptg45jfgj7ub6a4t@bdgfstw6gzoq>
 <507b121b-98c0-4632-8a61-e9d7a6a13a3e@oss.qualcomm.com>
 <42xj5qgoh3m26y4hmdck5hfyqaxncfaeugymrmrxb7tusxjvm2@wsjztnhbp5jf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42xj5qgoh3m26y4hmdck5hfyqaxncfaeugymrmrxb7tusxjvm2@wsjztnhbp5jf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5T2zoxaeBYYDOaMPnmyi16QPhdcVr3M_
X-Authority-Analysis: v=2.4 cv=ao2/yCZV c=1 sm=1 tr=0 ts=6914518c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k9nrLfKtrhbSy2XMf4sA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 5T2zoxaeBYYDOaMPnmyi16QPhdcVr3M_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3NCBTYWx0ZWRfXxx1Efay8a1rT
 SDSP3ChREbD1bCCA4HzKCl71dnM6xBWB5fRrIUnpVY2vQHjPwO3qyr/2ImXEOyK+UWZbybFerY8
 6VPCuSzAvE5FZd09BufqhfVv9aieg+3KheJayUJqnZYTdGeqQuHgd1cbAMKn5m4FOwmCfkBTCDs
 WdxAdT5VtK+75JUapkyDcD6nwtdaXzIgY80kYB8cbirmHL2Pa7h6SNMAU5d1Z05MBzV4tB6IIBP
 rRjWiOt691riOLav2kIYccFIZBz6Qnqu+N5S0JclRs9ZZ5VNIrmBgI3jsysUMo30jf/P6ZSUr9P
 C/+kcdG4/6fclCT7PMy+9EqnJR9eDPF57Z+ndjLd1GwQfjBnxX4P6eCg81GK+vGSSzdZmwNyAIJ
 MmrbM+T9hMBaj1G6h1NEuO0H3cb7tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120074

On 11/11/25 1:16 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 11, 2025 at 07:44:36PM +0800, Aiqun(Maria) Yu wrote:
>> On 11/11/2025 6:46 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 30, 2025 at 04:39:07PM +0530, Taniya Das wrote:
>>>> Add the RPMH clocks present in Kaanapali SoC.
>>>>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..fd0fe312a7f2830a27e6effc0c0bd905d9d5ebed 100644
>>>> --- a/drivers/clk/qcom/clk-rpmh.c
>>>> +++ b/drivers/clk/qcom/clk-rpmh.c
>>>> @@ -395,6 +395,19 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>>>  
>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2_e0, "C6A_E0", 2);
>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2_e0, "C7A_E0", 2);
>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2_e0, "C8A_E0", 2);
>>
>>
>> Shall this suffix necessary to have e0?
> 
> Can there be C6A_E1 at some point?

Yes

Konrad

