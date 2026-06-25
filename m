Return-Path: <linux-arm-msm+bounces-114462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cWxUDuPfPGqgtggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:59:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741C6C38A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="QyUc/VMk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YxBHHCxu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D1C03001859
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5113749EA;
	Thu, 25 Jun 2026 07:59:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197D1D47AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:59:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374361; cv=none; b=dS14Y54T4geH3MRaCDmeoVIOlBAQexs+RBuVTqivTZkK4h7ggHePxyRmcrPv14V9TTRI+YpaMJ5n1KpL0wqT575PgG627xB65tjUiqmw3DV+smq7Se1/r/jb2bN3i5VTKh2qGRWMv/TaMgI56OEfbMJKQwinCPuVe96tT7Px3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374361; c=relaxed/simple;
	bh=z/WYgAPYjwAq4I23XYwEmqwh3cYJlJxhp2py1iXT17Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoCflVqg5ZhJ0NSHLm+jKCO8gesHeg/zWsKi/wT7t/+ghZzo5SFQ7F6ymFAka5DI8VKzV/63xj3ZxECsGHKC3alt71wbQSOkewwl/Vh7g9VzCGZexLbkmzX4tnUrMxFeHa3qzQMMQjNqpW8Jj75ojnOAjvajD0p04M38G/DQG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyUc/VMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxBHHCxu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P7SVk22763072
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bt52y0UxYjJxGefuoc5i72x0TXQgvEF722OpeKsWqXs=; b=QyUc/VMkWOezro87
	GzYLcaU76xRkzFuqv1/JyXF6K1s1nl94FasXPwSZHvFTI5F0b+udy7aoGR3bxw8Q
	fkXHt9/43wd0pmpdIq69xX5cB/MerZXHZ3BFmssDa1bjbc9/1+0EWU4se5Uh7EOM
	wzRWyW75R0YpPVOX86h4J6jURLzKzBv58DcUX9rETq4SvG72p3m8MmBFrrJ7gVtw
	GfPg7SCwU1N9eky1dwf1DBN4dZvsv2UasotEfZRNMDj5xMWfvzibxR2z67ywoILF
	Rrls71YMMj1hfIUx7NI7pILQ3+a7iS9yOPoLpRM++Q2F2C8qMFtAVdTwPZGA3vdi
	vh2jOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynr3sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:59:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b12d7bbso3613101cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374358; x=1782979158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt52y0UxYjJxGefuoc5i72x0TXQgvEF722OpeKsWqXs=;
        b=YxBHHCxuQyhPrVId/jrGuHOe2MLRJzga65SYw2YWSQOTYr/a3C0xfB7F+UF4sKcxnt
         4gReACjtP3uPWl6P5gG06u3+wv4dCUCJTW5/wSXlS6EDeJhYadvXWFMils7oGusN2QJn
         odmNSPT19cbbV9qQgFqMy76z+3haZnKOjyvQZpHIwhe1EQkNwaq22zfRz5fyuGK7X1Ed
         6ugeqwjwb4cXeGVDs4O2PsMWku7h2PbQqjGnFJRn9GW4oa20KJqDpMPoSUFikjaEGwda
         Sai2wWysmcs1YNaFiRRT6dglp67WhuIbpQTsGjqqnrtVv0D9hVQzYNktfng91QiMnbhA
         At8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374358; x=1782979158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt52y0UxYjJxGefuoc5i72x0TXQgvEF722OpeKsWqXs=;
        b=BJOOlHxu59rrhWD1pGoKAsl8wd5mDB6cmrzS3aKFAiZGrbi9vFzk5yY2pPrUaVJJyK
         6RGWXZjiOW9l4GDjW+KXSLMvElyKOqqTdZZxBNAPGafkJ7ut+gB7GhrPoLb6GVm0x/Vv
         PKRIovWGtaxmSHe4jedZuBzqgDzEBsC7sAvM+PMFogcoyfhV5Y0uSnglzzOJrp0fVMSy
         AQK1L5sDwCJJFx3u77jLts007W3wNHE64J26XK3sTKiv/UQUDzscLzSo6ELGYiVZ1kAl
         ERUlhMyBCjgTMxGqW3FCgaB6Hgc+9y03He61Cg4e1nkZzvjAvbrWE6pnSfgNp9amDUQX
         wAVQ==
X-Gm-Message-State: AOJu0YySMqXH7KNQx4RK/rc+lSDOOjz2vuFibk7+uColsGkubuoB1fbG
	wj9weT9c2cSH3pN7lUqlER+vz9JSEc/SPf8XsVUPnqQ55vts463dsbrDogcPgYI/bohZGlq6QWq
	PTwXA2qJrpmSWC4xGfAa8ssWfE31j1nuDtUibGbapgxy5dV9OHDtqwMMbG1aQhBiJtZrr
X-Gm-Gg: AfdE7ckT5ZDxkQaKIlgGkiDuIR5V/8VPEIVrnB4EyOKIkwQdk9SbK/SGaiu0omg9P+5
	wy4Q1GDyi8tPeC67G5xT2sX5R8DPWM22d6xnLqvvh8Tfw2PYFGmREVpbiboK5axjzFdKlkHsc1u
	CglBM2sxZfqM6JyO8H+HtXDHznKLuJBEAtXZ2Ti6t6xNg/yFGJzj71f/zxqgOwyHRrEfz5PZQSt
	lBwmQ+ikAR6ACFvxWouBqIMwJ0hakv8zKTJdUNGucrpOjfPheHNhJotJZhxn8OHxy8NcqMm5SYk
	nh4o0XK2p7Uc5CvXY5fJO7QbQiWhkmo+X7td4b1oMTu5YkNNhQnPlkE4DYYOldo6Yd33xy/YjYo
	XNSCUGxP2BwkadmAFR9Q51nVaXwFTS0bAquk=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr10403591cf.3.1782374358295;
        Thu, 25 Jun 2026 00:59:18 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr10403331cf.3.1782374357864;
        Thu, 25 Jun 2026 00:59:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe5f249sm120328866b.50.2026.06.25.00.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:59:17 -0700 (PDT)
Message-ID: <765b17f5-0ae1-4efd-8af4-9f9411862acf@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
 <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
 <37f34aff-c68f-43ca-b23c-500cc9bb119e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <37f34aff-c68f-43ca-b23c-500cc9bb119e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX3cMD8xO63qAa
 HEV9Q3ckN+Flc6kwAD6lKGSZbYeyDA+vz/PJnwT3fGwbd14kqL81TmGDKlGEhBX0szNuDEzQN46
 XrUz0bkGPCevYqKpaQpNIeZD0HqTwyL1IwLmkVcu2rjlUNf/4NSArmc2Yp5EQ+ognIGRSU0o3nI
 xrPWf70LSoHNiwEHJO/H3uhqroADHO5pam9wN6zT0qrs6ONMA/6MVYiVI9DuBgdOLQEyLPW+jv1
 WYVKFkmfeLa/lHu4DT8NqxROri8fA70EBTJflmMDUSsQL5uhf28IQa87STH7hapZQzoZI85LC9M
 cdWfJ7RfQQK/siBWC9lNeGkmtHFSiMyemwQQBOvt6lHJaIFQjSPXU96bU6NUgK77p19rrlDmhrN
 CNeiuQsuZoNuIj86YrUf/04iTDu2HVa6h/GQJA/Apl/MKvsFz/AWnnU3NGNlVbIdI63H0IcSd07
 YN2gJOm61HyRQHNX6vA==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3cdfd7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=isb_plKU-JZBI8JTm9kA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: q8OJ6cctQCSA22TfnOR0knf2wC6pclZ-
X-Proofpoint-GUID: q8OJ6cctQCSA22TfnOR0knf2wC6pclZ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX8FSnBIhW0hX0
 QsgvEridJpVujoymfge0J32TakenfGetDaU4+cYDnEO2lM5QFKf2WEvrNP71DTDAIOwCjjT80t7
 wpoi7lF21LAp6CFAexf2Qg985T/lai4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114462-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8741C6C38A4

On 6/25/26 6:33 AM, Sneh Mankad wrote:
> 
> 
> [...]
>>
>> This is a much better commit message, thank you!
>>
>> One question remains - should we set skip_wake_irqs for MPM too?
>>
>> My understanding is that no, since the MPM HW is simpler and doesn't
>> have a register for acking IRQs, so we need to do it from the recipient
>> (TLMM). Is that right?
>>
> Yes that is correct. skip_wake_irqs is set for PDC since PDC can handle interrupts
> during active time and SoC sleep time both, so any wakeup capable interrupt source can
> be handled via PDC at all times. However MPM can only handle interrupts when
> SoC is in low power mode, it does not have the functionality to detect them when SoC
> is active. skip_wake_irqs differentiates this behaviour.

Thank you!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

