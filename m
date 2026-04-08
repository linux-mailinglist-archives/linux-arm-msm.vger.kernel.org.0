Return-Path: <linux-arm-msm+bounces-102258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OVCqGHDY1Wlo+gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 06:24:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FDC3B6BA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 06:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D93353006502
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 04:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFEC2C158E;
	Wed,  8 Apr 2026 04:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWJ1oFDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj/acHfi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658C40DFA0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 04:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775622250; cv=none; b=S2o9DNdkudO/qGQg4qvuyXu1JBp04h26qRTknb36zi92qZB51baixwH6Loc3G+84rkouI5lHlt3rZo5xXGUsHM/B6gm6xfFLl2lqP2vYgEMPnuw/d9H8Ux324e+Odg+Vn6Lkd9rhHj3RD8WkV1BZ7uF0Kox7c2WQapJuvEMtY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775622250; c=relaxed/simple;
	bh=IJOgYgOKLfzsduMNOuNRKBK2CZadWAfXKCim+jSb6Mw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aoQgOdxBwf0JGCR4rxdLmztGg3oHqaJ+vlF2Uet6nVl5xgBFVbQIMnKdoNq4oYXfwfG8PUCENPtDZSaaWuROzgS/Ezid0oB9TN1CgeAHp4x8+fjs1VrMNThg4VKAVV3pC9rIjiwBAu3RVU/QWV3OPuP2qX2zrjVqs1qoYhjLRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWJ1oFDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj/acHfi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6382ZIGj2412265
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 04:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbbVj97jX5V7I3ImftwwIPW7XZwhvJYdUHnJ5ygLavk=; b=KWJ1oFDvBOEaTnhR
	BWmB1yLCX5RwdWjYBaEOGjFZFIDqkb8Oz6GLfMN9BBOC7FtR7ZspZqfxiOnvWH59
	/iQc6FMDBeRamRknp7VJNNWfBbpIe5DkQme18WyLa0w4CqSWky1+2XwXCKiKslK1
	bI2MES2PDg4Fyt5eUyL0/kHWzX3f+F0XLL2pqCC2idhRAaih8DbE2F0uanY76TRp
	4aVH8X0lQC9OtcLB9I5KcXHTdYRsZk8JaWBr5OS34Iy/9wAXQWq0GocGPFq9HBSm
	G9TivZd/0fZXx75KMp13yMT4C88mGY9ZyBXuuXOqiSRsp6WEjfp1KoPrRWqGVSlI
	VvET6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61v9xhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 04:24:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so349542a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775622247; x=1776227047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbbVj97jX5V7I3ImftwwIPW7XZwhvJYdUHnJ5ygLavk=;
        b=dj/acHfiAJNkPMNOt28IUVg/46tuwCEJy2tFE54ThTD2nQBnvjYYtSWEKZWpDC+Ksp
         /dk1h/0PxqfQiCtoaVzBhjrG7els0cHWw4VZ/NJLgifpFcHQH0ai5Aj0+faOASz1aPrz
         p7rMVDo4UlYRVb4khP1hP6Wd1pgnZEjwz9lvYQRG36KNkGwl1serWXc8tGems3Hv+nv9
         L08Z5vZvWfaWEVeG8A1A/1zEmWVJnH4POLhNgZn2KjjxsbSHVxMZ//AVRwZBtqW7cLLK
         MQ7EEraesKTGHRylKqGcbu1dekMlS0MDVfioViE+JXIrTbwe5P0Cqu2+pJVBSqg6NIgX
         2WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775622247; x=1776227047;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbbVj97jX5V7I3ImftwwIPW7XZwhvJYdUHnJ5ygLavk=;
        b=jVUIvW/z4xp/tW/1+UYcQEcUe+FGj4gZzyNJLrNJ80oCcA129jJ71UaaInR4HvUM5v
         hmXoy1Xqh/7u8x/j9Gw9bAOwOKFxHBGmY3+xnUXxoS8Ti4CrmO5Z0E5RjCKeUYFL3mTG
         0hHaSUiqAcTuBIXZ6fTJzXco1C5rEE4SNashBNDP/lszFiv9E6AOEEAx2UJEkrMmEWRg
         tgLXT2Hhj8XNJvNeAMpU6YQYmmqCcvpgAQNsfXqEcZXn4Ef5WuBS+h7wtj9PPHlAs5pz
         caZhaEga4Mqo4RB5DnyxNLsKKpJ3rAKf+4ZZO1MyWUoLHEtk1Df4IaflgEExZpOXDek9
         ZUkg==
X-Forwarded-Encrypted: i=1; AJvYcCW5544OoqCnIWudz2snbfE5D5XXc2/xu/Q3Hvc2iAcxHvgH7qGqXDH0JPVBJKcXLlK0jILyeOy/5R5dX6ui@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5l7b5k7VHV1nrWvp27MfjYlgfECph7+jnHWcsTTA3RNTqcix
	RiPfF4nc7JJAO+I+IDVkkO4krFLjbfUBoKLKKs17AxJ3ZDmr3qNwDYMMbtQNbtCze3jomuIU/JI
	Sb5CRwqSoPP9q8UYAfzQroKLegvF+rkaIQbD9w9rp7LYqz7cci8qyJ5oI/aEXYUqBkiKI
X-Gm-Gg: AeBDiesqZ//A/ren1irVoyIphGp0JfmDN+HtaFIXNIvP1Pz1e1cEnPumummWhvEdqjK
	aZ2ouYSO6oFZ3S74sDAQB31auKmEPu05ds3HVn53sBYJxjA/1Tm63E1Wp/hRr65G6g7eiJxSNco
	+YM5Kig9vicNb0uxrWFXo+FqKBJ4XBDMJKjyvZSA2tQ9E+WRAXHkuBKZegT2w5QhgdfDcQx+6Rd
	1iR9Sy/1tjQcG0vcvbJ31l/ORhJfvBWGVUrheLv+/eup/+oaZ2c2b/wZZwQGOiSNZkyhRTMrGJ+
	mufLCGcRFVRNWf7vZkBLJ+k061W20XH5BIAJzERnHjyCLoRhSvxq9+IgxmBYW5nkkwJ08YjC5wI
	fLpkbsG/j3bDkAKAsnkXUmumm8C/JRcW2O0CbPf1iHKrfQSon5A==
X-Received: by 2002:a05:6a20:a109:b0:39b:897c:6f8d with SMTP id adf61e73a8af0-39f2d9e7529mr18743277637.16.1775622246697;
        Tue, 07 Apr 2026 21:24:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:39b:897c:6f8d with SMTP id adf61e73a8af0-39f2d9e7529mr18743247637.16.1775622246199;
        Tue, 07 Apr 2026 21:24:06 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6563597sm20655477a12.16.2026.04.07.21.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 21:24:05 -0700 (PDT)
Subject: Re: [PATCH] mmc: host: sdhci-msm: Fix the wrapped key handling
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
 <x2mmttyg5t5qjo2tyrwqbynqylqqlulu7fhoyxl7vd54geubqx@qna6vzzr765y>
 <dd2c0522-91bf-5375-f5b6-7c9ff5304fe7@oss.qualcomm.com>
 <CAPDyKFpXRPx2Z8Ro3f3BU3ApEn3rHtXhkO09-qjGjHwSEH5dmg@mail.gmail.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <f87029b9-eebc-a947-dfb5-1ab27d9b54ac@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 09:54:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpXRPx2Z8Ro3f3BU3ApEn3rHtXhkO09-qjGjHwSEH5dmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAzNiBTYWx0ZWRfXy/qVR+ka9oGQ
 hadTxUwPJ843N94DSLsipofRLWACapNAqbI1LVY0lvSiJrsmaerJQTkG8YWd1vJlV9tlTw0os+A
 9/OAOUozxFAeKlSGmrgZAQsx2k1gwslmaHZD+eNDS91r5CSkCJFuu6vz7PWZf1rUv9ZYDhAdGrZ
 3AryWH8DGRpiqYXgeW7BqU2zEBLFiOTRJ6oGxL2SqC0Dx9Skyx4obWROD9OUm/XEDOiukk/b/1X
 zxluzVBy7DFbubHehtDEitPgFyw756XoJeueB7Vt19bQElJQH8BqGG7p1btBjfQOi84Hu7IIxXt
 x2rkh+wmRLK4tx2sddTaHfVlnqA4ik2zRiRdb3mOxMZu6QC7afeaOfRs9UUms4F0iwIUZnDKRaU
 hEkniQ5QGjjWrraoQtkVq5lN9veh5mlJEja7PW4PJhRMjXTkM/PUY/Zx6WLMFxwOtyDJiw22H/c
 a+4/JQttcyew05t7RLQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d5d867 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=asX3J4iNEGbadXDLWWsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: J8H2B5xF9MbUzu2KQ1aCKj3hxN4hHH0e
X-Proofpoint-GUID: J8H2B5xF9MbUzu2KQ1aCKj3hxN4hHH0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080036
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102258-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B8FDC3B6BA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 7:17 PM, Ulf Hansson wrote:
> On Mon, 6 Apr 2026 at 09:29, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 4/4/2026 1:30 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 03, 2026 at 04:29:49PM +0530, Neeraj Soni wrote:
>>>> This change was originally intended to land with the patch series:
>>>> "mmc: host: sdhci-msm: Add support for wrapped keys". The fix was present
>>>> till v4 but was accidentally dropped in v5 while rebasing.
>>>
>>> Don't describe what is being changed or what was intended. Please
>>> describe, why you are performing the change. I.e. what is broken.
>>>
>> Ack.
>>
>>> Also, likely you missed the Fixes tag.
>>>
>> The SHA-1 ID for "mmc: host: sdhci-msm: Add support for wrapped keys"
>> is not yet available in tree so i did not add the "Fixes:" tag:
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes
> 
> The commit should be available on the next branch in my mmc tree
> git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
> 
> commit fd78e2b582a0 ("mmc: sdhci-msm: Add support for wrapped keys")
> 
Ack. I will post v2 with "Fixes:" updated.

> [...]
> 
> Kind regards
> Uffe
> 
Regards
Neeraj

