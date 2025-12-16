Return-Path: <linux-arm-msm+bounces-85316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78DCC1936
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E26813026997
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA043396E7;
	Tue, 16 Dec 2025 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N45WPxT6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEIPihmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAFB31DD90
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873147; cv=none; b=AeQfbKw782DOnz3wcYRzcEtN9KAS29MxVc7yv68lX7x4tqPxUES2VAqhsy1GW4/+xILcqZad0CjTPcYAK/xmvUP8MqlQ3ToRmExSmlkNq5M3duJhYa26KbpJF+Y+WeudC2VQqdopSALTCfthxfKV8o3UmrIa5R8B7lSQ64wQsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873147; c=relaxed/simple;
	bh=1dc9RMeX8KMlLsgP6lFUbJHWrpqybk1Icr7xrEdhdu4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LdwZY1R9kaHco4JriI1cvSRtYdDv9NZYLGRfnHMQOUuvYiZVGNcgKrP5A1piWCFfbzk8q/BdesbcG5ebmxku2P02tKGP00qMpoCUbyITGLqt3oFIM/wIqcIcZFMZEEJWpXO0Y7BEoLSBnj5YH5vmmmY3/TWVPzwTVGBxdtbCK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N45WPxT6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEIPihmP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG4TS1d2016479
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	huFM7pFhu3QjZVVHAh0e9KZi69KVAcuDEQj7pluXnaM=; b=N45WPxT6LavJqkR8
	km1PSKddLLH8FDd/Ch798GU+iUurTaJM14uAd+XvXPc64yN9CS/auMwq7vyarGF2
	KROvkq/SuFEeKkjrC/2P0wAm0m5dPKFHdeAul+RHdDIrOqeiHYXXmAaAvIua4Jx2
	5WgmAIikdwMTtxck53WD/D50mXZhaigb9naKwaOCZxVtbtk8sIigCc4sTv8lqn/M
	ChFUwJHEj0wmtrQRDtv1qrYpJm3DP6fiYAlikb7h7uQfqGWhGSkucADBbxf0kySr
	+i59YMPfQRcO0KIOKAPFNjdVY3AInHTVowaod/KKAG/B1lnOI4hc8PLnbhHO66NX
	0DsSBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nu1k29r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:19:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso7905295a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765873143; x=1766477943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=huFM7pFhu3QjZVVHAh0e9KZi69KVAcuDEQj7pluXnaM=;
        b=GEIPihmPJQtZtVI3WCgO3at9f9xFUclFkS45eEkbV89gb59ICXs/VKbn2nSTduxJNQ
         rtLCtIjyw6Y7QnGZn6rRIM2OG5n8ZEng5Nur6WUiF9uh9eDCLa+k2elLqkoJI7KQ9vZO
         LHBYalNjLszuCcQ7TTj7VYdG++EWX6A+JQcFJ8yuJZpKvENIQvhS+L4iyUPS76UzXgVv
         MvUgR/qLGNAtUcqkafP+NRY2CoVi4MmgckQM8UEgEzs7FHhN0PAOxABkSRxlfvwyB+Lv
         1ZloGdlCP8wB1lerg6OPXEerCUhOaT/3kF4DtP82tnoH6L2n+rEIT3TW2IdCKGVCPsti
         nYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873143; x=1766477943;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huFM7pFhu3QjZVVHAh0e9KZi69KVAcuDEQj7pluXnaM=;
        b=Jyo06rC9vY88t1MeYUn0QsumWDcOVFdxZXBOsLRyhAmlCd+/mbT1Lb2NgMnAoGmdWZ
         ejwEjblhNTGqZLdk8fZmF10B/rq1MMy4xX12eQ85ITKAIqGTn6v+rLzGyulMYHGTC3Ub
         MwtSaFkQcxealuUPUnhXTz/3nXTIzpjlqrrPA17IHqnQvq93fz4cvAvvihEPyRREG6+w
         j/RIeI2SYu/3YbkV2c3HJQwWReoe/7NB/3rbNX1Oa1WH62YjIX8vxgIFgVjfEDnPDkMR
         mdk3G2HK5UDcCPE2IXYB5CGe5PA649RqeO9Go7txJplvdnNPrxD92+6M3MNb5IxrvOho
         FJFw==
X-Forwarded-Encrypted: i=1; AJvYcCU167p3H/CTSESQSDkm6gGaUpc13NT2hZ+adeC2hGy/3UNvtiTZhh6iPPxbrIpMFSAGgCCgHaH66CrmsaB0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfemh4rqMltn+8UVzrB/7KX8DyNkD+Alxr4ZS9EYW9FpmhWz4c
	10//SKzFwEwKncHS+xrKzEwFBXqU5h0ExpfWdFRReVrDulZoPhbF9pO/wp1EWn+gxoas5D95y2z
	6Gl1L+9Z7xLWw8sBtSdFBkL0Qgv3t80qOXaSXEqh58zf7wf5fFZK7LcrhIcLggZf1B6K5
X-Gm-Gg: AY/fxX4s3XFm1MJyodO3uvkSoKZThZszN+XmastvA0Nl2yUnVdbphR+89tiO1jaogJo
	v6j98YuHoEwHXhWqbTqlQHj8Rb6IS8Myme9va/eKNpWgwnthqBzkaErmt5CqGMHsg4IEUIjDMj4
	CehtoeP13dMHUG/nSDoOtEQtD7OUiqOFvfJHyQa0O2gT9FVKFwuoAdj7zNjcB5eUcO6aIYozYhX
	JVZ75Al4frTseiG1vt1qdWUdYWiaoS3rjCQG547YlEad50pUJzbnqHDf7gYDK1p+k6rQrpgnRAO
	n48dCBDEZogXTk7Ktz5rnRShvYa608k/CWbPLdsJIVP4xAUjEWKm2T5x5yZVd2sa67uuVf2Nb6t
	EBfAuSBHZqKl2MQ9/lNGVDOWDVECS9nbl92E3zQy5PnoGXg==
X-Received: by 2002:a05:7301:53c3:b0:2ac:4db:9481 with SMTP id 5a478bee46e88-2ac2f8d1712mr8796803eec.19.1765873143533;
        Tue, 16 Dec 2025 00:19:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtWK4e1bXvpwdT10fDqm6Qj7IweZrG+0/Xy2p/wK3bauMqiPSgjejfvkiWk4/F8BT9BHrDXg==
X-Received: by 2002:a05:7301:53c3:b0:2ac:4db:9481 with SMTP id 5a478bee46e88-2ac2f8d1712mr8796785eec.19.1765873142910;
        Tue, 16 Dec 2025 00:19:02 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f054711sm652371eec.34.2025.12.16.00.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 00:19:02 -0800 (PST)
Message-ID: <09debd16-dd3d-4a9c-9b70-8b1093d4d5c1@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:48:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
 <fxf66ulont7wnmozqww2cklpp3djkzsgvc3znew4m7t47qlye7@32hxp3yze7h5>
 <20251206-efficient-tireless-dragonfly-c5d2ff@quoll>
 <db033ab1-9b5f-41e7-8048-3ae327b48ad4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <db033ab1-9b5f-41e7-8048-3ae327b48ad4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3BGkUHV7PemurVUvWPp51KqBGESitSl5
X-Proofpoint-GUID: 3BGkUHV7PemurVUvWPp51KqBGESitSl5
X-Authority-Analysis: v=2.4 cv=AOuEbwt4 c=1 sm=1 tr=0 ts=694115f8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lUzGdAYB4nMR4joB8mcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2OCBTYWx0ZWRfXx/o1X7kspo3y
 f9NBCBaNcif1qiVVK1CImjhdpNjSLrQeNhWQdn4DMojfZdeN6FMqnrozsykYMXBJxfZcUdnbMLd
 3qWPcFpkrAexOCmEyOSSbB4iROckUcyHNQoiiSyeianwoZ9KqLRUuYJTe8zL9HE1CpF/OH/RfqL
 L56XstQlIChi1ynJgn7MJ2BsHmXwXQUwaY25LaffblgUKSVO6CVXzPelYoCzFC/zl79s/5vw7Sl
 Duy1XAA50IGXLQ+RAzEkXJ48ixUwqu6IAKzOP8go6Hz9uZHEG0z/pwzjG3++YHIkur6e2/erKDM
 ra1+87ntKzZ/h7e/a4Vy0rPE9jVrtDlMUlf+wCG+Q7pmTVw6XBq3ELnk58el96HGx5By6a1pIJE
 rTnUou6E7PPfW3DJU5Qsc/LdFRS5Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160068



On 12/9/2025 10:06 AM, Krishna Kurapati wrote:
> 
> 
> On 12/6/2025 4:32 PM, Krzysztof Kozlowski wrote:
>> On Fri, Dec 05, 2025 at 10:55:36PM +0200, Dmitry Baryshkov wrote:
>>> On Thu, Dec 04, 2025 at 10:16:42AM +0530, Krishna Kurapati wrote:
>>>> Add squelch detect parameter update for synopsys eusb2 repeater.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>>   .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++ 
>>>> ++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2- 
>>>> repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps- 
>>>> eusb2-repeater.yaml
>>>> index 5bf0d6c9c025..f2afcf0e986a 100644
>>>> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2- 
>>>> repeater.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2- 
>>>> repeater.yaml
>>>> @@ -59,6 +59,14 @@ properties:
>>>>       minimum: 0
>>>>       maximum: 7
>>>> +  qcom,squelch-detector-bp:
>>>
>>> -uV? -mV?
>>
>> If thi sis adjustment in ratio, then bp is correct. Some sort of
>> explanation in commit msg would be nice, but I don't want to stall the
>> patchset for that.
>>
>> Assuming this is indeed ratio without actual SI units:
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
> 
> Thanks for the RB Krzysztof,
> 
>   Can I update the following as commit text and retain your RB when 
> sending v3:
> 
> "Add squelch detect parameter update for synopsys eusb2 repeater. The
> values (indicated in basis-points) depict a percentage change with
> respect to the nominal value."
> 

Hi Krzysztof,

  Can you help let me know if the above commit message can be added with 
retaining your RB tag.

Regards,
Krishna,

