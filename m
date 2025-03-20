Return-Path: <linux-arm-msm+bounces-52100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671DBA6AA70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 16:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D2A61899EB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 15:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74A51EDA18;
	Thu, 20 Mar 2025 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NthndX+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A201DF980
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742486281; cv=none; b=O8LYAQ0aLZ7Hdx/OBE6BUsMN/uTflaf4RDwpijQWhDVhhleKqTBiNw/aeZjKfGnf+ljjx0IrMFAs9MUafYKGbRNO2k8Fyt4I9FU0DXRFI0Qbge0COVoPNHwHj5UHD1DK3pKwwxC7saQi/jZW/VNMpqMc294rkDzSMIWyvAySoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742486281; c=relaxed/simple;
	bh=1HG1R5pgnE3jTOBFHjrcrx5hNP55t9mVMYMylghCRyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgfhLI+BYng0hZ0dt8jEQVPGJvI2Pp1HC+wLHDEnxR8vjkclVY2yx2t2A+ObrmksVJQZdElDviWZzJ5DaJvb0o+5swm3A3bg8K4IedAKeFpcvUUS6eyer/4oRgGxv3ZLhXJtdeCeHj5+YB9uneje3wsJnPS0oUS9MU/GeMS3Ou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NthndX+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEnskw010960
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 15:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EAFxyWTIXD2IGnfq82GcLshDDFop+FScfu6PliKyoE=; b=NthndX+41AkrKXLN
	gpUbr94ve4On6PUCVFGcAM3MJROe6ttkTe/PXJ8HkV0A02OLjHwqfCXx1mbUPM1F
	RQ1XMQGAi/fdziCTqePEOP5AyIZXlXeAue1a41M9hB7iF3pc72Ceh3pS1Au0ON1B
	g7g/LTKZneQ//e+yvUdNbI6Mqe+986IJ32+085KLp4yuTT69TyqBOZyYmzbx4euK
	S4+HS5I4pnGkEH7Mgd7jg5P6BBfI9VSXqJG5FKfkqDzyq+uE+CVMiYxl+VKHG4TV
	xQjM8bJ4f2Vave56zP4SSwKR3ceB/ni+Bx4Tk0ml3HZw2tmQPnDwbTa6UwHva9AW
	08h+lA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dpwt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 15:57:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242ce15cc3so12560495ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 08:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486276; x=1743091076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EAFxyWTIXD2IGnfq82GcLshDDFop+FScfu6PliKyoE=;
        b=sRyPItw+gCUYIoKJWDKWV1ikJvok8k00xLctYA+CnT1w+pawFFRibOgQjZ2WeV5+sn
         EC9HGEj6QrEtsgF6fgyG38hyLOHrU4B2/BZf9Udl+xlAZabQwDMd9b0zK4ncVIDWlR+9
         PKY++E9ZXHKCk7lQ1xPec/dIbsPlcqUqcXerklciRSgzRtcwvU6IwJC9ntH7EmvLjtcn
         37yEuuwgw/+UXJpi1UN/O2txXPmZPa0p2nVjR+CCj/fSJtp/Fc8s7xmul0LCv8AS7MXN
         k+5qwi81Gtu+ksxINjiSUuj9tyfqV7YCtpYk5GNOT3RcxYVAjM/f5fkqTdyoVH7R7ooC
         ibcA==
X-Forwarded-Encrypted: i=1; AJvYcCUFYgoAvpnwnIgZMpPhtIvYqWkpd0TBy/4WgcVFOh2jKph5X4ISSZuZ96bWXcBp1ackKpDA6Zn1XTYKl+la@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4CgFqcAEaBAQwFn2sGCPMN6dwDsqDCBdAkhuz8Bni1vg2kW9S
	BI2YHZrbMxt7DVDjJblXXM1m4xtOzlVWU3dhPWMfMbv9XBMlQipbkXVQhusZItbjoDOmPDS09cO
	Bbk1oTRuvJZB4rMul5pb2vN8K4HkbyjwccxgibUVmH+plSEuq1Pz6Ahs5pzk4rM85
X-Gm-Gg: ASbGncsMbg6E+8PXWW1K/oe6vM8q8MJcoEOkzxPaCNP+DnbavfO1q0CbbKvXQ5dd1SB
	MQrwF2GlCGA1WmvC+MmnGsBWUpYKzrPktZC7D065gl6juXS66rGVu7mtC13zSnDSwWEjsynUv7l
	2osWWxelq49amu8go+jGiOQumeOEfCVQXsv0db9Lyemt75ZbNzjVkHlniugjs6U4d97n/ux7hY/
	ORX9U7UVS63jKmIDjCffBhkEkR8yp5GoRaQjefo/3GkaQYSpVEjglEIZ8nuU2ZVgFBbA//TS/WI
	GLxpY1v1U7YXv73anw0936mgIrMN/6Mu1i9D5nwRRQ==
X-Received: by 2002:a17:903:2ac6:b0:220:e362:9b1a with SMTP id d9443c01a7336-2265edee4b7mr69582625ad.25.1742486275693;
        Thu, 20 Mar 2025 08:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi8XbhLs92+ZkMltC891+1rpGELh9oFO3sgLfdR5Hc5Ego4ssiojy48Xlws9pVR6ouyP0mhg==
X-Received: by 2002:a17:903:2ac6:b0:220:e362:9b1a with SMTP id d9443c01a7336-2265edee4b7mr69582035ad.25.1742486275268;
        Thu, 20 Mar 2025 08:57:55 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.167.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68884ecsm137243495ad.5.2025.03.20.08.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 08:57:54 -0700 (PDT)
Message-ID: <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 21:27:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RmcG3qyThgiBW-elOqWZHcMPXmc4MqAU
X-Proofpoint-GUID: RmcG3qyThgiBW-elOqWZHcMPXmc4MqAU
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dc3b05 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=rQ4PyoImJZNyGwpw8nHSHQ==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=iVoIhCtSH5cMpfonS4MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200101



On 3/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
>>
>> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
>>>>
>>>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>>>>>> For any remote call to DSP, after sending an invocation message,
>>>>>> fastRPC driver waits for glink response and during this time the
>>>>>> CPU can go into low power modes. Adding a polling mode support
>>>>>> with which fastRPC driver will poll continuously on a memory
>>>>>> after sending a message to remote subsystem which will eliminate
>>>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>>>>>> With this change, DSP always sends a glink response which will
>>>>>> get ignored if polling mode didn't time out.
>>>>> Is there a chance to implement actual async I/O protocol with the help
>>>>> of the poll() call instead of hiding the polling / wait inside the
>>>>> invoke2?
>>>> This design is based on the implementation on DSP firmware as of today:
>>>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
>>>>
>>>> Can you please give some reference to the async I/O protocol that you've
>>>> suggested? I can check if it can be implemented here.
>>> As with the typical poll() call implementation:
>>> - write some data using ioctl
>>> - call poll() / select() to wait for the data to be processed
>>> - read data using another ioctl
>>>
>>> Getting back to your patch. from you commit message it is not clear,
>>> which SoCs support this feature. Reminding you that we are supporting
>>> all kinds of platforms, including the ones that are EoLed by Qualcomm.
>>>
>>> Next, you wrote that in-driver polling eliminates CPU wakeup and
>>> scheduling. However this should also increase power consumption. Is
>>> there any measurable difference in the latencies, granted that you
>>> already use ioctl() syscall, as such there will be two context switches.
>>> What is the actual impact?
>> Hi Dmitry,
>>
>> Thank you for your feedback.
>>
>> I'm currently reworking this change and adding testing details. Regarding the SoC
>> support, I'll add all the necessary information.
> Please make sure that both the kernel and the userspace can handle the
> 'non-supported' case properly.

Yes, I will include changes to handle in both userspace and kernel.

>
>> For now, with in-driver
>> polling, we are seeing significant performance improvements for calls
>> with different sized buffers. On polling supporting platform, I've observed an
>> ~80us improvement in latency. You can find more details in the test
>> results here: 
>> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed
> Does the improvement come from the CPU not goint to idle or from the
> glink response processing?

Although both are contributing to performance improvement, the major
improvement is coming from CPU not going to idle state.

Thanks,
Ekansh

>
>> Regarding your concerns about power consumption, while in-driver polling
>> eliminates CPU wakeup and scheduling, it does increase power consumption.
>> However, the performance gains seem to outweigh this increase.
>>
>> Do you think the poll implementation that you suggested above could provide similar
>> improvements?
> No, I agree here. I was more concentrated on userspace polling rather
> than hw polling.
>


