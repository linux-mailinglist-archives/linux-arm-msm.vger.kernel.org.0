Return-Path: <linux-arm-msm+bounces-52159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5BA6B8A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 11:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74F3A487EBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 10:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A543D21B9E3;
	Fri, 21 Mar 2025 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZvoqN4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5281D9A50
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742552310; cv=none; b=SrFOk3qO9WrQjaCVVe5b3GLwbIk/WylCfqLoPHkSXNZDaeDW2Pa6bfMQUOOwJwds1xcW1qqsfNPcaKlaVpDLy9RhylG6Rp9sb9+L5YbLQ4OEjIPrLXoDRDPpHtu/ovKLYPVqkW/nU3XGi+FKeFxLnp6pr8txmpYx20ppSQxG4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742552310; c=relaxed/simple;
	bh=ROCvRI09Yx2PZxJMMK51fJGVcAZO04Rv8QfyduWmhmc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P0uNrpyNggLrtMqIFFWEbF3CHhWqVgeC+IpI/rmF55qiXc18xfJSmpkfD1mD11kQ/JUcGCRomaHjIfxU5Z08QJgmxnKWUDJe8RUoX/HkLHg09awK0TjrLC5DD62rtG56WnQ5gPbFtiu2dsRELmNv6MHcHycLy1he7dXegKaqh8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZvoqN4b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L8jqS6024427
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eBg7ja8t6Nygd6OTElfc/5vgmOpe0nAEpW8sRRtOJk=; b=SZvoqN4br13tFkgq
	iL88NHnFatTR5+m6SRszUBX2cA69WhbzS42MMDMXDORyPVni6DBp3efkDIEx0kNn
	crfSa9VQZGFTs2PxydrvLe9B7woNpa3wY21hxdTvWLRUEo9khZMzaHQPFL/2X+IP
	F4dgfRpda4SZIvoGM0hCynNzT+j7ecQ4oeB3M4DST+Ag7zwVy9+jxplAeFVX82eR
	TSi5wKaaVTAUkyCkdZzUkTbmPPq40V6QKvHHh24c9Pp49ekrHhwBzF50yMZswDRH
	0RxV/L1eQzByt9a5LUq7kCEtbLJzqus0rYjIDNJEvDgtO3kP50OKQJvsgK4vThck
	WYGtjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngmj8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:18:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2264c423e37so43919255ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 03:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742552307; x=1743157107;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eBg7ja8t6Nygd6OTElfc/5vgmOpe0nAEpW8sRRtOJk=;
        b=YgwgmVioHMDCW7VVO457sQt7Zonz2ZLnpQAdVcGvZy9HQ5Z5NGj30/uqNvbcpx2kAS
         0+gWiQNBI3ybciC79sOS6aXXBSRcW4NAR+r6XORGBKRhzd5+eOjLf+5sHU6IsMDuENOG
         OATWT1lMgrokmqI2hGPYDOQAbfaEuZ/YZZKt959O7E5qWAUnjUMz9HWrt9GowCRNg7PS
         yQ3vJteSVwH6K9aE2D3uQtPGO4SXtvMfIBbA+LOZ8i7L0+zLcorz2znZcr/XkMjvmO8O
         eXttvGNz9dZgVWHuIsXC0A+aVWAFBS9Ef65hYTP5bwWuJ0d5atcOpcNzSEyKREKwy698
         T8tw==
X-Forwarded-Encrypted: i=1; AJvYcCV1aHPJtK6jh+hBwpvrmoneL1P6I2VrnW5pMw80keCUmZNojuJB/UCEW5vXxPu5ro+4mJpq8bIAuZ2Wyn7P@vger.kernel.org
X-Gm-Message-State: AOJu0YxQSHqAz3ZFXv79GAqZG7GEJhuVyB+TaquOj0CIaSl2UEFquTmm
	8XYfXEIs9JkHGPKkU7pnVbhzY8Qxtwzq7VSvgUxFpHvsbPFwVtiVcEsPn7hEe9WSu3iHeD994bq
	ihrh0+GA7YA1zgP+xNrj9qrTdgx2M/QJ/NMO90XGDlgSaVd914+aBDhCz2652Ux4V
X-Gm-Gg: ASbGncuYJ+hu/yHXceLyXP9hzTsyLuM/5X026qodsFD36X5Ruorg3yraUAhUCZaYDJ1
	eoszIUuyVdhGBJC+z/y+82GbD60WBMyZv9yyjTHQLzLBX1FRCkhuVRk9Ava+4sml/hxf5yHpqqJ
	l4J2QHktiRbr9JRSwfbuES2WifKsAnFmJNM1vgr7oirUB7NpU4pr/J6vb73K2KYMZWrw1i7xGDl
	tz1rzlb4U8RqCBGZf/9Su+rFs5O3y3sSXR/dVubayVqh8sX510v2g3xJKK9JZFsi9BGXtI/2Mnv
	/B/daFeVZ4MFlwmtTyvuancn4vgv+SBqxQ5G34y6
X-Received: by 2002:a05:6a00:1885:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-73905623ea3mr4417227b3a.0.1742552306395;
        Fri, 21 Mar 2025 03:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErmX0Cycyi+U1NWkOpEJp0xJt9qFz65i2lHVl9EBv5+u0a3sw/CEkjWmRV1B270fqfN0xDFA==
X-Received: by 2002:a05:6a00:1885:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-73905623ea3mr4417149b3a.0.1742552305596;
        Fri, 21 Mar 2025 03:18:25 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906156e39sm1507114b3a.145.2025.03.21.03.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 03:18:25 -0700 (PDT)
Message-ID: <4ca8776c-3cc7-4266-8248-4a595fa19e7f@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 15:48:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
 <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
 <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
 <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
 <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hnuOsTj_tcFkegoW4uzEakzBBCXh9n5e
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd3cf3 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=3lyftV9mSLQnT4ktp5MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hnuOsTj_tcFkegoW4uzEakzBBCXh9n5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210076



On 3/20/2025 9:27 PM, Ekansh Gupta wrote:
>
> On 3/20/2025 7:45 PM, Dmitry Baryshkov wrote:
>> On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
>>> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
>>>>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>>>>>>> For any remote call to DSP, after sending an invocation message,
>>>>>>> fastRPC driver waits for glink response and during this time the
>>>>>>> CPU can go into low power modes. Adding a polling mode support
>>>>>>> with which fastRPC driver will poll continuously on a memory
>>>>>>> after sending a message to remote subsystem which will eliminate
>>>>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>>>>>>> With this change, DSP always sends a glink response which will
>>>>>>> get ignored if polling mode didn't time out.
>>>>>> Is there a chance to implement actual async I/O protocol with the help
>>>>>> of the poll() call instead of hiding the polling / wait inside the
>>>>>> invoke2?
>>>>> This design is based on the implementation on DSP firmware as of today:
>>>>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
>>>>>
>>>>> Can you please give some reference to the async I/O protocol that you've
>>>>> suggested? I can check if it can be implemented here.
>>>> As with the typical poll() call implementation:
>>>> - write some data using ioctl
>>>> - call poll() / select() to wait for the data to be processed
>>>> - read data using another ioctl
>>>>
>>>> Getting back to your patch. from you commit message it is not clear,
>>>> which SoCs support this feature. Reminding you that we are supporting
>>>> all kinds of platforms, including the ones that are EoLed by Qualcomm.
>>>>
>>>> Next, you wrote that in-driver polling eliminates CPU wakeup and
>>>> scheduling. However this should also increase power consumption. Is
>>>> there any measurable difference in the latencies, granted that you
>>>> already use ioctl() syscall, as such there will be two context switches.
>>>> What is the actual impact?
>>> Hi Dmitry,
>>>
>>> Thank you for your feedback.
>>>
>>> I'm currently reworking this change and adding testing details. Regarding the SoC
>>> support, I'll add all the necessary information.
>> Please make sure that both the kernel and the userspace can handle the
>> 'non-supported' case properly.
> Yes, I will include changes to handle in both userspace and kernel.

I am seeking additional suggestions on handling "non-supported" cases before making the
changes.

Userspace: To enable DSP side polling, a remote call is made as defined in the DSP image.
If this call fails, polling mode will not be enabled from userspace.

Kernel: Since this is a DSP-specific feature, I plan to add a devicetree property, such
as "qcom,polling-supported," under the fastrpc node if the DSP supports polling mode.

Does this approach seem appropriate, or is there a better way to handle this?

Thanks,
Ekansh

>
>>> For now, with in-driver
>>> polling, we are seeing significant performance improvements for calls
>>> with different sized buffers. On polling supporting platform, I've observed an
>>> ~80us improvement in latency. You can find more details in the test
>>> results here: 
>>> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed
>> Does the improvement come from the CPU not goint to idle or from the
>> glink response processing?
> Although both are contributing to performance improvement, the major
> improvement is coming from CPU not going to idle state.
>
> Thanks,
> Ekansh
>
>>> Regarding your concerns about power consumption, while in-driver polling
>>> eliminates CPU wakeup and scheduling, it does increase power consumption.
>>> However, the performance gains seem to outweigh this increase.
>>>
>>> Do you think the poll implementation that you suggested above could provide similar
>>> improvements?
>> No, I agree here. I was more concentrated on userspace polling rather
>> than hw polling.
>>


