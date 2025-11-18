Return-Path: <linux-arm-msm+bounces-82332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B6C69FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B70D4F8425
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B026C35A121;
	Tue, 18 Nov 2025 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lkk2EVcC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6G0znGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AEC350A1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475638; cv=none; b=W7L8Q8CwSRDh3+ate4AoVK3bWUuHuKar+MJfBI8U9GrFF8QGYalA+mQy9nuzRpBpj3wKIMQ75ThnUDo0BLcJYdFtwvyn53VKgepVuf4v/YYnuviZMpDzu7eF7h2b1b2ZW08jx48Cg11/ALMNkHbkSNUWDVsGOsaw0mGGQv68KLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475638; c=relaxed/simple;
	bh=yBuZpxbPhwoE9ApiClipPoDt4FBM4qUBQnCUmTKsdIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niwJe6IHA65rYECbJUfdh1C0zBaMztFp0DxISui+VpJZndt/Vybr1I2OPY3jVv5IC8smEv8Q2xK4fCG0uoHXTt2elPa+Ifohi+OxdyoObXfvidhch1taCZrQXvLC7GF1WVEpldg1zjkVvbLWBO0wHqV//ti7lBAfybqGtew5m+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lkk2EVcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6G0znGQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQltG2926659
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ORqv6M4KIpZhohWP0nchjhTLwssM6e06wxIHarVDt4=; b=Lkk2EVcCgQtOcSBm
	43aMYSTc5IqggQVfwComBUoZoR809kWvkt2Izbx/9n7feAhxanv5Vrv4196idMK3
	UhyelbNdRCAsXBGsKHMMwoHFyYbeybZDzHqcEAfzwmzwr/6k4B71rcJxmHntkhWy
	U742vO90IjuxSTWHcL9Bli0XcdmKXJmI+1g5RWxSnoRG8JExKW7dqHkQzHl+mzFj
	kh1y5vDCVwI3jLpyKTL03zbh/41cCyp+EjQ0pLAfkn+BYnPZx+ATPAg9sAWyBDHe
	wI2MYA9qU8zw6kJqRVP6UqsTTw32jib1/+KdgCv58KAYejeijlGciS3bTNCwLPeJ
	nMJTsg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq290k5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:20:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b90740249dso11411753b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763475634; x=1764080434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ORqv6M4KIpZhohWP0nchjhTLwssM6e06wxIHarVDt4=;
        b=b6G0znGQPM/gyg8eLltRZD6WnqwFQYpLaKPsUrjX8eBeL8EJfVmJ1y+Eu5KoIhOm6i
         CwNTKg4b/QJPzCCHKzcaK7bmCnAkYvPChQZJiBrDDxMGrI3AJPL8Xo4uidizeGmY6Ye4
         yY9zMIb2kX6ZcZ3T2zK3uU/8PE8FT8KhjOcM9U5m1r7l+lV/It5jeA1ixIoWDhByAwbt
         NhrvboaPkmozzyMpzRF+/dfmYUbQAzn190Tb/M92GNlgsE0jNf2Twgt8nZu0ySBeBm3f
         JVPKp2ZyPeN23kFFTo85/UX3WrhsAL7TLnVPRMdJSzhtdISau8GbfuOIc6JJZvwrfXTL
         Ce6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475634; x=1764080434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ORqv6M4KIpZhohWP0nchjhTLwssM6e06wxIHarVDt4=;
        b=boW5mlmABE8CcxnW4cezFgXIilJv0ceyTnQkS2DIiy410lg/+EqQQx2xMcdje9kxkl
         sn4vUThHWHFoT9gz6D3bq17q16W1/StpWB+/HKAk/G70G1GuSuhcQ5LL8xYReoy0fi0T
         2ifLWPHSNBg1a4lvB47RC0cecE0/jrYQSUqcKNRXFK/KX/Fwbyg53VGQpakit02peIax
         rJ/0pO1JFclCRK5i2pbYkh6HKrhS0R0+hom87ipztwyPt+tG4Wix1KDxMiMjtBaegegb
         UTUgWT49qjhuupLjaqyftEh+0nreewD9I/QKia/jqVtEcHSB+Kplv+bcr5rdUZWWuWjR
         ezPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLKflMawbGZ7Wyi5m9Rd/Gyb++Wvqavuu2CeX0aaneF3Rf6Ee0dSicjcnrdBYGyvQUCu0cp9Otpo6SQq+6@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQbcaOHtC4CCA9occXiLAM47uO428qLtWWx4WtbHqMknxVKGr
	j8Tvq+094OnXuUsVloEf2M4Hsd2Mwe3cen8PPnjCLXKA/sUW6wSBh1rGMM5cznCd6fNrPwHn/cP
	7HFwDN1WiUEVkhbHH0Eck2d3+PCTVkrC7BE5frEcO5KNpTzoPcA3Y31Y89IFr3NBBlAoe
X-Gm-Gg: ASbGncvbGx4Mni7gTKpjPTTqxnybeO0BHBBocl7NP3um2OYhmLCSqUy2G5TXdcxRveV
	9FObdLU6HMyjFeELEuPvGKNESakOfYRACPwIEObTZvGPb4aw4SXxaBFf9umieC/gfGD0Jo6/AoX
	wd6gIIrUVx4sOcdnzp2ba4DQ5yYxoq7I+TXZm/hbxP8C9pITSYUYDPmCuzCTTOyDrjWhOVKOSqO
	f/SjcCprXAq54wBYtub6xaeSZiC5lYHhM+4QlH6oZAtlV47TO82hmdGPuBNSlQXhh3kJiFbElsZ
	WgwgvpxOawzuKnrcYs0ei7lwnQ6wq8EhUi8fz8BELDV5Zo12M4UoW+4vVJB14jLAAuHmycJ4JJP
	I1w61Bq9YgO8Hq+KzRcCH4wAa6khbBp7S
X-Received: by 2002:a05:6a21:9999:b0:35e:4b35:3669 with SMTP id adf61e73a8af0-35e4b35382cmr12646058637.31.1763475634242;
        Tue, 18 Nov 2025 06:20:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYoHzllakq0T+6BK9IKhCVI+aW2IeP9GCdHUw1sMDeDxu/C7mgoOm/dGvn2O6wnicuyKu3FA==
X-Received: by 2002:a05:6a21:9999:b0:35e:4b35:3669 with SMTP id adf61e73a8af0-35e4b35382cmr12646015637.31.1763475633669;
        Tue, 18 Nov 2025 06:20:33 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db21a0esm15120200a12.8.2025.11.18.06.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:20:33 -0800 (PST)
Message-ID: <b706ecd5-a564-35d7-9a02-8da9cd134b24@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:50:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] reboot-mode: Expose sysfs for registered reboot modes
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
 <CACMJSeuiL5XEZjh8mOSj7tUnR8wEYSJ6FfZA87v8TSu8xM8_JA@mail.gmail.com>
 <8b6ba46d-ab64-dbc5-8f09-e810bdef724e@oss.qualcomm.com>
 <CACMJSesPSt7LM2duVuBOToxL_5e=SQysW4T+hndMu1Ubs5oJwQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSesPSt7LM2duVuBOToxL_5e=SQysW4T+hndMu1Ubs5oJwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c80b3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=llVMLCiusnd1_Z4tx68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: qzbpabjViLJkQb1fl1ehTEg2z-P6qO6v
X-Proofpoint-GUID: qzbpabjViLJkQb1fl1ehTEg2z-P6qO6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNSBTYWx0ZWRfX8kKCN5b3Pdsi
 MKg+DcaP0cvtJJRTJfnhwDDN8CjYNvamnLaN5z4xA9k9EoKSSNw9aEq0iW/g/xHVbD2eiqN0JwW
 8uR+FuOEbacwDEtYyfCPRv1VPZjrdj08lomaacqJDHiFdhIxJx1sD0hokOa7EHrKy5GVW+Dhg8r
 VYqGGsfIXHod5yjbwrlRTPOHiwuXupi4+muF5wQX/XsBVsdfswE7jHsfu+1+K6i1L00D8TrxiN5
 rqzTqLpisSQwDQQXGWUKWoB42vhs/KLDkMloejaq4YMFSwnhgE9Lv1oVE5Lhij9sslldGv++6Pi
 X9MbRspnJulVqXno7SWt/AkLgUyNP2O4zXli7EVW6DE11C9NjAH9VkNsI0p46Msxo6zu6Mq6Aws
 a3hNpggRtCoPA5MuFDuvk6z2VqCYCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180115



On 11/18/2025 3:30 PM, Bartosz Golaszewski wrote:
> On Mon, 17 Nov 2025 at 19:05, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/17/2025 6:33 PM, Bartosz Golaszewski wrote:
>>> On Sun, 16 Nov 2025 at 16:20, Shivendra Pratap
>>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>>
>>>> The reboot-mode framework provides infrastructure for drivers that want
>>>> to implement a userspace reboot command interface. However, there is
>>>> currently no standardized way for userspace to discover the list of
>>>> supported commands at runtime. This series introduces a sysfs interface
>>>> in the reboot-mode framework to expose the list of supported reboot-mode
>>>> commands to userspace. This will enable userspace tools to query
>>>> available reboot modes using the sysfs interface.
>>>>
>>>> Example:
>>>>   cat /sys/class/reboot-mode/<driver-name>/reboot_modes
>>>>
>>>> The series consists of two patches:
>>>>   1. power: reset: reboot-mode: Expose sysfs for registered reboot_modes
>>>>   2. Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
>>>>
>>>> These patches were previously being reviewed as part of “vendor resets
>>>> for PSCI SYSTEM_RESET2”, until v17. Following the suggestions from
>>>> Bjorn, the reboot-mode sysfs patches have been split into a separate
>>>> series here, for focused discussions and better alignment.
>>>>
>>>> Previous discussion on these patches:
>>>> https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-4-46e085bca4cc@oss.qualcomm.com/
>>>>
>>>
>>> When doing a split like this, please keep the versioning going. This
>>> should be v18.
>>
>> Focus of that original series was "Implementing vendor resets for PSCI SYSTEM_RESET2".
>> These two patches have been split out of that series. The original series will
>> still continue to its next version(v18) after addressing all other reviews.
>> So i thought that these two patches can be split out to v1?
>>
> 
> No, they both continue at v18 so that the origin of this smaller
> series is contained.

sure. I will resend this patch as v18, taking care of current comments
as-well.

thanks,
Shivendra

