Return-Path: <linux-arm-msm+bounces-81475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69010C53CD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DC344EBA8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFDA329C63;
	Wed, 12 Nov 2025 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSI/Mko5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZX/P89Gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FEC336EC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762966663; cv=none; b=KcbIh1wiVXoPT/NjQiVa0izC52mLqvBuMmdhocrUNvrKLu6SkCLrLeC9YHk3Usl6iKxiPF8e2MZv2L01yOkDT5JDOBY0i5/FL7q4Y1d24Goh/S2vO+jO2QfculhN2EP8U11MoHHgdUlZy4bUd9giKQZmo9FEUD+sWeBjGrBOsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762966663; c=relaxed/simple;
	bh=NniAWjlNS156K6qgGuzy3k40wtUaszR2ayeP0JRUS/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WATt6uyDgulNTEkplavUNrMjGfURA36LnZvOWSkDraQB7UnphSMMv0ebw1di7nYO2y/JZhlCU/0bk6+PG7Stv4vje8Po9Gg9PEkX9z+RMj5pQ8DYBTJo9gOLjTqAsfnY7L3kgVXJ6uhJ8FdfCKT+qucLtVBXjSGbyWjIJmywHgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSI/Mko5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZX/P89Gw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACEJBUC1382336
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=; b=kSI/Mko5rQytHI4o
	0UyILDIryo/oRRhS4uRJWfrTMqF1DTTwY28tuBhZmNx35QHuq8sC9pFVXhRUv0d9
	r645yNYqtJ7RhujOLyW88aHPkg5kFVi5pkpL43hITAu3yWzCs2Aoto3fwOSdpd6i
	9QgAgH2cVDVCDs+ht63Dh6UoF4r/W0n0BP4awqw4hAxDLoooK/xtla8lO3IL9wlV
	kVZT4Cb0eE4WwIBNStOzk1PNbGhEsIpvT9yAqhuyCZCWnNzMhFrT+rCvS7H8j2hN
	iTmpLraVW1hoxX95FBUXA5soptbq+xkiUtQ+Lrc9l8nMBvfnlcfuR11t9pwx4Zp4
	vFYong==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw48jcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 16:57:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ceeea4addso1028905a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762966661; x=1763571461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=;
        b=ZX/P89GwiiT67eURaATXZ08/1M8fT3aXv74mn6+IABZa2XBShSrZ35zeh3yRrTVioO
         C3XhIOCaM8U8ZbOeDXxgQdiJcczYww2g+xxdY23PUDlR/KIl8tOQ10WS7NIvAavnu7iA
         eEEHKK1MxEdbKjruspa2uOHOaq5nNAA+aJJTt7U5Ga4n9ODHced+ChMU2vuolkjSKvux
         X/nZYfOHUjGx9sNyO3ep8a3XBIFRQSFS8pe2Ndm91K1w2nj5Al+A6cfbw3OUwNCJOBuy
         QU8/6j+3tItHRx86x3qxZq3h85Qft1deMzOPn20F2Tdgn+tSB6dNefuvC9AA28CwvyTZ
         TplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762966661; x=1763571461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=;
        b=TxXa+6OBRFklGTXb/5r6wj8iQdNI+pxK/b/Ajs6WX52LEMcxr6uNNR++u8Vi/AHQHL
         QgyuJL6ozrJqRX8be4gnuYzenV4DSUq39VRDcLcRtBgYqTlI/E1ZYn9lFmM48Wa5FceM
         9DQziZ71sjFcR/Mz165py4qEC1rRliqtruRCbtEn3mWz8mguUqvnTfnvM5oRqH2JDx2y
         83d8dcq0DOi49Ueo9ILBjhEDeS216fqw0CVo+klCaIAzu+hR8XxVeFvPmimYiafYQGBi
         RtEVOFgcJ9RNAGqzvy3xgVyrVQNrUKLP81PQMEcwOVOOuAiHmBJR9IKV9iihLseHyh+j
         Nkpw==
X-Forwarded-Encrypted: i=1; AJvYcCWbx8WYs28EBgXAGJannx5aMzYlBE70CQycaXSWGKnOLyXfAzuAR/wSlRdr0Nztn/FYO3SzC2whDRKqCaBN@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPiwpTx40UMyDpL8A5Ogjr7pswMdkinnEbR4adT8DhEtmpDus
	nPOgvB0VDbnLUgVV/P9O/iZFhdgUSYk3FDAIhD09Y6Ijw8yix8SivUCEg2c90bYNnAKfc68SIVi
	S9eM1ArE9Kq9FQAwQMXES9eRfygjsMojtwyQ7cFS+52MmhvqjYT253f32nn8/RopcWjDS
X-Gm-Gg: ASbGncvUkpA6oxmFyaENb4H2FvODYZKjA5om68MKm36dfiA0ReXY2PloGgghZDlHuBG
	87wQSBYL5GdrV60IpsOnLcTSzLnB75h9DU9rvihtVziyJzDypbMmguNTTIzMbtaD3U6YH4dY8rw
	pq59++n1jXJl/mMvnNwVcPnPwHoRpZJ52cpnsrHzl06uBKOpKuBNaebaQHvUFGzkLVQceqxi5Xq
	w7W07iFzqUzB1pPPqX0moxCuOUE+Amw4rqx8Ki5NRIEOU+IXfLKdduIoYtHSYf6ejhfy2TfahSM
	C8BmjxuAv753ObQUff14yvpDenToxfT2kd55eTt6+as0bVSd3Ddj0DFaj9/KubufumrAathPNYs
	9cRBXP3V28NfQMFOxm5VoVklefq2rl+3N2Vg=
X-Received: by 2002:a05:6a20:7d8b:b0:343:2772:6bdf with SMTP id adf61e73a8af0-35909c72d38mr5228942637.26.1762966660471;
        Wed, 12 Nov 2025 08:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCL8LcDYnKtT117dBOx0SxrkoJoefTb8xV70qNzqs+1oeeDhNffDRFT5zulQTb9lWo8KVYhQ==
X-Received: by 2002:a05:6a20:7d8b:b0:343:2772:6bdf with SMTP id adf61e73a8af0-35909c72d38mr5228883637.26.1762966659835;
        Wed, 12 Nov 2025 08:57:39 -0800 (PST)
Received: from [192.168.29.115] ([49.43.225.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc76c0e8sm19073083b3a.52.2025.11.12.08.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 08:57:39 -0800 (PST)
Message-ID: <41725ac5-843c-0e4d-8f82-a6b7cd8ba9e0@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 22:27:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 05/12] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com>
 <CACMJSesMK37D7Qy+rVq7w6bUt6bYGXykUid6bUKXvh7M9mntZA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSesMK37D7Qy+rVq7w6bUt6bYGXykUid6bUKXvh7M9mntZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qsXPDrNLKzZ_VDoDfOEoStws1h80WZBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEzNyBTYWx0ZWRfX0AumyfXq2xYB
 jFJH6bzaPfiE7ey0EmTn3v0/7nvXBFD2Oy6+648CDcUk0KV+4ZUS71OFWkGIsU6UShLGT8sRdyq
 LYnxVtK+bPlZiQ9rEYD47FFPiZaOzdlHiG93g1Rn+G0kG3zlyMI/tR+aaRHOMFMWDhKY9CS3kwk
 oAsnrG3Dp1RvyIc973QM89jQ2OYaqlc3/MrJMgdKGKpZEuTiYEkIzDiGaCT5H85N9ap0akrfCJv
 WswQOU0Wu0TAVHjiwfutDbyBmPwImJalKo3hEX80SixMO3GWH3fIO5j2ErBcPeX3MpCuBXfqoWT
 q+/5Ay5FYxd1/Z29ZIMqVnhC06XkRm+M0CJwAAt6eBsdz94hQRh4AQX0VhDp31vH/pKQUcJjitC
 ckYpAKysmKEgDSb2MKf+p4VT/beKNg==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6914bc85 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=8+dZ2YuSHRys20a4ijOkGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JGhpyqB6T-AhYHNvuAAA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: qsXPDrNLKzZ_VDoDfOEoStws1h80WZBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120137



On 11/10/2025 8:44 PM, Bartosz Golaszewski wrote:
> On Sun, 9 Nov 2025 at 15:38, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> Currently, there is no standardized mechanism for userspace to
>> discover which reboot-modes are supported on a given platform.
>> This limitation forces tools and scripts to rely on hardcoded
>> assumptions about the supported reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it to expose a
>> sysfs interface to show the available reboot mode arguments to
>> userspace. Use the driver_name field of the struct
>> reboot_mode_driver to create the device. For device-based
>> drivers, configure the device driver name as driver_name.
>>
>> This results in the creation of:
>>   /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the list of supported
>> reboot modes arguments provided by the driver, enabling userspace
>> to query the list of arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 62 ++++++++++++++++++++++++++++++++++++++-
>>  include/linux/reboot-mode.h       |  2 ++
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 873ac45cd7659b214b7c21958f580ca381e0a63d..582aa7f8ed7fa485c5a67877558c9b15d3600ef4 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -6,6 +6,7 @@
>>  #define pr_fmt(fmt)    "reboot-mode: " fmt
>>
>>  #include <linux/device.h>
>> +#include <linux/err.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>>  #include <linux/list.h>
>> @@ -23,6 +24,8 @@ struct mode_info {
>>         struct list_head list;
>>  };
>>
>> +static struct class *rb_class;
>> +
> 
> I know C is a spartan language but the rb_ prefix makes me think of
> the red-black tree. Please call it reboot_mode_class.

sure will make it reboot_mode_class.

> 
>>  static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
>>  {
>>         const char *normal = "normal";
>> @@ -65,6 +68,51 @@ static int reboot_mode_notify(struct notifier_block *this,
>>         return NOTIFY_DONE;
>>  }
>>
>> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +       struct reboot_mode_driver *reboot;
>> +       struct mode_info *info;
>> +       ssize_t size = 0;
>> +
>> +       reboot = (struct reboot_mode_driver *)dev_get_drvdata(dev);
> 
> No need for the cast.

Ack.

>> +       if (!reboot)
>> +               return -ENODATA;
>> +
>> +       list_for_each_entry(info, &reboot->head, list)
>> +               size += sysfs_emit_at(buf, size, "%s ", info->mode);
>> +
>> +       if (size) {
>> +               size += sysfs_emit_at(buf, size - 1, "\n");
>> +               return size;
>> +       }
> 
> This is a weird logic inversion. Just do:
> 
> if (!size)
>     return -ENODATA;
> 
> return size + sysfs_emit_at(buf, size - 1, "\n");

Ack.

>> +
>> +       return -ENODATA;
>> +}
>> +static DEVICE_ATTR_RO(reboot_modes);
>> +
>> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
>> +{
>> +       int ret = 0;
>> +
>> +       if (!rb_class) {
>> +               rb_class = class_create("reboot-mode");
>> +               if (IS_ERR(rb_class))
>> +                       return PTR_ERR(rb_class);
>> +       }
> 
> Why the lazy initialization here? Is there any reason you can't
> statically define the class? Don't you need synchronization here if
> multiple drivers try to do this?

reboot-mode framework does not has a init. Should i add a inti_call
here and create a class? Can you suggest a bit more.

For if we at-all continue this lazy init, will add a lock.

thanks,
Shivendra

