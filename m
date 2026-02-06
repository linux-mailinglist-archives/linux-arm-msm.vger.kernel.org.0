Return-Path: <linux-arm-msm+bounces-91995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEX0C0u1hWmbFQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:32:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CBFC0FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 851F53049175
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7247035CBB4;
	Fri,  6 Feb 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2KnBvaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hevppbtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41530CD87
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370065; cv=none; b=LT8ozeiNjeL7dc3FnGuOiYnyKIyZCRL7fwWYkaUigj+XU3iRdOMX/OgDyXu7FJyP49OLdsJJ55zHSVnVJeAwKvtjcisOS2aEOgxzJZGJNMH/5mY4rAhch2i7iM4bI+/XEq3NlKCSDHxidbOxG3eGAHf5e9sTLM6RmS6pVOv73bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370065; c=relaxed/simple;
	bh=kVJ0oc2XsYQQ2Gxf+FhnDB0t3X56Tnw2t5+EdWhpsBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVSop6mOGjrcgiDCWOwygPRJIFttv1+QFdWftkkTBC0iuIga+MdovO1tx676JtjpZnS64NWQoqbQ5a8rwzlwatCBGKf1TdF9ci1BgzD0Cj58fk39beNXRBjsiNGFaObKe99EURhDEzPr5KHVdEKAzCBCKChgd69pHndXcjOPHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2KnBvaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hevppbtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XspG1853178
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYUbkmp+idEtsYFQBmZoCdvXyZKJdkMDyJrserH0iQE=; b=Y2KnBvaKV9t8IgRj
	WjRyaX3DpADa/v7fX+/0evFiJhj2df0vUbFILFeri47NU+PiM2zs8A6b8C5gl8b3
	D13TawLHAH+e2np/awdGtnyOOMadSQTLFVdeYudyYHBfZqTZQZ6TIeTcaFgtU3hs
	UgfUtVMTLiDADexwQL+xHpWCGAMnjDbT5VOYHCmkLRmKgbUzdJGlGE4Ohscme6nQ
	SPeXdouhrFob5+82XacJ9oCvCmjjViFJj9QcQcbwSiJPNaL1W/iQdDohVbLkah9F
	rjHbk1qz85NAp5gyT7NkMryl//5t/SymIB9s1ETujHhBNFt/6z7l7lspWqVs94uF
	BgQF9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148c5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:27:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c709a3a56dso94910985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770370063; x=1770974863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYUbkmp+idEtsYFQBmZoCdvXyZKJdkMDyJrserH0iQE=;
        b=hevppbtmpiRAiWoYCgcTEtj+ngsRY67ugLzMhWqr2BzQdw+wh3ONJUY7Dh19IwHd6f
         sSTczYf4jbZLHHkHruZkvcss9jHnX4ECAweMZi2l7gCkY4e4C9uBmRhpFLYWiuUWyTRh
         OrEa3ItFulDEVil4UhCOWeL37MxAa5SEwhIiTCE009tUM5C69QRAXymCmu+FgiQa4oEu
         iyJvc/RtU2WBPkQnbhiSo4hq2K09b06XPagkSngt3zF9x/YolAEin2qP3MANcSODtXp9
         95htqC/uG5a9JedPVw7t56FMcHf8RsqWCRGrIgT+kfeE6kszt+V25iyoz084a8Grxo3U
         RrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370063; x=1770974863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYUbkmp+idEtsYFQBmZoCdvXyZKJdkMDyJrserH0iQE=;
        b=Zx0ieHP3CjauqH4bKgcnISL3RnD+BOiN6zIBf68XcNtRYZWVX6n+3a42Ai+BHuPWAW
         bg6JrWuNf79Kn/BSW0Ms3x2wAKZLrYLl6TsFjyLYfb/ssrab0pruvQSfNMjO3h++OjEM
         Ocbv2bmjn/J9177ecXEVqOKdfpUF7mzVSTqzUd/bcJbHkS5v4hQOIlyfScg5EoFoxYPL
         YXQ7J/W/UnwQye/g18/Y+KC3V64UNMVpzOJBnLBasq0/9zVM0zTpbmxf0jCunMYnTrMT
         Pm0BIGz2T0tq4j+LmmAgUSE83V1YTfv2yLsqDdD4khhhuRW3dO0SAtUU05Nc7iNIStW3
         Sbaw==
X-Forwarded-Encrypted: i=1; AJvYcCU2PY8hWfeQYp2Z5kMJNoH6cssM9iNT5/Z+hCAf1D8eUC3OxJL9XIVNdqSR6vlvvPDMWcWTfDKgKNvLO6jP@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJ6Uc0oDqq7AWKAWEabzozxt03en4FjMf8UVPR+npFoo25BpI
	ZVp4yH9sOOo4Zo5zLzWcLt3GiJ5TmXlPfLPqrsUAVHykzWtEz8Yal+eYUTzAKf2u1MTj3fkUtyv
	DY4JvU9Ib8ZeWu7g5mujSMYySBH3h97vOKpaMxdPG1Of2smQ7Yl+88j+BowOdpa7L7/x0
X-Gm-Gg: AZuq6aKZWtbWDU5ceIhHip4ZbmiCmN8GF3PsKLfzI9qeaFNpebYUTKDXNzThNN/JyRO
	wVqRsy1Bxvn0YDbvfTqSEML9HLrnXdc371JHFMDFtTkr+94IUen+hobfzA9ReslzgE62zfwxA7e
	DSzsiqkr8IKe+R7CpROgKNQGyMPaV2aTTqwZfJjrhiqXZIBTZJav7aw2F5xzU0C9sUsY8br2cTh
	w83oUSr0S5Q6rvIat8kSBqFt90thtfXAnKiZAx9MLltcNrGYiZL0C6/XK/cBjuGPOEuq0qfmIhB
	VxPKf3fUfWCbapvePh+3vy4pTxRYj/EU/h+sogurNiZFLkjaERTaGwpilBT8zszS/V86F4nP2j4
	u0JfZ75tBEhjdpi9M2iCC7w+gqqZqASDnMjA+e7Kd7AuJozdKB+vJ4+cjW4IbgxXj0ynMLb7uz7
	kAwZE=
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr205601685a.1.1770370063469;
        Fri, 06 Feb 2026 01:27:43 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr205599485a.1.1770370062996;
        Fri, 06 Feb 2026 01:27:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65984019d78sm384407a12.25.2026.02.06.01.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:27:41 -0800 (PST)
Message-ID: <7911bbae-c507-4420-a05c-89242941f774@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:27:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985b410 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=543Mn12OrukPu6d3EUcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MiBTYWx0ZWRfXyyLbnUskz4SO
 7qN7Mr6PR1/p3X69ga42FJFV7xfv8T5HkLIsk63q16bjhhFElJecKFsVUFY7SNqL5uzSyNTWTxF
 TyWf5aVLmCWljscFLtgwEIg6hwts8c3He17QuZny6PLoRFreTYV3gGW4WVUFtCAZZMyv1rgyXfk
 yq1IqXsCfV5cxbNyy3kUNus1970MNoVlKAyGZ9DsPe9hGJrg6Mr+nTgfB3E4cq0oTD6RG7GE2cF
 VTxp9/q+lI5eSvEEdyqvBcNLefw4esw9Tz+MMIw6NcZV0tpVwP+c7b8AZUs/Pdq2FjIcPFIr574
 JFKgUEtol64dCDSBx5TUu8Y4v3Je4Itr6ZBIJVE/XdqOcQWDX1z3FGiHzYw7/ziUgRGymv2gb5z
 5DZ36uzwS0+S2U2HG1ZROW4suylMQMpkq8deN2Y5x67EUT4lK9nInfVpKmJB9l17uwgPb473ouu
 KZqJ72CiSgaCv6okxBw==
X-Proofpoint-ORIG-GUID: ARGNFDj6UWAjCrhLm7rSXDxyjPH79RyK
X-Proofpoint-GUID: ARGNFDj6UWAjCrhLm7rSXDxyjPH79RyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91995-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,alarm_poll_work.work:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C41CBFC0FA
X-Rspamd-Action: no action

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
> monitor driver. The BCL peripheral is present in Qualcomm PMICs and
> provides real-time monitoring and protection against battery
> overcurrent and under voltage conditions.
> 
> The driver monitors:
> - Battery voltage with configurable low voltage thresholds
> - Battery current with configurable high current thresholds
> - Two limit alarm interrupts (max/min, critical)
> 
> The driver integrates with the Linux hwmon subsystem and provides
> standard hwmon attributes for monitoring battery conditions.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +/* Interrupt names for each alarm level */
> +static const char * const bcl_int_names[ALARM_MAX] = {
> +	[LVL0] = "bcl-max-min",
> +	[LVL1] = "bcl-critical",
> +};
> +
> +static const char * const bcl_channel_label[CHANNEL_MAX] = {
> +	"BCL Voltage",
> +	"BCL Current",
> +};

Let's strip the BCL prefix

[...]

> +/**
> + * bcl_convert_raw_to_milliunit - Convert raw value to milli unit
> + * @desc: BCL device descriptor
> + * @raw_val: Raw ADC value from hardware
> + * @type: type of the channel, in or curr
> + * @field_width: bits size for data or threshold field
> + *
> + * Return: value in milli unit
> + */
> +static unsigned int bcl_convert_raw_to_milliunit(const struct bcl_desc *desc, int raw_val,

raw_val is an int here, a u32 when you retrieve it and a s64 in the math..

> +					enum bcl_channel_type type, u8 field_width)
> +{
> +	u32 def_scale = desc->channel[type].default_scale_nu;
> +	u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
> +	u32 scaling_factor = def_scale * lsb_weight;

Would this be equivalent?

if (field_width > 8)
	def_scale <<= field_width;

[...]

> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	bcl_read_field_value(bcl, F_V_MAJOR, &raw_val);
> +
> +	return raw_val;
> +}
> +
> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	bcl_read_field_value(bcl, F_V_MINOR, &raw_val);
> +
> +	return raw_val;
> +}

Do we really need so many read-1-value functions?

> +static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
> +{
> +	if (bcl->in_mon_enabled)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
> +				in_lvl_to_attr_map[alarm], 0);
> +	if (bcl->curr_mon_enabled)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
> +				curr_lvl_to_attr_map[alarm], 0);
> +}
> +
> +static void bcl_alarm_enable_poll(struct work_struct *work)
> +{
> +	struct bcl_alarm_data *alarm = container_of(work, struct bcl_alarm_data,
> +							 alarm_poll_work.work);
> +	struct bcl_device *bcl = alarm->device;
> +	long status;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	if (bcl_read_alarm_status(bcl, alarm->type, &status))
> +		goto re_schedule;

Do we ever expect regmap_read to *actually* fail?

[...]

> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +	int ret = -EOPNOTSUPP;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +			ret = bcl_in_thresh_write(bcl, val, in_attr_to_lvl_map[attr]);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;

Please don't "ret = ...;break;, just return directly, also in the function
below

[...]

> +static int bcl_curr_thresh_update(struct bcl_device *bcl)
> +{
> +	int ret, i;
> +
> +	if (!bcl->curr_thresholds[0])
> +		return 0;
> +
> +	for (i = 0; i < ALARM_MAX; i++) {
> +		ret = bcl_curr_thresh_write(bcl, bcl->curr_thresholds[i], i);
> +		if (ret < 0)
> +			return ret;

This too, fails if a regmap_write() fails and leaves other registers
unconfigured if that happens for $reasons

[...]

> +static int bcl_get_device_property_data(struct platform_device *pdev,
> +				   struct bcl_device *bcl)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret = device_property_read_u32(dev, "reg", &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	bcl->base = reg;
> +
> +	device_property_read_u32_array(dev, "overcurrent-thresholds-milliamp",
> +				       bcl->curr_thresholds, 2);
> +	return 0;

If you don't expect this to grow, just inline it in .probe

[...]

> +	if (!bcl_hw_is_enabled(bcl))
> +		return -ENODEV;

Please make this print a meaningful error - also, should we expect this to
ever happen, or would it mean that the bootloader (or something) hasn't
configured BCL prior to Linux booting?

[...]


> + * enum bcl_channel_type - BCL supported sensor channel type
> + * @IN: in (voltage) channel
> + * @CURR: curr (current) channel
> + * @CHANNEL_MAX: sentinel value
> + *
> + * Defines the supported channel types for bcl.
> + */
> +enum bcl_channel_type {
> +	IN,
> +	CURR,

The enum defines could use a prefix, say CHANNEL_CURR

> +
> +	CHANNEL_MAX,
> +};
> +
> +/**
> + * enum bcl_thresh_type - voltage or current threshold representation type
> + * @ADC: Raw ADC value representation
> + * @INDEX: Index-based voltage or current representation
> + *
> + * Specifies how voltage or current thresholds are stored and interpreted in
> + * registers. Some PMICs use raw ADC values while others use indexed values.
> + */
> +enum bcl_thresh_type {
> +	ADC,
> +	INDEX,

Same here, THRESH_TYPE_ADC

[...]

> +/**
> + * bcl_read_field_value - Read alarm status for a given level
> + * @bcl: BCL device structure
> + * @id: Index in bcl->fields[]
> + * @val: Pointer to store val
> + *
> + * Return: 0 on success or regmap error code
> + */
> +static inline int bcl_read_field_value(const struct bcl_device *bcl, enum bcl_fields id, u32 *val)
> +{
> +	return regmap_field_read(bcl->fields[id], val);
> +}

This produces more characters than it would to inline the function

Now, that doesn't mean it can't be like that, but it's certainly curious

Konrad

