Return-Path: <linux-arm-msm+bounces-92030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE33GzHbhWn4HQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:14:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E916FD849
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6F4D300809F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 12:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B4B3A1E66;
	Fri,  6 Feb 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNSCitHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJJIpzhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14312309F1F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380074; cv=none; b=cjqzrESAAz09WxO+C2+f4FcymG7PFLxw6XHqkHtJv91yMeiLM/zs/0QXBeeaOS2Bw0XONqv03yISDzuqPSHYUqejYjghINSsJgm01ZdmslVw/jkWs+Q7s9cFhE7Bry76ongsIRKFPv2BYbewMSMrFyoO3ll0kw+KXLcrJsXJacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380074; c=relaxed/simple;
	bh=hXOHsOfXD5mihICS650SxJSJmR9bv1G2AOVi/7XXQao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0L1GyNjm3ghedVWCilxWjUypv6V94R9Y8/NlUS5hxxPA/VRiOQH9NuseoPyDMJoN+ykPNHiEaRf3/2VWNE8R4OsW1ZzXvKVbMhCHollio6MTPiKehpDmcKqqYeB+7r1ubVRURpmz6NeJdModH6Dnf3p61k+GdwuMlXqpptC+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNSCitHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJJIpzhV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168cEZe696579
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 12:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nT6FRmnp0Jch+N2M4b/OnTDlejboaGGpjvhRTjZezn0=; b=XNSCitHkatb8Glw5
	93KTK4J2Y5PXTy2rrw1uAHzn641Wpl/Aj5UveMCfi+6wf9Mw3VKLY/zu+z2nmZbd
	Jl4af+5JoEpecqqPdnEhRYK4VVbMTQUOVvuiDBszCrd8x0CvEj8iY+T0O+ocPjM3
	dDh2kXnHLL4K69lT3OOqSTujaIAenh+l8GkgzbQzzcrBzu6w/NiG+DabkuabCpF7
	UNyQzR887QL93oUNiM9sV2SHoyz5L4CQul9/K6vqrnTV9Kt5o0u1b48x7g67OQDQ
	pjaZt1ePr8SxaCMHmQM0cgfS6BUXy6n0VnFdtASAuGeMKq3lINIPc5SFbuLx42rd
	R/il9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qvae45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 12:14:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6d6b0f193so41849585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 04:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770380072; x=1770984872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nT6FRmnp0Jch+N2M4b/OnTDlejboaGGpjvhRTjZezn0=;
        b=WJJIpzhVYjR8FWIeZiDPIz5WzxqWl+bfFvf8ZtleGdFNBpOXCWJOQ0xk8GchLgz2E2
         AdkiqC6kpWsVw80JFQQtljAFs7NLZQfWPkhadvJ388EoHV3W72SDbokMkJW07QABF5zO
         utRF+DqfoEGPYVkW+2DApwP0h+792N/K40OPwZrcnoTHiv/GY6fY+ejBblTGEmLS/R/l
         Ws/VaBNZozJRw9eSnzpCHl4kfL68vMznNaaZliKKeLfBwcc6YWrll9HsJDX6qgBBVNUh
         UNmAHxGVVfFa7Wcg4Zq52nh4JqQc6bV1NXWaNWl1HJfpWGIPYW+65BHCdmqqSRmeFptn
         hYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380072; x=1770984872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nT6FRmnp0Jch+N2M4b/OnTDlejboaGGpjvhRTjZezn0=;
        b=IeGG2WBbigadsistjjPWrmCKzdjlfT4hlCLWWt1iTTbh4fv8w5AVQkP1SyRvjCQjpp
         8V0qR17af09SGFqgJLuUfXiiMpz6itKicHWS0cR0WeGU8caENDkDxGrTD3ataEv7Q9G5
         G7ppi7oUFpKYrKaif5ylvlP5FhfO2ScmGDeYRGNw99F5LUmIa59uP+20iFIUYMFMQtQF
         m0hgOV8QGibwkpdSE8KUNVPmxmYGAbFdPNBbbYMc6mfkNxIbWRxi1jwk8AE2Qng2ZASE
         5MBpxPj3wjacBMe/4Cc8ua6jRsiOPHFyCZvN2LrOeSvtezzdts7n0SWJyfi2htS+BG1g
         Rswg==
X-Forwarded-Encrypted: i=1; AJvYcCUUSkaD2TFYb7EOo+WGNq0xeyStiZaai+fDT+hYQnLBy4lJ4dXR/zNEtqHwbG4uXmrB2eQATnfso9FKphQs@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2+LviYJXfjmzcS7ukC2Z6YsiYK6WQu7wucy8SQTaeAb5M0Dn
	pe6LWVkXMVqmjL3JpJXsHYglmTBJ2wDNVp1lxFIBI82owB5aMoIv+czWdKcdIAx8d3fEIjGSGTi
	II39wjnwR7LQT4uIZqRd7eMKl7f28QZCaDcfZi71IKMMU8Yxyzpbb3e2PALol07dhpH8n
X-Gm-Gg: AZuq6aIM/WNNYwqjVmfRMi+1QaZkF0TetZ1ItK3I+1OHuzTU5N35JX+XqQDWUs4cZGA
	26FpWP9VgJSclj4SJQC2sJYmzXugYM13NLMAR5MZ2Hi4fHne2GkpAMxJdC396zrAg1ORSKG+8ml
	0Txk48XbePBM6A7dq/ZgsTHTm/jI1t2AIGCq/mEVm/8ZMUmyFUYMuLLvPtqP3+dVPkX2+J8uBln
	3X7Ti5XMazUAepPlX52QY2hF9HWh16CeGgzBdV5uD1amJvpo4lr0MsSXunb0H4kridNqjL0+klL
	nP0/JUvziUaVl3YTPEX6l7rKBys+GX1L/MRd83PBJNOyGDgskSZKIDFrjkDu/VttAiRKGN6Cjrv
	09l41q3xjjmj9Ty5xAYcQfXd1OUgMzBxZaWDHAsL8AlEafIT54s2oDDoGP07HpwJLvN8=
X-Received: by 2002:a05:620a:3185:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8caf0e3369dmr227573185a.7.1770380072225;
        Fri, 06 Feb 2026 04:14:32 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8caf0e3369dmr227570485a.7.1770380071701;
        Fri, 06 Feb 2026 04:14:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1532sm76010066b.55.2026.02.06.04.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 04:14:31 -0800 (PST)
Message-ID: <32e65de3-5466-4a91-b7d7-9c0ab9531ef3@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 13:14:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Enable ICE clock scaling
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
 <aYBF3Geeuq2qHmYg@hu-arakshit-hyd.qualcomm.com>
 <cac8e14e-63e4-462a-a505-cd64e81b2d1d@oss.qualcomm.com>
 <aYXYmnFiFbZnVRqX@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYXYmnFiFbZnVRqX@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=6985db28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=WEYNnfNoJtBL0Lpg3fAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kG5a6_WaUUMgQaZn0AaTc1pLefpW0XBc
X-Proofpoint-GUID: kG5a6_WaUUMgQaZn0AaTc1pLefpW0XBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4NSBTYWx0ZWRfX3KQ93oFnTwgQ
 crqDHjNKYvfP5lsgJgd9xaKHDcEZE2Tj2NuEcIUh8k/kOskls6EHdiRy42mr5H9YiKZYzS7z57M
 FhQ+3b+8ACqVyzg7IF+5rqJBhYVM9PNBEuPcjZXlnG9Dm0+kaxZsitV46G+RTEbMC/g0400sKCb
 5+Q5S0KdnXjgYmQIfx4vrEo0wGUC8/GHR8+qZdN6c2yQz+MwJS/ai69qbLB2qD3x4CqlQUDwCa+
 bWFgWxYe0WAUBxHlOreWC/4dg/MEO0ks+zBUZG3zOE4QyaRMsuKNJGARiuV7mHP82umVAMyKi47
 Cp5VO4bwtOlqjhW0jzS+CJubov3+QXjuuWr8rwsrdTRNo6Iw7Y5ZsnzwAnOItjEIL2gH9IpKR12
 Ndx+subAqw7nqW6rtlMIR4d3XeAhEkjzKgWl0WQ+rddSqhufUpZn/whOkg7bK1n+/tf4PjSpYL4
 P3yOnJgXs/i4xYRcs4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92030-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E916FD849
X-Rspamd-Action: no action

On 2/6/26 1:03 PM, Abhinaba Rakshit wrote:
> On Mon, Feb 02, 2026 at 04:01:38PM +0100, Konrad Dybcio wrote:
>> On 2/2/26 7:36 AM, Abhinaba Rakshit wrote:
>>> On Thu, Jan 29, 2026 at 01:17:51PM +0100, Konrad Dybcio wrote:
>>>> On 1/28/26 9:46 AM, Abhinaba Rakshit wrote:
>>>>> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
>>>>> using the OPP framework. During ICE device probe, the driver now attempts to
>>>>> parse an optional OPP table from the ICE-specific device tree node to
>>>>> determine minimum and maximum supported frequencies for DVFS-aware operations.
>>>>> API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
>>>>> controller driver in response to clock scaling requests, ensuring coordination
>>>>> between ICE and host controller.
>>>>>
>>>>> For MMC controllers that do not support clock scaling, the ICE clock frequency
>>>>> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
>>>>> consistent operation.
>>>>
>>>> You skipped that bit, so I had to do a little digging..
>>>>
>>>> This paragraph sounds scary on the surface, as leaving a TURBO vote hanging
>>>> would absolutely wreck the power/thermal profile of a running device,
>>>> however sdhci-msm's autosuspend functions quiesce the ICE by calling
>>>> qcom_ice_suspend()
>>>>
>>>> I think you're missing a dev_pm_opp_set(dev, NULL) or so in that function
>>>> and a mirrored restore in _resume
>>>
>>> Thanks for pointing this out, its an important piece which is missed.
>>> We can use dev_pm_opp_set_rate(dev, 0/min_freq) in _suspend and restore the
>>
>> FWIW
>>
>> dev_pm_opp_set_rate(0) will drop the rpmh vote altogether and NOT
>> disable the clock or change its rate
>>
>> dev_pm_opp_set_rate(min_freq) will *lower* the rpmh vote and DO
>> set_rate (the clock is also left on)
>>
>> Konrad
>>
> 
> Thanks for the info.
> I guess, dev_pm_opp_set_rate(dev, 0) seems more ideal as this is
> API is for full quiesce mode and the clocks are anyway gated in
> the suspend call (clk_disable_unprepare).

Yeah, please make sure to call dev_pm_opp_set_rate(0) *after* you
disable the clock though, to make sure we don't brownout

Konrad

