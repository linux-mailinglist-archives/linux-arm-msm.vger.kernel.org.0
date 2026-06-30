Return-Path: <linux-arm-msm+bounces-115468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vAwkLm/VQ2pIjwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:40:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C86E5829
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:40:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lVMMHtM8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="K/Vg4rS1";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115468-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115468-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 842093068478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A1643900E;
	Tue, 30 Jun 2026 14:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B9843C04A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:37:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830239; cv=none; b=LEs0IAlpaJre+b72xU/VcxumdnJdTVIgthNYkjY1o59+ZHgd+3GLoic/Kv7E6b9jD1peziXYxT2YB/Yq9T44Bm6wGNDBXErPpMZtOp0hb7Qlu+XD7oSmRVlqUFjBPIeEgkf0NyTMF3rRD7+R+2yvJoCj4xzPB6Iy7Q4nP3u2PQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830239; c=relaxed/simple;
	bh=VJkPOlo31BaH5cqVAnma8Jzets8wHIHf0hQnL3y1Yls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7DNYbEnwKQZ8CiXkmY8cGwStK1/ch4mkr6DbygNdxQhPcZ3jo4LXtgBzqIbVGoX8oBv/b3HgswkNoOa8nX1+oLJLTc9WO/YculSV3UZM99DaopnUIPo8oyMGsGNkfEUfRvHt0SmQlmOjsJ+fyTFYTkNeHDD4rYRARNMvmapE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVMMHtM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/Vg4rS1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDKGt2128901
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bh8SlCTfNpOE7sOPuwSI5J0e39QVe4ueR4PAofbIuas=; b=lVMMHtM8FRGe+Laf
	ihUgoub3OjXSvAFK4payLgH0Gz8MVxGvsr6yhg5s6f+Q0Duf0GHLSCBm9k4Fle4+
	7WRrwJDo9cKtNt7rPQ+75uu08Js5kDQ2NjUxMgKIVM54ew8Ig6ZpEx+wTr4BUxjK
	/AfG4RbWuJeWm/J3Ve6GfFtEzXlohIHJpR33bdfPgWRhP6JHZ9Ojo/04yXhe7l61
	1fMFbW9sx51LqubHB0lwD6nkqRqoQGeygQpX/AgWy6EyNII+2fKSXR80RoSY9hb8
	Ls3T12v8NREsVzDoDHyRkAjkckNBxxj63/z1j19Qg9FdE557dpyx1WqXxlkmUe42
	+N3Ntg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93vv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:37:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdcdbc954eso8522e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830236; x=1783435036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bh8SlCTfNpOE7sOPuwSI5J0e39QVe4ueR4PAofbIuas=;
        b=K/Vg4rS1BMSLb+7PH6EjqWnoDV4IavjU+pqlJj65rUDs8SNL8Lf6kPXzQgLGYiIOc1
         3MNtAB/l8wVU5Zam6fSLIQWo/WG9Es+YZstJPmbkPQT62vSLiYcQk6Tui4cNi1Xq0vFQ
         cWbCKG7g9RE8jqbFDdMzGVyaca82NBEueadZo6VYYw2RE9ie9Fp0wqWRy9+9Xbq1QcGv
         ynTiP4DCEwMZgKxdsJ+ADiJz8M9WZ/NndZtZ28D92FvQ7Z4HBdw8EgvobK65Gkyy1uw1
         IKC2evKojCe3NnvgZ2wJ3HbOuhD9rIIrYuzOQwyYjAnXz21f8lT81RMwV1VW+I3ptqFi
         TrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830236; x=1783435036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bh8SlCTfNpOE7sOPuwSI5J0e39QVe4ueR4PAofbIuas=;
        b=HXEl3WOsBNwh3QavFewiOYKsG7Kvl9Ia+F7Pr9zO86250I5TPgFYy4Ic3pBHhZ2icP
         FeRpBZ76ExEIP8xuN6UUu5t5yzRIZKyBa09wkjGjGB1lHOFW4xyu2JmEN4AHKrSkuWk0
         ZksbAS1kX1hqAt5PyI7xSA57/SAkN2n7Uw1IF6qJOwebUE7hH1S9tXumt/QNBYqpxwyw
         qLYQ+QqCqCNaN/6JErWbOfc2cihMw7W9k5Vo+r1Vc9pJZHuduzXqs2uPRXGZfbfmqDBG
         4mNjy+psfP20ZyO02zv9tXOeYcXwCAqJxh9VFaSNmNV53DVKCoZRsY9f/7RYJTtQW35i
         /hLw==
X-Forwarded-Encrypted: i=1; AHgh+RrgUcdG4WzTTowcnPBPfo4Db1pzHNXOFrfvX2bPBCVV/XJeJLnuW45PsLEllMVtT7mC3J5rnYJdmtdOafW5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9WEEJ+T8fBzLaHwSjzVCFUcd/GtD7GSzTIcRP6OSqXqoSTa/
	WHHqRAXk/uUbtNETheyZhDnWQKSiIgSC+djHd3JRWwAad5EHVIL8PkIyxvPltMCce4r7OCxsjhS
	HMoVM5VVxCVOI1EflD7Ss+Q0BKplfpLNn/Bcp5x/DtaOH2UD964xinwo2UFeXRPREdU9c
X-Gm-Gg: AfdE7cljZ9Y/jQvZp+5dvGj+w+OSoil/XW0BLAjYL+Y8xDggAfkNnyqU+h1n601nuO9
	I4qtE8uUy5Tp+SrCOcyfBfgCVSt9X6XFccazo1TgZBHbdOPZCbi5a8em1aMwglls+JfEDKd0hgX
	6+Ocjw2itervVcK2zihoe2uWw864xyXEzHxvUJaZU314fMwVtAj3d+OjkQNVPv9j/lpP+hU/+OF
	GOKcuZDXWrYPw9di8UYDhoyf/qq/7CCiepXcdlilSrYhsTS3UGWa5nCBUUQsZYYU6yADu0W5dd8
	b0b2Iy42XPQJMbPT2/F63bg9SLRqYFC5m2Sn9ljzw0ieuPgE2QiG+4ZQBQz2w9WiTQ69iaUvHSH
	fdxaizetfTRzr7JWMd+3Mo765sdxbfp//jxU=
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr637529137.0.1782830236066;
        Tue, 30 Jun 2026 07:37:16 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr637518137.0.1782830235630;
        Tue, 30 Jun 2026 07:37:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cbf8sm1373390a12.17.2026.06.30.07.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:37:14 -0700 (PDT)
Message-ID: <798d2516-0772-4f98-8fad-959a1daf71bc@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Brian Masney <bmasney@redhat.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        White Lewis <liu224806@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com>
 <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
 <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX23dbAUD42HPV
 hNAvYcmneF2V4/xPly+WFHTecqwVfoUCEV050TWQCPd9BmRYsDFhdOrC3cFXASv3GHjWpgdIUAL
 5Uc8KvHeqByabVw9+/UZiOItacz8ztg=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43d49c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=vTfNKC5RNyR7SVgzpBIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: FR_uK-nUH0YsnBdDcoqtqf4ChKUuGGrq
X-Proofpoint-ORIG-GUID: FR_uK-nUH0YsnBdDcoqtqf4ChKUuGGrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX1QwZjKw9Q+WN
 fteIZUD7Uppyq7KbJ3XAisOTLAoikPSfzzo4FjYYoAUFKUpddrY67LssV+1twlGUdN26rqDigz5
 Hnr/h/6IqbEGqf6mVVfa/wRYS+ahS2WUDMAIpS8TEEI8+QFl6XmQVePa2g2/spoRhjh5y+XWMUJ
 EiAnesiMBzjIkDLUv6ertsOxdZK5Ca68Fko0hCV2NjrAQdEF5wigfzffmwZfS9Dsta5KiWFkyC7
 HttqJDNYikjtylfq9s8pNKTjsM7WFk+DqE8eVt0dYMM7bguvPDh8UkzcivnT4GpLTv5w540hPTI
 2LiWyihTtE0nrAB86bWv/p32ER7/GW5boH5RWsipsqJ3IIEqRxVEO9jd1lrFyYgx3erL+6d+A0l
 lJKhQVOsMpx+XPuM7QzJ3M4HEdhg7QsEkoUbMTfFsK+gQ5aLsHW+W4J6RdlH6zE0kAyVI8hC92L
 T55Qo2E3NCTUjBJfcIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115468-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:liu224806@gmail.com,m:mripard@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 364C86E5829

On 3/23/26 5:07 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Mon, Mar 23, 2026 at 8:48 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/13/26 5:54 PM, Brian Masney wrote:
>>> On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
>>>> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
>>>>> On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
>>>>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
>>>>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:
>>
>> [...]
>>
>>> Ignore my previous patch set. In my v6 that I just posted, I updated
>>> clk-divider.c to support the new v2 clk negotiation logic. The
>>> clk_regmap_div_ops uses this driver, so you shouldn't have to make any
>>> code changes.
>>>
>>> Anyways, would someone from Qualcomm be willing to test this? The
>>> procedure is fairly simple:
>>
>> Unfortunately, I don't think it's easy to get your hands on a 8280
>> device with DSI.. maybe Pengyu could test that on his tablet/laptop.
> 
> It doesn't have to be an 8280 SoC. It could be any device that has the
> issue where the parent rate change screws up that portion of the clock
> tree, and crashes the device. This has been a long-standing issue in
> the clk framework.  I know you recently posted a series for 5 other
> SoCs with a similar change [1], so any of those other devices should
> work as well.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com/
> 
> The kunit tests in my clk scaling patch set demonstrate the issues
> that I have worked on. For example, in my test scenario, I start with
> a parent, and two children. The parent can do any rate. The two
> children are simple dividers. This is the current behavior today:
> 
>         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
>         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
>         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
> 
>         ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> 
>         /*
>          * The last sibling rate change is the one that was successful, and
>          * wins. The parent, and two children are all changed to 32 MHz.
>          */
>         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
>         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
>         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
> 
> With my changes, the clk framework will land on 96 MHz for the parent,
> and 24 MHz and 32 MHz for the two children.
> 
> Anyways, it would be great if someone from Qualcomm would be willing
> to help me test my changes on real hardware. If it requires code
> changes to a specific clk provider, then I'm willing to also do that
> work if someone can test for me. Getting confirmation that this is
> fixed on real hardware will help to land my series that will provide a
> solution to this problem that has existing in the clk framework since
> it was introduced over 12 years ago.

Was going through my inbox - do you still need the testing? I see that
the last revision of the series (v6) is from march

Do I need anything other than just the series itself?

Konrad

