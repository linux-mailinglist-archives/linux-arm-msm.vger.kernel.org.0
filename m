Return-Path: <linux-arm-msm+bounces-86968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FDCE9B24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D19A13014DA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F1D137923;
	Tue, 30 Dec 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkiOg2kz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brII6rSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308E126C17
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098774; cv=none; b=PfKd66Tk1wc1vfa6xmocS476KjJ5Ihwgj6yRvIKdmbRdySpX4LJdPYFGhwtYI8zpCwoNtr9a8PpNx3AiQsF7dCIQk8LrOueeLwgGA0UDtef0dDmgBWgiqoGbtdmr8OECEbJoaQjRI253GpOVRv0ARv+Fu8aAgaU7OSe4ZYoD5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098774; c=relaxed/simple;
	bh=QMzuX3iH/0w2GKT6Or3AhabnbhPjAvfRoLIsCGLS8qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4u96CGHu4b06itk0byPhbEOMWvzBU4to0vHt+027jiWsraQ/+EC3R3JtN8RUaAkDlOz5w8QL7hgxP9lO32zvKgb5iLgzWKhS525Z0fH4Yo27qQhOFGUm9fFVLLiRtPsRUMJp4z4TB/6Q9WDRjFdjlvFhn1voJOExpUFBLlXK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkiOg2kz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brII6rSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU5RUtg898850
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4DLs7ni7DP5kDXUGhlfKo0VbVTw1jbGtRlgCaFmH3k=; b=mkiOg2kzl/+36J+3
	cpo6f70zfyrbkJLeTzl8GjOA/2xe7QnYWdI17LimeqAw9VOzGJO8GLiRRW5AB7DI
	5a+xXZyuY1UwYHIqf0cdJcN1aK0OKeHW06Fonem/eA9ADQrvrZKeSm80lymW1a5E
	kXJu07zA4xtpKGRPn8X6EQfMhlU3Oku0FbgGyCIDx3QC/LFONBYQihZdg75PXr+W
	IicLEkPg6TELLNjOlGpQLORouUspZm0bRO78cVdoUyw1ufKcW7MD0auwiY/nBDF7
	mc5BPMO0qswv0KszNxsOACTHvnfqHiDGrrjx/UZrXJqsQXnaJGbnKWGA2tuUv7ek
	3P/NWQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky0xx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:46:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso17449435b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 04:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767098771; x=1767703571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4DLs7ni7DP5kDXUGhlfKo0VbVTw1jbGtRlgCaFmH3k=;
        b=brII6rSZ6kh198g3i2q0i81y6K/m+HKTWNl+GRm1erHySJY3+nEkTisi4Dm+UxMzJ0
         Od6mJSWUkR0LQidLFPCLfIO/4CsbfwOG83+2rtPd7o5nTcd+yB0/mUx5shCv8ypTXN55
         L2P6e4d3h1+hlvcf1ccaslpcjyvlt+C9n4VgNHJYBDYO2y1/Tu0zWd7KlCGXfwcm2EzU
         PdCY6dfGSREP/R77bV6PtYrUTcmUC7z8Mtllfjn6nRbUtJ7Kd2iumSPBjjovL3Ey/WVO
         Q8k/24PqGyOay7RPDvZMz9rU3jyjUiyfHdxzpfZT4YTmxXmBy6EykUnUGDj3xXTrkLY5
         qaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767098771; x=1767703571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4DLs7ni7DP5kDXUGhlfKo0VbVTw1jbGtRlgCaFmH3k=;
        b=SsCLcaHp4Y3sGMuCNg2IdQLY0eCZ1VBkixNshsi3Jh1n0PLgJrCkizZ3Rydr+H8XDf
         uA4U4CjZ0uckEpZtn7TW4hF73T4+UR7LCf8YC47ViYJSI1rpxf4MWILAD0LtJxFh684h
         J3he2Zqg6OT62a5X7yQDNvPwzrgQN1nd3PwJcziO87WeVdq9hrZjXDjWFagofL7kECv7
         tgkmi4i0UM6q8K9QOJqqBvM3Euf0wqd3XFA7J4GGur7nOl3WIcXu6IO3KflTOwPcBp6e
         uRUtmTtfXIsQbbCL+v02NzTW2EWZCcR8hiJh8ph6DBClOB3dhoSA4vh8xHyXAtrqV+FE
         CkEA==
X-Gm-Message-State: AOJu0YxjJv0H9/o7u0SGv0G5c8MRLpSXkx/czEZB7BrMD4iKaVZQz16w
	vhBUnyGCGSZBWJ7DhlMayHyjIDp+baqaCbdlskZL/ImmWAX+pvg3xS/9LBGt4LdUeaQeyzijvKK
	QeUvs2JJL88c3Mzs5CSVg4p0htoOdn4YewXTIG9W7NWIyUtHG5Tq0qr0whR9Svkb5S/5q
X-Gm-Gg: AY/fxX7GNmurINJiVNLdbDvG32pcOEX2Gc7gpWXB1u8nKnPv6iwWSt3hxg5dnFjEFkQ
	gxFaxuWtt10pmzgpUtGsjhpBE7ifSFr9RlDgvzOS449iy4UMMt4jVTs2ulIbtgYKKNNUvF+lKXg
	u8un/9tq7SQcPrapibVzpv5/WEGGMplwPyyA7eW0HqfTfEfAosXu0licbe+7AXkXuDoeiH9sEaw
	xDEPMATI9EaSYx99QYp5E72hKl8GPGF7uP+dCGhwNRi4Y30RLrqIfTPA+OMwTyd/D70q8e95aIU
	ZYy4uVspvnUBqxHMXZxIt1YsldqAzZqKAj47kfnuJ7Lp+pUo1+F6u6YBpaIGPmm2fkFfb9jY/b7
	tlDBEHxhqq0zJIEMJYvZ5+b6+3SliqHvlQg==
X-Received: by 2002:aa7:9318:0:b0:7e8:450c:61c5 with SMTP id d2e1a72fcca58-7ff6667cb84mr29469465b3a.53.1767098771437;
        Tue, 30 Dec 2025 04:46:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkI5Q1B5CyAklZSdJCafcyTkU7kBF5FWLKj2Rz076mFPVT+dRDRmX/HBxJLEUJtVpIcJ+aSw==
X-Received: by 2002:aa7:9318:0:b0:7e8:450c:61c5 with SMTP id d2e1a72fcca58-7ff6667cb84mr29469450b3a.53.1767098770958;
        Tue, 30 Dec 2025 04:46:10 -0800 (PST)
Received: from [10.204.104.209] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm32434249b3a.66.2025.12.30.04.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 04:46:10 -0800 (PST)
Message-ID: <5a8e3805-588b-4e2b-bb84-35bdc71521fa@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:16:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
 <aVNf-lZ1KcH3tRV_@sumit-xelite>
 <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExNSBTYWx0ZWRfX4cIdDAKt3IVG
 ZGf1mECILoes4h5/gIYvj2VwPddWEaCirZ335UOMWEehrLNq7pCXMyq0cGLAvgUAZfNOikdr1T4
 7fUxJaL0OvxR2y4r4rsFnpO25WJma3KJDxNbxq8GvOrgHTi+Jqb0CVNDY4aDXekIwLEUVZC2Rlo
 UvAaxQi9s+LsCraaUuBl45xHUXEDmIDz7w4xBGAdlg7Kxxwrdw3ajUwtlCKZDdmWGMswoijkHdi
 U8jfGecTVW9ZuVuYntMZAd+k59ii/qqgFmek97v8lJzY7Qq8tVXk1Wgdi9uEyL/zMPtvAgXFOMm
 UOcfOeGKH3V4Ys2jvS5sOzdvmvP98zlzf2tSKOGez2XSaimq4MLVQlLQRxeEpIWtqsAxJYWk7Zj
 t0YhgIvO0J1lXybcHEJORNDtnNqduh03+coqDqbIJL+woGt7O9FLhJpkHHmpJFB5YKscwP9lDrJ
 8t5Q7PcLvAGU4862u7g==
X-Proofpoint-ORIG-GUID: gAmCNzAXx5flleoU5x3aMzZPwpm5KJr5
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953c994 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AGhfR3YMigLB4eqwYEMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: gAmCNzAXx5flleoU5x3aMzZPwpm5KJr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300115

On 12/30/2025 12:35 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 10:45:38AM +0530, Sumit Garg wrote:
>> On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
>>> On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>
>>>> Fix IOMMU DT propeties for GPU, display and video peripherals via
>>>> dropping SMMU stream IDs which relates to secure context bank.
>>>>
>>>> This problem only surfaced when the Gunyah based firmware stack is
>>>> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
>>>> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
>>>> as a fault by Gunyah hypervisor which were previously ignored by QHEE
>>>> hypervisor.
>>>
>>> We are porting the underlaying layer. Can we make it to behave in a way
>>> similar to the _existing_ software? If DT was a part of the firmware, it
>>> would have been fine to perform such updates. But as it is not, we
>>> really should try not to break the interface boundary between firmware
>>> and the kernel.
>>
>> I support your viewpoint. But in this current case Linux kernel VMID mapping
>> for secure context bank stream IDs is incorrect. As Konrad mentioned in the
>> other thread that for secure media streaming use-cases, it rather requires
>> proper representation via iommu-map such that appropriate VMID can be mapped.
> 
> Yes, I understand this part. I'm basically suggesting that Gunyah should
> ignore this SID when programming the actual SMMU (probably like QHEE
> did).

But the existing DT description for Agatti GPU is buggy. SID 2 is for
secure access from GPU and it should not be mixed with non-secure
access. We haven't hit any issue so far because the KMD doesn't have
support for secure usecase yet.

At least for the GPU property, I feel that the right thing to do is to
correct the buggy description.

-Akhil

> 
>>
>>>
>>> I'm fine with the change, but I think we should make sure that Gunyah
>>> doesn't break existing device trees.
>>
>> Sure, this change isn't breaking any DT ABI but brings compliance to
>> usage of stream IDs.
> 
> Actually, it does, as you can see from Rob's email. You didn't perform
> make dtbs_check while submitting this patch.
> 


