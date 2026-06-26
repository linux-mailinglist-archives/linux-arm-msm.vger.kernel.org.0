Return-Path: <linux-arm-msm+bounces-114700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KkICDcmpPmqoJwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:33:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25536CF1F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FM4mhbI9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AbzeEDNu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7468E304590B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269E63FC5D3;
	Fri, 26 Jun 2026 16:33:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45703FB7E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:32:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491580; cv=none; b=QNV91PJvSvsXaK/LKN56t9JulnN2VbBdtHvtQseyWtDPpHaV8VfdjUbfhsu3TidK/A3mK3tjn/+HrlNy90Y4G54+39Hc29Vlb4CpQzTr0jMJWFS1eSPi1vmLNCpJmZc/kDfYKAGH0GTi1DIDPwFSwS5n+apDw9k8RklSwA6DcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491580; c=relaxed/simple;
	bh=FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPcd6nTBVgbM+Xl+tnC2cyVSSJ8V778cJucLXvLkA9nE1No2j0hUXcClHT4xWX0B6qTsgqGzsuxL4HxIIdsALWxf0MEwcZ3jlbEhI0Vzli5yA4yDtvB+ZZJLPeMW0TDWNhjwWhmr+kXUjOgqE3OqPeisLOD96caeFFdJwbzkyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FM4mhbI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbzeEDNu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFieFs4064275
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=; b=FM4mhbI9KylaQZMF
	/H83hA5OenX/FEyy0XVGhZynfc7VYq3huCjVECWKpNvqkjhwS7Cyvp7F36VDfGr5
	7Q5ElohywSAjhY4A0alTkIktVTFx7Yrhqhy0OE4O07gIicSrtc3yQL+tSYef7Rsv
	3mKTmaXQSMZK1X6QtzNXMz1glJeylwHJq7M4sS8YdIYBfPEtyP5nrRT/LUKHcE+3
	3Hf2YUV1+d3bm8FhM7X8GnkNICcMmzBeEL9ZkGH9Ljbke6d5YxHiKwcULLlmrlvs
	xDUthc2NKklmOg2PX3q95Mz/qlGRvY8tTRNb3I8RCiipW0kC1GpZDLphbjF++IMv
	eqcoHQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups8ava-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:32:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd7429d90cso50323e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782491577; x=1783096377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=;
        b=AbzeEDNu0Cj2YKDWmalw1AQziwaB5xFtajnbZRBw40uc7uYJxKKViulDW2T2IFJz3H
         ykWq8phgTgxnhnXXcNsEhz6pioiH5KAJDl1inl9RpFQ+Laoi5pvvyDX8X9bs6oeu4C3P
         Dtu3JtFpWA/YJzxyPNc/HuPEOkP7KCkzI89S9cX8vMM/SwKujOyScMGH4245e34ZwEeW
         Va4+iZTWPR+u553ECv2QvIIl5UCVNTUF4q7X2P8TkFIe8evyp5tcbUEGapMAOQX5iOlY
         zeuVniiMjDOUDDDWa3RJHUFHlK10GVXB4z59hZ/4M78+BBy+plD0fJGUzviBqnvDkndL
         wDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491577; x=1783096377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=;
        b=NgNHnrAiT+bQS3iYksa0dTG446YuiPvhA7S/HYZUE7FGtlAhifFUm79rxY5X5jVkbD
         Oi1vRGyK/oMtfanba+ZV243X7glGlW/rmev6TCIHwQT5wGBFyJWoNRfY4jBK7oB/khFM
         RGEObDnxcrxJVVqM+wQmswpzvfTX3v6L32Xf63u3Rbl2Vb7SxKzO3qwW7MO3UCPOjT3f
         +VHra8mn2Rl8WUMzTHdcQdd/2smb3r97ChfFJ2di4L+UiSKt+0njhdt847pu+bnOq3rx
         OSjKPH+whbpCx0hDTHZr9EKxrs2aLXGa15nMUBfzlB56aUS20QsQk9k1DgPjWWptA3Ej
         WWbw==
X-Gm-Message-State: AOJu0YxHpGUe+96ZWehvgVjqtpzLclLC0JwsI9ytIQKW1k1TBqG8Qmxh
	r/Oq/n8urpS9E/KA1jinY0CVLzpOHfMjrs7hrgEpBcea9iRrkXlk9WUDrxZMOX5QoyzTec8eKlt
	KrZhLblS1CUmR9ZmY+nwldVq/zaL764krpO+trEhVe0An+DkIbZO4xahNE3WU8FQg4tOI
X-Gm-Gg: AfdE7ckJC0VNclDk/GG1/jhpNj1wdP+xEmhFDWqhoSbvJDe9CCk3r7VuSC0ql+xmSQ2
	R/PtOQc3cE3/9UWQTLxGE9VC5hABUC0jVAvrAZbKPW2jTN6Ypv6PYpIth4bDR9a+TiFWbhLQ9xW
	Nq5MjDCqIey864V5mUkVVkQ2ZKmiZN5Xpq7HueEOJrbWA32qXldQ8GZUA1ZSqndEGYBayXskYe0
	XoG2cFfv9QuOIc/m80dQ/o1P7Q94oeMbY+CDRHlW9NKqn4rVyUr02aHawhHN0dQJHlk8KqxLENu
	ql6iKdbZwgA3JHeRgnfwWXxlpG3di+cgYk9PF6FImrcbTes4dUuY9G9YJhATisFjLC6TwnjOZ+3
	dsPN0bnJWU6SBSu6VgqRMBtUakisJE7yvZZY=
X-Received: by 2002:a05:6102:440f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73433e3dc72mr1396651137.1.1782491577119;
        Fri, 26 Jun 2026 09:32:57 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73433e3dc72mr1396642137.1.1782491576706;
        Fri, 26 Jun 2026 09:32:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd44d0sm3050633a12.29.2026.06.26.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:32:55 -0700 (PDT)
Message-ID: <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 18:32:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzNyBTYWx0ZWRfX7dpZcW/IOdnl
 nw04heHLcDKOe8uvPKKczYWyEv8JQRGPmaDVJD8sEoUO1COtd7Vjr7U/EgxWHvkf9IGTaPDnAHo
 jbqvggfEee0U4gi7Movk43wkq2XXZrmqW1krqJMSl883ita1gjJGDimZdKfRmpt4upFPytzDPo7
 k77Rg9Vif4fZOHs8c8/mEhPsLQp1cKDO3+kEwdVo+UHzCSmwDXy26r3GuuBX6J7RhVsOpQn98lW
 MRonp/1E3nsMAjLFja1gD4lia8dexz4ZBx+liEXgUdzDIdDi+mcTF6UUqgQNvX8bh3Jn4CDIk/I
 uV+UfkIhLJ12EC6aE5nVl9/6xa00FA97jZV8kxm/IgbqBMW3THt5yCjDnu1blkJrLbVHS4P0CZY
 ez7TWJpoon7CNihiSm20kY9Ps9g28cb0BxmieHqo/+WiLDn+NaPXAPSOfqsKcCRmFKnlNs8auSD
 5aFSbmAimAtvSIgnpLw==
X-Proofpoint-GUID: OQGcaUoJlX8txWU8gTAj6EEi5a29dcxJ
X-Proofpoint-ORIG-GUID: OQGcaUoJlX8txWU8gTAj6EEi5a29dcxJ
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3ea9ba cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VuFW3N86aykZV0Cky-kA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzNyBTYWx0ZWRfXwNdqSv8iPDPb
 t9h7K5IS2b3qbTswusb5bcdSfjzCWYl2A/5N7gQxoIZOfU9P5lD1zv+uIoOVSpgVfvkJCma1u8h
 FMNVaSeoOuohnqkw4Y5qgiJ3Gdyln3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C25536CF1F5

On 6/26/26 6:26 PM, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
the sync state from the clock part only resolve this? There may
be a clock dependency for the TITAN_TOP_GDSC that we're failing to
describe

Konrad

