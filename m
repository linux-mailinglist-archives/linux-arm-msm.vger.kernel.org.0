Return-Path: <linux-arm-msm+bounces-91666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOcsIanegWmDLQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:40:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD2D8831
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB08B308F5D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 11:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CA11A9F88;
	Tue,  3 Feb 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euxueVHo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYXoVGWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8659D3081DF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118770; cv=none; b=qEJzruLQNjI9cDnt88IvwdVbNEl9uuiQ22OthtZDUm9nj2srgefUXKtrqZ583DxKhzBkzI7QZ8I6PINsFL8o6MzeIZCXHxIotujsou9qxGrAqmH4lHe1x0fBlZsmoGvlvlMc9REgL1hFYBbrr1QVuZ8QphQBQQhUZxgTt8Zk56c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118770; c=relaxed/simple;
	bh=bfwKJtqNsZE3KuZCJtq7p+/eAqY/BYsUU4jyWlwrLhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+1XZReQtI9eyP9F1PMLwNSJcZwuf+Wvm4hpgY+kWQJTMqrn6VY8U2AUgM6O2O8uuCxnaoJvhInAfLhh1Wr8AJ/2oKEf7euSm1w+VOgEtv5Ytxrc4ZOdnz+7iBwg/LiuvchMSxmT/oYcnP/dzSBUoGbZwCmMp3BJ4PvITdRU43o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euxueVHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYXoVGWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136RgeK3459139
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 11:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4I8Eu3UIs4Ch8uaoG3W9J/ClKObbsqX0kUiIwkWg40=; b=euxueVHoTjqmInyB
	L8brDOL60avqFOIl7U7pQybzTFp6hsHYv9k3fUPvuKaOTsIHvu296hZL988vMCh3
	ogcowPjbYlwyWwoWsiRnRc8iKTx7eWJnwjG0r437nalmJvOBn6J6I/wpA5EpbxGa
	mjWvNFvAKPEAwq+mE4p1eTHwSOCBD5wm5njRTLnudOr6lhk7lv8dUagXFbWqnisy
	HPks16+wgTGS9yLng+FlQxsEuc3EqXsfBWL8eGMibSrMN/fA4zC0CSQG/XYSdOSW
	9+Tpn1A7GpnZ1tN6WD6dIAdg1zOGiHoBRbDZeiXSL19M4NOo0QE4HxGPKizzrwEb
	W0SYRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbm3f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:39:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a26989018so16206126d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 03:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770118767; x=1770723567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4I8Eu3UIs4Ch8uaoG3W9J/ClKObbsqX0kUiIwkWg40=;
        b=jYXoVGWXoDFAOsGr/gurftcXcHQGhOafbP7IJmAfHQCo2JrgPEhmUBndX2b/ObPK+B
         MQyncAb6NPxv8F7XjD42uHyoP84DVq92wOWrFMzCT7P7pYpTrVYEO/OgZXaJ5a0jVkIb
         jHk8qG29BG/mFmW/PHDj4S3lWieFmmAA6JEyjncOzhCzkEOwqo/ABBLcU6zeLR7LXV34
         usy+ULfyLG/SCGIGwiOIeBj5KBhWpdoeb/gz+2y4Yur5QOArQw/cxOlxOz4JOF5gDrfb
         QSfwWvcmZG+hcOrf81QOppypPNHxSFNmnVb70JXoxWw2DsrHz7GVxohInVGJdv9wgGyu
         kz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118767; x=1770723567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4I8Eu3UIs4Ch8uaoG3W9J/ClKObbsqX0kUiIwkWg40=;
        b=A8EEN58iKIrone9ap+vYdYH7HBNFsQWYIdzcCCiQsETs7y6MZkuGu3qC1et5N535e3
         /L351Bkla3KpjPVxDSQNHnrVhgyXTZslaz42mgwYEinJcP4oCWGW0zbfgyw92jOUMEOY
         QvI48rSVWp9hM52ehlf7rDQGU8hvINtOMfUfnoMJzT1ejLskekHqbl8mF3bl0ms2o6Wm
         +okVij7+qz8rnHKAp36Ua+zlyxX/d+f3kh9Hh+bM+pU0+6hMp43qidae3pYpsMzzVGEG
         E2k9S6PwqOEXmU5s4A+Hh/upKZvp5xHAlNEebYaYtzClhjAneRF7w/arMemELSHuwN36
         fbdA==
X-Forwarded-Encrypted: i=1; AJvYcCW8sHFBkchxtqb7BEFQXVN0tZj3bAQmZwYvUV8O2YcDMTlq6lCa9fp+H4VAFqgRLZrX40pAzDoFdmSb1+34@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKExKjJ2ivQz87uNJAG+Sk/dRFE+ss3q+RL1hhUri8xntRKoT
	wWNL5RX0Vx8rPyylEvs3X8lRL2UIL4GMnKV7tH+Pwu/t4pPe3TgUB9+D3+SIhdvodW4AevU+YHy
	RqvCvur5ejYKF8Hi6sWJIbFw0JFbbUZDR1ndJlu77nQszshLS4w4Zh7zFY11h679Z8kVV
X-Gm-Gg: AZuq6aI0SyRyBfzxqh3tasNbxkrS/Qq8on8Jniys8LlAr4FwK8SlCjwrSTtTjABbiQl
	Va48916AH7r82YHDWikalpeDwlRGSFl4Ds3BOk6t0PzJ96IdPbzgcWJvKFTggR8nub4sDpDxKrv
	VGpKIk7ksyvX6rqX1EOEHvD0V0DNFT+WrHATeBr7uQ3Gr2WWj/myea3Obc4M+uc1og8gl3j5Gf5
	DD1pXoXscZ3foFVKejJbSq+HrWCe4zUtsRY9nlkp7z453ctpDoVHOrMe3WvygyzXqQPcDiUUXD5
	m4qskOrMjo3UQhP/H5vTUh9NpX/+TIbJlVTfjUpk+lhUz0s3hDxds287Pahk5vmqwof0XdDMBeU
	ok1BNTkMKniiwiCeVCV4Xk1PHwdZeLIINx8YDptSWtHzgyG7QoMRBdPsjUrO9DAp4yNw=
X-Received: by 2002:a05:620a:1725:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8c9eb2fa369mr1389600285a.6.1770118766812;
        Tue, 03 Feb 2026 03:39:26 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8c9eb2fa369mr1389598585a.6.1770118766325;
        Tue, 03 Feb 2026 03:39:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm9031179a12.35.2026.02.03.03.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:39:25 -0800 (PST)
Message-ID: <f2b11a1f-8085-45e8-a3f5-b07477b9ef91@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 12:39:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
 <aX6whqw7XyaKMd9m@google.com>
 <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
 <DG4EAYDXMGQS.2MKAJKDFQCFEG@fairphone.com>
 <34fa533c-b9ab-4025-b9ad-4041837e790c@oss.qualcomm.com>
 <aYCCv6nI2QkvD8rb@google.com>
 <6fa17bda-4d4a-4b31-99a2-1d2b606b663b@oss.qualcomm.com>
 <aYHBgLyIttd4lkn6@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYHBgLyIttd4lkn6@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ze4eFk1_ySrQxob5IxxXQJ64K7yiEU86
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981de6f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xnehguOeFdtwgeas_nkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Ze4eFk1_ySrQxob5IxxXQJ64K7yiEU86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5MiBTYWx0ZWRfX/vQsLbtkGL1s
 FQAdnf13Bvx/7VoZJ04/k3qyzZ5jt0hTCbPU9B4uROmvgz/XhAxH3YUn401UaNeLGFz23KtOa2+
 NW4hKnlX5xhAG3ZRaUsqbFCG8akkWohygNYIoyVCY3c0r5YYup5MgVQfP4U/8pgRGeWUwOTrQVO
 eCk5XmIdt9W3meUzKjZYJfEvvpAI7f4/K70h/Xt68AeuyGOHyZX327COLiQ/JQe1KTLFeZUC1D9
 1zpc7nmzwHpy/DY/MgBBU83+MaLMeWBef8YqSBLDgCBvFRKEi8vglkjobuQ/tiw6XdVtcntz/Do
 E/Laq9J+av8CcnW0oPTSeV7XtZhd/rryAxtJcJcRRm+YqlCEfQcRCqmjgbcyQc3U3mxrZwFe3vV
 0JfxrIjrNali8BrTAW3p82Z0IO1vk9IlQhHvBx2SuLP9hGwO8Xpuo6zFJMKYDCWwP+mwbqxpbZg
 zVzTjDCNd+RhxbXTYsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91666-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEDD2D8831
X-Rspamd-Action: no action

On 2/3/26 10:49 AM, Dmitry Torokhov wrote:
> On Mon, Feb 02, 2026 at 04:11:51PM +0100, Konrad Dybcio wrote:
>> On 2/2/26 12:04 PM, Dmitry Torokhov wrote:
>>> On Mon, Feb 02, 2026 at 11:19:36AM +0100, Konrad Dybcio wrote:
>>>> On 2/2/26 11:14 AM, Luca Weiss wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On Mon Feb 2, 2026 at 11:12 AM CET, Konrad Dybcio wrote:
>>>>>> On 2/1/26 2:49 AM, Dmitry Torokhov wrote:
>>>>>>> Hi Griffin,
>>>>>>>
>>>>>>> On Wed, Jan 28, 2026 at 04:51:14PM +0100, Griffin Kroah-Hartman wrote:
>>>>>>>> @@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *haptics)
>>>>>>>>  
>>>>>>>>  	chip_id = be16_to_cpu(read_buf);
>>>>>>>>  
>>>>>>>> -	if (chip_id != AW86927_CHIPID) {
>>>>>>>> -		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>>>>>>>> -		return -ENODEV;
>>>>>>>> +	switch (haptics->model) {
>>>>>>>> +	case AW86927:
>>>>>>>> +		if (chip_id != AW86927_CHIPID) {
>>>>>>>> +			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>>>>>>>> +			return -ENODEV;
>>>>>>>> +		}
>>>>>>>
>>>>>>> If we are able to query chip ID why do we need to have separate
>>>>>>> compatibles? I would define chip data structure with differences between
>>>>>>> variants and assign and use it instead of having separate compatible.
>>>>>>
>>>>>> dt-bindings guidelines explicitly call for this, a chipid comparison
>>>>>> then works as a safety net
>>>>>
>>>>> Are you saying, that
>>>>>
>>>>> 1. we should enforce dt-bindings == CHIP_ID (what's currently done)
>>>>
>>>> This
>>>
>>> No. If there is a compatible chip with different ID (for whatever reason
>>> - maybe there is additional functionality that either board does not
>>> need or the driver does not implement) we absolutely should not refuse
>>> to bind the driver.
>>>
>>> Hint: this thing is called _compatible_ for a reason.
>>
>> Right, the reason you have in mind is fulfilled by fallback compatibles
>>
>> (i.e. "vendor,actualchipname", "vendor,similarchipname" where the driver
>> only considers the latter becuase the software interface hasn't changed)
> 
> And having chip_id checks will break this...

Depends on how they're implemented and how different the chips are.

If the software interface is exactly 1:1, with the only difference in the
ID register, something like

if (chipid == SIMILARCHIPNAME_ID || chipid == ACTUALCHIPNAME_ID)
	...

would be fitting.

However, more often than not, like in this case, there's actual differences
that need to be taken into account, meaning we already need to act upon
the "actual" compatible

> 
>>
>>>
>>>>
>>>>>
>>>>> or
>>>>>
>>>>> 2. we should have both compatibles with no handling based on compatible,
>>>>>    but only use CHIP_ID at runtime to change behavior
>>>>
>>>> This is spaghetti
>>>
>>> I really do not understand the aversion of DT maintainers to generic
>>> compatibles. We see this in I2C HID where we keep adding compatibles
>>> for what could be described via device properties.
>>
>> This is because it's the only way to allow for retroactive changes that
>> do not require changing firmware. That's why ACPI carries new identifiers
>> for even very slightly different devices too. Once the firmware containing
>> (ACPI tables / DTB) is put on a production device, it is generally not
>> going to ever change.
> 
> They are actually solving slightly different problem. In ACPI world they
> allocate a new ID to represent a peripheral in a given design, down to
> it's firmware behavior. It encodes much more than chip ID that DT
> maintainers want to key off of.

DT sort of does this to. In the Qualcomm world, how you get to interact
with the platform changes dramatically depending on the firmware flavor
it's flashed with (which I'd hope to see go away one day..) - if you have
a Chrome firmware, you're basically free/required to configure everything
from Linux. With Android firmware, much of that heavy lifting must be done
by the hypervisor or the secure world. With Windows firmware, you get the
Android experience + UEFI services. And at the tail end of the scale,
there's the automotive firmware where you don't even get to toggle clocks,
but instead all peripherals' power and performance states are exposed
through dozens of SCMI servers..

Somehow we can try and be smart, deducing the behavior based on the
properties present in DT, but often times, a separate compatible for
"this SoC except with this firmware" needs to exist, as the OS-accessible
software interface is simply different, as if this wasn't the same SoC
anymore.

> 
>>
>> CHIP_ID registers are a good tool to validate that the author of the
>> firmware table is doing the right thing, but solely relying on them
>> encourages creating a "vendor,haptic" compatible, which I'm sure you'll
>> agree is totally meaningless.
> 
> Is it? If a piece of hardware speaks i2c-hid protocol why do I need to
> know the exact chip that is being used? Depending on the chassis and the
> size of the sensing element and the version of the firmware that is
> loaded into it the behavior and timings of the same chip may be very
> different.

I agree this argument gets overused at times

>>
>> That's especially if the naming scheme makes no sense and you can't
>> even factor out a common wildcard-name (which also happens to be the case
>> quite often)
>>
>> Plus a compatible is used to restrict/modify the set of allowed/required
>> properties, so having an "actual" compatible is required for schema
>> validation to work
> 
> Yes, in cases where there is not a common set of properties having
> different compatibles makes sense. But in cases when the device is
> supposed to have vendor-agnostic behavior insisting on myriad
> compatibles makes little sense.

Some people may be thrown off by the golden rule of implementing standards,
which is to break or bend them immediately, claiming full compatibility.

But for cases like hid-over-i2c, I symphatize with the "no one needs
to know if it's a synaptics a00001 or a synaptics a00002" sentiment

Konrad

