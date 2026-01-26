Return-Path: <linux-arm-msm+bounces-90520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPv3K+hBd2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:28:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B986EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 258E5301FA65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5116E30DD01;
	Mon, 26 Jan 2026 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GziFswQK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdhZOZR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC971330305
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423174; cv=none; b=LDfYXZmo3gPYfBzqTXE4T8tmVZU7bMPW9jAk61rnCzsSzxotIt77JjrjGz8hYS2lpPwh7DsAdseU/JXpn0MGmU+Zw0ofPmps1lDYmalqADEUfE98J9JKzfeV11XsCaXMaApLC8xm+qk7eNLd0YxREQCNPxGtiAb1FYWxVEyQSNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423174; c=relaxed/simple;
	bh=iz5fNb5uoCRdvN8WosdjyXPv5O8Ib8vT+HAmtgtXzqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sww0BCaT9y64P+zHXopq886BQElUuhq7b0H9+ejPSO8usuJ5QcILXtqASyzqMgt2UkOhavehK9PL+vJ2YJakrYyB15QoAqHp9LDxnUelvcfGUH1EP6XhQHR4oe4lCZ26/PC4FJtTcZocc3MAoI+E014HNsqyxwNNahyzC3Rclpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GziFswQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdhZOZR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8fGtk795892
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdgHA7Ue7zFitGhLg5Jp7suCmwVIY5RWPd1y69PBBSQ=; b=GziFswQKIm54Xj0R
	fUeNbTRI8re5CUPMjZHsvzWFVP61yXKOo8f04Kw4X6rFVk2DGXuCCNXJ0ORfNX2j
	nI0Jc4QEvSBk36kptPs4SdN0tKI4kRQLGtFzz9n4gqzKsVfU/BHpVA5ao8Y2h7JY
	AtPOV2Y/nigdJkVRlNRfCtqwTTVq7Nb1JWzZngkNqTLnKQy7Pv7owPrJngiXzjGz
	zC3UcWq4NLkyMfWhO30F1ZUcZyAG7y2JeuKbmaioJibiZ3Jw9vri6uOICxxodSns
	3NUm4qinP1FudUwvKILi0i+LXAmrk6slj/hYJgHIYeZxX5G8V7xtjoOUHm+jLrfW
	hGujNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f46fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:26:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6de73fab8so134381885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423171; x=1770027971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UdgHA7Ue7zFitGhLg5Jp7suCmwVIY5RWPd1y69PBBSQ=;
        b=YdhZOZR3GbDWl982Z7C2cZ0pmG+ZsBcnLK+396WDL77x07Gkp22Jk4Yu+2wDPBTCx6
         fgWLBSB6KQT4AObOHeHHrYRcJP/x4fSXa+XaErB2K93hYwNnlbSevO0LbC5wdDPCbpQh
         SIoHMB9MyU/Pqr2fi2UUYV+rAV+A188TRH3F+/yigyqn/0hMeclyYCEspO0LZM4QgIq4
         8RTd4YNO0IcWq4rABwHu9xcaqgy1kW6eYfMugn65X7+WyYhmQUBbdfF16SQirJvkc1Ay
         1AdhtKlLP4p75WIz1FwxtOF2JknxgVya4u5vbmuv7HghpBhqty3hMnzGyIzbduQ/vJy5
         cx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423171; x=1770027971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdgHA7Ue7zFitGhLg5Jp7suCmwVIY5RWPd1y69PBBSQ=;
        b=qvt/JiUCciQ7+UCCuhWYUuoJXdoejslinFL69cLmWlC9uKmKjMRHG9cR8v/8FJr+eP
         rdTrikjqWJtjuvWBYU1QS+Yv33stDq2/s8Y6h4+feSSSKM01JNZ63UMkPN9PFvscUwIX
         rP425X0f4zoJVfshEL5TlyC/055DNBhWjo8Ox2svpf9a+wY0yHa6gVu4KJ4UJdsYQlBp
         OXTeuws/6e1IS0t6JY+Jr3k51/bUVJ44kt7yaGx5BncVPcthQmA8/sMd/odPVIv8PiPE
         Rucx6pP0DB1nAVyv7KoOdTG3zMaMTNDvNpuevB4QGO2R3UErvOrcOCRfeOG8SrSN3AKs
         Ui1g==
X-Gm-Message-State: AOJu0Yz5McKzNJ7fnf7lIGn3WRrdZou28IC2cHmHP3dJVuawkOSyICpd
	lof+p3ipJN345NPkVNuLFBd3wy9YshSNAE3cOXBTNY7mjm4RFYUG4b3ZDaPNNa41fl3r3kozYDm
	+gZVpT4txs66y4L4DGXwcvTrcbsvXZcEuokOW8arSmvg/lNso24/lEijc24nvoUuQBpxA
X-Gm-Gg: AZuq6aLDuKPOZZFeDwkyBs26Pf5gzBWW3XVCX9I9aOCEsa1+OVJ/2TWczEIJYfSfrmM
	ceXtkHkXG1/G7zQnFbdjpt3rkvFNMaRb0DT2xMqaPtl1pdqwJ5hKfCfmN+JpwGMistoMfysSWYs
	kWuSI8eLAKbiQYCY3xjn1SZ3gtznjGFzDnXfjdqbgb96p/NnY/gDaGFVNKRNkYBTKl+G721N5Rd
	LSl/Aw+/e10RA+7lxIRsG4wStDxFGMixUKYkR/KSvDrWuWBcL9k+MowpQvpAfYGoIZKhir8Olfj
	C8584IHzNYI2dN+NzFxkkxyCYRFoc98SCr5Dd6wmUKBkzzXYXg0hI2YlX7GHvLrraGSRoPaFHDz
	VlZT8V0KppsHMwrfsO3zrhjBlZ/cspW2BUhKVrLAo6xTjYVclP46AuxEgv9Gltv8/pgI=
X-Received: by 2002:a05:620a:4482:b0:8c5:340b:415f with SMTP id af79cd13be357-8c6f9599b0dmr297632485a.4.1769423171177;
        Mon, 26 Jan 2026 02:26:11 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8c5:340b:415f with SMTP id af79cd13be357-8c6f9599b0dmr297631085a.4.1769423170753;
        Mon, 26 Jan 2026 02:26:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbbd1sm622138266b.2.2026.01.26.02.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:26:10 -0800 (PST)
Message-ID: <8015c8d1-6eee-44e0-9a50-df23126bf7f1@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Eliza interconnect provider
 driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Georgi Djakov
 <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-eliza-interconnect-v1-0-010ff0d100c9@oss.qualcomm.com>
 <20260123-eliza-interconnect-v1-2-010ff0d100c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-eliza-interconnect-v1-2-010ff0d100c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69774144 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ggfmzync1vDxQEGkaewA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nG7pZwMJOiBe4f_pf3MhI1n98l9QxNeI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OCBTYWx0ZWRfX0JsW4SoGfEtF
 N+JFZ8AS/yTAnksel8JCEUpNfdA4mUbMQPOww+mpaun5q5wb7GmwKiNRvItiXH+7yE1sl50giDy
 tQU3nCe3VDKHOpJkvRmxNl/C858AWeiAIdTfRsbWRaS+nTyKL5SM/hsCiK8QqF0MPV9GW82/+ve
 RVNTYFrvU9MrOgORjm8P9BZLwu24rIlAot8Hq3IbcVTgu079SnenWAUMg1oldDndqNcypW3ntEq
 nY2e3zz95gBPo+ucZUx506tCBLExIJvhfKUPdIuAVrJDza5da6XjUFRA2GpXB1KzKkEJtbczcUg
 yYvEwbuh2mV4RTzmU3xqr0HJUWxRvKuxUCyV1adu7PuBfetVuHJSqpMwqpHPvFKUME05tNp8J+1
 O1+GLEbeSTFe9dZbVoT1xEzUPnowPWuK0wrE8OtMtJGho6CUx0OI9X4YvIH+nqbWafIdp7DaLlO
 kPlQAPjkLyBWRkigdWA==
X-Proofpoint-ORIG-GUID: nG7pZwMJOiBe4f_pf3MhI1n98l9QxNeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90520-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 150B986EA9
X-Rspamd-Action: no action

On 1/23/26 1:43 PM, Abel Vesa wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found in Eliza
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/eliza.c  | 1586 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1597 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
> index bb1cb8a640c1..53398e972458 100644
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
> @@ -8,6 +8,15 @@ config INTERCONNECT_QCOM
>  config INTERCONNECT_QCOM_BCM_VOTER
>  	tristate
>  
> +config INTERCONNECT_QCOM_ELIZA
> +       tristate "Qualcomm ELIZA interconnect driver"

Please don't scream

> +       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
> +       select INTERCONNECT_QCOM_RPMH
> +       select INTERCONNECT_QCOM_BCM_VOTER
> +       help
> +         This is a driver for the Qualcomm Network-on-Chip on eliza-based

Whispering afterwards is odd too

[...]

> +++ b/drivers/interconnect/qcom/eliza.c
> @@ -0,0 +1,1586 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + */

Stray empty comment line above

[...]

> +MODULE_DESCRIPTION(" Qualcomm ELIZA NoC driver");

Please don't scream

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


