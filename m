Return-Path: <linux-arm-msm+bounces-118664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PbQtK0aYVGogoAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE574857F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ip+vZ/my";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NrlJFv1w;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 898FA305D6C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E38C3911BD;
	Mon, 13 Jul 2026 07:43:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D2439098E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928603; cv=none; b=Y2d/xkaq0WuUFNjavddIUs3nb00LgALt4ZR/YW5xPXrz4d5KYOpX5Om1WPT0Q8KaWf9q7A4jKcDSbc6q6OO9e/cCl1mzfXqOM4XGpmLUKZFxxAjv377+NhB28zXTvDE9lS4OnmMii1uBV35f+h+jYynkuPvR2sXszSNpGDDwB3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928603; c=relaxed/simple;
	bh=FYd/97fPU/oF6qcbCDo8Ty9ic+TufdwScxpCHOV2wVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AacHFWDE3PRGm4kx39YxHy2A6vf5y0oRlwLaaueRsKkgDcAMKZqzYhLFmD9sPojqKKJ2WiGZOM2X6MqoKYWviRitkGItHiHuVdYLTa+gjpOp2/mzUZBk1SW9wSVStlek6RZEwMqLbwjhRJXFKoDHPhde7A3M4GcgIMav/wtd/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ip+vZ/my; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrlJFv1w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77O27810510
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=; b=ip+vZ/myfGU5dDrM
	rvTPdqcnjndtmqhNEi5MFsQbW93OwcMQUwM6g4CIPpKcPJdt+ZIkjoEFPYmIma4G
	7bHgYLwih97a5mMz7iO2Ez3lG4FKSec+VGWBZ08MdoMOw7SyNsYd9IeWF4p8zAbK
	pZKj748Hpyun7KPB4QLy6YMIX/Hzy4pUpjUSoiU3JrEdpxKbR33wsDKdC+4JUeOn
	pib3Sk1ygg1B9Z4c+S0Wt/Puvt2sJr1VdOpR49tJkbfLqknBnmOwT28xZXN3lzpH
	GLvfq00GE9xKVOU9H9IFRnxqyCYj3g5ym1xzkJC8FDzWdTeSzZsUK2X1KtbWEWNX
	2HDWEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsr438-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso57041101cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928600; x=1784533400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=;
        b=NrlJFv1wA/HLWfKdBFYaqRLNR+zsVhmjulAN8EntBxVmx0G6QQadxOCf5qFXomfZTq
         bd0Hrz/20mbj6nXsZz9J8YBjNoj+RSkI7S9rm6FrTEhvqs2C08gJMNdNJOGqaX0k/ed5
         inyHVQXGzaTE6PgiuX5NzB6/Bpl3/J9gEnrqU+v+ux0FoKy4lvSPIloPN94ENbb+Yc6T
         y7eLAxg7J6TeTMxagHuTTwL/NU7hNM/cnxzHs5vPquKMc0p1CSLTVYakUvqkKgmlGksE
         sFX63/XtsSYp5zQg/rFHQJp/gXvuAnvlGgneoNrOxW8CD9Lgf6spaLGV7DD/7CBoitAL
         Ls1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928600; x=1784533400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=;
        b=V8EEOV8fKmQ53kSmYDPOMOuMsi9mYKSJq1+FdIjeArxA9nm0jLdHBiRfc6WFrEdhru
         PtKwBejU6pB7lEDH3IEGpFVy3e5n4W/yC4R+Sc9UnqmntlimMddcax8b3rWJOQYrF3i9
         6Xm9uiZaCP/GVM1vkHNgXL7pOHSIQx2eVEVWASeDQGL4UUVFr57iU9iCEFCVY25o5V+l
         Ok7RZZZqI6RbZ6+YrJLn3E25mcV20F9Xegnbvi982y99Myw/hccqIGP9fo5D+AAQMfH4
         9FJFfuJ0B/t7PBdPNb1BJLtudzThqhGGQkYamn3uZ4MYwdNi5jPIT8ZT7+HMNqWnDm4B
         +cRg==
X-Forwarded-Encrypted: i=1; AHgh+RoVFf5kox+3JAZaX2DV1xMt/JOwtIdBwbsNXR/QraKTVrmq6BOiILTvwlfSb1JFglNqX17ZkciQbif0Ijkj@vger.kernel.org
X-Gm-Message-State: AOJu0YyOfOqmamTGCxfnyMjX6OSt2OGDi5B6uDSc/VWos+JeO2dQL8yE
	A1eRkT4V5T2E4uZLAVXbYNKuhK/MiwKc9fNjzWct7FyjXXatLnBckXQf79RrpjWlKRzY89EQxYR
	a9zumoXqaVhPFRJxYAyKwvbP9T7sAHd7SSUj7YEJWNjSEPflSHb05y+StdVqUTRVxZ/O2
X-Gm-Gg: AfdE7cmJHsFVvTCdtNy1ZopKedVGOokmY/DlESMZW5X1jUl4jilXu4YtbMWIDB1RWnk
	P7nP35dqXknqRY6ebzxijbYsEVscZumwmIuKRN6yjY0TyvFvbGkMG8pJX8ynPejeVJIJsjPJiYN
	4K5y+P3kZNnZha+hQiox70xf+VfE4/Ah5kle2EbvovqG1n6VhBoPSVj7o6Cl2eJtqtyErpUx6TT
	6BvRqhA5H2h6QxOh02PyLzg3aXwxah/xKA+MppzdnSVHA8/eqVnER3wMrji1gVrAOtDxWcj+r14
	txneChEGyqaoaxRqicYGCGPZA9w07OQYxtzMHjir0RGANV5zo8ov1Xp0r4yjcMKRHGx+3UmiA6g
	g4QD1/SfLBm1TzxWuMUTYKk2KrrdDoCA2rNIxjdxJDVM=
X-Received: by 2002:ac8:7f83:0:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-51cbf2ff090mr78433811cf.72.1783928600125;
        Mon, 13 Jul 2026 00:43:20 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-51cbf2ff090mr78433721cf.72.1783928599745;
        Mon, 13 Jul 2026 00:43:19 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm940679366b.4.2026.07.13.00.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:43:18 -0700 (PDT)
Message-ID: <891bfdcf-f7f2-4f7b-bbb1-25c641926f9a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:43:17 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
 <20260613-fair-ultraviolet-dog-fece5e@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260613-fair-ultraviolet-dog-fece5e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a549718 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jQIKpJ-_qqBQciHbE5oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 0yU_E4wq9gJnfO2lNjxTM-DZ-NqIb6UX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX7cbX7bIruvhJ
 +nqKiWl3HDzVi2rSVBiCg9fuZHi3ZCej0j/Jzj5HchrNZXuOHdqqgzrzcamHns9ezMo34ZiAhIC
 TQJY39DKvfkdocMryiEWiz+3pNeFTw0=
X-Proofpoint-GUID: 0yU_E4wq9gJnfO2lNjxTM-DZ-NqIb6UX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX00mmUQZMhchh
 Hrw7rW9G4YBfwZUSRS+1ukVFIsDnMlbHTjMvd0cvpeoFNpStX63JkfrMrca2eVMO/vmomhvU3vT
 ngS5mb6qv2WLvQ4iyRicj4SV2lpPMKODT2LGtrHRJ+i/+ALFkrzluiOxIkfDOeuQ0ko6j9ShR9r
 aTakMcipKrOBz3WKTeTCeFQTSDUcYn37/EoQpFoS7eIeMR+8sfHUdVrvyToiSmuHGRNlW/TF72e
 oJXCJyS30EFwfAvsEzVPoQDKc/Om2FNgoBz1HtVagtx/WEzrSk0jltTjd2kQh3Wscu9RxsNqJOr
 ozfPPgoaY8a7SEFoby0RATtNzP1dpQdusztDa0hlNOGWHzdVa50cr3H6ry7VJ1po+152/RdIjWx
 WiTONjOKT9TEp+rLxFIwi6+YhJwqZU8kjsOouCTUqGROoj/brsUEZ7Q7QciO5jXXDub63edU9YA
 U2ev8kl6Wn0Yy7eG0/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118664-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00EE574857F

On 6/13/2026 9:42 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 10:44:14PM +0300, Atanas Filipov wrote:
>> Add device-tree binding for the standalone Qualcomm JPEG encoder
>> hardware block (separate from CAMSS media pipelines).
>>
>> Document required resources briefly and scope initial support to
>> currently used compatibles in this series, including SM8250,
>> QCM6490, and SM8550 class platforms.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
> 
> You already sent v1 and you received review. Quite a lot of comments.
> 
> Please do not send duplicated work, but address the feedback.
> 
> Then version your patches correctly, so the toolset will work. Sending
> duplicated work is not making the review easy.  I am dropping this from
> DT patchwork.
> 
> Best regards,
> Krzysztof
> 
Acknowledged. That submission was a mistake — it should not have been
sent. v5 addresses all outstanding comments. Apologies for the noise.
Atanas

