Return-Path: <linux-arm-msm+bounces-83497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 21058C8B206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D7463522EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6083314BC;
	Wed, 26 Nov 2025 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWjTbkgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/XhYl2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8B33B969
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176716; cv=none; b=CLaI4LKsjcuT+PjV62XOsSz2weQzWjMAIncJ+8RIwdBJfRoTW61GOuY89jo1g54Cd0zBli2nuplykBnzRCFLqIC4suvUCUoPyl1O9KfgNZnVM0gKZRB5shBXg8ccw+BdBnCWQhsU4/pRyknxQm5mv/2dCSEN6ThciqNuBHfg5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176716; c=relaxed/simple;
	bh=IBJIyCGos+Df5v2QF9ELzxIsygjlK7zQK9zsEMYIOSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVYkzcc4yerPDWOeQnf42uPT8mj9aJ2wHRS/ZgqnfyobsuU0wEdbRPSkxkUdl71T/mAt8LA3kgkKFmNVPtD49u3QDLRRLzS5nUGSsp0iOCfU/9SOJDt9NUKvAw5vtDnIG9dhgYdyNKHMdll7jiLDRQ4Lt/sxAW4S2YGI3KWAP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWjTbkgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/XhYl2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ91k2t3668549
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QryErQwyuR3L+zgYIAijcUhN4Vw58XDmRjXoajIzf28=; b=IWjTbkgyS2JGpM8G
	1fvLxTYmJd+9XsG38c0YEdFpUQ3FxN8qoAI9C9OgHu8j+6ztprmKVsfcXPbiDn+z
	qazFJBFSopbMk73JhxXN+ST5DGpMQAwiLolkj0eVuC4wfgNZZpBGu02DKK4K2gSJ
	Zrsp2JvMDyDK3bHGTgLEJkxG6OoLZWM1tyio7PibvAlwDyiBOz86jf3iqfAQn9fU
	31AmKLPTRsi80Y0tgIuWEW4OnHp3zir0RTf6hMjSFTEuAeK8ZZZKkhL5Ha+wzKl9
	gpr1aKASKGSJGmw7CH8U8DZchWzL1QCrGTuNBCRKophnij+vb5j5ccah7nOhTST5
	MWY/xA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemtwng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:05:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dde580c8so232916885ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176714; x=1764781514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QryErQwyuR3L+zgYIAijcUhN4Vw58XDmRjXoajIzf28=;
        b=g/XhYl2ZTL5NCxd/peB3S7zpaIQwQPLwrK7Ovv/8ktTxF3cJqH944GAfM8K/mQUuTk
         euwIAF/yuuyYWBdjQ57FsOFIcphL/tEpKE8wF9pMQksClnAHa1Ip15kTz3axLE/zvwMO
         1Zl/GQaWZk4ISJ1N068pw0qx+1r03J6YCKyqDsek3d/tLb95TtCwyAPn6z7+2jPxIkW9
         FIkRjAIDlRzKqwQk0CdDsqpZyJBMrm/33XFmItfjnHzq5Q2WDyUxYPFUfVWtBfc0TGbn
         gVb3yNJxEsImMgdNBMFuP38/xQ8dPP5923UxSJ1VYgg9taH/N3WlrtGMUe5+LTf4UjBO
         xTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176714; x=1764781514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QryErQwyuR3L+zgYIAijcUhN4Vw58XDmRjXoajIzf28=;
        b=NQ407PxHBOk9KesGHyrucdZkrKgPnHpQwiPg83DtBuT1CydowmF9UVygZfmbX5uT7Q
         Ja9TLZHz3Pf476ZKQyrpYU14jcDQ+ocRLKOSZmfxpdwXH9ryPkSvtAMdTClVrcLvVZsM
         CAoPx08QY0Cc0wb2kpywWvvo1AveA9Pnarks3pIQlL5roG06jaIvuOqwSjL2Ayfoy6Dy
         NIItdIOPqePB1/9hBbZMYhmS3tJH9fbVQJ6iKDnfqHNcZeTwSFXWbkhco2H6We/r+BjK
         2vfh+Voc0WDasuWV+RBvXgqgnzQ7AFv2jzrGvQMO8SCbP7L/XUOvY8QvyZPfcRuO02gN
         EEwg==
X-Forwarded-Encrypted: i=1; AJvYcCUP6HhAVIFySBGpJy3ksdwuw1IZGqkv7mBqbo9A1RnthS3j9DTx3fdhsLWR7ansIqkSABDDuhfFAXKZNz7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xpoWeYDDeUR6Mz9oWss0Gdjse54xlcCXP4gNgclpzv18LRT2
	Cu19z9ZvRHwOPgAXWWOrm/AM6Uhe0R7xlHCTThtcwEQEKlJ1uzbMj0dGmqAr1Li5KavB1GrZ9Xv
	PWaDRGcaGWW69LzZL0Xh64cEyKHQJhA/hZ3f9BDFkZz3eUjf4APFFBODuWzg9VgFDLErC
X-Gm-Gg: ASbGncvuYSRSf0bb41e8Idbmfx9fYDIYyBqS4dVzcaAheOFR9blh40OD3VPIHBaeT39
	5AGcOP8UhbbS5PvnSnMnzqMrQ9I+z68ATIHac1N4wDx7YkJ1HBbQxniV65aEG7LzvhB7ExRSZZO
	YDTn2PXChbXakDIJ2jySDrAFdhrmPS4gOLzFdgz04kYnhE1+itk5TW0r262jyhWgOFa2H7YDOhk
	GUV+OF2IBZlMMjLG+z/s9R18slSCB3azXEL/VvuBZ0cd8poN8rJtdA+3p4NnkcpoaBkVKYeU0pL
	UJ2IyYHxzdozXAzV4JGRq9U1hLfM3kkYkjJg+p2abVSTwgJBtI3JdgQUf8Do6b6PkZ7w0VEEKSZ
	Ul3gJuKmBf7e98ni+0ZkinykBpwGMI8uICpKxiHEtnZU=
X-Received: by 2002:a17:902:e950:b0:295:ed0:f7bf with SMTP id d9443c01a7336-29bab1e47f5mr84626475ad.58.1764176713403;
        Wed, 26 Nov 2025 09:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUQrY36O8LKohiysR7lCMjX4h2Y3t9x93Pa/HJTHoIlnYg80C9KIw1s456QFTdB0W4TqJ1bQ==
X-Received: by 2002:a17:902:e950:b0:295:ed0:f7bf with SMTP id d9443c01a7336-29bab1e47f5mr84625795ad.58.1764176712571;
        Wed, 26 Nov 2025 09:05:12 -0800 (PST)
Received: from [10.216.6.208] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b37fsm200792405ad.79.2025.11.26.09.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:05:12 -0800 (PST)
Message-ID: <164ae7a4-37b4-c8c4-3457-905c6bde52e1@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 22:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
 <20251122-next-15nov_expose_sysfs-v19-2-4d3d578ad9ee@oss.qualcomm.com>
 <CAMRc=Me=F5gTmkfO+2_3_pqebsz9GvabCK+xv6bfQeGgkSs6Dw@mail.gmail.com>
 <dda61a49-90b1-ef48-5a46-d6953cd5375a@oss.qualcomm.com>
 <CAMRc=McgiuD1D+WqmO9x2G8devztrLy6uLwxjFpxJ+LbKx2YJg@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McgiuD1D+WqmO9x2G8devztrLy6uLwxjFpxJ+LbKx2YJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p0KKkOkzW-OcTWq24li6kRrAdebmQ7Au
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOSBTYWx0ZWRfX2P97HTVKx4G+
 FzUtU3cFHYB62JaaDtV2axLxxuKUlzdPPNdWhvn9IHIFNmpfahY+E/djAPqVWL3zS6kNmC7Bqpc
 B/VuFoaFX3HKycT+aj+EskEDhAA4DFCoQRN7UZFY88okTk/UirWFtaTtP8CYDabBouPt+e4Aca1
 LwY+ODYSjR5NPBd7UkQBRhlzeSPIMiaxdQxPE98u2r9PoJ7OLiq0xYhdxWsWHIJ6rdxlkGvAsnx
 JC5Sj0GUmScBtcFql3htyL0UfBZsV7YNg61+1hEibxhfTi/0WdTZUBYwj6VxaVc6wcuQFIDSD4n
 K4DuErGhfKNnimZnUIJ/3VBrVvdAEJtQGGmIMnZFejKMndNccg/fJXO2ARyph1TLjyIMWNKeHqL
 BVGxWITR9ZWK6kIMMwMLqaPEUrE6Uw==
X-Proofpoint-GUID: p0KKkOkzW-OcTWq24li6kRrAdebmQ7Au
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=6927334a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dyCLUdSM9kKjni6Dxd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260139



On 11/26/2025 10:26 PM, Bartosz Golaszewski wrote:
> On Wed, Nov 26, 2025 at 5:48 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>>
>>>> +static bool reboot_mode_class_registered;
>>>
>>> You don't need this, please see below.
>>
>> reboot_mode_class_registered was used for two reason.
>> one is resolved: will directly call class_unregister.
>>
>> for second : If class_register fails, we want don't call register device
>> in reboot_mode_register.
>>
>> at -
>>         if (reboot_mode_class_registered)
>>                 reboot_mode_register_device(reboot);
>>
> 
> I'd just error out of the initcall if registering the class fails.
> It's very unlikely anyway and points to a bigger problem.

sure. thanks. will update this.

> 
>>>> +
>>>> +static void reboot_mode_register_device(struct reboot_mode_driver *reboot)
>>>> +{
>>>> +    reboot->reboot_mode_device.class = &reboot_mode_class;
>>>> +    reboot->reboot_mode_device.release = reboot_mode_device_release;
>>>> +    dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
>>>> +    if (!device_register(&reboot->reboot_mode_device))
>>>> +            reboot->reboot_mode_device_registered = true;
>>>> +    else
>>>> +            reboot->reboot_mode_device_registered = false;
>>>
>>> Just use device_create(). I would also suggest creating a private structure
>>> that embeds the pointer to the struct device created by device_create() and
>>> the pointer to the reboot_mode_driver. If you pass it as driver data to
>>> device_create(), you'll be able to retrieve it with dev_get_drvdata() in
>>> sysfs callbacks.
>>
>> Had made change to use device_create and dev_get_drvdata in below change, and have then
>> changed it to above as per the reviews on the same.
>> https://lore.kernel.org/all/qhlxxfsyc42xemerhi36myvil3bf45isgmpugkuqzsvgcc3ifn@njrtwuooij2q/
>>
>> Should we change to device_create?
>>
> 
> Ah, I missed that part. My preference is for device_create() as IMO it
> results in much more elegant code (especially if we don't end up
> extending the public struct) and memory is cheap but I'll let Bjorn
> decide.
> 
> Bart

