Return-Path: <linux-arm-msm+bounces-114842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fKO3I4sEQmoEywkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:37:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5386D6132
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:37:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h4EVGE6C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a1CiB3Nj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114842-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114842-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 656D3301D073
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB62437FF63;
	Mon, 29 Jun 2026 05:37:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF31D45E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:37:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711421; cv=none; b=YV+tOla5LOtKARla8moEs9gnjlZ/sXC7CKHFMTK9WSIrXlooPCPHtzio3JUc35RDA5VPzgSPpMosUsat7SatMRECZhHfbnxKzHbB5OkZHb49gN1AWOCFfcnytpHby6ymo2pDuJbN+8c3rD4fxmW72+RwAhnm8/vc1SjJt9AtyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711421; c=relaxed/simple;
	bh=T5xDfj4gTS1yOYXj9otH5qZUmbNKwm2UXsV/Ibrt4Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3BBAiXFzgVR5dS3MPPw3GcH1LyLNmLWNh+QkyojLrVlXt7Hb2RFDjE+VMCTwYSy+Dzw3q6kUo5VDLvSOAr+B5DqYTun1qg8Lxbi3DB4IGaj3+XifnQTD5LeG/3luB2x7Ggl6OBPbZwcRzuywLgAkfeDiVCqEEns/mgtCFFGwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4EVGE6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1CiB3Nj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIpA1754418
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+qSzHrPZLIcegIwXCxSbL9utxNx2NUsdPB6ywBdPMY=; b=h4EVGE6CPcygfKJ8
	J/ppWPnDwOBiqTIwRNMgaubFk3tCr4lqdG8L5H85zcRFV+s3H2Y4dXfPWRqKzZH+
	ygq7yuHDuxKl12II/s9PZTQGAnvsxAvDMSRJ2q/6aNfloFXw64HoZCG0ZDZJ19vk
	d7TpdkteWu9iWjA+rbalfRH0okiiqoT2A6R4g6NIEMBhrZDTFo1IeJaHVPHROaDM
	OvbEZZNTWeq7EWvyHZC/AAM9H5OjkxIegBMjQchOEDox7RC7E5SP4hdP7YzYhdpa
	H/J0vMo/KSfgy9UGExB2XG2aEK9Ok6IMLif4W1H+r2CZ9IyyuDM6eipBTnD2FgVf
	Zf/oOg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27334qd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:36:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c890bac374eso3258149a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711418; x=1783316218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+qSzHrPZLIcegIwXCxSbL9utxNx2NUsdPB6ywBdPMY=;
        b=a1CiB3Nj22ItZj6GgzZfHu/47G3nBRR1m/QHaJhyK0YID992+BzE1favQXB4RTkKdf
         oi8komVNWMNVh3BRWY/g0v524BaIzsIj1dxWX6rHpdZja8JAKHBIhAy4xPgsccv+DnzJ
         PO6BSkd3QUQZGKkJCbRfX6Qz+xe90aMeb2tk2G2h1KxdVBY7a/surXplTuH4X3no3GTv
         xJXfBGL5j+BqCDun3xaEFjlPwwVKWiFbxoq4fxZl67svwQfnkSlz3cF4jNrHbIyLLypE
         48U+fYEPmPdsGw1Rw0Lw7RxxOjs8CH0CpJ3EpvMOtuSkY0yCarwvNXVFUWzYj1BvRIu8
         8NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711418; x=1783316218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+qSzHrPZLIcegIwXCxSbL9utxNx2NUsdPB6ywBdPMY=;
        b=D1ieyk+JhigxBafc4VOj8bUoSFA5NhjvU1iL2EQhrohD/Khq2TUFmp79L2a4tKPNGh
         7PGrWzOU6Ot7LMEchG7PBPB7z/n9Jhzl0YhsE6fIGxebApRMutzzTVEynY8G8dVBQv9g
         X82pj1KhfVITlt68u+cA3fkkFl4TyEqopMa2b/vZUSDmKUa7X0nDg71qA5CzUWtsq9ZW
         SOan3UVTtO0gisUstzJOVxxNIS2yzLYFSiOVrmHf1NlqFRMCtnZl6kj35q6vltP05w5F
         ZM5zm0LZdD69AXZT1PywHdjlRTTcvCkkRoFptyanOLOoid+hZWvILlbXEftejuJi4Dkm
         +Peg==
X-Forwarded-Encrypted: i=1; AFNElJ/SJOs19btvP8RJ+3Ni3bbwO1pj8nMhBfJ/ETdvWZoR9p82q5et2bsVq+z9/4T6oE1f8XvUywyt5fdwQuSa@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGTNhGxvLoDYHzX7AmHNOUTthRJqJqCXProXXqN8ew+Wok+/O
	ovpmDadTRvPGwblI4Ps7D/3wuPRRHgK6dIdsUEue+19LF5FyWAdfX3q0VF0kpBYlDSPB2WAx28G
	fwuHmfMvLBCgZZhasl8zG0UZ3oUywemSuqUbHTQQ+5ERMOFphNOr4athsVj4AKgS7c9mK
X-Gm-Gg: AfdE7cmk8gWxDivVRohppRBLnMNEc3XoQB5/UNzJCO4NXf6MG44N5lWwr0Yueh/9zsw
	sDM8uiUuo6YUU+MtY+Stvf4lLVp/zLKdipnBoohKAJkVea31+hg7qrEe5C2YkntfsaJpq/mgy7C
	YdBwq5Csj1HzqvOJAxFqNyE7z/COjp+xnMSHRIoACZUkYs7V7fuIU55qg+CvjjJh5rT0E/6NJ0e
	nM0GBMP2W6+yf4DTBLfi8q5tjGqv5CSk3wPZ4KbU4YqTOT4nocpRChF3AvOwTooBXOzzv6Czaqm
	zYRqmAPx11xDEVleZTM6ZLkA1H9M9A93kU5pQqxPDdEudIKzo4AX6RG7GUklPnqYdkpN/zrQTie
	xQbnzGS8xKji1w2XgcxOr6xpaOnWsc6QkLi6wpaBjDJjB
X-Received: by 2002:a05:6a21:9984:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3bd4af44f93mr14859457637.33.1782711418510;
        Sun, 28 Jun 2026 22:36:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9984:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3bd4af44f93mr14859429637.33.1782711418079;
        Sun, 28 Jun 2026 22:36:58 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0a90sm7143143a12.15.2026.06.28.22.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:36:57 -0700 (PDT)
Message-ID: <afb7e30c-c9c8-49d6-80a9-1aa9671b3a03@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:06:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
 <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
 <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
 <CAH2e8h52YaKNHvX11HheFAK9XJT9KREQrQ115AOEOJS22UWV9w@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAH2e8h52YaKNHvX11HheFAK9XJT9KREQrQ115AOEOJS22UWV9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a42047b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-sOukg-g24Gd-ASWQDMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: zk-KgwhX-HkHp8-rzSLwURpTq6h4fp6E
X-Proofpoint-ORIG-GUID: zk-KgwhX-HkHp8-rzSLwURpTq6h4fp6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX6kFaL1wskusA
 WWRVhPCTUzQv4/28rACVQ00ZiW29EW1ZFdjNssSzwBran8v6cd88pF9tno8+b4oTxaqBIU2B+LP
 maMz2HsmnS5n2VnZINWbnx8d+DzcE/jikb7SniVa5qkDsSfhUlLFobV2KQzyzTy4Vln7/EZekZe
 C+oqnUsMCUbvQu4WN5ZmcnGOitzx3wtpXH8e0y20+R/4vgp5vs8T8mEEP4g4gzp83ZNJGp6CcaJ
 hD8qF7b6lrSkIMEPlydshR1x5sn3AjBJEXs5nPAubMxp9RUuvDR0KNdWtfr058kjHfKu+U0ww/B
 w7mQ+kVvTmecj/2pk8AkwsfX2ry/VlCjWblYblYcVLT9wEQx2ga78WgBobefStaVp75p+QmUdhR
 /cksTI+qMeKFp20ceTrI5Ve9YMlVK39ydwmTocNeHdbeC2mAqgbTqdDN0VRjynuQs6kdpjIIeO6
 /xkXyj4Rj0sBV5QxMdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX9iX8u/FzlsYJ
 DBMSdkVJ/riE+P1Keh+BdeBUHhuPYE3Uyk/XH25I+Fl4gmcbSP85HFyIK3+QbfZ6GbPLlnMMgHk
 taw0EaTxuF/UWXZ5Pvk7qKL9OudLrw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114842-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD5386D6132



On 6/27/2026 10:52 AM, Pengyu Luo wrote:
[...]
>>>> This hunk is very odd:
>>>>
>>>> /*
>>>>    * in case of failure to get gpi dma channel, we can still do the
>>>>    * FIFO mode, so fallthrough
>>>>    */
>>>> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
>>>>
>>>> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
>>>> you have any insights?
>>>>
>>> GSI mode is preferable but if for some reason it fails, we try to continue with the FIFO mode. Just fallback mechanism.
>>
>> So, would making GSI the default and FIFO the fallback option
>> sound good?
>>
> 
> Yes, I have sent v2, please check here
> https://lore.kernel.org/linux-arm-msm/20260616122605.668908-1-mitltlatltl@gmail.com
> 
Just Reviewed and Commented on V2.
> Best wishes,
> Pengyu
> 
>> Konrad
>>


