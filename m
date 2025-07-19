Return-Path: <linux-arm-msm+bounces-65736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1CB0B093
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 17:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358333BE220
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 15:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9207F2882C9;
	Sat, 19 Jul 2025 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhkpmHk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1223313E
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752938021; cv=none; b=UGQJqQ/wPmJcCVMkAOc37i97mQrhXulFn/7BYDmwEqWBJagRLmxYNjwvijOCGVomeo25PpPpbq4PsiU108UyCOiFLHv43yArX6HqgB7c/VQgclqN7KH/I7A6zRni1n4AErAZ46v6b8ex3Y//ofBWBh30XjyrbkGRmZEQvDeE0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752938021; c=relaxed/simple;
	bh=LHiSpD9ddzHXs5xA36UiO0jJfHyA3jmQvsxYCvrKPJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhl37NkZKA0/RQW7S6H0ns0UFCbDlNnk5N7PjLJ1SqJb01s7Sk/mcLgAe3kMnJHqTJgo/ladE2qvZSXA//Ssu2DqTzLCzRjEsR135kxeztK7574gEXOOIrg0Wg9jfbPIId76hM6fp51XmAOB92ZWO0adfqHkcp/aaHPKfelqXXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhkpmHk4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56JEAa0r019495
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 15:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4yenXeA82Xv9d2lazGQ09pdNlii0X5jAguSOhQVfak=; b=lhkpmHk4TYybt0y8
	0w5Yus7BwA+TFSsHgD8uulAJs9hfpI2uj1Fk8Z5TVCGApXfauPjl7PmlW4QUy7HY
	tZx6SmbTpNPfB9XJz3ieDpUziuH793PV0vmUrVRifKW34d8T7V/ViymRSxIC15yZ
	tuEsv7qkHgXO2GoFjPHks40BJJ9vH04I+VhzYqF/PhN80jE/V19m/52fQ5kredkc
	N/Zgn8JQ/Lzx3G6m3MDznOzvzHnRfapYsPyuNs+BfmuPlzJ9o8nn/wZa1ANqUKjF
	HqoeHVKgm6kvd84Uf3lrfUSE02NCRWIevNG1H2w9hoF20nkutJjW7FoB0Aw2emJu
	65PV6A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048t8t83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 15:13:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f38d3cabeso600492a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752938015; x=1753542815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4yenXeA82Xv9d2lazGQ09pdNlii0X5jAguSOhQVfak=;
        b=p3iIJWzdIqbGv6QzMtox4yPhZPCQjsVMtrCxzq3e0sJZj5ptWh4wjs7gjFIrvKX8og
         Jf+Druksat9dhUFBNXHKeguxCWxSYxFj6TqpPBb5ZP8ciYxfdnspov711es8Jw9HyQfC
         Wv25xETZ3FUXBQyzlFQUwXvabklwbXDdLYV+dXxwSMA7zC0TCiGqAFlI52cMllVoBV7I
         Unia2H3lHwvjioeH7AW6np//ySdo1ipJRTR5wUMdFlzUCs2aecL0JNDE2UlAPZ9H5slb
         B2HdJS5mmQjoSoIJMHQemqjCPKwQCmZv8Vvj181IEChFhQmzMyN/5xnidTiDMtSM73LF
         DdsA==
X-Forwarded-Encrypted: i=1; AJvYcCWMtfJN7Eu3OjhwmcLgqJ1kfQcbR4qIltEXU8hU+ZPbmdkgmlR0/WKKLLL3R+wwa+37nzxE7LhoOm83kLxl@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbpgHASUgD25a/IgcfHPEZUftmK4SGo1D6dVIN+EhEp8Gbi74
	MtwHq1tFjbqm5UTKvyjcljZ/OlUnBArl9mLZIIAEcsLnrBz/D4QDeFNfJs8SxbQj8kWSjJvG62n
	bneZCmmJP4XNGe5eLOXd8Bs5nctbjgnEKgHZLcR1XirdDuabqe5LiZCP+kaJviQxOGMTy
X-Gm-Gg: ASbGncuydWafWpwlMahqh7w0NeNUY/505r865Oo+JtX0B9ueThbIr2BSUaAHVTSPjE7
	2a04icAsBhOjqMr0rbUCQLtRvZGwc8DOaBj9QqgZHP+FzE3MkoXJLrfgoVJdraSzJ4QMi2zPaP/
	IUWkdez2SqVFhOKmExU8JKDmzl7e1HsBEVr8IGRioHT8JzMCYaoSBf9OiB67U7kNtxcDH/ic9tn
	xFOz+wld5zuuGxxvn27nwVj6jtGXbe3Qvre3iCynExWTT+C/RybAF86+Vnvkcig9JZOklZY6ZHF
	bfP7fYugs1L5uhg5/mhwO9Gwlb2lEk8xRu5V3eHlu087+XWMoSUs0O17GNkxRs1B/zia2ZJ9CLA
	4
X-Received: by 2002:a05:6a20:7288:b0:234:6752:3990 with SMTP id adf61e73a8af0-23810d51028mr20981355637.17.1752938014946;
        Sat, 19 Jul 2025 08:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzmo2GUvd5Jo/4KSwDINSwLCCMWzD5il+U3EunZk8kHN8TP0NkWz6wI5LF7R6azoXh6FMvVQ==
X-Received: by 2002:a05:6a20:7288:b0:234:6752:3990 with SMTP id adf61e73a8af0-23810d51028mr20981321637.17.1752938014405;
        Sat, 19 Jul 2025 08:13:34 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ffa9850sm2781064a12.65.2025.07.19.08.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 08:13:33 -0700 (PDT)
Message-ID: <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 20:43:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64 bit
 magic
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
 <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDE1MiBTYWx0ZWRfX7/4ARWV1L1zv
 dKkj5VamQiDZAtze68WaS4Zf7Dc+gqcs0sFQARzaYVNWb43ZTzkkRatMdVH9t6/Wi8hB4QMgwWf
 bntU8VO841LW8OcuL5/vhpRJHXg2OX8WiUI/HGFlb5DDROhcFf/HjcAv+YnYD7qkPqc/yT9b4if
 CAnRNgLbGbLHXSJB5TOJvuOVOxu8RZMvBVj9XL6Juo6tteAnSr8nSD0X5F9VoiZbn+eaw8NTp37
 GFnIbP183uGZUei3Wx6aubN7f/vqMB8x1zTw160hvou3IDarfJEaYW6odW71rhlX5TcaNV2gKEO
 5hQT3xy9I6df9avFPyu9N4bh+Dja06End8V6VjwOo31/Slart9NqOUiANuRPYCCByGl5NnDXqpR
 GNKPhcCRjYnJT+yIf0jDzmOJqtclKc70sb8HTYDDW1aAwy12LHfahGVD5S1Ct7iQevSuEsQV
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687bb620 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=PsbcbGlCJbaar3GLNM5paQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=inMTZjCaIjW8_VgAgDgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: TOZ1hoW1yn1tUxW9MLxFJoHas71KdPfa
X-Proofpoint-ORIG-GUID: TOZ1hoW1yn1tUxW9MLxFJoHas71KdPfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190152



On 7/19/2025 12:10 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 06:16:48PM +0530, Shivendra Pratap wrote:
>> Current reboot-mode supports a single 32-bit argument for any
>> supported mode. Some reboot-mode based drivers may require
>> passing two independent 32-bit arguments during a reboot
>> sequence, for uses-cases, where a mode requires an additional
>> argument. Such drivers may not be able to use the reboot-mode
>> driver. For example, ARM PSCI vendor-specific resets, need two
>> arguments for its operation – reset_type and cookie, to complete
>> the reset operation. If a driver wants to implement this
>> firmware-based reset, it cannot use reboot-mode framework.
>>
>> Introduce 64-bit magic values in reboot-mode driver to
>> accommodate dual 32-bit arguments when specified via device tree.
>> In cases, where no second argument is passed from device tree,
>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>> compatibility.
>>
>> Update the current drivers using reboot-mode for a 64-bit magic
>> value.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/nvmem-reboot-mode.c  |  5 ++---
>>  drivers/power/reset/qcom-pon.c           |  5 ++---
>>  drivers/power/reset/reboot-mode.c        | 27 +++++++++++++++------------
>>  drivers/power/reset/syscon-reboot-mode.c |  5 ++---
>>  include/linux/reboot-mode.h              |  4 +++-
>>  5 files changed, 24 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
>> index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..e3eed943fdefa271b22e1f1891abef5c9095b9a5 100644
>> --- a/drivers/power/reset/nvmem-reboot-mode.c
>> +++ b/drivers/power/reset/nvmem-reboot-mode.c
>> @@ -16,15 +16,14 @@ struct nvmem_reboot_mode {
>>  	struct nvmem_cell *cell;
>>  };
>>  
>> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>  {
>>  	int ret;
>>  	struct nvmem_reboot_mode *nvmem_rbm;
>>  
>>  	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
>>  
>> -	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
>> +	ret = nvmem_cell_write(nvmem_rbm->cell, (u32 *)&magic, sizeof(u32));
> 
> This will work differently on BE and LE systems. Assign a temp var and
> use it.
Ack.
> 
>>  	if (ret < 0)
>>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>>  
>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
>> index 7e108982a582e8243c5c806bd4a793646b87189f..93daf93c097f970afbaf43d36b1e4f725ca7a81f 100644
>> --- a/drivers/power/reset/qcom-pon.c
>> +++ b/drivers/power/reset/qcom-pon.c
>> @@ -27,8 +27,7 @@ struct qcom_pon {
>>  	long reason_shift;
>>  };
>>  
>> -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>  {
>>  	struct qcom_pon *pon = container_of
>>  			(reboot, struct qcom_pon, reboot_mode);
>> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>>  	ret = regmap_update_bits(pon->regmap,
>>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>>  				 GENMASK(7, pon->reason_shift),
>> -				 magic << pon->reason_shift);
>> +				 ((u32)magic) << pon->reason_shift);
>>  	if (ret < 0)
>>  		dev_err(pon->dev, "update reboot mode bits failed\n");
>>  
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 0269ec55106472cf2f2b12bd65704dd0114bf4a3..1196627fbf98d87eec57a3d4ee544e403e6eb946 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -19,12 +19,11 @@
>>  
>>  struct mode_info {
>>  	const char *mode;
>> -	u32 magic;
>> +	u64 magic;
>>  	struct list_head list;
>>  };
>>  
>> -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>> -					  const char *cmd)
>> +static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
> 
> Why? This doesn't seem relevant to u32 -> u64 conversion.
yes. This function is no more needed. Will update it for u64.
> 
>>  {
>>  	const char *normal = "normal";
>>  	struct mode_info *info;
>> @@ -35,11 +34,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>  
>>  	list_for_each_entry(info, &reboot->head, list)
>>  		if (!strcmp(info->mode, cmd))
>> -			return info->magic;
>> +			return info;
>>  
>>  	/* try to match again, replacing characters impossible in DT */
>>  	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
>> -		return 0;
>> +		return NULL;
>>  
>>  	strreplace(cmd_, ' ', '-');
>>  	strreplace(cmd_, ',', '-');
>> @@ -47,21 +46,21 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>  
>>  	list_for_each_entry(info, &reboot->head, list)
>>  		if (!strcmp(info->mode, cmd_))
>> -			return info->magic;
>> +			return info;
>>  
>> -	return 0;
>> +	return NULL;
>>  }
>>  
>>  static int reboot_mode_notify(struct notifier_block *this,
>>  			      unsigned long mode, void *cmd)
>>  {
>>  	struct reboot_mode_driver *reboot;
>> -	unsigned int magic;
>> +	struct mode_info *info;
>>  
>>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
>> -	magic = get_reboot_mode_magic(reboot, cmd);
>> -	if (magic)
>> -		reboot->write(reboot, magic);
>> +	info = get_reboot_mode_info(reboot, cmd);
>> +	if (info)
>> +		reboot->write(reboot, info->magic);
>>  
>>  	return NOTIFY_DONE;
>>  }
>> @@ -78,6 +77,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>>  	struct mode_info *info;
>>  	struct property *prop;
>>  	size_t len = strlen(PREFIX);
>> +	u32 magic_64;
>>  	int ret;
>>  
>>  	if (!np)
>> @@ -95,12 +95,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>>  			goto error;
>>  		}
>>  
>> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
>> +		if (of_property_read_u32(np, prop->name, (u32 *)&info->magic)) {
> 
> Again, somebody didn't think about endianness.
Ack. will update this wherever applicable.
> 
>>  			pr_err("reboot mode %s without magic number\n", info->mode);
>>  			kfree(info);
>>  			continue;
>>  		}
>>  
>> +		if (!of_property_read_u32_index(np, prop->name, 1, &magic_64))
>> +			info->magic |= (u64)magic_64 << 32;
>> +
>>  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>>  		if (!info->mode) {
>>  			ret =  -ENOMEM;
>> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
>> index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..6783d05e80fbc2c812b45ffe69755478af90d30a 100644
>> --- a/drivers/power/reset/syscon-reboot-mode.c
>> +++ b/drivers/power/reset/syscon-reboot-mode.c
>> @@ -20,8 +20,7 @@ struct syscon_reboot_mode {
>>  	u32 mask;
>>  };
>>  
>> -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>  {
>>  	struct syscon_reboot_mode *syscon_rbm;
>>  	int ret;
>> @@ -29,7 +28,7 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>>  
>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>> -				 syscon_rbm->mask, magic);
>> +				 syscon_rbm->mask, (u32)magic);
>>  	if (ret < 0)
>>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>>  
>> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
>> index 36f071f4b82e1fc255d8dd679a18e537655c3179..d9d9165a8635e5d55d92197a69c7fae179ac2045 100644
>> --- a/include/linux/reboot-mode.h
>> +++ b/include/linux/reboot-mode.h
>> @@ -2,10 +2,12 @@
>>  #ifndef __REBOOT_MODE_H__
>>  #define __REBOOT_MODE_H__
>>  
>> +#include <linux/types.h>
>> +
>>  struct reboot_mode_driver {
>>  	struct device *dev;
>>  	struct list_head head;
>> -	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
>> +	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
>>  	struct notifier_block reboot_notifier;
>>  };
>>  
>>
>> -- 
>> 2.34.1
>>
> 

