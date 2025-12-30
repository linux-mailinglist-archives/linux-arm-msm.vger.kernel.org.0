Return-Path: <linux-arm-msm+bounces-86912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA7CE8C3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F7FF300FFB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452CC2E091E;
	Tue, 30 Dec 2025 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcxkrXPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqTH5Sqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476F29BDB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767074800; cv=none; b=SciOUos1xpL8QPuR6NLCz8DjqiyZG4Falqffu66vJ1VMSTrTgfOMywc27aoN+cfBhAg0nySFR7Mwi5lEqiW/dFwnvYiVpcuXr7FaXEnaADkcmgZZ9kzIo//TPiEAxDrn+BQgKIRba84KoR3GqsFtaxIjDdnSnCUXPEMF4IO6KLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767074800; c=relaxed/simple;
	bh=mGUf64cGCiM7u6oQI5DJ0578LfNjkbJBX4ABFnEYEYQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TbmqTWimiV/Dt4n63mxW8GTKT3uZ8y/+NiF2z7GuarzI5QZvD8Lyrf78+OBXcbO7y0U4T4Bdq1g4e2p8764R+XidEFH78thjoOPsSVo4iv/y9UN/fZkLcz5x1j82aOwqG+LJXh6508AgjmdxrIlE1RYN9nqLI5YRbpkZRS17zuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcxkrXPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqTH5Sqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTJqq4Z2285222
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WG5mTV+rGoBWzgRbYvXrLqoGm1oRgWF/NX55bgcLtc8=; b=GcxkrXPnMOSMMvqv
	WKoJc2K816Xet5amIkhVS0BOhI893grjmSHkbPSxA3Z5vkk+wQZhjkkAxeAabWWZ
	ThOEWPoyMHoOpuJZmLDlxGUZhU0e6yZfdzwD9wA/DxN7KKgbEdNs8Swb9bep5v38
	HjKtJG40SEXGsfeqodY14+iv4sVSxONbxJ99Vd0ZF2/9lpvQxR52qnWFnyDvT2VB
	tZlQZqCkzjViANcrgaA9/uxeeKMCf7SlyDv5dOoEvgJvG7rQm0btDE50RdpG5uNE
	4+iCgDk2fXNauYZ5RdSiFFl4yfWnMf1682CSWyKs1YXM6nMGpy3vAEeU+UocLwzx
	JKMtAQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gs18w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:06:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab459c051so24134275a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767074797; x=1767679597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WG5mTV+rGoBWzgRbYvXrLqoGm1oRgWF/NX55bgcLtc8=;
        b=QqTH5Sqx4tsgkQnttaPxNY95UvzvdW3Z7r9Y6slkegAX4D1Adv8viBODIACTiuuFhN
         fKMi/EojJQwNpTvHYKVElwmohJql1mWj0zlIE7KxnNvBV/SxNbVCKeoYYlgCWDn7cNLI
         JaOXHRw4ixbbv0wnULfoH8/6O1gWXquS7Nr2crocGJgdcg01+MLqV7NrYSaXjjGLqDru
         DtXD5WRwOGGekXtzulNSHDwuRKSXThaoLts40Rg0kDMHVelBm/DzbUAxtuKvPzJVVHU2
         GsRfttrw3l4p3Ks/k3Y7E92GN2QsmieGT8xi9g9ex8/onyD+gKe+A9G8wBeChC6tEaVH
         EwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767074797; x=1767679597;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WG5mTV+rGoBWzgRbYvXrLqoGm1oRgWF/NX55bgcLtc8=;
        b=Nfl9md41RiujJTG92wxwuN2cnw5qn2+q8/uBM+sL3iqxyyfGq1aqp03N8mGY2AkZFJ
         slCM/m9C6oEgZfZ9j4+z9rcYUQnesBiAG5K5NX9iL1IdzdwUflq7qtx2pzaJJ/UanpNZ
         NJcQn9yT8kONPKipD/8wnwxHGzIQZm5U1c/sWtSkthm8f5KN5lzcvWI5DKLBaQCe00pg
         FLkMTuXStpv4D3sRMYu94YG00mJZekk4SIY4Y9Xqi2WwMwNiVyVYiWX80THmZgGj/5JN
         fBWySxXR1kowHD8QPBX3L3wknrM4fXjZJi1+zP2PIV4XV6UfzUu9YMhzD8h2KHZCyxmk
         G4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW56RVnEaB1nMvxfHP3IKKuuaEZEOZLCZIV2pZOYdQV1XdPDyjag8tucp2r5xj9LdfQa7r03X0w6K1TqCjt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YpkD/HYXxe+pcKVWReEhPFFsDj3u9bJVH6e5ZqU+rR/zkJTJ
	/pVwvWClMRS+mgHJU5Lg4TxfpkdJ3vTeWUld4ej811ck7T7sTQUHlhtV4Wjqyg35pGwoLSwvEwQ
	dpXBq7BGEKaZktCyglJ/vJMF+7fq9D1PDunAbQsMd3VnEMezhG1VoUiGyZOvjx870czf0P4mnqC
	qm
X-Gm-Gg: AY/fxX5lF8CKFGkQmvUqJsh+zwZrqyoSHs+lddYjMs3ZjBp23LaKGtmnOiF0AMtkWY5
	ZBn/RSzjSVwJiFNRQDYZevtfcfZzJk+M7rK4E84T4Qdzr3aau5MSmcorVoSbPjnKSVzHoQF4Ykd
	n+ZhTlebqkUi2/0oFDf68/m2um8REBcHjpdzp9j74U5OHqjpWQprqvChUdGGcxg+3OFVUXaE/ND
	iAAYJKxBrT89Ej15mlTXqX54wMGgmSwdUmXZJduMnE5EpnytGAIV82XYc5mQ3i9ke7EiX66gdbe
	dKWtZT1GgqxuzCvDtX91bahLNH3sPk+mCZnVAGchsqYwysry2kEqI4R5Wlb6nkTB/BmNk2qpX/v
	gq2ZFMgsQSVAKFZdatQY9CPj+aWJm2XF2EbrYafg=
X-Received: by 2002:a17:90b:28ce:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-34e921448b2mr28785417a91.12.1767074797220;
        Mon, 29 Dec 2025 22:06:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXU/WhMf/uABkEh6sm1byPn1ucFkm1LplqVDFVkK9rHWm92bL3U43pV5xkq45HGuqk0rcK1g==
X-Received: by 2002:a17:90b:28ce:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-34e921448b2mr28785411a91.12.1767074796753;
        Mon, 29 Dec 2025 22:06:36 -0800 (PST)
Received: from [10.217.223.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbd618sm31951170a91.12.2025.12.29.22.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 22:06:36 -0800 (PST)
Subject: Re: [PATCH v3] mmc: host: sdhci-msm: Add support for wrapped keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, abel.vesa@linaro.org,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20251229070507.3322149-1-neeraj.soni@oss.qualcomm.com>
 <20251229222528.GA4684@sol>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <02be322b-e49b-d7b9-c6f5-7b4c25e7b680@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 11:36:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251229222528.GA4684@sol>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ueYlicK8_560S1OkPNQluO4wzndCNiEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NCBTYWx0ZWRfX6lfgWjI7WVhX
 PEZe7L7rjXu1faWYf+nK3398UNfMWq2YDKuVAgutU0M44v48maZepV6gVjFqlWpyBAuseIrDQCO
 Lo+tUK9qmHJSqdPcJwvUMlJFkhm+LSYse7lFnoEAuWCQmXiXaj5KhpW2RFB720VR8g/hw2nWl48
 xG8NVSAW+gTgbF+gyoRJzKNHhJgtpGhNvFjdbaVGOJ+KtR4XD26itZGYi5EspglnKHjMTDXzscL
 N4FgWCiKZRcluUcavmN0H8MFCOiF4f5qYl7gcvpwcUUw7M1K7pLRnaGC7It7w+GdM9DLE8XrTRx
 w/MNwzq2Nf8I/TGxH6LwwP0VQr5WD4gIc7co7bpzkelMij4rqlL05Pa/hQlgcfU7FJIbiyMp0PH
 rjla2Cv8hlhqaxUXaqojoF0USSvla7Y1Brh/L5wk+KDuE8tGET2NugIwFsL+yHfSv9q+mI+DklZ
 xe7YGxoWLyxQ2ScVSzw==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69536bee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=90dgnz13A4KOmbfFnlkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ueYlicK8_560S1OkPNQluO4wzndCNiEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300054

Hi

On 12/30/2025 3:55 AM, Eric Biggers wrote:
> On Mon, Dec 29, 2025 at 12:35:07PM +0530, Neeraj Soni wrote:
>> Add the wrapped key support for sdhci-msm by implementing the needed
>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>> blk_crypto_profile::key_types_supported.
>>
>> Tested on SC7280 eMMC variant.
>>
>> How to test:
>>
>> Use the "wip-wrapped-keys-2024-12-09" tag from https://github.com/ebiggers/fscryptctl
>> and build fscryptctl that supports generating wrapped keys.
> 
> Use the official release of fscryptctl from
> https://github.com/google/fscryptctl instead.  v1.3.0 has wrapped key
> support.> 
> Note that the tag you linked to was for an older version of the wrapped
> key patches that wasn't compatible with the upstreamed version.  So it
> isn't plausible that it still works.  I'll assume you actually tested a
> different version and then just listed the wrong tag in your commit
> message.  To avoid confusion, I've deleted that old tag.
Okay. I Will test this patch using the fscryptctl you pointed and update the message accordingly in next patch.
> 
>> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Otherwise this patch looks good.
Thanks.
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> 
> - Eric
> 
Regards
Neeraj

