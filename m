Return-Path: <linux-arm-msm+bounces-76374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B50BC4911
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D9A3AE088
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71525221D87;
	Wed,  8 Oct 2025 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7s9GJzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F81130A73
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923041; cv=none; b=ru4RodMOXmQikZ9oHIiwTm00CwmDYezyR6syYiDKyTHzJcH1GpFLLpN9yZ57VE5BJMKitzp5+I7O/jjaR/M68ze/fNq/gYW0hl4GQHrEZwfJ3gP0BE8SLDOcPyAlsRuvcEpGxrYWUA0VnB75NKPvWNoCFiywAoLFnLxRcE0+qZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923041; c=relaxed/simple;
	bh=nhpi83JznvSwAdgmbRAiGKVw0NVvV3h7g4Wp4+iFfq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMybMcdNWhqoiPJX02TRge3o2tLn0YoQUSvyft6Pci4vZxSRLNYw3jnlPc+Qo0yBcxbZ3RLdg9X2N9nMpa3p81BnnoQKe9UW4yNMzWucqkjgyaVOz9V7aKW8GQOjP53+7uXSIKxn0+Ce7l2e+PXAxVn6LJ282S4ILHnB6r/7e2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7s9GJzB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890SSa021224
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3dB7DImcsn8ypdPvXx1SaULRrictHxPEcCfKBFsYI4=; b=Z7s9GJzB3SROL95j
	yRJTCjmY7o2yEyJifMGqgDaUyzgnShW/E859p+/L0E58ut+i8Un84kHH0uI95iyq
	0dLBPAs39Tj8dw+nVyPJ2mWVrZEQLBOIrH6ZHImsUTkxsmLS8F3zMWODMdvb5ZaM
	+uqtIbcjl6uPTwen1Q15GxQROPMIqaTiVDtyNsXviZmN+m25oibmHiHS+Va/gYgk
	PgKXAg8zpvkniDb7epqCvZfDHNH2u1CQlXAak2emv5Jo5R6izijsajEFBdjJShTo
	wJz/0Cl8gWOfJb9GgTr4WD+KjSOgMD20dyIODfS92l7+0PKK9r+wzxUdendKIevb
	Hdwa2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1t6jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:30:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso26056501cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923038; x=1760527838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3dB7DImcsn8ypdPvXx1SaULRrictHxPEcCfKBFsYI4=;
        b=WLcEnk4nFsOaMaXtWTzib8T8y4hsqI96DvXdEtIdA2iX2frX0Sh2yfRylbj1eQsRGR
         xED/r8vhvzvNTkTALq6uPqYCNHXR/rJCLrcEs9kycBA8Z0QKWPVLBhjeH6znW49BDsv8
         3bbbYpbnXdzvpHwAwxvuh5u1j/7lPVYUYTSyEMnN6O6X3F2ExJnq63D3PR67E/ICe5Rf
         0/1UI7OroUgM/C+2+BMQiO3PjqREJ9u3WS2JfUcicusnwBirLV7H9BKk4K8LmYOIy0d8
         FRPCycSFhA3F8/FvZfolhViBVt7tBH9BCr4yH9djD0tuXx0EvONSSMkDEzL9N2UnYpdX
         qyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf+PT0HG22EMaMoe42Lq9SFo9o/TQU7UAl/xsYe+RRmY+Ldkcnwvin61T36iX0Hwlm5sK2p/BuRQ7Rr9nN@vger.kernel.org
X-Gm-Message-State: AOJu0YyWA7j+tVdMMN333KhQvaoAvgC2etPpcLXVcSqwYA2HNmf6ID3y
	Peju3GPX7o4YF04OXVVMsrAsow1a8UMsH1NEbP9F5GZlFItFV0r+uARF6zXLF7aGGhrQSi8vPSy
	bveJKZzwBciwLkhxsmr9hEovVbQQzgCWmLlgh2T0LobD5kjDWARMNhFdjWomCEBFNwVvR
X-Gm-Gg: ASbGncuE6gKn1GHJBeOGKIYuOzWV/Sc3QoKPrA8h4S/iREjxSurtHneoEqSW9rzvxlA
	4CiiiEUE35h8s3YyKdfT47Au3QtkM3f61hGpM+V+mKwaQoTOiQgTrF4s/8cjDRc0xaz/w/dcULF
	pQx1AickQwVKYzhL9JQ41OnGLNDGrtijbpmFztaK5DmgoDCiTJ3hu4HtblRYljBR0/MwhvLr/1F
	2H0MbR6WdB3wCm4crdrd6YClHteqX0t75fAX6aCOKvbQkGtqOpbBvm14esfRYCQwCBwNG1ozmQN
	Ye6QlrmdFeOiRqE8+8rRgYrpQhBmIqxoCaPKJ978a4dhOmYranIk44N9N6eTxdyzyFWt7QylMAZ
	iA0ULFhZQXTHHFW0SjaisFwXMeHQ=
X-Received: by 2002:ac8:58d2:0:b0:4b6:2efe:2f73 with SMTP id d75a77b69052e-4e6eacd5b7cmr27615041cf.1.1759923037731;
        Wed, 08 Oct 2025 04:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6uuOJkmzqkpWxNRJcrKpuJOzIOVtnFzI7SgSZotUMBOtnoIvLxg5u1HtsT32WaiX1nRyRuA==
X-Received: by 2002:ac8:58d2:0:b0:4b6:2efe:2f73 with SMTP id d75a77b69052e-4e6eacd5b7cmr27614781cf.1.1759923037299;
        Wed, 08 Oct 2025 04:30:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83f5fsm1646099066b.32.2025.10.08.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:30:36 -0700 (PDT)
Message-ID: <7ef31348-78ca-4abc-9eaf-5041e2e6be82@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
 <51637d37-aa5e-492a-851c-e5d6bfbe421e@oss.qualcomm.com>
 <43ba93bd-0dba-415b-8a7e-cdc4d954f79d@kernel.org>
 <392d2e9a-dc31-4916-ab8a-680b2ec4dca5@oss.qualcomm.com>
 <19639c5e-7aa8-4e75-812d-93d805802cd3@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <19639c5e-7aa8-4e75-812d-93d805802cd3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SPFaEXLNQE2sOESGGpiT-ffOxTHhi5br
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX0LlDS/W3KDUf
 mp8VLX9gG3fZ/LJKbr4i91CGsUwfEQpW8o/qmpx6fOJQWxTvJWgsnJ2Z95Rd6CIGERy341ZxTdU
 MIGFc9B0GXvYXqjtYiUSzaBy9DKYkaJwjEquO1BGFEUynbDmQ5ZMTHBKRsc8vtikxdlhhamKoY/
 rXgCdLOG98TklYhEnA3CkwQgpJM+kq9Ubf8xLDMY6fxJJ2j7ifKwLDj0LwUolHxb37q95+lCc1o
 kXk/BdicmDFJ7F22loAxcNbJHYj+o2V4qNNyi03MDapSFKrAoN6pYM3RILYGu8P4uFLNArjrbqb
 QnbSR+vFqJjNbD4xyvVC5RkVi2HiGUrAzf/SEnaZDOXCITGLJaxL3gKp6INJBkpUjxt2dPhptqx
 AfMQXtRq8W6OE81nviURNHf4CtMubg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e64b5f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=209rYu4UdfZk2wwxGmMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SPFaEXLNQE2sOESGGpiT-ffOxTHhi5br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 10/8/25 12:51 PM, Krzysztof Kozlowski wrote:
> On 08/10/2025 19:20, Konrad Dybcio wrote:
>> On 10/6/25 10:48 AM, Krzysztof Kozlowski wrote:
>>> On 30/09/2025 21:06, Prasad Kumpatla wrote:
>>>>
>>>> On 9/25/2025 6:56 PM, Krzysztof Kozlowski wrote:
>>>>> On Thu, 25 Sept 2025 at 09:18, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>>>>>
>>>>>> Add support for audio on the Kaanapali MTP platform by introducing device
>>>>>> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
>>>>>> microphone for capture, and sound card routing. The WCD9395 codec is add
>>>>>> to supply MIC-BIAS, for enabling onboard microphone capture.
>>>>>>
>>>>>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>> ---
>>>>>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>>>>>>   1 file changed, 226 insertions(+)
>>>>>>
>>>>> Audio is not a separate feature from USB.
>>>>
>>>> I didn't understand this, Could you please help me to provide more 
>>>> context on it?
>>>> Is this regarding Audio over Type-c?
>>>
>>> USB depends on ADSP, so your split of patches into separate audio commit
>>> is just incorrect.
>>
>> No, this is no longer the case on Kaanapali.
>>
>> PMIC_GLINK is now served by the SoCCP rproc
> 
> Hm, ok.... so there is no WCD93xx USB mux anymore?

I see there's a WCD9395 onboard which has that hw block

I'll try to find some schematics to confirm..

Konrad

