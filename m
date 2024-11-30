Return-Path: <linux-arm-msm+bounces-39722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2AC9DF13B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A29C41623A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883A919C57C;
	Sat, 30 Nov 2024 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuQxLG12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F3380
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732977600; cv=none; b=pUOzcWF1Z0Z72uBhEzi4RKOo4SN7tdX3H+KzXVRwIapwylh6uC82a5C39hxi3R7jKyKkqLAZmeZA71gjsBFFenrM+LHSkIytHwP24d+Hfk7VTNvadEOVeuqE1ibsS//z++riwm7DxaojBpx8t6wi/WtIkqIECngdnVJF9lSx448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732977600; c=relaxed/simple;
	bh=7wo6+OwAwawRl2fUWf8Sjtpk/jR6z5MOcsfGNdQvYk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IN8sub4ndRu7o1i9w7KXdui/MoWyTtfr44wJ8zo0A5o7z9+08kjlwwfDhwTR0H13EfNpUKSle7WXVo5qBkWklBAURb2dZI9EQ0+xG7J4G4Y2EnPmVHiWYk6rKjB+VKdi8xl3y2zcL9Pxz9EC9sX9RxKyhWPX+Jf7WsesMjCtlRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuQxLG12; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU2qGg1002179
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEL9pcYOfgLTQITjWY+X3oT7hMHawmthCsfXN2Tn6Jc=; b=IuQxLG12sObDcQd3
	7kd64oHFsZJxbkHnm74JMptW/6jTwZqHUY6gBmAwlwr5cVIG48BpK8vE54ZcWKqY
	YDUICV7w5wZSI9UsvkBeZ1qdoBgVAO/ZJxAddpuR4eqAsfZbN5aPeWOxA5NQx6DL
	GNGNliwkhjGBhWIWd2hj+zqrROCmR7lArXj1d4+VmVwEUqyBSjAR2f9h3CdoO2GL
	XDg0ftNKWlmNPgGMnBZF6x2J0qB6A0PQEadZ3sOHxNc3vRf9L14Cmz8JN9/39Un7
	dGzaG04K7udDwY9e8QrjAu4UikdWsu7jKSN2BrvKCwMO1fw40rCH90n7tKKnN6tE
	mZ6KLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2rw03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:39:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8824c96cdso6389916d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 06:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732977597; x=1733582397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEL9pcYOfgLTQITjWY+X3oT7hMHawmthCsfXN2Tn6Jc=;
        b=EC6Fz1Rxd2UDyd15sH42ZEexbRWx960xeHjIT7y/pMVSZl68xugLHaSBsEf37JhMVs
         C/8DJhgh1LxoY5GfN0pzuGfzQvi7T3FBIpJRHjt+TEB/DQm4IivSl+PIuQC2jIylVrGC
         XE06wg8MveXpsW59dG9j+7HCLMl8OwIgnNIvJ5BZ5NHyJvfnSh8wo/i4snBBURzLYZ1M
         ip3TeGx7qpVMqyqfDiJ38NJI19PICkHidbUvMKScGjG1A/QzQUSO9FIeJA2ubvwQNxpK
         ez5Vkzw4EkI0BhrAIOL/5G2xsGH1LxvTJf+Ncrtdhg7vL0tiJJRJO9uFEBXPO+OM3LNT
         +jog==
X-Forwarded-Encrypted: i=1; AJvYcCUUjdc/FXw/TncooVomKZKXj0X/zQ3u+N9P62zqJ5jQXRYSG5rk7HehBcZPtokTZiwvs5tpjA/xG/cH8s4X@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyA9Ez0uLtP0HXTIBlS8Pe5VgxG1fv4+m+jgUdsNtGidhFIfK
	yCBs8i0Lh4F54CeRDsZlOYfTXSRkaLIQ7y7TI6f5VG/UgHCu+KL0n4eAEWkfsJeaJfEMG/AbSDn
	SV5jsuFiQK8zgRmjskqzPV/Si3cYeBAJlBGezqQH61WAZvdDZ+vtFS2vCggQiHZ0Z
X-Gm-Gg: ASbGncsPtnKuN76tC46IHPkgim+YSmBhFTWJqboDIiTk1Kad3Rc5X4Ln3+195kIUFGh
	vK44ljGGEaWi7SJjV+KPRnASODqEpP/GA76s9wr7Ty/T2eEySbv8Tzo1FWEey0231OHkWo5NPBm
	e6KNWv81sx7zw+N2fujAQZm3KhQpf8qv8/yvhxObTU5dLVZoZujC5pEPYeeO/B5OXal2fow6zRl
	OEgL9JWbAvR//jETTGMGNdvtAb1Uja9G073fZlwao3pokIPpuUsbWeNxGfMUUjd+6OCr1FWx+cY
	gEpN6zgJY+Vlu8qaBp+U8qIxF/hL0u8=
X-Received: by 2002:ac8:5744:0:b0:461:3642:58ab with SMTP id d75a77b69052e-466b355451fmr103068801cf.7.1732977597082;
        Sat, 30 Nov 2024 06:39:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQOG0vLo7hDZ+FO3x1hWCxs6Z3dM5YMOYTOSUdTk4Ker966yT9GnTf5F/6weefhgqs0kAYUw==
X-Received: by 2002:ac8:5744:0:b0:461:3642:58ab with SMTP id d75a77b69052e-466b355451fmr103068581cf.7.1732977596691;
        Sat, 30 Nov 2024 06:39:56 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097dd685csm2869863a12.44.2024.11.30.06.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 06:39:56 -0800 (PST)
Message-ID: <01673652-e1fe-4478-bbeb-f532e3358e8f@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 15:39:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: arm64: dts: qcom: Disable USB U1/U2 entry for QC
 targets
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com
References: <20241107073650.13473-1-quic_kriskura@quicinc.com>
 <f15c4760-b52f-41d8-9dc7-3896879b3ca8@oss.qualcomm.com>
 <1d6bb573-6366-49d1-a921-cb04136627a8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1d6bb573-6366-49d1-a921-cb04136627a8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _ew8hNkZyjXNN_SlsbiYIb6jH-mna-7C
X-Proofpoint-GUID: _ew8hNkZyjXNN_SlsbiYIb6jH-mna-7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=497
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300121

On 10.11.2024 8:15 PM, Krishna Kurapati wrote:
> 
> 
> On 11/9/2024 2:22 AM, Konrad Dybcio wrote:
>> On 7.11.2024 8:36 AM, Krishna Kurapati wrote:
>>> Enabling U1 and U2 power-saving states can lead to stability and
>>> performance issues, particularly for latency-sensitive or high-
>>> throughput applications. These low-power link states are intended
>>> to reduce power consumption by allowing the device to enter partial
>>> low-power modes during idle periods. However, they can sometimes
>>> result in unexpected behavior. Over the years, some of the issues
>>> seen are as follows:
>>>
>>> 1. In device mode of operation, when UVC is active, enabling U1/U2
>>> is sometimes causing packets drops due to delay in entry/exit of
>>> intermittent low power states. These packet drops are often reflected
>>> as Missed Isochronous transfers as the controller was not able to
>>> send the packet in that microframe interval and hence glitches are
>>> seen on the final transmitted video output.
>>>
>>> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
>>> when U1/U2 is enabled. Often when link enters U2, there is a re-
>>> enumeration seen and device is unusable for many use cases.
>>
>> Would be nice to enable it on there too, then ;)
>>
>> Generally per-file commits are preferred to make potential reverts
>> easier down the road
>>
> 
> Hi Konrad,
> 
>  I agree with you. After the SoB and the "---", I added a paragraph mentioning that if this RFC patch looks fine, I will send a series and make this change for all SM and QCS targets.
> 
> Let me know if the above commit text makes sense. Although I don't have all the debug details, I didn't want others in the community face the issues we faced and hence the patch.

lgtm

Konrad

