Return-Path: <linux-arm-msm+bounces-115618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WP22BP7aRGrB2AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:16:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0D6EB86D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IjmkdqYH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JCDtpt6x;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115618-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115618-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0419E3017BAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B723F4137;
	Wed,  1 Jul 2026 09:16:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE13F4853
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897402; cv=none; b=quNxb2pTZpd4zv8IgSeCT1UFpdGsL0IZCIRW/jzq3CzsPnu/F7YTRpBsTsWwFQqScLb6Bn1tepoXqeZ6SY472rM3jklo8o+r3LGVbH4uDmf98iGqmO/vqSwdDQ+XyIOlvR10svul5Vj/hTR5HVSyJ+kd6zb9nFVUrpNHhcUO/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897402; c=relaxed/simple;
	bh=YVwgQbUqvO/cXJu0uYhwMlWs0d9HSq0ha0qBi4Yel2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyslIjGt2bJwQcg5oAAUMEw4SFOGc5DPVXQCcWtMckkYtBUyAiuWs4IDXDphOIkAaScMj+wDTkFG4aqU/Tva6fzqLtUX9YaVmG9uAySIerJu1fIOp/8ELoh62DnZlYm7l1poZwlml2c/fbyDJH5P6HLNhoGlwC3zd1nsgIHBk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjmkdqYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCDtpt6x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G2qO455978
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 09:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Smnh6dpxA7GSflHhp9Ym/+c6BAz0hfiEY8iMiw/ngGI=; b=IjmkdqYHauI3wt3v
	1jKzAQbzk1Lz8eAFWrYTXhsRSqmszQHjN1JOXEEy9MfRMOyTIIm5eO5s42XvTzGq
	LJMIJcBV6O/3hcLy6c7Cqxn7HtEtLWe8B8+TFsMR0JD7CS15YY36ITmE8FcfSW0U
	iMYWf37lsW7gB05Jdd/uu9xZmg514BOVRusw+vsdM2AsJ8rfdUKh0ujnlt1seneC
	66nm0XGx5V4KW6vn4+WEuVVtENESJhUjwY22y4aBnY0yqkcLrKujyOUlN+ple2VS
	bO+fgYhC2ES2vsZzgO+rZKWshrazOOG46Y9OV7N6DU3iRcbiwMJRs4oe0DHLLSEb
	OV6Huw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwb7wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:16:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so815391cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782897399; x=1783502199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Smnh6dpxA7GSflHhp9Ym/+c6BAz0hfiEY8iMiw/ngGI=;
        b=JCDtpt6xKYX/0WX3GLk6UuwDnvq8wbVhhyzxglm7/mEfheLASyeN6AE5oRwVJyWvGk
         pnBNltx7di6jMOFiYqN59oelWnP4pkbJcBP4brttWkK/VLbr3G1gzrt6WIDbHedD3RPV
         2gQyA11Bxuiz7iiXZpotrB6m2lQKXX5M986PY8ECX8LEdlvEHFs2/UiiC3ZmTz0BUXiU
         cYYfM31xwVm4vpIDFlSMXcwy5UokDRg7PGHwUEbnG8XaQ7mfEGgLwcGFLnn96qu3MjTm
         +rWbuE2zfuYLf2nSBAheeYcKzyRxcBu71uwd5KfSsyNYe6YY0MTAkLqdv/phA+QJrhvA
         INfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782897399; x=1783502199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smnh6dpxA7GSflHhp9Ym/+c6BAz0hfiEY8iMiw/ngGI=;
        b=EdVU1KY/OWp3IAY0p/FcdPZ8rhTGUk0aQeuKVD7k8Xf4x6to5G2lhHSgVAwLAXqr9Y
         Gny/8wUX8qCARMMPQEHzknIW9rvWcavcZ9UzauYYRhdcr/J6m8OH3lmnvOggJYMY1YML
         kHez1q6VLCE3ZbJVvQb1NqAmjnsLFINYGyPu8vTOSFvjkhcbYM67CW7qfIUEcC6wwzMZ
         MtxhPhTwpyMDbb37TR1klVM6ePforx9eNL/eloTnXlpt1pF0quVAaXEWRSNnwKNcDnXR
         4IjeCVVHdnQ3Tefl1BTJpsVPOmvXLeM5G+OMUgx2IEx1gNfJxQtzr1uPh90JBzC20yi5
         wEUA==
X-Forwarded-Encrypted: i=1; AFNElJ+7NT8EdY38lEsOTnu9RafHmyYz0dTizYD81Roi1NriOnByKOAvv7Tq0tAKtJT2Fxkht5UapKNULIwYgsmF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Uk3nAtSfL0oiFrapVnijMgw7mFVFOqmCUwfznLFv3b0Kewju
	Q6JD7aE1d9ROyatZZuf9sN0yApSkDsJ5Tuxmwy9pUPqDJWyiW4RgbIUaUY7FowUg0moMWZJavcS
	kvdJ7TuZHxKqdew0ImyCWv3WEZoc6OElmtEQ8iCINeTxPIcCK/+74vue+z5AvxrwOacwz
X-Gm-Gg: AfdE7ckMYNdotopFy9hcHHigzWj5lL49DTX7uqTUHpDfbQWfsb/UyFywGwQ8jBkfWSb
	LCs1XV3poich161ZReyUYKz8yKTLwalYg0OBXPSg9ePk+vb2WyIC/pPGK13gmb9nFPz0QPPO9Gg
	UxhByOmcahhYAjFPVo3eqzPoYZW3znzfODfQEJwbe2eeKfcysmZK57vhdiciQlkCA0j3AAoQuJp
	oSqAGN2rfoR//VpUJMcVOUyWCbW3gvBRcPmC/i3leqyIjK/RRfhoB42wFIE1oTWb1vS6HMWK0g6
	VPbanaV0Pv1fnxm4iV/8AUxYPm4SVW+RbtAicSlyMAgcz9gXClRgK0/kLxFTXXE7DKF+nU1ONb2
	ouPvMA5xK0avUZlFFzcKtYrO84lfqJ6/+/aY=
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr62957985a.1.1782897398666;
        Wed, 01 Jul 2026 02:16:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr62956185a.1.1782897398265;
        Wed, 01 Jul 2026 02:16:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ef53sm243541466b.7.2026.07.01.02.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:16:37 -0700 (PDT)
Message-ID: <1f999970-1dc0-4eef-86da-64f555cc30be@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 11:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ram Boukobza <ram@imd-tec.com>,
        Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
 <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
 <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
 <fd78f8e8-07c6-490b-a9bd-d581a28c1f04@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd78f8e8-07c6-490b-a9bd-d581a28c1f04@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iY-fNMb1_VrQfIAPKRMl-KxKzihvVXpb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NCBTYWx0ZWRfX239uGJF8J7kp
 MtSeI1EVjzSsfm3vcAFODryj91a3QqRWcMcIxqaguLCpRjIwaEPk6Xw1uyn5t2HuZPIAvKUBBmB
 gN0akr2bpcOnX03tOQNaTtI241gjkeQ=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44daf7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=gNcS5RXMAAAA:8 a=giWfNUZJfUIx4I3DD8IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-GUID: iY-fNMb1_VrQfIAPKRMl-KxKzihvVXpb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NCBTYWx0ZWRfX+k4CEC37LU/P
 E2Il84hLTO/w+5h0pv0oXZDj2+Go7ogQsAEo02shyaJHvXG6cV5cGYhFHCtZ5F1ptAEgC9F6XFb
 zUlhGrQVqpU7VNF6g1DXKEoJ3d1yx4c5DXAIO0aNBz+tnjLw2lo3s/TYLabsVIYF7QZS8gsSd1Z
 ClBO1+DDsa+LbKdwwpouLuq+DtePZMONA735lFy9Bo6K9Eq6eEP57J88Kkxk1+O6dsDAA3cA0pe
 KHWZL/Z+/j7hcMZOKKqHLa2ROH2v7brwfcA2duqUQYlOYKpZvxUdqHEdjwSTAURhskV0wNEXZQh
 gcMzMP0hQ3XZbQVZ92vhUu1HldtI9vMVEEvY+U/1pa8IVH2ImuyAfhbZ8mCclkWxOt4WkPiw7BM
 Rmqg5jn12sWu8x8zBxPyn57/jXQNoj0ZaB1oudGbQlpY282c3Rgs/cRn7j3+XHx59s51gaxmo9o
 EID+C97qyYVEf77zXrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115618-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,imd-tec.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96A0D6EB86D

On 6/30/26 2:41 PM, Vladimir Zapolskiy wrote:
> On 6/30/26 14:09, Konrad Dybcio wrote:
>> On 6/12/26 11:11 AM, Vladimir Zapolskiy wrote:
>>> On 6/12/26 11:47, William Bright wrote:
>>>> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>>>>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>>>>> what may be the rootcause, I believe the lower bus frequency should be fine,
>>>>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>>>>
>>>>> If you find a chance to copy the SDHC driver (and its small dependencies)
>>>>> from Android and test it on your board, and if it also fails, then it might
>>>>> be well concluded that something is wrong with hardware, still it won't be
>>>>> quite convincing that the SoC SDHC is to blame here.
>>>>>
>>>>> Hope it helps.
>>>>>
>>>> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
>>>> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
>>>> kernel [1].
>>
>> I have a "feature table" and it says SM8550->SDC4->DLL [Y/N] -> No
>>
>> no wonder it fails the tuning if it's not present (or that's at least
>> my interpretation of this doc..)
> 
> So, is it a hardware problem of the SDHC4 controller, which reports "SDR50 mode
> requires tuning" bit in CAPS1 (see SDHCI_USE_SDR50_TUNING from sdhci.h)?
> 
> https://lore.kernel.org/linux-arm-msm/aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8/
> 
>> There's some notes about the frequency being limited to 75 MHz in
>> SDR50 and to 37.5 in DDR50.
>>
>> The supported modes are DS, HS, SDR12, SDR25, SDR50 and DDR50 (with
>> the caveat above).

I found another doc now and it says that on 8550 specifically the bit
you mentioned above is recommended to be "overwritten to 0". I don't
know if it's actually r/w, but the bottom line is that tuning should
not take place, per my understanding.

Konrad

