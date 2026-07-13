Return-Path: <linux-arm-msm+bounces-118832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cMxiCOYYVWq2jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:57:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9D74DCBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:57:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JX2omM8E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ORiy+NfT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88CB03031C15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3588E32A3E5;
	Mon, 13 Jul 2026 16:56:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95B02737E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961796; cv=none; b=FQVCPL3sOFnxNZVCLWZbrXN5iC8BK85OUIIV3YNpf0ZVU4VEqmeH2KKyjKGsPjMFjutsIxa428BfTDH/a0ixPfwVerNYjTo+FrEg2Vw7+go18oR276CUbqHLwF6J6uTb/hOloDMel3D95Z4cpeLOGvzvxAaczyP12XZkIHlXNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961796; c=relaxed/simple;
	bh=YOVKcvBDcl5QeFIAYmJr3NYTVxrvLURqfEhDCmXKHeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oo+w8XB7n5XCpZlkiDFiIT7pt3LeMtFeHp7mqlagO4nTYNWHmIT9pRoNYAO2LIBU2mWu2RvCNM+ks0CDOfD2hv4uaDciZ0y5drVClExuxN/am95XVy+Zpz3oL1SQPg/z/ReCquawCDbFim/F9mLQDptZGt3GiyfZbCUK7vFJc4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX2omM8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORiy+NfT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8Oi11922777
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r19hJChByIawCiG5mo+xQo8Hdwx6SlRuXbZQ0Q4Wfc0=; b=JX2omM8E8z/tMLmH
	FL2pZTMG2ZNKDMkAxp3C7yP+5WQJrFXtyg0G93RezL4by1z73TfdjYg+GZ5V2y6b
	v9IPI6yW1X4RWTUjziCnYbxSN3KmV84E27YfHYPmPKxsfcS5rbor+NJxHNa6TiIE
	nPjiXm0guxkHo/C96M82y8uqyrN1Iotf8LGOopff3oV2yB+A1tVmgnQYlAz4S0JA
	OIz8oXPxgZ1Z2GUGC9l3oKCNHriAURIGjKGDLEaW0elNxWQ21GhFoD9BEi6cn0fL
	dVtrBJ699iuY8ApfH4PVYDvTMPL3JqdlGkGugZ/kxq/PMU8dGz3XacS4ltGiYiYB
	bpZItQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsta2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so5588428a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783961793; x=1784566593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r19hJChByIawCiG5mo+xQo8Hdwx6SlRuXbZQ0Q4Wfc0=;
        b=ORiy+NfTwUZjYwT4Zoym4Z5ZG4zLuOu7YU6YL1JXLIn3lyaPWjg1JSwKk8g5wSqCg5
         tTyeDg344/+Eb9dYV6LdHce3Qyn6KvaF7Ls5BNCxokaH+CkCfum5lrUcwNSBwUl53caY
         WmffedMSADT9Th5CQIXFyb4T4jRIf1DD7oto7FrmPVSluMo00KVqzxPJexRCKidno+pF
         jg2nCq+RxtAKE7EK2kSdZmOFRi1Q7GjKPGdfIomrX77a4prQHPH/5kQEqA0alUqu8wdQ
         PBnSoLzzjf396+x0sTZuVPFRT6mft01Pe6Ti0av7Y4JN2xlNJMKwwuObzF1Uvt3mStnW
         x1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961793; x=1784566593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r19hJChByIawCiG5mo+xQo8Hdwx6SlRuXbZQ0Q4Wfc0=;
        b=D0UWk58IzOS+YSFnpnArlhpuleYkuo0NiiPD05iyooNQRBrV5N4pufX3bbpAbvtG/p
         w7Zc2k30mELeLPjdUKtIm6vQRjoNvJOw3enWN9UPmE8AorQnQEnAp4+2HkxsbzlIzS92
         T6/LXASTvmagLwy6qV+HWB0risV9JrP8p80UC03EhnYHL6XYReuN9x1YzOu15CC2hhYr
         l2jGPkm25FcLBRQANcXqOpSsSA+cdmXb9g0FRoG3x93/SBVqXujzX2S8NFuz93H25NWa
         rd+Secx8VJ30AotOZyxESLqrXKgIXLOO2SnImLwRzY7HTW5hiWvogLNf+8gZucp/c030
         C6sg==
X-Forwarded-Encrypted: i=1; AHgh+Ros5hjQALPVvuvLi6wJD9UBqi7BEPdFbAGprk6XyrFVLBXQd0Es2kX7LgMWZ4LJojbx2ltzWNa+EqwWFAfB@vger.kernel.org
X-Gm-Message-State: AOJu0YxZw52j6Nk/46116UN+OgkLmft7rNOl5pCEJCw21TUOMvZay0iU
	STYIkXx4Q0TJeVfCZI+j7fDP+LJJeVJdLNCM4SwkHqQsqKdBHdJg5SlGuJo0/07EhmR69lm1J53
	+U7wJZes6xW7JngEZpW6O0lXIJIOutTKX1nubLdAR21+cJk08zc9lVIoWU/U/Gk0uYU/6
X-Gm-Gg: AfdE7clBekG500xV9u/CAkSyD00d5+7OhJ/PAg16A2lQZml5bQNh0WtGO5ozW1BALzk
	+WESGDz+Iq8xajikEGqV8J7pHH9DCIhoA034n0BTuG8nhHqGMz/LQ/1+S6mdarm17IzJtHFoPqO
	em3IjdEGrVlYs9Upvv2/JK+VFTqHgewQjrVU9QvBvVXmwOF+/r2x9n2fBbPAsMIgmXnGfN+JxLw
	zExsG1RXBZ+PGgi/sgIdFUQ4X/UYbO7Db8CpXU+HZqF2f3WEbOhseSGGMlcK6ubVB/PmHOVseDo
	esM6ZB99JEI+cQ68u/qrSl0Zn7Cic7LeJ7llYNr5F+dOVSM8Ih2FrVFYmH59bPuJ5j+Z/jIdLGx
	hUn0v27cKOawXW8SFQ38THUoGt9ce/8LUiXl/Q/Fcs4tSHg==
X-Received: by 2002:a17:90a:d403:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-38dc777b95emr10042741a91.24.1783961792576;
        Mon, 13 Jul 2026 09:56:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d403:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-38dc777b95emr10042704a91.24.1783961792124;
        Mon, 13 Jul 2026 09:56:32 -0700 (PDT)
Received: from [192.168.1.100] ([157.48.180.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm76694721eec.27.2026.07.13.09.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:56:31 -0700 (PDT)
Message-ID: <cda89e9b-fa5d-4a17-9427-dcdadc0d8491@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:26:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
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
 <aktEMg55d6J_omaN@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aktEMg55d6J_omaN@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a5518c1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=62VzjLAzdHZQ3L95IMgkXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QSFfxCxHlpgOv1NLln8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: d4ENzYCA4LsVW2sR6800zn14K1dCqMQh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfXzp6CeB+WhSMO
 xEj2RAelw5UJbOiLYZkqxDEUOXpRZYRtuJFXPVjuaFOeYyNTU0rvJytPo4zfZrVGoGqOIIQ65iK
 jTUaGDxy7pvEMrw6ofoIOBe59xKxzP0=
X-Proofpoint-GUID: d4ENzYCA4LsVW2sR6800zn14K1dCqMQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfXyEZ7ftZ0rAO+
 YK+gm1upz+TqdZbdfInmCdQD6FWB4wCQlSsDlmzWn6sewNsMYEqTQUpwRuBgyWE+KR/xCk7jPA+
 o3VN0i2sAejexiEn6ThvVHPtMXAEUIj117IzZRAmPuD2Ouwc92QhZPS57sM2zpBls1rPFH0upic
 Oim2F/hXLnADf+G65DaZglNoAN5NOQwShsWXBd7FljKY9lcqz8V6ZVWpZl91VmAYwq7wEQ+bOr/
 7iKXk3aQFNTWOoEMU4uV0Y5vgjmXc1bYchWWqvhmVSdb59Rrcbl+heN+lLRJJ8+hXK1qsHu6fLw
 ljs31tGFx8ovhWrcfbdPjUoOL3zJw0scUEF3csyo3ip7dIbaKrXfUYpAMtxlOp1NYK11+XI7ZOm
 pcBGLSgS9ztABjHxhPcKJiXIjWKn2G7IwJH9L/nbXo3M+V4fp95Ls7J2ZKHzFZJXoK6ts9hxR7F
 Pjd0VN/tI+ww7AIHnpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-118832-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: C0F9D74DCBB

Hi Andy,

On 7/6/2026 11:29 AM, Andy Shevchenko wrote:
> On Sun, Jul 05, 2026 at 10:23:35PM +0530, Jishnu Prakash wrote:
>> Add support for ADC_TM part of PMIC5 Gen3.
>>
>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>> drivers, used to support thermal trip points.
> 
> ...
> 
>> +DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *, adc5_gen3_mutex_lock(_T->dev),
>> +	     adc5_gen3_mutex_unlock(_T->dev))
> 
> Logical split is slightly better.
> 
> DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *,
> 	     adc5_gen3_mutex_lock(_T->dev), adc5_gen3_mutex_unlock(_T->dev))
> 
> 
> ...
> 
>> +static int adc5_gen3_tm_status_check(struct adc_tm5_gen3_chip *adc_tm5,
>> +				     int sdam_index, u8 tm_status[at_least 2])
> 
> This function uses exact size of the submitted tm_status. Instead of creating a
> complications to the compiler with all these new fancy attributes, just pass the
> sizeof in an additional argument.
> 
>> +{
>> +	int ret;
>> +
>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
>> +			     tm_status, 2);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS_CLR,
>> +				     tm_status, 2);
>> +}
>> +
>> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>> +	u8 tm_status[2] = { };
> 
> ^^^^ The only case for the above function.

Yes, it might be better to call adc5_gen3_read() and adc5_gen3_status_clear()
directly now than keep them in a separate function. I'll update it this way.

> 
> Also why do you need to nullify it? If it's an error condition, the compiler
> should be clever enough to see this. It's not that complicated code.
> 

I think the null initialization is not needed, I'll remove it.

I'll also address all your other comments in the next patch series.

Thanks,
Jishnu


>> +	int sdam_index;
>> +
>> +	sdam_index = get_sdam_from_irq(adc_tm5, irq);
>> +	if (sdam_index < 0)
>> +		return IRQ_NONE;
>> +
>> +	scoped_guard(adc5_gen3, adc_tm5) {
> 
>> +		int ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
>> +						    tm_status);
>> +		if (ret)
>> +			return IRQ_NONE;

