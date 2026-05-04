Return-Path: <linux-arm-msm+bounces-105726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nseLIMmX+GliwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 14:57:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B154BD4C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 14:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C96A9301D324
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 12:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390D03D5253;
	Mon,  4 May 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYnjn0DY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jeW2kY2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90033CFF72
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899442; cv=none; b=hjfKruPLij0VJNjGWpjDG+o4fZjb+Tq6dyOAoOE4gN1OKFdJu98VFaOXmiZPlPD/ey3AtSK94vCM9ZzIgINHWPo4c35E72CozLYrwRZe3BtSqkavkNF8f927GUD2KzbvCTwUkl7GeVdX/V1lGndftE7UTKVY1q5XSZm8wyV7hKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899442; c=relaxed/simple;
	bh=IVXV2NGZICqRWLnpBbbMz95a8GTb/rC7ICyv9OYABXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7epOz8zEwAI9QiEClE4LtWKBrV5E4kEhrBQBsNiwyu9GE+D11Us4OhkKYpkhcDnudryH5vTfQPOZyNEmRGWiM4NQuiq5PrXVGtHJcZlx4AlpwUCjxGqGp2G7j1W5ee/EwsLIzA9i08srH8vus9UHOCmXZZxLKI1zSBGKt2zuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYnjn0DY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jeW2kY2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4FLK3090362
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9+f+YzR85SwkNwBR9ZTqhmO1z4yfVyW74LQRH+yJOg=; b=QYnjn0DY0rGTUeiX
	HAp5SuT+sw3SKsPTWXlMtWVQ6dku7alNGAXMZ6CH11VjZ46yWxB30jZdOdsZE9I3
	1sA3Ali+47pmgeKHIFrA2VtreuLGZoZREMM0HdhRYg5iGKlO+HNh4EuH3byl4NOa
	NcWm0yUvf8OO4fefN4ALl2+HjGiYdIIHmAg6Rsv10Zlv4J+4Zu2QxvLKdfZxSsbg
	8ZPc8ngNdiyCFy25WITKswyhfxP0yZjcEVW7afYCvqIvbk/GThtwrYgd48k+CcnV
	3gkJ/KI9KEkBKgN1SiMUIIo3QXU8q1yzJ2FoGBUsoJ6n11Y0CRT3KrDo2RsysnDc
	SrA+dA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7dmkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:57:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f1b94ac9dso17483211cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899439; x=1778504239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9+f+YzR85SwkNwBR9ZTqhmO1z4yfVyW74LQRH+yJOg=;
        b=jeW2kY2gYB0J/XyG3TrXA3DETxic61YDxVarOVLujmGk9qxsyy4HVMpQpHy0PkkmJy
         9VIjZOpvzGzYYMjuZAW+jPIV9F4KjBGofPVZmpPcabNTBIuU+r375UDFowL7cz9ZP6mf
         A5ce06wl8rfm0gbcYrtixqxEQQsvxEsn63+M9s2z5ugSa/VzF65VmhTO6n+wqncyAUX8
         T6lkxNHwR8NhlAZJXbA4WsIEB+K+xVetwVxjfkuBMabMZnjWbH+22u8xNpiK0GQo7/gP
         u9BZWHI9MIqDljwEyf1t16VLw66+ulwkfYxZAUOjr/EVxODVfc/S4X1n8B5Nk9q/tjXV
         t7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899439; x=1778504239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9+f+YzR85SwkNwBR9ZTqhmO1z4yfVyW74LQRH+yJOg=;
        b=aOOaFQCloJzitbC6aKUT1Lr4EXgBRH4UvCuteHKxcFmprR8U7bMBnFloCbVYfovb+l
         b+RdMMKYoDPrBBGzn02HEP66tkT9DYgO2RiMq/rzXY6bXkbMJD2JB+1leux8qrD9mgJh
         T2M3nsGJhIMb2jCyl5gUlzeAZhsAFATwdXqBwmS6Zyo2iXwrDcN20BVIH4yzLAsk8LJ0
         pW3MDhSvQwBxug6DC+4aJyF75MggIHpek/NAHWLpnLwCl7oG48GfyY5ES8yoDQ2e6Qr0
         ToRqa+mCYQ4JxtEtoXdzOcGe6aNNUqgWmeoWcUdGynRj2wBfEL1DCmfAeaRSWmz/L/0d
         UKPg==
X-Gm-Message-State: AOJu0YxVEQxhA+Bi/iCmxFnyWkKEmGlNVmEv+NAfmjiWEACJ01A+078/
	HhiCOSHdl+iRi4Dt8FWSQ82UQ4LxKn8cjA2f83vskkDjEOCiVgjy/txM/Oyyy38c0xIEO3KmPyw
	OMVP0XOEfiEXvTwvP2RNK1gD/KHfpQixk4295YsvfJWDVcooKrWkwBlmMlrYieg5ZJJPD
X-Gm-Gg: AeBDiet9zxoSeWh8WfiOM0wp+RBiFhSIlqc43MQTWQla+jMlwxSPfDxX7eQtXAU/2Bw
	caf4VCyNKbpxgU6CBM2Lenl4Cz12N6QKW/IDPZrlg1bOrA16C71GfEFLNNL2IlaLKi+yUAg4DBg
	HWQlc4MhtN5HjeFQfxnxZYW29dyGUmQ2ncoJ8BzQCIQt1LMuvwsKFKlqSdTh98qPA1iFORTcUhu
	fyMM5dsiAVXt945KzXzJujNPrCGlTPv0PXyXwRAfTUoz3I4gahlMgbTeZ3HRcdHHBMltlQa6CLA
	nL9XPu0ut7Xmh71rYydhe6DCLXYpcynVcOfs6SW8o3eYBThdiWLcnYnqICNY1+pfjw/d/iwbIdV
	UkEZKvIvjSb+gKM2POu87V985tO44Wx22IGHUFcXk/FAGAJNs/qkSMp0z/UWeVTh6ZJIPXGqZ+b
	HZ+B5qtW3bzRjzZw==
X-Received: by 2002:ac8:5f47:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5104bfad6a0mr101813681cf.8.1777899439228;
        Mon, 04 May 2026 05:57:19 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5104bfad6a0mr101813471cf.8.1777899438805;
        Mon, 04 May 2026 05:57:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d57dasm3441014a12.19.2026.05.04.05.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:57:17 -0700 (PDT)
Message-ID: <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MIrlPledIPR-K4qkDA_9HBSTL_86TnSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNyBTYWx0ZWRfXyTdW7TW0n8jP
 Vi2BIUSA/WqiNazuTwyEC67HDCZ+6o00W14kqlKIasrFeEezE4aW7RnEOjuv9fbPCzJWO8Aov1Y
 suZn+yR4Y+9e4F0s8Zw4wrSHLphYyL1ty8u1a1nrqNdwYu6H0YjP5HXGk4+78IyIid6Jx1/Hp4v
 u/G18AyPgt/fsnfME/MQw5CNBcXCEgodaCEg0fcWM0KViR8C7pOaOktJELJviq+kyhPiR5c0RUj
 oLsD201w6f7qIhj/stQcBz7FjnoIpV/1opwAzfTHgHKzBaiaq6VyXpBs2BnoYlKjiMXjEGq+/uY
 ocHBfsoMdFmBqq57QD0uhaR2d5/EHEQ4BW2HOCwoi2naFTtEP6Hi79kGChGDVNwAX+rv8o40F6R
 PyYJtPuWcbq6b5M2SbfsU4mEho15jDKSUPIlLJ1LmtNCDJ/6SjKsSi5gUs2Iw3rhYBNdNEA3s9Q
 oB62ODaXH7qIS9UYu9w==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f897b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GlVSUVHHWGa5OW-2IAcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: MIrlPledIPR-K4qkDA_9HBSTL_86TnSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040137
X-Rspamd-Queue-Id: C5B154BD4C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-105726-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 7:05 PM, Umang Chheda wrote:
> The monaco-ac EVK is a new board variant which shares the majority of
> its hardware description with the existing monaco-evk board.
> 
> In preparation for adding this variant, extract the common hardware
> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> include file, and update monaco-evk.dts to include it and keep only
> board-specific overrides.
> 
> No functional change intended.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

The patch is a bit difficult to view as-is, but the gist of it is that
the resulting monaco-evk.dts is:

// SPDX-License-Identifier: BSD-3-Clause
/*
 * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 */

/dts-v1/;

#include "monaco-evk-common.dtsi"

/ {
	model = "Qualcomm Technologies, Inc. Monaco EVK";
	compatible = "qcom,monaco-evk", "qcom,qcs8300";

	/* This comes from a PMIC handled within the SAIL domain */
	vreg_s2s: vreg-s2s {
		compatible = "regulator-fixed";
		regulator-name = "vreg_s2s";

		regulator-min-microvolt = <1800000>;
		regulator-max-microvolt = <1800000>;
	};
};

&sdhc_1 {
	vmmc-supply = <&vreg_l8a>;
	vqmmc-supply = <&vreg_s2s>;

	no-sd;
	no-sdio;
	non-removable;

	status = "okay";
};


which begs the question - is the eMMC only there on the non-AC SKU?

Konrad

