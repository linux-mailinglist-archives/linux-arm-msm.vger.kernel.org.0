Return-Path: <linux-arm-msm+bounces-115436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DL7aHZzBQ2oWgwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:16:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C96E4B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:16:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z3ipeDtp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OYLNd7Ek;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87373316E52C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE56413221;
	Tue, 30 Jun 2026 13:02:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C51340FDB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:01:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824520; cv=none; b=ZKiA7Mi876L8dAg1cldA3dQRvsy/nf7Mzfun9zlTsEp+SpoU/AyWau/q5wTM/3pUQd9MzNjXGcwPygjf6ydgiMRJEIVCbffBNJJhA6Uv7j6VFBQA8QlYkiLErGL84OpwvZ8LqjAJNZfSxIQg2JjONroPUFEvCGz5sEGczxoQ9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824520; c=relaxed/simple;
	bh=XisiafNa8TNxUf6HIvVJOnurbDpa5s7FfbLbsSlbCQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEmJftVM5xVkxmpoyUGj5FJzujdPNzbutfb1V/81nzUBzttmu+p7ycW/9uFvtqN4jLRKy/Ot6q+rMXqEfPhHBPNN9eqG7e2GytZ/v0k3NyVPEtB4XQi0Snhz4Hjvl+Jgfnblbx9JX9DSQdrIAhYEnBivXlfe9NJFAmLK+ax/l5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3ipeDtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYLNd7Ek; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mouq1542055
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=; b=Z3ipeDtp/dzVm5g3
	Rc66h/oANnogMqvIAa5bDs8bzOV/Bt72zsDTgYTfA7IA5uuHFgU4RvJ7GpAwgR2G
	Dboqs40UBavLWrMi1eikLSTci0PPalFjXL57Ppjgo8IA5oLmhxd/4vS6sR15kd5x
	cLb7PIBF2A1NaRFS2LKy5vJ3KVGqDD5qZBvBJtTLmk9tzqG8YEus5wv1owfZyF+j
	GiqV7LM10sTHr6IkMV1LC9h3y4pUtyMn4vykzUAYwhwJ2AukP8v3i5aRnPQOgjHP
	IWiWq9Gye024+uleDmiu0Qptjryj+kxovx1t5Fn1LF+mbrbGgNwlPn/Pj2jr4atQ
	geWL4g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jj9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:01:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737c728b37fso97581137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824518; x=1783429318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=;
        b=OYLNd7Ek+ZvC5zp3OqXcgwwifHh59U3f+LrcP7eNUifUUxnBTmZPs3hhq2+Qril00P
         c55gUCwlBDVFNV8uBOBPqeVcxvPsr+3iJmd0hKV0mAjvN98Qk5vh5c+YmJVBXahjtbUl
         cJaMWTstjgC5BFIqCe7rIE0FYuNtXuB+Y2I50Sp8bxXfqNssthbNHhXwG0sE8kvUHxii
         BWJOxNzZJRskwONoRYTdTNph+Aw43fQbNaixcZNnPNmaVaJjWKyTL8niOBelp/MJfsew
         IDRrlXukpyHJUqoP2F19RtAN7d8WOnWv/+XAkIKzGMaO0m+t9vhzvLPOEEa2rkY80ecI
         BSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824518; x=1783429318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=;
        b=Jwg6DVlOS1HkBSYDMLrb5+ASVg0MUjdHlNR/WHq4kaCwBwSXSbWOEPoePi8voahsJx
         +5wm/kQ6c0VtDQi4g9EkcUlSiT1Lq9WuFuFZQAphfU+3pfLDbO+3o+6ZAG4sdwA/EI/f
         FIUeWy04Au0HV4fjttfolW1a4byEecc3yecvVtXGLny8i+hil5Kle47Ok0nYKnvcdQg5
         uNvcQT4u/G6DCtCFbzr9P2jXjYTd2W2kl69gvQ2Yrxst9zH5KQOrs1MQoTsGkNxnx+lC
         oa3/j40u4ky5/g9oH9S7GTCpFjdqkvy9rdLCDoC1bxeoPS8BXY00OlSGx40FZY8E2FV0
         Uk4w==
X-Gm-Message-State: AOJu0YzYmhWbZmT/VFxT5eK0Dj7r0UMZmMZgpUgYq/48D4TD7qGGkom6
	WkeK5WfumXr2ylYk0Q8GWyEzYP4lNkOWPOv4KKniW7H70fHpxbOv1/bgJ0RfGLlJq633V8ci1lr
	ANi1Vqu9U1wJ6TEYcte+VrxlfqMrgVLLUsL2F7HEClxgM+wZOslPotRsVkmyZS9bHS2uK
X-Gm-Gg: AfdE7clQqDWuWJ1opd2RJcPiqQp5+hmOi1qFWWCMus1c8nFwX52dwFGtTFL7GhCOzxR
	hc+6XMM6GfMqdVxZAa4dnoxl8ccucLJw3toZwgcu5cpryAtDsgNL/Pja2nHHqowb5dsD+ZWqWx3
	Yi7z/+Tt922axU174Z/4zTT6iPlKoNwOKWbHjQW+eqLE+M1xqo9XJOyXiGjm2P6Bg7GKFw5uJyC
	EN7+DpUqr9lHjeZ/c8qw2OhYdPNs+76exvkbRq4k0g629Nm5SSLnI/E3c5k3yYY24Bd/pZojghZ
	ELmw9/xWNtcVx199JTa53962/txIzyFCtEG+nTNPvlPjGHNld2NtXF1RU0/Kt27J8j4Jw0RaKaf
	G7KYkzjaV5UeZSL4QkQl9aGDXDC3kDAKF4pI=
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr562188137.1.1782824517156;
        Tue, 30 Jun 2026 06:01:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr560994137.1.1782824509605;
        Tue, 30 Jun 2026 06:01:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f5215dsm118931066b.52.2026.06.30.06.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:01:48 -0700 (PDT)
Message-ID: <28bf1937-55d6-4ca5-a572-3bc7d0958608@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:01:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] remoteproc: qcom_q6v5_mss: Use mss as regulator for
 MSM8953
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
 <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
 <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aI25AwfL3uFdnveiZhFtOZ0lyOU2brWs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX0QqkUZ7dfSdz
 kZ5uyIlh3GILl54i4ty4QdXZaNt3PCacLoTGfWNRkTXZ5NDggWwa4lcjEdkw3F2YhOTIby9t372
 vSZ8BrrEd4rvdeJAHX038/Q1HQ/BR30=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43be46 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=2LMQYQElpYtautYIfiIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: aI25AwfL3uFdnveiZhFtOZ0lyOU2brWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX6c1fJDaQpsZt
 oo8A9wUtJuoMN3cVdA84qtoyhhyJZSkySllapF49m3DSN1VtIacbirAwPPJg7Cv8n80zWqAkzkD
 +cUs1Gj8UByWREqYxCCJqw4FbDdP6PV1sTHXkWrbY5zebzldiT8erSovQdwH033ckFqjmh8K8Di
 c0PAjnanFXGVPNh4B04J5deEgHM3R8MACwa3a2AZtiwk9PPTdCgO6WvvZBfkpEW2F2rsP0+TEKk
 2483aSa+BgQYLOL4SfyKvISPbkjZp0oV53X88PqCSYrrvYpyF+Y860pRLrBFS1YXZ9O8O7CUWWL
 asArijtrbdJx2m4vd9LPjNBkPlQyV7rfmRoIQzB6n4aNS2XRDUPeXWxY1sKCRimvwRo8A23oA4c
 rYwyJALK5AT6u6jDAWUZCShgSixAho3EtzKYEpg54q+IudMinmLDRMR9smfc+FTsxK7va+x/Q8c
 Jtghp6UpjfgWNQP5L8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115436-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:barnabas.czeman@mainlining.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:ulf.hansson@linaro.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:stephan@gerhold.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D24C96E4B9D

On 6/4/26 2:33 PM, Barnabás Czémán wrote:
> 
> 
> On 16 April 2026 15:32:25 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/27/26 9:11 PM, Barnabás Czémán wrote:
>>> MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  drivers/remoteproc/qcom_q6v5_mss.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index 4e9eb5bd11fa..86edd826ede8 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>>>  		},
>>>  		{}
>>>  	},
>>> +	.active_supply = (struct qcom_mss_reg_res[]) {
>>> +		{
>>> +			.supply = "mss",
>>> +			.uV = 1050000,
>>> +			.uA = 100000,
>>
>> I don't know if it's a typo, but msm8953-regulator.dtsi on msm-3.18
>> suggests one more zero
> I do not see any load values there only init-voltage what have six zeros.

Yes, you're right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

