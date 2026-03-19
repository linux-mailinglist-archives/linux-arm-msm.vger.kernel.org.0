Return-Path: <linux-arm-msm+bounces-98746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OpeLJ/zu2nkqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:01:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570602CB984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 010343181953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2B0238150;
	Thu, 19 Mar 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeFGKZvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFork7kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2E18FDBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924914; cv=none; b=BM41P8xA8BXKT1u/uoxADwa1QBH8JOGl4kzD/nQ0lNSmzlx+S5YszbPgPbbKUEQz8OedjkdohDsJ+ekJUA/q+JOTNTCXzfay0IYVbuMVG4ybtAwEAbkWc5U9c5i8OQ5XD/W3xokrBJ+1Wi06RVQxFETb/gMI4S1mJrQUhUT3auw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924914; c=relaxed/simple;
	bh=RXlQm0efLSVgfVyWZEFRztm0W8BgSdJY0Xk+PC8y7RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENp/9JFW74rKfrElA4+pvOx6+8fziWquroTo3Hs6lWvu/xy7xK21gDmBNbkWLjplmJaBwmYtyhl5s63HwN9ZJ9S2qYm15WReKN23ISNBHn2nMEWpAZJhBa1sQgm7GvSsmdwSNf5Z3ghuxVTk8I9IVtVz9XbdqQExmFMgAfeKrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeFGKZvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFork7kq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73sq81567058
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=; b=WeFGKZvJNHRH2mpg
	CW7azge42SSmeF3rypJ0G3AlZIGINudzu3IvoLqoha94UeAKkg8SDvkgcLxVZ8X+
	YSkd7dD+aAhaExmLBbdI6KInbsv/6KTgH/CPqQRb67VYRup4osrtm13QSC9UpZEG
	QoEXKjI+Cvoci+LnBdvw9IkEdCpaEGZWl3Fetw0VAqOm8skak2ofgFwsBDUeuGix
	a1fZW3yIjUhFaK4nOc8EKYg67QJMnukjIyf5JmWAeMyB2DS+7i1ggokPdoahWd0U
	PNr4V6dcR+ALM3UzlJpUW66nxxKEwgaEx3FW6+zDqPbJPGZU2BWcTNSAmGAfNtnc
	2s/83w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxhcrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:55:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31f391b8so1385611cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773924912; x=1774529712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=;
        b=GFork7kqRpoUjOHM9JiuyFQM7hnLelgiORLGR8LLTWxcbfVvX3lXblGPmUL72uU7Da
         SVsm+MyqoWxQageal8vCIP9omY0sINTDacu1q9JP9xlBsk0bVgU5H3ApvHXxWEgiIjuH
         7iXcNu7yNUAaWPL5+efAx21vbE0UDp/XX+vXyQHtYAYzf1+k1WIjeFt2o5s1ffObhhL0
         nza/94pDs1OPzR9kMJo5XKjPmsUlfIl8TsjDpjzt1wkCP2oRcS53TauP1vSNJXMbFs/H
         W6swgz4WCAjli5nlA58OgC0YHZzdYxSS9SZjEK++XEP8b0vfqW/mG13wKVcwzRrledB2
         C8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924912; x=1774529712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=;
        b=VIGSe93Dy2vVUn35Wrfqc8EEtng6wfQ4gmuy5tgr+09HBU/rKDnvQUTzrQerTZ8VMS
         TkLN/XtiHzvsgpofiIhE4KW1WlBmsl30KNgZI+nCpiclxGyV5Dra8vZedBWbyV6ilmmx
         107A6YQKe2nwHEsgqvd0ssajIVVApifE7j3upjEGw5ncS0+pC86KKLHkvvwZnbOPUa3m
         Gr74Z3Fos4J+IlwR7IkRHL6hEjAANNJoklE6C+1aZ6isR/l/+LWSBUQmP8evPxTJB3IM
         fr0iLb9rApH9eTMCWtXcfBVruBuTcIkxhWMRWFZKfSSddE2SpsixPniUeFJ0HlQiX8/9
         BbMA==
X-Forwarded-Encrypted: i=1; AJvYcCUFIz7MoBybe/FON+oBgiu7Y7nwuo7aI/gGrvD4+JKuMcbUvK6yBtuJqR1Bfbg7+rxfd0LSWHAV4d4w+wR/@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJ9A8n9O6aeex0fcIInxbOM3964owfOd3txt4nWNZYQJIU3dp
	VnPu8NbxrsWbhbh4NuOI9fNKbyTxGYaM2QJSnHjgkW2X5XzpPgBZpNrJlEf/5pc1wWYhiR/feaT
	I0F7eCx2loJb3aN5j3XOnuhR8M1NosIgyJZEpb5vuPJqj+rFCZMfdvAzWw8e1ePg89KKX
X-Gm-Gg: ATEYQzwQf3iOvxp8DYj59wnAevS7c/LR2LblZOBTyJVkBj45ZDJRwz6qOZe8SaA2qF+
	nOPTPdoYeHQqxbIWw5FfesJ799vsi025ZDo8loEVikoWj+1S//sC9vHrR0eBdBU27pM+fHn3UTN
	o8MRlLRomLjK9cEGy0LVFpIDiuZ9rXheKUSSt44iJbUFnrcUZXQ+0qmBWBWEqikYnVUVzf62K7V
	K6jC1haCgYp2tXm8XkzxE+XyW++y+Xn7N48/i+M+B+Swvalc8PbnMrIir4AZArtGBJQqaRED98M
	SYNIXe6QxjS1OljNRWXl3JpKcMawYvH8Ea+sJ0ZSh2CBf4VQBeOxKjJQyxAzqs4LlOh0W5Z3B3t
	LVg3+JZog8uctk4vgFZwdWkjXe0g5RcUaFltCavwM2+52i8cYNUqJr+lcZd8K9Zx26SrQgwq5R+
	N0i1g=
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr72476061cf.8.1773924911867;
        Thu, 19 Mar 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr72475741cf.8.1773924911450;
        Thu, 19 Mar 2026 05:55:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1452214sm428778166b.27.2026.03.19.05.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:55:10 -0700 (PDT)
Message-ID: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:55:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfX6Pc0LHqcF9CT
 qe0sntkMIkQJDxsDtJlJy6p6zvpTrxowLR7QGWd1+uagihtOloWoJfWoPVg7WuW+MJnP5Hwrel2
 Jwni4GAU3O+dqCw3H6K2KX76P1JgfLeeYGTAKtcmX9lGt/k0gVgqQszuxGwabmAW8p/a72Qf8IH
 ZdYmQnwW+5Q7T9jchY+hrbVcnTHkF8RCC0fr8KIc2c1Q5jfxw3IF3n6McgSIsatOxuOr4Pivxpg
 2J5vAljO/bHqYh7DsLPOzeT8K1sCIGxkCk5LXwZP60kxo9h0PI51kbkllFBkwYzFzC44vQC1PVZ
 0MJ8iuBtUGP0VIvqtanac66NOXDGeoSXf+3Lrtns99Aej/1eaSWNLGZgMbLDpqH5hvK3btIyaEd
 kJiHkc3AvxAo/XKWlGclsiu+Dy0JIf87RAHR61UT1GNmaaMyfQEeKwIIn8k1EKZRRdKGJjbmHAh
 v0syynJeffiDJckOWAA==
X-Proofpoint-GUID: vsBvAbVlUu_TJ0qnGVeEN8dLhRWg-SJP
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bbf230 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KlJgg6mcpdonUnbyTwYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vsBvAbVlUu_TJ0qnGVeEN8dLhRWg-SJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98746-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 570602CB984
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map gpu_cc_eliza_resets[] = {
> +	[GPU_CC_ACD_BCR] = { 0x939c },
> +	[GPU_CC_CB_BCR] = { 0x93e4 },
> +	[GPU_CC_CX_BCR] = { 0x910c },
> +	[GPU_CC_FAST_HUB_BCR] = { 0x9428 },
> +	[GPU_CC_FF_BCR] = { 0x94b4 },
> +	[GPU_CC_GFX3D_AON_BCR] = { 0x91dc },
> +	[GPU_CC_GMU_BCR] = { 0x9358 },
> +	[GPU_CC_GX_BCR] = { 0x9058 },
> +	[GPU_CC_RBCPR_BCR] = { 0x9224 },
> +	[GPU_CC_XO_BCR] = { 0x9000 },
> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },

dead code

+Akhil is that useful?

[...]

> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/* Enable frequency limiter irq */
> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
> +}

..sounds like it

Konrad

