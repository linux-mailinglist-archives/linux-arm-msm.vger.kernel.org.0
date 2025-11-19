Return-Path: <linux-arm-msm+bounces-82593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C8C71087
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 21:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 6ECCD2940D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 20:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282C431B805;
	Wed, 19 Nov 2025 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DA4bGn/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9abKZ6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6502EDD7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763584137; cv=none; b=qd/Nd+JqNTLcIu1LD8yxV7Puu7PWX7vKZx+ylmXr4+OCE2WmNtk6YDSCiM1I7fh9MzpvZGFPi+8Er6wjTtwbkdGht15BVh+pxW2l1c0h7KVqsQ2KKzYI22wqwTV+SuCeKr4IZgFRRvJnvF7WuJiyPdRiJyXVBmt41/OQo8X+wy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763584137; c=relaxed/simple;
	bh=g/pK8ZLLGLzMcWkMe0ugqHmKKZyS10imeG122WSdOWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjlYBqy5QxNL6wo23wX5QVxIWGQQawxHO+abkpscLrr7Nt4g0RQXXh9pNC10vGxrmYMcvEFF6kK761+ECdaWwnO+dqrtGXbjANEw0fJbBwztsQMTKLW0JSZD3exRrRtN+ytq6/LSaVzKrbjlPlrBDJp+sZ9QEt5GAXqb8zNYcXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DA4bGn/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9abKZ6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkuZo2369127
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 20:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPnM840VJFPRltzXDqsgZKK11L3FNwTK+BhD/jqFmsc=; b=DA4bGn/i6Ly6n5/E
	s/7EcVXBgz0RBD/u+26qrEt1SBceoQ7v5W5Kr2lUmjiqHCkIRSbiqEgpWrki8jsz
	KhjsZXUBNgb3/c4tDJhtN6oLT9ZKGO0S7tGoOtDN9g9G6qhlUqU60mgZmZrbOoOR
	W/S5CTuP23tLjRFyfUM5ifChMGUJ6Ns3D9KGKUSr03QN178zib1SlIfu8fkIg4Gm
	L1RKsoiq9Ss6bwVcd69imAFvo+hUs69F3/ZbZ410mL4pLR2Z6d9H8Xc0V7tmnnVn
	epgjbw6wDpIU6op+rba9/8hO6pJvTB6vD2SEomFsCJi1WaCssAL5wnMxZeJ/8J+s
	4nTQCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fgauv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 20:28:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee3296e984so3680361cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 12:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763584134; x=1764188934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPnM840VJFPRltzXDqsgZKK11L3FNwTK+BhD/jqFmsc=;
        b=a9abKZ6P3siQdHQbAE9T8xXgRapW3qhC4Wj4+DtwljOBaJB1gQq/afw5jbwrED9TYF
         QKmjlik2YAELlOhH276GKVMTUR6rcZR/qlXAp/6OXLiZpt/gcDZgIPnh1sN2Yhy7ID+i
         16icDu42ovFUA680GR4YXjAuNoyb+m9+/kStQu/yoADJ1fD++cdonEFNwytPHF9u/fBK
         roY1Qor/QtAgq1qV0Z+xlXJy9Zunb58XUhg7zJipd8ViWQMYPV4Z/Kok2K7lgrn6q4sw
         bHZ4WyDFUkwr2qpA+3V6jbVclq7vvU0CJ8oR7TagcNs/c5dKciphf8E73k2chDLn/q0H
         ndhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584134; x=1764188934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPnM840VJFPRltzXDqsgZKK11L3FNwTK+BhD/jqFmsc=;
        b=EHdAh1eSScVURIuGME90U1/Q7NPAP8lefbF1Ao49npIMW3cQFyUCbmcTj9k9OPm6Q4
         mz+XPx6iympqo3hkpywd0e0G4RGsQkWnxKnkU9ybUqSPJS9NMIMWv090JT0cqQFiKO2R
         gLb1/sAS5HaasL/em3RlgunxuqBr77JOvFsLqOdkfAybQPhIxj0RXVOANhyBNRP6D5hH
         bbg3q2TRKPM04QZHUJivjY4UP0kFydXp1jbT3tjICJA7F5gWphbMhgP5kPrzV+B2Nqlk
         Fkn1JBeD0rnykGZpFxm9+piwbTa3b1xnXyfbpurYPNuCKu+7nH1xRsxU4oS6uKONtGIT
         ijoQ==
X-Gm-Message-State: AOJu0YzaQb0F8lSJMTw0jRwfAjClIrQYkszJNU/i+JQti1t1UDNJbl/9
	IJeaZJdGWASy31mQ9QK8y+yp9EjrPgYQceevuWkWp2dVHqjh++jq1zjHvTM4fHSfrJM+lcacrQw
	qHtJwILASDb0jprGp09dH+APPGeVGzJSFABteeEJMGdpzQMzsedee90dNl92fO4PpzCEy
X-Gm-Gg: ASbGncu957JuG/L+XQVTe+JGvTHBREl4SeUMWyJ3oiLxOrnM+KHJmLoo7P3oorGA5Ra
	0IDmZzhxfhRZnEi/r3wMyXN44KpS0zCOsY8n8M4+a+Fm62RV06aCWnwZQPfsvul3pNbvvNQgnup
	q8zc+phg62kHEax0Qo53qRN2HB1gOW5k3yrXyolNEHkKx9Ynbsrw1wvEFEZJDKIAyTryS+mQZwf
	4CcuwjjvvCR8APn1XkUtmes/9Y+ETOkz0aPTZqfEjyCz53OWGLc5GkzVCWB9dsNAeH7O0h6jJnm
	Pj+t7mgfr2/Og10yDhMiIE3osAEbYlJ4/x1v2T3UG7NuvEXyAdLiTqmOYLmavHUMfNVxd6EgpjD
	Hv+Y8/kmKFMdi3X8q14iTuwBC7l5BvNIyOHyF
X-Received: by 2002:ac8:5e0a:0:b0:4ee:24e8:c9b6 with SMTP id d75a77b69052e-4ee4a09bdcemr5261941cf.59.1763584133566;
        Wed, 19 Nov 2025 12:28:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOXKTjfsFE02TAa3utoPP4wwivftCiEZk8Oiy72azJqAD3Dza9t6k70sbNo+T2C2pKvCDD9g==
X-Received: by 2002:ac8:5e0a:0:b0:4ee:24e8:c9b6 with SMTP id d75a77b69052e-4ee4a09bdcemr5261631cf.59.1763584133087;
        Wed, 19 Nov 2025 12:28:53 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8a29sm1035717f8f.30.2025.11.19.12.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 12:28:52 -0800 (PST)
Message-ID: <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 20:28:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _h8ha5YUKQsoIsXgP_mty0PuIWGFP_mq
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691e2886 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=dCnKVPZACBjga27198AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE2MCBTYWx0ZWRfXypxc3nzw/zyD
 hQ2+ZYz2NEHMXFFi3YiBAIhWwrtDPkixCXZhphjeOb5FafNEKcfV50tDNKeq13ps4DUElcaDNA1
 spKDyYx/ARv66tL8CaBDq4V94yz4kKGOjaG5HTNefjfn5qTaKQMKbuYoEnXd8S2QAIS1YO8wLdQ
 jYZKjNt2MZ4+qYe1qlmt1W6C4CEXFMRvBSEAKlbK9GL5RFzm5F5oAwzH+an5BRydPL2gcGAbgLr
 r8kRzb9OhvIVqZHj29sGXeS8G+SnpE82f2mG/rPKYk+QZiL2d6RXJxlgjkttEJnZE/O3EYWigfM
 HBiTGRaS+Pcsa0IuaZG59GZmQUNiULT/NJkgXE7AZBY6Jky/ruhyCM2I/PjQrCnZIjbwW3qvDbJ
 vV1DVhkYswN3Xo+cpOM65yidpO1F2w==
X-Proofpoint-ORIG-GUID: _h8ha5YUKQsoIsXgP_mty0PuIWGFP_mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190160

On 11/12/25 1:52 PM, Konrad Dybcio wrote:
> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>
>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>
>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>   * add shared memory p2p nodes for CDSP
>>>>>>>   * add CDSP-specific smmu node
>>>>>>>   * add CDSP peripheral image loader node
>>>>>>>
>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>
>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>> related nodes and add buffer_mem back.
>>>>>>>
>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>> ---
>>>>>> [...]
>>>>>>
>>>>>>> +            label = "turing";
>>>>>> "cdsp"
>>>>> Ok, I'll change this in the next revision.
>>>>>>> +            mboxes = <&apcs_glb 29>;
>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>> +
>>>>>>> +            fastrpc {
>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>> +                label = "cdsp";
>>>>>>> +                qcom,non-secure-domain;
>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>> created for CDSP
>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>> Is this property not neccessary anymore?
>>>
>>> +Srini?
>>
>> That is true, we do not require this for CDSP, as CDSP allows both
>> unsigned and signed loading, we create both secured and non-secure node
>> by default. May be we can provide that clarity in yaml bindings so that
>> it gets caught during dtb checks.
>>
>>
>> However in ADSP case, we only support singed modules, due to historical
>> reasons how this driver evolved over years, we have this flag to allow
>> compatiblity for such users.
> 
> Does that mean that we can only load signed modules on the ADSP, but
> the driver behavior was previously such that unsigned modules were
> allowed (which was presumably fine on devboards, but not on fused
> devices)?
Yes, its true that we allowed full access to adsp device nodes when we
first started upstreaming fastrpc driver.

irrespective of the board only signed modules are supported on the ADSP.
I think there was one version of SoC i think 8016 or some older one
which had adsp with hvx which can load unsigned modules for compute
usecase only.

I have added @Ekansh for more clarity.

--srini


> 
> Konrad


