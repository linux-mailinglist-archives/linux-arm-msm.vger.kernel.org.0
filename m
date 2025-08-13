Return-Path: <linux-arm-msm+bounces-68897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4AB241E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06F21B61D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 06:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701A22D6605;
	Wed, 13 Aug 2025 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIhgwH/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD522D63E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067779; cv=none; b=aNZO/3mTPic0Huut5Af5wZz2ysXTkHfa4N4UCkg+AZ7FI5QES4Z5nogOJ88F+7Gm9aMp6TbwvG9poRfJku2exQW3wb+rp7gzmVOllQJhQ8uag8wpSkjALJ8kmCXK4DbhQQJyOvxkvucAWqBFcPK8cWgkf+DOedc31TcbV7Mq1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067779; c=relaxed/simple;
	bh=qyRQ1ln1JbMp75hJ0kDu7mG5tuW+40UemEalqrMf0ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZxPUD0laaBXT9RPCK5RuyhquhBQwT865kmXSH2Ca2iZFUyWYWTi1YUUXp6jZcqiOyfv6U/Bi/KhKj3oJ3N1+0VLY/0A7Xb81uzwPV8V1nxXBniFQ0W2z2MJlkcFk/IAXo5ZZGqbW7VMri+65Rsj+qxKSfWcvqPlSdlkWIhEEqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIhgwH/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mLaj015759
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HR9/XxlfJFSa5gaZ2/cVDFyshE0iTajAntKn4VZZZrQ=; b=SIhgwH/V4QenCM4C
	xkBnXsx5YwItCzp4+3qOIaosjjx5m5HxecLBrZkkJ1sms73AuEnejMljT6Yaz7Hz
	Jffl9h4V0In5Hw+OlEW3RiViJB4NDSYnE2Zdx7zOvOkOFnING5ZxHkNipJw2EE48
	VcFqHqekYQ5UmaTY2jFZf6DWazmFkkqx1d3NUdUsalfPqAbno8lzY4v9I65AqVA1
	dWAQVsQLg6QtDV+6pvSnyjBEJk5XVg5dy/NCIuhGVVvot6HHGAajLzkgN/vq8lpG
	f7pztSiJ4gs1HDfMHY6FBdme3PCFfNyqqzOThu5lCkfixN2BGNJph9CsUbDdXkf8
	F3DKUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbdy8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:49:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2403e4c82dbso51495265ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 23:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067775; x=1755672575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HR9/XxlfJFSa5gaZ2/cVDFyshE0iTajAntKn4VZZZrQ=;
        b=Ty/Rb0PYY5qptN5OMo5gMmcmLrcY/gL8eHL87vYrHVJnE/blR/qe9eX3n5+rXbVNDG
         TYsH0htD22UHyftBGm7mdXnEqCDwYHmqb8USnx2+LE2WbOjanS8dhn0pihBvCNWGlaqC
         qy4mtP3K71VyIc+9ssedhtS00XCNo1gHkFx+RJpwJwRe0ltuEaX/2VEdjb8jrqZn82Iw
         tXPeHYqGCbSdAzoE4zC2KNGaaJrBrxc7t36mLWshe1Ia0UMa0zkrEFuUrJwIwNAV6Qoh
         p8ymfkwDDSGmAPEBdbWXxOok1WPnshXSIs6NPByvoxku5JFn7tK/PhV1hHDr+iArZRWZ
         RZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX/R9T3S0jK917IdGO2I5oYKOnKv/nm5BZV9Cq6TSHl0+nOBFPwgkYQ64S1YDyM/udIXXccE3b3n4qO68J@vger.kernel.org
X-Gm-Message-State: AOJu0YwJID0TZ2fhzFfLpAAxQOgeoTdtFzB8pAcHtqjo0650NZ8nvYvx
	Ppulsi3oMX4tNlYNqig6oO100V7VAuDxjOsU5trY5stpisL7DYH37TbB+BwVaYk2PcmtsVfc+Vz
	3gMQlma8Na2B+FxPhuCgBBqrCW6g1g074qTBZqMXD207uU7ORXyxSJ6GVovzVD9O9BIje
X-Gm-Gg: ASbGnct//HWJFXC3RVYLn3dMs6Qf3mbPMoGZNePr6jNLCC/1XkcrBEEs2fdxge+1d89
	mrFfQCOc2+E/ncKU2niD1J3m6T+Qap7QXo0tYaI98h6lAko6NxIABH5BgBEH5CrDON0nYUNeJes
	Z5uJbhUTYkUSXzGBSkgkLhwSi09qWPNMsR/aV4f82WMpuJfJyVomjFUQtHL5uqvt6v6sqO0+95U
	uslm4M4ohkNu7IoCjJ8bjXBI97VXBrV90R7r808a7EHeopUMHpYuXOdS68CLvWfZWRANFDxifkr
	hjeQnzv3jfMCtg+xP2P6/lh93EOTtyyidkH8kAiRh8eg34CZ/72ASbiIVSwlOKoSlS1uhss=
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id d9443c01a7336-2430d0dc1c7mr30707465ad.3.1755067775107;
        Tue, 12 Aug 2025 23:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIOmylEZgOC3s9pxN/xlV3S8avBhHKj9sbZhpAlOD8ga+zYpIHqDLQaDRG92qcXGtFmX4+6Q==
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id d9443c01a7336-2430d0dc1c7mr30707175ad.3.1755067774613;
        Tue, 12 Aug 2025 23:49:34 -0700 (PDT)
Received: from [10.92.180.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24300f8ca2asm33500375ad.141.2025.08.12.23.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:49:34 -0700 (PDT)
Message-ID: <38a8afb8-01f9-46a8-ac87-be1e4ab53136@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:19:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
 <CAL411-qmWLJ9vYTc+NHFYymsJ27ryge88nTc71NAnzDa7TrExg@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <CAL411-qmWLJ9vYTc+NHFYymsJ27ryge88nTc71NAnzDa7TrExg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c3580 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iitwNcAuny6OrRLJqDIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXyUC+n1mWTJA2
 BF9bW7OjKmvX6PLEZ7nUtwtp4G9UFT2rujl6f3vJ4BopuDNu2n0UQIlTEQdc0IxQFhzcA8uXHgl
 22WRLU0KQ5j79Pjb8BADPRipxsvkKlnIiU9gETRwzOOpUYzVpCAzbu+WdcOdQ/ylUxNv95YX7fj
 vkqj9nQ9Fntw82J6WMWkDQbLC8pOodpQj2ZsHNFFk8P9gQCBotvM3zGYWkKmFc1Vwp6PHW12xfT
 IvZBkyUDJPA9RIvBlVLzmLZjp9PZm/zNs5K5zblFAZmeE5dtOJvLxMAXyR4NzsRmCZffOnuL5Nl
 MSmqN57P0GRuatzb0tpoIRDOdVn5MC3DsFIDNpYYz7FJV+iSCo8xMrYE1+O8C4WRZiMJ8Lnhrmp
 5qQZsoCl
X-Proofpoint-ORIG-GUID: GkaEc7NHhtV5Z5bgSeVjOrZ5mk2L-6Gu
X-Proofpoint-GUID: GkaEc7NHhtV5Z5bgSeVjOrZ5mk2L-6Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 8/13/2025 11:46 AM, Peter Chen wrote:
> On Tue, Aug 12, 2025 at 1:58 PM Krishna Kurapati
> <krishna.kurapati@oss.qualcomm.com> wrote:
>>
>> Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
>> when in host mode, it is intended that the controller goes to suspend
>> state to save power and wait for interrupts from connected peripheral
>> to wake it up. This is particularly used in cases where a HID or Audio
>> device is connected. In such scenarios, the usb controller can enter
>> auto suspend and resume action after getting interrupts from the
>> connected device.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/host/xhci-plat.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index 5eb51797de32..dd57ffedcaa2 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>>                  return ret;
>>
>>          pm_runtime_set_active(&pdev->dev);
>> +       pm_runtime_use_autosuspend(&pdev->dev);
>>          pm_runtime_enable(&pdev->dev);
>>          pm_runtime_get_noresume(&pdev->dev);
>>
> 
> There is an xhci quirk XHCI_DEFAULT_PM_RUNTIME_ALLOW for it, try to use it.
> 

Hi Peter,

I see it being used only in xhci-pci.c.

In xhci-plat, I intended to only allow usage of autosuspend and let 
userspace decide whether to use it or not (echo (auto or on) > control).

Hence I only did use_autosuspend() instead of doing runtime_allow.

Regards,
Krishna,

