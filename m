Return-Path: <linux-arm-msm+bounces-114464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlbuIdzhPGr3tggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:07:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAB6C3932
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:07:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T75yXsmX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AlcxS5Iw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114464-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114464-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F02F130453AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C3236EAAC;
	Thu, 25 Jun 2026 08:06:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153F364059
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:06:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374787; cv=none; b=E0kKCy/L7KnR6/kd2cLAkza/kmhlcpVxOeZd6cswmxGWfB1cjXXOv2TSxZHmbWRA7mNYrDChEvh3Rnv4fwglSeJ4Kem1CuYRsVOMMr7fwy6+wzG9qT7vu4LjvPLzvCsg7LGuO3FdIENTRXOoXHdWbUNol89Vfm0W9IGEdszpdSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374787; c=relaxed/simple;
	bh=y7Givp6X+aHHBI7D4NAQtzaleqZk4shz9K/FoR0Z23w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcDeIGHk/93CKLO2pbww5aPTHH+urZPB0flKKEtUNSGw7Nfr3toFcNoPe35lG7WLVkp3QRBwwtASWuKxs1QcbZsJslOhWfOVMvLgIhy8e5M8ixFsOkneHOS4jqGnNN6an4vIPqxnLgCR3llZdSImxWj00D67O84vqc4Yuzn2hAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T75yXsmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlcxS5Iw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eExb904482
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiTYF92nSDl/4Cdblj7cmFe0JGBHT9SI/7orZEEf9e4=; b=T75yXsmXJv7isYBE
	40LBndD3Rh7AouPB6NXSwYow0LsxdNRwgLS43cQwn77xb7xDUENGdDeFOk06M8jJ
	AR2psNsWMMMBnkMns95ocdURl2EIEtU1vexgrO5fIGneLLLV7835+btG5rcMzLRJ
	xHML7Wwtt2KpiU8L1sYdFwa3nMD2qqqYWT/qyXXQyao1xkXL1Ec6u2bV6SPwetQs
	hIsc1oayauRr+0rVNWDbHxRTNPeiNzdUZ+/pCu1z0VnAnNonN43i8YhnJBC9B05U
	OnAh4cXWXyItrAUkSC6RH7Q586RuMMPHHDEt/rlE6m96B4tG6QsUuLD1kewFctpc
	9L3pmw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dua0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:06:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8de788f368cso33074106d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374784; x=1782979584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiTYF92nSDl/4Cdblj7cmFe0JGBHT9SI/7orZEEf9e4=;
        b=AlcxS5IwSHcRN1HdsWMHiUv5mlaiwOEyIhdgQeEVrsHg37YSAsMIHvlAyxd86inTFb
         brlgMd89i121CmYpl2S5oatF3eANfD7utWmMTx1KRynpHUkXxARSmSL1lvyS96vbQ+gI
         lql2FjWmTIR1MvWvw1a1lqoS1+6ijKBAJHPse+kv/Nqkp9ccNiaqXCbhkIeJJMiivUke
         65YrdWlDTNw8/E4PcuCAQzYMj0Zhb55uGMg5tqYI8CLMdyGqzEepg/kinS6ZRfnpCj8G
         +1Rhm5vR+wjwFXuLgQYoBcbHUcfWPdECjKfzUR+GGKOpHRoNAwocy839fpJ4D/8CAzCQ
         Gy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374784; x=1782979584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiTYF92nSDl/4Cdblj7cmFe0JGBHT9SI/7orZEEf9e4=;
        b=kHn9TK0koyeVoLbtF8MPIK3UTp0f0MjWL1PJu8aLX7C0A1gdoz9SKs69Ci7w2+2LXC
         z5msWZgxASEkeqlUbxZS0RRKeidTexPdd5HJzdoObI0Jpko7xdEMIxpYWZWadKQL2RBb
         VMt6uxlQF5I5MkMH1FaQ87TOs6z80NRKgEBx1FjMOTjGcamm6Morvbpl967hX47lXiW5
         vbezqnmfktb96crzr4/ceuyhREmkp83izHVA/kL3mTmi7gnM622U3damnFIyPljzBmNU
         RQ7A/V4DmnaCS55eHgCiqKI1bu4E4AEzfqbsGbqKV73w3Auo0PMKpopf6jAUldw1gMIm
         55gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xkCfV4cgg5PzdTUYfO83PzrxUEJmx+omrOz9nEAbPYmrBhZOZ7BXAPOPpb/WihGmw/UssrE3FvIzd8Q6a@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNZuyhLlOuRzZKu79tKRl9Ji0qnV3bg4uDVt30NJ11jjcXaWT
	W3vomPbCljZmCp+zcM3i/M0dzd3zh1QaV7BLxzULN5VTO8UvKgWBqn41SVMg1Fvu/0KUPIGdgv9
	FPTALFHp8FBF4QNzjVlQoblCeT4eWdcwsQz+Cad59O1dIe8Ckce4OREMBiHySvxbkbBTW
X-Gm-Gg: AfdE7cmrggcvi/dga1wxUtX/GxP4NpetxgKpqUpGz8caPD9e3l2DVCS+m0Ga61bPz1v
	e6GQ68CsT0Jla8fP3Ym8PQifZGYnS5NgjOPsVbyOfaF6Nl65sfJR2fA9pe8bk4ORcHKRwodBLlB
	NwTHJ8lIwtSemKH4+p4KNsg2uiXagVCjGTIz5ogqTQyYYB4hwozlmEL50TdInG7jirbZ1Cf7mPG
	eebFHVfSCsRnkvGiE03Osr77xd21i4owFaxnYGO0zCGB55pXV1+Tz3Pm95QKWpviIvJg8yQcjWl
	ByBgWdLQLr9w4PULoNk26HNb+AkeQOhMPiSI4eNKROmMTpXMzodAw+HtXs5DVVStthRAziwrqgo
	RmLvLu3rpXsQqCo23L9sPh5WHpZ/mKoQvWTmN5jGhQQ9Hsy5Q90ce1o6q0hqwDOQPuWkRmmhwcA
	==
X-Received: by 2002:a05:620a:270a:b0:915:8502:f7fe with SMTP id af79cd13be357-9293a8ac13dmr199638685a.15.1782374784337;
        Thu, 25 Jun 2026 01:06:24 -0700 (PDT)
X-Received: by 2002:a05:620a:270a:b0:915:8502:f7fe with SMTP id af79cd13be357-9293a8ac13dmr199632685a.15.1782374783889;
        Thu, 25 Jun 2026 01:06:23 -0700 (PDT)
Received: from [192.168.10.101] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492640260a6sm55742065e9.6.2026.06.25.01.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:06:23 -0700 (PDT)
Message-ID: <1758c25f-869e-4500-9fa9-899f6fd121db@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:06:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jfHAJ3HVFi3cZ3lLtEe7MAOHCMjn89Vm
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3ce180 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=N9XqOlSSuhmkvUBdvI0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX4TB5yyteHEC+
 4A8BvxvIuCW8XkM8WRs1oM70tBwPaK4oSqKiRVO4QCbwEZiQxhIRZ2sqS5scrukgRY0r1iQJpJS
 sVbB7PrPNRLCroc5h/JD6kYG/MtVIbM=
X-Proofpoint-ORIG-GUID: jfHAJ3HVFi3cZ3lLtEe7MAOHCMjn89Vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX9vlT7khV/H5K
 K1JHCQBAVP803G8XI0vyX5vHKF4YhH0yXv56rJhEBBfu0aZc+HiskD95rSZNXjKpydRQe0pdUci
 BAn/dIs1yoe+KoOESN1MTlja9NZ5PzCh/+GfdeN98jC7ec7DVVss10XOAMlgG4NBJKb9P3GW6Xz
 /JYyikmisEBPR2bd5lU/RXnp3wR02HwhFM14FTR3qr/sx1mqHQ/4//q37fhT4PDacr2x61QmhHa
 q59qMIt43JJyYC/vI2n5gY84rTQOaKdb48ITqLhHPVUR74AuirLo2nXvG2V9tLcYjCNUUAapIF+
 JU3MfXLD7DgOZYrW8a9mnEIWLFO6T0smnGUeqvLvEEGGXyzC5hi9tHy+IDXVWgCUyzESse+eIaz
 SF8ub0IQ2JjwA2BtXe9VL76yCQlKOYLzRewuhy73QGuVww0JFKnfolgsC0sAzTs2oJKaD/I6J1q
 I15xqrefmsxmEAggsVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114464-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCDAB6C3932



Le 25/06/2026 à 10:03, Konrad Dybcio a écrit :
> On 6/24/26 11:08 PM, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> [...]
> 
>> +	case hwmon_fan:
>> +		if (attr == hwmon_fan_input) {
>> +			int lsb, msb;
>> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
>> +			if (ret)
>> +				return ret;
>> +
>> +			*val = 0;
>> +			*val = lsb + (msb << 8);
> 
> '+' looks funny here.. although t14s_ec_read() only reads a
> single byte and assigns a u8 value to the u32 that's being passed
> to it, so it never *actually* breaks..
>   
> [...]
> 
>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>> +	.ops = &t14s_ec_hwmon_ops,
>> +	.info = t14s_ec_hwmon_info,
>> +};
>> +
>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>> +{
>> +	struct device *dev;
>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>> +		{ T14S_EC_SYS_THERM0, "soc" },
>> +		{ T14S_EC_SYS_THERM1, "keyboard" },
>> +		{ T14S_EC_SYS_THERM2, "base" },
>> +		{ T14S_EC_SYS_THERM3, "pmbm" },
>> +		{ T14S_EC_SYS_THERM6, "qtm" },
>> +		{ T14S_EC_SYS_THERM7, "ssd" },
> 
> Makes one wonder what happened to THERM4/5 - may they be dedicated to
> the 5G modem, perhaps?

May be, I sticked to the documentation description which is not 
describing THERM4/5



