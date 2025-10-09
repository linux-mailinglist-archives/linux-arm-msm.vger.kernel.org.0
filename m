Return-Path: <linux-arm-msm+bounces-76527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7FBC7443
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 05:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B9024EFA49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 03:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27C0215055;
	Thu,  9 Oct 2025 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND241/W6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5D212F98
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759979144; cv=none; b=W+gOaPxbUbvM9bAzL32iWTw4xroaswWW7yrciqPQiBVqeUad19Ttqd+voyDJKGgv4fBR0oz+HjapJNjGDjjNZg8fq3Dkq+O8umweWbpQmgNkogWcyRNIuGsqlutj0XETRBoy6MFkZEjEZkd2O7hK9Qi43KRRvDPNgJNwzJ+89vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759979144; c=relaxed/simple;
	bh=adDtwrABqJItP/LyGiv+12nt0zW4ItDbkMVAAXVZyZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pne+bTtfrieVQW9QiIZuQBsLcf+7ozxGaOkuRhP40xi08+DXHX8VPIOcXcmUkzrhijqlRHInljNFsb5Mc57k7isQRj2EvCeVzWp+QT78g3ZqggFuX7CZMVbcf+XrN2c9yEHO74r2/3FF06oY0yoNgsOcdKMq7peMVWoVttqCfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ND241/W6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IRm004508
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 03:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maw0nAtOoBVHhqJ9ExerU0/ECtcBryU6vpXt6hYX7LY=; b=ND241/W6roZpTLMY
	8lUSgg8HBk+LobuHZI6DurU0YtpM1lVcdu49kvkvHfia6vg8KMA8LTNv3d3fLoPv
	aPzhoQTGWwc48lgdBV8VZdRWVP7PV9IAXi4Sis6ZiHTejJG/NeQRhTOz9AL1aQ3O
	VupH+Bq11JzqA/S/qA7U6ibACD0C7zXGqjrDNT+2JZH8SeAHUoZoKmFtznMRFeQV
	Mdl95/Z6iEk/6mIGhBvYshkpFOJq2xEZh3TOyWpFiWxj50RQDZZoO82QHiQ7kRj7
	pVKCNC5sVxd/HpRbB3TuKdunx8/LE7v9Gng5KMFxvZpnMwOjpWskaXCg6VHdYJiv
	KTmPdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ks8hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:05:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269a2b255aaso13765465ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 20:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759979141; x=1760583941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maw0nAtOoBVHhqJ9ExerU0/ECtcBryU6vpXt6hYX7LY=;
        b=j/TgxaYUF99jaZDSr8uVeSSE/S6P6YNoRfRtQRAvK7MK9mgFkglx5IZu5UBg+z2Nbh
         Ov5f1eB83aO5z2R077gQDvz78Whdjc97iZgsijXL9zp6PgBw88RVaAC0scq4uIysh2Db
         OJqix/h/OiX8f5onrYh0KuyudQLyKHnarXpJyII7Z4CiKVNvKn28fmDBNVN8LNUtTcSJ
         fiTyh7Tv0C7vUG5LD4c4Zp3q0gW5ttn9mEQjSsxOHG5VVto//vVOfrcg7pN1bcIlfgSV
         VCggUIACA3wo2Znw5YbDQJzLMjrhe2NQWncUtoUExfeEuLdo02jPQp/YAUHwkoGoZlSC
         a9yg==
X-Forwarded-Encrypted: i=1; AJvYcCVmqlWfnIjQs0W4BkFh24vAcPO/wZe40X+H06bYTzCwEy85yN02vZ4Qoe+RqiqCgbgh+NlJj3GhK8YVn65W@vger.kernel.org
X-Gm-Message-State: AOJu0YwPc5+s7ZoVIA5DMbQXOZK26Ve6A8ztEFWAIYttUDH4cMQUD+/U
	8dE6zJ/Do3oS9egZTlPby5wGWpmQMkhMYr7voskVQ8TCnM34t8w1VXt7MA3ceR/ZYSe4GxaW+1x
	hhUlvSoAOL7xeuJ5yV0h3DJCLwyGs/tlPLbRQlvDA1bWFwR3yChrms/hPrg8tfKm/OTn+
X-Gm-Gg: ASbGncseCYW46UHKY9lhkAdCEvDa5bCD9HeTxvX+A/4c/NIOAtAY43Cp/KUjqZ6E/4V
	ZoeMUp6Gk58L+8nK5Fszd4lou7DGAxjDWW5ikHUycsyrMD3fib3DFv68+iVBvo9y9b0ZrJf8k5d
	zcOS2ycOjzKUW08S4dg5ATC4pNyrVLW6Zt5SHCtUVD72TjcaCmvxamsHUpIrozQ7hCTlzW0jruP
	AwD2G0aN22YJbMz2qpftZYCxHz5r1jN1nX44yBOuNuJ/imY7QNBUnOvQqdmq13JTj4JvSlw6OwB
	D1n/5x6oq3s3II5CevH5NzI6IGEaMERrZjLMlBtPB4XQMaKMTu+jodVXKVFo7j4u/ok7ZI0sh9p
	sxkID
X-Received: by 2002:a17:903:37c3:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290273ee214mr75265145ad.30.1759979141293;
        Wed, 08 Oct 2025 20:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnBY9dBUVR4JO7ffBEWJAcyiS5SqEqUqPfk7J2CB3UN/A0lC50/P3L8vjezocgdBSm41IWow==
X-Received: by 2002:a17:903:37c3:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290273ee214mr75264785ad.30.1759979140837;
        Wed, 08 Oct 2025 20:05:40 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c04sm11854475ad.110.2025.10.08.20.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 20:05:39 -0700 (PDT)
Message-ID: <1151394a-5f76-5ba8-bd5b-0635a9a57be6@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 08:35:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        saravanak@google.com, conor+dt@kernel.org, mchehab@kernel.org,
        bod@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
        dikshita.agarwal@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX87jNwfGHoxdv
 BtlYN5WKNL+lA8qzjgiLDx30d9MWGKwVs4ILsrFuEDZ3nmiDo7XRQphj1ZrzxOgeL1o4F9XGdzv
 lYWGcQPAvOfXjy98jI/Jj+82LdEplshmDFZVVv7HrsP1GVwLgwKxsPnNcxF5j6vo79+Rxpt7G8G
 hajt0R1xp8H5F/HZYfoaVL+uP/r9npWyr+rL72EQneR5J8696oss6+AdZ2Y2uAJIBA5MnEiUTU4
 9w5pGeInKtFLKPG0X4Gcof0FCFSHFtQqp//FccLN722mevyL/C7HZFf06iB1qHmzE3D71H1jIdn
 XRu82u0zqS5ge+C/0qToVYVPsfaAh2c73NH84Vj4ipzULqEG3p+JBkYuyGM2qloP6GUqCLkjnDL
 Uq+33kdN95ATjDqX0uJ8VUtHOjaIsQ==
X-Proofpoint-GUID: mHKqs9vaclMBg6xuXu5w103DcQQxkb4d
X-Proofpoint-ORIG-GUID: mHKqs9vaclMBg6xuXu5w103DcQQxkb4d
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e72686 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5kJkhVZBw43gkfrlxLPpYw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=sGZhk1M-rbKiZVnir_gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 9/29/2025 1:53 AM, Rob Herring wrote:
> On Sun, Sep 28, 2025 at 12:17 PM Charan Teja Kalla
> <charan.kalla@oss.qualcomm.com> wrote:
>>
>> This series introduces a new iommu property called iommu-map-masked(may
>> be there is a better name), which is used to represent the IOMMU
>> specifier pairs for each function of a __multi-functional platform
>> device__, where each function can emit unique master id(s) that can be
>> associated with individual translation context.
>>
>> Currently, the iommu configuration - at least for arm architecture-
>> requires all the functions of a platform device will be represented
>> under single dt node thus endup in using only a single translation
>> context.
>>
>> A simple solution to associate individual translation context for each
>> function of a device can be through creating per function child nodes in
>> the device tree, but dt is only to just represent the soc layout to
>> linux kernel.
>>
>> Supporting such cases requires a new iommu property called,
>> iommu-map-masked(taking cue from iommu-map for pci devices) and syntax
>> is:
>>    iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
>>                       <FUNCTION_ID2 &iommu ID2 MASK2>;
>> NOTE: As an RFC, it is considered that this property always expects 4
>> cells.
>>
>> During the probe phase of the driver for a multi-functional device
>> behind an IOMMU, a child device is instantiated for each FUNCTION_ID.
>> The call to of_dma_configure_id() on each child sets up the IOMMU
>> configuration, ensuring that each function of the device is associated
>> with a distinct translation context.
>>
>> This property can also be used in association with 'iommus=' when dt
>> bindings requires the presence of 'iommus=', example[2]. For these
>> cases, representation will be(on arm64):
>>    iommus = <&iommu sid mask>; //for default function.
>>    iommu-map-masked = <FUNCTION_ID &iommu sid mask>;//additional
>> function.
> 
> Where does the FUNCTION_ID value come from?
> 
> Why can't you just have multiple "iommus" entries where the index
> defines the default and any FUNCTION_ID entries? What's in each index
> is specific to the device.

Are you trying to suggest something like this [1] ? I am not sure, if extending
the iommus would get us "unique" devices where those SIDs (from different
function_id) can be associated with respective device. AFAIU, existing iommus
entries associates all of them in same device.

[1]
https://lore.kernel.org/linux-media/9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org/

Regards,
Vikash
> 
> Rob

