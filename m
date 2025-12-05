Return-Path: <linux-arm-msm+bounces-84441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FCCA72BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1058300E79E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B8E30170F;
	Fri,  5 Dec 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T58MDTRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qy9DDZN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B065318139
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930764; cv=none; b=gmv0oLDtEvxIp3E4BFRVw/b3V4po0D+V/zJqyKfp0lvuifFMCehyK+Or97AvCrNRYPgYRrUCS462vtZe1N806+bK0P/r0l647BRaotydd7ho8UgDJoco1zu58zrmGMqxQHIeDME2wINxzioK5tdiSA4UV88iO5GjKSUQHWVt2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930764; c=relaxed/simple;
	bh=zqEa1Phm2YFivtYudYmDMsH0UzPdMx3PFBOBUcA7u6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMutz1VmpmDLtjA7xfo37pTjJxlMQ9+X00OaGtj/SFjxafcK2vypKQ00OUyTow2tmjNTWp3b1gMWTj2uHXQSMODmj+OEhIX+YxiljuMq9OqkKeFYyAIoijodKXy41OVraXKjAOE01IF6wZLdHc2X/D7TkUk0FgC2mE5AidmvWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T58MDTRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qy9DDZN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B54Jvtu3643644
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Md0HLaKA7v+7E4ybe8neyg7zFOaTJSlN0VpctE2sIUs=; b=T58MDTRx6XtNVEpS
	j9e4DaHhO34PEIHwPFMQc/cE1gU7Mb8atYdefQb8hJ9vPlK2vJ4m2hZWkAUfwgQC
	0q97VMjTN93N2HtkYnyS9W9eW5hH+wXFjwkToqLlvym59wM32yAy+jZnZcuxdeyi
	rbdsgXf6eJrC7GYkIv1CpHtQf81tvCA8sSphOT+MXFwB/HvN+AK3sAm7lQSbxbpq
	gmdAutYO2D7SxaxyU41YcPvfKctr7wzlxrbHl+a3RjR4aF1mbyIqDE/l/Gde3NDY
	xeVd3vkv17a+tKLnx4P/MhlSnu6SjSOUwT2bvuGj2tKESy3T37R7ffIoHFtsNMtd
	qMFIyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9aryrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:32:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso6677751cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764930754; x=1765535554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Md0HLaKA7v+7E4ybe8neyg7zFOaTJSlN0VpctE2sIUs=;
        b=Qy9DDZN1uRoJCkfJB/3RLGQA7ZiLnlRwdFE7g/KMZeuNdHliiqvMZxd0vDQvjewITa
         rXs7Ymt9h2IfvjGT+G+tdvAc6Xwpcy+cOYGs6seFrkUQFuSkEDvjqvojlfBR0IYdZqjU
         MxSyzBn8i+AV7cVtVDqgql50s7coQfGSXcCJKgQvAa1oXYKpY6PURURdaqBDY1ndOq4F
         EiRCJfYrNrV0mbIrAaacT39aem7fZ5nKRKe75S2M5pWEreZgiqC73aYQhwqsFX1ruDH+
         BR/mioj3/E1Wb2tnUkv095aEui39bUTjx9L/DIcPNivWrjx1UAeztvigC+i9X1ljvhDE
         EXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930754; x=1765535554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md0HLaKA7v+7E4ybe8neyg7zFOaTJSlN0VpctE2sIUs=;
        b=H+BMr6rdQVrDXGGdlly3ox7eZki0B4il4jWjV3DJR+tA4CyTjwCUGkRNgZqaNlfOLd
         /pSuLb+12xsyzgm0mrp2cgrWlE43wbb4O6bwfLLtb4poX89S9YlTpixaCc1emGvH+reZ
         VG4yAyw98s8u+nHpiQd6pLAfklLPY6sDMf/XLntj6QA5H2PkPd94oFejiEgBSJwjekmV
         PpFWCbSUsTWjf5CkpEPTLiBNzDEKjGXIRvKtcufpN/9xkKPGU3BeCojatGp5I5C3qHF1
         RG4hylR+XPwev1Tmbd368Yusk58rN4/JOIRNVH+rqr/fwe+irSNEbLuSY6csBj3TUT96
         eSWw==
X-Gm-Message-State: AOJu0YzIKEW9LX/W+NCcHisIsPYFory4J8+SkD3lW4xBdVavmQIO1Rj2
	3XtbFOmgZrwn1DkhXha/pQ6pl5IrAJZkwCCbxfIDJD8vh/FwRhyb8PtDh94NF2qupEfNl1Hpa4g
	W7VEuxW0w9yIgYf7pEMO8QBaQGF7SJallDdf5sE7KBqNJN4Wv/w8WwgCZhrBu7FH4B9FD
X-Gm-Gg: ASbGncv1kTSy/ocla2QVc6lX8Ox7a+YfvgyktzqYegEqJeNZUjn86FF8voOHfYNlzgw
	utVZVxjog64UWulXGdFyfyVPTFmSdZywN2COhfkku166XGiHjetOja5rOj8jcav0KPULkKb97LK
	oGNaY3MYbqNT7Nc7m0odd2rCxAc7fvlBOGk1nhXEJZtOZzP20hj3xXrmPP8HZTfK6LPGaebJ8JC
	yF1qcvAQ/u1lsggjDQb6Ng8lYLak9AtgqBumNgq5HwLXyv++MUBpn7kLEujW+kx5j26UsjeSY0g
	4w1xNf136wEY/IzUVy9D4e6IcQtOeMFXWoLDlgAUyYnmJfxGaTB36ixzNPpTFUOADUCrcaVUgjb
	pOQ+/aFjJinQ+nX2RmN/UBfXWxo/4AyWjzpWScH8N4wN7DOHgpeQFVNdU3SCoISMDWw==
X-Received: by 2002:ac8:5f91:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f01b14c0e8mr85907031cf.5.1764930754343;
        Fri, 05 Dec 2025 02:32:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxNbLfXF6Hv33bMHtXMT8E0wn88Sbiojkg1+G1AysByZB4Mfk/jeHRzS4+KmLPaRHLnUeNsg==
X-Received: by 2002:ac8:5f91:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f01b14c0e8mr85906871cf.5.1764930753918;
        Fri, 05 Dec 2025 02:32:33 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368de06sm3491412a12.22.2025.12.05.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:32:32 -0800 (PST)
Message-ID: <8ab2b4ea-6148-41e7-b700-559d34817a44@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:32:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
 <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
 <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
 <d8a3a30a-d627-4085-bab0-b73a2eeaa12b@oss.qualcomm.com>
 <2b03a898bf57cc87b78e3a90b210ed3d3f832efb@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b03a898bf57cc87b78e3a90b210ed3d3f832efb@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=6932b4c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=57xSM-M1QwdSUQZNnfcA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: IFgh2UgYC_3KDMCv8t9Ff6WRPHkdPGVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NyBTYWx0ZWRfXyynfNsWPMnR4
 cRHxsN0uLYMknBGgADP9JeI7EIb6BCpRLANAvGEiOnkzodGv4Oulf/z72DrYIonwwN2fQa2i0pX
 Jw7qq4DtSt6GZV3vhnq0h3deI6+aYQevNNawtTGVFItBA+1to1TV6ZzxLRMERxaJ9/lW0UoQZKk
 k2FFYPjbP4lqrBj4fjj7+OjGVWIJutCIhljKCSO0Jv0s/FSR4ihVHWy0hOlA9F/NywSL1tdtDSl
 PwLhJXM72UeuFjfpZ+JyEVaLa1/UrQtcV+FsQGMR+1JC72ycdmlv7Oid6T8WWQpTUK7ya8BLGIv
 TdvCrpjji3nc2PvFCQ/nweenMa9ac2zEwSkfo8e3gLdebcca9KKiJhpnCmVLFwUe+Eo3AfE4P0J
 r6quq6EACpYFOHG043Ece7B68Efb4Q==
X-Proofpoint-ORIG-GUID: IFgh2UgYC_3KDMCv8t9Ff6WRPHkdPGVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050077

On 12/4/25 7:37 PM, Paul Sajna wrote:
> December 4, 2025 at 9:17 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
>> led-sources is parsed into a bitmap and written into REG_MODULE_EN,
>> this doesn't translate into anything that's userspace-visible
>>
>> That would instead be the case if you defined a pair of LEDs under
>> the device node (which is valid if there's two separate ones, such
>> as for some phones with a back and front LED flash)
>>
>> Konrad
>>
> 
> so it should be led-sources = <1 2> or something? Under a single node?

Eh of course what I said is wrong, it does indeed parse it, but in the
end it's a !!mask (if any enabled, enable the module)

but for your purposes, try "led-sources = <0>, <1>;" under a single node
that you have right now - the count also matters and it may just resolve
the presumably-overcurrent issue

Konrad

