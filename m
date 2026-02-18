Return-Path: <linux-arm-msm+bounces-93291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HQgLn3MlWl+UwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:28:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E41570E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3302A3001CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC12334370;
	Wed, 18 Feb 2026 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="To3kgjac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7lJYz+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8F327C00
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771424887; cv=none; b=j4WZ7IjhlvZgig8l7VWAS8ti/FJHNsJ8/ITBciav2PpB5ISacQio46Wn5cfDWw786hI64883UfUT7CC+78W0mv6vSTtwZwhTfXp6DvL6JUbk9PJLbejv8Jw4l5jKvmCvFzR9ef2ZKhG6k4knZiD8VBjtqnKvrhXUhBVmz+x/NXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771424887; c=relaxed/simple;
	bh=VBYSlHiXBQigpKuLOqCJSpXI17jitSCXW/MRiwTGM04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7+lOIJg7BXn0mA1SArlSszCE1XiBL01j0Cn6NKZiVKzhgNVXXey+gcqraJ6YaKfEPXIFXhOJcYyJ79G87ChdyCq7Xh3WnbnMKmlipyGOp/vfLo/o4TtgqbVs0pdFGjlZN2u/LPEiuEk6IzOore9a07zinPWDrN1qcoQYVAqpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=To3kgjac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7lJYz+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5L7va423694
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 14:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nco15/hvpEVWF5GJyB1vsnLM+4t9gKYSHEF1NRxSzD0=; b=To3kgjacscBHjbCy
	JpC5NNI8ukp1EU9gZcwTiRJsc+Eb59a6VDyI+4yV7tKGg6msisx5MOrzyOgoWDB3
	mEPMRt4CYXJVmPi71Z8KpjadnksqE0yBiDQarPrQkORiw6AcXZLEbLyt8vIA2h10
	75Yh1aap3MZHczI4rAhQyGv1ALU9sBcYJF+gF1FfgfXZW2YpWNVGMmNH6LyAFDUO
	9Z1pnnJ65YOX8LxslRVZOL4qsE6OAPi7drDrCJdM8oKaEjjOeHeDihGKzKvf4ICl
	HW5LU2wye3Cfc0PVu1z+4Hcw/5KPucFur2ird4HlKmdVfmhrmWmvaLKGGr/0vNGg
	uK98Mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e19jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 14:28:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3978cdb2so390409985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 06:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771424885; x=1772029685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nco15/hvpEVWF5GJyB1vsnLM+4t9gKYSHEF1NRxSzD0=;
        b=J7lJYz+NlebHIVhVqv2O4ncI+iorDDm/+44D4cRuWyKoZhbansqF/NQ1e8CmaRuq9o
         US/IV+QwSmNN56jIkuwGbH2H0y3e29/gaz78K5ts4+VxvgNICeTHmdT6/rj3cYhNL6Rn
         zWsf4TGEWDbObs+0NJC0YNnbgWZDC2DFJLTvVmpfBl4CT/gHU+KHs8LAA4cne8BGqZpt
         9UySN1rA1CJPuzXp7ChVkSrki8xJqWUZlMfr7Dy4Jtm0wBCoAW7+UD9yyqONqV218DKZ
         TUFywd80qwpH0VdGKBULaoNFzJAeaek9E5aV1wipipefWRS32z5gL2alYa/yusO87e2Z
         22vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771424885; x=1772029685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nco15/hvpEVWF5GJyB1vsnLM+4t9gKYSHEF1NRxSzD0=;
        b=SZcGCCgTUImzy3hRjmXNMPV1py+byFuGXUgnB8/tW7qNT+7+Awqe3e/T3RcQXOK4Pd
         /wG0GdNFTzGhkGcxOLNoA30L83vOoLncuYKfKZV7l0TgJGyek9ftwWbQwRX/1sY3A49A
         tzcvgIXcQUiYZ9oEUUvjvEKiBB9u/BYElGdhqsrl8rrOPrr27gu1vnM6M1hKHXMci1nO
         Ghg06p49QcykrxxPkdyOAxRA9mbXrsEBEn7jwcJQO4oUcTfoHyVOaEDWNLOsbb1bZakh
         24nyD8CCU7nO/NcUfwjzyLJwNkSdKaDQtmSsiU9mfz1hzWwniv/89LiB755W6wB+OpNm
         b7rw==
X-Forwarded-Encrypted: i=1; AJvYcCWIavfqi19Bz//kPWG44fhZ/cyrYy5KCgBkKP/YO252WylYok18Ag//yECTHRzxCHb9fVC7Yj6LVsVjk4J1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9PL92nVXCVa5XjfDB/zzfmlqi7CL40F133+eyNj+4RUpJA7al
	eaqDeQzWas+FboWXL1pqf8bT11Wt5M0nfzILMKPDoesiJ7xw3YtxCzgAQoLEW+cY7GxotTuZBmW
	P501rr2waFFy14X/CseqRwRlkdjW/CnkjDwozLbnSXc1J89raa1DQrsRnmSUfVGvoyD7G
X-Gm-Gg: AZuq6aJYlI2hcMS/qie1hXyrT8vlCCrhPfbtO0K3PXW4wszMpUp5r5X5jNMhs3xSPYN
	0wE8Hxu1FoX8MBVFeHZboO+kBpNR6iXXiEoDAgRhCB4AhBaUzGy30ld99PEuw6wXgXvU9JF6KoQ
	f3V0689lYSZZv1ZZLJCWvwbUQmCvHS51O/9vs/Msv+tS+SVcucTtIh5XUJDtbXQUw+58TCLcnEr
	vvOm4JmxNznS9z6V33LjbczRpOH6tHmdLu4G4EIirs92Hla41gsnV+vK3Jl6d7aKmEkO7ENCeDO
	p0aC2/M45/dyGk4t0dpG5pYa1fxYUXwiBusGGiDNxzRO09uUdz4TD6CqKJ2j2T6sgpjZJyUQeJ/
	BGI/v+0ab2H7OAeHrPtoOKZJEOYzp0VvhftLKLlwSOab4/Y0fyRlslJa2fC4WJvBnSpRAWgk4nV
	OCImZPZ/BIDjfRcQ==
X-Received: by 2002:a05:620a:1a19:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb408303c9mr1726991085a.4.1771424884759;
        Wed, 18 Feb 2026 06:28:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a19:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb408303c9mr1726986385a.4.1771424884282;
        Wed, 18 Feb 2026 06:28:04 -0800 (PST)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766531asm458063166b.50.2026.02.18.06.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 06:28:03 -0800 (PST)
Message-ID: <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 15:28:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6995cc75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=08J7RLiMzDJDz8dl29cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDExOSBTYWx0ZWRfX5No5jMt61Xmn
 T9ekIgpnbd32qr1W7QccUK94203oldTt04YmXittdUI2hp+R5d65F56O5fUQKaKpkEC+/12j8Wa
 Eb+1jzsvIHPaxGVIMr6Cj//Rv5e+vr8qVOGl9+De+TsZ4YS4el8Y9OwVL8Zfc5Gakrj5MLJThdC
 YDCvnbi0SgssergjcDkt1XZUYB3Ycdw+QQgCMwTij875AbnawPICPbn0yLoqn2Y/tmzooFFmpX1
 SIlAM0f+iFVYkfBsI6XKmdVhaaNoSi5274rDZNW6FOagzyFx7FAxYOyTYjWlMxSHhgwZO8F7SvO
 x/P5/PCwh+NX/SW2T1oc5Jn3n9pdXAm00epfX55AIDQLPpgaN1pbPmgLuTotswe3X0iu9kSNHQZ
 0kOTpcCvV4z4s2Nng9+ITCP37HMRI4eMADNre1CHfK73AsQlIiSMgtWGSZ0FjkPb6hw2vKylChb
 6Si9NXKTiYzExNWBhAQ==
X-Proofpoint-GUID: JeAvJcncttLnK-FRQZymuBtegmaCQ91I
X-Proofpoint-ORIG-GUID: JeAvJcncttLnK-FRQZymuBtegmaCQ91I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93291-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,codeberg.org:url,ixit.cz:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E58E41570E4
X-Rspamd-Action: no action



On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> If the OS does not support recovering the state left by the
>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>
>>>> This is not the relevant reset
>>>>
>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>
>>> Thanks, I prepared the fixes [1].
>>>
>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>
>>> David
>>>
>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>
>> Please don't alter the contents of dt-bindings, it really doesn't matter
>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>> place 
> 
> I dpn't think that will pass. Current reset is defined as RSCC, we can't
> change that to CORE behind the scene. I'd prefer David's approach.

Back when I replied, David had a patch that removed the current RSCC
reset definition in dt-bindings (at index 0) and re-used that index
for CORE, putting RSCC at index 1. Perhaps it's better to link to
specific commits when making comments, note to self :P

Konrad

