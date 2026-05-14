Return-Path: <linux-arm-msm+bounces-107526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG4cOx5kBWqOVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:56:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC553E23E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65D153025711
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B3F3A4510;
	Thu, 14 May 2026 05:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxKOqD62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYM2BXFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1344308F03
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738200; cv=none; b=Vm0tSeZqjATm81LiiaovsQ6iAv5M5Rn0GefJSWxjHmbC/qRdqUzGBX/WGvN895G8rNsTEEU1iYO4xh+isUcsJ8xkRG6VBVXmpIf8Azr8guaFd9AmNiEqBP05SGaU50rF7RR4lwXGLsFZdNENfQ0DfLntU4ouALAMKCdSOZmAlk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738200; c=relaxed/simple;
	bh=OyvyYG8eVOpfkcYx13oFyb0wTKeRoDELWFxoA5xkHBk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uhQIXURXhlYEStmWAGCUb3Cv4PpuN+7j759/XGVwmS8wjS7/InERVo1hkbNw6cTho7WWPc3bPfMD83u6ZbUg5YUjwuJKIvrvCKdJjWpM+VuzbFi7QR2XefpNaYcYJB5fHKAYBoWXsp4eh1VUO86kB3Ho0KcsjI9JbhEQupNWeLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxKOqD62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYM2BXFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E56qrL828505
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbu8y1N4/izX+twY4zjfchArelElHS5wVuKE8gdKOzk=; b=BxKOqD62fH2UpzLZ
	+SW7mdu3h6DlZQ5yMmHIPs5lYo1LFg2QtEhtOXVe3A93XFOiVZ/+Gw3p0mtbUiJo
	cdaz8AAjll4irHuWamsG/PlI51X82p7sAhWyq4AAjG4xQMrsA4HjNDAEdAjwMhhz
	GqnHOVf3FFjcRKKPo7aIgyWCSZ1qSyMpnHOXMUkX0TVnZxEsp+JAfx9Tg8yPgmTF
	PJl/e8MSNwExNOUiFpJzc9jiON9LFL3um/gn7/Sd4o/8ILsPfc6HQEGnkMtYV257
	vOLcUXKQvggZEucAf3FNwv6uh+FAjlrQoibMVMvgElyAHzZk8XfdHBtLnLHdiYW9
	MA1Gsg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7g4md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:56:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so4638050a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 22:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778738196; x=1779342996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbu8y1N4/izX+twY4zjfchArelElHS5wVuKE8gdKOzk=;
        b=ZYM2BXFGgeiJj0OkswSl36kNDb1TePnChtX+EHpyRV7zsMs3+vFQifzxNiyN87VQUK
         L0UGMsbGJOtl6ItkFQf4/AeJRS38I7EtCBVnqY87P7YsmZ7S/UH8to/Ndz0PTlwMdfRX
         bFt2W5lu19OdQLTCBBVdhrj8KnQJ1niH80R+Mt7DOnuwdJcO9SYSpqf6bvRA2PhXQaUO
         Q7aIfyZQGidVRLwywv9x9VX+BVS3jQG4/EQIDukKrWEfRhlnE7NLes23LSImbodYVR7b
         MY516U8iKx1xFdBqfI6Nv2nFrb1npVLQgukYIHoQ2Fr23kPfLi0rQPeUZBPpyQ2j9GU0
         G7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738196; x=1779342996;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbu8y1N4/izX+twY4zjfchArelElHS5wVuKE8gdKOzk=;
        b=C13vxzYHAz7oItxsa4u110dKoI/MTEZQUZnRMip8ERCk8NVMPXVKUuoeuyTEl4wJKP
         Z7Er/HTAnYmn3EGNe26Mkeurd1dMlW3zPW3ZpGIxkq7oiX4WEbEV3rMv4jTRnxi3kZao
         jrgolU/EVi6x3ym8ju8FnHGxk6/0TiyiykNkVB9ZmVsCLQhhUF+XNY50QtIQgt8Ufghi
         49Ca2A5/2eLsLqAylUA7JXm0i9saq71/YLBNfGqlhZXge45Fob0sxbhqEqqADjVlmFoe
         gQI/+gknFjCqpN/y9r0PZvQdrmoLR0DeUdfnu7gBQrR/IfzUC3hOr15K06rdIrlX63TF
         GAog==
X-Forwarded-Encrypted: i=1; AFNElJ8S3gB+fHoiUOjudA8vbxx7g7SMdyq5cNOz5SAwh2/w9PPnG4YfjpRD+P7Y8+CUlmhw/YKdTUyz/n25tFoo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuf+qDA9FXxhnGM+Fgm1UOVGrE4VkNwhA5xMhhFs9JBFRDup2J
	+oEyYBCfoui2G+iu2WW4Lyad16VY9qotGOak63bgp2cVDLPFcOzQUL0CCZu5N8ZTd4uvGy02sie
	BrqXLDXvJvB2a5QPOex1CohVZNpXFYaPhqwetmVZL8TFpfaCnWdjHl3BFgnoVgtAIGq9sTWRLEg
	Uv
X-Gm-Gg: Acq92OGms6+Fqv1E+FtJqvXga9+9cH2junAY1CBUGYqbDDPZ8EXew5uBZ+OSGJE9IY+
	18Du4j1UEYfzpLLZJfMKFOO4KUi4hVTND8+bRBhzCnm177PMe2oHJ0zHA/ragXWMTogny1I3vAh
	YUzXZmXyA5qz4sezOmGWvXxIVIleQp0FVDYKoUMCSAfIZu+d2WNuBih5xD4pjXQbCUiNGF2XxCa
	hueiSwQSWkakZXj+a6PjGVdIqffqQMzH13TQ3WYqV0RcJsNKOt3H3O/L2jvYz+5isoxiXRdzww/
	FQJuJSuNx4CoxO/Defa+m4Vo9/DMzm5xIH99DYLTkXXm60Bk/72dtkX1saqQ/eZ9b9rjYZ7PqLP
	l7GwwzILxKcG4FOEmrrcD25NhDSnG6UumcxeeUDb3ctLaBeJNdw==
X-Received: by 2002:a05:6a20:1589:b0:39b:fad0:6edc with SMTP id adf61e73a8af0-3afaea339e1mr7391336637.6.1778738196236;
        Wed, 13 May 2026 22:56:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:1589:b0:39b:fad0:6edc with SMTP id adf61e73a8af0-3afaea339e1mr7391288637.6.1778738195657;
        Wed, 13 May 2026 22:56:35 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062a2bsm1288045a12.7.2026.05.13.22.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 22:56:35 -0700 (PDT)
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
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
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <3e04735c-ce0c-b2b6-508d-57ec363b8894@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:26:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoPVeu3xe7ZAxBTNFfHmf=f7OZ3iUG=pRG8mD=UOGNVPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d4s6rI_UJxOf8BZs51WrPAB369HNB7nf
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a056415 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4q3zvkj2iR-HDjvw7cgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: d4s6rI_UJxOf8BZs51WrPAB369HNB7nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA1NiBTYWx0ZWRfX8DdI6h1RmjJ/
 GK95dTozFF3PTHopoSzHuvScwHDO1lF3IDaXB57J2grIpih6knDpEJBckoD24BrnjQdCUqQGqk3
 3pTGvXp+SoiYP31ttnhs94uF8FRtCpCIy55wlFfb/x41835LrnsH5yOxzBj6lqsej4dr9cHiqaT
 b2R0ucgQwy2RecGwKas++9emzqQghLJ0u5YjJMC0VGbKH6lWghL7wSInSyFZQq+vuZpBgQIj36P
 yd7l6uIrRx8bNpq1v+vegF7rgJBXh+Ys2oUk2Uwn4Qeuy8r3LrBkk9UnkE6xIcxmMX6b3SqMsEZ
 gXY2ZRE5Y3s6OUkvtft3Ugh63DJOiQAygxGqUpqqVbHCtZbYIbU/gau/8QrO6l7MtAAebHbggUr
 6b6Wzc3hTQIpl1kY3gopzSluYA2cVt3RgYxtTl+TmCGd1Ct3BPgI1N6A4uLHG338IpuZeNPt5xJ
 LY8Ae4BQY7nztOLTwlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140056
X-Rspamd-Queue-Id: 94DC553E23E
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-107526-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Action: no action



On 1/22/2026 3:44 PM, Ulf Hansson wrote:
> On Thu, 22 Jan 2026 at 02:14, Eric Biggers <ebiggers@kernel.org> wrote:
>>
>> On Wed, Jan 21, 2026 at 03:12:43PM +0100, Ulf Hansson wrote:
>>>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>>>> index fec4fbf16a5b..a5a90bfc634e 100644
>>>> --- a/drivers/mmc/core/crypto.c
>>>> +++ b/drivers/mmc/core/crypto.c
>>>> @@ -15,7 +15,7 @@
>>>>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>>>>  {
>>>>         /* Reset might clear all keys, so reprogram all the keys. */
>>>> -       if (host->caps2 & MMC_CAP2_CRYPTO)
>>>> +       if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>>>>                 blk_crypto_reprogram_all_keys(&host->crypto_profile);
>>>
>>> As far as I understand, calling blk_crypto_reprogram_all_keys() would
>>> only be needed for those mmc hosts that lose their corresponding ICE
>>> context during runtime+system suspend, reset and possibly during
>>> ->probe().
>>>
>>> In other words, calling mmc_crypto_set_initial_state() from
>>> mmc_set_initial_state() looks like it's a mistake, as it has really
>>> nothing to do with the card's initialization, unless I have understood
>>> this wrong!?
>>>
>>> That said, I would rather make the mtk-sd and sdhci-msm drivers to
>>> handle this themselves, by explicitly calling
>>> blk_crypto_reprogram_all_keys() when needed - and drop
>>> mmc_crypto_set_initial_state() altogether.
>>>
>>> For the sdhci-msm case, it seems like the only case we need to care
>>> about is for the reset.
>>>
>>> For mtk-sd I don't know what is needed, but possibly Eric can help out here?
>>
>> The comment for mmc_set_initial_state() says "Set initial state after a
>> power cycle or a hw_reset."  I relied on that when I added the call to
>> mmc_crypto_set_initial_state() back in 2020.  In the following thread it
>> was also discussed that the code was intended to reprogram the keys on
>> reset, not runtime suspend as that shouldn't be needed:
>> https://lore.kernel.org/linux-mmc/X7gQ9Y44iIgkiM64@sol.localdomain/T/#u
> 
> The comment in the mmc_set_initial_state() is referring to the card
> and not the host controller. There have been some similar
> misunderstandings in the past for other functions in the core, sorry.
> 
> In any case, I have been trying to understand where the ICE context
> really belongs and recently Neeraj answered that question [1].
> 
>>
>> If that is not what it actually does, it probably would be appropriate
>> to replace it with something else.
> 
> I agree, the comment(s) could deserve some clarifications.

Hello Ulf. Do you expect modifications in the comment for mmc_set_initial_state()?
I am sorry i did not follow up and assumed that no more changes are expected in
the patch but i stil see it is not yet reviewed or approved.
> 
>>
>> - Eric
> 
> Kind regards
> Uffe
> 
> [1]
> https://lore.kernel.org/all/e1f689d0-523b-5842-3a6e-10b431d617ce@oss.qualcomm.com/
> 

Regards,
Neeraj

