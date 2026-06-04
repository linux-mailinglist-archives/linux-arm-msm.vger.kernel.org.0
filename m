Return-Path: <linux-arm-msm+bounces-111184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9jKI0ZkIWqbFgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:40:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D884E63F80B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:40:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D9LAZM0S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zsccr6XQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4045330414A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 11:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7FC41C2FF;
	Thu,  4 Jun 2026 11:37:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A636410D24
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 11:37:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573064; cv=none; b=MG6RugukhdpE4l+YbSyvd9gMVwPX8N94UASh+1Ym9GQJhy2LjMqQwdnbGUdYSUgIPcWBptfrdl7sm7RYRtBJoeX949cMYX37zW+n3nyVTvr4CpUWKjaqsngeBGNEz6aoTzKXxX/pB8s9KJxfSSEyr43KYgY/8k5UA+OySTFRQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573064; c=relaxed/simple;
	bh=MUst1MLkAAjlIqGj9NF3PoqmV8scdkQpsGC/RSxlZ2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fu0FsCnh6yP/PQmHY1doh4+omckOrQKBPaEjWroKbd7P6Rp21R3PnJlheuS4ko0i6Gcr3xrVtC4+En1yyBiRKo4qcHRl/WpgXQUZKEGwe/FyxvZA5jgdaxbBmL0xYMm7aE95SjKTnq5a7lESko8/pqGccdqCfcGzCU86GKONKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9LAZM0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zsccr6XQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548c78s598270
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 11:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXvacYyh5VG4TTgXv/NQTXRitLcLUy9KAEIH2z6Aw2w=; b=D9LAZM0SJTt2XlQK
	TspSgUHHWk9nVfgJh1TpQBS1kaxTXgfju1FHxsxRAeNVw2GeHcAOnvlrlC0r9Mts
	R3tldW5f3RAPfat5KZPDkxVuDTrgfpk0sK0wiQdUEc2ar0rXtn5KHYsne67OT23P
	LhZrfTLFnpyHUT4KKWSs2AWT13vkcqqa7Rfj+L1f2ucYyGYtR6+aiwunx0XaNrY7
	8VP9FsEIWJ7GMMLSeeOuaj4ArOvW+tLHzvThhcjsRN4QjYYQK+VJ+FZwN3LXfA9Q
	DnnePqqsgLoovCYjetu5599sEKH8A8quZTQ2tsitQsUVgK9CTNsPeCdhQc6RqCK0
	gY3PpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m2466-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 11:37:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0d0516ad7so7680265ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780573062; x=1781177862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXvacYyh5VG4TTgXv/NQTXRitLcLUy9KAEIH2z6Aw2w=;
        b=Zsccr6XQsYwC2hm/HGPh2/RaPgjWYIeo74T9PS2r8NeDB69gafLRV8jaS+F7byh55w
         sLvn6UVEXA2ldYEEl1w5xczlm+OCjWJBD1IRO6G0nA6OawJwA0LszQ3UTqdrsMPHt+5P
         7KiG/vN9AwWuguxLI+QErVZP92HTkNnq1t+u+0D8iZyA/8vlw9oPUMAqiuidYR4pzIYv
         8d1NDmm5ExBCC0T/nZ892qHM4ySkWWwRN6wdiycggfBLv0Dn5h/b5G4jGzae1zCZN8pb
         oElORp0bh2tPXynWZiYpf+SSdXr36qnk1mPp5MvMt81h1G00AGJW0+FyEclVRPfcij8U
         cefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573062; x=1781177862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXvacYyh5VG4TTgXv/NQTXRitLcLUy9KAEIH2z6Aw2w=;
        b=hO+bdp+v6M7AomuXGD1hTlVPpCElV1fbsReCmVJeISFcDcjzl1Gb8b4FdQimABSYEA
         zM55lD/ZPRvCFXm46vMj0rYqSdon4oyLGizcFHEW39Wi8Xbbtv37P7qAwBJMX4N1r6pc
         pVJEdnIdF0Yw9oYweBfJ5XVwkvUPPUahWmnfmqKeigHxvDPwXsdV96bx0KuMcni0t7co
         4c11Ount8hlbMyKs2Sgvl5FPUHcZEPp3svT9+TUZN+zwdi/tnHHpg2owRO1gM0B5uemw
         Pc+qUVotcGvFLLSFp1lMTA/Fdw1lDPMlCBn85ASGwMkpniaxLuSOnBMfJuhEAMojqxW/
         l9zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZJLwZdmHG1J7U4zFm5ItJmEERsIqGfKWpRanSsXpbkVrULrMT/yWny/eeLz2qLIF+pDPygqueX5joB4g8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fJYjkfKLmzeWUWjmcGOJdKGtf8KnLaatRVYula0dS883h0Mg
	sdMvA+EcST9Y7Q5TnFIC+4463GlQa5l2yy7DNlEjBhhWd4JN9uSRzq+CwBwS97veFiKm4RQEA2H
	h6hM0KZfqgOMOU1VrNmF36IEChutQpuBclHYUEK9faoRXE4iPhFIH2dXXfbBiLCVR7se2
X-Gm-Gg: Acq92OGDaredl8jZMPJoXO2txw2Z7LCGcYgfuWoNLuAnggHQk8MuY/8rdN1ufjoTgMc
	Qmi+LQbDKlc+MPNvNcMS3VGZAi7qHH0n6DRkWTuBuR7zrPAtxVNwKtZ/kUNpWk2qP/ShKQLcXjN
	q2lEuRFXFKAgtDrLfIf+ecJ/F9dm/IYHFYlvKI281CMkz0uZhZqDycmO7oqRb589+/+reO511xJ
	k0aYS+py5eOeMZK60ViG6Dy2i973GjU4FEgJ2orXuEsb29UrZjeSIk/pVLYwGAhdQ4A5lBu/bef
	e/Tdjcb5q2HoaKDAy0+D1RXZOEuzaaY3z6m2UHgGmbceFGDfuuEKIq9XCZqNDmntoJma6c1GahJ
	qLI0E79eHb6XQkbp28S7vssWLo3ZGPKD8fKgRgUJgaNwxJeyR+JhN/5ExNqflFNFm35kJOB8sfi
	zS
X-Received: by 2002:a17:902:e88e:b0:2b2:4260:109 with SMTP id d9443c01a7336-2c163d8ca4emr87064585ad.23.1780573062045;
        Thu, 04 Jun 2026 04:37:42 -0700 (PDT)
X-Received: by 2002:a17:902:e88e:b0:2b2:4260:109 with SMTP id d9443c01a7336-2c163d8ca4emr87064185ad.23.1780573061578;
        Thu, 04 Jun 2026 04:37:41 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.81.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fab9sm56977595ad.79.2026.06.04.04.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:37:41 -0700 (PDT)
Message-ID: <6d2f2756-0d83-4a84-a39e-d830bd0d9164@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 17:07:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a216386 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CuxhqhSUAd4m3DS74PnwmQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=I8ymiPN3apOPhcWNF14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMiBTYWx0ZWRfX/gVGDPWxUvbX
 59jg7E6v4JJGfX3rxvuDwqY8sGqG9vcFi2axsJvSOgGJNIdJWmy+qqgfrDWf4UGuEErs6nODPtB
 gi/dU2Ss1+pdJeCrNB7qWn1hWuRB+qFBuZTUM69qZwusiBcWnR6IOS6rL7as4R5CuL3tbOt/FiR
 mhmYuKSpdkj5bd2vSQHgsTWzGJT86TNZiHrpAUFA68TpJ6lji9bNnf6FrAz4IVlkZBZMFnfTulU
 MnyTE/qI6M6au3aX5nKfIVlS2i1EGPMRmpKD65kyDC3v+eDnViCG3eWwOwXmCFD7yPo/RVQ8NY3
 g4ePsJNjTVEzbF7bzg1ovq2x2DAvg0Tbr7lrQwl4oBwEhngl43W+K3G1/Jn+ormSdEyAhN1CuIU
 msT128V1W8odQuRkdUAs5nLkxdGrmKDh9qcFf2ljDy8pH7+m9bsinSpnHjxEjkKZbI1/ii+vbuR
 mUA1EjRVeS2bGlo8ioA==
X-Proofpoint-GUID: E7hGs1JECunMSEwSfihe08jZfUVIMIdY
X-Proofpoint-ORIG-GUID: E7hGs1JECunMSEwSfihe08jZfUVIMIdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111184-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D884E63F80B


On 6/3/2026 6:47 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 02, 2026 at 02:52:00PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>>
>> As per the design team, REFGEN block provides the reference current.
>> Hence marked the regulator type as REGULATOR_CURRENT.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
>>   1 file changed, 90 insertions(+), 4 deletions(-)
>>
>> @@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
>>   	return 1;
>>   }
>>   
>> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drvdata->enable_count++;
> I think, a regulator enable() is called only once. Is there a point in
> having enable_count as int?

Ack. Let me change it to boolean type.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +
>> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
>> +	drvdata->enable_count--;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +
>> +	return drvdata->enable_count > 0;
>> +}
> Linux knows if it had enabled the regulator. I think the usual case for
> the is_enabled is to be able to read the hardware state. What is the
> point of having this callback?

Without the is_enabled(), regulator core assumes that regulator is 
enabled and always-on and is_enabled() is not called. Hence, it is 
needed in this case.

3458 static int _regulator_is_enabled(struct regulator_dev *rdev)
3459 {
3460         /* A GPIO control always takes precedence */
3461         if (rdev->ena_pin)
3462                 return rdev->ena_gpio_state;
3463
3464         /* If we don't know then assume that the regulator is 
always on */
3465         if (!rdev->desc->ops->is_enabled)
3466                 return 1;
3467
3468         return rdev->desc->ops->is_enabled(rdev);
3469 }

>
>> +
>> +static const struct regulator_desc ipq9650_refgen_desc = {
>> +	.enable_time = 5,
>> +	.name = "refgen",
>> +	.owner = THIS_MODULE,
>> +	.type = REGULATOR_CURRENT,
>> +	.ops = &(const struct regulator_ops) {
>> +		.enable		= qcom_ipq9650_refgen_enable,
>> +		.disable	= qcom_ipq9650_refgen_disable,
>> +		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
>> +	},
>> +};
>> +
>>   static const struct regulator_desc sdm845_refgen_desc = {
>>   	.enable_time = 5,
>>   	.name = "refgen",

