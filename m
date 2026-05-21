Return-Path: <linux-arm-msm+bounces-108936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFfNEd+5DmrBBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:53:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03E5A065E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FC5730182E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B62C395AFB;
	Thu, 21 May 2026 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ1G0JTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4gqyLRB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139727B353
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349976; cv=none; b=nBaYQqZizK8/INJ9ofvhqziFheB00msPeUrNuuPsI/Ih/msCFtvyZlZ9uzeUK3j+Io7bDaVbIp8frHUz85tYgokkVkNb5eQM8udb6hdKqH0O5IbJdNVmDdc40U/KyYzplVwPJOyRbBjsIORE78ZaSDYVLXgrH4fbkfOzIcNJuJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349976; c=relaxed/simple;
	bh=stVPPS6O8UFoAUjYnTraqqaK8al/lIlE9rgsYzMSiIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbBUfAi8XtIhS15GWtr6MgM0Pb/1AkL7aJdEdZnOOVSU1RzKPeUO6UM3/bmps+7W3AHhAOG7Qms4dNAiVda52bbVBaNjhUN/mA8pa41qvaWYvYv358qtiB+HyUnGmhQEtH5PxpX12uQq1h5FUZbz1r4mkLsB0rxZHkFLbaXvlu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ1G0JTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4gqyLRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6fm4V2158077
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gnhFm+Z05zsb0VJc1wdbQL302KSFbm3E9qMnG4C42A=; b=KZ1G0JTHIHa/1L94
	4xcRazHzg87YkBNF/xyPb9sCZzF2NJconO6K4fygn/DBfFUM7wn4IbykM5JcO/lA
	EwH/wLjqz79s5u+94adtjkBIeN7oO2SIBtH2wmEnyNcrrklhTgTMD9AjCSfKf3ab
	WYxBX03fzrBikgIR4NuZ9dj4WJXVEqLoOIKkId7Kte3NeXtkg5OnK9rxdnDBNVOf
	eYwOIPdyMSXBdFX0S4XFQLJad9anlvUCEzIbfLJzMao8lWXIbyznoGzer+XddECe
	aIBCGBcDOV6fNQRnd+nxutP1QEEJL+pwKlLJQ5LykOLj7dr3f8q3LqT7Q7Lh5rIz
	dQIEUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma422yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:52:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514551d5f2aso230330251cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779349973; x=1779954773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gnhFm+Z05zsb0VJc1wdbQL302KSFbm3E9qMnG4C42A=;
        b=f4gqyLRBrYZ9FdyHFNeXvTHlSHJJegBQiEBZemk8sFZnbXx8d8S0nEtVzpvUxTRFVQ
         M+MhO/HGEnYsA4y7sd1bI/y2Absn6br8Se4JHRNLfjpWZ0HNz54Ur66CJAefWJgXLUqe
         OYNtKy8xzT1PVJWuPWTfIS2JZ46cebUDf0p72K95KwBVPtUchydZ4kj5ncqs/1Z+P2Zz
         +BMJ/Is3nPH9lVDQFqusK8HrCR14CPwqHLmDpIY3uO5NeYtsNGAmV9oWf0mlmMoYWR3q
         vMoFvBo7rxt1vgUQ9sOlhzvOcalU+A+4rHNxaYRTIoa/0YMBU3NTKg/poF1PMsFApqkc
         ZqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349973; x=1779954773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gnhFm+Z05zsb0VJc1wdbQL302KSFbm3E9qMnG4C42A=;
        b=SlrITXKWvFdpXxBF3a0aCugi5ZeNIFNXxZBlaNYupPjeDLMSHFLegl8ls21waX+Nko
         /0xaWo9zvqMHox+fxPcGSjwVFGxKEsT7sXdFECeJNF2KvyzsaY5TQGlKGNUcuXpoA3gv
         HHG4/CBiJ/jiJ8AEq4LmPS0EAhJECqr8fUl9QspviIRlTqhlXrLuvdSfATB7RW3O2uS6
         AVmZQ3QfODfAiowLtPTHMeH9lQxBSIg5akKnIpuPktI0WE+DMRrLi7qLxYzbCoR/ZHfD
         bBaIRcZvo02vozV+gn4RH1xwPqOWQLdW1DWoiJWKz8tiu+8TVgyhVG6JveX02MwvVS1/
         ca6g==
X-Forwarded-Encrypted: i=1; AFNElJ+GJWtiOo4Ut9FZVEWbZHfDkdd3DdeSCJ2mjSCKdNb7wyTDgnet4HZ6QM5usZyaV46Qf5FHfPwHVxwcX9HF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxphl4wBG7F6ya88iBAOXvzAb0El0uzFt103DUH3QqKQPCAiBsw
	82vq6+9mPZ4rmdjTlbwduRtw2UhT9aOI6ih6NNNp6Nmv7yW2glXISLtycs2trtJCdnToykVYjdn
	mWWpZhTrGzu8BKDO8Ht4E/FBuJNtk7/oSOw7mDyfbSLLgOPboKsJvQfq9KaQhWFAehTc9
X-Gm-Gg: Acq92OGOCCw/bQVR7CnoCbGWZXrQkDcG8lObYqpm/m4AwskriylfdOzuQv5TI2JTX5C
	Y+4J4b39mU9RtrkZre4dRKsYfni6CkcyQBuqUoTNZZqjhB+2NmKnmCHDUg074N/wrAPE7v3tq7/
	VF71Xx46kXzBy6Q6EpxHpGaVM+kXmjj0tTX2XfbrlNW7yntUmYCHXZQu3bt/7tt3eK5H5iIFB0j
	zyLq5iOv6efFH98omiD7gJ8kshnyCHTupoQQIWKsKKrwAmSDZ5kexAw8U3hxoioW76fgwIbVs7C
	UPXUlYpOax90fOL/LTf4bG3v6r+KRx1BEXzliDo+fRIqsKVadKRIeo1TE0wrFxD9XHv1xrueqbf
	UQvyZSqHvE1Y563c4tWJDq2W5QETUnOGrvZpp5Gm8tYVJCUVMQILwlUquI5w=
X-Received: by 2002:a05:622a:5e14:b0:50d:81c4:4c79 with SMTP id d75a77b69052e-516c557611bmr21837481cf.35.1779349972798;
        Thu, 21 May 2026 00:52:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5e14:b0:50d:81c4:4c79 with SMTP id d75a77b69052e-516c557611bmr21837291cf.35.1779349972343;
        Thu, 21 May 2026 00:52:52 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4903ad2ee77sm9386845e9.0.2026.05.21.00.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:52:51 -0700 (PDT)
Message-ID: <9793ea97-70bb-49a4-9b93-a6fe38e07965@oss.qualcomm.com>
Date: Thu, 21 May 2026 07:52:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: qcom: q6apm: add watermark event support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>
 <DINUJUCEDNXP.2BDISX62IPSQ2@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DINUJUCEDNXP.2BDISX62IPSQ2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0eb9d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LvOwEAKMvOOzFXVW9JgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nJjBTezlExjdzYIjt6NmgckMIZ2WmAaq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3NiBTYWx0ZWRfXwg/V46++bjIF
 tb1fyTY9ZUxMBfKtbaczJt7O69Aca93sl+iCIpIb7b99xq9OL1Z1Epb94/Am5uBsy++qCokJrOv
 5PZwb8qYSL20UGdfqDUGBfEgRK2X8g1qpA7tJIwSDrLhYQTaOEhjzY4BO2tspSCDHYaMNWuy9Lq
 v7ArtdR45uYDhl/U3J2tp4AjVAHXy8q5xB4L0HhTFykXthmTQYN1QaywnOFvUDmmUixPjBpIz0E
 GjWaF8cq1HIByfhf32deA9ISsa2dV29Lu1IWM6AKQTWf96p4v/1p8ZY2qjV97gOTvXKkHF4nw+i
 hfyn6JSyqREgogzM2wLAw1cNnEHOieI/coqp8HORL0wISE4XwdFxrZZdqm2qOvzZ6zDnGIBJ4tt
 BpmM+c+So6nsV5R7nn3R2cr01pnFpJYgmfK0KKVDcwWPMhw9c5vwOcTBAarDjj7iQcE9idhnnal
 s72Ol1EFRqM2DdLWRnA==
X-Proofpoint-ORIG-GUID: nJjBTezlExjdzYIjt6NmgckMIZ2WmAaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE03E5A065E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 10:11 PM, Alexey Klimov wrote:
> On Tue May 19, 2026 at 2:15 PM BST, Srinivas Kandagatla wrote:
>> Push-pull shared memory modules can report watermark events when the DSP
>> read/write index reaches configured circular buffer levels.
>>
>> Add support for registering watermark levels with the shared memory module
>> and route the resulting module event to q6apm clients using a new
>> APM_CLIENT_EVENT_WATERMARK_EVENT event.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/audioreach.c | 36 ++++++++++++++++++++++
>>  sound/soc/qcom/qdsp6/audioreach.h | 50 +++++++++++++++++++++++++++++++
>>  sound/soc/qcom/qdsp6/q6apm.c      | 19 ++++++++++++
>>  sound/soc/qcom/qdsp6/q6apm.h      |  2 ++
>>  4 files changed, 107 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index c984b12409dd..e6e9eb2e85aa 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -1118,6 +1118,42 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>  }
>>  
>> +int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes, int num_levels)
>> +{
>> +	struct apm_module_register_events *event;
>> +	struct event_cfg_sh_mem_pull_push_mode_watermark_t *level;
>> +	int i, payload_size;
>> +	struct gpr_pkt *pkt __free(kfree) = NULL;
>> +	void *p;
>> +
>> +	if (num_levels <= 0 || bytes <= 0)
>> +		return -EINVAL;
>> +
>> +	payload_size = sizeof(*event) + sizeof(*level) + num_levels * sizeof(uint32_t);
>> +
>> +	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_EVENTS, 0,
>> +				     graph->port->id, graph->shm_iid);
>> +	if (IS_ERR(pkt))
>> +		return PTR_ERR(pkt);
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +
>> +	event = p;
>> +	event->module_instance_id = graph->shm_iid;
>> +	event->event_id = EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK;
>> +	event->is_register = 1;
>> +	event->event_config_payload_size = sizeof(*level) + num_levels * sizeof(uint32_t);
>> +	p += sizeof(*event);
>> +	level = p;
>> +	level->num_water_mark_levels = num_levels;
>> +
>> +	for (i = 0; i < num_levels; i++)
>> +		level->level[i] = (i + 1) * bytes;
> 
> Let's hope that compilers optimize this to avoid multiplication, anyway
> it shouln't be a hot path, although I don't really know.
> 
> - don't you need a check like num_levels<=ARRAY_SIZE(level->level) before
> this loop? Looking at the code it seems that it relies on pkt which is
> allocated using audioreach_alloc_cmd_pkt() taking payload_size into
> account. Looks okay but I wanted to double check.
> 
thanks for the review Alexey,
Yes, its okay, its flexible array in that struct , as long we allocate
enough space at the end equal to number of levels its fine. This is
exactly what we do in
payload_size = sizeof(*event) + sizeof(*level) + num_levels *
sizeof(uint32_t);

> - level->level[] is of u32 types. Can level->level[i] = (i + 1) * bytes
> overflow?you mean overflow u32 bit value? Technically yes, but the level is
period bytes are limited to max of period size and num of periods which
is BUFFER_MAX SIZE that is 64k*8,


--srini

> 
> [..]
>> +struct event_cfg_sh_mem_pull_push_mode_watermark_t {
>> +	uint32_t num_water_mark_levels;
>> +	uint32_t level[];
>> +} __packed;
> [..]
> 
> Best regards,
> Alexey


