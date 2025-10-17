Return-Path: <linux-arm-msm+bounces-77692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DEBE6D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1125D189C967
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 06:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A48F30FC3C;
	Fri, 17 Oct 2025 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgTFadsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FF217659
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760684148; cv=none; b=u7aEN5japrnk6uw0ICT3vxAAsxBQg5LtYfyYQkcL/sde4Y/a9nQCMxV9qsM3Ia/tZ0QupyBqZLdSkwoTiPm0Xh+VDoitzWp3tqVtVVry+Hm7Ac2W+u0r6kk3eVrzIIYey4Q7ee7kah2AE55ZIUbr5sG+XDh4mCSSJzcrw+A0PB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760684148; c=relaxed/simple;
	bh=1d+oU1x9vUW6ue2spoFKr4PZzm0efWoIompDGmuEOTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSikd8gH7YAN+VbwTpg57VLSO6tEW/0q0dpIuDvtkY5X0oBDuF9iPMS/kvWZXwa0xg11qN4a7Gq8r7wO/yVlI34l+dDa1yCamytb+ztQwPLI/op0KExJg90SmR7wOffWDNSXieE69WwYQSTLK1x0Lrjyzi3jPXqUiShzec1QOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgTFadsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLRun022235
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiSYgOYyxORB21Hsjal1suikR0J5W+ut2yxpevDfr4k=; b=WgTFadsGuoE0ISRb
	R6IP8bq2JghLey8v6+EmBsFhexvICq6PZDTzdy5dCDWMrWO3ufHVxTmHv8wf8E5r
	tP/IJ+Aq7aRXmLGeGRT5sGwqeTYvQNAE34hkmQVB/leI53E1Oi8ge9/S/3UgjMW1
	hwJ0Et99UAZcdXG+NddvHbfI4l75AQchr/jPi1yIFOenWMUROV7uE+c7gOSseOJZ
	pq0RIfQsoPW94BOK0ohYep6kaxOH82B78d4/9AR10HsvomdPulC23JN+fWQZocml
	dMcsDf7aEI6gDrKBmRALY2wrbeQigfuNhk3RbkOd7xaNakaHPd/rn6uS3EyiKln2
	r4XV1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtg547-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:55:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso2538067a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760684144; x=1761288944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiSYgOYyxORB21Hsjal1suikR0J5W+ut2yxpevDfr4k=;
        b=rbRLaQbBK9EaHqbFLRd0I78ggU9fs0QkSolm3Y0Zs1eXuFYBlWznUaWpws3iztx4C0
         iMrRr5+T02S9FmVwYgqL17DK0bHATjFsyEK+syGEUx3RX9tnHCdxF8H8RWxa7LPYHYt7
         2sxjuUUG8dcdWsp1VuI3rkZ0NrgV35+Xgim4wpAfnCxcm8YwrI5S00onjQfpNzfrdA6D
         XrgmXRIB4cMnVpX0BxW9qt8u1bKRPTjxnupR/gBHN3DSgEoktDd8LDXndQ/NaZINc2As
         waiWEKJHGw6Y0ts6MfFhNkVfpBiFk6b71kEZqhUUKghi2XSxodfxoik37Lg5Y4/t5hcK
         B1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVfP1yeFR8Uhk8E93sOH6lThMr1GDgOSGXbtoDahAMtn4ZWrAt944EQKPNcjDvg/k9KcaBkKV6m+JWy9OUY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uA1qb4HKbsBuk+p3E3uJLCMjg5FCCG71cuO3/45EapNYQ0y6
	0XlIQ5/4UtNcQQA2U00fw3AyOKbLOwKKAGbp65hpClzHbpP8/RoJs21eZw6auxKtfnm5cdyDoQu
	lne3OslShH1rVsB1gsP+6hHo1LDfBiDWtslt/Iq0baC2v/6rZ+xP5hx33Agg5Snx+xyp7
X-Gm-Gg: ASbGncvw2rYMNFyzip+HyT+qi/kUshJqu/KcZ+JZYzIn18Jpkgzicn6orGBU/eC9yjE
	ZlVa2698xIa0ybWDDOV5cpy9gH2PV1TjyCD9LhCwghjesFUhx5Fax8TKI5qhMGH+EziwxQEc9dr
	8HFsqy1P6KPo88zBSL8CTlKjko/STu53smOVuisLCs85X0heL8CvWopD3ZvR55tsFqTBIKZaa4t
	UxgFPyz6ryRecmeeHt/8lfM+gfoYnsJtHhmZ07Hzq4bejLBWkHAXqp5B3PmjBTY1fcdy8FdWQ7X
	2klZ5XoF9v48QFhA6P2t/4FK5V3bDMG/0FRWuW/pTDMzLD6KJH1SlTQCQEGgxPWvdBlLGMI9gfA
	K6rjxocFxYSTJLXE1gDE4O4RDJ1M=
X-Received: by 2002:a17:90b:4f86:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33bcf91484bmr3018986a91.27.1760684144356;
        Thu, 16 Oct 2025 23:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrVqE4VqHRm9X5wx6ye+bJw2WGJ/5rkO3f3lcbWBpW0rM4dLNgJ4WrcSqwVApIqA9T7TXt5A==
X-Received: by 2002:a17:90b:4f86:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33bcf91484bmr3018954a91.27.1760684143928;
        Thu, 16 Oct 2025 23:55:43 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b9af2asm4949701a12.28.2025.10.16.23.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:55:42 -0700 (PDT)
Message-ID: <c4c907cd-ac5b-4ddc-96d4-aee840d98692@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 12:25:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das
 <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iOmTeNXzmEY3GBFafEArQ9SeZoMoyWXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX8Oan/WIpsWlE
 xFMss7zt8tQvuycEp8zEdUva+efwsodJXVsuozwcSzOCB9QM0zRfOFSlYV6kJ6LS6v31dnx8KD6
 lhW3TVwg2X9T4BSsGT+aITSu8pRNd3SNkIWGXS7ihTWcrTYy5uwAGWFdDEO6nuX5rScxwuxzSOH
 Fkz82zn/r6DRoMJsJR6NMECxE/HLUli0g16BdM7Efg9jKjXS0Rms0vWBqizfZKeTCulhzJpe5r1
 ZzBYsLR/FSnFZSefD/FHBPImK4ER2Upb5TP/RNbNFDax3uv0e7dtITosQU4rN4UAqvbwisFjtLT
 Oy/us3N3ojjg2QeIM4qQZyxL1VASzPN+NMb3uy+j7F3dCwg/G1ekQx7Fb//S7SfnR1SAw7RtsAU
 cf0fh7CDUScbQMJtp97ILChdVPpnLg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f1e871 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dklrOZhk_xOpRdAJBjUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: iOmTeNXzmEY3GBFafEArQ9SeZoMoyWXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022



On 10/17/2025 11:26 AM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:49, Taniya Das wrote:
>>
>>
>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 07:16, Taniya Das wrote:
>>>>
>>>>
>>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>>>> The TCSR clock controller is required  during boot to provide the ref
>>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>>>> the UFS driver successfully probe and initialize the device.
>>>>>>
>>>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>>>> system during boot.
>>>>>
>>>>>
>>>>> That's not what I observed. UFS works fine, especially that it is a
>>>>> module, so no, this is not a desired change and explanation is not only
>>>>> insufficient but actually incorrect.
>>>>>
>>>>
>>>> Krzysztof, on Pakala MTP we are observing the below issue and it
>>>> requires the module of tscrcc to be loaded explicitly. This patch also
>>>> aligns to how it is on all other targets.
>>>>
>>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vdd-hba-supply regulator, assuming enabled
>>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vccq2-supply regulator, assuming enabled
>>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>>>> unknown)
>>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>>>
>>>
>>>
>>> I don't and I am testing regularly, so I assume you have incorrect
>>> config. Maybe I have incorrect one (which works), but then commit msg is
>>> incomplete - you must explain the bug and provide proof that this is the
>>> correct fix for it.
>>>
>>
>> We have tried booting up recently and and that is what we observed. The
>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>> is picked from ufs partitions. I will add these fail & success log
>> snippets in the commit text.
> 
> That's not enough. You need to explain why UFS fails. After explaining
> this, I guess bug in UFS would be exposed thus that one should be fixed.
> You just provided band-aid without fixing the real problem.
> 

When the kernel commandline uses is 'root=PARTLABEL=system', the  is a
dependency of the UFS driver on the TCSRCC clockref during bootup and
the TCSRCC made as a module will not provide the clocks unless we
explicitly load the modules. To meet this dependency we need to load
TCSRCC statically and move CONFIG_SM_TCSRCC_8750 from 'm' to 'y.
This will help the UFS partitions to be identified and then the rootfs
to be mounted from the partitions.

> NAK
> 
>>
>> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
>> ....
>> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vdd-hba-supply regulator, assuming enabled
>> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vccq2-supply regulator, assuming enabled
>> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
>> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
> 
> 
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


