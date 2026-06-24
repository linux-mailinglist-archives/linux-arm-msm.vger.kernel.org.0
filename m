Return-Path: <linux-arm-msm+bounces-114333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wAfCITTHO2rjcwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:01:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE86BDEDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:01:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QKC0rigO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cu+jLiuy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114333-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114333-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA98E305814C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CFB3451D6;
	Wed, 24 Jun 2026 11:58:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6933C1BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:58:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302286; cv=none; b=lBrG0QQrrwn6di6MRZ7sE80rQyjCq+jYcY7bXzD+KfOG1z/oCS0VX3uDQUEI66ZodY4c0btiMO37zc8ZT6evrZvZ8F+1cmvkpoOPYtso2R9l9XZ9Xt57nXWu22upCL9KedUcNcG3RZa/uBLzKaW+2WHhQRByqgp83iywTbnB5V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302286; c=relaxed/simple;
	bh=bEfOfabZA+/qtQxV7AKZPy05UnFJONr702kxAbMxXOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZvogNBf+qgQ46MgiUAK/NuypHqMHrkWgIHEQaOUS4OL+OVv7jZVT0FX6H0kU7/s+Yq2eJb74xP9psQrVZiA8cDEKTx1TNfunO8PegurGXz7wXpwviBB27XKHhFeRSwV8eUJRO921UxifkFKPBy/Ius/gRmlvl+WY9J+GFmgOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKC0rigO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu+jLiuy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO9t52845982
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntsbvnXSjYdc95EwUdqEAAUmAKUq+3DroKE3kMSA6tU=; b=QKC0rigOFCItiJmA
	fVErRFoANKSkqDloe4YwzO48YCcnOhODyz9jPaDOj7ZfYFlVDpkfJHKDglMwhHap
	Go02khzu5QEQZHeDpMRKDUA+FDC4qEoa15mtHlsH9XL/n5WKcyjyYcSz1D6q1nhj
	0CeDzKS+SUhfH5eS01dEVf2i+KdDa9aolbC/OQyZs4MhCTbR32DaOmTpyOV7+Db5
	SGm9YLO2VU5k1oF+rLW3DlSxo8Fa1M4IB+qkUrJ3ZDWzP6dObLN7gJsoUAoNeFq7
	uaXJ0FkVHpqctqZd5yE077UDBP9edga9xZcGggLMu1D7ZWCbGo+rcgtvhOQ/vdww
	iPI79w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p310y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:58:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddecbc403eso3097816d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302282; x=1782907082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntsbvnXSjYdc95EwUdqEAAUmAKUq+3DroKE3kMSA6tU=;
        b=cu+jLiuyOPEanJr0fHbCw/K0YRmCscwrcmeQASh3OZStpI/r1Lnf1dn/wVXQg1nXPb
         xA+zw+GgX5JdOzfwX6+w7bQsMUZ61Q4wOiGhF/gIK3AEnwnxG9KR/kpFOSw1XVybS7bz
         xP1kWDvA+EWhW36LlLidVZ1j83OLTjid0d/NXr8WzJf7w8OEUw+i+5vaDRgTRB/jHmcK
         Zu2qfsm0MMGM6Z1Kg3cSLxBFduenZ8kHzFDoiN7UyYrAJTA4Ecoo2y9wK5fP4WIPqVA3
         P8Nmt3tSS4Nx7W1TL6kT7GMPbVmQiH/D5vnRd7KnpdeAuXS/f2zJaLWsb+IOY5MPSAui
         TFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302282; x=1782907082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntsbvnXSjYdc95EwUdqEAAUmAKUq+3DroKE3kMSA6tU=;
        b=aXUX6TWQSBPKSZqoEX/0587if30kydMXL7wCFOeFdqXy0PN0qpxBvR+pwZr9LqpKG+
         36PPSd88LjB7Er5l6Rskp3crT5x3cpAhpguJHCmnRDCBgas/3/kNbh8aUS/LOB9/4H+x
         eKU3gXaFLRYOXkDCnb96qqYxLF53w0FMS8C/ILZi564KQ/dAhtSTHeBH0mTieo5TBwRq
         FV2fg1lEl7C68bC59AheBcpwWYQhUtEG5reWDyB/6YkOrHwFwBqxUB/lzfQeEbek4dH8
         1L1L+lymlNuCnOOOjkwMLT4YYPg1Uo6uKaloDGHzgJWBJYnxggnTdGOLUeHgg8M7DpQB
         CLeg==
X-Gm-Message-State: AOJu0Yyz+XxzcEpIy4mCr8clFRuQQVgz/jsYgVTbbD8TyIxf/FXblkoA
	GAVJgyCxBVM6tVfZzZhlv5dKGZ2j1boDlL25Ubgjb3Ufep/Yh4AhgF+3YVgWJL/Oe6f6OyZ+wkW
	jH3/DJCKCrFzcY+UlXZpp4XxS/GKKknY5hWOTgds9tvA+drln18EKbVZc1ZM03Rapq+Dd
X-Gm-Gg: AfdE7cnBCumgGeW5vUBmsfUWpU/YDvCyZ3h4GpGrsHAaScdQN0aMOZd+i19OThwI2bB
	SVVjV7NstNebizz3ygcgtQU5ns/3VcTeFYfNgbVfzwbaJkcvMccL0oMUIod6uKoM6uIWrTDz7L3
	zwEfGFqYUH4UcXgH3giB96jifXBzkOcCx4bDmA03MifuCj4CQ6hoYs6g262gVsOsqFLvrv3bNar
	wvsEl13Z8HJpz/nm8DD2rD9cQNLG3PAr7tDMh1M72YQmNTs3yIPpSNVFtt5fJcnF5fR3T8WkPvN
	GPJhaJgX6yewRxS7XFcGntDD5wElSBH09wv1v4uSbir1kkhAGqIqjXfKEiSzIU9x+jEmMrlEnhd
	bgWKmrbY0GYGv4TgV8630Il0ZjVH5L284PXI=
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr934603785a.6.1782302282428;
        Wed, 24 Jun 2026 04:58:02 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr934600685a.6.1782302282032;
        Wed, 24 Jun 2026 04:58:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a9fbsm648644366b.12.2026.06.24.04.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:58:01 -0700 (PDT)
Message-ID: <67e22ad3-5ae6-464d-9f90-72f577d35d91@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfXyPFu+VL4ULOQ
 8otFHmXzGT1nk9Pqd3WawptvJVmq3fJ+/+ezNMmgbHRV5JplsLh03YiLOpdXOClz68zVgLHV3pU
 7Sh0oG/o1JhT/M2JXTShecCi11NzrMs=
X-Proofpoint-ORIG-GUID: VtvhTWWlWgNknmoZHCkhGnaAEFXFjonk
X-Proofpoint-GUID: VtvhTWWlWgNknmoZHCkhGnaAEFXFjonk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX5Pw+xcANHnbn
 hvrf+JTDW7A/sxFkAOMFjo0t5H+ZpEr/4Ua1TiSkiQW63xozcNgy9SoUAgmLwbEeqeSi6HacEor
 NZDe/i1p/noqqwggkZZ0EKbKWkCgJoqwEyk81W1/Um3+bRR9XDl8Z65/FimEnRnYXET86cXN44/
 winfQSBOKFHINDFRe3LhAH1tHL5v9iSPgZM2bU7qsHcnlbSyTRcXz9Jr0Gp+yXzSQRkPouVY+nl
 Qu12VvmI0Y7ePghfWHKr6CI/gpX8HR/THf0pQZXBKisIxXuDY1pLXWM2pYSO1528khhpsYn6CM4
 +igU48PsuOaAZ7wmS3QmCWcC6w1KOmZ+MAHBikZ33p5I8obJasGegypRy9PVcpCm/JoognqHyZe
 BnaXDtf9scCu5y65aRIbKpH5zd5uAQ==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bc64b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=dZbOZ2KzAAAA:8 a=EUspDBNiAAAA:8 a=32zDLpEgVwPJr79w7xIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114333-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: ECCE86BDEDF

On 6/22/26 8:46 PM, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

[...]

> +	pm8008_default: pm8008-default-state {
> +		int-pins {
> +			pins = "gpio84";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-enable;
> +		};
> +
> +		reset-pins {
> +			pins = "gpio76";
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <2>;

nit: bias properties after drive-strength (I now noticed that 8250 dtsi
has it ""wrong"", we'll mass-touch it up once we have a tool for that..
sorry for the trouble)

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

