Return-Path: <linux-arm-msm+bounces-77693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02872BE6DAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2909F3A1810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 06:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEF030F818;
	Fri, 17 Oct 2025 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVIMjl32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624C217659
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760684263; cv=none; b=YvIHVFIoymw+FIDoyL5zdNXscQlN7DG8g9pmA0g3ZKkrZN2isWM5ZKQDjeTbEaE+zPGqY29e7xNZF4PVXMgxfzFGJP5hC07OwzITQUU3yMybBaiPn0/uOcfYR5mPDnK/xs0PeSCjtM8FA1qj4EvP7H0CxwHQavCVOzF0YJbRQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760684263; c=relaxed/simple;
	bh=SZb2me32TYvpJvZO7svSniyUm2EnB8l4Ay87foWrHBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzENgw68snsiwyKGJtAVWnZMshtyx+TJ+IKX0BguEIdukZSJAGIcWN42/R2n56RarNwx+o/oCpRhE5eaNweewrVBp9cklkjpsd3SVQng6NZzUKIYZAfzS8njC7WHm/kvnYUrocG6QTP9+MRKpExG271WiEKFID9QCCPYDck2eII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVIMjl32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLrrC029768
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWnjRT+iol/D3VOcuiKVyQ2qPF47KUnKgJ6RaZdkVLA=; b=RVIMjl32fN7QhdUg
	3An/rCuH9Ka8MihEghHkKvYZsk7tIkOTRcR3Q1UkavpqBnWYaNvDKZnx/O81vGY3
	9rjh67Ag72MuBqk2IsrKbKKncjB2PIrIXVLQSwh1YC6ccvqM/Py1FU3Eix2G5PFk
	B7oOmGm4C6Xa/Vgd+GI7pNlgKdrVUYfkTUdnSfhzCIGN2BQihWi+QrfYsNcdNq+E
	rYCd9VQrlSDZOPZ89+siBc78i2vVF9J2ZV5h7B7Tv7tehiUZsXLdrqhqv8JZ0EIn
	Q8WTEUNW0Xq3y8G7D7bvxRWDgqn55YORhvbcDt1KdC03+3f8Vtg9HoOTZtEnmRUH
	+A8Cyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0tujn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:57:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f914b5a4so1753867b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760684260; x=1761289060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWnjRT+iol/D3VOcuiKVyQ2qPF47KUnKgJ6RaZdkVLA=;
        b=MOClalKznOgWo76K1oxODGcgr68/uk86eDDg2y6nR6B9GZDiJ/lYDpQeSZts0Qpf+G
         vxpRM82zrVKOUynxKBPSHtDu/7irexs5AdVdNp3+c2eMa0v1BTc/L+jJuNwoyWqLFI9y
         Jvm8P8B1QH8vAFeVhdQ/fJfmLPqsxcG5x/64rWCh14hLUJNaCTsZxIfBK+zSSCytc7jr
         ZD+6yFl5UabLMhHaF9SljB77WEWAyeRvAfeV1VhdhcgJ/p6AEPeZuda9nuL54Iggtjyy
         9W9hrAgdV3vrHw8HMIr0Ud1ZVkMOClo4hsqigaaMQ6HU/XvxZstkbecwW64cib08itJc
         azVg==
X-Forwarded-Encrypted: i=1; AJvYcCXuTZqoMloWiHTiOMcylUoFPhG9oDEfoNftBUgyRyik6YoLbzUn4Wb3c8mSK41XozMPZUicA3nevH7lngPi@vger.kernel.org
X-Gm-Message-State: AOJu0YyoSChcCM7VvnFmrF9bqtpgB2p5W3iKJ1a3jJCjJn1/c7gOLSE9
	0OwTXJ+dKeju5U5exAHRF+Kq/SC2VWPn1dn8jKvByk/NOswGz/HWIE7LiRhCT/WAVJGpffHY98b
	E9xxb7aFpP5oYyACL9j1PVWFPWu3rwA7te3Rj2G5JT0uoVhzKkjOcKtcHj8CN+1YevPxa
X-Gm-Gg: ASbGncscChkbXycjC+oFb1Rs9SqMctQeGaqob5RrTIKefmtMQFY3MA26U6JESCCWU5p
	YmLezK/4WckWAXnjzZcVZEG4nR8r3UtIfJeI7ORPReyclmag7pj5eo5vffN0IXTr3EzEMBws7ER
	Fm0T0WkhpyXRPdrd2Jo/gg5N8XI2g9sa8hqNXiimlKdD90OT6mnL7OddxgSJczTyH13+YFXfgrt
	9khhE8NezpGiDZ8/ziqs4UfL6UL5CZnvh7fUR51gUo4tqMsRZU6jRq3CuCx/0k7Upy/NvfXYpAX
	WlubTiHJV3n938TueTHzRLf4IiHctxZFDeiEDFDAK4HdLGiU7n5R4cktlYTx5Okvr4ySP/fDZz6
	Dhsusuq5tLDuAaBgDmuRK+flXgIg=
X-Received: by 2002:a05:6a20:914b:b0:311:99:7524 with SMTP id adf61e73a8af0-334a8536f96mr3755769637.18.1760684260314;
        Thu, 16 Oct 2025 23:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqZWftpaAFpTBdRv+zzFXHHnBlGjVD9evMbr1rJgR4khpMxNQmHGfZ19i7eqiMZFahnCVBKw==
X-Received: by 2002:a05:6a20:914b:b0:311:99:7524 with SMTP id adf61e73a8af0-334a8536f96mr3755737637.18.1760684259880;
        Thu, 16 Oct 2025 23:57:39 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb66a216bsm4371114a91.13.2025.10.16.23.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:57:39 -0700 (PDT)
Message-ID: <f07fa7fe-b89d-4d1c-9ac8-be5ecbf1ded0@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 12:27:35 +0530
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
 <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f1e8e5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ek7cbK586cxQBMxakbwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: uMH3-Q-_WilFwxeTHawQHIIBzCbSynm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfX7zcd8tY3zQrr
 tY/eCKUG979l+QQJQdaGIYyipLgDV2tM+FpHv2aVq3Y5RWjT/XtAQXxmT47LW2yUYUn3zW9GenL
 mSoOQKyTa4bkhzfYExZBUP0DwAZiAJgbSbtUTb9fW8ZfQUrQxCBoCikdkqlMrXWWATgbNpd4gd9
 Jp9bTNe7c36KHnHIV8OXrsH9VszLHqarBAAHXS1dWeA5w/MherOoFaA4yLWytH/pCV/pITuVi+4
 GRtbSAhTs+4RqDCQ2cUogKyU8kWmQ2vTfV1gj0E07R7rkjEtHjZ1IMLkzTB0kzpzUs7l/agCmTz
 Damd6vtY+Ext4T6QkLoZTl1rORP19hx6Wom1KTf0nwXThQVd9gxCmLSIp5FiBqwx63pyq9/a7xQ
 Ey+5VSHf7BnHu0LOK8vkkbg+VKOW8g==
X-Proofpoint-ORIG-GUID: uMH3-Q-_WilFwxeTHawQHIIBzCbSynm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099



On 10/17/2025 12:24 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:56, Krzysztof Kozlowski wrote:
>> On 17/10/2025 07:49, Taniya Das wrote:
>>>
>>>
>>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>>> On 17/10/2025 07:16, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>>>>> The TCSR clock controller is required  during boot to provide the ref
>>>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>>>>> the UFS driver successfully probe and initialize the device.
>>>>>>>
>>>>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>>>>> system during boot.
>>>>>>
>>>>>>
>>>>>> That's not what I observed. UFS works fine, especially that it is a
>>>>>> module, so no, this is not a desired change and explanation is not only
>>>>>> insufficient but actually incorrect.
>>>>>>
>>>>>
>>>>> Krzysztof, on Pakala MTP we are observing the below issue and it
>>>>> requires the module of tscrcc to be loaded explicitly. This patch also
>>>>> aligns to how it is on all other targets.
>>>>>
>>>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>>>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>>>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>>> find vdd-hba-supply regulator, assuming enabled
>>>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>>> find vccq2-supply regulator, assuming enabled
>>>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>>>>> unknown)
>>>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>>>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>>>>
>>>>
>>>>
>>>> I don't and I am testing regularly, so I assume you have incorrect
>>>> config. Maybe I have incorrect one (which works), but then commit msg is
>>>> incomplete - you must explain the bug and provide proof that this is the
>>>> correct fix for it.
>>>>
>>>
>>> We have tried booting up recently and and that is what we observed. The
>>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>>> is picked from ufs partitions. I will add these fail & success log
>>> snippets in the commit text.
>>
>> That's not enough. You need to explain why UFS fails. After explaining
>> this, I guess bug in UFS would be exposed thus that one should be fixed.
>> You just provided band-aid without fixing the real problem.
>>
>> NAK
> 
> 
> ... and to prove your analysis is wrong (because your setup is likely
> having issues) I even tested now linux next with defconfig. Works all
> fine on next-20251013. You did not share which kernel even has this
> issue, maybe some downstream tree?
> 

I have added how the commandline looks like for the test. Are you using
using the ramdisk as your rootfs?

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


