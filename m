Return-Path: <linux-arm-msm+bounces-92941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENNrGj0Lk2nw1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:19:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D7D143484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2392F3001396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3508C2690C0;
	Mon, 16 Feb 2026 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh59LdEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYxYa3rs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0769930C61E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244345; cv=none; b=S73gEWMeyD6NpHyTqTNS6LfrVXTC4d7GQhIeA2YcgtcXGzqR7r+4GO1uuxeMWhLmnP1IFpmWBM+TJq3TXamVPqw44LZzJdtn0NIDumU1q0z+iGOUhftpFoLQmxQthnCsQrh3myfO/BoPmylR3kFdvliK7vSg/L+/sm9h2//eOro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244345; c=relaxed/simple;
	bh=qF6sWr30Kr12NDVrl+Ez+nQNFEANHqIDNqXDpkPuGcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3wd2rVhd2QjmCjRrHbZYmekHnC5Z3yjMYxJxC2MEOxkHU4NhajfbdKq4SbAjsDKT781Sq3w+4pCK0peygigEbDl8iJ6M+8vHZAlPk4ojNVnEz12c2wFitqu0XlYc5eVe9+akzQieQJ5hjFT7hOGM1x1b2BenLfUUSL5lSuNmRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh59LdEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYxYa3rs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G9r4Ol2696782
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEKTw5C+zxMfo68DsKgl5OTHrBuzxHktqkQD1FRSneg=; b=Uh59LdExsjjW+4ph
	elmCKKMRYPWMCLO/wUH14+zwM8FyvqJxThXwAbJvO6tp+Sv8eyeH1wx6zw7E7ZX7
	9ztG0jHIyM8S7R2otOr+oTZzn1qzC5dYaZlZobHt9Ab8ltBclU+MlbkMJP4rv3JC
	6i30wLUPRceW2cXTr7kIxu3J6n6zw3jYXcwy460/ERu/GW2DjIO8Dx11mANi/aSA
	RGXYd1HC3Bv/H0W76tDWOxg+2kRIiLleN9EAqOn//tMceV3lHnp1XnNi0hZASjd9
	Dv3aRS2NTB39HJyU/42qBNDku4Z4H47IuhcTroSwCv9+PhK+qndv7GF/JAEN8Rsu
	65DyhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcmbyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:19:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso217023385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771244342; x=1771849142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEKTw5C+zxMfo68DsKgl5OTHrBuzxHktqkQD1FRSneg=;
        b=fYxYa3rsCr1OW7v2r5hDPfoXvLHVn9lJeqm1RUuiYYUUxEfRybmLYKtuYjNqtSD2Er
         xI5CM7YPxXPdkIDNS55xXOICqpYTtfReJB6J5opmtilZE3vd3/ifGr/KfFu6Bs/bxMgP
         2TJtpaBN928hSUrYMzmaOCNGXBtpBbciqBKP/DTQIbL0Qeh7/q4RxfCb3Mr6fVxSJDZs
         iP7kGqZxXHaZ36Gobg9Yn88ViFhxJqO/O9AxZK2lp7KaL43gr3/HNoTh4wz+ihEXE3oN
         6bqxgZBJzepPGUX/dGr8qKyuP3GFfGN/FTICj/FTWBm0LC+snqoMbFGFUrbDrUP8w8dS
         hABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771244342; x=1771849142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEKTw5C+zxMfo68DsKgl5OTHrBuzxHktqkQD1FRSneg=;
        b=BuIm+X/7PBh47O6zvNgNHr/e0/x67ZAfN8OswbJVTIB5mB0dZcyP/YkfKYk9W/lgJh
         UF8cHr4oOYVU0uwzy53at2fnu3GPjlwPZTWwa9ombdhhLTHusAyhgGS7CnGm/XRCMm85
         n4QzFogXb5gCCPpHXaa9hu5ZCcQZqRYoxcGxqi57H2hsaqOn4pSZ/jPZCgPDQ6xtp668
         AUic/GNXAW9R4Tfgg4LVTCGhLHWu+rJy09TMUmy/bTyYG/3aymgyU7BbdH03GzFxJK+v
         1UHxPq8jelqO2bfNElzRgIGjdwxvwMyQtYgKpyKII4efNnTScFCWfltcXnXfOtERDcav
         yQVw==
X-Forwarded-Encrypted: i=1; AJvYcCXqfsdC6Ob5whx1PQ7rOR7pgNvBEDB5O1VSr6R/AuWyGWWKkSqzeVibxQJAaDg23ofZq0iDP7hk+VgIk3G7@vger.kernel.org
X-Gm-Message-State: AOJu0YxomOdOEpNV41YB3QgjD21CquPv3zqj6sFBPMb0EGO9sOP/AwBu
	MC9sD4gDbcsUWm93i4y1bKCOoQd8TbbW/o+EHExgTuQWpdn+XGQVlZvdbpgD53XBBN8uPTntuvO
	Kl06WYfcqn9fwhpkjUiEaZc/Z7FnIbq61PGVf2CIyhXO5rysNGbBxyBqDJUq2ejxTYEkd
X-Gm-Gg: AZuq6aLUOVSNb9Pcg1JdokKgf3NyRpV2s/QrisJMd8j2kcMNiK9WGe1jon435zYM5ER
	xQ/u+B6lg7ap+JvxZfV0QxhiV39/j7n7UmLqdgMGAGi9wU3mbM6d/tfpwtuNTnadJiyFh7bOGME
	2yteIRsL+UoegIF86hojOLGlpdDvfdRUD/bkeR8UqA0cgCtvWhL2LYvSOg9VPvnmc6cc6eioab2
	eoJtte6dAJ8lpIqrkaiWtwu4XHPlTj3iaav0Qjohu4tKlOucE+4fNAIxY0xlb9U74okbTUvbkyO
	OdeWFLrFRrnP/OjgXRKyfqNN7llPuARPtUE5R6HRbC2ZsDcMLQSpfFEUFqrRVK+iB9amHL3cgDo
	3av26a8XiaoTzfjVU7kVnO8ERtoWGBOk2XG4Jm+BPq2ZWYSweyFklW64oackfx1NQ/5DjHcd2Ev
	CbjBk=
X-Received: by 2002:a05:620a:2941:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cb4090d491mr897414285a.10.1771244342195;
        Mon, 16 Feb 2026 04:19:02 -0800 (PST)
X-Received: by 2002:a05:620a:2941:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cb4090d491mr897412085a.10.1771244341538;
        Mon, 16 Feb 2026 04:19:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766519fsm241141666b.48.2026.02.16.04.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:19:01 -0800 (PST)
Message-ID: <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:18:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
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
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwNCBTYWx0ZWRfX3vb0v545sMhH
 vcL72Pjrl/CHPlW1vzADytQ4oDYLr+cZi5EVlTJXyaI8iIGWOGQlGM2OEuaM355HfQLlMnx9kbK
 Gn64ZEo97wf+1TSe8Vg3NyAq1LDrvZ6UVSMF3O2v/H8oNVC15TKEQbPYZGHqTbHFPjLA//U+ShL
 KD5OfcDlKwoc7EdwZNstEuDP+oKNB/EBOVE1MIkVAPpSkf7Pnf8H9tQQrjGszeNeJrSm28Uy3Aq
 FcGxpYhBUxEFtOPhYNgsNMaYSrinq+IpLxhKHpkp+kjver5j+R9MoYyD+EXw2qcYMKGmuPPTsKf
 8PDLiiHbCXqDkfr3Z2XTyhEmBtTwItQLTxNEKZh10Pgf+7ThGyM/NPynhqr6Z9YFV+5TvQxw0HU
 0y/o032LyxiSWPZu8TiXU+x4PfEYewLdNyvzeNpoMkM1LXCPyYYzmONqxCc5FEmsXPKwFfovbU6
 fJoFhtfk/j04s9UTRHw==
X-Proofpoint-ORIG-GUID: tWmkr7wxX9trEY_2LRlWO7_Wmzb3uYxZ
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=69930b37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ZkWj3vqgG5hmBBxJETsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tWmkr7wxX9trEY_2LRlWO7_Wmzb3uYxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160104
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
	TAGGED_FROM(0.00)[bounces-92941-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89D7D143484
X-Rspamd-Action: no action

On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
> On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
>> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
>>> Register optional operation-points-v2 table for ICE device
>>> and aquire its minimum and maximum frequency during ICE
>>> device probe.

[...]

>>> +	if (!ice->has_opp)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	/* Clamp the freq to max if target_freq is beyond supported frequencies */
>>> +	if (ice->max_freq && target_freq >= ice->max_freq) {
>>> +		ice_freq = ice->max_freq;
>>> +		goto scale_clock;
>>> +	}
>>> +
>>> +	/* Clamp the freq to min if target_freq is below supported frequencies */
>>> +	if (ice->min_freq && target_freq <= ice->min_freq) {
>>> +		ice_freq = ice->min_freq;
>>> +		goto scale_clock;
>>> +	}
>>
>> The OPP framework won't let you overclock the ICE if this is what these checks
>> are about. Plus the clk framework will perform rounding for you too
> 
> Right, maybe I can just add a check for 0 freq just to ensure the export API is
> not miss used.
> Something shown below:
> 
> if (!target_freq)
>     return -EINVAL;
> 
> However, my main concern was for the corner cases, where:
> (target_freq > max && ROUND_CEIL)
> and
> (target_freq < min && ROUND_FLOOR)
> In both the cases, the OPP APIs will fail and the clock remains unchanged.

I would argue that's expected behavior, if the requested rate can not
be achieved, the "set_rate"-like function should fail

> Hence, I added the checks to make the API as generic/robust as possible.

AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
play, but the latter never goes above the FMAX of the former

For the second case, I'm not sure it's valid. For "find lowest rate" I would
expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
so I'm not sure _floor() is useful

> 
> Please let me know, your thoughts.
> 
>>> +
>>> +	switch (flags) {
>>
>> Are you going to use these flags? Currently they're dead code
> 
> I agree, currently they are not used.
> However, since its an export API, I want to keep the rounding FLAGS
> support as it a common to have rounding flags in clock scaling APIs,
> and to support any future use-cases as well.

I think you have a bit of a misconception - yes, this is an export API and
should be designed with the consumers in mind, but then it's consumed by
in-tree modules only ("what's not on the list doesn't exist"), so it's actually
generally *discouraged* (with varying levels of emphasis) to add any code that
is not immediately useful, as these functions can be updated at any point in
time down the line

Konrad

