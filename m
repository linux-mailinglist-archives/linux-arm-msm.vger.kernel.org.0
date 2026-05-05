Return-Path: <linux-arm-msm+bounces-105884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMZXBwK6+WlICwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:36:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B341C4C9DD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 405BB3022AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 09:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0837940DFA7;
	Tue,  5 May 2026 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWxechIE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEkeiLsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BCC1EFF8D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973725; cv=none; b=LEYqVQT4VDT5oD7HXz6iW6iaJd2mo6Ur07nyJYT0iY/E0ZReiuoGtKuJ16tiHgnkTv0S5XP+CWBJoJcoxOdlYavLmytwewjCTA/y2tPdahCOpAgQkOVIKapOhaOHgcDtVcZZmKKY2LF00l6Mi2H+jSr/lQmEuS+EHJVu6s7QmvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973725; c=relaxed/simple;
	bh=PR7Wdss652FBLazi6jLFtm6E2EgfHDdQfxJFN+tksfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0gl9evBXHzZ6dV2zkXzgfkStMFQM0ZpUr0OKvBH0XAy1GCMObcoif5gSAyqcnNjkIsId74LORLPgO0eFK8YAZUpBQaDhXiSpWZEBFKCn0xjB6JJTOtvvqwvN20Z7bF9nEXUwvYvV3O/elyE3fA98loJwE/AECDCf8R3KoeNkBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWxechIE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEkeiLsE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456T0aS1186892
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 09:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KkySOLo4+xAyVqgNYM8VLGdX22LIlY+bmdfeecgSx0=; b=iWxechIEMo6AOn1T
	NFSj//h15brRDJz9I1dLXcapHuA5k8gaEF+a/UEt3JfSbmDD4n9fCzdh4He0V53B
	6gIp01xh/Km6eWdu6rzPvFJ6hFYBR3mIi6dikcLOg/xo8lzGZ69GslvTvuNRkMWK
	CWp2mL31eZfwuldAybZCvsiCPfJiql27GIMT4Dj3dVlqZjh7aNm8ZJGqyw1E3Fnk
	17S+gZEHiwZ0Ybh70twWOTmsaQpcHIL4Dtg8dw2B51MEnW/yziBIVeRTEwLftIK2
	AfIaWNTNcmN00qIoVUenaIwT1mM0juCBfTWRQ4+rQOGOpQzXg04z7bEIPR+G305q
	UFnc5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgbn8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:35:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so21509451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777973723; x=1778578523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KkySOLo4+xAyVqgNYM8VLGdX22LIlY+bmdfeecgSx0=;
        b=AEkeiLsEwaoXrYWcRwcZ3MWwcP4x3tcJt3+nsZTLuOcMDKeyteFokcRuDm3kaDLIRA
         DEFp7MDRou/tHi2YImq55G4hR1aMrCWM9JXBlXq68Z31F8PACLfUKRu1CA3mL8kpZw8T
         0arjXw7ZAmxrf5cvOzxw9RQk4ca+fb6IJJYrkx9+AFiHslrKKyMU3vP8SkAwHd4MGThc
         AL5F5IQrDJiXvH6ilksmIH2Nxn/arNASkPvje/oD6iM7AodIIy4R25mARQ9vjByTd/My
         +eG+jN4MIcCCZ9HHiXOl77xs1/YjayRmZgAcqYarfmaKxZ2w6F8kf7OKsj22RyM1ID6j
         8CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777973723; x=1778578523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KkySOLo4+xAyVqgNYM8VLGdX22LIlY+bmdfeecgSx0=;
        b=EUbz1PLB49NGmj8R5WIyDWdPaju3yPoVUdpbPG08l9XadbWJ0dRWAwdlW1OQzFVO2y
         U3rgG16c14x+Z3eytq7x/c/y0/0C3CBhz4SIsHAQfTMP90lSZ4RM1NZQAdRogNIUA1i2
         Kv9spvZ6K5HzZ5eEFj1CHThrVh9thGGcx/QYLiHaYGIqGvr8cqM73BvMGVq7cLLGw6fl
         CLM4WeB8PyBE0Qg5scIZ6ZjvXa17s/RJj37oVgFTnWi3WvC2MWA/TKo3hHdeJFEMlBIl
         O+yTFMnQLnX2b/5ew1FOPJGROkij74FrPUdQG02A5wz3w4PTePBr+TJdIiWSn2p+7Osm
         Y4wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8G6Mv6+pi+q4KMQGMuSMFQpS6iCpO4uylC3ZqiKXm4cua8JPBdIc9k76/cS/3e7CTkLPxq4LKv+eXYlI6R@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcIX5A4nVWpXsRUJ0KvgZDrKq377u0Nwcuah1sDI3vRSQMgVg
	2GcfQmtv3GV5ljuUrLzChQyH0bpLjvFVW8V3HpFLbB8dXJv15i2fiS3MBdbr28jOA1/drzxv1YE
	c/Hj1K/f35VflKPHPlbNiDy7tbEAIpwkY3bn1UT3VmU4r4jcgmU8iN1e57DFDEig/gTFM
X-Gm-Gg: AeBDietncaFyx+xAocTPgdvzGJEv33ZaWD5YM5yqGRDHaBDM5miw3XFmLPaLB7ujOQB
	ExzmA2BiDOwBRGtt2ahPNSYJ/9tvzrJKTNaK6ySUIR5pSaLSjHjrBn8vumPIiNTnEz4Qkt9LVtp
	Zytc2xY/yoFKrX63cHiV4QAm+fXtyh+1qM70pmIlM5ErlIl3qKTdfLueKaIz4gvYhq7aklvPnxh
	8UO/8y4y2WnIIlx4d1j+8t+xZySmq3KSRMbCQxFrJC80/grjdu3lCKj8RRlO9fHOSUjqzBQG3L8
	IHv+lgiYDhopjfrSFHFvw7MMezyw7/wB6P+eEOqsfEynQNX6jEoLnTm9Jtzrd9JOznSoLCpbreO
	xaxy463U5AS6JD9hm9qyUD6zfkdZEMwxIGqdHho66xhsI55gdSW5GJrLK1qQ/4h6uV00WO8Bqx9
	zoDInWooDyGC80rJ/m
X-Received: by 2002:a05:622a:18a1:b0:50f:b1e6:a901 with SMTP id d75a77b69052e-513069c599cmr34542581cf.24.1777973722620;
        Tue, 05 May 2026 02:35:22 -0700 (PDT)
X-Received: by 2002:a05:622a:18a1:b0:50f:b1e6:a901 with SMTP id d75a77b69052e-513069c599cmr34542261cf.24.1777973722195;
        Tue, 05 May 2026 02:35:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm603925965e9.9.2026.05.05.02.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:35:21 -0700 (PDT)
Message-ID: <b4972eaa-cfea-4fed-990d-2cd34177d045@oss.qualcomm.com>
Date: Tue, 5 May 2026 11:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
 <bfecf67e-faf2-4889-b29a-2d4d5cd0d1a6@oss.qualcomm.com>
 <e473e26b-f4bc-4044-a893-c0f255de6cb8@oss.qualcomm.com>
 <0d95cd5b-01a8-44b6-bd4c-a7e5fa81e181@oss.qualcomm.com>
 <1dd4746c-e93b-479f-8aed-ea9a21a03316@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1dd4746c-e93b-479f-8aed-ea9a21a03316@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -EibsY4shpCT4yFGaj9s90cOQLkoMo2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4OCBTYWx0ZWRfX9LNK+5S+lk64
 wNTn5zyMCrzE786s6JX1gjoM1ble1iYvh1RL2QVN1iaZyMJ2MXNtWRz0mcliPNfb13xDe1o3CMh
 KuIZCa2hglBIwyRNVdG6s43vNe7WHT1J+Ts45kIZc3G3HGgRYkQ5U19zIA0R3TWqwDoI+5POHdM
 RTjygcnuqj3bYUuL+ICt8t0wtrmGXOBvVtwgXVMt+28jhDGj74c8fCyhTXv7YloBm1LK0cxJ8Eh
 WY7u5pKDgis3+gOGh9QO+fh85yAKBTQF8XWZ4ismarleMTup1Vacfahinjka0k/tOPc5rLoUADB
 1XW8JjZrl9lh398Dn7hg4Z7G/Z59YdWXDvQuoq204QJEawPvU8SXywPh9Z37E6rk9YMWEZCikO6
 iCU8d8mkI79JezATyW3hRa5zH30yK/8sraj70SBadi9qwtklbKR1vv9yovlWhvX03JfGXTLzTlS
 K8hHvXQ6OUka0mb902Q==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9b9db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pvSK41EeoSHcvvxgzhsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -EibsY4shpCT4yFGaj9s90cOQLkoMo2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050088
X-Rspamd-Queue-Id: B341C4C9DD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105884-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 10:48, Priyansh Jain wrote:

[ ... ]

>>>>
>>>> int prev = INTMAX;
>>>>
>>>> /*
>>>>   * An explanation ...
>>>>   */
>>>>
>>>> for (i = 0; i < max_retry; i++) {
>>>>
>>>>      int value, valid;
>>>>
>>>>      ret = regmap_field_read(priv->rf[field], &status);
>>>>      if (ret)
>>>>          return ret;
>>>>
>>>>      value = FIELD_GET(priv->feat->last_temp_mask, status);
>>>>
>>>>      valid = FIELD_GET(priv->feat->valid_bit, status)
>>>>      if (valid)
>>>>          return value;
>>>>
>>>>      if (value == prev)
>>>>          return value;
>>>>
>>>>      prev = value;
>>>> }
>>>>
>>>> return -EAGAIN;
>>>>
>>>> (Not tested)
>>> This approach has some misalignment with the HW recommendations.
>>> As per the HW guidelines, 3 back‑to‑back reads must be performed 
>>> until a valid read is observed.
>>> b or c should be returned only if none of the three reads(a,b,c) 
>>> report the valid bit not set.
>>
>> Right I missed the point the HW recommendations is to read 3 times in 
>> any case. Maybe replace if (value == prev) continue; ?
>>
> We need to store all three readings because, if all of them are invalid, 
> we must compare the first, second, and third reads using the following 
> logic:
> 
> if a == b, return b
> else if b == c, return c
> else return -EAGAIN
> 
> Given this requirement, comparing (value == prev) inside the read loop 
> would not be correct, as it does not preserve all three samples for the 
> final comparison.

I tried the different combinations and comparing inside the loop should 
work. But the optimization introduces an implicit inference not helping 
for the clarity of the code and probably prone to errors in case of 
changes. So probably simpler to keep your approach. Please add a comment 
above the if a == b return b else ...

Thanks

   -- Daniel

