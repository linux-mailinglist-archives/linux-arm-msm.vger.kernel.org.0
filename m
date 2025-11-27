Return-Path: <linux-arm-msm+bounces-83611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F9C8EB8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD963A4EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA49B332EA4;
	Thu, 27 Nov 2025 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0N1gQMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRqkyJr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF593126C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764252735; cv=none; b=leLRei+cj7r/DZjWyEgZ5/VncDFSoMAXDEOHLC3XAnkTso0x4UGjpYBwmmP3t1lbM7Ir2q1uaRsdk11qaF9MoyXPeLv601+U0emYRcBUxqqF/GUqcJF3vlQSUmyh5qsW0ftIfTnke0nWEz8qp8qsE+d3PmvUyHOcpqPPAPANBPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764252735; c=relaxed/simple;
	bh=lPbejQRzLGwK7I1gopu3GY5ha7xC6bHJ9U4GIaoCZNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLZqMoziYlSXmcKOKEnOI5gfONk3nomDpZIoJ4kOaMkdMkEY6qpDUFzBBWNPzzWYX+Oxd1mgylIoxRYKMhys5N1GVCysJRLr0oAx1B4x+8llek4UGEIg/K8ND9Veu8t9OK9wgbQeWiQgZYAQ1hXh/0ABztvWnPYpRzc1KAGIHUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0N1gQMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRqkyJr2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR99anD1667748
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCiYRHPq3rlvKmF8kWI43Q2cFwW+J8eYLT37CyJ1pt8=; b=A0N1gQMm7AHEOGho
	fZk5FoOnO2+O0SloBk+NsTwB2zW7qUOxS1QSUsx5/9bkx4aANfbc4Q6RDYGFfzqi
	cz10Pi5o/vVk9yJXWr/VJMFPYYrZvGsG827i/ZQqbPbA/7vq+josK2xxx4AzjniA
	Dkq6vm+qGtLgYVZ5NXhT/3VkHJxqxxLBsOt1OgLCHy4O7FoOJuz7cfQBJAknIhjX
	v7BmEU4+mIr3u3Nx+dDDwqUtRMdg/sIzCbhZzO6gSjUJLXcq6xjTrdmPEdJIKaEq
	SmXyEMkoFYfv+ZGrIVGJIbFlBiDOIB843VOazVfSv6W460R/BaB4kM1sq84J/3ba
	gEgvKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmv0hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:12:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so1392901cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764252732; x=1764857532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCiYRHPq3rlvKmF8kWI43Q2cFwW+J8eYLT37CyJ1pt8=;
        b=NRqkyJr2hjNxCyUcz7N0LgMLyt3dmuQIVxSZFpOE4g2dLNj8AiIFcDLyqF0/Ai2bCI
         gmV2FULh/8k9jCiAAHfwB7fFSJbnmLe6uaeyUH8g6xrKbKB2PuVe9sv1V/WecLXcVqhO
         soQRuDZUDrotOv8tMTkD1rzDrmFXsxxIsHUndCg8SmhsZ9MX90DPm7y68hdbWV6OunFA
         UuKuzkQvRSsSksLJhimblPo3Wowvwd7gemO+VNz+Pa1NjTGXjnzIK9+cElsFeJ7EUSZR
         37q8MUtDU00/wk+qYOYhcTUPKSiHA2bMxOdiwniOwRzGvO2PH/bMt6j8D565uEh9Nw2D
         ZxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252732; x=1764857532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCiYRHPq3rlvKmF8kWI43Q2cFwW+J8eYLT37CyJ1pt8=;
        b=MIXKcR8IWFvVcasbzWBBktdqadcP02X3wHz9ouqce96z8igKa8XraeBy6e8e7MPQ28
         7Rft38JUIS/1msj03K9rrzxDqx4KxwszWpmqJNizmD86bNLBrGhRyoW4lyPidcazanNF
         m3QVot9z0aMM1Gtm8fXBn4sDutBa38F1ssz8Od++4M1tUe1GjO8y4pWOhCOyUoR40l6B
         r3Kh8k++l000w75ciW1+bQruON+a5DkgYOf15w3F5ZKmOUij38dSVVkeOiXgdSeDku8G
         9XnS1hDmAawrxu79L7tTSPpGSX7k0eUTkjFk4ZGylI3IbtPyg+tdGp/F1jmRP08if+yb
         vxvg==
X-Forwarded-Encrypted: i=1; AJvYcCWWsSNCX/JSI1NgoAOMLCBTyPrpfEV7OVPn/9iZ12oTX1dZPRcUC3G3Owo6bQamzlmehWDttj9MLvPmqfLp@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5LpS3TAYWpm2kdmuUabC6Up4vy0HVx6dTLxECnS86wIhqGKM
	BtSTi/LuIHcan+NxAa7gVkJkoNoXhypmJg852w63P0XVJa98HTSwOpPFFvRg1rMJfjaIzfnlf+D
	DtXkJodWzUpMj2hiKlD6WA7bamcfnGqVVBkoqIN3AWGwATZD7ZMhx+jKy0ziqIkE7fZbH
X-Gm-Gg: ASbGnctKH6Z+j3JVCzCE7PVMKZ+HZM+UBalUjb821Vt0u51tAbIiqfr7k6UskZR3v17
	mPHvidYqjHwKdJZ3IvDdrDnjL45nzG4qM4DBZWmapJwUBwOR4oUunNfKe8qsN1tnCgirnVUXrZL
	+Ap0nojBiqYM3coylQlyJsRPpYR8RIKMKuAXkmsszNBE5IWYMxyKeehn4M+4hQXOXz1oIIyzf1W
	wjHoqP74BtHAa04f8Q6FKdpiDQ+svWOU3VQK2HkOBWBYm++c5EwO1pAsILeXK9LWrj7xzt3Gatr
	oeGWYhh8OEX7vZ6YzjDtUZ0WOaMBbos+QoEq2B2/CBJpoD7YEOumCIg6CNmYnTxAKeMFTCkJV4j
	4lN2JsLBYy8PlOXzi5436e7TgZCuI8iqEPoU/piW7/8W8gRtm786rRRNknjzv6e0aDOI=
X-Received: by 2002:a05:622a:144d:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee58930d72mr245470311cf.9.1764252732219;
        Thu, 27 Nov 2025 06:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAENiG2NWzvRUpC2N3DyEf6LKMfN1Rk9Nazrw11y8MKYBoWmJU39W3UKHkR1LhJjRLAlv1gQ==
X-Received: by 2002:a05:622a:144d:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee58930d72mr245469471cf.9.1764252731408;
        Thu, 27 Nov 2025 06:12:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062081sm1632438a12.34.2025.11.27.06.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 06:12:10 -0800 (PST)
Message-ID: <cdebc4f2-202b-46b2-9cdf-0ebce1ffd98e@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:12:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Clear ASPM L0s CAP for MSM8996 SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        robh@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251126081718.8239-1-mani@kernel.org>
 <bcc61dc3-80ab-4ac4-b9a5-7fc42cff9ab5@oss.qualcomm.com>
 <7rmiof6lxrr27vd4rnilc6ynxj7c2eiv33uw62lt4sheylpjny@6m2nuqnbnifc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7rmiof6lxrr27vd4rnilc6ynxj7c2eiv33uw62lt4sheylpjny@6m2nuqnbnifc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=69285c3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BQ-7DGIy8I7IhXLRZ7wA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwNSBTYWx0ZWRfXzX1QI6g71qMV
 3A+6CqYgKTIkGD7O3x1zT32TPabDEcyMFf2LAdvyR8zE3DrkvaCyUGxjTRa1qGyO6LB6tjjqeJH
 fqzzyHylxx4oXvh+fEWf5lvFLnC8iUVZbWZ3XJJoNb+rCA7BebJCClKaIAiXkpvhOKkAKSvXkhB
 /V7IFgxqqro7eVzq6AfNkRz6MHG+U9rxBFRUsXKWwsRFCEuA9QY49gWv9jA4gcAd+ONEv8vHt2O
 oeClCNNDGE+UROt7I069zxiN9dIl68DSd5d5AXWu8Ead1CD+cTTuS2//galYt9hmlf2Q3qMx47E
 zpijXJohUdxn359GYt0/AgF+1B5Wf1MJ6RDFoOrtLEysNxePWgN0Cs9zSui3qM4TY8OwpVigMTB
 CNbY6H8rWaMlr2Hs0ET5kV2ba2AdCQ==
X-Proofpoint-GUID: _7ribq71vv2Jjr5wwC6xsCdFGI8151Z6
X-Proofpoint-ORIG-GUID: _7ribq71vv2Jjr5wwC6xsCdFGI8151Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270105

On 11/27/25 2:55 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 27, 2025 at 11:55:15AM +0100, Konrad Dybcio wrote:
>> On 11/26/25 9:17 AM, Manivannan Sadhasivam wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>
>>> Though I couldn't confirm the ASPM L0s support with the Qcom hardware team,
>>> bug report from Dmitry suggests that L0s is broken on this legacy SoC.
>>> Hence, clear the L0s CAP for the Root Ports in this SoC.
>>
>> FWIW if we trust the downstream DT, we have this hunk:
>>
>> arch/arm64/boot/dts/qcom/msm8996.dtsi
>> 1431:           qcom,l1-supported;
>> 1432:           qcom,l1ss-supported;
>> 1586:           qcom,l1-supported;
>> 1587:           qcom,l1ss-supported;
>> 1739:           qcom,l1-supported;
>> 1740:           qcom,l1ss-supported;
>>
>> But also funnily enough, msm8996auto boards specifically manually
>> do a /delete-property/ on those..
>>
>> (there exists one 'qcom,l0s-supported', but it's NOT set for 8996, 98,
>> or 845)
>>
>> On msm-4.14, this became "qcom,no-l0s/l1/l1ss-supported". This forbids L0s
>> on at least 8150 and 8250.
>>
>> Later, both hosts on SM8350 and SM8450-PCIe0 (not 1) forbid L0s.
>>
> 
> Thanks for digging in. Unfortunately, I have to rely on word of mouth to get the
> ASPM capability as there is no proper doc that says which SoC supports which
> state. And, I'm quite nervous to trust downstream DTS as they were not very
> accurate in describing the hardware capabilities. But I think we should atleast
> consider the 'no-l0s' properties seriously.
> 
> Let me go through all DTS and build try to build a sane ASPM compatibility
> table. But just be clear, the above exercise should not block this patch as it
> fixes a real issue that has been reported.

Yeah definitely

fwiw

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


>> SM8350-PCIe0 sets 'qcom,l1ss-sleep-disable' which influences some RPMh
>> things, but also prevents some clock ops wrt the CLKREF source
>>
> 
> We can ignore 'qcom,l1ss-sleep-disable' as it is a Qcom low power feature built
> around PCIe L1ss, which is not yet supported in upstream.

OK thanks

Konrad

