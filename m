Return-Path: <linux-arm-msm+bounces-119198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ywtAXlaV2ocKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:01:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C075CBD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:01:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z10tlFty;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j9UBC1F7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3526A3021715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9392843A804;
	Wed, 15 Jul 2026 09:59:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB50437879
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:59:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109587; cv=none; b=ilmXGrdnBJniILRa7wSPFFq0b4q6JXG5EOxuZtxGEnof1zt7t2ShiMGvGKm+rW5RWcWBAxQohFvWeyQhjjhuyKoDClau353Ql5WuLNgyW10wwG9eP9aj1fzycKOgtLXOP5v4ZmxHIE1UgWmqPqLpU+WvpUXX+fMN0FNGKOWjMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109587; c=relaxed/simple;
	bh=wChYRMNjA6dSORzFLDNH0okxJr3czp/G7xUpK1tFHJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJaBvsMIlJGa/OxKRAMj8X4OiNqsVyxzSCUZImwGNSjAVtEjkeltvXhu6/SIYGk3p/QdOylFXqsqrdowijdtJZ2Y4dR4q6TE4Ln2UGJd0bDqn4k0xM3JnHNEswxscZEDhkPyAd3YPuWWwMzDpbrQoYaqQ8upgU9+Ldgx1yO3Cbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z10tlFty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9UBC1F7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9ZNXV3319708
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu5GcbS1MXosHebLZpWhAloo2pv4JSkTLkcRrlN8re4=; b=Z10tlFtybi0hut2P
	hmAUIihm5GkdjOT0m+vjbLFgf8UiSXDjwH1HPzdJtJU/+ePoidBYYzu6uM5jKRJK
	hRXzK/ikajWtD8CKgbA534P/bfOaU0Mtdd82jd6xebe4Jdq/nSy/1UNnHifw+fqy
	UKKxwJUDIDKcNONwsw7PdlHnj4H1JDwRJCcGm0+DnIvKFi5bjp1m4WCEj5oYwJk3
	BGHb0W0DZa84OHJcZGBYMH9UfaYN1SJr7zL+SBq/JYeaDOtXOj1kqshIvyY0IfAu
	p78q14WK+pz4TecWKoa93tigj5usMQDn7kjF5sHfANc5XBvdmuizLp+40Aj0/KYo
	DMbNog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q602n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:59:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eb5f54b6dso93767585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109584; x=1784714384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yu5GcbS1MXosHebLZpWhAloo2pv4JSkTLkcRrlN8re4=;
        b=j9UBC1F74OmU+AZ5IhLv0XJsgv0TbrvxSqX0saEsfrFSKOrlk/18tsgwyus0V6DepR
         bdLKbb45tBslTdFxCsvtPgkujBmmeklVg33RF3bvu5l0e6QN+Txtnso8ZlBdfNzkNEGI
         b4y5Itz6BPO0L1ACD9csw2Yd7NZSM6v1vzS4or3j0zWQI28ahNthSJ5W/RCOjViBEHk4
         FcPpAs/WKklnqVn/+ykMR0XIffvkl9MdvbU88Lc0zGnNKnr5I2ZomUKNm8wrRo/d1TRG
         IUSYtami8ZfhUYLsqu7gSwx1bLaLsr/mcflhtEDHnnW+5n68heOIkMknubyJSATS7lSR
         fEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109584; x=1784714384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu5GcbS1MXosHebLZpWhAloo2pv4JSkTLkcRrlN8re4=;
        b=hwTHIke5kMcuvvFJS2ljbtwbrJPthQgVp8LCJ9e8jZ7HW5U0r6PwxuSq2qwjHJnlFu
         CGiAncQAzYESyHaCXE2q74NtYjESlnosPzXYPjmfKK7iwJjDswqhiG/znkOZqIhxB+PU
         0whPZ2hMAFaDiKxKAD2gCGb4cj7iNBpLkjIBtnGuFJcj7s0Dr6eCYSdexeJhJx6/8pMd
         aQ301PJOYos8nq50ASZDuNvFovcH62nxaKIjXrE/hhhUn5KIxUAhf3q+saoZxO1qZzuz
         MN+J7DSTgDHBI5ZSgRlO0YpKJcKgl00zmiSkeOFpyyxOy7bXLpaBXiZKofjCKNLD5+aV
         njhQ==
X-Gm-Message-State: AOJu0YxyHzOeyzftZh6UCGBfEvmgi7rxfJ/xKq7u6xkTdHfKwqhZZdzs
	QY/oX61+JCJbPQzgKPWcv/6fqbiP6THAdCNSZEEz/c5wvHyuMJJHTImRy8fO9CS4U40ZhYkIr5+
	sgji706vddW7O7dNhGJFUdwTVyFHvhR1Vz7kbRb6OQIkgg20uOVGZBIi02yi7yanRbN8Z
X-Gm-Gg: AfdE7cnlleagCLbwsGkOc6IfIWVc0cTxeXoUSV3xyS1HRd47vFcI8Qtx6SWuMWRetLk
	wt2OpGDmTpeikhiQotuqdg72M/6IbCdLEdSkII/VYfIsOfR941w5zn8F825mX10/+w4C01ih09f
	RgRAxIAeemOzP4mP8RIQR8mxsXDDOw/tsGMqfqsVQNj48OKuRC4/UPinzA7R7FY/Zl6swmT6J+W
	XJ5vCWengqORbSc4HGp7Lu2i2QMTfS+xsPk8bSpFdfzyxf4EWoykeklmlYyHMR8H6o59cPnbTSj
	WKArAA6g4t4XRkmPgYWdZDm4gw3zPfP0GaLbF+lLJvit78HQuYptpp9FApcSdFZQcEqOnHGJJbs
	6ZlhyoeD1PrEIcG5XwyuGwIN5SfsX0MwbLdE=
X-Received: by 2002:a05:622a:554:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51cbed4c424mr131200861cf.0.1784109583595;
        Wed, 15 Jul 2026 02:59:43 -0700 (PDT)
X-Received: by 2002:a05:622a:554:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51cbed4c424mr131200731cf.0.1784109583087;
        Wed, 15 Jul 2026 02:59:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15eb1dbdc9sm904850766b.10.2026.07.15.02.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:59:41 -0700 (PDT)
Message-ID: <47748f07-b1c6-45e9-911d-b50f41a85556@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] irqchip/irq-qcom-mpm: Prepare common access path for
 timer and pin regs
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX4LhjGkKRZqvp
 e/5IobI9LyqOt29CXNTMtcAV1vUmXpyGQrh6iRFIG5girKxlpgLh1DX0vMd3tdukvmMsljZ39RX
 rA4m5RTD0zD2JNeGEID9UUVki1bsK+w=
X-Proofpoint-ORIG-GUID: Uk7jTErY-Ku-sodX4EJKZTVZMwSKUQ6h
X-Proofpoint-GUID: Uk7jTErY-Ku-sodX4EJKZTVZMwSKUQ6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX8DVF6uHhfCYO
 Jm5nSfXF8ZM2Eqxo9CiSC2cuiGesWoNHXSxp1BVk0C2KXuNmlt+8lDJ5IYf9aBO38LHSJqrtIBU
 NMF8WQ3Y7xzpO7+fIS6TYOhdSqf/d6mfoktY59irqhWQV0liE6Dyf9hjXhL7xfSU0MxAbzZDSHG
 gOt8CYCDg/az2rr5Mlno4NluLUUEzk1kVGzOG4EYdyiNq5OHX4Kg33S4K3WgJTm2Yzsq7Rr5yvS
 vcsYKbYguJCLmnVjUOdtjbsF+DWWISgX6zyoUj9qL+I+fxkZJCAcG4xRx+1k7IdEaQPtJZkXS01
 bxYxq2vMoJp0tQlZLyFNT1XWVX5oG5hkUhayUzOkahWaDleRxwSkl5pajajFh7sEq5I+omJamxg
 HiSSrE/hdcUHzyeuKgsCPOfBpBsvl/vBxYAzzKEsgYfJzoL++vc9CsSlxcy+Z2n+XOBQqWLENEI
 uz0rDAtlq3qzrU79aTQ==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a575a10 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Cs3LUSVxlKGBK3EvLigA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119198-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 944C075CBD6

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> The vMPM layout starts with two timer registers followed by pin register
> banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
> number of entries.
> 
> Use qcom_mpm_offset() as the common addressing helper for both timer and
> pin register accesses based on that layout.
> 
> vMPM has MPM_REG_* values represented as contiguous register IDs,
> hence replace the macros with enum qcom_mpm_reg and modify the accessor
> helpers accordingly.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
> +				    unsigned int index)
> +{
> +	unsigned int reg_offset;
> +
> +	/*
> +	 * Per the vMPM register map, TIMER[0..1] starts at register index 0 and all pin-specific
> +	 * registers start after the two TIMER regs. Pin-specific register IDs start at
> +	 * MPM_REG_ENABLE, so subtract it to convert to a zero-based pin-register group index.
> +	 */
> +	if (reg == MPM_REG_TIMER)
> +		reg_offset = index;
> +	else
> +		reg_offset = MPM_TIMER_REGS +
> +			 (reg - MPM_REG_ENABLE) * priv->reg_stride + index;
> +
> +	return reg_offset * sizeof(u32);

I think this comment is superfluous given the visual representation of
the register space just a couple dozen lines above

Maybe this could be a little easier to follow written this way:

s/MPM_TIMER_REGS/MPM_NUM_TIMER_REGS

reg_offset = 0;

if (reg != MPM_REG_TIMER) {
	reg_offset += MPM_NUM_TIMER_REGS;
	reg_offset += (reg - MPM_REG_ENABLE) * priv->reg_stride;
}

reg_offset += index;

Konrad

