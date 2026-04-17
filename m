Return-Path: <linux-arm-msm+bounces-103558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLQqHeV34mnh6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:11:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5741DD92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BEE5300877F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D878C383C9C;
	Fri, 17 Apr 2026 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARu/+63R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8cGHqp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784E833FE27
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449314; cv=none; b=hgNkZwsvi0XbGeg87t70+OOF/KVcK6ygwcAhXS54n1Q5zoKb81/ZbiyUrdoyMXFR8PK0HoxUHseqZat1dEU7E2yqtflVNjUgvl45tc3N/LGsbgiCX7fn5vbDfca6YDWjKBkb7Dc/hQCYiCS/Y5dtgSvcEdFE+t+N5ZY6JKyRljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449314; c=relaxed/simple;
	bh=GGBj5Omn5eGTfnwBhm7bOf3DSJcY3zfC7XPsQH3CnY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnwPXR0pnGs6N7AUKETuLf2jdNw9NJ2ga0+0d28k1ezvSUp6I1HqhOkWRD1GYJS8K9OlH8czfvWVOFFU5mB35C4rvFSS7+/j5Q294w2cuIreljl+SZMQsbrUP9XrnPQswLp8JsLXoy2ZlQrQhcYsk4SiGMH+CxothkwSFoaS7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARu/+63R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8cGHqp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4Zvd455067
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=; b=ARu/+63RHiJpOpF/
	1Hb3ePPyv2yQ0asDXeCVZDLxE3NW1rzhDMFydE9U7Bf69SRaFCBJjne9EE0XT/Wp
	xltTcJXcWoCy+ebIp7BRfSszKAOn94mPY/FFG9+04weblHmO+p8OyKh49ZH23ptd
	/bRbEtced7BCRTVTUSB83UzjV1DE3+DfMm08GkO/g652YePBxZxRoWLEnh+fd779
	lapMCpmkU1hQLw6MoPs4vmETe1Rk/eh7+Lnf9HYXJmKuGFDxrxW/GAv3d5gMDFH2
	nEb+mEAKFCcVWmo6pyaARJsBuV6BAtW+B5zt6fw5BUvIqdB5Ve9gnUYZsfj2urr0
	0d63iw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88tc5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:08:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso965153a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449306; x=1777054106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=;
        b=N8cGHqp5JT3aOQDXXSrqPl0wyXF30k6JoP2AtpWEAj2hsCgRXZ8ZSCmm5L4eCf571n
         TFN/1II7DZwMoePafKrSq3JSaY7oR8k2NNq8F15R0Oks324jqgJhejdlF/pEoALZVE65
         S4GSDuqnc4lSRYk6rxtqQECHZUUiGVy+XQMDtL315pRwL31NQ6aVASfd8n121yMDvKlC
         /AwCv6rrHnztPgv5k1WViYx8xboMMWh2rnI8kqDqk90/KcNExhGaoTbNMXPLXVwSDJo/
         iBwaFtoZX4JUUp3gBqvhrU+AtXCTAUSi8pCuQTauSeF9UVhCLn1zC8zuFyJWflTRkkn2
         68Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449306; x=1777054106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=;
        b=czlX5SWKq+2C2B60xaQwEcgKduRTrFRbdaPjOvg6095539jFZ3dkHCtzUg7XLw084s
         WvpTlZe2XH06XdEDNbZsf9quI9ZrApHnxC/dHJRi5AMeDIKZfWaUPJ5vi/TVbjRVFpEB
         bJmhkVXt3H6AG9JFermCGuRu2Ft0I5aLDoI7gL7a1Lq469mq/Wsvh1dqEECt/croeTAF
         qEvAmsBbB8xLjKFUKVAL5nk1XetUGxvmPAS8/BIKqH+hQf9QCcMnUn0y/cf1MP9rOn/r
         uYZWloonNixK0bQpeRDmi1KgmabISR+X4P/tMy7K0AFvZ9Oahwd/6pXH86IYB/iXsBMm
         OP+w==
X-Forwarded-Encrypted: i=1; AFNElJ/byeaF3W+MxnGEYh/ZSWo0mlBL4CeDTo/ZaTC73vk85zellOB8p3RbUTFzPqqm6eHYvMDLHFwOmlQAuNhJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqn6k1XmlpMYL6ogOp8mYNzyojxxJUx/VpQOUr3K6wdWexZ4F+
	b9i7vcXRNvtc5KduRrzm9so6R4xQ0gVWVJoiI5ljnBZwF/927vQNe8gW2hV94eXtSgOvTSvvWLK
	9bDrziReaIVZ2YRA+PBLt83RCaSg4oQtfjA0U3i7J+iDFedHr++zPiXHTsMj2S4pR4X6z
X-Gm-Gg: AeBDieu0MllTeLliE1kX7XuIKy56CTlf7TZkW2+1YpRhOPFraFvIPwH8BoiNlWnlxuh
	Xy8Bm6YVNoIEB4gBT8QnjNbyPN1eJMeT9gpqWr8qyd37WrtWOQi9KiOeYs4XVmy2AsY/fa774W7
	OWedRPaYgAYm3I38avvWDoeBOy/fOuaKmhW6p5ug3bg+zk7doATIx0BolH9ZS9PB47gz7v1StSh
	SHEuXwHr31Y5UKF1+Kck4O4vcHyxqAsZmbA4nABZ/tlPsw6rHjqTm0jD9k4J0i1HUO/gn62ckOj
	OKK2+6NWwf9hMen2Yy//xWotHJGItk+c7uKWXHb08gHKr/tVxBpNFp0JOsL0UgWZ3gabMUIru4R
	xUqnCwQv0Bp3UmsjVYiDVw6lPW05jds5zfb3VHM6q3BWo+KOC7w7mcdIZ+/dxxQf7
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-361404b8efbmr3987070a91.24.1776449306069;
        Fri, 17 Apr 2026 11:08:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-361404b8efbmr3987033a91.24.1776449305385;
        Fri, 17 Apr 2026 11:08:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.17.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm33496785ad.7.2026.04.17.11.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 11:08:25 -0700 (PDT)
Message-ID: <680211d2-9277-4a44-b403-a2c17e531d3a@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 23:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4dKT_yZjxKoTkNhQzROfJJKeb_fkVClU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfX9aL6PdTtxoka
 MIwXjw1ZcqmBTBN/Op550YVygkZTeR5lBiYBJb62iVkpoaPC25PFrnQopdXPOD+FKbcN2af8EbS
 rO352eS6CyIwG6R5AKk6B86R+zOcynAYLH+Dr7GkunXqwicHH2ryLcJxCZYjYY08GJhi4ljbv5v
 jmuFtKlPAyv7v1AueXu/ptbQBuXzV+dEYNksQ2bXz43Pz5TjpYvmF1MbwsTlt0LUI++IvlGrE5B
 BMIHchX2+k8dYDpzGdpQyctOUiMwZct2hFOE8UCfaEgwQaU3c55v3SXEY53slSMmxwm6IB8b/uO
 t7q4cG3qQtgsB3jDrjd38ywiSkzmH1f0qtHdysG+W6y9cKvycqcgHhFcp6g1Gf24CyNl8OETkUp
 hV3WQNTLmmlT+TlZ2Z8l696nFwkFUB/iT50UoKoqxwFAw3LQz+zXn8VZuPpJ4k80LQjTI9i1eDG
 0u+SiiErZSGhGajMv6A==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2771b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AEHGBJ4MxtK84nyFdbYi0g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bmlHNXG4B5j1TUniDnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4dKT_yZjxKoTkNhQzROfJJKeb_fkVClU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170182
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103558-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1D5741DD92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Daniel/Guenter,


On 3/20/2026 9:38 PM, Daniel Lezcano wrote:
> 
> Hi Guenter,
> 
> On 3/20/26 16:22, Guenter Roeck wrote:
>> On 3/20/26 07:52, Daniel Lezcano wrote:
> 
> [ ... ]
> 
>>>> +
>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>> +
>>>> +/* Interrupt names for each alarm level */
>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>> +    [LVL0] = "bcl-max-min",
>>>> +    [LVL1] = "bcl-critical",
>>>> +};
>>>
>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>> and critical. Would it make sense to do adaptative min / max ? So when
>>
>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>> an additional _cap_alarm for power attributes and _emergency_alarm
>> for temperature attributes. There is also a generic _alarm attribute
>> for each sensor, which is supposed to be used if the specific alarm
>> type is not known.
>>
>> What exactly are the three levels of alarms ?
> 
> Manaf can give more clarifications, but it is like we have yellow, 
> orange and red alarms. So there is an additional alarm comparing to what 
> is available in hwmon. The proposed driver maps orange and red alarms, 
> respectively to bcl-max and bcl-critical.

Yes, it is different limit level alarms (3 low voltage and 3 over 
current) like yellow, orange and Red.
Currently I mapped, yellow and orange. Red is not enabled.

Thanks,
Manaf

> 
> I'm just asking if it is important to have this 'yellow' alarm ? And as 
> there is a missing alarm to describe it in hwmon, how can we use it ?


