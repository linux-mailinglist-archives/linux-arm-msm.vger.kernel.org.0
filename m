Return-Path: <linux-arm-msm+bounces-104301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEV4KVkE6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F44515BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2E043002F64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163B025A354;
	Thu, 23 Apr 2026 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgZfOxAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo5nJ0HJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B63E6DFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944202; cv=none; b=ZcdY6xEcZq8SaeZSrQJf/ia0hfRpWjG8eeaBxbK9PRP3yNxlSdc+xR8zLy9S4Qr3GCJpqmqOGePouxnPJNsiVhwF2ZbBVq9Wtkh8NFcWaX+u96hahoNb258XIc1Qni6/OKuOBpQWKL/NcZWmNxov8NqsSqrPqWDzkV3jat9Eza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944202; c=relaxed/simple;
	bh=ycCYcFDws687lzPHf4a7ZDQa8w8dkehTffSeJoBHKeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqL32PrDNcA9UnOwZ3MWHhx06uYDymlYURd448OhZ2Zx5Uw49NT1i61Js8eo1Dh3bJL2wnFmiEfNzWbuKyLr1pfzA00K8U0xEAOg24tUdeipZUubbbpJoksA7ztSy3BzUSU2dW6GIAK0ppGCwOJNKtZsVgJjSWbjwDPPE2hjoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgZfOxAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo5nJ0HJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uFNG3044120
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=; b=ZgZfOxAjPxVx5KBz
	M4gXrD1z8OdjWaxuRMaot0/RjOdVU1RYD/dM1HTr//hRHN+xF3/na5P2y6mrg90e
	YwgldGzrmoeJgyfeEEzINXBV/Z20joUkbIBPMq66Y2vw30egfAKkzKnBTumdOjdy
	vd8ecnk/zxAHGM4aL9YtFLmwLQlY0KcEvqiw4rLF38LnKidn1MdjsJAu7pXTo+mG
	KPQ/c1VPaiGvpw7IlBi0ejPtjBKDVOqawKr28ODDmB2pJwXA+sn0DJUF3kDm0R15
	nwEob8lA+70+zFhOFMqpo9Z2JmrBx/FsE9wYYOGIg2mD1y/0HESSSRc7U3tELC/u
	zNkHPw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3muw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:36:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb4b340f4so17836636d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944199; x=1777548999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=;
        b=Eo5nJ0HJBKnHrOR/uinb0nAGPzCLDRy8cyNOZIMJ4p3Dsi0dzy/sYNTHcV1Jqv8SxV
         3tapUhWzAfz5XkI2F/G8A4XWjeA7hE6J4lb6qdlsFUWX1MCd8evMQXp2mHX48tDoBWbJ
         60bpVud79Sy4m+2odkpSl3xnwaR6Fgm5y1iF6+cg7I42MOei9eT5VN1FUtU/o1I2Fe67
         /+OXS6z90Mp7ZzDFQ03kncYs2oau4j5OI9FWf66/WsOHRtx8+jskLNUxTfLqiqy1BFGG
         Bk0VzVm3GHyvbmfCMECyHG3UTRZWiBOUM0YvCHLtCFT5hEcLk+iu64gehT6WsYgrb5vN
         73pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944199; x=1777548999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=;
        b=FHqlUYrzZxe4JM/Nh2hPvuogBnqGvnBB6oY/YmcHNzlD8vB8zRAn1Asubn58mJJ9Kr
         c9urCMyHa66qga/rVqe3gqimvx8CEH4Y/LA6sfIli2BcfbOEmNMNGPhRY72/9a04Bi/n
         F0sjokky3fPIPRuA2LRZlpe1umd2NHSrau8rrMt+IMj7AXIsSdkD/S56n0pmRP6TzZ2D
         pRUTYeKhRRYE+efy370tfHy7m8JKE9rvCDunG87/KXRO5GE0ZtLYCf7EQIkcPTQ4vu5s
         zrYs75rX0+0qlDwcs9v6brgIZ0UqoM4izz0ObPr+e1RbO8CPkPqO8FKeGsDrMX6JHC7T
         T5HQ==
X-Gm-Message-State: AOJu0Ywc0AVR+Ks+OHT8Q9u1B7QgEz00U1HzejTYDP3w3MtlMHdnIE6a
	vepwZt+7LVaDtXZB1snic/fTMDS0Wz9clpAringxdKApjJmx1CfonRkX2j+DKJ0uuf7ibuREoLK
	yXaXHaEt/THtzL5bpo8ClfKhheF6tpY0e2+Wn3V1cgYavGAOX2SJOKzjZro4ETm4JthZn
X-Gm-Gg: AeBDieutVfnKrODMWn6LE2Yhus0asnSUB1SViO0aacDGyWflmyTMg4n0w5rNmHd5T+o
	zFyT3Nq99ZjLbfIMvTEEa/Treo+D7aiM9dpEoCby7WD7/l4oAq4kIT6v5pOZYIoqpJIetGktUQK
	VCpvtmrsk88WEb1sSXuwum48fZ1EwSXBI3ihsXNWJZeaIypf5VluPHOUsl2q6z6Do9F6YRTOID1
	ISsKLP+qT3KMJxuDM859eyNCdJFZuo+SoREous/qA0OFskzr6IYv32v2Rx/7WHNNntq/c14DrMv
	WrTbMEO/WlhSLHhznyizAI3fIKsvsYqlLdKflu8aP4X+MGqk+Zvg6ypBX8bOeKtbPqzSy3BUX0j
	vbHgPQatWzm/ULvEeVrG2bPzPg7HULTzSGoD4dDJj96PhV2CQNCrYU5xLAljChx+LUhLn/Lty4+
	JIH+r8sUrxV7x1tA==
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr100777241cf.2.1776944198938;
        Thu, 23 Apr 2026 04:36:38 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr100776841cf.2.1776944198503;
        Thu, 23 Apr 2026 04:36:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533bdfsm648444466b.57.2026.04.23.04.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:36:37 -0700 (PDT)
Message-ID: <ce26e0f7-a07f-4e17-a790-fd4f230c7e90@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:36:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNSBTYWx0ZWRfX22SCNI5n/i2r
 MkoC/DiwEw0l4+hXnqkU/7c8rte8kNKBN9Igxhym3uzfyUFTqDXvaZJquRcUHvZMDvzaWntPyRs
 GSIv/1DKaCuzdcL4CTQUjCaZq3jgo5dAoMjyqFytSnmEL9p1m2YU3Bdci+TCFPdYIWW6Cknw0ab
 eGeN3To29H/8RVbqFc+OVZEGAi3BccsERE1+deMu0Kc1Ti1gMK9wNcaiVWX4WDrrH8czpx0SK4C
 Hbi6ViEj6/lGKEwy8kE3Y//+pVqsMR4pKIWaPYqk85QY+88vfm4D1tfMys2ge8Aqc8e1lgJvtF1
 Lwv9i64wAoqqWeaIDOKyLNqUnxfqvcBhqnFOODGyhJe1XGwGeGf+jKlUA/8UFMzw4buwDOV0S4b
 SozqnHY8hkRGNJnt8aJ89XoYCt7AaI3jttIBcqn5V4BTiJSWTS/dHF/wd3q731Wi+WCYQSNETdo
 DiuUwKcmUquxlgaofOA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea0447 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7luhnmdphBsOXQ2kz_0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: bM7DGcMAvHsOjHn_kJ5OM9X4hk92FFvb
X-Proofpoint-ORIG-GUID: bM7DGcMAvHsOjHn_kJ5OM9X4hk92FFvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230115
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104301-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,alex-min.fr:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A85F44515BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

[...]

> +	i2c-muic {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;

Is this not GSBI2?

[...]

> +	i2c-led {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

Likewise, GSBI3

[...]

> +&riva {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;

pinctrl-n
pinctrl-names

in this order please, file-wide

[...]

> +&usb1 {
> +	dr_mode = "otg";
> +	extcon = <&muic>, <&usb_id>;
> +	status = "okay";

Nit: please keep a \n before status

looks fairly good otherwise

Konrad

