Return-Path: <linux-arm-msm+bounces-117553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f1MuKHINTmo1CQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:42:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01117723472
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DerzV+u2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OpaLE8KK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117553-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117553-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5337C301F7BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB31C4048A7;
	Wed,  8 Jul 2026 08:39:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F57403120
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 08:38:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499939; cv=none; b=URAdPdSGH53OvZ3q2A8y4baiM5Z71d4h18HNbD5HPWoJdPBo5pyvlkqzik0+5Mhd3x0xZ2tgev/0g6pWvr47No7Ui9qQgJsujFsXILP/MBmKkl7FAmxVTLOZFhrasz5RNKS9hH4Ihb563/T2lCaYI7Fkw7c1kE0Wqz0qzAqEoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499939; c=relaxed/simple;
	bh=bgB4zWzbm5nPnDgRkckzv5MlzAsLHswlLS4WHPbWaB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwCBix3hmmuipcBqm+v3NP/Pv5z+GWbq9OouGW3ThlawBUq5tvKaoDmxJUBZxrR5qcsYPaN3nzSveb1R5oQ5s3pAxDyZKo7B9dVYDN0kLaTAVfp9uUm0PL1Z7KDsnT6uQ3aGksL7ZWy/Ubtalk/4qAAKa20oz5poGW+ZEWg7cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DerzV+u2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpaLE8KK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889BRl2219742
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 08:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=; b=DerzV+u2wiT66Lh3
	OsswmCwM5fUK3oTANpYnlSvRZl2YitbN8Q/LveY4SFP39eRkc7uQX6DG/19qYZlI
	gXym09chIOTAAsDTMQ2dk//HTanp0rcAFm/5l1vQETmsttx03RLKHoKhmvWa4Nf3
	+L1DOj0DbBJ7mIZwVcjl4gGM9i9hx1oKW30gNa1w+42e6DB4boppobf+JULRRKh5
	9fdaHLtM+H+DjpFQoavXDkY4EryyakPVe7AdwpYleYyR9dahKNQSaoTPjim0sc2W
	CsM4Ld0XZ4d+FgHrjc0JXe9GV72FJB+jibLysEt7nuNYX+ZOoEV0wabJZ/qxiZ6J
	eX8JFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hgt0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:38:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517e054fe07so9284841cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783499933; x=1784104733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=OpaLE8KKdqV1L1TRgDYPoJOumjUHR82AAEc5VljF5XpTa5riC39x390CYZh0doHMzh
         iXwbFAmV5YJmmnuEbExvkcaS+SAEWhFuP23UiAwv+Kkzf8Nn90/2G9cjZWjWj++d87ay
         nWalCNKD2TRM2LeJ1psLMpWITUIM6x/gOnZ6Ue0ybQ8CVfzijXxvf3YDSUpHnyDR/GvL
         dYuy9OjE/dGXvYvQiX+ysfWGSMwbN6KwdcCpjTQzQYVOk5UHx/2Z5rDANIwkA9sSSuQQ
         EY5WrpSISddJlYdHlQz7K8UXw7TfJ/YGr2ep7k7YyvsYNefXFT0eBxuIB8p/OGCQfF/a
         x2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499933; x=1784104733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=FOy/OOG48fLNDtt8Q9YRjoKFXDK4fqTPOu3R3m800StWmVA7H37Q0zG86JXnSjpR32
         TRSYT9D/5Yf9kFGTrPBnrm3Nf0j8sLmi+TvIyRiiDYlBXXwQPxGHaRi77x3svmT5gdey
         Q63hJ6GtUmeHQOnX6RVHFpxCzdyPCE7iCyj0oKKyP19+Q9elXjBqIHju+yu9TtHaRcjc
         IaArnlOdmF9Rakm5wt6cjs/fFmIOQBo2Oe+mfgVdpa9eZpUEtEGYfizuMO7Ts/5oKGMP
         KikkPt6j8mD/g5kzULmzaIMllCIrIom4AenBGWMMmN1FV3XDUC9hzibhx8I488dDboI9
         Ku1g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0aWSDYFBmeeEXkAzFgNgPGDZ7l68pP0cZ/MhhFw0QAbfYZITplPkDHXiZ1JD4ohpGqDaP2StmdSewOr4u@vger.kernel.org
X-Gm-Message-State: AOJu0YyPomjHajPy5aKxk63wc85B4Lpz6TRs+MSPKOqtGcIM1H3LrMEz
	Ij2UrAmBquQ1Ms0aTDbTzI0xL9fktF2MRMFOi5cMPHEPzpJoLm3q51QJLupxLmtNVOD+MzhhyD4
	N6a2pKV6a3dwdiBQttnzYG7zP9I3DGtmKqnKWnVl2w7porJmVhfdjcqeUbK/nRhgmQb6d
X-Gm-Gg: AfdE7cm+7t5CP7kh5ekEXQ8FKgGZbWwAazVtMgAwlGuV3vidOpQnDKxD3u6xl7k3SQW
	Ae2Ia0jyNS/YgxnX62W8GYPl3GeUm+NUPWRYxLdE71gFp9DltayDQV8tVqbjI/R/461kFk5fzEV
	E3oFcGyElNENpbWQGRZWw7jEBj4yTr1seVLt9hVBKOkM4z7iguGKqStaPQeincrL5T0N5LT9amh
	UtWHImq3XRofqQ9sTwTuACv4AerlpAnrXUx48FpdeBUu+CB9t2PFSub+29lSFrIhXHPDx8A6pVs
	ABdd34iaCgBJsExlOY0HPaDz/Cbmo0xmQ2bGnCVa5zJo2lO4hTAxCCdwKEbKq8F7KIObF34JhC7
	8fMOR3JVgyGZELJc14j26FFTGBDfLilkL9e3RzmuWQ7Nt
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427611cf.2.1783499933082;
        Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427361cf.2.1783499932643;
        Wed, 08 Jul 2026 01:38:52 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm278181466b.59.2026.07.08.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:38:51 -0700 (PDT)
Message-ID: <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 10:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
 <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfXwrUGG/475kCl
 FfogVrEVj+BvBaWlBJcK7BoLeq273P33Tjaw1j0u+dC4WO+XmIoc4P0p06cyERvESxJVfOR9BEY
 T+vA4YGcx8Kk/y2cpJbspcGMRYaIKnw7mI11WsdqUNYbAO7+Eq8qYnwXtI24HQZdooxh1q7K7gs
 ZWQmh5zw3VY58srCgk5quRhoKUC6Jdyq/5aAQ3mALfqBpodullTIguZIUSeWMbQkkjxmueZmIF9
 +QqwJHvUmwOTce2zooDIzziXuB5lYnb3rKR598FxOCK7DWtnPYbZaxBMh4og9YzVXikML8K/BVb
 SfPmQtTQrUM8bMTDIEEDR0FulPCNnjknMHVPiUE8m116v5nYS/N9Q5zGrq3BuJBPocRsa0qDvGU
 bc0o/javIkae6V9qVZBe/vYmh8LPiI2qbDEU47OqC1OcwF9zRduZZzVc/0SbzEXIpJNHH977TIb
 0Qc725EFcNtEmbRstNw==
X-Proofpoint-GUID: HLB3P3tG6ig1TGtYmVOfHfDgCJD1uJUq
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e0c9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=kc99uptPwIIcf-mWtqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX8XyNuykOQByq
 rTOIada+IsAE/VqMmvTUxQnjY7HAeaAaTX3gQW85gCt0aUB53RW3Rz/idJrqgpG86d+dUZ31clo
 CPc1k5/9mFsAgSp8+3afL+6eGgo+Y2g=
X-Proofpoint-ORIG-GUID: HLB3P3tG6ig1TGtYmVOfHfDgCJD1uJUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117553-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 01117723472



Le 08/07/2026 à 10:24, Krzysztof Kozlowski a écrit :
> On 08/07/2026 09:31, Daniel Lezcano wrote:
>> On 7/8/26 08:30, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>>>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>>>> +	.is_visible = t14s_ec_hwmon_is_visible,
>>>> +	.read = t14s_ec_hwmon_read,
>>>> +	.read_string = t14s_ec_hwmon_read_string,
>>>> +};
>>>> +
>>>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>>>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>>>> +	HWMON_CHANNEL_INFO(temp,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>>>> +	.ops = &t14s_ec_hwmon_ops,
>>>> +	.info = t14s_ec_hwmon_info,
>>>> +};
>>>> +
>>>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>>>> +{
>>>> +	struct device *dev;
>>>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>>>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>>>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>>>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>>>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>>>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>>>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>>>> +	};
>>>> +
>>>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>>>> +						     ARRAY_SIZE(sys_thermx),
>>>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>>>> +	if (!ec->ec_hwmon.sys_thermx)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>>>> +						   &t14s_ec_chip_info, NULL);
>>>
>>> Last time I commented this looks like actual ABI break. You did not respond to
>>> that, so I assume my finding was right, thus:
>>> 1. binding is not correct (although driver should be fixed, not binding)
>>> 2. the code still breaks users
>>
>> Sorry I misunderstood it was a question expecting an answer but an
>> affirmation.
>>
>> By ABI break do you mean:
> 
> Existing ABI contract is changed in an incompatible way, which has
> observable effects as below:
>>
>>    * new driver with old DT will fail ?
> 
> ^^^ this one.

When we are incrementally adding features to a platform and like here 
reverse engineering the device protocol of the EC. It is difficult to 
give a complete bindings as we are discovering things little by little. 
How to prevent handling all versions in the code when providing 
iterative completion in the bindings ?

Is it possible to have something like sysfs?
	Documentation/ABI/[testing|stable|removed|obsolete]

but for DT bindings ?



