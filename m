Return-Path: <linux-arm-msm+bounces-115413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZxWDE4m2Q2qDfgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:28:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A06E42BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:28:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wr5Hj7rr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PR/Filmw";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 397C03031923
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A4840BCA4;
	Tue, 30 Jun 2026 12:28:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9B40B383
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:28:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822524; cv=none; b=ufg9F/6Fv51bVdHxK0ps1QAVlFUFJVBE2CiENCiiXhMgs/Eh1Fq+qi9Oc+NzI6xvDY/FLF1XimxvqUwSV9/NhVEDB15RGtosR+A9QG5pg9nLsyqn2KKuhFAOXLJQ4DaYecJa+u35Nw0TcH1n0v+81cWvsWFjbLVLxnTsXy2WLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822524; c=relaxed/simple;
	bh=mW/QBS1QWFhNlkYNGp/xwFvmKH1UJjEnbQ981I2SMO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPFCwCs8ihjBf7BFShdNlkB7Jkg01jd4o0p2S0Zimvh+SwT62m5mhU2UvnGY82JYjoVPsjkg2Y6mJqCXNDIFECehRJx4jUbuAIn/yJxK6ewmqlt4O5wF07u9TnqpUcB+eR3HrogA7JZHG/+dGFwSTpbyvKWUj0K7Qq375dSwjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr5Hj7rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PR/Filmw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1ou1573350
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPAZDw/mw6Phn9P0hIFKkIjfUsEicHNe79M3BF/BUVk=; b=Wr5Hj7rrdJTXAmmo
	nYB+chQjtFAaB7mbMqICgO98BtLMp/uQNO7tLOPh1TZ69E5DzSxxkePejzSnDbJf
	Iew5fPMqAAofarVozWUTykTZOZH/ZyDEUSg7r0iIN2rWbnETFhXpGP3wqYCgqXdc
	cXhh5iATitbl2hGRycTgAJ+5xseUTcSWR61sGtjReORlu+sop8JC3efunstQia/O
	TwJTw0tK9gSvIv4sb1ZU6SrH7H/uAILxlGtVZw7p9+Xx2nlRdS0Oo74OQN6mCCQC
	nDp2my+b5GN9GChtd1/YETIdddfrobnRYigZG+8ra/qr10Zta42jXf2YnKG5thWy
	wTYMIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f468625xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:28:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37de9c29aecso4744221a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822521; x=1783427321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPAZDw/mw6Phn9P0hIFKkIjfUsEicHNe79M3BF/BUVk=;
        b=PR/FilmwyTvWjSPlvbhGNAjgrZy0W+Eo1dHV+7VI49M/yXyWo6eBWelWRS+EMPRlTL
         JPHRwFi6IcjA0YdGmv6CtZlgmEBxRCHF1jCyw0GBXF0+Cn2uFlimfOfRFg2IvyOTixPo
         a+mb/eHUTTi7kDRRR6lHMxWgdvNd84F57/Cdz8lP9xYFQgSC1tuJMs8BQqi1nlmYni6H
         7pOEi0w/tpLYVCjM64ef6boEadk7F4z6v9Ohq5jnO+1hS4Wn3oJ1Ui0nIoBo0P3nbCkn
         JSydvHWlkWipgVfWiko5tS0MkZNVqDIljY+7cnsp8ycY5FROpL9N3C/x8Ul7dKCHX8GC
         cFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822521; x=1783427321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPAZDw/mw6Phn9P0hIFKkIjfUsEicHNe79M3BF/BUVk=;
        b=b0pfmv38/FrkAPVsifwi1t1l/RkyjiQzQkKufr3SV/4E8Vwrc2aKHuT6iR3+LaRgaB
         pfjmqlmcncN8dw/brOzPDDmSqaZTDgebkeX3t4ZfJyC1nSB2tiwyFTLjzMNnqfATES2Y
         pwEP4UNEypsxecNnYgeB5acdAIQ2jU2B1Pbzpw7vF8g14Bj2uEqy+VAb6qTUx0wS4BVU
         alOUglu5mFdB2l/28Jc8Gr1Ei8L4Qsrlc+ZuruQ/h/JF9S1l60Gaor3ZkSSzYywAxUPl
         A7r/9an21QxLPAn5HlTq41uAUfNPWTufsFryh0WJGAgWA4k1nli6ulLBnEFIXTR1KdkH
         8rEg==
X-Forwarded-Encrypted: i=1; AHgh+RpirTcxP20HAweRhLsKHRqsXshp5R23Nz0wQ2lX/QClYsEscnbqx3wTj1QwiI6UMqBCqK3Hd4ofcEnk7vhM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1HzdIpH8/QmNgfJTu+bPezGejsRzMabhBQbQtmLI9XiqmX13
	OY/rJO5oD3SMwz/WEThZpvdanMpvF60DsL2O9j/a29Fz0VlpgTAnL93YF7c9CCaAA3vE+Z17ohi
	uyBeIhEsfyisip3LFo+Qqi4VW4jC9n2lzVSkYtbdbZh4HCT/RLamIMyEGOfVe4bIFNbOq
X-Gm-Gg: AfdE7cmYcquqK9mvzvFZ2b4s5ufzhD25hoMrJx/hcEb7m6NkumfG3RE6tPUsPhcNsPU
	BamZzJ3fAZm98CgT2L37lM3sDRz+Q3nAZJvYd8fpGT/LEWaQKHrlexulCl5HohRW9Vjb6oo+jC/
	fD3pGtqCgK3d5QlRZ7oC7wd8qXKnliilFEMDY1VH8bKvyL7Kx6hH0TmZBxMOmd/BES1+wMoRFPp
	OIkRdJCKUmaYJ5OyHj68K5H/b0/E21alAaJbumEeOkwrVejRUqJGcoIXcbYO2uZADfWujdIYpiv
	LEUm2KXRzIUbsKh61zIGeY05nU+fbmoAtHkPwfQFAPpPj8b7S8b6zFgLxkDcFSiRmmwksJ4v6/W
	u53ahlo9TBJ6/c16t9rknV6wUri0ZHaZlSwrVq7QVS9bE
X-Received: by 2002:a17:90b:1d02:b0:37f:9ce1:cda9 with SMTP id 98e67ed59e1d1-380527daa2dmr2610351a91.31.1782822520634;
        Tue, 30 Jun 2026 05:28:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1d02:b0:37f:9ce1:cda9 with SMTP id 98e67ed59e1d1-380527daa2dmr2610330a91.31.1782822520175;
        Tue, 30 Jun 2026 05:28:40 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f32869sm1649903a91.11.2026.06.30.05.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:28:39 -0700 (PDT)
Message-ID: <df03a3dc-1f6a-4725-a565-939838d3b1ba@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:58:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VCpNsFNja_rJejRECkdio00w4Duqztjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX0yNFYVBRw3Aa
 dUBn/6OedQuBvc4Zuej5ihWvmDdiLENrSRCXF+VeRlkJqbX6kXfcIL2OutJBHT06oTsgDOFIRkB
 eW8g1/ATLyOWr6YQwRrDBUXEPaC2QVQz31dxHOGx1GwsV78t3mCgM3WSutq4LFELosxk8u2K4Z5
 Q8OCS2h0JOvM5bk5g3wzgkFjQ4OLqWLcIZHHYhaLR5DoZ2JYbrZUe5F5KZq/r5GtbRdDJCh4uOY
 rIqx8FzQXI66+2x2HgBBIMkqK1z1DsjeuTZJ4u1WZs9zlNW81BwAWrHHFxLjww8iB5RCiDIwKuh
 cyAmG7Y1TP400KRFTc4ldkefM10wTe56LP4mrWascM6nToJxSKLr8B2pHbxzCYKF0oOQntVsqjK
 Eaml4ex/+/NV5CtMVXPRITepcyZX6rW0Ma4KUwvdsUpOSwwxsLgr5ok4BDx1xtSl7bswOBxGIUR
 StXvWV0ZeLaNsKuHs/g==
X-Proofpoint-GUID: VCpNsFNja_rJejRECkdio00w4Duqztjz
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43b679 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=vMSz-Zg_tl80unGds0wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX6MYs0iMeNewc
 IfKtoSCpO7RBx+K6IsJptLC7e3IOWs4W0CwW5egng4044atCGd5zxmg26AbWS6eiGJWR7bO4sKD
 MEztIjXBT4AqmSXfBKqeiDDy0gw4JB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115413-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 254A06E42BB



On 6/30/2026 3:36 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Pengyu,
>>>>
>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>
>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>> the controller into GSI mode during initialization.
>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>> some configuration done prior to Linux bootup too.
>>>
>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>> impossible for a normal user like me to generate one with GSI
>>> preferred.
>>>
>> If firmware doesn't program in GSI, you can't have this working in GSI
>> mode, its going to fail (and work with fallback). if it's programmed in
>> GSI, anyway this will run in GSI mode. So why to add extra things
>> without any usage ?
>>
> 
> What I can confirm is that fifo is not disabled on my device, and gsi
> is definitely enabled (under windows, check the register
> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
> works well.
> 
Thanks  ! if GSI is already enabled, then why do you need forced gsi ?
My point here - SW should only decide mode based on register read, not 
enforce by DT flag. As such it's not a SOC exposed, can't be overridden 
by user.
>>>
>>>>>
>>>>> Ideally, this should be decided by the SPI controller based on the
>>>>> requirements. Another option would be to prefer GSI for all transfers if
>>>>> it is available, ignoring the FIFO even if it is not disabled.
>>>>>
>>>> Yes, it should be decided in advance and configured accordingly for GSI
>>>> vs non GSI mode. Because there would be limited set of GSI pipes, which
>>>> will actually make must have GSI mode device run with FIFO mode.
>>>>
>>>> Why don't you decide prior and configure for GSI mode ? We don't need to
>>>> change the current logic of deciding FIFO vs GSI.
>>>>>>
>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>> ---
>>>>>>     drivers/spi/spi-geni-qcom.c | 7 +++++++
>>>>>>     1 file changed, 7 insertions(+)
>>>>>>
>>>>>
>>>>
>>


