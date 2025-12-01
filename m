Return-Path: <linux-arm-msm+bounces-84011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FD3C98913
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 12D2B344A46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23563191A2;
	Mon,  1 Dec 2025 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvsn5zY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8ES+ls3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E6E336EF4
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610994; cv=none; b=qZsyB+1IuMhE3rrGbQVz7L39JwGCHEIl11doFTRZ0wVZOefnuiOX8loYmDYyRRJ9GX/FqzOAeGU51V+LxJmubEa5bqgkf23Ix9yFAb3tuF6OduusEb3Uu/EiLuIXTXqiW9yA+8kgk3bR8egG6PsmtIK31oNyENUP+XueRcjhvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610994; c=relaxed/simple;
	bh=lZj07wlYxkGBlkZeZ4j2r8185kCxyL9CoHfB6xGZCj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPji6OKPiDSzFVi8FPVefmVBugj0VhHf9EDizGtV/Cd+Ax2cHYIk6Wr5aFDUQBb1Iga7m2gZX6h8mIxBTSwZ2RiTVOdz2ZRBOWWxDGBvUjf8U5XxdN+UTbtu+w8XAvwJVA5swPU4i8HN4y5EKy+OqefOzUOeWdNkAqc0sJ+AO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvsn5zY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8ES+ls3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1Ax6qn342462
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 17:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1VO/o5e75gGVIgNjtwUAwm2TSdnBzXjm3cTgEXji5M=; b=cvsn5zY4ymV3PQ5i
	PoIUP4FPus7jWmxQh0LNN7RCPgXtNKb3AeFP7peg9UFMey0pMFdvXx+Yb8mRgbGa
	gp8egszIHm3xSW0YD2nRFG5xqVNCSZL6fb69RJe90vQsUudgY2SchnJuEUFRGQuh
	mFG/VR7MAx+rbwZczwi+bXtZSbvFg1PxAdpA/L2AORnocsPDhFl3SG8p6O0SrkwZ
	g88UbT5VZSxO4T6ugaJrEgpYxBwu626piegsHlQJ/29ZhEGp2cLJV7fBBsmo+On6
	TGJ4XtvE1Gcq6P9ltrBATbt2vqXXYpEIMy4GlCiOlO5dix0VnL9K1b0pB2Bt3LcN
	A+H9iw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re15kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 17:43:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso6495129b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764610990; x=1765215790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1VO/o5e75gGVIgNjtwUAwm2TSdnBzXjm3cTgEXji5M=;
        b=I8ES+ls3rwC0rmwHJrZuyBmucNO7QfCtCXXJszCS3fQX3f3f2oC1jwbSWT4d9440Ca
         Bav7WkzOaZYbX5/YaK5C2rP/0IA0Flm3aWcxIgrRVk0KBzd4JieSQu4jOAE5JmqSqJES
         gz1QGxKSwLUJIntE/BSoErncFK32WG6qvKwc8NQEALmpn+FGh+rC8A/ptRXMilLmpsiX
         InPWnlagufKngXydLpmahtY+dDShq0vWzID6fTRiXeSv5jVQ5wT1kbuRx/5mCr5I5Lmg
         xvGAIxLHk2ldpU7+WW4kam6uXq/ERHsLqMcBI8XX89vAx5isCIobBpFXzi6W8lAV95cc
         RMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610990; x=1765215790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1VO/o5e75gGVIgNjtwUAwm2TSdnBzXjm3cTgEXji5M=;
        b=eLUde6QFf/NrM/kXtV7k8bKoNl/3U5PXGXuntP+leE1USyafvcrND65BdOjcfu+wkN
         YcUgqSBnlT9tKXBMeGKElIyN8FlcWbUTUQ8l2Byhh6JuMLQfG2N44nuVQr53UUWVDkek
         0dmKICLw4Gx8LTGKmlBq3W9RgVjOumRjHy4Dkzkhn0FvMu8aRUptonxlYLVWckSoRcBG
         /BHDd8Y5ldeBv8ig4kZJKikKf2Mv9iuKTvgk4PatFbTWgOsXtfxPbk1IhtQGpXgmkeeB
         xFy53rHnz5EICxDp9Hnbyb+3zhAI6S4esO8WeMEHcHpNCT/bG7knbkubMB4mwPs6wOxV
         aYkg==
X-Forwarded-Encrypted: i=1; AJvYcCUi/NYgiQaUyBRR83J2ZPXkzTkNR6J4tDIagyx5K0o8PMmLVHpPkSDRBIDqFJ2CXZ1fybCKj53YAURKtu0n@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzpyzwEwwKCk7qhnzv9wBRAiajyr2r4JzQgnwcIwYuM+68/Os
	k9fZLjctQwO3WKk41nn2PgwuPJZHlKN0tv0BOsIp3tIseZFqw7xEsE5J3kIY3B6x/7f7MH0x9YF
	BGueazXXaSsuoP8n6y3l2D7gG+cWbCLyg7/SCe8+SmzTL/IDdwJ6HyzUO2a6cq+pmdisl
X-Gm-Gg: ASbGncuuJD7kn46FqnOmjXvf5f+wMuuufs3dAfcXxJpPBRKiGR75tvttXSdq3MPA1mW
	2BVeQFplT/E87VhYqGUQZ6frIX/xDjAA6Ule33NEGLc0uWKaQ4hHPgSkGoATFXGjiILMA0VTS5V
	oM0AG6hzM9RWncShOXBHvHQWOx1+Dn+X3pE4RrARlwEyImPfFkNyWJARmrtYUb8sUnEsPg3iByX
	/JjgP0PRLO+a48PwUA5wVNOmJXp4otUBCcSWQj5YLTEy+8crlHW2PvQ7V67cBhlSRexcOiT9+Ey
	2f2gsNon4g5FffP3iGJwJdZmxYKsFtTTWnesIR1PlZic8jnVg/DBoupfmucOncnRoAT4bufGbK/
	BjlCLSrZ67HYM6ufmT7F4TdIfY9GsK9RC
X-Received: by 2002:a05:6a00:4b43:b0:7ab:63fe:d7d5 with SMTP id d2e1a72fcca58-7c58e113bb0mr38016377b3a.20.1764610990479;
        Mon, 01 Dec 2025 09:43:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV7pn7d/Dh/csFTF0k/OWDogbO2glNn3BMQE69LQoc9YhaOlwRVVDof/8TZKHInrDSsFmp8Q==
X-Received: by 2002:a05:6a00:4b43:b0:7ab:63fe:d7d5 with SMTP id d2e1a72fcca58-7c58e113bb0mr38016348b3a.20.1764610989949;
        Mon, 01 Dec 2025 09:43:09 -0800 (PST)
Received: from [10.216.44.100] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3f23sm14292031b3a.36.2025.12.01.09.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:43:09 -0800 (PST)
Message-ID: <4f8f9217-f6d1-1321-c2be-5ee1dd807eca@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 23:13:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v20 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
 <20251130-next-15nov_expose_sysfs-v20-2-18c80f8248dd@oss.qualcomm.com>
 <CAMRc=MeUoFhmxcxsvboKx1E3KCsqkd081d8e9PypuYCCiL1XFw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeUoFhmxcxsvboKx1E3KCsqkd081d8e9PypuYCCiL1XFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0NCBTYWx0ZWRfX/04GK9SSJ2jn
 UlvjEL7CNkyZaPpNtthQi0TPTS1YkTzlbId2EHt4xc21sZ37y1XRspczS9WbtV76V1x+E8lIZkK
 mW8uZ4miDFUogBO0ajT1j8pCCLBwc65KcJJy0RZ+FqGV89jgADPuuf6fDTu4Kc9SyxYbPtRHgt9
 u40TOCcz4LylP7fWhOgNamoldMD7YKfMiTumWHa0kiSb9FqmZ/PilDn6cYbNJ5H8GcNynHJ5wUI
 AFTfyUZmp0QDXl2bsvPqv29INWpdzbsaGrvxO2oNMylNwrODPBGtDOq/DSzXOvpjlaI6riUmlnO
 lnbmIqVKhJlPYnGVGZYtOrfdS8uOR4nngQNVijOx+wxu9yC4EXL8UWm0XJeIT4ik8sORf15WLvJ
 63+bS535+ZTX85Cwj9lAN2H2MxHM/A==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692dd3af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HCQ8OXiHCcgNmGA-GAsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: pfmX4ZBsOnU834s6LOkj8GGfKKVmPb19
X-Proofpoint-GUID: pfmX4ZBsOnU834s6LOkj8GGfKKVmPb19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010144



On 12/1/2025 6:51 PM, Bartosz Golaszewski wrote:
> On Sun, Nov 30, 2025 at 7:21 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>

[SNIP..]
>>
>> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +       struct reboot_mode_driver *reboot;
> 
> This is not related to this patch but please consider proposing
> renaming of this structure to struct reboot_mode_devicd because
> calling it a driver is quite confusing where in reality it's a device.
> 
>> +       struct mode_info *info;
>> +       ssize_t size = 0;
>> +
>> +       reboot = container_of(dev, struct reboot_mode_driver, reboot_mode_device);
>> +       if (!reboot)
>> +               return -ENODATA;
> 
> container_of(p, t, m) returns the address of the structure of type t
> containing the member pointed to by p known under the name m in the
> type of t. It just calculates the offset between the address of m in t
> and p. It's not possible for it to return NULL.

Ack. Will remove this check. thanks.

> 
>> +       scoped_guard(mutex, &reboot->reboot_mode_mutex) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       size += sysfs_emit_at(buf, size, "%s ", info->mode);
>> +       }
>> +
>> +       if (!size)
>> +               return -ENODATA;
>> +
>> +       return size + sysfs_emit_at(buf, size - 1, "\n");
>> +}
>> +static DEVICE_ATTR_RO(reboot_modes);
>> +
>> +static struct attribute *reboot_mode_attrs[] = {
>> +       &dev_attr_reboot_modes.attr,
>> +       NULL,
>> +};
>> +ATTRIBUTE_GROUPS(reboot_mode);
>> +
>> +static const struct class reboot_mode_class = {
>> +       .name = "reboot-mode",
>> +       .dev_groups = reboot_mode_groups,
>> +};
>> +
>> +static void reboot_mode_device_release(struct device *dev)
>> +{
>> +    /* place holder to avoid warning on device_unregister. nothing to free */
>> +}
>> +
>> +static void reboot_mode_register_device(struct reboot_mode_driver *reboot)
>> +{
>> +       int ret;
>> +
>> +       reboot->reboot_mode_device.class = &reboot_mode_class;
>> +       reboot->reboot_mode_device.release = reboot_mode_device_release;
>> +       dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
>> +       /* Check return value to avoid compiler warning */
>> +       ret = device_register(&reboot->reboot_mode_device);
>> +       if (ret)
>> +               pr_debug("device_register failed for %s : %d\n", reboot->driver_name, ret);
>> +}
> 
> I'm not sure if this has been addressed before but why is this even
> optional? Why don't we just return -1 here if we fail to register the
> device?

Sure. we can return -1 and then continue to register reboot-modes.

As per reviews on old thread, we wanted to continue reboot-mode
registration, even if creation of reboot_mode_device fails.
https://lore.kernel.org/all/qhlxxfsyc42xemerhi36myvil3bf45isgmpugkuqzsvgcc3ifn@njrtwuooij2q/
 
> 
> And just for the record: I'm still convinced that using
> device_create() here will result in nicer code and allow us to contain
> the associated reboot_mode_device inside this compilation unit.
> 
> If Bjorn really insists on keeping it this way though, then you need
> at least a call to device_initialize() here.
> 
>> +
>>  static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>                                           const char *cmd)
>>  {
>> @@ -76,6 +128,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>         size_t len = strlen(PREFIX);
>>         int ret;
>>
>> +       mutex_init(&reboot->reboot_mode_mutex);
>>         INIT_LIST_HEAD(&reboot->head);
>>
>>         for_each_property_of_node(np, prop) {
>> @@ -112,6 +165,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>
>>         reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>>         register_reboot_notifier(&reboot->reboot_notifier);
>> +       reboot_mode_register_device(reboot);
>>
>>         return 0;
>>
>> @@ -132,9 +186,13 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>         struct mode_info *info;
>>
>>         unregister_reboot_notifier(&reboot->reboot_notifier);
>> +       if (device_is_registered(&reboot->reboot_mode_device))
>> +               device_unregister(&reboot->reboot_mode_device);
> 
> If you bail out of reboot_mode_register_device(), you don't need the
> above check anymore because the device could

We wanted to continue on failure, as per reviews.

thanks,
Shivendra

