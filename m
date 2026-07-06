Return-Path: <linux-arm-msm+bounces-116676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qDuxEHVbS2r1PwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:38:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D905B70DA44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:38:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J9vIV5Vx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Y6hLtk/H";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116676-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116676-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B26383269028
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CD238E8AB;
	Mon,  6 Jul 2026 07:23:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6489E39B4AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:23:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322629; cv=none; b=rZdNx3QvbCLOiBP1BqxGbm2ri+P9EBKMgLmZt37idOQ04eoW42As5wSXlp1mrtV4o0fsrbn9Qvbdfb0hWhblStJVj6xvqWsGO4Yj5/k9kN0yE0uZlKhBFyI7Avi8mLmNngE/C/uOdZCJ53L5lWbPBELfNVeNOBYcd09J4FFLhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322629; c=relaxed/simple;
	bh=+FbqNQiPP1ue45VHFOQzbpOfAIBaspppfSJIDn8MjvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fuMhE4ysVfGQ2wHpOaBkAuLD+oebMYji817MNwL4UI3NJ+vN+joTbnVcF1ZREWtXxfbaeodKsM5H1lrhFWNya2jm5YhY2+GPL+i2HXouLbwTVI0naVdHf03wdyes6Xr/r/URpbGAQrpnhj2AniGLnwQsmN+lb2utHdUE7+ELp4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9vIV5Vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6hLtk/H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641lcS3594903
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDeEbNyNCk/FdFbnFlOXQ3KGhP0Zs8lX1We1CLbz3gA=; b=J9vIV5VxmE+QqO5R
	ALD2ikVuO0t0GLhjwUxLEqwU8B+QsctlZc33sgSzYVApWNt/DGibq0WoihhOAPd/
	EZ6G42FE3hsWHy0mX3464OvDzUUOJDPhkmxzle3jS7Yg2m/ByZE27U4WRFLfiTw9
	F7oU0pAhkkS80F4HbUsBAKzK77Zc4qlSmHBUHZ05cv1ChATBKSaf/mj3gLdja+l5
	GOQumch/XaBMllKWsqTEH9bBuKjy3Me8nTGsTnS7ODGl1NriX8b814gwS9jHpPv0
	0CysJuJDbCkpwa9WOijsmGoi9sT5XNlDMntNIaNbT+4bkQjXcKPE4MZ6MqJX0LOk
	oOol1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwbe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:23:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso4192612a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322619; x=1783927419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDeEbNyNCk/FdFbnFlOXQ3KGhP0Zs8lX1We1CLbz3gA=;
        b=Y6hLtk/HF1rAyEhfDGis5io0P734NqsZk6qM7Wmc+7jhoz0XLOTiQrGYR3iY7LtCS+
         hNrDBkmJtFkBkq88oUGTDv7ZEbeihUyRhI91s4amPk47PjpsX/Fz5wPwEFJiG9VKRujF
         VPXsa1V1ym9Z/dcgqMAoNkMXAeakOxtFG7UOdVCBxE7BEGD2a8P6dolFS7vse/KEDhO+
         l30YAP8HX8/VDGl73kTqzl42DsRi+Aw+UVCti+l2Kkr1kFp0gE9oLE6mQJRgSVTEQs2Y
         ro6Zo6orMS5NQreFsnsbL0OTXUicGd9cU5rzMXdYupTwyDv7l+TItBXvjQeiAHGnZO/E
         71nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322619; x=1783927419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDeEbNyNCk/FdFbnFlOXQ3KGhP0Zs8lX1We1CLbz3gA=;
        b=PcJaGO5g6gbtf6pupPKjphbYWxYSJgNZnlPlIVOPSIai+dW1JUWLbxJqzyy/QE+vd5
         x6YIFv6scBwPsdA/ELTHp9w49vJXJOcM4aCcuEgeuXqiZ9/OrnJ6U8NySkt+xiZTYhWw
         gfP3nlOXWcmFIwhN8smOdWi/etBCQr8ZquCdcUbjS0uMXpwucFQiRRVV32WvJd7W7vQK
         F90SHsdpqliGJR+yhnt5HHVqhDX4NNBHXcTtFbJTPCCT83TUhz8mT8Z53vEASaR0AN70
         jjfCY6R2RnO7hMvHiIvoMEMnowjeMkdKtODfvH69OmH+IjVciC51tkr477mng60VAN20
         +Rsg==
X-Forwarded-Encrypted: i=1; AHgh+RoqXZFbYtqxy5/+X8PYhzq7wqJ/CLn8TsGC7g1/27LwKWq7HLkIxLcHrVIkHDI39m6MZzyTYK/EcT6KV71I@vger.kernel.org
X-Gm-Message-State: AOJu0YwFjz8cLqul9LS36PONKFAaJ2uoIpy2kAJwhRdrCCJYn3fHzgJ1
	W1bxaWW1klRdhDh/J3ViztGd17Cq2+Z2/D9qXMfim2Gagjm+nk+8jX53tmUkKTrHhDdRJUVofD1
	v7qvyjmZqLXu6S8c/AdokdmTTnSiWmeZiOV+sr7yMZB3sQ/+/scpGkvc8gpi18AVmFtb6
X-Gm-Gg: AfdE7cm0gNHLTOsCH0gknkhxPBksZ8PsuR5lRJ3mcavVFE8Cnuj/oDsvlQPixa4IUvx
	PWozfbSJBHdX/LmWpAcKZwwa/VzxKjAwhVfDf26UbOvTv1pffX3z75duvElrIEbG/ZzDLh0TPnj
	HbdHuF6f9HzT3No4kP9NZ2USjWlb8OZIvTQ+LAU/hybOW6wtlAVLZJx0d87oeOfgY9bHYoVHvAd
	HofOg6r61MPe0YDmUOIoOc/1Z2VfosiEcxMG+ScgJdJgdvRFPKcFEriH99n54eKgIsydqIE93C+
	aQ5ifSvm+e1qsuHf4GOsFBC3Jg7EaFTGGm/jymhiGaOcHWzsXrnyk65UxFQoVZIGYAO8NCrLp+M
	LrS+CIOLmvXmXES4zxA/K4ED4q7W3yOtpiRaheSo=
X-Received: by 2002:a05:6300:49:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c03e4a38c8mr9692783637.38.1783322618403;
        Mon, 06 Jul 2026 00:23:38 -0700 (PDT)
X-Received: by 2002:a05:6300:49:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c03e4a38c8mr9692751637.38.1783322617968;
        Mon, 06 Jul 2026 00:23:37 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm5369288a12.27.2026.07.06.00.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:23:37 -0700 (PDT)
Message-ID: <eab88289-3450-44e0-9ece-7c667dd92ada@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:53:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b57fb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Txh_R78aUR7e7X_yDP4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: LwuMko1vvMNZXCOBtvZN_aUFJR9D5yF2
X-Proofpoint-GUID: LwuMko1vvMNZXCOBtvZN_aUFJR9D5yF2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX5mabUhIBub45
 cInFgDTw63Fg+vlRYg9K+5n4ZU4ZSsWC0Oc/frQkYubaULNb7EN1HpbVIkuoe8gkcuUaQ6v3X8p
 bVKF/NaGr7m9x3ZQ849jraHu213riIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX2OwtrLnIdflZ
 j7iU0KgzhKNsnSfVIXzjP1vu7mSTwwmnproN4uNzOF4etQw33CLNuZLYyII2G78xPtUjd/HUyVB
 uLgTjsqKCumv9a/lnuL+YS0YgNlYjj4dMJDLI0fBtZH6nL8g/iGOaerV5fYUe+MmcRTkFI0t2gC
 RVghD3OksPpk/aN6l87wjK8DO7pOm45aJrFhFzsR2cUwnh2iwgSBiL+A9+dOZy+DxOe7b9ZiD7h
 JsSgmVN8x6otLRebbUUnYuerhu3bxdcvOer/Nqp7viLWM8liyqDptVBv3O7Kj4E565JivRGNnJ/
 bQydIVGBXncKR4ql3nlf9QiZcLMr9uzsQah14sdx2B1ZR+crtwG1giamShmMHLqRVoiqVfg26+Y
 lnYlfe2qAIG4q+eeD78fTOC20tt/eZKo0bVBBKHRX0VeONfq8TnWBtCFrIcA6rLFPK6iVz5yhwo
 rinm6ac3OCBHBZ4c3sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060072
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
	TAGGED_FROM(0.00)[bounces-116676-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D905B70DA44



On 7/5/2026 10:48 PM, Krzysztof Kozlowski wrote:
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-x1p42100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


