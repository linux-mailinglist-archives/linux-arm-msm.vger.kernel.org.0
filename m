Return-Path: <linux-arm-msm+bounces-90002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SORZKcC9cGkRZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:51:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F056486
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C48D6969E48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45D53F23AC;
	Wed, 21 Jan 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7hgsYTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvU9ttnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A9D3EDAA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995411; cv=none; b=W2LD/NNUb3ou3jBjC+Nh8EC2Y1ko5GpmlZsOK4QgtSYE1rNIcCGUbf7mrvB+09zXOA9jlghzdQRbIdPeqnrd5cOacDgnXKSKx0jtPvHPUW9NlannT83vf9cCAoV243/4wabp2+NCqAb+k94jRuNqJU5gZGXjuLchXHrKHgrxx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995411; c=relaxed/simple;
	bh=TIo4eUNRcJupaJfar/Wjui1/HZPb+RRv0rkhGEuk/Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r//219jddbNDXnoieSFs9aIE5yeUHt3ozd1f0PRW2oImVqXhbXYJY184xixl+iOd0EZZs2xkC4OXO7blu1/c5TwMpNeRZfydvjWocj3LmsM87zwOitJq4BU4aThJGSGZxVrcCe/pZ6v2gULIipYlpKg+uYewEjxm5ZdqBzfUgfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7hgsYTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvU9ttnZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8YaN42066004
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+y5lKOS0WAt9c5KAoZ6HSMamjpbsexOX6flmBCX/kYU=; b=f7hgsYTGmQIm1iAn
	MN0Dv1796Hv9U6iNhw7K5w1KtzL/y0S/+g+65kDwxSNTJKlRIWwYw4sDG/Y91Osw
	klbdDm8WEfURpVpQ6u827pM+chI1Xao+x11BHQWaHGEzAFpIXcXdrV+IuTpgrFR+
	LMzc0gLA6TJQnaS87voayUug7gpBVdkVo0UMqtdhYSp66bKZ+K+Krk4bbTXBQJkk
	9hx5lFyBw0QoGRcPVF3lm73IJQ+8H1e3n2JEQqh2g5xSxzL58HwZjtr5OCXS1p5w
	w1rPvIYeZz6vsLxk6aNAXC9+f28xaqYvOwfOf0oX3gvUH99yjbCwxUnYCbdfAjA5
	VjAstA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btudp0ucu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:36:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so145849485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768995408; x=1769600208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+y5lKOS0WAt9c5KAoZ6HSMamjpbsexOX6flmBCX/kYU=;
        b=YvU9ttnZ5IQDcSra7ysG6Co+va7aOogFmtknFEu9c2mgUJQH/ENM8Vv/W9Tvgs+aJ9
         BkGrafit5M5ByRwKXMKhrIeLmKCIir+AhKXlB+50QPA+O3hzbw0rfN/2qBqtKu6EXLAw
         +2I1SgbLpyFn85UVdFUdREWuJ6drkS+hk93+p2PkjqymfsEzhJ9ucMy8OE+9SqXgK7VG
         XyGs0Hfhoe3dHdXTTGwjUxuH7DMRUQGdJhQm0R4RKCe1IeWA5284J4GOZMgtHwMOKpUu
         A9TC9RZgITlcy98egx4KLuk21An4N7uJBpAMFymdanOXOgwqZe32mHrcsoi8FMFuMgxN
         a/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768995408; x=1769600208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+y5lKOS0WAt9c5KAoZ6HSMamjpbsexOX6flmBCX/kYU=;
        b=NwMhKvLJLaaJEbuwgALyYD/h0AZ3G1UFYu1ooZuoG1x3RmCcIpXBbQw4/Fgj9glQxP
         /2ejBIl9ie9tQDYYiderz8Kc0iJ4PDq9R4DD62h8F2FlDlpa9npoWOqgioapRfrrMRzD
         Ii2/K5SvDE47CNBK5/wF/u9EoFPTQywOv9E56b7GJueM0kWvn15m4NO6g1JPD10M5xjj
         ni8LjTc1r7ExpejPbeqpcMDvdTOZ7kDUR8XQw5Izb3KItyhqhh9wRgIhW5utQ6wMBfxu
         wxUOl7LiVvmqlbcHut4HIdHShNgM1xBO4KtqWflnp7tDOmpkmrmNmNNizfalYc0ZqSuC
         2Oqw==
X-Forwarded-Encrypted: i=1; AJvYcCV3CIsz5D42RM2jY+mSF61ZkVwQGryOJElNEj12Y8tZqfsGuBPluWQba/ds9ZtkVzbJwfhevqcGke3bv6EF@vger.kernel.org
X-Gm-Message-State: AOJu0YyASjGHs3wCcjIXfTlpUc4gIpjjEBBv+zmdlHV4jPhu2ZY0fIVr
	HNb8+DTEUcEEuGdeQR9CVf9xV8ZBmjK1Ws1vexER+bH1rl9DIPtBAvTfNw6euOaOxHialm9mG+b
	VhGGnQbXNdp5w7/OFiMmJuS7uYEElH87sb7GXXsOFUKNjyC0JVtdAViwyMh0gVvt1vqao
X-Gm-Gg: AZuq6aKJDRuPpSo8c5YTn90BD8GCsOuCQ8QhuB1XAZiGck1dvMFNriXOlL333/c2Vrb
	Ps/2oN/VmUUIDWCucYI8r2+TBRodAyzz1N7ZoGFmLB0FVQLIj81A5A7nfKl4+5iY4zK7LCAvJik
	CLsfWbM6yHLMyHCVP7ShsgttuUGZvqasGUxXhxDH592phrRrupkrGtbYcaLXLC7PVsKGDNxeiGX
	rm3QiLo0aP5b9tr8QEgZRpP8uDWYi0yIzE3XbzSMllmer8Yz5WYck/a+ve4cg5DaPGB3pwGiHjL
	RxGWUT/5ZwMeiVFEcjuXipI6aj7Ioam+t5HQuWum/HXHCyZvCvQv1qElvzTVTBQBVw06SWUKeWA
	RSJVdGGifxxbyABCvzFGX/UzYLYnAYsUQcs4f7hph4intZG5to8XSmP8AEhZsstBH6AY=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1805365885a.7.1768995408146;
        Wed, 21 Jan 2026 03:36:48 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1805363785a.7.1768995407662;
        Wed, 21 Jan 2026 03:36:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce4f7sm15135672a12.6.2026.01.21.03.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:36:47 -0800 (PST)
Message-ID: <417f77ba-a0b0-4ba5-824d-8814b776c557@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
 <d8c24f26-3ee7-4966-a11b-1e2afcad93cd@oss.qualcomm.com>
 <908b64f1-f6ac-4c5e-9c72-1174cba62017@oss.qualcomm.com>
 <f10ade51-b29f-45cc-9895-d66a319ab26c@oss.qualcomm.com>
 <99796cc0-f29b-40d0-b8bb-ebcbcc950b23@oss.qualcomm.com>
 <996f47de-5900-4a3a-9372-e5ea3ae31c8b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <996f47de-5900-4a3a-9372-e5ea3ae31c8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lwma4QZKuk9RYImu3q5-gPeMSiIsqJ3J
X-Authority-Analysis: v=2.4 cv=DJyCIiNb c=1 sm=1 tr=0 ts=6970ba50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OKg4dU89TObxr1bLEbQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NyBTYWx0ZWRfX2POmULgnrKnY
 9AWqVVrytD6dWxJIH6ihdHD/ccmprJMC1N1wbbRcWPRHAXzUfUZboKJisEiSfdzYEWP5TM+TE+W
 JAG25xkf8VYhk2O0394v69xG6qdPJUQy1smGOWYvsUw+tred0JXpzNw0Xj6tye36ZYMikEXNe9u
 kmz9jQO+uloiDfOFyYBZHFLH0RIxfPsaTgbXd7b8Ke+21PHxwmR6Vd1x5GrOrnBpCyM3xWVfdNw
 8XxkNDP2IdGiurMHRkWrlbYf+s24WwWR81PanbAcmIx4tNVyl84INX9dIBHeysSSPA4Bjd/V5yo
 oqW5n0ZTWSk0BA7xYB26EHeRtOzd5nyNi7VaOo93IXbGjUhjbjBgFFbcW0NrSct+NFNvlDxF+MI
 6mxmfkCV8uCVuLUnoYn0w61ogVCgKEnIvSqgFMqYR644EngN2OKdzL364X2E+6nS0+Z0lqAi/pB
 6iY6g51BXz6aI8bioxg==
X-Proofpoint-GUID: Lwma4QZKuk9RYImu3q5-gPeMSiIsqJ3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210097
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90002-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 167F056486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 9:54 PM, Akhil P Oommen wrote:
> On 1/20/2026 8:13 PM, Konrad Dybcio wrote:
>> On 1/20/26 12:25 PM, Akhil P Oommen wrote:
>>> On 1/20/2026 3:44 PM, Konrad Dybcio wrote:
>>>> On 1/19/26 8:00 PM, Akhil P Oommen wrote:
>>>>> On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
>>>>>> Add the cpucp mailbox, sram and SCMI nodes required to enable
>>>>>> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
>>>>>>
>>>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>>>
>>>>> Just curious, does this patch enable thermal mitigation for CPU clusters
>>>>> too?
>>>>
>>>> If nothing changed, we have lets-not-explode type mitigations via LMH,
>>>> but lets-not-burn-the-user would require a skin temp sensor to be
>>>> wired up, which then could be used to enable some cooling action
>>>
>>> In some chipsets, I have noticed that the gpu cooling device throttles
>>> GPU to the lowest OPP even with not-so-heavy GPU workloads, making it
>>> unusable-ly slow. My hypothesis was that it was due to unmitigated CPU
>>> temperature tripping up GPU Tsens.
>>>
>>> So, I am wondering if there are any additional CPU cooling related
>>> changes required to get a reasonable overall performance under thermal
>>> constraints.
>>
>> Yes, something like the aforementioned skin-temp sensor at least..
> 
> I suppose this sensor is off-chip and slow to react.

Yes, this would be placed somewhere on the chassis of the device to
reflect the actual temperature that the user could experience (since
there are regulations about maximum values of that)

>> Today Linux will not throttle the CPUs at all (they're not even declared
>> as cooling devices) and we sorta agreed that in general it's a good thing
>> (tm), because otherwise we'd be coding in a cooling profile into the SoC
>> DTSI without taking into account the cooling capabilities of a given end
>> device (i.e. in an extreme case, a PC with SM8650 with a cooler that's
>> 3kg of aluminium vs a Steam Frame headset where the SoC is centimeters
>> away from your face)
>>
>> Currently, we have cooling policies for devices with fans and the only
>> other action is based on a skin temperature sensor (sc8280xp + x13s).
>> Everything else is left up to the LMH defaults. AFAIK work is ongoing to
>> create a more informed solution, that would have to (quite obviously)
>> live in userland.
> 
> I can understand that the skin-temp based mitigation is influenced by
> various design decision outside of the SoC die. But I think there should
> an on-chip sensor based mitigation which is fast and usually for a short
> duration which helps to avoid extreme temperature or violating the
> maximum operating point of the chipset. I guess it should depend only on
> the SoC characteristics as it is a last resort. It may be implemented in
> SW (like cooling device for Adreno GPU) or in HW. Probably the LMH
> hardware you mentioned offers this functionality for CPU clusters. I
> have no clue. :(

Yes, the CPUs are covered.

> I am hoping that if this on-chip mitigation is enabled and wired up
> correctly for CPU clusters (probably DDR too), it would reduce the
> unnecessary thermal trips on GPU Tsens and help to reach a performance
> equilibrium which is reasonably good.

Today, the OS is unaware that it can throttle anything else than the
GPU, so in its view that's the reasonable step to take. Further, any
device it knows how to throttle, it'll do so in a very jittery fashion
where it crosses the threshold, gets slowed down, cools a bit, gets
unthrottled, heats back up, rinse and repeat (because the cooling
solution of almost any form-factor is not capable of sustaining a
100%usage workload for long)

Konrad

