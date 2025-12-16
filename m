Return-Path: <linux-arm-msm+bounces-85338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55ACC3894
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5926430D1943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819E334676B;
	Tue, 16 Dec 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LD7Adl0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwIsrSv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6509348890
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887210; cv=none; b=bgjRgyvcaNFnCB3oqKCLVts8cd/RHqYNlPJ9NrU8XPkU8fn/nTBiYOtmEGmwIug4icGgblYuCNjL7Q17M7o6Twij1majWgUkwr0PHBMPQ+o7eLU8h0JmZFrJjYD4LA48ipkTMzK1x2kXwFZ4sMtLvSQgyEvafUNTEI3+nCxvT/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887210; c=relaxed/simple;
	bh=EqPoMDbyqQevPFFWEYcU+ic6ViXZu/vhtuQUgrtP8s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRLqmH3B4wofDvagUYNb76WiORIOKi7IJN/ZmMdyEcOsRKgLl6WZ1ZAsJ8hFMBKmLnaFvcsZ3b7r9IAggnSN/03IYphBuaLMCBcbgWEOpMEnjgJbDmLWBS3/TNleQBD7m4JsTNU5ejOTpg0HszWVS861rKmrmBPoM73kIYPXLCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LD7Adl0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwIsrSv6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8K1LH2574464
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBDtvdhlEDZhHvSsqtGF/U9j4heSI31S4RRQPhJZkh0=; b=LD7Adl0b9Z9hCHI+
	xXtxGDtwzrA2wWFnADYTSjtBY5FugwiM65xEzbLuxPywfhOSHd8IJmVIo8U9XwJB
	Buw/PvORcDPj+WmnA9arbFlbI44CQiWi3RjX9TBsJJ1aocZ4jDyfT0qd23E5HYw0
	glNcK8GsVtFXGfV4KGOws/hIz9x7y+VJbFiZAVIussCLOdEjrTeTXog5W2oAOE+s
	5xrXX7MdoB1W6qy6HI32BPWyS2SE8J7gS5SkhG8wM2wPAlSoYWkPwSnrCB1ivmRl
	TiVpFzLrem28n5en2mXzij3iSN9IdOBlStgp5Z7KrA4w77VWK2lM3RMerMiwBlMF
	JM9l6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thryyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:13:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8887c61412bso16118466d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887207; x=1766492007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBDtvdhlEDZhHvSsqtGF/U9j4heSI31S4RRQPhJZkh0=;
        b=EwIsrSv6+7UA3+4s72RYOmTFr1GPU37xr9q+lAiH0aq83aD6jDgXzqwOMCWS5CI2ST
         Ki5gSbmDA2eBp6o0s0TVGjRtWnrBy9dGxLdIG9808nAH1L6wxyKX9n49J0P+kLM8ND8A
         MvNft3vpQqfTirrOH5dX0HiPEE+n9ZXO7Umgcgp/Bi10qH+rh7g2DdAmpsu+xTF++7YS
         TucDggOeo73p+INg1e7QYfxmTn7SAv5WsT3/Hp62NfTbCzmJ+Rly6LdJou+9VCFLozlC
         4p5fsgtBCF7R40X08dfWRuCBXliiORq41MvbL5uXhDi63xd1zd0VYvmYi+dva3BeC6/5
         GJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887207; x=1766492007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBDtvdhlEDZhHvSsqtGF/U9j4heSI31S4RRQPhJZkh0=;
        b=WeK2QGF1/xlO/ytC3FbGP8QVk1ZM0Vw23c9Dx828EZkNL/D0PYdEjaIqURFz6gGf7w
         yuaGGDfa+k3+GmGOhzNR57oKuuFWP1PWCj3kOi2qbs2DluUwUY6e5R3pxjDFlFZ6V3nw
         9FQzzVIX3qY34+fduXylDSXnBPQ7sVjP/AWOtDmSasj0IcDht/oNbpzG7otaPI7YwhRP
         90IhW8KAlJqvo+O78p2C8GBWAYm745IsFSjVmKPOeZeEvmx6C2q3RZpAv/T/amuNuQCU
         cD3hAHtJJktRFtBg45LleVm5BYABBZ6cM/yjfXBTI5KzVeVC5ayz36vyx1MNiqBj/5I4
         B24w==
X-Gm-Message-State: AOJu0YwJeBca341+nS2WxMiXEeMbzwOKgVqEWhlL5qBjFs5CBHo/X5iU
	bGtSQAMdpYhmxMZ2AEyqkRAgMlkYoEa2eHVp1gk1ezyjwNB/0Kqc9TgZjuGXGNWNd6kVvY3VgzC
	Y6bI/OxiPZ3d2yFwI9B2QOicWY4J8y4IsW/tYmzjYfV8CLpHsbwJq275vZrixvTNaKpn0
X-Gm-Gg: AY/fxX78EZD7nW4Y5TLRrKWjteIMoKzG+5KIoq2BtqwMUJtzBrspG1XfS0OgKD4j7un
	KefGf4caKu1x02swPckGvFMHHuWyi6HoRuZh8uLMUzgpuca/juhZmXCnuMH3NUDo0hjM66swrSh
	Ec3IrGTUBXGw4ImbrxSfM0IjxIA0njnFYC8VcCm2AG3z36sKEsVYWGiMAU1H3b1VW5bscqLzv94
	530ornJcN6CCS7tVMI/oITK+fSAdj+h4dcQTtIc/3V1gg39H084ZfdF7/+mV5XKZL60xa80az6C
	Smiy+OD264/kD3vxK8QrVMjFMYLW0+6Q8OVI/Bd+A1MKHktUe0ukbHTaPMOWW/1DKKe/B87+63i
	w3Tl79jcP3wYfo56kiyR4dEvlQ+3x04dP8vkXHgo2Kau3cj4C9E2yeYGMTNYp8SrL8A==
X-Received: by 2002:a05:6214:3009:b0:880:6fa4:f55c with SMTP id 6a1803df08f44-8887e15808fmr175508246d6.6.1765887207383;
        Tue, 16 Dec 2025 04:13:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjpAQSTEKJsFIxdXDIMo/SjcylewI+gSwe+VXgx1EjplcjIJAqldB/vYxgwrqEiRixO01dow==
X-Received: by 2002:a05:6214:3009:b0:880:6fa4:f55c with SMTP id 6a1803df08f44-8887e15808fmr175507976d6.6.1765887206867;
        Tue, 16 Dec 2025 04:13:26 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-599115eb95fsm494275e87.19.2025.12.16.04.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:13:26 -0800 (PST)
Message-ID: <fbc5d96f-8c3f-4566-9bbc-1097604142d7@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: dts: switch to RPMPD_* indices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com>
 <20251211-rework-rpmhpd-rpmpd-v2-2-a5ec4028129f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-rework-rpmhpd-rpmpd-v2-2-a5ec4028129f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69414ce8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=u_qTJo_YbU8fZNC4VkAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: MMb_jecb_M_ECi_U3D9e4I-TwKhBSVCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX9TrvlAbZ1xJF
 Hdt+jwGt8a9FI1dhMv/LlCJGYXHrH2k5/inKWKIgy2lkPY7Oo/pTcHwVZAE5UNKPWmmWkVxHBVr
 V+mwAujQe4JvA1mQANqHlzHMeEaVPMuVeN+GMMvj539QzYYLV6uUdI3Tdj7ZVSfAKYhtXX4RbIv
 umY898X2Ji/CvNqARPJ2Njo0AAhEvoc000aanptNO3zyUQFPf0uBef9VfT1B4a7yoIiMGRVpr+l
 WhGiT6CcYHDqkM2PCKZeHw0yWsIZ3HAuziEJxbf0omljRLIiWA0Omj0+kz75klqxaQYBXH4ElF1
 HIeSO/31QermN5F+HyP4JUe6Vye5xbEmgZ1WQbwyf+5qGwwvfMGNcloAInXWArQIX4Qkw/XsvRZ
 4P+yZWwAvIvHgdJhl/BqWiukAKABzw==
X-Proofpoint-ORIG-GUID: MMb_jecb_M_ECi_U3D9e4I-TwKhBSVCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

On 12/11/25 2:52 AM, Dmitry Baryshkov wrote:
> Use generic RPMPD_* defines for power domain instead of using
> platform-specific defines.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

