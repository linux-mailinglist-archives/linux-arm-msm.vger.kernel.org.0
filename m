Return-Path: <linux-arm-msm+bounces-103774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOlpKmk15mkGtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:17:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E742CD88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76AC9309340A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7248D3A1A3B;
	Mon, 20 Apr 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jl7ByKRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/5geKFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466A3A6B9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691698; cv=none; b=aEQw+qJ99AFHEJymTDNnbvsAWgLemrM6LnoyMqiAaZ6bPa90Y3LzUgq5asDAeixXnVo3KNS2aoGmwF+rOrrD3x2VGIE7N+rrRJZg6G6dLzdl+X61K86U1Qfq86HrTcA/ZFJVb7VVFGYmeo9noq4MaKnaNGjZ5w19edHa3PL491Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691698; c=relaxed/simple;
	bh=Xcp3oSGZ5ogMND4vSDugZNrj0RgSA4sD/feowl2Kv2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7EqAKbE3HNIRanRCr4LZTJQThvl9RntDgREs8jKQjbWc26oafdZ3VozlxGAgrEDAUlqHQrb4aOmbeGR8cx75aHLRHhaxNBiSqiIc1t6IOKopids6kVMWqFtVXP5AYwH3snzbcjopAzyEOpiPwQI2FV2PYvNYF9Aihj8GvQWtjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jl7ByKRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/5geKFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9mQ0e3925591
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=; b=Jl7ByKRxvcTUDv4N
	eyiW6+026VlT8QCMhh3QC4I8qKzvO8YVCNXDIYzEc2ru9c+woz+xllKVzjUWjOGQ
	xukgV7vz2OmL5hN41jE3sQxGrHgnh89HG5MOpz6B9aDsF0zDmotn+fEtIFK5M08n
	MMp6Pfu+/x4JYocvSKtMk7N40W1X/K6xsm1P+oYHM9MHa1vq5gm8mU17qh89vath
	1ZnOkw67vXQZGVNcVhyT6vXZQxcZfCw7biRyM5qcgsqajFbhztZvN+4lgEQfHKnR
	esIWyLA1cqclrkwIG8wKnsrXKISNSlJ0K4qmNmZ84988bp/Fx4n8um/KPL+CnmJk
	bQBMjQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9rpsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:28:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso1010017b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776691695; x=1777296495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=;
        b=f/5geKFqZOf4pvpqdqj73dguxVQRB56bB5c3ldMSAHyXNO2pVS/wS2DRe5rO6RRFAK
         mcTSxet44TGllQdIOKojCOksTERztWso8Nznzq+yX8xCgi63RhGp1J/EgWWl+3jTvOkv
         S6hyfsxUBIO3oDluOrsh4daQpOXlXbOgjBxiiRwSVwbm+QBbiR5ZKXJOkhF25N/TUHqJ
         dpyuCOQOr3C3njki2Em1PfEpwT89OHBwvZPlvgg26Yrec+Af5Xbm9Gm5Geg5AvmtpQ84
         iKlHDh+Hx6jnQvU1A+UyjvMz+sx674VVmZvLbNis1HChkvD102V50B0RMc6NpqdJ2mxa
         uy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691695; x=1777296495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=;
        b=KnBv6tIP28c0KRVigwzdaDTR4w7UiesnLkGONGJEakep3+LiawjKdYq6zTvT7gKjte
         G/8VS4s5t+HkzhatRTphxaR3NolX2Hb/0cJbB6tamVKx0dg/FokSZcfuvEF99MITcdtd
         vWsJcyAjERL21OlJFk/Jhwdig/jxCog5iQr//62xjouoDTGRlkNlul/qrOaehfNMFxo6
         GXbv6mnW+tAjLHRR3tQbV2r/Uw7/BI+eUG3K6wpMrIJ9vujrsCDprMvPhv9BL1beMXUu
         tY6eyAdbyHMxKhkWj18VeeP5/3SWW6r2j+qxWPxptklU3hM/pRvTJUE0lgaQCpSuTlpt
         VMQw==
X-Forwarded-Encrypted: i=1; AFNElJ/crpv3dTI2hHhaZYNSsFLnAgkar7xo9/wJL417J3+gDZMxaPzLan8kdE58ec6oRqhD6etiNjP2gMyfPWNg@vger.kernel.org
X-Gm-Message-State: AOJu0YziTP9+uErSWB3RYWtVTIDqNAxT1RRBuHS8P16yWnbll4dMCbMT
	TA3wGWV6X+JxN3oaNm5gp8RyG9yR6OCYhptcDyTvepkZ1XMitZUFPjTh3d0swoDGFIN0ZHGd4gp
	v+SjWpXTxo6cLWt9mHtBwjtYQiVpzcbMWBM8OqiZ5k7xsTdhewFTIcSskMs8Mk8GlJ55c
X-Gm-Gg: AeBDieuTvRnnrwLb67LRTi7kBnSwJ8HGeKNBr8miNPkW0m4mPWSC+84Wrfv1OEdu7+l
	XDx3eUc9/rmmLV73fYeI/0pWcbu9rYToLzIbZMPOii/D+mauRqGKVkMoR1ZyCF4YSIhKsrr6Eo/
	VsBFlFiTlqC8O2JbYmsaOVnGvCqbCsLgoivl0FI/VWBQ54AI6TFtdwWiZEHjCNCQL5WDZaqTaHQ
	t141ZKKveOpRuAxbLJHBnSn7lug5LUAAxLXW4qI9fRqkzlIr/FOcjzpFl7B43+FERTZOC62Aj6h
	WFYeYodMCXtv7ixYjnsjcQsddmM15QR5clIl9/QKOsLiNuok3dwOr3hS8vNM1ung6pLiK9nZKlm
	IULbDuIp+i1u7tlNwx2jn4SuZ9vhj/FlhVGhlomCqhl9+6LI3OoIEUyjoYZ5BIbz21wY9ncnsyO
	HD1kicSPBdNRpFetbqDyLq
X-Received: by 2002:a05:6a00:1826:b0:82f:37e3:ae6e with SMTP id d2e1a72fcca58-82f8c961f73mr14022977b3a.31.1776691694723;
        Mon, 20 Apr 2026 06:28:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1826:b0:82f:37e3:ae6e with SMTP id d2e1a72fcca58-82f8c961f73mr14022943b3a.31.1776691694102;
        Mon, 20 Apr 2026 06:28:14 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0307esm10921548b3a.53.2026.04.20.06.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:28:13 -0700 (PDT)
Message-ID: <ccd54c68-af2a-4d98-abda-3ba27b9178f3@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:28:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <20260417073336.2712426-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260417073336.2712426-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMSBTYWx0ZWRfX/cXu/pNRKTfG
 bkWpfziqAsRJWOgUc4pCmSjspK1M3d6u3YsdQFDFHlxDqqAoGIsoEwybPmwcWHRSOv5Iq0NmzJl
 S6kwZ+DfjOHpLo4A/nMPPkAdSqJxd5es23p2Ku/y3QVuLkGncLOtvwSjQsqRjZGPREllTarVqXC
 DvNOnAtlPWhsQsvmQ3bXKJmSbspB8FQqn9hVmz1dy6d0kK31qe3Fc/yhGeL6DBxbioBLRZvup7A
 2oRFiTlXcYpcIm4O2S7EA4Rk+aDPTwDAp0YtBV8ZnSg/eKX1/hYRrd4kHnJ3huzCWbYRPnz5dVU
 PRj/u1gAduvcWWHwVNR2QDsKCGxJZdLIsNKPKK93uRNx6kN88WnJqHoZ59PqaF7qABKh/IqtoBS
 9kv6okND6dfi48HvzIzvqlNFMfAvY4Xn8/m/kkqNCzA7XzDuwdtOkQkKjtQCXFLRFrvivm78jwn
 egctMG/fSaomjbCjk6w==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e629ef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RlaAdA2wXV2HMp-xn2gA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rcX4CsUXLzVW7RF8ZjqgNOcVJVM578Fu
X-Proofpoint-ORIG-GUID: rcX4CsUXLzVW7RF8ZjqgNOcVJVM578Fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103774-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 295E742CD88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:33 PM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>


> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   7 files changed, 279 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..f877a00fcaa5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the enable/disable status of TGU
> +		Accepts only one of the 2 values -  0 or 1.
> +		0 : disable TGU.
> +		1 : enable TGU.
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 53fbd2e0acdd..82b712a12a26 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)		+= ras/
>   obj-$(CONFIG_USB4)		+= thunderbolt/
>   obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>   obj-y				+= hwtracing/intel_th/
> +obj-y				+= hwtracing/qcom/
>   obj-$(CONFIG_STM)		+= hwtracing/stm/
>   obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>   obj-y				+= android/
> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
> index 911ee977103c..8a640218eed8 100644
> --- a/drivers/hwtracing/Kconfig
> +++ b/drivers/hwtracing/Kconfig
> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>   
>   source "drivers/hwtracing/ptt/Kconfig"
>   
> +source "drivers/hwtracing/qcom/Kconfig"
> +
>   endmenu
> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
> new file mode 100644
> index 000000000000..5c94c75ffa39
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# QCOM specific hwtracing drivers
> +#
> +menu "Qualcomm specific hwtracing drivers"
> +
> +config QCOM_TGU
> +	tristate "QCOM Trigger Generation Unit driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on ARM_AMBA
> +	help
> +	  This driver provides support for Trigger Generation Unit that is
> +	  used to detect patterns or sequences on a given set of signals.
> +	  TGU is used to monitor a particular bus within a given region to
> +	  detect illegal transaction sequences or slave responses. It is also
> +	  used to monitor a data stream to detect protocol violations and to
> +	  provide a trigger point for centering data around a specific event
> +	  within the trace data buffer.
> +
> +endmenu
> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
> new file mode 100644
> index 000000000000..5a0a868c1ea0
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_QCOM_TGU) += tgu.o
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> new file mode 100644
> index 000000000000..49c8f710b931
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "tgu.h"
> +
> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	/* Enable TGU to program the triggers */
> +	writel(1, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +}
> +
> +static int tgu_enable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	drvdata->enabled = true;
> +
> +	tgu_write_all_hw_regs(drvdata);
> +
> +	return 0;
> +}
> +
> +static void tgu_do_disable(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	writel(0, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +
> +	drvdata->enabled = false;
> +}
> +
> +static void tgu_disable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (!drvdata->enabled)
> +		return;
> +
> +	tgu_do_disable(drvdata);
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	bool enabled;
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enabled;
> +
> +	return sysfs_emit(buf, "%d\n", !!enabled);
> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret || val > 1)
> +		return -EINVAL;
> +
> +	if (val) {
> +		scoped_guard(spinlock, &drvdata->lock) {
> +			if (drvdata->enabled)
> +				return -EBUSY;
> +		}
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +
> +		ret = tgu_enable(dev);
> +		if (ret) {
> +			pm_runtime_put(dev);
> +			return ret;
> +		}
> +	} else {
> +		scoped_guard(spinlock, &drvdata->lock) {
> +			if (!drvdata->enabled)
> +				return -EINVAL;
> +		}
> +
> +		tgu_disable(dev);
> +		pm_runtime_put(dev);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(enable_tgu);
> +
> +static struct attribute *tgu_common_attrs[] = {
> +	&dev_attr_enable_tgu.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tgu_common_grp = {
> +	.attrs = tgu_common_attrs,
> +	NULL,
> +};
> +
> +static const struct attribute_group *tgu_attr_groups[] = {
> +	&tgu_common_grp,
> +	NULL,
> +};
> +
> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	spin_lock_init(&drvdata->lock);
> +
> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->enabled = false;
> +
> +	pm_runtime_put(&adev->dev);
> +
> +	return 0;
> +}
> +
> +static void tgu_remove(struct amba_device *adev)
> +{
> +	struct device *dev = &adev->dev;
> +
> +	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
> +
> +	tgu_disable(dev);
> +}
> +
> +static const struct amba_id tgu_ids[] = {
> +	{
> +		.id = 0x000f0e00,
> +		.mask = 0x000fffff,
> +	},
> +	{ 0, 0, NULL },
> +};
> +
> +MODULE_DEVICE_TABLE(amba, tgu_ids);
> +
> +static struct amba_driver tgu_driver = {
> +	.drv = {
> +		.name = "qcom-tgu",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = tgu_probe,
> +	.remove = tgu_remove,
> +	.id_table = tgu_ids,
> +};
> +
> +module_amba_driver(tgu_driver);
> +
> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> new file mode 100644
> index 000000000000..dd7533b9d735
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QCOM_TGU_H
> +#define _QCOM_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL		0x0000
> +#define TGU_LAR		0xfb0
> +#define TGU_UNLOCK_OFFSET	0xc5acce55
> +
> +static inline void TGU_LOCK(void __iomem *addr)
> +{
> +	do {
> +		/* Wait for things to settle */
> +		mb();
> +		writel_relaxed(0x0, addr + TGU_LAR);
> +	} while (0);
> +}
> +
> +static inline void TGU_UNLOCK(void __iomem *addr)
> +{
> +	do {
> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
> +		/* Make sure everyone has seen this */
> +		mb();
> +	} while (0);
> +}
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @lock: Spinlock for handling concurrent access to private data
> + * @enabled: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointers, clock, spinlock for
> + * synchronization, trigger data pointers, maximum limits for various
> + * trigger-related parameters, and enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	spinlock_t lock;
> +	bool enabled;
> +};
> +
> +#endif


