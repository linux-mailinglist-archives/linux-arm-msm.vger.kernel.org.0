Return-Path: <linux-arm-msm+bounces-104462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCeND1Rf62lGLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:17:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE745E4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FC9D3001387
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5793C73EC;
	Fri, 24 Apr 2026 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOjw4hBc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crYLlpWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B33C5DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033035; cv=none; b=A8tDKGkwnrivUHZMGwiIeQC+iDF3nm6zuYcx3gQ3k5HNlGDr3nA5KT4BCP6l/mSCnPcQJCCQiM4GS6IcP7P3U6OgAi6pWZdax480LfgXhVu2zXkMd0Disi67+3ki2pYjRES4g+YdtT7INeq/k+Y6EAmxDfREWKz22/joGZcRnT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033035; c=relaxed/simple;
	bh=pPuoFRQxJfAFFUeV5WPhraCPAwF1U+Vv1E+a3uywyL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGtSbuLJen0L1ZWVnoRebeUmJD4Tl8STe3FBFQ1Vzlxc7aPy5n4ugYUL68YaiAmNusZYLKtCJiwyEP8pXxNzCxJ8yUGnbGmFTjweES2cEuEQQHDVWTnYYFKcbkWPsoJsMgggeYkcF/B6NSNIbjoIE4IyXibP1AIYpe0WW7SQqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOjw4hBc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crYLlpWb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7GOBP1823040
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzWcgJ/Dtl8c/5T8awq70D37ra01xcQo1QTV/P6feBk=; b=UOjw4hBcPoQ6FuiV
	PNOfrnC+gUlQe/TO9OlDKMNpqaKtlvwbdazOBbPqS6AXQhS7D/S8ca4dSV515zJ3
	TYEBOI7cdm4Q4LcC5SXoM6OL/XBtMVu+OZjgW0X2hvxWkCgrUUMzJLEPtuTzz5ph
	zAdZTau9MeITlbH4h2t4HyY4a2OdHQHGHbrsTGmMprFYcLOuyte4NEGv63X2phr7
	awCROwPDJln4aJ6jeQgQWSOO3jqX2zxQsLK3NPl86rvqqg+Ra/FqVJ+K+EHnMcIC
	iBANg3KahC8MLXKACxEKjvHpisOZbW1mS2Jg1RCdv6bYN05Bsul6ndBH/P6fBKu4
	05dBBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rtyqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:17:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b02ea0c595so15179956d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033030; x=1777637830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzWcgJ/Dtl8c/5T8awq70D37ra01xcQo1QTV/P6feBk=;
        b=crYLlpWbjZWTiT99w92oHWBLByonn9NrMXOcgu3Zsm7N+ljk9O7v7OBKWTSUM31yLc
         KFam9qw/AzCmIwWzvnLDDW6TyC6T3Ob++ZYIzelPh760zQRARaw5aEWf+5RTljQSKByD
         gMZtVT+Q836f2gB4zV1QhWPHh1ojphq2pOdSD0akVBs+9pn+7sWPD0jh47DIQcL1FoHZ
         3ZgN6uEfwi9hiiL8TxdIi/1ZSH1ng/IDWBZYgFz+MKHl1Z6Z5Jpamtcd/sErHbzJYcNf
         992Xclh0zeYfDWZm8+fAPMvs5/YszXzej/KbyA41uC3Vx3u6x2HBaphstHMNF70lSCVs
         aKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033030; x=1777637830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzWcgJ/Dtl8c/5T8awq70D37ra01xcQo1QTV/P6feBk=;
        b=OAht7in4cCptfdpYNDP5Q2MySiVD9ipshSMsd0HKnkUClvYAJWr8Ctak6OOrferU+j
         iATCTpXTsnrIQdnXeAkBkHPLD0RpumbrbD/Xv6VZQI7LcP+OVTcuYAZwNdQ0vQqVQwhE
         V/d1HHPWyfalkX6TdVBVIggyJDlT4WLEo8zIqhSEIZXjuPn+b/s/oBWZXvr8vTgNIHUZ
         XpKRn+qsWYp5inx9Xw5l5LTUmjMe3m1BDx6CNO+PbKMiobUPxliNcUoaFvCD1GmG8LK4
         Mh7mnuDFe0NpEucFpaeLwCsvhsoDdkvFLmWigzfoxz3bxPsQ6lAhwS8DX/uknLtWlcfS
         EUig==
X-Forwarded-Encrypted: i=1; AFNElJ8u14yI6TN9S+6m3CxRlJiPXAowE7Uqj82huIK0m4mKt4sqqu9U145TWPtuCw5Zc2iwaT+8xAUYUrXKxtac@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ihpsbfxMbL5ZuOxZt5jQFo2AWOr23pU57KfcmIumGPBa4On8
	XfX4TGEoWkO3BFIBOFHO12rx44p9NAOq37tge80gm/M2lgHzUgB4P/A4SjppREsoF+E6g64c1as
	OzhJR4Y7cygFJDjHGZ3N6bhbCWpnoreIQfmJpQ1UtIzVMNoxJJLrf2YpPrHBrpAS9lxwJ
X-Gm-Gg: AeBDietCHN3k2TyJC2BSRbSjTiaQ2bVRNaTCkvDZVm5W1PtAIFVGcZyGBTZpWe7zss3
	7tZwPt+Ro8Yt620ye9znQdEZrbr13mhZxezMFTErf1OX1d/POT34tsf4nvy2/aDrLeofXgVGBSJ
	sMUsMq76+gbgP6kH7qIErzEVTOq4P3xPy8lWZxS0piQame6C3LW8comqbgUCxrm7FSeGKFWl4p0
	xe2lQc8mQQ8gh77gbYGQ40dvBVK0PirJ24iZib7dmQkUEV4w+df1/m0O0+VRfV7PjaIJGah/LNK
	V/0e9JJltO59uMl4Y+TfeySeea0S8TI8WRW+/7hqqjVr+d9xLviIm65pemk23t7mGqVFdmiv86R
	zh0l/N+VHYBvoaoBKz6sjqt9SzcqsfG5DZ3H4jgmSlb1vuIOfL55eigBnP/GV18SAgp7m/SzZYY
	AgqegnUsNLAakFzA==
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr340871536d6.6.1777033029598;
        Fri, 24 Apr 2026 05:17:09 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr340871116d6.6.1777033029158;
        Fri, 24 Apr 2026 05:17:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b694sm784657366b.29.2026.04.24.05.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:17:08 -0700 (PDT)
Message-ID: <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
 <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
 <27098742.6Emhk5qWAg@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <27098742.6Emhk5qWAg@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb5f46 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-XRhzjy3v26zEYFifkcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: J38zzYc-ZXBSi6NorAa6AbzpUT0LkuEr
X-Proofpoint-GUID: J38zzYc-ZXBSi6NorAa6AbzpUT0LkuEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX4WcuYIxzmriE
 pqjo7ZeFS00kGH7DBhGYJwNX/HoAfiihLOGV5tFnEOTv3PQ2T5iQO+xgf63/7qYv8y+skHX9Mbw
 sKHwig+VMwhRLqPdqDf45uwbqIZr0Lj2lQfaNU9IA599c4EvhZQ9UBU/PD8p7DyH/9BKGsUFUSB
 hfwox8mMjGk88Ppurzb957t/DhO7C52z59+FT0cOpAklrWylLuh5lkWH+BVn10frzW6QiHM4ktl
 HqrsxbXdjQyrsk5VICuPyNu3khocXnpye97KMXjxWjhp5qez4LzgUMvQ3t5Xf1JYQfGE4Lk36yJ
 ALpWA7NUuChiEIXmDK+nQlUkKC7MG2T3CbuUO1dBzUxKkc9ad7d0FP/lAz6vplmrVFIHEw8AU0i
 dNkoAPu2nd+KRdrzqUL0gKv/xATV9W9H0z7iN07ryO5EltKFIUrOMMHIQO55rzC19CpP0bt4+Ug
 rAFHQqS3imYG2TGkweQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240117
X-Rspamd-Queue-Id: 31AE745E4AD
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104462-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 1/15/26 6:27 AM, Alex G. wrote:
> On Wednesday, January 14, 2026 4:26:36 AM CST Konrad Dybcio wrote:
>> On 1/14/26 4:54 AM, Alex G. wrote:
>>> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
>>>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
>>>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
>>>>> driver. This firmware is usually used to run ath11k firmware and enable
>>>>> wifi with chips such as QCN5024.
>>>>>
>>>>> When submitting v1, I learned that the firmware can also be loaded by
>>>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
>>>>> makes sense to have the option of a native init sequence, as not all
>>>>> devices come with the latest TZ firmware.
>>>>>
>>>>> Qualcomm tries to assure us that the TZ firmware will always do the
>>>>> right thing (TM), but I am not fully convinced
>>>>
>>>> Why else do you think it's there in the firmware? :(
>>>
>>> A more relevant question is, why do some contributors sincerely believe
>>> that the TZ initialization of Q6 firmware is not a good idea for their
>>> use case?
>>>
>>> To answer your question, I think the TZ initialization is an afterthought
>>> of the SoC design. I think it was only after ther the design stage that
>>> it was brought up that a remoteproc on AHB has out-of-band access to
>>> system memory, which poses security concerns to some customers. I think
>>> authentication was implemented in TZ to address that. I also think that
>>> in order to prevent clock glitching from bypassing such verification,
>>> they had to move the initialization sequence in TZ as well.
>>
>> I wouldn't exactly call it an afterthought.. Image authentication (as in,
>> verifying the signature of the ELF) has always been part of TZ, because
>> doing so in a user-modifiable context would be absolutely nonsensical
>>
>> qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
>> has been there for a really long time too (at least since the 2012 SoCs
>> like MSM8974) and I would guesstimate it's been there for a reason - not
>> all clocks can or should be accessible from the OS (from a SW standpoint
>> it would be convenient to have a separate SECURE_CC block where all the
>> clocks we shouldn't care about are moved, but the HW design makes more
>> sense as-is, for the most part), plus there is additional access control
>> hardware on the platform that must be configured from a secure context
>> (by design) which I assume could be part of this sequence, based on
>> the specifics of a given SoC
> 
> What was the original use case for the Q6 remoteproc? I see today's use case 
> is as a conduit for ath11k firmware to control PCIe devices. Was that always 
> the case? I imagine a more modern design would treat the remoteproc as 
> untrusted by putting it under a bridge or IOMMU with more strict memory access 
> control, so that firmware couldn't access OS memory.

There is an SMMU on this SoC.

I don't know the original backstory, but if anything, the through-Q6
approach is probably *more* secure, since there's additional access
control hardware inbetween

Konrad

