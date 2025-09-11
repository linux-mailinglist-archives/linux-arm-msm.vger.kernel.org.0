Return-Path: <linux-arm-msm+bounces-73072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D93B52BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 10:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E34B7A138B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C9D2E1749;
	Thu, 11 Sep 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Piq5xka7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473D2E1751
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757579680; cv=none; b=JghM7B0NyCkWm9vAIAwG/B8GAmuThoSVF94WpDk/e5dEpv7J+GGVsKL+AGRD+cxhy62fKiUpNLWb5cjpVa85E2D8XA2D3nZXO/9C3RDO5Amf/lhMsDUl7QEtFBdCSh7Wk7+0do73ndCFux5ltN7yoSHFuzRyC+obZWZiLCDovOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757579680; c=relaxed/simple;
	bh=j8TqroKExTF9wMF3JuoyU2RXT3YHqzJr5208QTZu6HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcZnKD5X9rKtCXdKCRGzEyxBTiM/WCOizE6NY219anp+w0B4WKX5NG7J2kscv2cEj7BFwouprEmE8PIiThzws4dhQgD25brh8W0g86VLvabcBAae6/ORNHPi5W21Xvqsz2sDsCNxV0skZhsf75l5Hxkm5LIed1TeRGXRNmL+MxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Piq5xka7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IUGF002273
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ys1M3DHMXIgvYm41OdZVewJHzhZ+VmJ+9gnYZpEeDgA=; b=Piq5xka76c8OZ6yE
	BPNbBtfbotSQa3yN7rltN+AgzZi805Yheunf4S7zpX9kuFVbdv4Zc4afQeH3Qzqy
	QJtWF/Qz3CJxFiPhSKgrz2pDA7wMPchNz4HHNuIRUkVYS5LkDCGIZTXN9cqqTeT+
	lI/br0UhnvsFVohjeiccg7PODm/VR4xUfG9LzZs+BLLpSnJI+QBsyBJga5bz2xFU
	woEYJkSleMYR0VjdaWwjPpwaGwyKcYvWLhDn1T2/tZVGXRJFWy5rLA4HDxa1kcHb
	GkagnQ42skpejxN1xK2NuzdsduKqCCkUioA1J6uRugeyCGskQN7xK/SCeD1k5QyK
	TCflPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8pxws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:34:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-324e41e946eso934426a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579676; x=1758184476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ys1M3DHMXIgvYm41OdZVewJHzhZ+VmJ+9gnYZpEeDgA=;
        b=IATGSwqJG1FTJIGGZAfk5+MLX/xtcZAjemKm16mLmhWnT4CwGSstKZalkxqhx3grXa
         gAu2r9bze7rzGZfokZ4zHSI0BfPvYCG/sBBYodP7n5SrMPMh2/ivtT8KlSe6tUs5KZiW
         CvP/3K3jA9OjEOi00CIuzlGabX7eJVsrGpaWs91pwZ0dEjOXy40vrudvKDR/Zhx39TtN
         XdPczmPvUAd/HqCHGSwiQT3DPYiPu00GIx/ZJQwyzPyDYfXGpNlEbBkOTvT8PzhFa7Vm
         HPwmhFrUvQ17uh4IVOxdL6Y5fd5iZzWCszMGCcEJdqbTRU3VS1vny6xmgQrsEQDljOHG
         fyOw==
X-Forwarded-Encrypted: i=1; AJvYcCUJGfdrz0PIfXxuYuwkx7I1f1eIvMVX+BHg1uoHykmFzXdFl4TlIW2MN7PDiYbp5CSRl6FY/Zs6GJTB5ns0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5PHvMDtWHmwdWqfBVJ/Sjb2/fsRw1ujkFYh6VV1Q5OWzft5o2
	tuMxA61KINdi6KBvDG9GWlQhVEdq/hnV5n/oIJFsRtwzPADakJ3te3F9bCnvuwONBpJW8vmrnFh
	sR0NU02C7AZLcEsvNZ1xvWYh9EVtUmY9uU1/+WVF9y2LmF2+yCrPw+7yJZEMPJSD9dd6/
X-Gm-Gg: ASbGncsHbO0Lf5O9MX906fDUeevbPgj/un/GJ8oSS0OCXGjmar7jwNmPYx5sf8/tGOy
	3EHyvmflAWlwVwU6Og1lVoHR3nRLhGi8yQurHfK7r/9e0JuaoEGFpEAHjnDqr8lqVvou9QXLZyE
	b56cdIJB46q1r7UPmQqt3qsJF2yoVqTGqhTxXeOIa837d0Z9COB9etAZru6DVFyFd9eaIHPbdSR
	SX9vCx8ACV7vTKMTBwAhcHIHs7KpZBCuDGo8/WzdT+QzAQQumy3nLdJRYAI3Ib1N7NHMlf2WeRD
	7fzeu00wKNh9noSaA4Y4R5xfvdeYHN5UvQrj0ghmD+hMYoZOohCIaDD85dGUfnj6UL49c7ro
X-Received: by 2002:a17:90b:5823:b0:32d:d663:a7fe with SMTP id 98e67ed59e1d1-32dd663bba2mr1668563a91.14.1757579676372;
        Thu, 11 Sep 2025 01:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyLgNBCZSzSyB6t/FAQ9G6txWh8Wj+lpSimS77SG3/Yft0Ks8bzuBgE1tyP4C0bGzIS3iCdg==
X-Received: by 2002:a17:90b:5823:b0:32d:d663:a7fe with SMTP id 98e67ed59e1d1-32dd663bba2mr1668519a91.14.1757579675648;
        Thu, 11 Sep 2025 01:34:35 -0700 (PDT)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd9809e65sm1286045a91.2.2025.09.11.01.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:34:35 -0700 (PDT)
Message-ID: <5b7b8c9f-48c5-45cd-8366-c8c048eaa757@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 14:04:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Fix pinctrl deadlock on runtime
 resume
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com, krzk@kernel.org
References: <20250908164532.2365969-1-praveen.talari@oss.qualcomm.com>
 <DCNLSFVPCKMV.K1UE3J3K6JQD@linaro.org>
 <DCOJFRU8KNFL.14VPXK9QZC9T4@linaro.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <DCOJFRU8KNFL.14VPXK9QZC9T4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX5OXfWINq73X2
 t8iWo6qxupazffVPBBdKXIWhjerdVq/e8uD8LL/FMFErcI8T13S+keoIV/UwxLzrGdJaYF4Z/GF
 mkDnXdnrxxzjUXdXQEVhJjiOrtqLSlfpWdEqadlwZcsYumrr8mi0mJ86EWfg+6/X2pD9BgQNt7y
 h8Hd4k1bIrS2Dy+B4hyoQZuProzn3tlnsC09/vr8Be5K48f7/PStoN64LOCOjMwic/h1yoqBzKi
 O/9JepkLMLUlEkQlVgz51syZk9NyBzuK7jk9XZBUMj+SFJrLqD4m16adhmAYZF6/Ave7eLfzPkd
 +MzDUrC39ZmI+oZfQpkj7/6MTKnJQy0XUug7TkWafPK8ffkLffes2IccDV8zXH7f0f/Bq5dQ0cm
 WcDmsHkK
X-Proofpoint-ORIG-GUID: T0Dtb5f0ZWxxwSJYQA2HkoNavywpQPpB
X-Proofpoint-GUID: T0Dtb5f0ZWxxwSJYQA2HkoNavywpQPpB
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2899d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0E5N364vDDWnqoFJIK8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Hi Alexy,

Thank you for update.

On 9/10/2025 1:35 AM, Alexey Klimov wrote:
> 
> (adding Krzysztof to c/c)
> 
> On Mon Sep 8, 2025 at 6:43 PM BST, Alexey Klimov wrote:
>> On Mon Sep 8, 2025 at 5:45 PM BST, Praveen Talari wrote:
>>> A deadlock is observed in the qcom_geni_serial driver during runtime
>>> resume. This occurs when the pinctrl subsystem reconfigures device pins
>>> via msm_pinmux_set_mux() while the serial device's interrupt is an
>>> active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
>>> __synchronize_irq(), conflicting with the active wakeup state and
>>> causing the IRQ thread to enter an uninterruptible (D-state) sleep,
>>> leading to system instability.
>>>
>>> The critical call trace leading to the deadlock is:
>>>
>>>      Call trace:
>>>      __switch_to+0xe0/0x120
>>>      __schedule+0x39c/0x978
>>>      schedule+0x5c/0xf8
>>>      __synchronize_irq+0x88/0xb4
>>>      disable_irq+0x3c/0x4c
>>>      msm_pinmux_set_mux+0x508/0x644
>>>      pinmux_enable_setting+0x190/0x2dc
>>>      pinctrl_commit_state+0x13c/0x208
>>>      pinctrl_pm_select_default_state+0x4c/0xa4
>>>      geni_se_resources_on+0xe8/0x154
>>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>>      pm_generic_runtime_resume+0x2c/0x44
>>>      __genpd_runtime_resume+0x30/0x80
>>>      genpd_runtime_resume+0x114/0x29c
>>>      __rpm_callback+0x48/0x1d8
>>>      rpm_callback+0x6c/0x78
>>>      rpm_resume+0x530/0x750
>>>      __pm_runtime_resume+0x50/0x94
>>>      handle_threaded_wake_irq+0x30/0x94
>>>      irq_thread_fn+0x2c/xa8
>>>      irq_thread+0x160/x248
>>>      kthread+0x110/x114
>>>      ret_from_fork+0x10/x20
>>>
>>> To resolve this, explicitly manage the wakeup IRQ state within the
>>> runtime suspend/resume callbacks. In the runtime resume callback, call
>>> disable_irq_wake() before enabling resources. This preemptively
>>> removes the "wakeup" capability from the IRQ, allowing subsequent
>>> interrupt management calls to proceed without conflict. An error path
>>> re-enables the wakeup IRQ if resource enablement fails.
>>>
>>> Conversely, in runtime suspend, call enable_irq_wake() after resources
>>> are disabled. This ensures the interrupt is configured as a wakeup
>>> source only once the device has fully entered its low-power state. An
>>> error path handles disabling the wakeup IRQ if the suspend operation
>>> fails.
>>>
>>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>
>> You forgot:
>>
>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> Also, not sure where this change will go, via Greg or Jiri, but ideally
>> this should be picked for current -rc cycle since regression is
>> introduced during latest merge window.
>>
>> I also would like to test it on qrb2210 rb1 where this regression is
>> reproduciable.
> 
> It doesn't seem that it fixes the regression on RB1 board:
> 
>   INFO: task kworker/u16:3:50 blocked for more than 120 seconds.
>         Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:kworker/u16:3   state:D stack:0     pid:50    tgid:50    ppid:2      task_flags:0x4208060 flags:0x00000010
>   Workqueue: async async_run_entry_fn
>   Call trace:
>    __switch_to+0xf0/0x1c0 (T)
>    __schedule+0x358/0x99c
>    schedule+0x34/0x11c
>    rpm_resume+0x17c/0x6a0
>    rpm_resume+0x2c4/0x6a0
>    rpm_resume+0x2c4/0x6a0
>    rpm_resume+0x2c4/0x6a0
>    __pm_runtime_resume+0x50/0x9c
>    __driver_probe_device+0x58/0x120
>    driver_probe_device+0x3c/0x154
>    __driver_attach_async_helper+0x4c/0xc0
>    async_run_entry_fn+0x34/0xe0
>    process_one_work+0x148/0x284
>    worker_thread+0x2c4/0x3e0
>    kthread+0x12c/0x210
>    ret_from_fork+0x10/0x20
>   INFO: task irq/92-4a8c000.:79 blocked for more than 120 seconds.
>         Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:irq/92-4a8c000. state:D stack:0     pid:79    tgid:79    ppid:2      task_flags:0x208040 flags:0x00000010
>   Call trace:
>    __switch_to+0xf0/0x1c0 (T)
>    __schedule+0x358/0x99c
>    schedule+0x34/0x11c
>    __synchronize_irq+0x90/0xcc
>    disable_irq+0x3c/0x4c
>    msm_pinmux_set_mux+0x3b4/0x45c
>    pinmux_enable_setting+0x1fc/0x2d8
>    pinctrl_commit_state+0xa0/0x260
>    pinctrl_pm_select_default_state+0x4c/0xa0
>    geni_se_resources_on+0xe8/0x154
>    geni_serial_resource_state+0x8c/0xbc
>    qcom_geni_serial_runtime_resume+0x3c/0x88
>    pm_generic_runtime_resume+0x2c/0x44
>    __rpm_callback+0x48/0x1e0
>    rpm_callback+0x74/0x80
>    rpm_resume+0x3bc/0x6a0
>    __pm_runtime_resume+0x50/0x9c
>    handle_threaded_wake_irq+0x30/0x80
>    irq_thread_fn+0x2c/0xb0
>    irq_thread+0x170/0x334
>    kthread+0x12c/0x210
>    ret_from_fork+0x10/0x20

I can see call stack is mostly similar for yours and mine but not 
completely at initial calls.

Yours dump:
 >    qcom_geni_serial_runtime_resume+0x3c/0x88
 >    pm_generic_runtime_resume+0x2c/0x44
 >    __rpm_callback+0x48/0x1e0
 >    rpm_callback+0x74/0x80
 >    rpm_resume+0x3bc/0x6a0
 >    __pm_runtime_resume+0x50/0x9c
 >    handle_threaded_wake_irq+0x30/0x80

Mine:
 >>>      qcom_geni_serial_runtime_resume+0x4c/0x88
 >>>      pm_generic_runtime_resume+0x2c/0x44
 >>>      __genpd_runtime_resume+0x30/0x80
 >>>      genpd_runtime_resume+0x114/0x29c
 >>>      __rpm_callback+0x48/0x1d8
 >>>      rpm_callback+0x6c/0x78
 >>>      rpm_resume+0x530/0x750


Can you please share what is DT file for this Board if possible?
is there any usecase enabled on this SE instance?

Thanks,
Praveen Talari
> 
> I see exactly the same behaviour with this changes applied.
> 
> root@rb1:~# uname -a
> Linux rb1 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13 SMP PREEMPT Tue Sep  9 20:14:22 BST 2025 aarch64 GNU/Linux
> 
> I see the same behaviour with linux-next but my local tree is a bit old,
> maybe there are some dependencies.
> 
> Best regards,
> Alexey

