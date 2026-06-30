Return-Path: <linux-arm-msm+bounces-115259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m0D3C5BUQ2r9WwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:30:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC496E07BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:30:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cZl9E8Ps;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A34YschW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115259-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115259-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3220230097E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 05:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7303ACA61;
	Tue, 30 Jun 2026 05:30:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7253537F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782797449; cv=none; b=Ok/9RwpyAmDs9E6pPQyBcmeKn0KPsADPd5my/x11YVvSt59wreVyuXqPtF7Fe/xfOuPdLGN3YG+vpx1kQUcwqa0zxHBXCnaXKtLNRknPhV7fcYXMEQaMWlcwGKFDYT9DXYy4Xk/+UzZY4ZrppraNGWegoGciFiD5m1l0SdlAIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782797449; c=relaxed/simple;
	bh=AMbCfl1TqOeipjOiTdE0+IqDoXL9fNroA+PH+fRuGzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cR3O4MEUl3JH0F3UW+kN4cMyf37uKnE9Tqb04gYXEnVILRq2asHVHrK+3kkpEbL1DmrVtNZwsOigiuNyuyPVaNx1KLCAnAmhfr6LDGp5ZFEJlazMx6uNe32vMWjfvUC6zjYpEvra+Htc/gJSrAd0Vog1+YP8YBen+dOZe+3E2Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZl9E8Ps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A34YschW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U2JjGQ516721
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhiYGokexxUvHxryATmlhdYY6XJnEz/snuGmeXg93hw=; b=cZl9E8PsrXl9QgCL
	jh31zWrJCAL8BAjCgp6BFt9K0QiFrtIWvjI9E6Lo18MFhpybP+cfEla8/C09rRPF
	5dbqoZ1DlXwbkOflsm8YA994DYvVNq95aYnGDx9ywP3WryxDrGzaG1aKv0h+Y8dR
	j3NP9NpWHUIL4V6OSwULCyUKQGGMboNHYrXT4MDScqy1yTTEkiMvdecm2wdMWx3w
	l+WAYl7Ao4vJezHEv0DiR/xLkbv5C8hUASKS/l8wtqYc5hp+vUSYOm3dbY2tBCpW
	ikzbjklRP5NT81SVHd2/d8XES/ASALckAB8rN3FHOez4syhh/aKynuO4vHK+X944
	f9xjNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp0k4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:30:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so1763148eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782797447; x=1783402247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhiYGokexxUvHxryATmlhdYY6XJnEz/snuGmeXg93hw=;
        b=A34YschWm9+uuk7NcgJnjH3l0Vma46ShVH33wlhvTsxkFCaGEZR/GrmRUwvMUi71Sz
         ibUCJ8oLcZzRfU2rkMmqn12fjYLrWeW1m7f/QhyfoWax80GvAJB16SGhZ1nZASFFVzDq
         IvFbXJwP/ZxSJ6SRKwNFU9MO1Fd6zkZwLU+R7QkA2H217YCczGlLvYghdv0hca4iD8O9
         Mv8ubyWUDF759YwGR07+flIEP55y+OSYlk/7uAnuY2XBLOX4lvMPIykJUz6PD7dpR7NC
         4DtXxlfmLxCbiTtOOZwqkA9KvYr5iZMOSbLQcGsOVyiZD+Lve+BuJsFIE/WvGJNXxIB/
         3cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782797447; x=1783402247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhiYGokexxUvHxryATmlhdYY6XJnEz/snuGmeXg93hw=;
        b=h8YDIyOTrX7lz2L0BNZOSQZOBLnSHTG2OGlY8jS7+o8IwwXOw06Z702feWNWFAkcW7
         78qmfMovZCJ0UgbgPuU1/F3/DKE+wYDfgzIAF3J95sjyfu14yFMunfx8i64qhFE5hpUq
         rI4jgNte7prJ5OQALRjJDhgOSxxZ6l65kvPM1+hELeTI4PyPf9b/Z+pJ6Gy6JkkHO7Gw
         5Bp8yQViyjj6fNhTsjx5xUcSLowuZGVn5TDMaOVr7wHhIIWZRaOjTRtIBYitDuYo3PF9
         WBA7OBtRhfzjEh64bEFCULHKo6onUDQL7gYAclLK3rQD17dPT0YxSMeEx7tvUPg8a4qg
         qYKg==
X-Forwarded-Encrypted: i=1; AHgh+RrBgvEWz6crjzZ3NQElKBrd0nIc9T0abHmr2eQSveY4tmMsc6FxN94XtBH60N6TkONmnIPoFX2AeX36rI8B@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2Oas/pqFleWSgnz9fzOR7nvpm55x8Es2mixhOVttsaiCIVWg
	Kc+aw9yZZxYlHGHc9oapIDrQ0WD8ryKbiC4suqu3eXnw1cTed2OtP55x9iVePv+4mW2+fk3FS9T
	d3AtT6K6Ky5xI6h3hB87WBxpOJkSwYIe+qj4tZAVUor1C3xPpiYpt+InV/rb6w6bhZAww
X-Gm-Gg: AfdE7cnZcggCpY5DQZ7w+pxejPNxwGuMNp3cfvUfVULEPn0KLxvuvbBXJtWe8fFXwsA
	rWaVevk5SbRyMo3u4ec3lc4QWQ1lXX2HF3JKx3tnDNelrvTRHn9udJoVDKWB/W3eqshzdDHUrV7
	YcCRxsUfHeZ4tP2aPClLtKvngrlJmJILNOEmOQFhP97myMYGf1KHd/qRpXxHZsFebUICw5Zt9Pr
	F2KkLkmPYylQL30BCDvWxNwyOFqUi9OHW2uovqIuUruBK2RcEd4Rzd8yVq16KS6L2L1bqfT9gsy
	pFzwnbDzEQravIl5wuRmMTRrU9Nos8VGfTFwFei2At39vx/nKAPxjqXJNmywBo0eGsoYBPjnVT1
	O9fRgQ/aZWIXQ2xJ9jwwtUbf0UXgporAjhpOtP+O1ApT9HKq5hTbE8z9kYGrYge068vPvrzZmQB
	LrbsNO97ILMpSH6/2TafeMaXvLyrg=
X-Received: by 2002:a05:693c:3b09:b0:30b:bda8:a70b with SMTP id 5a478bee46e88-30ee12bf278mr1453057eec.4.1782797446970;
        Mon, 29 Jun 2026 22:30:46 -0700 (PDT)
X-Received: by 2002:a05:693c:3b09:b0:30b:bda8:a70b with SMTP id 5a478bee46e88-30ee12bf278mr1453031eec.4.1782797446349;
        Mon, 29 Jun 2026 22:30:46 -0700 (PDT)
Received: from [10.242.229.199] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.19.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm6404411eec.0.2026.06.29.22.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:30:45 -0700 (PDT)
Message-ID: <5dae2ab9-76ef-4516-b21d-80729bf7ed79@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:00:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
 <48334852-b131-d6a0-469f-09e15d6765d5@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <48334852-b131-d6a0-469f-09e15d6765d5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1ZQxFmbdsZu_6uojLo_gBci3HWVIOhbC
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a435487 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=3ivmCuETaj/XXnlAhr/wyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sTVR4Ors8kAh6zT4N6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 1ZQxFmbdsZu_6uojLo_gBci3HWVIOhbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX/faS7Oqw8QKr
 bJj0uxQBia3BZB7XnRU7PpAOjbTr4UYEYpkZ1VBN7kk9Ts1kaBuD3mjr8ykGRRdxoNSjp0SNHvV
 MuXGvTr2KUc1f2YCuh3rTUAFbQUbIVbcoOnvyMQQnrVIRxekEtnHbRyP7j4y09+Q9Rznuik7HGu
 ZPOzijiOdNvyibkfugFxxu1LkCTaEXHjJNA4F5u7r2UlXijDFD50wgH5gM2fVMgG4qceyP5UdNm
 7CWm7LNSdDYsozKmYcf2UISUw8Le7frk3TKuFNf90GkdSDQ81GT2/jznCoEObocAqfGRVcvrNSN
 ehCyzRR5DZfg3ShxdeN9q21j5GXdqStfLNJmt9BOtnOphNbmupWjcmJGIcu/VpO0yLFPIddR9kg
 hiERtJ1O97aE3Wi7ttahlsvrjdVtghWe0FJdrmQnQcByXyjL1XYm20yoyxztPYQdyqIlCYCZs+k
 z5MlAXOtHGAU8Btticw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX4ik6tGYZkR7V
 irYbg1tHanQiGZiMJc5qVystQ/7DrRoP7vvPxUsU46bmlQ/w4lyIw22yUjKS/J14EkAxsSen7Te
 3Ahl7xJYiCRTvfmoRFkIKlQkZdyDRWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115259-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:ilpo.jarvinen@linux.intel.com,m:sibi.sankar@oss.qualcomm.com,m:hansg@kernel.org,m:bryan.odonoghue@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:linux-arm-msm@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FC496E07BE



On 6/29/2026 6:03 PM, Ilpo Järvinen wrote:
> On Mon, 29 Jun 2026, Anvesh Jain P wrote:
> 
>> Each fan is registered as a thermal cooling device using
>> devm_thermal_of_cooling_device_register(). When the thermal core gained
>> cooling device ID support, the helper's prototype changed: its second
>> argument became a 'u32 cdev_id' and its third a 'const char *type',
>> replacing the previous 'struct device_node *np'.
>>
>> The resulting semantic conflict between the EC driver and the reworked
>> thermal helper was resolved while merging the drivers-x86 tree into
>> linux-next by passing NULL as the 'type' argument, dropping the per-fan
>> 'name' string. As a result every fan is registered as a cooling device
>> with an empty name.
>>
>> Pass 'name' as the 'type' argument so the cooling devices are registered
>> with their intended "qcom_ec_fan_<n>" names.
>>
>> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 45829f2786b7..12196d56b60e 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  		ec_cdev->fan_id = i + 1;
>>  		ec_cdev->parent_dev = dev;
>>  
>> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
>> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, name, ec_cdev,
>>  									&qcom_ec_thermal_ops);
>>  		if (IS_ERR(ec_cdev->cdev)) {
>>  			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
>>
>> ---
>> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> 
> $ git log 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> fatal: bad object 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> 
> Please don't base your submissions on some random commits. There has never 
> been code with (dev, 0, NULL, ...) in platforms drivers tree (and neither 
> in Linus' tree).
> 

You're right. I based this on a linux-next snapshot; the (dev, 0, NULL,
...) form only existed transiently as a merge-conflict fixup there and
never in the platform-drivers or Linus' tree. Current linux-next already
registers the fans with 'name' via
devm_thermal_of_child_cooling_device_register(), so the issue is gone.

I'll drop this patch.

-- 
Best Regards,
Anvesh


