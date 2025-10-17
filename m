Return-Path: <linux-arm-msm+bounces-77799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBA5BE953F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 16:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9CED401B19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07DD3328F5;
	Fri, 17 Oct 2025 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9VrrRU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205643328EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712471; cv=none; b=Z0LRY7zBf10SlYK+TLx+i7ScBm6XFPjOT//n2ptYloa+5A2pU6vG+gkWtHy2xFIVErrjnMmwPNUQFy2y1bsfwiPRb88LzR0HZSnrfyzeiaFaD/forf0l0loFg6uOZJMfNrHaVKavIs/qiq6ua8F2Q98v0o5nPIE8QiixT/c60AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712471; c=relaxed/simple;
	bh=DiyVdXABTrVQ08Fd2LFM1CVCN+GGwKGDZECsTWV1E3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBORkb8FiNBD2NPFlnoR3ryP1Ebz3dLPUov2Mj0/OjaC0DDWaSC70UFqVHm6s32Ibo1D+cUGtWnq4WjwnKc6AKO47NNu5/RfZSjwbH01Ac5KoMrRW7VUhvq99Latap5UK4v0SbQ+yepyg4UVn1dP8BCsr1v1RmNDdrmr6B5YkT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9VrrRU/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8Iotn002701
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QiH2J+dIVcecXrrAGCkcTfZdS4TOBQ+cjT9NDaaTuF0=; b=J9VrrRU/jdbJq9bO
	0EAk7acvt5zAn0ZR59QlF+A/Q6sJ6hGysgUBLOJNpFyYH5hoku1AQ7vdpigqUUKQ
	Rm+70vC4PnW2Wmddofi1eEZNooEf1eeffMljto/pEOdgZ3l5f5DYUuHBJ30s54eE
	Caf6AjtQO9quon4iMBrGB2J7+F+/9NlXMEAxoHn+rwaM8199FfxSTKqcfAZC9xGK
	iSxcDik/1ObWfEE1zbFpICVyLn3u4CGMRytMtYQ4Xg4nFUs16nLIo8enaDh1/aZG
	lr+n274IM3bv1A9bgfVy5Yf7YQnEnVfdPArXuAuCgGEcwIn9Nm7kD5ndBLjPNy9/
	q+7X9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8mjpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:47:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so16554215ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 07:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712468; x=1761317268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiH2J+dIVcecXrrAGCkcTfZdS4TOBQ+cjT9NDaaTuF0=;
        b=KeUiuU21Iq6Wl+sHPYLxIyVMTYGOlKd6+F9ax/GKbshmw2ufQIPGSohCrb2wOhiZgO
         dn4HX26LJlZ95oLtxhekz3i56EJvl3S3QusoFWgOZu69POKABE6/Xi0UkNki2kUpzbF+
         +Zkhmlw2X/RN4Uf65dFGkKyPx/VerH3K/nivIyc0uSbhMWjizv8iDwc6gt9PAUIO8EfJ
         KLMaBXinuxAG9RqDDr0jw8H/Jf3yYnuxrazj1awv+VUXI0z9zJSAws4HcBh+XtUhth09
         oJ+oBTqqBoqUsxftMKqV9/i+qAL4PP7zfOgjAvm0SDLJR+3vFVTPxwsAzGjFxqeqLRJU
         bKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf039obX6jgPs4jVqgSD5JhRGKVGgrYWTd3e6SwRcKG7oFIEXikUPVQRmk0XeB0WDVYx4N4/x8PBLzQckQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyktvwyke+nZUTn16CXKd0F69N7ZWqsjxKLjGoJOrUgrlSxpza4
	0GTjfR2vE+sE7fC7pMaOCKB+K71AhNz+bZFtPFm1aiuT6SNUmqOQkye1y8BFWbS4lJfBuX/yz4Z
	yPjX2ExD0peq5jtTKo4/251Xwsl/KW8GwG0jeroShlAxiQXotdrItJNsUqquA94pp/z6x
X-Gm-Gg: ASbGnct8VxcDVFRsJxsA3WYHxfnw2xyCQ4q7w59KvluaV8iuz9jQ34CrtCVPkkYy93O
	yNMkffwPyIzD0VvwtYje/NdOKdns/KRKIKM2L36uvb53xoO60b4+I57KvFiSf+VIWC37tsWQGD8
	sbgDZ/20d38+0B8LMHlvQEIGgTLlr0Mh+8PNjcjSWStA0+pysWvrc/woI1Oitp1Y1t18oTFETC0
	JeyW2CaveCan/hfsPkYCjeNOBPwen33hxi2n4cvSDQeaCBiIQd9vAskPnqTzFVweyJHB7mHEGsH
	58FvLODNPAUTDsLi4BjgIV5Xp303A7cZEwYobRF+U+72b1nl3P+Fagl5EdIwOy+oSLIIwH4wP8C
	HSxvwdG0L9GbNY/aakuCgQibAzQ3caOzc7Q==
X-Received: by 2002:a17:902:cf42:b0:269:ed31:6c50 with SMTP id d9443c01a7336-290c9c896b0mr41632715ad.10.1760712467533;
        Fri, 17 Oct 2025 07:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOjKbFTkJh0ezCxCdJ3kP6joxM9yMTBKLaFVhNRS3DcOSUHjMrOrZfMhR8o9cNnCg8mifCEA==
X-Received: by 2002:a17:902:cf42:b0:269:ed31:6c50 with SMTP id d9443c01a7336-290c9c896b0mr41632325ad.10.1760712467017;
        Fri, 17 Oct 2025 07:47:47 -0700 (PDT)
Received: from [10.216.52.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099388dbasm66275665ad.47.2025.10.17.07.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 07:47:46 -0700 (PDT)
Message-ID: <2c8e7d94-cacb-427f-02ec-ecc83a189479@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 20:17:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 01/14] power: reset: reboot-mode: Synchronize list
 traversal
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSeu_Y2Rra8x22kWN0B38jKZEwq7=B9C75zH18QdjDHAWqg@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSeu_Y2Rra8x22kWN0B38jKZEwq7=B9C75zH18QdjDHAWqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8ZPqdDGa2nYmbOyn5vAbwVC2zJ1vMGPN
X-Proofpoint-ORIG-GUID: 8ZPqdDGa2nYmbOyn5vAbwVC2zJ1vMGPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX2HW7JsyVMUUK
 6hUib1aN4a0QfogOrCIuS8em4pUws67zsj+i7qb5R6khooQpEyw/6FpW+Zzc+9ao7ZaoKXLmqL1
 ZA5D5cDsHS9/qN2dS0Oeg83ttIWwe8PbsokmqyD47vCCBTxrei2IICffneluootyRab26jepOlM
 8k9+DS7d5snXl7gb+yKh5nz8p8PQzmT/fP5St31UCy0rn7IadbB8xaKJddfpBmp8YZ8Jhw0xdiR
 CP1hZORor1HrXyninL00AMsUuvYm+XxFpoxjimQz8+EvSw0v69+WHVJwC44zgGNto+6YRoXgbKv
 Z6gaREOIEzWtQN7w1NMXPU5JtY8tO3N1Vlp7P1eJwvB5+RuhtPFMJ/4tmCz+Ga2K4JMKAg/svjb
 yIW/fqz2r9MZUm0uAz6pbhg6CqxtXw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f25714 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=js1QHsEmXU4TG3GKDNEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017



On 10/15/2025 8:02 PM, Bartosz Golaszewski wrote:
> On Wed, 15 Oct 2025 at 06:38, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> List traversals must be synchronized to prevent race conditions
>> and data corruption. The reboot-mode list is not protected by a
>> lock currently, which can lead to concurrent access and race.
>>
>> Introduce a mutex lock to guard all operations on the reboot-mode
>> list and ensure thread-safe access. The change prevents unsafe
>> concurrent access on reboot-mode list.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
>> Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
>>  include/linux/reboot-mode.h       |  4 ++
>>  2 files changed, 57 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>         if (!cmd)
>>                 cmd = normal;
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               if (!strcmp(info->mode, cmd))
>> -                       return info->magic;
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       if (!strcmp(info->mode, cmd))
>> +                               return info->magic;
>> +       }
>>
>>         /* try to match again, replacing characters impossible in DT */
>>         if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
>> @@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>         strreplace(cmd_, ',', '-');
>>         strreplace(cmd_, '/', '-');
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               if (!strcmp(info->mode, cmd_))
>> -                       return info->magic;
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       if (!strcmp(info->mode, cmd_))
>> +                               return info->magic;
>> +       }
>>
>>         return 0;
>>  }
>> @@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>
>>         INIT_LIST_HEAD(&reboot->head);
>>
>> -       for_each_property_of_node(np, prop) {
>> -               if (strncmp(prop->name, PREFIX, len))
>> -                       continue;
>> -
>> -               info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> -               if (!info) {
>> -                       ret = -ENOMEM;
>> -                       goto error;
>> -               }
>> -
>> -               if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -                       dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -                               info->mode);
>> -                       devm_kfree(reboot->dev, info);
>> -                       continue;
>> -               }
>> -
>> -               info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> -               if (!info->mode) {
>> -                       ret =  -ENOMEM;
>> -                       goto error;
>> -               } else if (info->mode[0] == '\0') {
>> -                       kfree_const(info->mode);
>> -                       ret = -EINVAL;
>> -                       dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -                               prop->name);
>> -                       goto error;
>> +       mutex_init(&reboot->rb_lock);
>> +
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               for_each_property_of_node(np, prop) {
>> +                       if (strncmp(prop->name, PREFIX, len))
>> +                               continue;
>> +
>> +                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +                       if (!info) {
>> +                               ret = -ENOMEM;
>> +                               goto error;
>> +                       }
>> +
>> +                       if (of_property_read_u32(np, prop->name, &info->magic)) {
>> +                               dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> +                                       info->mode);
>> +                               devm_kfree(reboot->dev, info);
>> +                               continue;
>> +                       }
>> +
>> +                       info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> +                       if (!info->mode) {
>> +                               ret =  -ENOMEM;
>> +                               goto error;
>> +                       } else if (info->mode[0] == '\0') {
>> +                               kfree_const(info->mode);
>> +                               ret = -EINVAL;
>> +                               dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> +                                       prop->name);
>> +                               goto error;
>> +                       }
>> +
>> +                       list_add_tail(&info->list, &reboot->head);
> 
> This seems to be the only call that actually needs synchronization.
> All of the above can be run outside the critical section.

sure. will add it only around the required lines.

> 
>>                 }
>>
>> -               list_add_tail(&info->list, &reboot->head);
>> -       }
>> -
>> -       reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>> -       register_reboot_notifier(&reboot->reboot_notifier);
>> +               reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>> +               register_reboot_notifier(&reboot->reboot_notifier);
>>
>> -       return 0;
>> +               return 0;
>>
>>  error:
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               kfree_const(info->mode);
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       kfree_const(info->mode);
>> +       }
>>
>>         return ret;
>>  }
>> @@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>
>>         unregister_reboot_notifier(&reboot->reboot_notifier);
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               kfree_const(info->mode);
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       kfree_const(info->mode);
>> +       }
> 
> Please destroy the mutex here.

sure thanks. will add destroy here.

thanks,
Shivendra

