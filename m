Return-Path: <linux-arm-msm+bounces-86404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FACCDA2FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF2C30517D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D46D34F474;
	Tue, 23 Dec 2025 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjckcD34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx2WWVXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9D34F476
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512103; cv=none; b=k7E5M1f/1YKktvavR/evTXLjkTVuOcu5v1jgfaO+sRRB/E+LinJTv3XXkj95SB4NooL1GK3q5KKNEEN42ABo2KDVBCXNj+RuNdo3eaH8bM99IPxk2VCmWxHVmDsJZ+UqS2FoeUXQSB+pYPlSAUXJsT0tHsyp8hTBH8evUIUmVj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512103; c=relaxed/simple;
	bh=ndiajt4xyKhXIVQjUu4477cd5z9E4n0axZSKrB5XvT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwk3DwGDPpzk06lRxDEigWfrkjMB+vugJpT1dLYFsSZuI94oReIlRl0c+FxCQtTg0ACRFKDRLB9uvJRE3gsggMlo7iauq8Boye1VjFdPO0p4AXXSf7CpfHz8feLlAo0CRVNcICpZaW+pijxdWZzJh/xViUA0B8pblbTSyEqzzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjckcD34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx2WWVXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNENSQq913795
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7TmddSvR2LheJPIeLcNpFegukS9hsF+omTA5xlkqZ4=; b=XjckcD34ZtMmQdIK
	TwfmuDRG+TsB6QqsCPZlSvSPT28nteRxuv8UVum3bdJeIVAGrbvvIJJkzo3VMxOX
	vKclt4Cc2Nr9Nor5KLArodCu2K/DlY+HdtC19glpbW2pBjB2Asr8JJgGejH7VzPP
	Na9yGIoGO0FBqJ/rv7Ksdul2umc6EkkgTEBTDjH+gJcm49b6d/WzKwyvzjQTJCfE
	eU4O/WteBHhrNDJP68DucPsP4xvNHWEr4wuiyRgIuLtl/pCDegV9NPEU5DJFEvC3
	Zyncfta+EJ9bMr53e5sV/i1gKNfM8uY/o3Dlu6IrMNfMTjkx57b5xpRWDUPw1Hh7
	bsI4UA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2gm36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:48:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso5224689b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766512099; x=1767116899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7TmddSvR2LheJPIeLcNpFegukS9hsF+omTA5xlkqZ4=;
        b=Bx2WWVXP0T/jrGC5RBZgQPMAg9MtnBaEOXLhPhY2AC98as4mQVngpgwuHuddk05gQe
         Be6vBiFGbAg0v09tmB/HqcadJCA0XiXnynBlH3ofZoshrP3Izv+czbtCaQz41KA5knh9
         j6dTs2gLVLWwPVxAijPWU0IaLOMjv0dXzwgprjKa11Z+/UJmqHWtZuFxIvX2myMFVioP
         kAkv1YEFoUYbP/hjxT7D4KJAJtHKrGl8oS/SkcouJ7J72f9GMxpoFEB+Ka1jZamrxvcJ
         hq8knSZOkQe3UorfaeU7Mi1N/jVS4j9R/wO/M5ESSUBi4HDPKlZgbTxZ0+Bm0tRV22Nk
         sK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512099; x=1767116899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7TmddSvR2LheJPIeLcNpFegukS9hsF+omTA5xlkqZ4=;
        b=MlWrOHzGQF7bDcthJ+6CDBH76KRfFrOpKZqXJfvLADfMG6zp0OZ+2UQbW8mhPJpQI9
         M3tuQIvnwRrjOW4xwJEyGad1pvTmJd1W4BIqNmFtijFiU+8CEAvY8b2NEpONBjjTKIKs
         09OlNwdeQ8cqcKaAwxYAlFCm44YYrSqL3YPSbRTiyaI2ndGIximgNTr61q+JUV4St3/8
         YYyeYG+NEUpxZBZcYSqBVmGBpPYZ0dJAPFTaXn1SS063qvv8ih2zqZX4eufcILLHrogJ
         VIzXi4WESeK7RnOovCXN1VrNx3XuSbQhV0FHtKSZrQOYcobwJuZUD6BU9fEPY6cRoerc
         /Zxg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAm1e9gZrOALNu9v++wq8OCNDCXQY999xTrrivW02WJQvV9l4Dm4+DDXg8XECPyBp2VQzs/k7GjbRjLlM@vger.kernel.org
X-Gm-Message-State: AOJu0YyRAs0Q9kZ8FQndVKg/+OtqrhOgIrc7BSDzEJZ15G/kUJFV51aa
	E49LGqsqmtaUB6L1cGS3iMEZFpxKYjmCxxk9JIb7ULlKV4Ow3DwoGY/DvB11YGfr63Qi3rxzj9L
	kcLJoBcPAhA5PJvZ+8PNkUfTMfbbu2eMTxQ/Hy8VmLHDlY/WpM1dOYCK04N+5jkUCbL0q
X-Gm-Gg: AY/fxX7CIvLyZi1/KCoYwOBVPXhCrXvjWAjQTZmyE5iJbY8HLVAslKXK6n2n0TfaM+/
	lrgU2M0SGE8beVHb/NX9/ZlR26kWtN1MpvZUT763Ax2ZWry3Hyi7t+OivB7ifdSWfedb2DSKrvj
	d8Ec04uBpD4o+Y6AZv8t1NKbhVOguY9Hy4Oe8BbJdUfZHCqAUaXaDYk02NzCiWdUUkHdWk6pGpZ
	0GP2gOy8p/xJ8x0bApxQrY3YSpzloC97GQXz/dZ++D0rGt5D3FrvFI7lr+erl6mcehGWWyhZotw
	KPlnY18Ow25eEnaLVnxthm+Os+Mf26W05ZBj7OGWHHb5QKhYyMS+CW/qfFvnKwFiaVjC4+hQmUU
	XKTVyZy2uK3zj1KO90EKLJW6+Y1+z12e4XNRIUjCnTXoK
X-Received: by 2002:a05:6a00:4ac3:b0:777:797b:7318 with SMTP id d2e1a72fcca58-7ff64fc5fc8mr13386216b3a.7.1766512099317;
        Tue, 23 Dec 2025 09:48:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIDmgXKkHmJDIZktFupD5ri9K+WiOIsEWzwSt4F9sWLlOVvGg1VX3cwl/evhMnQwJ71UWoCA==
X-Received: by 2002:a05:6a00:4ac3:b0:777:797b:7318 with SMTP id d2e1a72fcca58-7ff64fc5fc8mr13386197b3a.7.1766512098797;
        Tue, 23 Dec 2025 09:48:18 -0800 (PST)
Received: from [10.216.58.207] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a8442edsm14393680b3a.12.2025.12.23.09.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:48:18 -0800 (PST)
Message-ID: <a3a874e2-d2b1-6891-4fbd-9afba444e8fe@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 23:18:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v21 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
 <20251222-next-15nov_expose_sysfs-v21-2-244614135fd8@oss.qualcomm.com>
 <CAMRc=MeBiHcYd_3p9k=QOc5zxC930W6=aaD4Jbh9zhMWjwZ=bA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeBiHcYd_3p9k=QOc5zxC930W6=aaD4Jbh9zhMWjwZ=bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NyBTYWx0ZWRfXyhfGNTHeP7Ti
 FivFqLE9M/QA1kT3VMqpV/As0WqMHrOinJ/IZZKYisQ7Fi2DMrhDBVU/40X0mbixmu9KzTeZs9m
 f/MN/HE+TPz2JuHmoKyJAxCx6VF/XYqZC+LyiIFGrODDy2VxbOzeGs8XDrjAYCyQzBBuPkQJ+BG
 m7wax5bRsdUZJH+cU0I7xTG5dhRtyHmPdHZLZ34OHPKQLTJ+jK/KYF+deDnXOUocoPm3T+8Sbl4
 dxT+Chk1juIehQbwB+X1h83wROMomDfT+LUpcvWnkKgupXIdKIMPFaCNaYZFraW2Qk98X3bMpj4
 Vk9OlatuwyjuAHyPS5tVz+mz4ga1lrkgr64slL797suKoLGfX4bO5LZ/+7hAj+Ly8+lQTwci/Od
 VWwFUzwtmNiEreM+9iH4KFRplLtW9b0xERti+U83gLlbIk6/jSxtkdq5ND/EvVOQ8kBdZ7PPxf8
 TTb0+B5uDyvgQVPRCWg==
X-Proofpoint-GUID: jCxLfE0PZnDPhNBiPt2ICaLopOUBDRxT
X-Proofpoint-ORIG-GUID: jCxLfE0PZnDPhNBiPt2ICaLopOUBDRxT
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694ad5e4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=5w5FkBi3yMgOnvPOYPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230147



On 12/22/2025 10:56 PM, Bartosz Golaszewski wrote:
> On Mon, Dec 22, 2025 at 4:33 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> Currently, there is no standardized mechanism for userspace to discover
>> which reboot-modes are supported on a given platform. This limitation
>> forces tools and scripts to rely on hardcoded assumptions about the
>> supported reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it to expose a sysfs
>> interface to show the available reboot mode arguments to userspace. Use
>> the driver_name field of the struct reboot_mode_driver to create the
>> device.  For device-based drivers, configure the device driver name as
>> driver_name.
>>
>> This results in the creation of:
>>   /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the list of supported reboot
>> modes arguments provided by the driver, enabling userspace to query the
>> list of arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> [snip]
> 
>> +
>>  static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>                                           const char *cmd)
>>  {
>> @@ -76,6 +109,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>         size_t len = strlen(PREFIX);
>>         int ret;
>>
>> +       reboot->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
>> +                                                  (void *)reboot, reboot->driver_name);
> 
> You should define a separate struct in this file and pass it as
> drvdata as argument 4. The main reason for using device_create() was
> to not have to store any data associated with the sysfs ABI in a
> separate struct, not in the public one.

Currently we directly access list head in show_modes.
We want to maintain a separate struct and copy the mode strings
there after registration is complete and then set drvdata and the same
in show_modes? 

> 
>> +       if (IS_ERR(reboot->reboot_mode_device)) {
>> +               ret = PTR_ERR(reboot->reboot_mode_device);
>> +               reboot->reboot_mode_device = NULL;
>> +               return ret;
>> +       }
>> +
>> +       mutex_init(&reboot->reboot_mode_mutex);
> 
> Add a corresponding mutex_destroy() please.

Ack. thanks.

> 
> [snip]
> 
>> +
>>  MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
>>  MODULE_DESCRIPTION("System reboot mode core library");
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
>> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..d7141a1a609b62bd3185642ecc1478fdd3555037 100644
>> --- a/include/linux/reboot-mode.h
>> +++ b/include/linux/reboot-mode.h
>> @@ -2,9 +2,15 @@
>>  #ifndef __REBOOT_MODE_H__
>>  #define __REBOOT_MODE_H__
>>
>> +#include <linux/mutex.h>
>> +
>>  struct reboot_mode_driver {
>>         struct device *dev;
>>         struct list_head head;
>> +       const char *driver_name;
> 
> I have no idea why you're storing the name here.
> 
> As I said above: you should not need to modify this structure (if
> maybe for the mutex if modifications of this struct from existing code
> can race with the sysfs code). Use a separate one for sysfs data.
> 

ok. If separate data for mode strings is maintained, may be we won't
need a mutex lock as-well.

>> +       struct device *reboot_mode_device;
> 
> I think you misunderstood my comment about the renaming: what I meant
> was: propose to rename the existing reboot_mode_driver structure to
> reboot_mode_device because this is what it is in reality.

reboot_mode_device - this is not renamed. variable name is same as in
previous version.

thanks,
Shivendra

