Return-Path: <linux-arm-msm+bounces-114008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2pvEG606OWqwowcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE46AFEB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lQUjJQxK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BrX6uklc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDD503023045
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B33AFAFE;
	Mon, 22 Jun 2026 13:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D77364EB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135435; cv=none; b=KgIlUPgxAQYK0qW6qTRa7QCQVFLs7jBgYBWmViJFBfM062+OcY3SkXzrQdP1pDDztXrQNyIGp7CPvKDV63J1W/zFW3XNqPMU3qnvo1ZbNjuYO55ysoQM7BevZ2VRvw83RZFlhPDxdJnXAGovBx8bsRhlrqzKBQA51wLcD6IOSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135435; c=relaxed/simple;
	bh=qNePZ2yyw2RzjTYGbgoDf2Xu+Qhz3jY2FpDHTgb+nEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukel8W22PIg560s8t5fVYQOJwB/YEsgA4BTNfmm4iZAiOLFlWv7YY36e/A83GJuOWKkXlJoeV/oSqh4dGM8J0TF8lxAEjWWrQUsuLUJMcW486MBlLnmxHWMhDQH9c0vSMw0W7C+hquZ27rie4enS4pK5HaQMdvT59Ufpg36y4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQUjJQxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BrX6uklc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFjk6792460
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGAZiXTQHTlA7pjXyOhWPFIXo4iYevKMCgx+Q3SEXJY=; b=lQUjJQxKC+bFHWxv
	rAlHPzsQscxFtSrNAlS3ZcAwDN/0EKB5/3UR3nQ4oXmGnuRPLNbCuoF38KHanWJ8
	Y6U4w0H9TTz85j+ctaH0dK+nSlYU44L7k2uTUGkfZB2KjUf09XsCPXxfEIBjiD++
	Id+2eoMS5XlPYYy95uD26flgckVjR60Pm9IIYRFUD6nTd48X1hgqd18Dm+lA2W/e
	c2nKd6q7C4GR6dve+9v/gjF4cCIkd4+rfbKM7/VVKTQDOh88Md+4sCx5lhdlLnr/
	cuG+y97AVrUVljrPmfZ5zfosYly6EMz4pXIqtg4jFfPZMWvs4fYd9yrkHHP3582e
	dMxUiA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq0kcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:37:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbfb73db13so120808e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782135433; x=1782740233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGAZiXTQHTlA7pjXyOhWPFIXo4iYevKMCgx+Q3SEXJY=;
        b=BrX6uklcTbRpEW6kguNo+0m93aOPyK1MiTPAH8uaudpr4V24O6g3ZLV5M7YsB0JDEa
         uFys2OhLsO8SdyQfEPS4PSe48mpsNaMRtAMiPciaBLEr2Kdop66PbYuxDaQ8HivX0rQL
         PfatB5mBaI3yod4upKVVvpLS5J73ujHpsW7C2Wh9rWlsswskfEniPbxrENSZ4ylmOznW
         4xMnH6q9kQn37Bh0zsbFSO3908H6cUII9JU8s9XcU5oKIaIZl1ybaGfCUE7vdDLaMbfQ
         IyiLBHN8sOwcpSAUegsCrpagnY756XtTVhysy1S+zCduGb2BdIdKeQg2led4ZIBcI5zO
         cEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135433; x=1782740233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGAZiXTQHTlA7pjXyOhWPFIXo4iYevKMCgx+Q3SEXJY=;
        b=DluhyvLqrO6jWgNqxgOdogp5iWtNIfRs8G8UaWvLtaIA0Ql7Nyf+RVHavI1AI1dpuR
         6jxICr9cCYFsu5KZuWbtXzHwP8cvrVVVk/Cc9T1XJI2RPl2boVLUetijS78v/UdcYkfh
         +R+EMtAbGs8pM1i6t4xMQobvKchvz7DaHWhS4rqslS3TD7htB+s4VxEf5u3LG/Xt4JAh
         5kzrbI4OT2rjOFW3rDuqpIBMBWp51ftBW3cdnnGihi5emRnzD28xKHkbIh4PleIV6LwD
         flmfBlSi22TTf01s4bhZ0xyrYgBv2piNZRMPh5DtnuL+XJkUnaiL8wtBDXc/4Naus1QH
         WZ8w==
X-Forwarded-Encrypted: i=1; AFNElJ9r4qh7SorjXLVyPIzzlbGnaCP8g2r/x+hyxNTCWujahc4iOuLMTPFX/LpTbFNiY3DdImIqZi/dBRtnvAFk@vger.kernel.org
X-Gm-Message-State: AOJu0YyHRlP+WekNhGnFPjadoM1G9uDJE778daasJZ7s3O9oSlNLfAQy
	Y6POkKyhx9AmonEM71ZMHdwmGfHh7vcDF/TfzZWe2mu0zziV5MwqoptZLwFCs63PUaFXYSxpUVV
	rhVLEFxzzSguHfsYtm3bYoKB2ASDs8p8SW+I+VDkak26AHqy+3Hkv1JNNaMB+Lw5IdrZq
X-Gm-Gg: AfdE7cnO8CkUICmXrV2rJetxuwSp7V7KfFqc7ACZDCPvGMYswIUxongsrEjnMnqL7hL
	zHytEe5RMalp3S6fMQt4QvTRWDOilH8yMiayD9taOH2nmlxIduBkA8gIrcH6ehg+QvdZaQNVV0e
	su0HClSVJk68y4psy8+XwhjnDLp7aBTaFAeInQCXy8fhgArmAZtJ3Diah8KiZjVNjdITZhxQwID
	hQ4T7O8i2y7BoU2g+mEG+5/LwKozC9nhaD6yCBWb+0m9xyYediCrJcgHQEFHtGPLjaexA6fBIzS
	6lY/TppKR5ZHWLXw4qhSXz7Nv+KSqklhsxiNb6jDYS2KwE+TeuQvhC5oKKTQOdXlgRSNK2H62az
	OfepW5z/sqYtHQchFEL7L6f5lv7sa5kWabPc=
X-Received: by 2002:a05:6102:3e2a:b0:633:3bf6:977c with SMTP id ada2fe7eead31-72b1402325fmr2041709137.1.1782135432917;
        Mon, 22 Jun 2026 06:37:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3e2a:b0:633:3bf6:977c with SMTP id ada2fe7eead31-72b1402325fmr2041691137.1.1782135432502;
        Mon, 22 Jun 2026 06:37:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e12f6sm376327566b.47.2026.06.22.06.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:37:11 -0700 (PDT)
Message-ID: <d786b2bb-42da-458e-a952-5d80b97d8a58@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drivers/rpmsg: Fix copy of channel->name into open
 request
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260608095523.2606-33-david.laight.linux@gmail.com>
 <79c1dda2-153e-4b7a-ad18-c72db1cf4a00@oss.qualcomm.com>
 <20260618155939.6cdbdbac@pumpkin>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618155939.6cdbdbac@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iANTGjFG40DJdcvohyB3ZuzmkKzUGHQg
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a393a89 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UhM6YWHzZrMyvu7RIJkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: iANTGjFG40DJdcvohyB3ZuzmkKzUGHQg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX/oenV63vXJgW
 yHvSME2vC3t9SEt3YPkbaJTyxjUG5jgDUAQY50YBMgKxbATBRrPQcKIUlOtfGL6tqFWUL1672q/
 IFhU7M1aMizmPpHpt/9nvocVdcLlEqVF3wSMfvKZmdNrneiNWjgrClu9E5Ha5D8ZZf+uIJJMJ6M
 Y2g5YY0U60wwjHnOmdgCeU3SDofsF7CIDnpRyHUSzm1ekt11AGtkKLoaa2Y8Q1+7zPIZOcMDzzq
 J9spat1NuxiGJ6uHIwghGbfx5NiNKHbZDarIs/FWEtJTY1U1+KVg8FsCP73CuTa+5OZHewvw6/p
 z28PQ1h1ZO2VK9jEigLYCnM1GE7fqGUpFxadT8beIjUVSpYyXHkes5Gef3PZ7jnzF6Ps3BpyAhA
 EUs4e3t2Hbp8Fh2V+FgYt62TkPf+QqsZNh2ZwDIE8NKfUAN3eoZf5LMYmNltzdRY1jVctmAMNYy
 kCFxxE3gil21uPmoMDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfXz2dRox3td5d5
 Ip2XjEW3jEIu+1hpYx9b5t+RtdfZe4+BIbI26sK7yOUpBBoul50IKwKXRiaKllmgl+82gGNN5jd
 La8Xoo3apdZCbJiJpjXmc2WZOQKQmQ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114008-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:arnd@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFEE46AFEB6

On 6/18/26 4:59 PM, David Laight wrote:
> On Thu, 18 Jun 2026 15:24:17 +0200
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 6/8/26 11:55 AM, david.laight.linux@gmail.com wrote:
>>> From: David Laight <david.laight.linux@gmail.com>
>>>
>>> Nothing obvious ensures that the name is less than GLINK_CMD_OPEN (32)  
>> 						     ^ GLINK_NAME_SIZE
> 
> I was writing a lot of commit messages, most with -m 'text'.
> 
>> [...]
>>
>>> @@ -481,8 +481,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>>>  				    struct glink_channel *channel)
>>>  {
>>>  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
>>> -	int name_len = strlen(channel->name) + 1;
>>> -	int req_len = ALIGN(sizeof(*req) + name_len, 8);
>>> +	int name_len, req_len;
>>>  	int ret;
>>>  	unsigned long flags;
>>>  
>>> @@ -498,14 +497,20 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>>>  
>>>  	channel->lcid = ret;
>>>  
>>> +	name_len = strscpy_pad(req->data, channel->name, GLINK_NAME_SIZE);
>>> +	if (name_len < 0)
>>> +		name_len = GLINK_NAME_SIZE;
>>> +	else
>>> +		name_len++;  
>>
>> Should we perhaps do something along the lines of:
>>
>> WARN_ON(strlen(name) > GLINK_NAME_SIZE)
>>
>> to prevent silent clipping?
> 
> strscpy() tells you whether the copy got truncated.
> No point calling strlen() again.

Right.

> But I'm not really sure it is worth it.
> Any length check of user-supplied names should be much earlier,
> this is just ensuring this code doesn't overwrite its own stack.
> (and ensuring stale stack doesn't get sent as padding).

Fair. I'll check that out separately.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

