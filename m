Return-Path: <linux-arm-msm+bounces-76222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7CBC1A8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 16:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D2F1890FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 14:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BECB2E1C54;
	Tue,  7 Oct 2025 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCNjlgwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9CB2DFA27
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846286; cv=none; b=nDFr3sKeKVbYhlDDqezACtPkJKeXSZQLBN6pad8sYEwYUHITxne5cM/q/D2F83h1xbN6ezVmYQm80Uu+w9qRQNhlkeedKDqJVlnG3DcvhTkIqbR+AsVwnIblZXoWh8rE2EKJbz9ZmsZU4oDHcAKgBIpbawfpk2jdpHElOMm2Eko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846286; c=relaxed/simple;
	bh=5wQfQwqYI2fZ4w1KXVMOyK6TI0qttDsdvBxjxVjo+ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDK2lAUJDolRlsVsSnDhNYjD1ASYKSuzE+f8awqDR+XuhD9gthSJrEiElLzQ1A+6dq/g3GiBsVvOETYFSjHbMJ4sHqrflZvRf/bxhi8o32sVpXp7Zp/sqJU75Sz4JipVJtI/DlULgdSI4LWnkPJIpHRXV+EiorjyM9Nzs8OVwEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCNjlgwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597E3mFX023916
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 14:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktSaSroeEeu0/UwzC26whCkkXqXo9Ky2cJhuhNttXgY=; b=RCNjlgwfOop7gG5d
	arwVlWqSWExlXBE6AuPhk+OBM/Fi3R2S05wbdkdR11TQlbTGttahPn4eJx5RVywe
	rQ0LKj+G0QTwoIEYLDRU+sTorcqIZhyO1GDBKiHzUSH7kXgW2rlVhuK8pLN6oQZi
	4VRmdeEKvYRlue5bjWQqHZ1VNxjmx7nfF4AFYRCjSl2UN++KPN8YXZaP1N0IBU1V
	TQRvLb98F3O3c6SBcwn0UsAeJylMkjWshN8YO/S410q8JUv8Qp10ihZUAz9j5JQ8
	M404ZUaj6jOK4Hj2B062p6BD89kZ/9PESg0Rw35r/tT+0JqO5hYG4WKMwqAcADu4
	0sNCAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6ab52k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 14:11:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso9895795b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 07:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846283; x=1760451083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktSaSroeEeu0/UwzC26whCkkXqXo9Ky2cJhuhNttXgY=;
        b=k+RZwgfIXxX+Jsh4bLbdonVnVw+lSXdDQOP8Xfy5QwYXRX1u312bCtgCat1cGdRVh2
         u5nZcfxjv/sBQw+GqE+sdWginTRrVQCyW9svYYBUpHX1uDDGisiEOgOijqF6IppUbBVB
         kUtWIU1xjL+PHiop/qpuSbiDcHevvCqICRNKiKnkByxgHgE8oLRXwfyDrDgyxA2aqbL3
         Q58GwgneBn2nNHo04l1bBWWtyIY3Hwqnl4DRyHus8AKJof/aQUP85zxWF541LqSSgD5N
         v9IWPDegLGoXxp8TnjW95CNE+LK7o0fMkxN+72lNTbku6FFQxpJYZJWKeuGXQ0oM1qXz
         4g8w==
X-Forwarded-Encrypted: i=1; AJvYcCVgvBKH1j00iXZ56FDJKFxzu6CgWc7vNFJoId/jw7Rt6LB0VrCCWAFAJlmwIrhJ80i5zEOp3fAK19LrLnDj@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAQsWtoEhTVv5K9LXECkVmQ5PbxNmJ1u0KOXp6eQHZlK18Hdr
	00YrnkXZ4WVh6X/0qNtHzOymMRqVQ8j+zz2Vil7iW5YkQ6OLtAJ3L8wgi7ehwIhm2nmi+U3BZEL
	wGk9j7ZSnfHVR7w3nwwfCu/8a30hpR8rodiTN61R4ZcUFn0qex6qEZCLbJqnxsWo4kCDZ
X-Gm-Gg: ASbGncsVcRfuImvjY3UB+AxIfKAqEUygxqW8NV+WFiPD66arsogdZ+V7KjGTs7Q1fW6
	uzBObC337aToOeetPNqoGbifQpr1Mgx/W29PkofnCJmiG4vCJqIhT972WW34NLUCNQz41a4Z0Q/
	z7OAheEq1HqaZBBUet+RGhL0yy9ISzHWE4r+3nmEHIB8c5nIiVZ53b0fNg9YrreunOBCQanaPTh
	PQ29e4X0HwOIXz84lDwg6Nv2SGKZ2c/G9eprbuRtZptmg72VLz9eQVn0/lv5iQKdqXaiB/QFo0E
	R2B1GYheqWN3KCruccoXshcQ6a5pj/i1DmHzldyhsxnLrixbs9B1Mro5AUIdLegWmowLGe4DKQ=
	=
X-Received: by 2002:a05:6a21:998e:b0:302:9f3b:3e5c with SMTP id adf61e73a8af0-32b620a8d65mr21677931637.39.1759846282886;
        Tue, 07 Oct 2025 07:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiWYBtr6EzAYm3iarthma/0DUKSsRzYme+v56XXtnu78Nq/GDSGSQ38ocKvh8T4EgfkEtS3g==
X-Received: by 2002:a05:6a21:998e:b0:302:9f3b:3e5c with SMTP id adf61e73a8af0-32b620a8d65mr21677873637.39.1759846282301;
        Tue, 07 Oct 2025 07:11:22 -0700 (PDT)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4cfbesm15316893a12.28.2025.10.07.07.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:11:21 -0700 (PDT)
Message-ID: <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 19:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e51f8b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XxnNId_WCiCfXLSGgVMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: vHu6weU8c1i8CkmuxLDC8SoFa6XgYwax
X-Proofpoint-GUID: vHu6weU8c1i8CkmuxLDC8SoFa6XgYwax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfXxOmXgvDwsZzV
 S2HvHNgUYGEblUbzU/TbA9dSTb3IhZfYFzdYJwNq8g9EHbhJsSAR9FiT3IfFfrLlfZD4y9lYMhU
 hQp4AY9VCUezxEtNel+l/Jr4JCgdVJ5x5mYC3V/Bgi0mQucvVu8FCYHvlvzSSyl69L/r35UdGqt
 FYCvg4FJcFI0IPx7sGqnkK5GNAFJBsYLGY86JDNko6N8o4s/p9sx6VN+GeDFN5O9cUjux9wVFIs
 NwhTXU8pz8zTe6eEwWnAAin0BLjKxNwESzUG40zmQyx71NM6Ok1MpX4oRX5ugywWCvPnCBJ8tl5
 lOiCGi8tqMkaJwFYknhLH+DbJh17UHjpsxPdDANkuGlk8tXor27NzQGftGvhBfEUGHhtOFuxuRI
 qf+44dFMCuLz+8JE8oRvSkyF2zs7hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121


On 7/4/2025 10:15 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 04, 2025 at 09:23:06AM +0100, Bryan O'Donoghue wrote:
>> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>>>> I still give my RB for the series.
>>>>
>>>> To me the only question is should it be applied to sm8550 or to new SoCs
>>>> from now on, sa8775p, x1e and derivatives.
>>> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
>>> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
>>> once we do that, we will realize that it also changes the ABI for all
>>> SoCs that support either Venus or Iris.
>> I think a dts change is a non-starter as its an ABI break.
>>
>> So if ABI break is out and reworking future dts to allow for a new device is
>> out, then some API change is needed to allow the driver to stop the kernel
>> automatically setting up the IOMMUs, create the new device as a platform
>> device not dependent on DT change and have the probe() of the relevant
>> drivers setup their own IOMMU extents based on - probably indexes we have in
>> the driver configuration parameters.
> 
> What about instead:
> 
> - keep IOMMU entries as is
> - Add iommu-maps, mapping the non-pixel SID

Otherways to avoid the ABI breakage:
a) Keep iommus max items as 2, which is unchanged.
b) Repeat the same sid for both entries, i.e.,
         iommus = <&apps_smmu 0x1940 0x0000>,
                - <&apps_smmu 0x1947 0x0000>;
	        + <&apps_smmu 0x1940 0x0000>;

and then create the new device as a platform device independent of dt.
RFC for this is posted[1].

However,  Dmitry(in offline forums) termed creating 2 same sid entries
as -- "ridiculous band-aid just to fulfill the "ABI" requirements and
really doesn't make sense". Looks Fair.

OTOH, To exactly implement the idea mentioned here, I have the below
questions, can you please help me with:
1) By keeping the entries in 'iommu=' as is, then add non-pixel sid in
iommu-maps actually creates the overlapping entries.

So, IIUC -- this requires changes to the iommu driver to ignore the
setting up the non-pixel sid(or whatever is mentioned in iommu-maps) and
then use newly created platform device to program the entries mentioned
in iommu-maps. Please CMIW.

If the above understanding correct -- Doesn't it look like we are trying
to fix in the iommu driver for the problem statement related to dt bindings?

2) However, I still think that problem statement of __non-eligibility
for video IP to create the sub devices in the dt__  is still valid and
can be taken separately and actually [1] is targetting this. I believe
this is atleast required for secure contexts. please CMIW.

[1]
https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/

Thanks,
Charan> - In future expand iommu-maps, describing the secure contexts?


