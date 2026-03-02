Return-Path: <linux-arm-msm+bounces-94891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODfQC3pypWlsBQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:20:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C671D75B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36F0B3011A50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9393936165B;
	Mon,  2 Mar 2026 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUIuDoxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7AKa54E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C4345731
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450422; cv=none; b=jLFWBx0fIKUzBD6z/hcm1YfKaQ5jZsDI9O6XB2wBKOuU9InoWeaQCIEy4PANc+SAjQPZ6rWF2/ZDprIW5ToTpZsAtnHr9cG8CLuw5C4hFTkqNIo7BcNoervgjPG2vih6J9bsBZB4HKMUIUSnDeTeQeEPXwJXR/ry0LuLpli0mqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450422; c=relaxed/simple;
	bh=sQig8sH4E6BScJY+xOzj6lYCScaNQLVNeofLc7c6QnU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g+KcTL5RrVrlPkV3WofreR6NC0MVSdA9x+pzPV28huKUdnQ5gG8GAvx36b8XK4R2t6c05jUqMQRapFHLVAcZXHaya9MqKGwyOB8Y4UQVDYqfB996rZ1bFIT5eDt7xAqqjsGhpXaNBPa218CCY/yYaqJFFRfN5bFvW1Ps/XwpLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUIuDoxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7AKa54E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227qhQn083705
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtWv5X/swnOarr0QHEdJJKrMDmkoZEjG1RFAlj66QzY=; b=CUIuDoxJgTKFN28l
	as+0772ZLXjFDIViMYasli4sLWH/UiZ3/rFnVj0NLqodk51k1y0iWN58BsdcBgiJ
	M+A3yXhOmZyFx5m1Bdpi+7100AY/TXwAuv7up9jAXrc0asPzVK0Yvaixt1qnm35O
	kOfEAA0bLk3ihM68HPS1EmQZHhiqEGziCiH27aFDiv2M+MNlH/Xj97LH53EMgDAw
	h+BJ+m8ne3N/pPk7lOYZ7atJWp8JL3GOEFo5X8aIjEOZEwvqxTpPm3mmQ1fy4RUR
	8IgivJ24tqKXFgcrsXrT7YEAWxD/sna0ySghZaD5ZUdaZJdyZNl6CPXjxA5U+RLM
	ojZbyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64a4mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:20:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a01982dc5so2080246d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772450420; x=1773055220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtWv5X/swnOarr0QHEdJJKrMDmkoZEjG1RFAlj66QzY=;
        b=V7AKa54EKUKCvfFXf3/lF9p8BDPPLgf/2Q9j6eFfkC50CtSJSVRTzi/CHuhmFqDgJZ
         Ahk0lSTEM7N/00Fs4QbOi5cOAT116wmYZLdPexQTE2kWcr0Dm2urDbxihBW0uv/R2JQv
         JAzbroOEbYmId+jeY4yWdpUIrrTdiLCLTyF2RDVM5mFyoXfkXK3I/8TRwSKubCClnb5R
         DCQWLIMI8OkmjR3xcRsKEpFhLHBQ5c/njpoAsAVxgKagOm4iLY3MqipZUc84K0b4O8du
         o0GilsfVUJrr8Bx4Hk2AB6oKeYqPqWrd0MpJpbMD816DozPqHQuRybYWgRxJp8wE58m7
         P8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450420; x=1773055220;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtWv5X/swnOarr0QHEdJJKrMDmkoZEjG1RFAlj66QzY=;
        b=Jw7QVO19sOUWaNqB5/T77RTaYeM/5f1m3z528P8tAez/11h9uB4cwQUUQpZofEUV7u
         9RSsyKdIAy3nEMa/rsL3ntO0wUSS/na8mr9DPa+45C0czrzbI7+eZZG8VaXDEgfbMeIy
         nYcoCp28OJ3OX0aIU6pd7mnEzls4fgOW38i5oUuQR0wIIwwL71YdUcWJOOghM3RxaRb7
         TjOk7hoylMSCQ/gICnlmVibcaYEe2KjwncOIrJPauFzy9r7umkEUCws6bsaByfCjQqyz
         SogW6ivQFOXcZtoJugvEhxpWs4GTC0Fs38HS94pQLSBb1cc1u1CxS5iIRKebPe4LgNTk
         QtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjOaJsgKM+dF+KGOEaMNTkUodxtduFAPXkbCWuLSEy4iUNanTuL6M3qwgStwqL+x6sG1ZNERJE5zVcYz4h@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7NzAET/zAi/7nbYRPWdTbH30cBB9KvGBJOv436RapPzYdpx5
	5L3amkLSwwu1r9y/B2NWgKZpl5Qs0IqoxtdwcvGj2ZY3fvZZ/ee/Rxeardc7H066jt3mXhbH6Lp
	ew1CmN19rXQWEDTUsrZQG9sDhPoQBWll+dgi+tar6+I68lhyRaIPdVCCYT4mjHl7B22ZF
X-Gm-Gg: ATEYQzxjwIxSQiRPwfByQhxdgUmUAgdmovFOiYgcwBw4Wr/u4cMRBVO6akGK3hjYINE
	OpW11WUA5fnngPQphz2Ehbgw1UdliMUTa5XOe/S3BBztMczwfKPY4PbYsgPrTd2HuEA11ej4FMh
	y1guUl7pZ7WhAdZXbNOj1GWcjf9aQZraDg/b7GZfL+x+J4ayrHYFvUEf15V3FUUxKBInQC6kuKI
	X4IV9RmiAj68t/kwYKpfrqaOP8ecMAq9sfNWbnu/s8ZpjXg8GP7iC7LLqc/szL2QyI+GSO1jFKx
	5NTKJqGgghiTUVoXa4tC0wmYGSUjyaBrHqbehYIBKBHcdnIoE8EMJkn83fGTmSMSkzqRWcRlLkQ
	ETyEA1cR8geTW5YKizeDI9kD2ooxtubMjDi4z/SDmLkaGwHFGnzMR+2h3cKezdqUglLD9NYSmoV
	VFMHA=
X-Received: by 2002:a05:6214:5c82:b0:899:bbd1:da65 with SMTP id 6a1803df08f44-899d1e5b4c6mr116037736d6.4.1772450420041;
        Mon, 02 Mar 2026 03:20:20 -0800 (PST)
X-Received: by 2002:a05:6214:5c82:b0:899:bbd1:da65 with SMTP id 6a1803df08f44-899d1e5b4c6mr116037436d6.4.1772450419559;
        Mon, 02 Mar 2026 03:20:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aead96bsm463768466b.51.2026.03.02.03.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:20:19 -0800 (PST)
Message-ID: <d71ef31a-d7dd-4350-a784-a77e63be96ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:20:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CMA allocation fails with default 128M on X1E80100 (Lenovo
 21N1CT01WW) for ath12k
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: =?UTF-8?B?UmVuw6kgTcOpcm91?= <eldeinformatica@pm.me>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <7pJkV7xouk-7S77gIvCwPj5EAAVe0JWdkD5Dc4Q7Y77_gPr5m7jMA2om7AyEN6RKBmEyFbIDJceHFstXFuzPJWPNhqafLXOu2O0uCDZEFcY=@pm.me>
 <05ff4122-1a8b-4728-81ac-33a7ca542461@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <05ff4122-1a8b-4728-81ac-33a7ca542461@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: smabYyFglYbJfRurpkV42kQNdWoQJYPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5NCBTYWx0ZWRfX5M740ciUUSAH
 zACa96mBZpAuGHec/NgP22bw0IiWKITfNZTsUgMAG6A3yq23JgrmL0G9O0eDBoLJoZON9tdY09t
 PHVieTvDBo6MweLRnV9AebCvC5bXUtvVEmBrYpo3wM6utZ5gQRJ7KsD8+6mrTpuzYnNiO87PnkN
 MmseySD54JgontaJr4rHcX5Te/1qLMZmUJo0nNn4bo/ZcAFN0UygHcdMSdrm/sAOAqgfKDP/VB5
 rZ246So8TiK8o6E/VkeFRYhG332sbQ3vdBWG2RhA4by4MHkHT+HaOaiFgAkVleg6p5YZwk5ajMQ
 xKlVh5XAF8u/F7jE0rLjJdEBhbbKPSBBb1w+TByplYqu82UyBr4oNq6L9AjZoV+TCy3wZXjdhKm
 rleMF73bYtN6kiaBeV9jxi2s+CQwPOMuSe4HnA51dpjUvEjyd1BHyvhOi7VFbbSlf+W1UWB3SZP
 x9mBZTTKEv/qBPF6AEg==
X-Proofpoint-ORIG-GUID: smabYyFglYbJfRurpkV42kQNdWoQJYPj
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a57274 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=O8M4a_fLt_X7kILUOtkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95C671D75B4
X-Rspamd-Action: no action

On 3/2/26 12:19 PM, Konrad Dybcio wrote:
> On 2/28/26 10:29 AM, René Mérou wrote:
>> Hi,
>> I'm experiencing CMA allocation failures with the ath12k WiFi driver on my new Lenovo 21N1CT01WW (Snapdragon X1E80100).
>>
>> Error in dmesg
>>   cma: __cma_alloc: reserved: alloc failed, req-size: 257 pages, ret: -16
>>   cma: => 1042 free of 32768 total pages
>>
>> System details
>>     Kernel: 6.17.0-8-qcom-x1e (Ubuntu)
>>     Default CMA size: 128M (set by the distribution for this hardware)
>>     WiFi chip: ath12k_pci (Qualcomm WCN685x)
>>
>> What I found
>>     With the default 128M CMA, the allocation of 257 pages (~1MB) fails
>>     After increasing CMA to 256M (by adding cma=256M to the kernel command line), the error disappears and WiFi works correctly
>>
>> My questions
>>     Is 128M expected to be sufficient for ath12k on this platform?
>>     Could the driver be optimized to need less contiguous memory?
>>     Should the default CMA size be increased to 256M for X1E80100 devices?
> 
> The default value in the arm64 defconfig is CONFIG_CMA_SIZE_MBYTES=32,
> although most laptop DTs individually add a 128M zone under /reserved-memory
> 
> We should probably enlarge this value in either of those places, although I
> don't know whether changing the defconfig is going to be welcomed..

+CC FYI

Konrad

