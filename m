Return-Path: <linux-arm-msm+bounces-115695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WqirCQD+RGqq4goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:46:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D926ECF32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:46:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OiLBWZFT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OpNTcFVb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C112F3016019
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBB548094F;
	Wed,  1 Jul 2026 11:45:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E4480967
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906322; cv=none; b=swFNWJ/HMLRVE65tWxaOxmDTcHQPWq3TLderoSsGwh311hgaGwTRJVF/qyq2yV0FjwknCxVtoZ9MOomRjVHV9w4H+kdqvxchz+ESU0lpqCzZIY2aggLepsU+vsG+CdnHbVREaDmy+l0T0fonxcthjEujApTC5KKIRCNFEYLk0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906322; c=relaxed/simple;
	bh=SQSUko4GI9pCE+p2f+KLI+dpEc5vU+iudSehiK/dI1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLZQjWnHLTYk47GXXn0HMFQyeREVfgvZ0p6rSHbkEVqQI7yy6wmLYuzjmEDRx6Opb0VnyutGiGBX5AL86ivGJHUgt5VfYTp+Ay4YumffUrkUMmgizwyXj4yycxzHxfEG90Rb/lB6A7fHCq1vlQr4EJp3WBjjROYR9ILhA3XZEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiLBWZFT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpNTcFVb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UV6643984
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijykd+gMiu7hdyIzaCH2W3+H+cWrNMIuL/ruF75GJNs=; b=OiLBWZFTj3qfHrPf
	Fyf79lVgXB7hnvLvxok54wWh+KxNvnXrZfX5O2GOtXzC9wRMe8dO+asrjkoXs8gG
	QA6ADFbEMoA3uhCfjWAtR2AY6EsRPhN/xtF7F/gDijePoa0lQPK2XERg1+doR2lN
	dUSpo8YI4yxWcbGAD+cLNqXzHh+xhxramZNx6Aq0zBXKFSBiPeSy9ZIZGCoMvpBo
	lJVDBeXTFQ98Gt2+k7VWo8fQvEp8fOdQKSyoEtku0Z7G7s0pS8+a1PMmxwCt8b0A
	gy0kJcJrwUfCANMszqnDxlo3xmClrCe5haA2riv7Hve0rXIj8vQMszyyp1TsCJxV
	1D2oYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4mbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:45:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf9df2eabso707141cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782906320; x=1783511120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijykd+gMiu7hdyIzaCH2W3+H+cWrNMIuL/ruF75GJNs=;
        b=OpNTcFVb2Z8ZHLnVVdWrgOJFgfiC659+PZGlUDnqj1lUkv6+FH+dMCA7gBg2tf7Qil
         Hjm+85bMKiiet+dFj3Za19WUVc6iY7JC5/DBmP3ej4nop6E49ilmYjupFI5kJ4XXKA8U
         Pg2s3uvNJIFAD+g+VCWLW3jGv9qvMPY0yjoiTm6MPGF0pTM4w/3vYOVeaVaZ55N+qhV/
         rM0pUVjEZ+J4rUnReUCPnAyDOAYjYf6xgNPeyMwOD65Z03htPNiyTLxiLFpQsuNhPCus
         5B+yxpOPPdlP08h4QSYKzhLqLzHDFuGvdSGd9Uqs0bIdOSGu+bzQaM9GeAW6AJPOfRxv
         pLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906320; x=1783511120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijykd+gMiu7hdyIzaCH2W3+H+cWrNMIuL/ruF75GJNs=;
        b=kl6BdZjz+pR4lhH/u6AgJijtQhSd79CkIH192gDhDp//WstW92476ih8B5nDDkhSNh
         y5yU8m1r6SMDwCifOuCqyG/2wtdibhIdqTm8lBt9cRm3q36G174qvaE+KrCRKhVizbF+
         0eLWvomuTJ0ZC51NtZsIIrBV8nK2k5LeWaOz3Q4JEDrRYSr46h2AYlJLyOSf2ehs0eq0
         2uGJXcjz6DeU8pMbiRwN/Tsq1fM4FcYAthZpViT0bJ642VAxMMvlImVGnJ4HgVfab403
         //wM7+/86p+WGiZFZzpSY0ZbkYengsz8vYoDlAcRreLA651guePc7qBjJ+qY7+XK9Y/p
         abdw==
X-Forwarded-Encrypted: i=1; AFNElJ+DcKQYnXykJnkxHY1Y/Kpd7pAflTxGPtBgOZ5ErqsnxAPZd3yn3cKHMHFOBQgE8Z8IE2qvbLBty8kzIjMs@vger.kernel.org
X-Gm-Message-State: AOJu0YxycvIwiMfOrF7eltr7805B3U16AVoVNIjRvQIsw3kyMMcYE9fu
	ZAYvgckT6h9AudYLmFfw2YFZedMWuMxjd4WT5rYtvKPiZ/xmTzgMiRnNP2uSkrvpuPM8iSczlNj
	mzgYuUng6cRSaWI3V8Gx8zadyp/UKnrnGWj4/1MRpxuUppE+Sfm8CuVFr1wZ09Yiz60Vq
X-Gm-Gg: AfdE7cnC8y8qpL0WqpA5LbQJCZDViZpHm2njurmIY+o92/7dYk8MXOQgw2Jrq84CRiQ
	9BWEweJIAQGVZVvTt4sR4Oe/lNFhLZiciLJTMSttO+Iek3rW76cRKR3vkjYjLkoO0ffTyXpDavY
	huIL2dBUSGNzAgXDXLJiijI/clmbXzY/WnHkL1T2fO94a47PIrNTumtUljgBtkJj8/kfP6Wqvlw
	g1tjWKUK85jwj4LbedHCeaQaKjTF1ipl+GpinCnmbkwULLjwyftqy+EAcYUz6wfCcKlblorzzgH
	3wwn+0tgjKpxFAhpoqzBTQLD3Wnbz3on3vDV89/lbKW3CnO3JDa5hGYbwCcV1ctJXIouR+IB9ca
	4sPULD6EyANs7GdJHM1UM+bLkdfhhEo0+6Z4=
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8382391cf.9.1782906319698;
        Wed, 01 Jul 2026 04:45:19 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8382091cf.9.1782906318977;
        Wed, 01 Jul 2026 04:45:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c967a60sm2607666a12.26.2026.07.01.04.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:45:17 -0700 (PDT)
Message-ID: <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:45:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
 <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
 <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
 <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyNCBTYWx0ZWRfX5RTd+6W1hIRR
 gHB1/plqmSmgn7VTWOYq0aGZ6h2nbG/KQo+MINTTGzp8QRFYasR9yQeX6Axb3A9kqO2tqKYx/KC
 aiLIy2fQwiq30wnqh1QBQS1gudjFpcU=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44fdd0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mzDM7A3Z3UpNTzwAeNcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: N33m0whSC79WyeYvK-PaMiwtyddA78Ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyNCBTYWx0ZWRfX5loyYY8eE9iV
 PwnM5HgLuY1XPeZLbTs2fQcuQOv24qhu57K0t2O7pSKU8mqeCkhnQ1QfoiwwJhXHjgfBmXV3Cil
 +sbAY3ysgZxu2ikDP3HvmUKgANhN4kLw0oHL0LiUdOpcLG566wBX+UU3ZTVobu3bB6JFpNxHP0Z
 NNCby73qhdDpxF5UFxVYJzNUdJtfRfWQHw4ruQ0gYbooddEc3OiTazadWo/cLn1G64ejm0yowBG
 m/zgOfaByruCCTkSX9KiJ4GkvUBV/5HaJVTTrSMR2xryQEmMj7KE83AgXkS8IWQUdmAPP2B+gEB
 x0U13Wt9cHO37anMg6783l6ORBaB8gG1ufbPubsR8qnVVhYnap+vq3XOHPPgAqezbNIjkywFXXk
 zzleyE5zntHoaNDo0uLMhZxsQIBxbA8by/klDVR44PcavrlMrXBRFqRz5ykh2wiMJ1Wjm32doka
 gwTUzTz1SYyLDolffRw==
X-Proofpoint-GUID: N33m0whSC79WyeYvK-PaMiwtyddA78Ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82D926ECF32

On 6/30/26 12:41 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 6:34 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/30/26 12:30 PM, Pengyu Luo wrote:
>>> On Tue, Jun 30, 2026 at 6:29 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
>>>>> On Tue, Jun 30, 2026 at 5:18 PM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
>>>>>>> DSI panel driver have been added for a while, so add the DT node to
>>>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
>>>>>>> describes the wrong, no impact after manual disabling these wrong
>>>>>>> supplies.
>>>>>>>
>>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +&mdss0_dsi0 {
>>>>>>> +     /* real vdda is unknown */
>>>>>>> +
>>>>>>
>>>>>> L3B: DSI core 1.2 V (both?)
>>>>>> L6B: DSI0/1 PLL and core 0.9 V
>>>>>>
>>>>>
>>>>> Yes, that is what I saw in the DSDT, however, I can disable them
>>>>> safely (hack the regulator driver to add a sysfs to handle these
>>>>> regulators), the panel works well.
>>>>
>>>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
>>>> ends up being on), UFSPHY and USB1_PHY
>>>>
>>>> L6B additionally powers the same components, minus refgen and USB
>>>>
>>>
>>> No, I confirmed they are totally disabled, since there is a way to check it now.
>>> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com/
>>
>> This presents you with the status of the votes casted by HLOS, not
>> the actual hardware state
>>
> 
> If so, non-HLOS will vote on some critical regulators to keep them on,
> IIRC, once I disabled L9D, system reseted immediately.

NHLOS will generally ensure that the hardware that it needs is
powered. This does not extend to hardware that *you* may want to
access in Linux (or which was left online by UEFI), which I suspect
was the case here

>> To get the latter, you'd have to dump the SPMI registers
>>
> I will appreciate it if you provide more information.

Take a look at drivers/regulator/qcom_spmi-regulator.c, you can get
the actual live value of the enable register and the voltage selector
for each regulator

Konrad

