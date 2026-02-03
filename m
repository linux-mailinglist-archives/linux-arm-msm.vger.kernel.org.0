Return-Path: <linux-arm-msm+bounces-91653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGK4GNPLgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:20:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14BD7814
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 763D7302A6F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF9E3115A1;
	Tue,  3 Feb 2026 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYZl9N6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/djLlAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD529A9F9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113957; cv=none; b=sg8H72Ut3v5vvY8Kv8UCMUUMzg6o6Sd8u9PwhFek1xHxVjqlNItxmzzyDEje5V8MUw8TMRcC5yLhcPmW9fo8mHoevaP6WFbFcJgb5GvNZh4PegffuzS25H0Gmn1eeoTaDirMpMJytAcDfDDOoPhLXls7CT7TF7cODtKEmr7oF0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113957; c=relaxed/simple;
	bh=sbwC1Uzn/mw7YwfF/4HUCoGynqOzXHuozC0sY99c58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYoi9xZ2+IKA1Wcg1QmNu/zgfFDZqhCxmxZYrKrRgA6or71+37EXXQg/O0wx4f3TB4pDzG6Ik5uZY7HqKItW0+NN+kAn5A32jKYwkNDC13oMg+NNHTvi3nHkunwwAVDkPLnnRcGnylXOYSldeOLaBXT2UmT1hz7hQJwkh3rMqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYZl9N6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/djLlAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138nxZA848943
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGTnDDxIA0qISf6AAk6kpx3p6BNtkiHK27WqkW3bzaI=; b=cYZl9N6TZQNPudJ9
	9ltSBBNVKD77RbMyktjsgXTnx+Ft5LeaipGqhlT56fWX5/T7UnegcqJEgttdSDui
	PvYnANl7/Brjw1TmLKPtejXdhC5DUVKNp1RWg4wdvCr0ajFUUKPy5oLGJuSyOUYp
	JsF3TB1FdOCilo0pQbDEZ617lwn2fMUl5BcsItx2u+G2RwQ32iiOEKNPf4awq79y
	nRz+WibfYmQjv6JvWAEj9hL3YcMNhiXHbiOJo/LsS3u0tu78Gosb6+1VSb+w90si
	yig32wIjLflEKNfAD49huf46xMBh1OQ3iic9cVUYncCcXpa+AtJy8v3GZpIK3RDS
	lYDhkw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutga7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:19:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894662cba4fso13688066d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770113954; x=1770718754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGTnDDxIA0qISf6AAk6kpx3p6BNtkiHK27WqkW3bzaI=;
        b=H/djLlAE23SgKy/su5yfJIzLlj+rwQ/WfTNj4wCxO14qJRB7FX3A0Sac34mZkkaIXq
         hTlPe2NJsS9TIY4mKvVFKfEOzKaCpgewSDvSPlciSiotmdlvqu+m2txkcBV+sXAVloS4
         fpJ9JQt6ZdP25YtjzQAab7/0CgUA8qPU+/DmyQRxvuVwNTh0ybBirBCpLTUukFvsVw43
         MBel1bXAREYQie6f3sDXU9DHl0zp074z04Gk+exXOn0MVrujJLqZqOQYMrmc9G3a1/Fu
         SrXuacGkedfs7p1sht46EF5toIIn4hrVemuJCp+U4qvdQN4eY2sbrquxll3VOHGip3kE
         VpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113954; x=1770718754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGTnDDxIA0qISf6AAk6kpx3p6BNtkiHK27WqkW3bzaI=;
        b=qeV0J0hEsqux1rUcvdj6OfksOPJFoHg2RWpm/RptJEGne7xJGEaFX+Mvd7k6Qo4uHP
         QiwYGkCjW6p84kZo5Z0m6E2EwNQ85wzepKrjn1DjLllA5rTHrwIX4JK97geP1uNxA68M
         rFWJTQdNONb+/p7CyyfpmazUrpIrMI/NqPRJVJ9MGXZPZeorrG3kco5gJSXuknOUpgEQ
         /dz8yoLbIsz1QTXZzWETmICdoKWwWr3HVWpT+Cj+RrUtxwX8uKHoiEkQWkrQ7VpCvj8f
         ZV33vOYJaz48NH9Og5+hJ6X/qWnxSFyQpLvj5KKHDnCYS9hQq4cd2K0irdMqlohat5As
         b9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPBKYX4TtNzU35/LH+S40Qbghvs1KbOx8YKgjptBs/ckOtES+h5c1SyoTtD02FuLbzkTpYpSTSvlOnwQFA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3wrhZHITFAFKMJLbJ7XvAJEYS6iSceg8rJqZtFCtTm5cyCQx
	ov+m7t9BjL5LMlReAQgDq43m6MadpylLo09Iq0fOxrPFf61Sd0f/dbS9RXfdHWNGHJ8PYkrfekV
	vfPAbw8ny+gQ4PoIhNSxrrknumo5/839Z5yTiySeyVUyZQvd+ezas+uqSCX5DgoauJejr
X-Gm-Gg: AZuq6aKzKXxcmqR8bl2nnJk9qnAXPW8W3wJFqjrw6oNgFysozknwiS0wRWoUqNwjxvg
	wiTAXmabrp6YmwqdjJf42xHIHEw8vd99tlHxF6zjBbJZp8SKCeK43mzz+v/U+qX2sJPkyxveRKb
	wCXNPoG1eGCPCV/YKRGVBUmnVW/yfkiKjqmPYgcVQ7ONgaI9cYQpvuuynEP5TQX2T3IY9wbW/OS
	ek6ghTCFzSNpG85epApRw7bW53IXoNV4PWacFK+jcv7fF5lDaAWKfqEHM3DqIvA75w2OZzTqMdU
	RnDIFbq9AW1l58JyBIZTA/w2qkYkj7xE/JYi94ww37kJvioYByAL2FN5svR14+5fHxeOzPUAZWK
	73vMmdxPQZc04pYgBsXHptP2R0VKWNyoqSegxXyO5PMlLabbD+pJ08pq8JXJ/BGb040E=
X-Received: by 2002:a0c:f102:0:b0:894:e02c:992e with SMTP id 6a1803df08f44-894ea02b0bbmr122979066d6.4.1770113954580;
        Tue, 03 Feb 2026 02:19:14 -0800 (PST)
X-Received: by 2002:a0c:f102:0:b0:894:e02c:992e with SMTP id 6a1803df08f44-894ea02b0bbmr122978956d6.4.1770113954143;
        Tue, 03 Feb 2026 02:19:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e4a9sm8848179a12.27.2026.02.03.02.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:19:13 -0800 (PST)
Message-ID: <8ba352c0-7674-4e94-9cd4-c1327179034e@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
To: Lukasz Luba <lukasz.luba@arm.com>, Viresh Kumar
 <viresh.kumar@linaro.org>,
        webgeek1234@gmail.com, Xilin Wu <wuxilin123@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
 <fec5907a-5619-4997-9e8f-034efdd31993@oss.qualcomm.com>
 <l6vdnit4sd5rx3k236dwrmywudkmydxfjprn2c5i7fsfmlqfnu@tabbezrje36b>
 <76c24508-bb75-475a-b973-d7ad18c302ce@oss.qualcomm.com>
 <2ca3a260-d05f-4f2d-bf3f-08b4a3908792@arm.com>
 <26e2aa8a-912b-4e83-ad00-130cc137aa4b@oss.qualcomm.com>
 <3f20ae13-a206-4ddc-8556-f929d8727b50@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f20ae13-a206-4ddc-8556-f929d8727b50@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MSBTYWx0ZWRfX9V+66DFYY0Qe
 J3snWGLsNj1ELRUWaIGrg6oyse1wBptyd2cDeDMvJPVm8S+GgSvyEZPYWrI5/zq7BIMrValPNRe
 hchhpdgZtrGAaM46Cr6vqnDUFacgRjOPSQvbm7HoQ4q4Y4ifuhsVxKj9bkcv+QZ69wjRByGro88
 ZtJxa5HYmWl7pNeIkop4nmLdZ0GZThQ9+xow1smZFI+3dSVaLMr6OUpjxwIcExznlcL5CyuoyyO
 J+EukS+4NcnxBFXkaHTLjrNQwS60q8aM53SAM/NXSCHQOCyw5C5+uU1K93GpDvn1Y4/A6wv6nl0
 1C3QzymA/DzS27InSjc0h2ouglZ9v71TdJ7rV1FOIPq8mmb7icEYW7GzLSgOmYpKo2u2PNBXEzN
 tH0upj3gCJOt7DxJFhytZ6ZttPzzrygPwbDymIJIwUhTLQUbh6U4COkcWSdiRHBjOkyy0GT5zvL
 5U/DHtQqcZ4JUATbQIg==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981cba3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8
 a=IPjbp5aJMyH78Fb_HP0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Ie9oVb52H_P68NAv5ZxMeZAbkq58ssDM
X-Proofpoint-GUID: Ie9oVb52H_P68NAv5ZxMeZAbkq58ssDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91653-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D14BD7814
X-Rspamd-Action: no action

On 2/2/26 10:28 AM, Lukasz Luba wrote:
> 
> 
> On 1/29/26 11:56, Konrad Dybcio wrote:
>> On 1/29/26 12:38 PM, Lukasz Luba wrote:
>>>
>>>
>>> On 1/29/26 11:23, Konrad Dybcio wrote:
>>>> On 1/29/26 12:05 PM, Viresh Kumar wrote:
>>>>> On 29-01-26, 12:00, Konrad Dybcio wrote:
>>>>>> On 1/28/26 8:11 PM, Aaron Kling via B4 Relay wrote:
>>>>>>> It should be noted that the A715 cores seem less efficient than the
>>>>>>> A710 cores. Therefore, an average value has been assigned to them,
>>>>>>> considering that the A715 and A710 cores share a single cpufreq
>>>>>>> domain.
>>>>>>
>>>>>> Regarding the CPUFreq domain shared across cores with different power
>>>>>> characteristics, I think we shouldn't be lying to the OS, rather Linux
>>>>>> should be able to deal with it, somehow.
>>>>>
>>>>> cpufreq-domain == cpufreq-policy here I guess. All CPUs that change
>>>>> their DVFS state together should be part of one policy. Not sure if
>>>>> there is something else you were pointing at.
>>>>
>>>> Yes, they change their state together.
>>>>
>>>> The question is whether it's okay for these CPUs to have different
>>>> dynamic-power-coefficient values, and whether the EM code won't be
>>>> thrown off by that.
>>>
>>> The Energy Model won't support that, since it's a single
>>> instance per-cpufreq-policy and we have to pick 'some' values (in this
>>> case).
>>
>> Do you think taking an average, like suggested by the original author,
>> makes sense here?
>>
>>>> Again, they differ because within that shared policy, there's 2
>>>> separate kinds of cores (2x Cortex-A715 + 2x Cortex-A710).
>>>>
>>>
>>> For this SoC I assume the physical HW (power rail and frequency domain)
>>> is linked to those 4 CPUs. That's quite novel configuration...
>>>
>>> Maybe I could give you some hint at least for the EAS part (the EM
>>> for EAS), because for something in other areas (e.g. thermal) might
>>> be really tough.
>>
>> In this case, these cores have **fairly** similar power/perf
>> characteristics, as evidenced by the measurements in the root of
>> this thread, see:
>>
>> https://lore.kernel.org/linux-arm-msm/20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com/
>>
>>> What are the other CPUs in that SoC and their DVFS configs?
>>
>> Domain 0: 3x A510
>> Domain 1: 2x A715 + 2x A710
>> Domain 2: 1x X3
>>
> 
> I have analyzed that data both: power and performance
> (the 7-zip benchmark). It looks good and might fly upstream.
> Although, I wonder if that benchmark truly reflects the
> workload for that gaming handheld...

FWIW this is the common SoC DT, the author of the patch only happens
to have that SoC inside a gaming handheld


> For 'normal' usage (mix of stuff running on a device, not
> mainly games) these derived numbers are promising.
> The plot that I got for the Energy Model shows fairly
> similar efficiency for a710 and a715 - which is expected.
> There is also a nice size (60%) of an overlapping region to operate
> on for the EAS. That would be typical model for day-of-usage
> with mixed scenario.
> The platform engineers can later modify the EM data in run-time
> to better reflect their workload's behavior on the SoC.
> 
> Since this is mainline change for sm8550 and looks - LGTM.
> 
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Thanks for your insight!

Konrad

