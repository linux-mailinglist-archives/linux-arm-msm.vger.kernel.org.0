Return-Path: <linux-arm-msm+bounces-118831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3o0dCLUYVWqjjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:56:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77F74DC84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rjrgq0W5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W6ESEjIS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65912301C6CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0DA43B3CB;
	Mon, 13 Jul 2026 16:56:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887F331EA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961776; cv=none; b=L9LOLn6iBUn8a9UdBG6UMT8Og1/3LY9G13R2hDhjsv1pf7YDyNXj3rQ25o0e3fuQcrQxzx2r224opW8RO+s0RufuJW/hrR8rorsS796FGJ8EMBJ3EFJ+3+AsyXpoyuA1dy7uhqMGsEFQ3DrU7CLhW6poejvcuFdlUnNQJv+kl4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961776; c=relaxed/simple;
	bh=oVvyHkwRLo36ybY/LmG8sSxJU9a9lzLKNbwUsPqQIbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceWO5cQxSGzQ6zXbjlFit19bQfvnL+z6o8gjuzfLKZUdHoE4De4XJg+CmZTyKGr92H9xWxiL2uHur2BUA9Wn4WCThhIqUMWDgJDcdiye/LVg7+7E7VaR4HuOBrbfTMX6mKc7QB7H5wKJ/7gfNGkxdqym61LjkASw2F+a/155/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rjrgq0W5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6ESEjIS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF878R1701390
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ecs5tH+zZY2MRhB2RadmuAKPiV+99oz9UwWFOi6ZgM=; b=Rjrgq0W5NzrMQVqz
	gcBwMVMItVSJXxllv5/eHXXHBC6PKw/BLlL6SpG1uUXIUoGfsFBP24+RQY93ZUyY
	ODUBJoHz9zVenkYOu3Z7SFU3BZ+RiyfEuRtz/C2iyi8scHnSksF7tj3OCY2uu6Pz
	66jFAXCguty+C6+SG41IVYYVMiZ9qZWADDPqVB7vRYRtNktnf7MtVA3tRKtE8lDe
	W+q8F3lsITrYAqzSROjhuSepC8jknealT1aZDfI5la5H9yuCAs91S2PzN8tjNQaa
	1xmGyl5sPVURYB5dowtn3ZeFOvNZvBwfAp3iXUizNvJzFNGpkJgfO7Mq4k1BKYJl
	2vX7Dw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3hrc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso2198297a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783961773; x=1784566573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ecs5tH+zZY2MRhB2RadmuAKPiV+99oz9UwWFOi6ZgM=;
        b=W6ESEjISflrkKH5lE48X08d7GrgZEzGleopjXbhyx3zlGdh3P5Lle3IUDYaIG9rrhe
         UAyDiKApi8re0Jn+mwwhmmV9BYdaIBOQuq5B6np/OnloFsdH1gmHOjtIBQyylABKjJDm
         DU4Fss9qOhP0qQ+8vIyzffNL1LEpuI8cKHR/EERd3Op7DLQ9NhGzESDpvjJr59hCvDYL
         yl9Pg+DbBz5Vl/cBPqT+BiEMnmgLYdfmujCyyKShbksEvHEEEVLAOp8eq7NmXkE1knpd
         rnRg3FqH693inonL6qHqpCczq+CB3owyDndDXRrfS3mQGjt5jima3Kl9AM1mdpM7kjaI
         +VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961773; x=1784566573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ecs5tH+zZY2MRhB2RadmuAKPiV+99oz9UwWFOi6ZgM=;
        b=V0RrSYCJkxUQEdK2dZVXoD9XLlhPNVWRorAbZcIBVS0ZTiSzfpNIzNEkImUuymHG4U
         2ss14aqAgVwgh7bUAPd6lDzxYCeL8sfGnMmJZLRpSHxXCKKbB8ou9WfYYwdcaIqr8+4s
         mpos8Mwq1SRSiCxalaPUvgtCCmTO8rRI4r+qF+hCGBMR3e2x5LDi7/5zsc4+Z2gqAcPk
         Q3xWnMeFfTwWHQaauA/SKCYMUgQHiXWfROZzaRQv86SCuIQUP9CuScPM4cQrdaFaXRbD
         nW1SzJmpZ8V5BOYed6X1pWMl3rd+IleR2rB30MKuk4TgfQEKI9gHTu7IVMBHM8U2JGv9
         G/tQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKeyEU1eqzZtFmvDAdbc7dhIvkSLZZkkMqpVxc4D3BpLID6hsnE6gyRJCXyS2voCOffSLx9EwmVDGqGVA7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4s+4tTghZKZJ7RWvmulvcPM5dYgx1yFPmGhAputhwIUKUukKc
	WoNivSbmuwwfV4bdqGigVNDGZn0hs0gRPLHaQZJ3dvy3lPgEtXQw2842r+axtkpXO89DV2ybH/r
	pfWJE07FUr0I7sBMuXUOSo3ysvgz7I11Xi1KJrrbR/5IpQ+s0nrahVLc3Z7S7+v1Gs9IA
X-Gm-Gg: AfdE7clBBijhQbz26FNpoyx/dajhvwBh6QycgL5owbjCIFJZ7689tEmLBWw9bn1A2ds
	IMCGgYYJSNU+QhdEphHULP0zyC3jBmMDiJc/Nn8b1e8jRx0A3beFpC0+np4/nbUjrCdY8S0SPPu
	dcnL5kdvSaHJK4x/3bcwJRHSCdKBHFK7dyOWh46WHKT6wr5ThtUYflhx1ofkgBsV3dfRx67z6oK
	Br5J+rYvX4gnk7f6buE0sbHOVxb79/+yZY7e9J+bPx9kIcuj58Jjr04c/4Jsd16x6t9gEmkZUaC
	olWMZTsgEYG4YfzEQ2xczlWu9JBW4p8ul2QPZSwg05waJPgFLrSpH3h20z+m29bFWfuB726EBTr
	0nSr8F64nw6pqK/6P7oCngVEuCVgM/Sk8gzeXdUgQdQi4kA==
X-Received: by 2002:a05:6a21:3992:b0:3b3:23a2:edff with SMTP id adf61e73a8af0-3c1102a15c4mr10772660637.28.1783961773423;
        Mon, 13 Jul 2026 09:56:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:3992:b0:3b3:23a2:edff with SMTP id adf61e73a8af0-3c1102a15c4mr10772622637.28.1783961772810;
        Mon, 13 Jul 2026 09:56:12 -0700 (PDT)
Received: from [192.168.1.100] ([157.48.180.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm23242316eec.13.2026.07.13.09.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:56:12 -0700 (PDT)
Message-ID: <f384adce-8954-4667-9e3b-0fc0eb223439@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:26:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
 <20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
 <20260706005134.7add6bbe@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260706005134.7add6bbe@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Oesfefo81FVdf31n8ZQ9K3liV8uIXe7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfX6bT/422T+Xpb
 D6v/Nfa5RISuqQ845lo9goGG4XDBs5DtBzkYbyNKJTswf24CpmkDVOuV5HPNqX3/YdV0kjcjMRt
 VcaQGJGI1IFKAuhHfmXSUtPBFdwPeVo=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a5518ae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=62VzjLAzdHZQ3L95IMgkXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q30daxf-3pjc-4xqwVQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfX1NwxM16+TO2E
 i7ppfMimWg7quWvfJ/KnZeW4JGCDGhWQRhLe8MN4l732ibI9X9AwqeYltfmfFvWT5KvxmE5T6CJ
 QFW/FdMDz/zYW3lgogQc0OeiaDeAEswQR1UImyysBhUbLY0LemMHWYvPkVnHzvo7lelrQvNFupu
 YlnXDIm1DDiBC5hO6nGTWyiFavWUjaXUDfCKtOvyGaknsDz+MUbHYFVxNABmSyu6dgPiIY+umQS
 16aHNILDXHoNS0FMETxMape7DcQpE6Ua2kzQ4JY2oSPm2Bpx1T4OSW5vwCWpnsL8S438rMlFNkL
 rETRwhNcLhZa3ARb4IKs+uTgJsytk52H7a8+2IFo4VRFVIsnVjaWAarbgPLCVyjlutS2yFymZdP
 Q2jFAqzYyOEABFHQx5wMx0lyL+vSI5+xE/mqWgUkncMa3Elkqxb11UCWl8DQ+31R8fqOgF54CdC
 BujRXcFWmswmpj5i9Sw==
X-Proofpoint-GUID: Oesfefo81FVdf31n8ZQ9K3liV8uIXe7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-118831-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E77F74DC84

Hi Jonathan,

On 7/6/2026 5:21 AM, Jonathan Cameron wrote:
> On Sun, 05 Jul 2026 22:23:35 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> Add support for ADC_TM part of PMIC5 Gen3.
>>
>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>> drivers, used to support thermal trip points.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Hi Jishnu,
> 
> I took a quick look at this. A few really minor suggestions inline.
> 
>> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
>> new file mode 100644
>> index 000000000000..5a82c4d8a37e
>> --- /dev/null
>> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> 
> 
>> +static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
>> +{
>> +	struct thermal_zone_device *tzd;
>> +	unsigned int channel;
>> +	int ret;
>> +
>> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
>> +		channel = ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
>> +		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
>> +						    &adc_tm5->chan_props[i],
>> +						    &adc_tm_ops);
>> +		if (IS_ERR(tzd)) {
>> +			if (PTR_ERR(tzd) == -ENODEV) {
>> +				dev_info(adc_tm5->dev,
>> +					 "thermal sensor on channel %d is not used\n",
> 
> That seems noisy.  Maybe dev_dbg() appropriate if this is an expected
> board dependent condition?
> 
>> +					 channel);
>> +				continue;
>> +			}
>> +			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
>> +					     "Error registering TZ zone:%ld for channel:%d\n",
>> +					     PTR_ERR(tzd), channel);
>> +		}
>> +		adc_tm5->chan_props[i].tzd = tzd;
>> +		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}
> 
> 
>> +static int adc_tm5_probe(struct auxiliary_device *aux_dev,
>> +			 const struct auxiliary_device_id *id)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5;
>> +	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
>> +	struct device *dev = &aux_dev->dev;
>> +	u32 irq_flags;
>> +	int ret;
>> +
>> +	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
>> +	if (!adc_tm5)
>> +		return -ENOMEM;
>> +
>> +	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper, aux_dev);
>> +
>> +	adc_tm5->dev = dev;
>> +	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
>> +	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
>> +	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
>> +					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
>> +	if (!adc_tm5->chan_props)
>> +		return -ENOMEM;
>> +
>> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
>> +		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
>> +		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
>> +		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
>> +		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
>> +		adc_tm5->chan_props[i].chip = adc_tm5;
>> +	}
>> +
>> +	/* This is to disable all ADC_TM channels in case of probe failure. */
> 
> Perhaps indicate who turned them on?  On from reset or something hidden
> somewhere else?

In the probe, ADC_TM channels are only enabled in the loop in adc_tm5_register_tzd(),
when they have the set_trips API called during thermal zone registration. I'll
update the comment to mention this.

> 
>> +	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
>> +	if (ret)
>> +		return ret;
> 
> ...
> 
>> +	/*
>> +	 * First SDAM's interrupt is shared between main ADC driver
>> +	 * and auxiliary TM driver, so its flags must include
>> +	 * IRQF_SHARED. This is not needed for other SDAMs as they
>> +	 * will be used only for TM functionality.
> 
> If indent of this doesn't change, rewrap to 80 chars.
> 
>> +	 */
>> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
>> +	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
>> +		ret = devm_request_threaded_irq(dev,
>> +						adc_tm5->dev_data->base[i].irq,
>> +						adctm5_gen3_isr, adctm5_gen3_isr_thread,
>> +						irq_flags, adc_tm5->dev_data->base[i].irq_name,
>> +						adc_tm5);
>> +		if (ret < 0)
>> +			return ret;
>> +		irq_flags = IRQF_ONESHOT;
> Whilst this code works, I'd be tempted to make it less ordering dependent.  E.g.
> 	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
> 		u32 irq_flags = IRQF_ONESHOT;
> 
> 		/*
> 		 * First SDAM's interrupt is shared between main ADC driver
> 		 * and auxiliary TM driver, so its flags must include
> 		 * IRQF_SHARED. This is not needed for other SDAMs as they
> 		 * will be used only for TM functionality.
> 		 */
> 		if (i == 0)
> 			irq_flags |= IRQF_SHARED;

Sure, I'll update the function this way and also address your other comments.

Thanks,
Jishnu

> 
> 		ret = devm_request_threaded_irq(dev,
>> +						adc_tm5->dev_data->base[i].irq,
>> +						adctm5_gen3_isr, adctm5_gen3_isr_thread,
>> +						irq_flags, adc_tm5->dev_data->base[i].irq_name,
>> +						adc_tm5);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> 


