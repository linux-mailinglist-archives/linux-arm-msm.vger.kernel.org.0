Return-Path: <linux-arm-msm+bounces-82159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B31DFC65B03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 19:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6753353CE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8942BEC42;
	Mon, 17 Nov 2025 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy9EY0bx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK6HaEPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED45C2C21F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403243; cv=none; b=pLiiWhQKXnLA7S17c8cy/Mei4WPRiv4jT7SCT3RATzM1kDC7ho9BflYfRN1Z1GzQQBn2lI7rgcgofsuOkqriuGHX9+k/0UQESSaekxrq6XDRdxA0tyk9Cg3cR2Y4u4x5ZutQH6+CzpdgevJHFdqcyMno4VA3Lsu0DbmRe82Jrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403243; c=relaxed/simple;
	bh=iPTQ9m1iFhix6JDE+NnRTc6d+qEFNdSnMYZoKa5cfaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WF4dMO1FxFJQZq71jnUeQTa4fnpIoS5+7lOd1qtvjVmqUo8c678qODZT5BLrfo5T1yMcrD7zneD3GCLwDaVBOQsuUN0en1LhTzt7MO8IWfTXd0spDjTWh6vlzVh8EI5vWpwvmsXrdC6MeNIP0I60gqXu1gntnBBQteFeHfQLp4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy9EY0bx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK6HaEPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2pdp3671283
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 18:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mcWXX2Ouo5TLLZYh/qxtaTVfx4km+gF47FwyfrRLA1I=; b=Dy9EY0bxroQwxnZb
	8pLKbeGJdjxf8lhI0g8uPr7aRWa83RW08V0VJHDkiqmEO+KzXkHbqVUidHwUwhnq
	TChTImAVeqUdiDNRnBw6ubB3lOcd+Z46vigVo6PqMUEiq/EkujW7pkvQ7wxUd3/u
	6fq5yOJ2NgFAONoqbjAaorzp9qIWweoqNSirQxEKzqmPM/2RHvbGVFdLRg/BY+Lv
	d+4jjRojdxZJqxgpIUk0YYvzcO+TLDAWne1izLPRlw1vUxHy70HzaAbxSt+AUa+u
	CURrE/koL/EVs9Aam+VDIRR+zoTWjxYLNF5rUl50NkTyRHUz7v1GW8iNFe9bAkfU
	yQvK/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g598rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 18:14:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-342701608e2so5495770a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 10:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763403240; x=1764008040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcWXX2Ouo5TLLZYh/qxtaTVfx4km+gF47FwyfrRLA1I=;
        b=VK6HaEPiy9hEh056Ww+QUoNIwZmsq7wW90Cy5nIh16l4TQ99hhhDxBfrbNEalOf1Qo
         14lubl5I71uubc5f4Va0mh7DeZjREOCAUNLsZ+bZyNKdHtpFeo9/lNBeJkR9QuK6nSoq
         lhZ4HPpb3gu7x6hI+KQ4/ECrNXBpZbtm3ceTJQQVJ+6RA+bO9pL7Ktl0TZk+4qOgxIH+
         NkSqAOVXjPYC3ce5fBIBtT0F09+NAholrNlPWyDi7wGon9VbNOO/5ffELf2LzePUH4Ym
         PDdOIgE8ZDeI+zLEa5rKtb9LtCFxjd+eOw4CWsSHkQzSybcc4qYJRqMtLmgzRjJclW5E
         +8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403240; x=1764008040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcWXX2Ouo5TLLZYh/qxtaTVfx4km+gF47FwyfrRLA1I=;
        b=GGDcZu22+WMl0pcMzkSvZ+HGl6vw1sRoYYghbB+0eePx3iTCN3tZWtmxT87DJq1A07
         kMenii9UQ+t4jfME49QPkNX34MfxWf31wakXmQoqFfSszcUCZ+jbgR4equx+oC5Lsg60
         tzaHHS4R91g+S30q13Vkl16r1muV8TAEjAnhWeD2/BXSVBSXPPPLND6hoQ+6alCzvHJY
         gn5SiQX91cWggJ1VINKdmYr7+xzZGgqKbhO6CYJU9VFvZizVkQGIQ4GreoOAIlGj4lTW
         x/NLjCuwD6eyS+CDe6EncWvDnL3SkSkL7vsnzCNC9cSThSWdaq2ox3r4BjJnZLAW9OHX
         8d2A==
X-Forwarded-Encrypted: i=1; AJvYcCXk02SFe6U3dHXDklEMPLY6xeM21fi0w/VM8LS2hk2kNV1W3GR415RaFMQ41nTDbQr3+GEjEQu4tYdfwNRS@vger.kernel.org
X-Gm-Message-State: AOJu0YxBVB5AcCWWC666teYEoQRuqJAkOziHpwYxbt4wfuJN6zuT91FI
	EGSTvX8YUrXNVC6HyMRIq/YGK665sXOi1zQnSCtLZS80jvjuHFFtddJRPPy16H4IazMSrH6Y6T9
	FBGyD48iwwNfqMQa0Hq6ZqyEDL0t1V83tbAqooiGG83Os+fNSEH3tmYGmY63m+FKCY2rD
X-Gm-Gg: ASbGncvUVOzJMcf/KcgPT5WYsIYAeef+Jicl0aFepLIo9D7fXV3v88aB6Ca0K9f5KFc
	GbRgybVd10VxB5yQ1t4HW2iw7Z0O/RB75WUV3aDIanX4FFvsVd9RmhW6/zJTez+eTadca/OpNhr
	mRm+GMNIoNK4F0T+lCxCfI0YJ8Nx5Tm49Yj717fmmz/cPrvg1duTgcJ4bKkYDrBvOiJzM74t2Kd
	tG9TSUQs9iNhrMs8wcGgdF9RA9xTZMaW2gPjPVTDmgWZAlNtFswXH5UrF3wSPVJXh2+VYuDeupq
	jqC1mGQmwP3zEnpZPITMczRB9mJp1sEs7znti8gSY7rzcycf3nRJ8WXEgt6TB78tdrYXvveBE6E
	D3U7sF08AKbOvcnD3v+ZG2CXwhI9MO5gH8w==
X-Received: by 2002:a17:90b:4ccc:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-343f9e91672mr14579083a91.6.1763403240407;
        Mon, 17 Nov 2025 10:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeCJ6pPH8X1AMkgJwA5pBgLoxJFGpDgKR0N9JbJfdUVyzncVwiPz94fXrV93WwATwVDknfwg==
X-Received: by 2002:a17:90b:4ccc:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-343f9e91672mr14579049a91.6.1763403239968;
        Mon, 17 Nov 2025 10:13:59 -0800 (PST)
Received: from [10.216.14.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af1ed05esm20515a91.4.2025.11.17.10.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 10:13:59 -0800 (PST)
Message-ID: <08cad799-f9c7-be69-b931-f4d6c218d1ea@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 23:43:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v8 3/3] firmware: qcom_scm: Check for waitq state in
 wait_for_wq_completion()
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
 <20251102-multi_waitq_scm-v8-3-d71ee7b93b62@oss.qualcomm.com>
 <CAMRc=MfEgnmUXQr4U-919c5VLvW7PCduzS5e569FmqrtYvbJWw@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfEgnmUXQr4U-919c5VLvW7PCduzS5e569FmqrtYvbJWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b65e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_rDCu7-qE-FNPWJ6ln4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: xpAWdWlIMfL_TCcElhiYd_Cp_jMZChNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE1NCBTYWx0ZWRfXwPJ3+jbgB/LG
 qjp/0oXqus+Wph4q7aolNROluIrmYgE2sfQ7tfbAFk1XrFpVNxf944vH/RaAa2vnXWRb9xfnyAj
 NGXO1QBVYKasXibhdESErLoOuno2pfH+QoiLzLf/hgnpZqQuOBE7qUVun9lEYQB5a49e/9xGN4s
 7t/88Qmqvb/xfBW1fU0KBu/90JTlDuHJpVBxLe2P/3WTXZZxkgbNp5smfSZSDmw1qOmsXzKyjks
 /FxzJdDL15KsXUeLEzOJ1dgR1H9Xat5PsEnQ55j95pHayP1BKafPzoe9F3wSrz2KRGxVchuhfEZ
 2ogBA2GWAXT65vHikI1HvRnQ3kF43pgHAqIejf2IHzc5ad4CUmJlXnsCNTfJwGkG1XJ4FAOEzPY
 dS88HQ9gaAKQJ0DLHDmY1D6lm4iDrg==
X-Proofpoint-ORIG-GUID: xpAWdWlIMfL_TCcElhiYd_Cp_jMZChNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170154



On 11/3/2025 9:21 PM, Bartosz Golaszewski wrote:
> On Sun, Nov 2, 2025 at 9:19 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>>
>> Modify wait_for_wq_completion() to check if task is in idle state using
>> wait_for_completion_state().
>>
> 
> This is not what's happening. wait_for_completion_state(comp,
> TASK_IDLE) puts the waiting task into TASK_IDLE state. It's not
> checking anything.

sure. Will update the commit message.

> 
>> This allows for detecting when waitq contexts are in idle state and
>> propagates it to __scm_smc_do(), which is beneficial when task is idle
>> and waiting for a kick to accept new requests.
>>
> 
> Could you elaborate on what benefit exactly this is giving us? It's
> not quite clear from this paragraph.

The TASK_IDLE state is introduced to handle scenarios where the kernel makes
a Secure Monitor Call and the firmware requests the kernel to wait.
During this wait, the thread typically enters an uninterruptible (D) state. 
If the firmware’s requested wait is long, and a device suspend request occurs
during that time, the suspend cannot proceed because the task is stuck in the
D state. To avoid blocking device suspend during these extended waits, the patch
adds support for TASK_IDLE state. This allows the thread to wait without the
device suspend.
Will update the commit message.

thanks,
Shivendra

