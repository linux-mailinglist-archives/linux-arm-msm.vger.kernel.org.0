Return-Path: <linux-arm-msm+bounces-113860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jVAEKD1iNWrZugYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D836A6BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a2RxEn0L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f4eVTeD6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 155A2309A61C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70863B14BF;
	Fri, 19 Jun 2026 15:30:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730E396B98
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:30:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883049; cv=none; b=rWFein2T7jV3peDW7CD3aqxoRMYySmDDBAgKtc0ACeLn4Q5elICzjJl1514ztbzLzwTFKFbRkFFDq3FMzjKPWyN/729E109DajK1xUqmc6CovAUAOjTyA1NcuvWHzGokcMSUH2WS9iHXMfumYSEG1NjEhaNb5a2xnVfL0GlaoPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883049; c=relaxed/simple;
	bh=7DA+ZlpROtZMgl5n43M1+4Ej++u4EG5kW8jRO6LhhBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXlQinNROVsakT9NP2jBxogUuwTbTfJdW8g+Gwvopv/WUbiGUwcVJUzl/OWp9cvXqfqfL3+XGtU+3fjAeHdM6FAEF8yQ8uWK9k7QmSRryfMSihR7TtsqdfTsPlNl6Wkkq1UcYuaRwpQFDMwgZ/PWlWJl2xH20CK3lGtOCGHiwnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2RxEn0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4eVTeD6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC4oG759327
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XI2GUY/TLCeni53ZesH8WgajiW7mP15CJRq4DcQC+s=; b=a2RxEn0LKwBubNu9
	xUjy7NQk6iAoJtZCBqtlrRo40IT8Wf/9r9GBCaz/IjMEkiGi4Npemc4IT+kQ3CDe
	Bv/fawMaLwr4wjiQKbajtZA0PwGwwhDW6BbuYj1cMAcTJc4NYuP9BdbUdDpVY2GP
	Fw3TStHhW/2ycOdFYK+ZzB0lPteIRYNmsA7iOCIyP87ZWYHs9usOgMUTtxR4n/Da
	Kdu2AaGB+KCpUBgSq55VArncmkiH+AmAO9f4q/heeHF6EZ3V0Gq2ldKuoJEAyiyw
	Vj9FddzJ9v9TrHgPPaK1M0wKXPy//l5OMqP3eErmQ8TQhCwECyFrLW4f7QvFUkMB
	8y0J4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp8n4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:30:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ccc2d4d2so55177985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883046; x=1782487846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XI2GUY/TLCeni53ZesH8WgajiW7mP15CJRq4DcQC+s=;
        b=f4eVTeD6ob5ZPlgp+U+DKgbt68fjj6qwW8SZakXIWFOCWUeDEJ76TBQ/JeoCgBCCrb
         yF8xKXKWPDIIhLnVTCZTTLym3UO4h8nIgs8Qgi4ABeVdpd5ZZscnAL81kbPQrt8wuGev
         cq7kDc/N6bRO8j5MzWV8IeGEfYc8BLt3BAPncjpl7CouMTd4FlqzJ247CdzqsQ7xIdqJ
         YWqnZPIRnsb9aXSReicJXRkBUZA9uuxbb9jo5EcpONDC96Fjwm3PPynKAnZMYn7ozaJL
         iTGLoAi8cstFz8rNDkaLxd5sV5e5zW9ln2jdZKX7BiXvDEGh4SoUQt+T4wDs/9Vnw5c6
         WZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883046; x=1782487846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XI2GUY/TLCeni53ZesH8WgajiW7mP15CJRq4DcQC+s=;
        b=bDupK+818BpG8QF3SA4igaZvz/qprl+56FCB2i0fM3sZkGSx92RrXFqGmAEZRx92Ws
         uXCbYW0cy8nNUopEvOqipH2vX3Rjx3FOKX7S/2kjA6Vz5W5x8OdR8eHKZcBTvd6BEBRk
         VxFqs38y71Iz14vjsuwC8/CvtIwXWs634BGTK8JU+etprwbAdiZs6vl3dQpyMrKnUfTF
         ysbtUnzR1aDa8la6Vqfy3dRKRB88GxHBrAGoA02TcrIpHypPW0oqyVvj/KVXqkjQGeBZ
         r7fJLR5f1CpwUaaflwoOXT1M0fnVsGxbjF5KB9Cd8KOtxhgcCgHKNu+hst+LJmJrYoEH
         6rDA==
X-Forwarded-Encrypted: i=1; AFNElJ+9tHxSSjv1P7FLRal47zDhGZZbMLnuwLjaFefeOiLQDAQJuGhYAIFjRgb+tubedY7RAjawQa6LFaLmHUS3@vger.kernel.org
X-Gm-Message-State: AOJu0YyIVqYUx2irOwKmXcqU8NNKa7UzKdJMDoB2dq8k+m0SRq7dHxw5
	AaphU7r8HPOiPN/vwhrhb43K0ikg+nCLd/qgnMbiV662SCEUQnfrXv/zeJTrL7gsAq2SpZhBDiM
	7D/BLvZdTrFfUc/lL4ZN/6F2AFIIWYE1tMjiQ3EVs3hhc3FvabmUx8ep3gOxFpwkQDwWz
X-Gm-Gg: AfdE7clvf3yiVwaRc+4D7BPGwa1nCWnQCYo5OzwklDjJkCmGRMT3k585E+q+sZdFv0K
	nHDN9hjQQBcHGjNyzn1T3J3dBZd9wzDYlsDcRtftZ175/1zOgaELNfQ53qvrso32T9bXS74+SrF
	BMtN3i2YgTf1vxeaVEuX4zEFPE9wMKaC/Hzzg7ghA2Csbu4GOEbVfQ9EX7Aa/PA+VQ0FTiwtiO1
	SPSEveZjPtTT7cSWj+ATTP1t/YYszgCaDDNb/5R/ZxVsHjJyr+jJfAjd5Nl5AW6TW9NMR6NR9qy
	wA0X/Uuyv1eDxuWqEH7J21Xek0KxnvPNJAbbVN+Nqz+dX5xvPi8FzFiRWXbU6469+iXp5wcRSzH
	Zq9IfN+YgDZyfSMrJI6puc+4zmALnkuwaR2I=
X-Received: by 2002:a05:620a:46ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-92088159fbamr405098185a.0.1781883046128;
        Fri, 19 Jun 2026 08:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-92088159fbamr405089385a.0.1781883045370;
        Fri, 19 Jun 2026 08:30:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f3114asm978456a12.18.2026.06.19.08.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:30:43 -0700 (PDT)
Message-ID: <c16a2837-4b04-466a-bf4a-3717436c25be@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
 <ajOO6bx3KmYzhVdy@page.local>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajOO6bx3KmYzhVdy@page.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sb4Lel_edn2JeOiQpOC8IWG9gecLwcOd
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a3560a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=U1D1AZZLGyz8rvu0M_EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Sb4Lel_edn2JeOiQpOC8IWG9gecLwcOd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX0zOB/G6DnzRz
 ac7QXefLgwkPaHKV9OjKlqaWXcov8IoTcs6KEcDKeUuAFzCYuYwLCSxG43rS3puyVgYzQkOBQf8
 hyFx2u4uumECAKpk/GwAT+KNJZGiFsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX4CghjEV3MQcw
 z1Rh9h7x7zYpDNoNuD+uAYuCS8c0vLhtTAPLrebKff+W5STt9KfJ0wqWr82ZiE4mZ5fQ4qceuoc
 82XgLkz22yofvVnqNWiJxAeNYs7GXRNFosHtEbYMoe7g1doRDFFvSfvU/kZvNWnPw1R0EeKo4sg
 eVKUqQz4/wl9JC7i3YhH/2SG3svKcXefSoMC2IBxzXnw+uQ12i8BI8bpKg0kl6oRWeBP8EpMn5t
 G4/7X2qefODCAN6S2+lUMEdK7F5UNr5AAtQqVkj2su9DzcwmgIxHgS1mtQ3cQ/VybQRj57euVvN
 q411kEjrH91Ym1CuRudOs/T7vGaMC6yvq4SNDhtRV774OSN2BYrXm6Mw9P60F7HBnNOcmaUjd9L
 xuPEZkdc4S9+ATQe7cIwPU1+lnq5VRDh8EvjJfJoelZFKRNQ+qaJyz4mfZkqA3V9Mcg0w3K1HUd
 hz27hwhhg0mDrWeCpuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3D836A6BEC

On 6/18/26 8:29 AM, Ajit Singh wrote:
> On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
>> On 6/12/26 6:16 AM, Ajit Singh wrote:
>>> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
>>>> On 6/7/26 1:36 PM, Ajit Singh wrote:
>>>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
>>>>> QCS6490 SoC.
>>>>>
>>>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
>>>>> support along with regulators.
>>>>>
>>>>> The UFS ICE block is kept disabled because enabling it currently causes
>>>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
>>>>>
>>>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		vreg_l12c_1p8: ldo12 {
>>>>> +			regulator-name = "vreg_l12c_1p8";
>>>>> +			regulator-min-microvolt = <1800000>;
>>>>> +			regulator-max-microvolt = <2000000>;
>>>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>> +
>>>>> +			/*
>>>>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
>>>>> +			 * VDDIO and the external 32.768 kHz oscillator.
>>>>> +			 */
>>>>
>>>> Sorry for the long review timelines on the previous patch, many of us
>>>> were out for conferences..
>>>>
>>>> Is the oscillator used for that WLAN module? Would you ideally like to
>>>> be able to turn it on/off?
>>>
>>> yes, oscillator is used for WLAN modules. Oscillator is powered from the same
>>> VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
>>> in pwrseq. So I think this will work fine?
>>
>> Probably? My point is that you marked it as always-on, so it will *never*
>> turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
>> needs to be met wrt delays between toggling various regulators and GPIOs
>> going to the module, hence I suggested you may need some pwrseq inbetween
>> to achieve reliable powering on/off
>>
> Right, I checked the module timing requirements.
> 
> The module requires VBAT to be present before or at the same time as VDDIO, and
> WL_REG_ON to be asserted only after VBAT/VDDIO are valid, around 2 sleep-clock
> cycles later.
> 
> On this board, VBAT is the shared VCC_3V3 rail and is enabled by hardware, so
> it is already present before VDDIO. VREG_L12C supplies WLAN/BT VDDIO and is
> kept on. The WL_REG_ON timing is handled by the existing mmc-pwrseq-simple
> reset GPIO/delay before SDIO enumeration.
> 
> So I think the current sequencing matches the module timing requirement.

Since the sequencing is handled, can we drop the always-on property,
perhaps by describing the SDIO WLAN?

e.g. in arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts there is:

/* WLAN SDIO channel */
mmc@80118000 {
	arm,primecell-periphid = <0x10480180>;
	max-frequency = <50000000>;
	bus-width = <4>;
	non-removable;
	cap-sd-highspeed;
	pinctrl-names = "default", "sleep";
	pinctrl-0 = <&mc1_a_2_default>;
	pinctrl-1 = <&mc1_a_2_sleep>;
	/*
		* GPIO-controlled voltage enablement: this drives
		* the WL_REG_ON line high when we use this device.
		* Represented as regulator to fill OCR mask.
		*/
	vmmc-supply = <&wl_reg>;

	#address-cells = <1>;
	#size-cells = <0>;
	status = "okay";

	wifi@1 {
		compatible = "brcm,bcm4334-fmac", "brcm,bcm4329-fmac";
		reg = <1>;
		/* GPIO216 WL_HOST_WAKE */
		interrupt-parent = <&gpio6>;
		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
		interrupt-names = "host-wake";
		pinctrl-names = "default";
		pinctrl-0 = <&wlan_default_mode>;
	};
};

most notably though, it seems that the brcmfmac driver doesn't even use
the regulator framework, probably because all of the SDIO WLANs that
Linux supports were wired in a more "embedded" way, where the V(Q)MMC
supplies were enough.. unless it's the case here too?

Konrad

