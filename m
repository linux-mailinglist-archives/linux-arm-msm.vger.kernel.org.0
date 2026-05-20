Return-Path: <linux-arm-msm+bounces-108705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I4RFAaSDWrTzgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:50:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AFE58BF6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAF5B30177B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A513D9DAA;
	Wed, 20 May 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0Nesiin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XISvoCEH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9ED2690D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274231; cv=none; b=JZ6QUVQnWiL7ALwwhZzjJH9qhfNk/xg9sfOt3NZhBUwyiNXbjErZsBg7Hst+COgjMtOwze1ERgLDWjWnNb0DpGJw0yVk78bcToVH0Y1if3FFUrw+ZKtoKGt3i5O+LmbZ+zWfBqCIYlbVUoaarVznu9rfc4VSZ6YTBSJWaGfk0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274231; c=relaxed/simple;
	bh=IF2euUWVC/6Sux8Dsif8Tp7YWYJUPPwd72iRFP1vIAA=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tfn2YY6ei4gGlmWB2SdJ1nLuUvwfQoO41sRGBXKntQpMDNawSSteutgHTvT1ao2Li9QcOrxVjyLfxHEnfu6wyltTy/RFnrdIux97dXl+YLanpXecq2vU6zvFKD0cUbregnzffkyaE3YvPt4UyuYjdtVNDGA6sGQ5WCOTJ0qFckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0Nesiin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XISvoCEH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7Z6q2629753
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hf6nNzQsjILLIYyZctOdObwlo3Tybufs1YkMWiSXAOM=; b=F0NesiiniX6Ws9Zj
	rY6sbq9e+F3nvNQz2kiAvpoMGtvG0/E+FzmYG0nixeIsszs9nU+cMCDyvgLFjiYJ
	+ZWyHrb2qj2mU1pAZb6XrZDGqSAouAMrmo1pd7PmL/SRasG2XVWY1cAm+Sx2EmJE
	TAv4p7GkktW9kTLIErMkA8nbGLS/pmhWOCGpvgjY8Rd69mZ5+AKzwSktBfYFn/e0
	pQHsUyiskIdpwsMTKpKL3/WfKI0D8lIUxd9LA1H5xn/gsQLgPlrmcvxXaAtiWY3W
	dqiRndFwwzIUXB0ON5tPfNIlgSC7dXhUTFb4XDI5B/2NlX/37YOeScn6dgAkWkRm
	cG8hvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nvdsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:50:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso49093635ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274228; x=1779879028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hf6nNzQsjILLIYyZctOdObwlo3Tybufs1YkMWiSXAOM=;
        b=XISvoCEHwmwPoPpiVJnEmkdizG9wi7npBT18x/qg6JRJ+s0Wv8gCyJ4rCOQtmHmmgw
         3/hbidc9GLpdoYG7MmQ125mr3s/P5829WlAwfW4hNmDXFykkaq80g8qutyPeUfm+8865
         1o3XSOzioZ6gJHjbNinKnlJmgirjhnXd8J0lSjt1Wm7Q6KvWVfSvaqKenwsIrGsiCThz
         W0aJDyoc3Ofa3eGZhbp2XHIFCSomg2VPe2FAm1FZJ97Hg5rjzae3XvttuaqdsKG2jjr2
         tQItrgr7WGRdMxIKDV24+WxTrxtE77/uJbzKeouYX064tMwfZxEe2kKM1VQpG5FTNLTa
         GPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274228; x=1779879028;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf6nNzQsjILLIYyZctOdObwlo3Tybufs1YkMWiSXAOM=;
        b=m7iRFBAnOLCleMmtQYVuIOlm3znu06VhOV0xpc5RR/RCeHwOSZxGt0/Msn27Kpln7A
         c4pMOhI8J7R+gkyUooR+7tjx9683G1lycARYAUShqh8ALrOjQERRkMwP/7WZ55Yf+a37
         UMDAAJgCDa979HEpGvBgi5/H6fjKiyfDicg9OINP/xtr7NybhDudim3L20u6xdDSHDx6
         Yrop5RKAlZDm11F3g3+OuffysDI50ulaIAxlQ2HvEqMCJYUByTkmh0iiRcvwfS37I3DD
         iwKS9HgHaAZ+z7ueRnjNUm4twBSLR9Qc7qltu3mcRh5kkhLXq01LuZSpeny6GRNM/iBi
         kpWg==
X-Forwarded-Encrypted: i=1; AFNElJ8wyuxEr0/vo7XsnH/X8F1o0j5yr9sw61BK3eEaWvSH7SA+zL5sMn1SkZoUfPqm4GsqdeXMk2Q1FCYyxFjL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+cO1EO6mVV6M5ZtU8bmDBYpDC1aFf5ewpAlg8L1LBJRD1m9G
	ZWZ+L4CL9r8YvKuCaYOo1hQcOtEtPKOR2xe4ko/okRouX2OOmBGMost4RvEkNuhEr1k6sketUjM
	TVpRaBsmGZKfJsojqIGNDVmdXD2pRC1nfo0eXPJ1pq5IPU3l8t/c02WeL4qO6q3Px+QdSoviHxQ
	GO
X-Gm-Gg: Acq92OHVNT8epY+EFaZMlHePUHgEFWVKXy33lAgMzA0hZC6vTaCf7KzcWdyIsD6pdgY
	py9aHrnt+gyUPi37VzSQhXu0zGVXoYycyBHlVIHnUHfa8p3E9iRTGozrn1SXlcpl/y+oor+LZxM
	Bus6oLrCDVsw1LKJKTk4brsm9EC1y4NiMqmgnt882JFhs9TX7T97SqM4lF/LARxz0CITFv1w1pQ
	bowdooSA5kYwggQjJEIERibAlxTJJNmbeETxSyUFdaUM4zvXsjz2CF3lpfP9CeNNWmgM29LuFPJ
	+PCL+/Y+Vj9eaR+rLKZCWo+AynayCHsuun17rEFyFBfwCd5vfR9qVlso75/axCzXmiIhmO7GyLS
	mw5pSwgs85Jx3LeP2iX3I+cNCSrtUX7ip97n+gE6Bgorl6ZB54A==
X-Received: by 2002:a17:903:390b:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bd7e93cf74mr259861835ad.41.1779274227890;
        Wed, 20 May 2026 03:50:27 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bd7e93cf74mr259861415ad.41.1779274227322;
        Wed, 20 May 2026 03:50:27 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d116287sm217130835ad.68.2026.05.20.03.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:50:26 -0700 (PDT)
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Eric Biggers <ebiggers@kernel.org>
Cc: adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
 <CAPDyKFrOHqStZbsye9Quk71UGkzUxOkwG9yAGYFVvt+=nMJSyw@mail.gmail.com>
 <20260122011417.GB946159@google.com>
 <CAPDyKFoPVeu3xe7ZAxBTNFfHmf=f7OZ3iUG=pRG8mD=UOGNVPA@mail.gmail.com>
 <3e04735c-ce0c-b2b6-508d-57ec363b8894@oss.qualcomm.com>
Message-ID: <625d16ec-052b-dfb2-61f4-bf0404297f28@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:20:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3e04735c-ce0c-b2b6-508d-57ec363b8894@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNCBTYWx0ZWRfX//IE9cGWbGvb
 egOwFDGap3fnKU7mava1h6W9OQxJq0ndvnTtparEYcma1AlRgsmGE2F/kn8qtIXivLHEBzsMe8C
 rEyx8pQPiTkqc3GVjvqhBV6Pu0Zt6tyrFjCwr4jYqiHjU857WS1JyC/XoOQ2r5Lbo9BBCHelwms
 cRzVovGRSjehBZjTtzey02Fv+VKL7eXWyoXyfalvcMu7G1FKKEP+EYT6S0NoUVEnt+NQQQeZgUT
 PZYEFqcRBKDDofx42wXc/uWjU4SaylGvW01W+K95HAV8JzTmzU5TIjUbj6IKe8W/XfyVj0X5uKE
 uZqtizysV5QzZOgbyAK0q0WQ6pM35KNqzLXXDI+41LKgun2FUnQoK9zk4puT5pWvqOOCKTgA52l
 SsGxbxm00IqMYyDJzmF4vlh8XcZHuvCzBPWrlMINTsCXLPWiaNEGdIzmGeyq8xUEGl9IND8/kZR
 imDaxdkfSYhMkvH84eQ==
X-Proofpoint-GUID: tcRLOOgJhXU770cQ_KFpKEc0ET4KO1at
X-Proofpoint-ORIG-GUID: tcRLOOgJhXU770cQ_KFpKEc0ET4KO1at
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d91f5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xjeqlkpcTcYn5O9o0eIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108705-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6AFE58BF6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Ulf,

Can you please help to clarify? If there is no more modifications expected
then wanted to understand when this patch can be picked for mmc-next.

Regards
Neeraj

On 5/14/2026 11:26 AM, Neeraj Soni wrote:
> 
> 
> On 1/22/2026 3:44 PM, Ulf Hansson wrote:
>> On Thu, 22 Jan 2026 at 02:14, Eric Biggers <ebiggers@kernel.org> wrote:
>>>
>>> On Wed, Jan 21, 2026 at 03:12:43PM +0100, Ulf Hansson wrote:
>>>>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>>>>> index fec4fbf16a5b..a5a90bfc634e 100644
>>>>> --- a/drivers/mmc/core/crypto.c
>>>>> +++ b/drivers/mmc/core/crypto.c
>>>>> @@ -15,7 +15,7 @@
>>>>>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>>>>>  {
>>>>>         /* Reset might clear all keys, so reprogram all the keys. */
>>>>> -       if (host->caps2 & MMC_CAP2_CRYPTO)
>>>>> +       if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>>>>>                 blk_crypto_reprogram_all_keys(&host->crypto_profile);
>>>>
>>>> As far as I understand, calling blk_crypto_reprogram_all_keys() would
>>>> only be needed for those mmc hosts that lose their corresponding ICE
>>>> context during runtime+system suspend, reset and possibly during
>>>> ->probe().
>>>>
>>>> In other words, calling mmc_crypto_set_initial_state() from
>>>> mmc_set_initial_state() looks like it's a mistake, as it has really
>>>> nothing to do with the card's initialization, unless I have understood
>>>> this wrong!?
>>>>
>>>> That said, I would rather make the mtk-sd and sdhci-msm drivers to
>>>> handle this themselves, by explicitly calling
>>>> blk_crypto_reprogram_all_keys() when needed - and drop
>>>> mmc_crypto_set_initial_state() altogether.
>>>>
>>>> For the sdhci-msm case, it seems like the only case we need to care
>>>> about is for the reset.
>>>>
>>>> For mtk-sd I don't know what is needed, but possibly Eric can help out here?
>>>
>>> The comment for mmc_set_initial_state() says "Set initial state after a
>>> power cycle or a hw_reset."  I relied on that when I added the call to
>>> mmc_crypto_set_initial_state() back in 2020.  In the following thread it
>>> was also discussed that the code was intended to reprogram the keys on
>>> reset, not runtime suspend as that shouldn't be needed:
>>> https://lore.kernel.org/linux-mmc/X7gQ9Y44iIgkiM64@sol.localdomain/T/#u
>>
>> The comment in the mmc_set_initial_state() is referring to the card
>> and not the host controller. There have been some similar
>> misunderstandings in the past for other functions in the core, sorry.
>>
>> In any case, I have been trying to understand where the ICE context
>> really belongs and recently Neeraj answered that question [1].
>>
>>>
>>> If that is not what it actually does, it probably would be appropriate
>>> to replace it with something else.
>>
>> I agree, the comment(s) could deserve some clarifications.
> 
> Hello Ulf. Do you expect modifications in the comment for mmc_set_initial_state()?
> I am sorry i did not follow up and assumed that no more changes are expected in
> the patch but i stil see it is not yet reviewed or approved.
>>
>>>
>>> - Eric
>>
>> Kind regards
>> Uffe
>>
>> [1]
>> https://lore.kernel.org/all/e1f689d0-523b-5842-3a6e-10b431d617ce@oss.qualcomm.com/
>>
> 
> Regards,
> Neeraj
> 

