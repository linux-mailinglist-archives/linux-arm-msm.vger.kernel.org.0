Return-Path: <linux-arm-msm+bounces-109398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOWWG0msEGrKcAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:19:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE85B95D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45E513015863
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C234C37DAA8;
	Fri, 22 May 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OclHh4hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QW1sLW91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB3637BE80
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477560; cv=none; b=q5cU5UTuHBo06tr2F0X8baV+ZOW3+xfvZOGBl3RsxZ6IuvbbjiCL4v8d7dSZbIQtPdWDWQNGfEX01gXSj3UdzutCDXFAlRUedK5Zb3gT87K/Fl38m7PEbLqAQUuj6CcJaBkWnhAC55JYQ3UlsmMb0PVuN9jmXN2ZPFyMlD3vnwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477560; c=relaxed/simple;
	bh=+ZAe4tlkZzKHX7X5t4615D1xJnFK4/IiGNoeCQbEOV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAL41p1OwfEQ1aZ7vvGUxOHgwGV9JcmLIMWW+MdrWM0zYR1XjlTbDG33cAFO5h+4bnFTD8KjRQ1CrmAxIde2O/Go+PT0TqOATbUKY/ehCNMZW763QBQHDG4B69UF460lssuKdpht1tT3qQDPyXhCGvnn3ygc8VVShsmD11WFJQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OclHh4hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QW1sLW91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBofIR778821
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3O3CwZM57IGqkScx7N1v3lEW3tORhTFbt3uo4B8zhv8=; b=OclHh4hLa8vNZEM3
	pQ9Ut99azhlVHeNmeXNU+nWxBQMau0YTx4PjZ9NedKXexMDFAln7nyabkNSw8yTu
	EJHyGAeCmkbkfN29E+65+m949EWXFM64nSo1/AbwommO14gALlWkWFkuKAXjvZ1Y
	NU4mm9tW3aB+Xi9bVFNxDCc0CeeRR6NXqZOF0YWvQEx04Bfiw0fOJ0QKCdHKTWtf
	FqFAuTMqwl6RVRWSLHMCOOiPWPSNq5oQrC1IhdSas58wmKTlu6/uoi3wQCdsHpqT
	dLO8ypeXDsYvHKzjrf5dneicpeBxci8I/PurUOZFY7PC60Y6ImTKNEww9DpuBZ74
	8a7y4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7av9k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:19:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so7282124a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779477553; x=1780082353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O3CwZM57IGqkScx7N1v3lEW3tORhTFbt3uo4B8zhv8=;
        b=QW1sLW91BYOjBhieYv8uvLkKLufV5uZfV2mfjTVwPAvBHxMsVRQuwqvFQykuBuWZJS
         Tcelu1Dpb5AmamkkQ0LByd5u2bQ9A/xz2gBbayXwhPHcJ4SELyCWhLbFdMpCXC20zAAt
         mNX3GzvxlWoQg57rMXgyFdNC79Hr8dVVvyOb3fwDIY9V9qVQeZ/m/kS+72b2BYPN+nWy
         FWiLST5OchJuQdV61MAdKV7DoZ6eG1VEeRkKv7KlA00LG75Li84DjdddGf1XdUP2+nsn
         AE3ywTi3Fw6YiHA8OQJPEcSAkSRppjeqBJKTWZYnAqV+NVH3WXjIPxRJ9YoF8561ywDU
         Ff7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477553; x=1780082353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O3CwZM57IGqkScx7N1v3lEW3tORhTFbt3uo4B8zhv8=;
        b=E76kKzTA57H4cTxrBDoadsNh51Bmn6bog5Dyt//tACug+5lwKy6XX4rQxGuJ+DOWX3
         MVWDwG2/IpyAVGnxjypkVFws66jiJ2UTGITE5wv5yZZqKuDrB2f9/V3aqk6YfFgFSjnt
         KFuHy8D2OR5F0R/JnGx0IlqfA+t8nhyp/NauFa6dNauBQ1TwyPkrHvgkHQuubEZ6ETbp
         sO0hzFOzBXJ2e6mpHEJLJ0Tyioe1vYje058eDbXVTmDpjafwYP2j3WiBNB3PgQooGSeh
         uJ243BQHYD7AdRoImV2+rAflv9GXAJVFsCT2prj0AO3CULCbpbYXh8Ou9RHRkZVwBwMK
         gsnw==
X-Forwarded-Encrypted: i=1; AFNElJ/l13gNYZ8sYgtuX3ezphZZx6oEmV67KOpSugNCZU/cKU/PrTpMtUsfzM84EuHX7e6L9bfqrsxeqEqDbGmK@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBwVeZlLWskb4XKHNfoy16UVWn+v98eLqspY7AefdJSh18kZ1
	Qo7Ljol8EmJ0qpEeZsYBxZVSOZW8mZCz9ZCnnsBHWk/XbgK7YpY7usjgg5NG7M3nzeL2cTwdy01
	8xfB3wuWlZHL80KOkkIRWWPtJi/7YOEIF3GhGKBn664Htg8PC94C95tVijeY29SK7iuRk
X-Gm-Gg: Acq92OG0rfgLi2EbLtVssLyJ4Tj4j8dhOMHfu/LzHQbYD0G3rhrQEGGB6yXxA6LIgjQ
	NS7hyb+5C32mbXaTv59kRNXBXSUt2SRaaoirRfMseVKC5klysCgXJPdumL4cp4GgeqytYPegoSY
	Bmyz8sArm1w/pfEm+oeyrRVoxhpj3+mwjF+vItPn/elW1dkrNhPV1OOrt6KtKV7+bAwqqud1I60
	NtzMDSK9QN3KbPL8FLccoPY8CaPRPdD1sdJgok3RLeHCy+Fful7IKKOEPIQJpKbEWHS1cJfYYqp
	Aos+yjw/tbv08H5ONU0ruPsu76C9n7Hd8ekcB19diSoZnnrgBrXSYgwhE1R0wAEZIJWmCodnQvN
	2NgkiS3JWZmLvDpGXLs0urG8xZmjIbbkBGQ/ipb7NfVuUSKwDZQ==
X-Received: by 2002:a17:90b:4c50:b0:369:bddb:79bd with SMTP id 98e67ed59e1d1-36a676c6a95mr4836867a91.25.1779477552856;
        Fri, 22 May 2026 12:19:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c50:b0:369:bddb:79bd with SMTP id 98e67ed59e1d1-36a676c6a95mr4836847a91.25.1779477552393;
        Fri, 22 May 2026 12:19:12 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.21.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm2599195a91.0.2026.05.22.12.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:19:12 -0700 (PDT)
Message-ID: <675fefdb-a9e3-4eb3-abf9-65ef8f104603@oss.qualcomm.com>
Date: Sat, 23 May 2026 00:49:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
 <3ffcf6a0-e975-4eb4-9a4e-d6afb583e0b3@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <3ffcf6a0-e975-4eb4-9a4e-d6afb583e0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3zJjE1hHMDJqBoO76tK7D_tj-ncl4bRQ
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10ac32 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=dyxLLOf8pC0bdfPLpLFr6A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EXL2SugY_77LC3pzBmYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3zJjE1hHMDJqBoO76tK7D_tj-ncl4bRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5MiBTYWx0ZWRfXwTAWm1AKXzfH
 5m385gwe9+fzBwJfUI0OmBFvz2Prj+yU4fSqRKBcc1TqLBBFpzrSNhPTVXM7XIEF0rAbrYcdYUZ
 LcDrhicbB3RKnq3jVuJvSwvb9fCj1Ivu4wttYunUF3PRdMWDHEgJC7Rjh7d0NDPlOhWYygh66MH
 Nq1zt1ikpl4LKaxJQ1fX62bWccs2KalFQENtTWCBz8oV4xBzPb5GPNHH6NlTHtiklAOzcd+tVL7
 xbQmn1bksDcpqjEdgoOvyX9hqHGexDuFwfeSsHo2AWgZEYLzVZK+ecEy8TRfRzwNcv/AnYjJjZj
 3ZHFxFp/AAUERNyNc64se3Do67ml4HXShNqdBcrmulMzu0sj0vl/ckwnfA9Tx052USeE/8HBH+H
 kUF2kuYqaOwktrahTI5Ig/c37b8QmrhWR74IyzWtTeWAORGGiClAyZ6GQknTMrRL3JgoUYrXdaf
 NYlu58T8YnGvlrOTW2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220192
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109398-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FFE85B95D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 8:07 PM, Konrad Dybcio wrote:
> On 5/22/26 3:17 PM, Mark Brown wrote:
>> On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:
>>
>>> The driver now relies on pm_clk helpers and runtime PM instead of
>>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>>> clocks. Runtime suspend and resume handling is delegated to the PM
>>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>>> PM callbacks continue to manage regcache state.
>>
>>>   config SND_SOC_LPASS_WSA_MACRO
>>>   	depends on COMMON_CLK
>>> +	depends on PM
>>>   	select REGMAP_MMIO
>>>   	select SND_SOC_LPASS_MACRO_COMMON
>>>   	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
>>
>> Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
>> on, currently this will work out since PM_CLK depends on PM and HAVE_CLK
>> but the indirection leaves a window for things to break in future.
> 
> Yeah, leaving it as-is sounds like a bad idea

ACK, will update in V6

Thanks
Ajay Kumar

> 
> Konrad


