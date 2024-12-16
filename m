Return-Path: <linux-arm-msm+bounces-42338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AA9F30B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CFC16660F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 12:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5CF204C0B;
	Mon, 16 Dec 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez1YRvOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9E1B2194
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352921; cv=none; b=X9OKvb2g4n68CQFgmyysY7c5vHIlT1pU9sOy2bUYlLdw9SdO4yPlurdnirgyFm4P53lUKZHHpkWmhFv40Lnmlcn921+VCgpAMUClQPHqc0z49NcJ1StuFHH0gJQTSlxWN1axL8z11sZUet2ic2s87zGidiZtvr3Hp4w9RBlRNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352921; c=relaxed/simple;
	bh=VAccwSQq4fCA/8MfBUF0MhQqTNbAugDW0Ufbw6z78GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxRp9ON+E+0itKxYRnQhMksGSjqG2F8i6EfO5SnrVT5+zjMQBCfYQl7TWON7cAa/m8Q7FqEgBXRDDRV+RkeGFwVO/WazyKhK3Vaox4sje+oXcubg1+DuROvLNkyGEASHxZm7AJWu+R8M00AamAE0MrDbUkiDqZobeXgxPTuwlMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez1YRvOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG80es0008376
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 12:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/L6HGdRQ8z7BAUo9cW4Zt4G50i3p3KgBlyrq4NsNIs=; b=ez1YRvOtHlcLli3+
	Hcp9x6abDRWdeSAxJkOu7Lk35HCFJvFAgPr0p7WyIGH/QPCy/MyCwcqBa9ktH+TG
	aBsEytjHitW4Qz/fcKbXQNSn6rFrGNwIrfvZRPAle//F+hXyXamsd4pdABQOlUzb
	Az2fvhNB6XnvWP9hZ1A24/2rkDv9qwzRpp0jcZ+rk6JCmG9ynSCreM4Qmz5TAurj
	iLrf/sUfqkV1UnngwsPESig+kV96KJir7VKcPgB1w/hh3QcLOHg7fY9s/akM5Rrn
	tZW0QZXWqaSA2K1Eg53BhvwXTaJ0E5Unca+6vqhWLTC7VFYeV+b70vBVkK8Gfqba
	BW8f3w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgas8rwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 12:41:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d881a3e466so10089666d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 04:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734352917; x=1734957717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/L6HGdRQ8z7BAUo9cW4Zt4G50i3p3KgBlyrq4NsNIs=;
        b=NQCscg/NhAcJjZDSOpRP/HFI1ZJvLAmjdAIfghRT53DeTm+QzdBDGAv/dua4qAIwNt
         3pxTRgiBooprt5vCzRfhXjtCX5h7IXpAiWV4rgXbII/tgT09C/87xiQUL/uwEGgLYxWm
         kP7AnfpTQF8j3yW4/aUUjDXww/HJoXGOsW3epjbOY74VNIZ8UxbMxZq1hExrZq498NJf
         QcMDCKvGT8Gg13W2ipOeohrTk/MdBFtHPZDk+AKrUDQ5DBIeR7glJ4ga8WFgex3TgfGD
         eSahu/VohaYywUpJGs6Rc8ly6p7I7bAs5hYpfk3NGevy3KYRxcpZB6xvBo+S/0uZFo+X
         TlPg==
X-Gm-Message-State: AOJu0YwTotTIv/6ikuX+VqCVEK+QUbNO7bl5r5hV4d559YbmutYZKvew
	jJqQVimyp2hgIiAHwj/YGOyIbeLVHw/6KnIFu+fozIaDhMjK527Y/PYn9TAMpVIKez1//yxHs/l
	MqDWrusWSXcqqLbaED4A4iye9ANHizdV6HREme0eFFowAxpyYLx3uzn3mjOO9yH8G
X-Gm-Gg: ASbGnctsstnEfqfSWEEhRMoIK330nRc+QEnEoNH4GYnXafCZGSbkanXdmF5sPHHuXef
	X/LONnVNaj6KnR0Mkn2IoKK71yjCPXk6BKOqifqeMct5D+7Dp62dxejDUpXN7c6zYknQpsGuU9q
	Xud8kkhDxM6T6WXK0ufdiqD4yp1vUQj76Su/L4Fye1UNixzgD20sPbP/6N2DP5eN00H5yxtkEsx
	6XfPDNwC5JHpZMB3hCNaz9dnfD62Gg2BYodKgIrcB/G94N6jKdxjkiwl2AjRdCcz2+vVnPZiJdR
	xamTfL4Gn4OhVMK7nPeYeXMwsJQC8oDmhLM=
X-Received: by 2002:a05:6214:4014:b0:6d8:7d84:a514 with SMTP id 6a1803df08f44-6dc8ca88587mr74213826d6.5.1734352917576;
        Mon, 16 Dec 2024 04:41:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWj/Dc/7a9GmowBrhb9GodXJ7OEKyuuWtEeMBro46otsgJAsgLqvKJTKDXcfAyhIOqIl9/zg==
X-Received: by 2002:a05:6214:4014:b0:6d8:7d84:a514 with SMTP id 6a1803df08f44-6dc8ca88587mr74213676d6.5.1734352917242;
        Mon, 16 Dec 2024 04:41:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec3dsm326507466b.150.2024.12.16.04.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:41:56 -0800 (PST)
Message-ID: <2b866563-1328-484a-bfee-f41190ce856c@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 13:41:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove unused and undocumented
 properties
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241115193435.3618831-1-robh@kernel.org>
 <68c079b0-defe-4cb0-9f6f-ce9e3645e2ba@oss.qualcomm.com>
 <d3d9dd62-e0cb-4c12-91d1-17ae52688654@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d3d9dd62-e0cb-4c12-91d1-17ae52688654@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d0xamyVxKG6l__NT-VPe5Fa61tkyODgP
X-Proofpoint-ORIG-GUID: d0xamyVxKG6l__NT-VPe5Fa61tkyODgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160107

On 16.12.2024 4:42 AM, Aiqun Yu (Maria) wrote:
> On 11/16/2024 3:36 AM, Konrad Dybcio wrote:
>> On 15.11.2024 8:34 PM, Rob Herring (Arm) wrote:
>>> Remove properties which are both unused in the kernel and undocumented.
>>> Most likely they are leftovers from downstream.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>
>> Funny, the sideinteraction compatible is undocumented and the touchscreen
>> driver is not upstream
> 
> Does the compatible also need to be fixed to "focaltech,ft8719"? Refer
> to the info from [1].

+Alexander, Caleb - would you like to look into this on axolotl?

> Confirmed, the compatible "focaltech,fts8719" is not even in any merged
> bindings or drivers. Instead, "focaltech,ft8719" is in the current
> driver and bindings.
> 
> By the way, I am curious about how Rob finds the unused properties.
> Could you share some steps?

make ARCH=arm64 LLVM=1 -j24 CHECK_DTBS=1 dtbs

returns all kinds of errors, including "undocumented property"

Konrad

> [1]https://lore.kernel.org/all/Zk4tLPn277Azd4XZ@google.com/
> 

