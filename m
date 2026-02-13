Return-Path: <linux-arm-msm+bounces-92772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLHLJCkNj2kgHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:38:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B4135C91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA15E303B5FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E9D3563ED;
	Fri, 13 Feb 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHjLIFYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt3x4vP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802433F8DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982690; cv=none; b=rXuQpNAiokUq4tXtTlG9HnekUTmLTMdqscCtRTYtqcXJAXf/DAdjIvxEOc6v8pazypWOqspgbHU1AgrgFh6e1SEm2PEUpzRBh/tzEzB0DB2UJ7FL1mv/hkf6C2B1cXH3vpgUTfIu2iwo1hdgCJq2JkxSw2CVmsohLqIM0plzeg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982690; c=relaxed/simple;
	bh=dCJnv+0xEecnsLnNJoOKxs9cpdxjLRDTdms8KKmqBAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5foRo0I9xl9ds+RHEw1G0/v8x5kEBka7EaOZstNtQYQG2TgZ6jC1u4VWmVM7ryJd02pFY+BFXuv5hwUGhKr0gQ5GcL96STB47C1DMT6GYbPq1Pg5uB8DD0sz7ubMuW6H9+xHB6PQihcd/gXlRgUxIoPm9HKxB+7yyqnQ87gKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHjLIFYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt3x4vP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7Ru3Q3046309
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nPXtkg0dMes2Y1OatZWLmZe0bpWW6Yg8e2HgVJt/UXQ=; b=iHjLIFYTuuoeG9mD
	nY0Vj0vXlpbgyswiCPhjKBX/UTzSG1Yc994rgYXtvjOHjJDzl3VFzap8dU75D9p9
	AQEjx7ZvN1aAx/sglOSdzJS2xWaDvnJIO5AOGsbs7mhaUQjmxBTDkQlBWQaxfgD6
	PpQ6blV6icu3FVXFh65aSMYeG1T7wGsX+igPuwW3js2ZN5Am/7z6NRKRyFdGCbfq
	2BFnDP749o7pGQHx3ZY1JSv/+KButEJ4mJOo4uZOionwZtNsGO/CIgFfk9Kob69s
	8HItdt/OqPknkKh8FCcGbhE6G3XP9P6zfAJ8PLQ8QSWLrA1I7UZ9QVRbTQ6pXsZJ
	sz2hSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2tnnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:38:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso12089975ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770982686; x=1771587486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPXtkg0dMes2Y1OatZWLmZe0bpWW6Yg8e2HgVJt/UXQ=;
        b=Xt3x4vP7uoZYZHPYiqKRgLTTGkBuXgP4ar6BqkQSrLeq+MBIpKakjslBuZBg409cGt
         Ff60XROlaq84SeGqwsVbfT4qRGj9pUUL2vKuw324jxhEHEzgIYa0skezs4zyJ8JHTGXI
         m8qfngrGkieSHoN583aSdChqA+mVYsHtbocDOF7GeLZEaVIZFPNGDjCZ0OJGJzwGxGL/
         tZrlnphOy27w3oNdsbJwiVE/XHuRotaaLk0NksNNtOZnQDnDurzmFJYU1P5RDQ7EaU7p
         wZ0K+1IrTiQmEKTHR9eFoNZpYmRSymsoqsEy9xbCrncF51ZeHDikrGgZSlqxzx5FOofX
         ep5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770982686; x=1771587486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPXtkg0dMes2Y1OatZWLmZe0bpWW6Yg8e2HgVJt/UXQ=;
        b=BQupC3TKxzg4XB68kzRUwXj1/R/4LQl41YfekMBnKIfLkugGhs5wCtGZtzrAG/+6us
         SIANzNFLEQw+1x54d43kHtHTQjGdpud9PWMvegUcS6aU1tt9yioRgJbA9k+iPCcncKUz
         6VXEE80vwsjrMiMpb5XVrxzj3MYJWjijGuCQqbLlcLoAYV3dEZK3/B31ogBoEx0H9zgM
         bDrAiVLMnWJyMMvATQVLY5Tu4Af6eJXynmUt/EJDTQ1U3qIJjxFQYvVXPuu1lxenk6AN
         ielInapJKs4jYNSvHzkJeL61CSEC7CawfiXMgvuNzlTlZumMFuQzH6lfh5jsUs4HE0OP
         rnyw==
X-Forwarded-Encrypted: i=1; AJvYcCXAh3pfYwzuPNpo1+XeWM0sGcHJP1o1r6PX2jB58a2Ju5yXdwwk4MF6OnlIra42oM4ykgXsiCWWdvfHGvAi@vger.kernel.org
X-Gm-Message-State: AOJu0YzBW/3T9Qs0YkZu+SadWD44cL297Jru9RKMpsIoReFfgDK2xdMu
	zccsWsz+Qcz6aTumooZ3+cKBGi18SlmCpeHvQHAx2CZBGJCkrCVI/CaAZqEQNrkrdc6s0NTY2uQ
	qVLUB4njriZQfjIsQTyoCDp50Ih2IXVYgsUGK7UzM+DFNAfNSWBn5BfZ3GhrEfdtYblNA
X-Gm-Gg: AZuq6aKggVtgYqlI9S+SsTu9egR3KYdVv24ZmOpgSzAzVqNZMSqgndl5jeKmlvJK8rf
	B8aCyUPWeSaov/aO81cZzre+m95rxHbSg4elytYjXnQ3MiZOufVvejO015uR1bujhgdNtds3T8s
	pVd8XXHRormewulw+5QlgUsQSKJZbn/XIYSGuFVrI+aSeCB4R2mdraME2uINoALdHT2MdZwlVH+
	pGbQKdE3BE3hOxH3z0kx/E6R6BlNduWVSB8tGKhsfMeyYbMmljFwe64A1eZ6kbZYSK/0yQ78HB5
	Z5PqEqDud3ulqWHX2Oczh69pidUdlMSSbp/Qxqp4f06MuKdTiINMMU8t3XIN4MxkleAkh4BNzNW
	dGwakE9W22DRH/5ssvrotXzcSnkUqzATZO3+YRt2asi7xpovJqadNPtgUQA==
X-Received: by 2002:a17:903:2ec3:b0:2a7:3dbe:353d with SMTP id d9443c01a7336-2ab50617cb4mr15250865ad.53.1770982686146;
        Fri, 13 Feb 2026 03:38:06 -0800 (PST)
X-Received: by 2002:a17:903:2ec3:b0:2a7:3dbe:353d with SMTP id d9443c01a7336-2ab50617cb4mr15250505ad.53.1770982685510;
        Fri, 13 Feb 2026 03:38:05 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2996503dsm79806985ad.44.2026.02.13.03.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:38:05 -0800 (PST)
Message-ID: <078a0ab5-0212-452a-957d-f87084127190@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:08:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ndkdgw6tiau4y7psfl53tmzylrfi27h6j5likx5mahufv34625@na3yyn56fgw6>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <ndkdgw6tiau4y7psfl53tmzylrfi27h6j5likx5mahufv34625@na3yyn56fgw6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4xyavqfr6k36-_XCvnjQeECYB0Yxhe02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4OSBTYWx0ZWRfX7AtlbjlZIs3k
 1zVeXYcU/CKViTYomITttM4KlddtC93Rd5EbsJvllkZkQyad2yQdGY1ypytjPEocXNmwtjOCR1n
 mBG4BMmsoGpy2J/ca8ZN9VTB/aQUaBFPyvz5MzzCQaXo0lSuAFd7e2Fe9CcKlwj+VzznfnNiD19
 va6mSrQkm95gnUlcHp1xc5AEbnkLn/7ph2EYyBKkBEF/WN015XosaGXWO4WfeypU6l9+UtW3Sl7
 qxx4hbvlDOiTEin2m/obVrzr3sLNNL9K4LIxr9i4mpgIdJzyYdcq2cCDadV1CtrUjYnn5F2y/Sq
 HxpfRZ6ZPbTRogt2CwSLKu5arrcXkSKBB8MKD/wFNRcgkLPXoFzOEwSJAxzHR8TGynFoAfJJMUX
 1OuILUwNAQEdc3wc7VPN6Yf/FVQqhPnkXHr043CirdstLGAvb7Myg45rPL35iDiiQNGWMSR4K4l
 I0k1gDqofcfskcz6tfQ==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698f0d1e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=aIVcIxTxIAiOnfoqHEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4xyavqfr6k36-_XCvnjQeECYB0Yxhe02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 153B4135C91
X-Rspamd-Action: no action

Hi Bjorn,

On 2/6/2026 6:54 PM, Bjorn Andersson wrote:
> On Fri, Feb 06, 2026 at 02:44:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
>> new file mode 100644
>> index 000000000000..a7e3b865de5c
>> --- /dev/null
>> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
>> @@ -0,0 +1,982 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Qualcomm pmic BCL hardware driver for battery overcurrent and
>> + * battery or system under voltage monitor
>> + *
>> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
> That's the wrong statement.
My bad, I copied old copyrights, will update
>
>> + */
>> +
> [..]
>> +static void bcl_hw_channel_mon_init(struct bcl_device *bcl)
>> +{
>> +	bcl->in_mon_enabled = bcl_in_monitor_enabled(bcl);
>> +	bcl->in_input_enabled = bcl_in_input_enabled(bcl);
>> +	bcl->curr_mon_enabled = bcl_curr_monitor_enabled(bcl);
>> +}
>> +
>> +static int bcl_alarm_irq_init(struct platform_device *pdev,
>> +			      struct bcl_device *bcl)
>> +{
>> +	int ret = 0, irq_num = 0, i = 0;
> First use of these three variables are assignments, no need to
> zero-initialize them here.
>
>> +	struct bcl_alarm_data *alarm;
>> +
>> +	for (i = LVL0; i < ALARM_MAX; i++) {
> I would prefer ARRAY_SIZE(bcl->bcl_alarms) over ALARM_MAX.
Ack
>
>> +		alarm = &bcl->bcl_alarms[i];
>> +		alarm->type = i;
>> +		alarm->device = bcl;
>> +
>> +		ret = devm_delayed_work_autocancel(bcl->dev, &alarm->alarm_poll_work,
>> +					   bcl_alarm_enable_poll);
>> +		if (ret)
>> +			return ret;
>> +
>> +		irq_num = platform_get_irq_byname(pdev, bcl_int_names[i]);
>> +		if (irq_num <= 0)
>> +			continue;
>> +
>> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
>> +						bcl_handle_alarm, IRQF_ONESHOT,
>> +						bcl_int_names[i], alarm);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "Error requesting irq(%s).err:%d\n",
>> +				bcl_int_names[i], ret);
>> +			return ret;
>> +		}
>> +		enable_irq_wake(alarm->irq);
>> +		alarm->irq_enabled = true;
>> +		alarm->irq = irq_num;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
>> +				 const struct bcl_desc *data)
>> +{
>> +	int i;
>> +	struct reg_field fields[F_MAX_FIELDS];
>> +
>> +	BUILD_BUG_ON(ARRAY_SIZE(common_reg_fields) != COMMON_FIELD_MAX);
>> +
>> +	for (i = 0; i < data->num_reg_fields; i++) {
>> +		if (i < COMMON_FIELD_MAX)
>> +			fields[i] = common_reg_fields[i];
>> +		else
>> +			fields[i] = data->reg_fields[i];
>> +
>> +		/* Need to adjust BCL base from regmap dynamically */
>> +		fields[i].reg += bcl->base;
>> +	}
>> +
>> +	return devm_regmap_field_bulk_alloc(dev, bcl->regmap, bcl->fields,
>> +					   fields, data->num_reg_fields);
>> +}
>> +
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
>> +}
>> +
>> +static int bcl_probe(struct platform_device *pdev)
>> +{
>> +	struct bcl_device *bcl;
>> +	int ret;
>> +
>> +	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
>> +	if (!bcl)
>> +		return -ENOMEM;
>> +
>> +	bcl->dev = &pdev->dev;
>> +	bcl->desc = device_get_match_data(&pdev->dev);
>> +	if (!bcl->desc)
>> +		return -EINVAL;
>> +
>> +	ret = devm_mutex_init(bcl->dev, &bcl->lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!bcl->regmap) {
>> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = bcl_get_device_property_data(pdev, bcl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Unable to allocate regmap fields, err:%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!bcl_hw_is_enabled(bcl))
>> +		return -ENODEV;
>> +
>> +	ret = bcl_curr_thresh_update(bcl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = bcl_alarm_irq_init(pdev, bcl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	bcl_hw_channel_mon_init(bcl);
>> +
>> +	dev_set_drvdata(&pdev->dev, bcl);
>> +
>> +	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
>> +						   dev_name(bcl->dev));
>> +	if (IS_ERR(bcl->hwmon_name)) {
>> +		dev_err(&pdev->dev, "Failed to sanitize hwmon name\n");
> Afaict, devm_hwmon_sanitize_name() can only return -ENOMEM, which
> already printed an error.
Ack
>
>> +		return PTR_ERR(bcl->hwmon_name);
>> +	}
>> +
>> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
>> +							      bcl->hwmon_name,
>> +							      bcl,
>> +							      &bcl_hwmon_chip_info,
>> +							      NULL);
>> +	if (IS_ERR(bcl->hwmon_dev)) {
>> +		dev_err(&pdev->dev, "Failed to register hwmon device: %ld\n",
>> +			PTR_ERR(bcl->hwmon_dev));
>> +		return PTR_ERR(bcl->hwmon_dev);
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
>> +		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,bcl-v1",
>> +		.data = &pm7250b_data,
> Why generic compatibles but pmic-specific data structures? If anything
> I'd expect tthe other way around...
Ack, what I thought is, there can be multiple pmics which share same 
data structure in same generation. In that case no need to add extra binding
config,  Just use generic compatibles. By reading  all these comments,  
it shouldn't be like this. I will remove generic compatibles.
>
>> +	}, {
>> +		.compatible = "qcom,bcl-v2",
>> +		.data = &pm8350_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-bmx",
>> +		.data = &pm8550b_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-wb",
>> +		.data = &pmw5100_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-core",
>> +		.data = &pm8550_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-bmx",
>> +		.data = &pmih010_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-wb",
>> +		.data = &pmw6100_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-core",
>> +		.data = &pmh010_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-pmv010",
>> +		.data = &pmv010_data,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, bcl_match);
>> +
>> +static struct platform_driver bcl_driver = {
>> +	.probe	= bcl_probe,
>> +	.driver	= {
>> +		.name		= BCL_DRIVER_NAME,
>> +		.of_match_table	= bcl_match,
>> +	},
>> +};
>> +
>> +MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("QCOM BCL HWMON driver");
>> +module_platform_driver(bcl_driver);
> This relates to the bcl_driver declaration, not module properties. So
> move it there.
Ack
>
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwmon/qcom-bcl-hwmon.h b/drivers/hwmon/qcom-bcl-hwmon.h
> Why is there a header file, is this going to be accessed by some other
> driver? It mostly contain driver-internal thing, and some helpers that
> won't be useful outside of the driver.
Ack, will move all changes in to driver file
>
>> new file mode 100644
>> index 000000000000..28a7154d9486
>> --- /dev/null
>> +++ b/drivers/hwmon/qcom-bcl-hwmon.h
>> @@ -0,0 +1,311 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
> Please fix this one as well. (Or...drop the file)
>
>> + */
>> +
>> +#ifndef __QCOM_BCL_HWMON_H__
>> +#define __QCOM_BCL_HWMON_H__
>> +
>> +#define BCL_DRIVER_NAME			"qcom-bcl-hwmon"
> This belong in the driver...but frankly, you can just put the string
> directly in bcl_driver.driver.name, no need to have a define for it...
Ack
>
> [..]
>> +/**
>> + * bcl_field_enabled - Generic helper to check if a regmap field is enabled
>> + * @bcl: BCL device structure
>> + * @field: Index in bcl->fields[]
>> + *
>> + * Return: true if field is non-zero, false otherwise
>> + */
>> +static inline bool bcl_field_enabled(const struct bcl_device *bcl, enum bcl_fields id)
>> +{
>> +	int ret;
>> +	u32 val = 0;
>> +
>> +	ret = regmap_field_read(bcl->fields[id], &val);
>> +	if (ret)
>> +		return false;
>> +
>> +	return !!val;
>> +}
>> +
>> +#define bcl_in_input_enabled(bcl)	bcl_field_enabled(bcl, F_IN_INPUT_EN)
>> +#define bcl_curr_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_CURR_MON_EN)
>> +#define bcl_in_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_IN_MON_EN)
>> +#define bcl_hw_is_enabled(bcl)		bcl_field_enabled(bcl, F_CTL_EN)
> This whole thing is only used in bcl_hw_channel_mon_init(), just put the
> code in bcl_hw_channel_mon_init().
>
>
> You have a few other regmap_field_*() calls in the driver, I would
> suggest that you just call that directly for these cases as well.
Ack
>
>> +
>> +/**
>> + * bcl_enable_irq - Generic helper to enable alarm irq
>> + * @alarm: BCL level alarm data
>> + */
>> +static inline void bcl_enable_irq(struct bcl_alarm_data *alarm)
>> +{
>> +	if (alarm->irq_enabled)
>> +		return;
> This can't happen, but because you separated this to a helper function
> it's not obvious
Agree, will update in v2
>
> I'd suggest that you inline the remaining 3 lines in the one place where
> this function is called.
Ack
>
>> +	alarm->irq_enabled = true;
>> +	enable_irq(alarm->irq);
>> +	enable_irq_wake(alarm->irq);
>> +}
>> +
>> +/**
>> + * bcl_disable_irq - Generic helper to disable alarm irq
>> + * @alarm: BCL level alarm data
>> + */
>> +static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)
>> +{
>> +	if (!alarm->irq_enabled)
>> +		return;
> This is tricker, because there's a window between
> devm_request_threaded_irq() and the assignment of irq_enabled, where the
> interrupt function might execute and the attempt to bcl_disable_irq()
> will face irq_enabled == 0.
>
> But I don't think that's intentional...
got it, I will synchronize this with per alarm lock in next patch
>
> I think this too would be better to just inline in the one place its'
> being called.

Ack

Thanks,
Manaf
>
> Regards,
> Bjorn
>
>> +	alarm->irq_enabled = false;
>> +	disable_irq_nosync(alarm->irq);
>> +	disable_irq_wake(alarm->irq);
>> +}
>> +
>> +#endif /* __QCOM_BCL_HWMON_H__ */
>>
>> -- 
>> 2.43.0
>>

