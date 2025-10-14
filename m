Return-Path: <linux-arm-msm+bounces-77102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA7EBD7FF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33DBA3B3C48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646E61E3DED;
	Tue, 14 Oct 2025 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3eyfRP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A79923817D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428127; cv=none; b=Vm/qpJSR9ekuYyE3rm8co0hprlYaSYc8ONHz2SlK4AplXNQJ5jlDLkN5ePlBdQVBNToL1skK0hh4vaFV05bzpTpkhgH3ZYdBbf+IfYy8UjEvsTZ1SEO+YnTFHSUYaumuFetZ7FsB+ADN4BU/yhCoQb7Bbt6w/ZEAb+zuU+01c7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428127; c=relaxed/simple;
	bh=VoSngR9UWSTsOviIql85tgVULAwuKLRiG66ZtpmXfwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIrEMhYuieOWWH/IZXDrEO5L18ZVj8yhfDs/MaN0fRDRIJJTPkX3CHyCuGlWBwD9EzA371xOokwxOwo25B6aSrwPmcnyyARnqIReZEQqbTYH3KdOPJ7idx9Lmrrw+sCaZPPwgwrlWOIRjPFSjJXU6ha4nU7/d1vW4lKRvwRnbkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3eyfRP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6R9gH010032
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lgQF7EpyJKKLU5XszH0WS1iI/dWpktDkSnmDk5Sjrk=; b=p3eyfRP4SwqteDia
	EYafs3c0ZdEZqqEv2tOlsKKZoQeLUAa2feNSHgPCGbforTZ6o4jrM4TsRLIxC+Ot
	HJpTLK4ON9SghxTa86ZtdcTXZx0xOupey0Hv22N/V1VZCm5caCWNVLdgf2Rmu5Cn
	pDuq5mE4mnLzxf6Vc8uiogna37n0rIQR/6WGZOHDPXMF2MCYOFC7+L9t8mqmrsQt
	9AN2oWpHTS8V342BzVER8nlLWamnZqKfs+dmJ7ZSw5SVHcVoJs5PpuVoFVBdvjlA
	Wee2hkY7E8d3TyRHnUcBonkyYsMBbfxRB481pus14u49r2OLxS2jE/z3oTcn+dx9
	g9DJfg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt4eb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:48:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-879826c55c8so27735136d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 00:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760428123; x=1761032923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lgQF7EpyJKKLU5XszH0WS1iI/dWpktDkSnmDk5Sjrk=;
        b=OPNaPMmif9o7yz/RvWT1F/MaaZcwWVr0T2ii8NnjiLb4PEeAM5tWQDXx/ErjGGYfIo
         HmHDqmkoAnKQRXqtusp649HmZxBvBqpzfzg3dA1LMb2UnOhi3q1t8gze/0xntP+IFn9I
         arOHgAYoGQDcowHZwZ4qyAVzX1nL9YjAmKg/Q23XFHt2v9rcIGzm4reX7N/CRssl9WuI
         0+mOJHWNgsW0WvY9jtclrh69FmHvBW6C6D6ZOoe6i5nxbJajhJGBVmgYBJncCYAO16A5
         Ma+3L1vvhqKH+4/HJs28WbXTMhAjclcQyUiJODGUR+bRVolwtL7MRV+Dg5jL8M5+rYhD
         8NrA==
X-Forwarded-Encrypted: i=1; AJvYcCWQlLrHV2rqDMMcIk4IlG7i7LhSHG+A/THQ0zcT+2S2078Zf0/U6cE9P3X/MyBh3g3K8o5zUNWrluKQztKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0aMAWQ3TtiVtqHDZmU6NgPF8hUt2+mVELK+SEmqzoPEMesqSk
	eDC9kPbOaHkCMOB0juk9l1fX8AELKntkR0aVRlCH9pUUzsM8YLITic7Lhnh5MIO+mgPVR4KhAwB
	uMWtiVFaBtkYIMpyA4gVBb/i2+aJGzuZLyKaXMseStcBy2SzyjqqpREChTdu1kKr6LQzi
X-Gm-Gg: ASbGncvhId+a2bdr7pKhD7EzMnHz0Xzdnc681Ii9enXheS0TDNcXS8nYPAnAvHnUADu
	6vkz5fimbXTO6y9kfCsqTq1HAftR5fCPzhSOCyIcosDwVq4E7sqwHG78Bm635kUk2eYSKsZxE13
	3AmdfqE8h2O9hN7+wViibOb6cZE70sQAtFisfdb81gwd+0LcnL1pHkpmzfmMTFHp826y7hONHw2
	K+RcL5JRWTpYx/H4sAFRswFNRujtLpFnUuaqaGt5kKiaSOCukB76lPyFLoDOBPa9WQMYbLpEVDm
	E0JlwKPXI++GgDVi3T/qFzNT4PyDqXzS2HRhLfeM2SY4ASPkS/dJZ2r/wHmPvNX28NS1Tzl5DiA
	qw3U4yaxyaJ3gVho51azE4w==
X-Received: by 2002:a05:6214:1044:b0:87b:b675:c079 with SMTP id 6a1803df08f44-87bb675c186mr138835356d6.3.1760428123418;
        Tue, 14 Oct 2025 00:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK/9FgHc+mDtU/vg1IM2MbqJ1IQXUDO73G3f7pDCJd158k+UkhB0NXrUrd+oKqvAQezTg7YA==
X-Received: by 2002:a05:6214:1044:b0:87b:b675:c079 with SMTP id 6a1803df08f44-87bb675c186mr138835176d6.3.1760428122944;
        Tue, 14 Oct 2025 00:48:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1de3esm10425328a12.18.2025.10.14.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 00:48:42 -0700 (PDT)
Message-ID: <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
 <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0wtMcSCqguUMTvVxArjFwRlY5yAxUkZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXwBgLw0/XMQD4
 4nYetLvSH4z8FQxehoCYBFGpRBegaLa48VPM2VJ3boitj0LU74Uj50gVH4FRvTZeesNRGZgoBsy
 QQ//lZZTDe06ysfB5c6oBfi33DYZglxYfFXbXXmxHJ0lSkfY9lC1eda7rG63LC8xeaM9/7YQxtX
 fo/wKSM10fVMXfJuqqXKJ/ifxvTyXu9fTm9XBpk/Jj4H5cm41+OTBmisIQ3pQNCFODymm5+Thsd
 w8bNlVR7lvBpF8gc9g+gPsZsHJCQRxCU5vBFdtUpef9vtS42YzjJ+i8abXs5vMgHjUdu+jA7963
 tWbkYIo5FMj6Q0l9QpCYWiqSWGD20cM0MSvfRofxbXYwRE8fBqt9EZpDr+CT2KouJwXw7+7Hq1n
 53M40VvVxY9L469X3zvE2ylmMpigHQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee005c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UH78s4YSuxq7AQNSmZkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 0wtMcSCqguUMTvVxArjFwRlY5yAxUkZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/14/25 1:47 AM, Carl Vanderlip wrote:
> On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
>> On 10/8/25 12:15 AM, Youssef Samir wrote:
>>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>
>>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>>
>>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>> ---
>>>  drivers/accel/qaic/sahara.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>>> index 3ebcc1f7ff58..04e8acb94c04 100644
>>> --- a/drivers/accel/qaic/sahara.c
>>> +++ b/drivers/accel/qaic/sahara.c
>>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>>  	[23] = "qcom/aic200/aop.mbn",
>>>  	[32] = "qcom/aic200/tz.mbn",
>>>  	[33] = "qcom/aic200/hypvm.mbn",
>>> +	[38] = "qcom/aic200/xbl_config.elf",
>>
>> This is the third oneliner extending this array you sent within 24h,
>> please get the list of required files and update this list once and
>> for good
>>
>> Konrad
> 
> I wish it was that easy during bring-up.
> 
> These patches are being upstreamed from our internal branch and thus
> reflect the different latencies across the sub-teams to that request.

That's upstream-first-first ;)

I would assume there's a single list of files that get loaded, perhaps
within the device programmer image.. Unless you're altering that on the
fly as well?

Konrad


