Return-Path: <linux-arm-msm+bounces-92757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDClOHfyjmk5GAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:44:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4C1349F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCBDC305512F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2204C34DB48;
	Fri, 13 Feb 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcT/y4/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnvRXfPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963B34D395
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975784; cv=none; b=D6cjDCBJ4wrRxlJegyFtaj+AWn1NKgdUyZ7ormdIbvQ9wEad1KJ62ywOYc1cJlHipCLp/iSZFN5H37wVopjhSzmMQZAZ29NnpZ2E4ok7OGmJOBtxw09NQdiT9aY3xZtNafz932ZzEY5Jm2OAxJZDm12yGPxE/8iABtwaG8+QIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975784; c=relaxed/simple;
	bh=pOEseWGsBqI4pAVkkVXUFTt32BENJ5GDUEDnxuZrg38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTXmn8oGXTVX3jlM5XSyEBSQ/53w6QSj/edNXW69qKhmBpG0vVwt0VZXYXeXY51WTIxbbHz/LUYGP8tA2ZIHChkSMzAQ+fj87t552DrDS1Wqkj+hpX69t8buXWuzB5RS/9VwgJ1Ip3OP5xfQpkJ+cpM7xyr8M2L7/lHfSJR2stY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcT/y4/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnvRXfPZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9fIwh3027114
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pn69GDL9HuGRSG29Jiomg57ZL8KM9XgFi5MRwJxQ0g=; b=CcT/y4/Ycwx3DbNU
	BbOs7iDncABXJrNa+v5HTWN6qgaWBQuZeBTQJP4XTNO9GaPSMwVcQZu782dnUgLW
	OD8odx+UmjinrY7IXXekcMIY8cGFA2OUc3j1cbwwDyObeOgX3qjWoSobk86T32+p
	l0fp+WwuIjS+IRzKubA43KFpQ5cVZs5a8y+FHcg83bepwKDy7WDFPZXnQT1OFXyf
	1ej/wo9jtpeSlhX/68+FFQwdB5xOHmJ2byTD9mfGMpWOyjcVmwuBSBEAeMhwliSR
	tFHNIQ/HeXvOqATvGeLo/8IO+OaWwh6Dhsga6bwhvKQuhM2mfJT1QRDKcZYzYiYB
	cDo1YQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca1hn006v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:43:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8243ae83898so467884b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770975780; x=1771580580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pn69GDL9HuGRSG29Jiomg57ZL8KM9XgFi5MRwJxQ0g=;
        b=FnvRXfPZkuHi9Mc4w+XTlyhwt46cPvYaKpajc+XipiEIy5cf2BFOFXuHa/VYRGUmBq
         7fsiuCQBzDu52ya4XnMBShP3uRfa7xT1U75/nTNRL8tDEcaeg98ZGbFb5haOon4xTlfG
         UQKddARjEwu9uc84mOuUpUT8DoSTgQF9lGwtF7dtlnADYQy7OOQT49PTwffbKxaGW/c1
         E47nWwpTQP8QwheGmujcnmwW39aRMmDewU6deuXTUh0GEWK35FMPn/h5VKXT47ZPXOvs
         qcvhjRNsvaK4Lm16omJlNy7QMxu6zDo6ALlK6JZq/gPzagn3Cn49SblOV5oRNpPqJeYZ
         YXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770975780; x=1771580580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pn69GDL9HuGRSG29Jiomg57ZL8KM9XgFi5MRwJxQ0g=;
        b=DijPQ2dhqnR1wOG/d5Z5dUSg9GTEzEPbudEkv52pzuwWLkITzG61Bp9AGXUR+sPHjg
         mPxTmnuLThGpR0bagZ/8kQtZkTyi/jAOYQLDibyz6rNjbyDVje4awN/b3rQ+IW0W3jUn
         SORscQVuLjvV/1mplpNlICc/FksBeNfYUd4Pz2/fxNncKE9SVbGg6G6L2Wg0c3vZD4qj
         q0gIhffUTqh9M5YVRDfneVAnEKBdCA+l5rTOX3IxlqD4+vrDdiRx+OrePjNUx1mY5o6t
         i9BZxh1soy+Pq9ZaZBIPlYJBxsI0wcP/3l2hG6Qv7K23Te/mUQzgXlXbxVXjCM18fw7j
         BAMw==
X-Forwarded-Encrypted: i=1; AJvYcCWLp8ojr6rCfZLWnFKWl3DgrC3bcDqtygnlbPIMk+Q7kYKK0wpHyVUCc/Vr0IytyIdxXkSsdW/SjTiIiVXP@vger.kernel.org
X-Gm-Message-State: AOJu0YxpOEseH2JX6Jr20EtFlfD/TTJPrS7S6S/kxtDuhZRxRTHtWUAG
	AozuYsrFHIj0Yc5Tgqq/IP4uYt82SRc/j0tYPVwbw4D0LPc+DyMJ8Abvi2JtMp0fEf37JWFN2Hc
	vmNElJPirux/auhHdUKQWK2eG4cGM22OvUZTF7BPBeUmlSuqi0QsDSHnxaPEwRPY/AC53
X-Gm-Gg: AZuq6aIz5JWSCykDpYnoMMp5I88oQN1A2P0mBLI0+NkIjizphS6Ej1j5mi6XW0CGhTv
	ofX7inuJmz3HV3fDlukA6KQ/jZ8IhRDpQ+rbMfR44Y2Yql/e52FNPxUX+ydM+ugoMCddekGCfJc
	4/HYx0ORH4FUIWUf4iYAnXaeIsGk4dzfaMYxl6SbB5cG5zT5yOtoNIm5A/gn51cgcvLm6xALP3Z
	dwlj5ZX6Sr0BOb1OTkEVAvGmGrI6U8bkwMrquELon3fRqiZGZFUJi6co9dtqONezYVBZbtTVYme
	1uzVuEKPB+p/R2y+ElquTnnhCRQDC2ESJd6WLUVKiz6JJ+zvevVeyf0gEGfN6HGSHGOEu1BuEBe
	KOuq2svywP5gex9IB62UXLQCksylHzZIxCg2pkDxS30xFgCspPJ7IzZBvSw==
X-Received: by 2002:a05:6a00:a111:b0:824:b304:2cfa with SMTP id d2e1a72fcca58-824c963e349mr1385313b3a.62.1770975780412;
        Fri, 13 Feb 2026 01:43:00 -0800 (PST)
X-Received: by 2002:a05:6a00:a111:b0:824:b304:2cfa with SMTP id d2e1a72fcca58-824c963e349mr1385280b3a.62.1770975779767;
        Fri, 13 Feb 2026 01:42:59 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb410csm1869775b3a.61.2026.02.13.01.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:42:59 -0800 (PST)
Message-ID: <66e6696d-3fab-4da5-ab89-4067d856f186@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 15:12:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <7911bbae-c507-4420-a05c-89242941f774@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <7911bbae-c507-4420-a05c-89242941f774@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wt0m8Nfv c=1 sm=1 tr=0 ts=698ef225 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ldktEXf5EnBcnpPPVXkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: lfvMpcj1xxxcO1_BsyTrXb2Xf-yPatMH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3MyBTYWx0ZWRfX6/Kcl89N+qMH
 ZTGIUcI5T7TxRnpKfT8GgkNoRt/rkQEdDgm033SiUhdudTATw+1HXwgqhdZfxsIq9aVFqRnkdWT
 GrtGaqxy7EhKWo7gVrgASsAFA2o50KRHpnzHDksSJ1iHHDCEqBSI3AL8nzLDVzkOfk9UdXUcCme
 mbsY3EGNLNHqWfKVBe9BsiDKJxzA7xZB1XHMHGR5EmbCUxWg8D3hRPNCON/3l0zV4Z1GsQozzT9
 /M99dXunWSN5wbQ3T93+MrdG9LP63usf1dTHKt6Wnc3HA0ZCr73MnYkGyBSDJhJq70ial9Pw6Ly
 /FTZhPSeGl7X5gLD5DL3dFwgPDHYzRaTjpNcP9vuZSxb9K1To40Ek6D74ZGg/iKCi0g8mXxCYUc
 2au4Pt1JK6Z2zd54v63KO7IKjMPIxHHR2YXvzPec7noQb7cz0NWEtAejHLBsjq7om/uB1fSl1To
 cPuDEz0VEOmueGxdT3g==
X-Proofpoint-GUID: lfvMpcj1xxxcO1_BsyTrXb2Xf-yPatMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86E4C1349F5
X-Rspamd-Action: no action

Hi Konrad,


On 2/6/2026 2:57 PM, Konrad Dybcio wrote:
> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
>> monitor driver. The BCL peripheral is present in Qualcomm PMICs and
>> provides real-time monitoring and protection against battery
>> overcurrent and under voltage conditions.
>>
>> The driver monitors:
>> - Battery voltage with configurable low voltage thresholds
>> - Battery current with configurable high current thresholds
>> - Two limit alarm interrupts (max/min, critical)
>>
>> The driver integrates with the Linux hwmon subsystem and provides
>> standard hwmon attributes for monitoring battery conditions.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> [...]
>
>> +/* Interrupt names for each alarm level */
>> +static const char * const bcl_int_names[ALARM_MAX] = {
>> +	[LVL0] = "bcl-max-min",
>> +	[LVL1] = "bcl-critical",
>> +};
>> +
>> +static const char * const bcl_channel_label[CHANNEL_MAX] = {
>> +	"BCL Voltage",
>> +	"BCL Current",
>> +};
> Let's strip the BCL prefix
Ack
>
> [...]
>
>> +/**
>> + * bcl_convert_raw_to_milliunit - Convert raw value to milli unit
>> + * @desc: BCL device descriptor
>> + * @raw_val: Raw ADC value from hardware
>> + * @type: type of the channel, in or curr
>> + * @field_width: bits size for data or threshold field
>> + *
>> + * Return: value in milli unit
>> + */
>> +static unsigned int bcl_convert_raw_to_milliunit(const struct bcl_desc *desc, int raw_val,
> raw_val is an int here, a u32 when you retrieve it and a s64 in the math..
Will check and update in next revision
>
>> +					enum bcl_channel_type type, u8 field_width)
>> +{
>> +	u32 def_scale = desc->channel[type].default_scale_nu;
>> +	u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
>> +	u32 scaling_factor = def_scale * lsb_weight;
> Would this be equivalent?
>
> if (field_width > 8)
> 	def_scale <<= field_width;
Ack
>
> [...]
>
>> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	bcl_read_field_value(bcl, F_V_MAJOR, &raw_val);
>> +
>> +	return raw_val;
>> +}
>> +
>> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	bcl_read_field_value(bcl, F_V_MINOR, &raw_val);
>> +
>> +	return raw_val;
>> +}
> Do we really need so many read-1-value functions?
Ack, will remove those functions
>
>> +static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
>> +{
>> +	if (bcl->in_mon_enabled)
>> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
>> +				in_lvl_to_attr_map[alarm], 0);
>> +	if (bcl->curr_mon_enabled)
>> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
>> +				curr_lvl_to_attr_map[alarm], 0);
>> +}
>> +
>> +static void bcl_alarm_enable_poll(struct work_struct *work)
>> +{
>> +	struct bcl_alarm_data *alarm = container_of(work, struct bcl_alarm_data,
>> +							 alarm_poll_work.work);
>> +	struct bcl_device *bcl = alarm->device;
>> +	long status;
>> +
>> +	guard(mutex)(&bcl->lock);
>> +
>> +	if (bcl_read_alarm_status(bcl, alarm->type, &status))
>> +		goto re_schedule;
> Do we ever expect regmap_read to *actually* fail?
Since regmap_read API itself is saying, it can fail, added check. Will 
remove it.
>
> [...]
>
>> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +			   u32 attr, int channel, long val)
>> +{
>> +	struct bcl_device *bcl = dev_get_drvdata(dev);
>> +	int ret = -EOPNOTSUPP;
>> +
>> +	guard(mutex)(&bcl->lock);
>> +
>> +	switch (type) {
>> +	case hwmon_in:
>> +		switch (attr) {
>> +		case hwmon_in_min:
>> +		case hwmon_in_lcrit:
>> +			ret = bcl_in_thresh_write(bcl, val, in_attr_to_lvl_map[attr]);
>> +			break;
>> +		default:
>> +			ret = -EOPNOTSUPP;
> Please don't "ret = ...;break;, just return directly, also in the function
> below
Ack
>
> [...]
>
>> +static int bcl_curr_thresh_update(struct bcl_device *bcl)
>> +{
>> +	int ret, i;
>> +
>> +	if (!bcl->curr_thresholds[0])
>> +		return 0;
>> +
>> +	for (i = 0; i < ALARM_MAX; i++) {
>> +		ret = bcl_curr_thresh_write(bcl, bcl->curr_thresholds[i], i);
>> +		if (ret < 0)
>> +			return ret;
> This too, fails if a regmap_write() fails and leaves other registers
> unconfigured if that happens for $reasons
Ack
>
> [...]
>
>> +static int bcl_get_device_property_data(struct platform_device *pdev,
>> +				   struct bcl_device *bcl)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +	u32 reg;
>> +
>> +	ret = device_property_read_u32(dev, "reg", &reg);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	bcl->base = reg;
>> +
>> +	device_property_read_u32_array(dev, "overcurrent-thresholds-milliamp",
>> +				       bcl->curr_thresholds, 2);
>> +	return 0;
> If you don't expect this to grow, just inline it in .probe
For now, there is no any other requirement, will move it to probe
>
> [...]
>
>> +	if (!bcl_hw_is_enabled(bcl))
>> +		return -ENODEV;
> Please make this print a meaningful error - also, should we expect this to
Ack
> ever happen, or would it mean that the bootloader (or something) hasn't
> configured BCL prior to Linux booting?

Most of the cases, it will be enabled in firmware. But there is scenario 
for some variant, firmware will disable it at runtime

based on underlying battery sensing element due to hw issue. So We 
wanted to enable driver only if peripheral is enabled.

>
> [...]
>
>
>> + * enum bcl_channel_type - BCL supported sensor channel type
>> + * @IN: in (voltage) channel
>> + * @CURR: curr (current) channel
>> + * @CHANNEL_MAX: sentinel value
>> + *
>> + * Defines the supported channel types for bcl.
>> + */
>> +enum bcl_channel_type {
>> +	IN,
>> +	CURR,
> The enum defines could use a prefix, say CHANNEL_CURR
Ack
>
>> +
>> +	CHANNEL_MAX,
>> +};
>> +
>> +/**
>> + * enum bcl_thresh_type - voltage or current threshold representation type
>> + * @ADC: Raw ADC value representation
>> + * @INDEX: Index-based voltage or current representation
>> + *
>> + * Specifies how voltage or current thresholds are stored and interpreted in
>> + * registers. Some PMICs use raw ADC values while others use indexed values.
>> + */
>> +enum bcl_thresh_type {
>> +	ADC,
>> +	INDEX,
> Same here, THRESH_TYPE_ADC
Ack
>
> [...]
>
>> +/**
>> + * bcl_read_field_value - Read alarm status for a given level
>> + * @bcl: BCL device structure
>> + * @id: Index in bcl->fields[]
>> + * @val: Pointer to store val
>> + *
>> + * Return: 0 on success or regmap error code
>> + */
>> +static inline int bcl_read_field_value(const struct bcl_device *bcl, enum bcl_fields id, u32 *val)
>> +{
>> +	return regmap_field_read(bcl->fields[id], val);
>> +}
> This produces more characters than it would to inline the function
>
> Now, that doesn't mean it can't be like that, but it's certainly curious

Ack, will remove it in v2

Thanks,

Manaf

>
> Konrad

