Return-Path: <linux-arm-msm+bounces-87639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E654DCF7060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 08:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CBB730191A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 07:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8929C303A26;
	Tue,  6 Jan 2026 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h21zQnPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qw0ZE9fl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC0309F0D
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767684160; cv=none; b=VWRFBcLKh9dxiRbngiZFoUA139mgHOdQeK2uykp3BTdcFCIyfDoCsZEMwxOpRaANAqzh/LKLP/7aJLlfSPws/in0GfKUm5hZqZwRupRTcQFx+jjYF7fE848a8ZDjGOrRdBbNG7ERRN0yjzzWqXdh4OL/k1COhdQ9wVnnBz+fDaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767684160; c=relaxed/simple;
	bh=Tr6nKMkYH0j83URjwjkdws1idv2EwgShDP79lP6p2OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALBx1o3d+NQxdEhDzlpl3M1lyLLLpo9MxvurQeXh9Zu7B3Ek/LDrZYb0DU40RZ7mCLpmKHCBJpF1FIaLkkY12/T/N80dOBDWSb+PfWlkf29vt2m0F7rdxdNEuhkprAXYQbKCM1yF8k3dLY6tJ2QrrohS3vI1gRWk6m94ogLTfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h21zQnPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qw0ZE9fl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QFCs2922792
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 07:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=; b=h21zQnPG6XUjfuZd
	wiiBJlH7C444BJXszHf8wwBZdpf/u07fopTIjrv7uwJz5bSjN9H4WEQFlwhFQOMa
	yA1ZyTdqlUU2Vl6V+YedptWVFGq1aI3iSC2ObA0QJ7Hjp1HxjSZlPzJbmKbubN99
	AU+HqNUSVOdJ68sfHqM5mMI1sizwCH9370e8TUcMaCU35MZkjty1pN5iMS80YY39
	6RmDmOfuu5y009YVi9BoLbuKGJde2IXy9RCGNmi1Vmv36RjAmGNWStOdF557lqRW
	wGTqGE4QQT7ZGaSFxgYYpBDoO2WoDPRjY7cQvFtsjnG9WlRP66jzuQr9eTRTLccH
	HzcGJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy8seg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:22:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0dabc192eso17196095ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 23:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767684157; x=1768288957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=;
        b=Qw0ZE9fl/yuJByGWkPKW1sN9X1KjnJRHHNfpuKuFialFeRyWtPsuivCXWXXon8t3o/
         TiPMYLRH5BmGMZCjCHN+YmGW0BAhF9kfsmsQRzwS/AfPY7vGnp0VnahznSt8bnF57O9Y
         HrcTRieLdAgDlJCvRFn9XFp5e0MU60C/mrDTKtuqI+cJGuaAFficJbtaeTnC5E3jmhkb
         Ik3KefDtGu4qdYqeyrJLKjxqx/pK3P5bdu3guyMpUwEj3YLdU8IoEDiDSiFTcR0ito3g
         jyz8TdiIhZBViqQuSuZXjZdW9Ikx6hBSkyD3bOp/PS5KbCIF5EFLbtTv/DpgIjMrQ+Jw
         qf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684157; x=1768288957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=;
        b=gsKTMED3ktw2FZZKWg1Kg9Og2x0OeJzaNFKKWhQJjWfSplX2TpyPQgDuPH1dvLxYjo
         QPh7hhNk+8HQ3T276G4lNhFWlavuCKg59BugID18x0FIhGI9dDHe886EVgto2g6kAHiW
         WFhXGYamdli/huRtgDEW9o57ewW9A3ogVjd2rrBppjcjTIJbNxsqg94w3xw59Ndqr3ha
         nuQgGaXIzfSpJMXobutR7MCYdi8mPEWqTVUy8dS1QmNRmRFmghIQUtmZdFjPNr5nGsC2
         XYI2ORDUD8ldz/BeuQDF0wp5ZukOVKf5q5RKjHQ0erQ7r1ygrapb3QiNPIHW+7BNYc4m
         igpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF5xCz/UXJ7wGDDPjVvIPcck5SEBeaXOraHqi34m2tZT7hMfOh6CJ7jNFLObLZhGZvUMCB5n+LNx56FnSa@vger.kernel.org
X-Gm-Message-State: AOJu0YwZISucs94EWjntAQic1HX2o2C3SLJtNTDZAig58/W9R6vVNPn4
	oILDjx6hRsy6mlmSWYTUGpwLn04GILFx1FN4U9shQnLT4/PhPsoK+n5GigOaj1xNeTbjzWhtcdK
	xdMEmyqKp9mcdbhrulQGkcYI2+JdnoGrkfW8Xs6WeW1iWyqRfuDuI/GEmUd1T8nHsVAjl
X-Gm-Gg: AY/fxX7uDhzEDmcSuBxuH/YhV2yxRDg3EPbmMwGZIh89gjsun+p82iTmSmHGKn5nULn
	kbLMUuP5rXlWAoUt7vG8f7dQUDCnImEs3asGzhDQovrtaCJO4fOw9RV7rzWPyR3aA79vM6pn0jY
	amt/IKnsYpQi9pXG/kYvjkLjz3t8qatDhIff6uNM0faZr9aSylXfFjLlMZnN2JF76mvZASiq8p+
	w/BeHLzJlaxmhZP4/QWMrV6VXN/y9dG9Mw3mqYc41WF52SbVYgIsi8LM0Do2COt5NgAYZbPuOlc
	c73fLMHD1bmIs+ULoK4PV+JCH1V4Uc6BS4M+hmLOlo8P/okAPEVTibD3gH/rXR0ulLflso1OOQi
	f7Ol5Y79T/I7qLAIptNC485oKKq3hrnfBB12euM1i1vDVBNTlK/exZtvGbww8hIszUJelPxvlsS
	kAKe5Wqw==
X-Received: by 2002:a17:902:ef52:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-2a3e2cbbd99mr25369395ad.23.1767684156828;
        Mon, 05 Jan 2026 23:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4fCgkBJ5GwaDnr/7t7gVcZN56BH0JhczYJMXPSvB/LnWS4Ez/W7dUAS7GgJqcWhHEpxGMYQ==
X-Received: by 2002:a17:902:ef52:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-2a3e2cbbd99mr25369205ad.23.1767684156306;
        Mon, 05 Jan 2026 23:22:36 -0800 (PST)
Received: from [10.133.33.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5adf1cfsm1159738b3a.57.2026.01.05.23.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:22:35 -0800 (PST)
Message-ID: <ea0183ba-8515-44ad-ab04-fdee22be01c7@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 15:22:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
 <aa3ee735-8ef1-4f44-9528-e93ebec2a215@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <aa3ee735-8ef1-4f44-9528-e93ebec2a215@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: du07oOlLydLBegrufCdeuXOKW1HmvGih
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cb83d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E2cSrPEqdgoo7pV8VbMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: du07oOlLydLBegrufCdeuXOKW1HmvGih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2MCBTYWx0ZWRfX3Kx1BnhPtpx3
 2x37AOlgNKeA26gHp9PzrrXvmkR5TPjUT8nwMT3wSwYZOQf41FuaawmdWSP4VC0ps4W8E2GdvbL
 LJiG5LWqhvZXy28FtnxoJsiLG9CNnJt8IUwANT6PBVWf+dvkxkwiClhMnwBDm9Et9xfNN5sdHvi
 EYtLTprRgr4Kr4FXLBFXy1qtgQ+Bt7oBwxAojo0UfajlA+w2CSqXyuWPrbVVecmQyQmkoP7F7q8
 le8YcZf8Khq5Kis2xTpHVpRjOv0h1ozGNrgxhoznaveEWBD01Fwi9RNAvhd0aXim7L02eH0yDsR
 lHOq817ysff+fhq5Ms/+C1xJQgdxuSZcnxZT47wdYqhqx8X2UV5n7LuBP1pOj9SSf/WXLjefKC2
 ZJ9aeC0I91iNgZFr/69gQ2q7+L01BgbTCPc/8HkyAJgJb1/LHUgPFP37drsQ18J6gSJK1RWg2+x
 no45nYsq39yni5DDrNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060060



On 12/25/2025 1:56 PM, Jie Gan wrote:
> 
> 
> On 12/19/2025 2:59 PM, Songwei Chai wrote:
>> Add reset node to initialize the value of
>> priority/condition_decode/condition_select/timer/counter nodes.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 010eade0a1c5..0733b3e07b45 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -42,3 +42,10 @@ KernelVersion    6.19
>>   Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>>   Description:
>>           (RW) Set/Get the counter value with specific step for TGU.
>> +
>> +What:        /sys/bus/amba/devices/<tgu-name>/reset_tgu
>> +Date:        December 2025
>> +KernelVersion    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (Write) Write 1 to reset the dataset for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index d4210869556e..5a8c6af9b719 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RW(enable_tgu);
>> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
>> +static ssize_t reset_tgu_store(struct device *dev,
>> +                   struct device_attribute *attr, const char *buf,
>> +                   size_t size)
>> +{
>> +    unsigned long value;
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    int i, j, ret;
>> +
>> +    if (kstrtoul(buf, 0, &value) || value == 0)
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->enable) {
>> +        ret = pm_runtime_get_sync(drvdata->dev);
>> +        if (ret < 0) {
>> +            pm_runtime_put(drvdata->dev);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    TGU_UNLOCK(drvdata->base);
>> +
>> +    writel(0, drvdata->base + TGU_CONTROL);
> 
> Better move TGU_LOCK(drvdata->base) here
Yeah.>
> Thanks,
> Jie
> 
>> +
>> +    if (drvdata->value_table->priority)
>> +        memset(drvdata->value_table->priority, 0,
>> +                MAX_PRIORITY * drvdata->max_step *
>> +                drvdata->max_reg * sizeof(unsigned int));
>> +
>> +    if (drvdata->value_table->condition_decode)
>> +        memset(drvdata->value_table->condition_decode, 0,
>> +                drvdata->max_condition_decode * drvdata->max_step *
>> +                sizeof(unsigned int));
>> +
>> +        /* Initialize all condition registers to NOT(value=0x1000000) */
>> +    for (i = 0; i < drvdata->max_step; i++) {
>> +        for (j = 0; j < drvdata->max_condition_decode; j++) {
>> +            drvdata->value_table
>> +            ->condition_decode[calculate_array_location(
>> +            drvdata, i, TGU_CONDITION_DECODE, j)] =
>> +            0x1000000;
>> +        }
>> +    }
>> +
>> +    if (drvdata->value_table->condition_select)
>> +        memset(drvdata->value_table->condition_select, 0,
>> +                drvdata->max_condition_select * drvdata->max_step *
>> +                sizeof(unsigned int));
>> +
>> +    if (drvdata->value_table->timer)
>> +        memset(drvdata->value_table->timer, 0,
>> +                (drvdata->max_step) *
>> +                (drvdata->max_timer) *
>> +                sizeof(unsigned int));
>> +
>> +    if (drvdata->value_table->counter)
>> +        memset(drvdata->value_table->counter, 0,
>> +                (drvdata->max_step) *
>> +                (drvdata->max_counter) *
>> +                sizeof(unsigned int));
>> +
>> +    dev_dbg(dev, "Coresight-TGU reset complete\n");
>> +
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enable = false;
>> +    pm_runtime_put(drvdata->dev);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_WO(reset_tgu);
>> +
>>   static struct attribute *tgu_common_attrs[] = {
>>       &dev_attr_enable_tgu.attr,
>> +    &dev_attr_reset_tgu.attr,
>>       NULL,
>>   };
> 


