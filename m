Return-Path: <linux-arm-msm+bounces-95747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBUZIaOcqmnPUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:21:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D393121DD01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA0F03013491
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311D533FE27;
	Fri,  6 Mar 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IztSesDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWuErZMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4584293C42
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788762; cv=none; b=DcQL05/RLJeTBwlmw6tHEemnfREGiiJpN/ONyOnwUm98BBQgaWi1BNrr74VEON20zPPp4wcBCHCrr5LI3RRTXVfhzFCECeFCnbDeXbAzsIJCU/brkkt9bBsDfzyRpOnOVvfMAhR/dLAXrP37O1Bdv3Zgnh6vOGiq9Fmf6YZBnuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788762; c=relaxed/simple;
	bh=nRsjqy8MOrUMx5ehRpdvcGpiNDJEMEnbib726qs0XV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1Z2VvS5giS/J/v5gU01u4sIJ4bC25HlCEp08HoAzynacrPRtFdyMNTPAXraK9t8hYBt8wAX/PJvv72Lq03k/se8FPlgV3PWCNHcLDzgWpdOd52WDUCddtXgdxoQgdgon1uOjsiXHKAiuQFiLkPloztJ3EwyI6pqA3YwwtNu7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IztSesDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWuErZMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264ae0j2797597
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cSOe56YMTANQI6CN7wP4dAFU
	5aYEbdGuAmKaMtM1SpU=; b=IztSesDhDYU4LZzWEknhPECzGzLjVHYP5t+lqkyj
	NJnHYVrqLYfgpyS+AZUzcCnDysZYWaA6nHIWZgeU2sg9TQfdE7s7d5IbSJHxI7w/
	Vnwe+cqsW384a7RY+R1CrEWu+9sutjbim15PrPiClcH5xOH4+hpca0btzViJelfu
	QttX9vEjHs8/MyaoX1nw2Z4GBwBTOIWnlwJtPnv/CAF84tLYWahGjpjDhwNoL8tw
	SHXKg8MZzhRE2g89RMXEC0psjVkg1rKvIebMb0xVMADZXGfhUArCjIwJJpDfpgK1
	ZHHlRHkPfgSe22Bdvua4zetRFdMaHI0ijsFrK06gaBfzWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srkrma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:19:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb5359e9d3so5460633985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788759; x=1773393559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSOe56YMTANQI6CN7wP4dAFU5aYEbdGuAmKaMtM1SpU=;
        b=LWuErZMQDP5U6NLjfs848j3Q0ICKFuOhqTxQfiNvMW8QwlIqQy2Gneg3BtYkPFlx/r
         iuaNg4cxgqJx4iECJYLF7ZNTnOyVjblNCm6EcIUwCGjqd2rAyC9O8hlMqm9QXIHddXVK
         ghgaoOaFfFmYutYt2gizQ5d4xS8rICnCvbT3txWRDhT9dQbGn1N6gZcYJ4GhublgCf+h
         RB2rwL/c+KgJjGjh7GUtgMG2d6rxonJPDGxE4lC85TKNk8cAnFnV2oiSnOzGrNBGUiy5
         9YsTRAPBL7xj2FCcwT+bbT2tEaPugAPu7VkX/u+enFQoaW6EVQzu73CTdDo3y/HP/Dwm
         Hq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788759; x=1773393559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSOe56YMTANQI6CN7wP4dAFU5aYEbdGuAmKaMtM1SpU=;
        b=hJhozpL0aDJ+BS9LNNP81OE3OOSqoDcx2QFzi8xH79x9DYUbw26eNXPqlVHcroU8uj
         BxF0YW7XKElbEt+bJBS2aJN5o9MAxYwjrnpC6NsjCu2CLM05K/jnPu4YroDzvsN9GROv
         TXmmdJpfs5nplWVPbGwthh7qG83mX6WuEoV5w/4ao9hGCXyBx6+fzYHHWckdRcYHm66I
         VFBOIHiBVpyX5yx4ZjjtItRO3O+RW0LOgwKVxKlIEC+/Ra+2QEwLGvAxd5so4HaBzIWi
         tFPDgvn+KgrikBWhfceWcvj4ox6Qe/HPIbbpZTzV+64MhGAXRSPXlPtFrSb8w0sgJf66
         oKEw==
X-Forwarded-Encrypted: i=1; AJvYcCU+/iWXBXZt6fiyMrEW2C6kaTJJHh58NGi/M9zsSXtNIhnOCC97F+/Ud7GCKTguYG1p8rgwBTcZ199TFbMj@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaBhGeNAId48z78FF1BgEZuBQcVHI7Dk60lsd9nq1hxfkuC2k
	d6FE5B2C4t7ep6KUE059bF5u3a6VT9Yk8JevuMKOjz00frKLk6kjeU4otIknyUZlxeTXUhUConB
	qlGbjpvK5UK2wHfqSaiAQT3D5YjkMRWME3tMyHMezFHcvTM4PXpqwKFEvXU9b6Ff2Xydm
X-Gm-Gg: ATEYQzxRb2CSuuovH58O59nwaQfDW0OkgE76P7BthV/8NMd2zvN54NYkxPDhM7AB3f8
	lPmoo6hGHdp0rthpN6somYWAlL1zttPTLqoKyxG8y7CIdIOudil6rvQ9SVroj7JYS6jEVqf168/
	Daj/zDnOOupHGBPO36iRXyJvl7bcTJRpaCYs2JkvF3m08axFniIcBZvVjCTSPz0Tcy4XlLWodTG
	u+tGWPN0c7m6jpQGcO7xnoOpsLN1cIZSkDw/sg6rDRqfu+W/tlCyfa94QSo9VcjjlI5Pc/7wNV1
	qNV649/kfuqAEVMj5NTNUwjN/vcJ9ygzCTJnvHNILrG1nOvEXk3Un7AZC+Ccm47qjw6JiIi6lyV
	ZCZcUtyvClUhSc/bKXH0juxX+TvLk
X-Received: by 2002:a05:620a:c4d:b0:8c7:1643:c1c4 with SMTP id af79cd13be357-8cd6d4a731emr167495285a.72.1772788758911;
        Fri, 06 Mar 2026 01:19:18 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:8c7:1643:c1c4 with SMTP id af79cd13be357-8cd6d4a731emr167492385a.72.1772788758416;
        Fri, 06 Mar 2026 01:19:18 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:1265:158c:17d1:c76e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852470c258sm11935725e9.30.2026.03.06.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:19:17 -0800 (PST)
Date: Fri, 6 Mar 2026 10:19:15 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2 1/8] thermal: Add Remote Proc cooling driver
Message-ID: <aaqcE5jk-JCoBVG7@mai.linaro.org>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-2-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127155722.2797783-2-gaurav.kohli@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69aa9c17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=D6nbwq-aYW_yfCsrQPgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 9ctOaZ_cJ68KVm5E_WLhkJ_HJ_luWygi
X-Proofpoint-ORIG-GUID: 9ctOaZ_cJ68KVm5E_WLhkJ_HJ_luWygi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NyBTYWx0ZWRfX4BNpIeXSq0Tk
 mArqzvUpcK6b7YdiOGaWLqAfXdpHXm6qeA0EDhSbko3a03ZlgWETWavpQFytZ9Pjn/aZMNr9Vj7
 ZCCtZLMy8z+UXtY1CLs4zs236+CRWmQvrc6Fqk+YiL5FQ3svrKCve9h3U+Nt37w/wX6eCQeORpr
 ZhAfeSrIVQR9nZ3ZiNOtcYVMFIh/5iFL4LckMsKHuXxhNVen4JztuKp4/L93MS1U7RR4uMd+OoK
 wMUVblB307HlA5CdUYzOWAj3tDXZFBWqoLIBx9ehNnoem6r4cz6O3DDN9cEAlecB1RqbtfT5vju
 hI+0HrbBMlpomnEUN6WCA6yrTg8QrexYqoK2ubiSu6rfpKEB8xaSQYoxSbJa09wrilsxNs9mhLs
 QGPvMzUCTRBjKhFFN1LefgwTA+0oYdLuj6SnN5O0piudWrFUh7bXmsY1Q8aKKEZfA3SKXxDzOEH
 Lpi0yNldVqYGAM6QKoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060087
X-Rspamd-Queue-Id: D393121DD01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95747-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mai.linaro.org:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:27:15PM +0530, Gaurav Kohli wrote:
> Add a new generic driver for thermal cooling devices that control
> remote processors (modem, DSP, etc.) through various communication
> channels.
> 
> This driver provides an abstraction layer between the thermal
> subsystem and vendor-specific remote processor communication
> mechanisms.
> 
> Advantage of this to avoid duplicating vendor-specific logic
> in the thermal subsystem and make it easier for different vendors
> to plug in their own cooling mechanisms via callbacks.

These changes add a layer on top of another existing without bringing
a real benefit. At the first glance, it appears to be an ops calling
an ops with an extra unneeded lock.

IMO, a remote proc cooling device should at least group all common
rproc calls found in the different SoC doing the same thing. Otherwise
it is not worth to add it.

> Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  MAINTAINERS                          |   7 ++
>  drivers/thermal/Kconfig              |  10 ++
>  drivers/thermal/Makefile             |   2 +
>  drivers/thermal/remoteproc_cooling.c | 143 +++++++++++++++++++++++++++
>  include/linux/remoteproc_cooling.h   |  52 ++++++++++
>  5 files changed, 214 insertions(+)
>  create mode 100644 drivers/thermal/remoteproc_cooling.c
>  create mode 100644 include/linux/remoteproc_cooling.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 414f44093269..5ebc7819d2cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26169,6 +26169,13 @@ F:	drivers/thermal/cpufreq_cooling.c
>  F:	drivers/thermal/cpuidle_cooling.c
>  F:	include/linux/cpu_cooling.h
>  
> +THERMAL/REMOTEPROC_COOLING
> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Supported
> +F:	drivers/thermal/remoteproc_cooling.c
> +F:	include/linux/remoteproc_cooling.h
> +
>  THERMAL/POWER_ALLOCATOR
>  M:	Lukasz Luba <lukasz.luba@arm.com>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index b10080d61860..dfc52eed64de 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -229,6 +229,16 @@ config PCIE_THERMAL
>  
>  	  If you want this support, you should say Y here.
>  
> +config REMOTEPROC_THERMAL
> +	tristate "Remote processor cooling support"
> +	help
> +	  This implements a generic cooling mechanism for remote processors
> +	  (modem, DSP, etc.) that allows vendor-specific implementations to
> +	  register thermal cooling devices and provide callbacks for thermal
> +	  mitigation.
> +
> +	  If you want this support, you should say Y here.
> +
>  config THERMAL_EMULATION
>  	bool "Thermal emulation mode support"
>  	help
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index bb21e7ea7fc6..ae747dde54fe 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -34,6 +34,8 @@ thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += devfreq_cooling.o
>  
>  thermal_sys-$(CONFIG_PCIE_THERMAL) += pcie_cooling.o
>  
> +thermal_sys-$(CONFIG_REMOTEPROC_THERMAL) += remoteproc_cooling.o
> +
>  obj-$(CONFIG_K3_THERMAL)	+= k3_bandgap.o k3_j72xx_bandgap.o
>  # platform thermal drivers
>  obj-y				+= broadcom/
> diff --git a/drivers/thermal/remoteproc_cooling.c b/drivers/thermal/remoteproc_cooling.c
> new file mode 100644
> index 000000000000..f958efa691b3
> --- /dev/null
> +++ b/drivers/thermal/remoteproc_cooling.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Remote Processor Cooling Device
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/thermal.h>
> +
> +#define REMOTEPROC_PREFIX		"rproc_"
> +
> +struct remoteproc_cooling_ops {
> +	int (*get_max_level)(void *devdata, unsigned long *level);
> +	int (*get_cur_level)(void *devdata, unsigned long *level);
> +	int (*set_cur_level)(void *devdata, unsigned long level);
> +};
> +
> +/**
> + * struct remoteproc_cdev - Remote processor cooling device
> + * @cdev: Thermal cooling device handle
> + * @ops: Vendor-specific operation callbacks
> + * @devdata: Private data for vendor implementation
> + * @np: Device tree node associated with this cooling device
> + * @lock: Mutex to protect cooling device operations
> + */
> +struct remoteproc_cdev {
> +	struct thermal_cooling_device *cdev;
> +	const struct remoteproc_cooling_ops *ops;
> +	void *devdata;
> +	struct mutex lock;
> +};
> +
> +/* Thermal cooling device callbacks */
> +
> +static int remoteproc_get_max_state(struct thermal_cooling_device *cdev,
> +				    unsigned long *state)
> +{
> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
> +	int ret;
> +
> +	mutex_lock(&rproc_cdev->lock);
> +	ret = rproc_cdev->ops->get_max_level(rproc_cdev->devdata, state);
> +	mutex_unlock(&rproc_cdev->lock);
> +
> +	return ret;
> +}
> +
> +static int remoteproc_get_cur_state(struct thermal_cooling_device *cdev,
> +				    unsigned long *state)
> +{
> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
> +	int ret;
> +
> +	mutex_lock(&rproc_cdev->lock);
> +	ret = rproc_cdev->ops->get_cur_level(rproc_cdev->devdata, state);
> +	mutex_unlock(&rproc_cdev->lock);
> +
> +	return ret;
> +}
> +
> +static int remoteproc_set_cur_state(struct thermal_cooling_device *cdev,
> +				    unsigned long state)
> +{
> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
> +	int ret;
> +
> +	mutex_lock(&rproc_cdev->lock);
> +	ret = rproc_cdev->ops->set_cur_level(rproc_cdev->devdata, state);
> +	mutex_unlock(&rproc_cdev->lock);
> +
> +	return ret;
> +}
> +
> +static const struct thermal_cooling_device_ops remoteproc_cooling_ops = {
> +	.get_max_state = remoteproc_get_max_state,
> +	.get_cur_state = remoteproc_get_cur_state,
> +	.set_cur_state = remoteproc_set_cur_state,
> +};
> +
> +struct remoteproc_cdev *
> +remoteproc_cooling_register(struct device_node *np,
> +			    const char *name, const struct remoteproc_cooling_ops *ops,
> +			     void *devdata)
> +{
> +	struct remoteproc_cdev *rproc_cdev;
> +	struct thermal_cooling_device *cdev;
> +	int ret;
> +
> +	if (!name || !ops)
> +		return ERR_PTR(-EINVAL);
> +
> +	rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
> +	if (!rproc_cdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rproc_cdev->ops = ops;
> +	rproc_cdev->devdata = devdata;
> +	mutex_init(&rproc_cdev->lock);
> +
> +	char *rproc_name __free(kfree) =
> +		kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
> +	/* Register with thermal framework */
> +	if (np)
> +		cdev = thermal_of_cooling_device_register(np, rproc_name, rproc_cdev,
> +							  &remoteproc_cooling_ops);
> +	else
> +		cdev = thermal_cooling_device_register(rproc_name, rproc_cdev,
> +						       &remoteproc_cooling_ops);
> +
> +	if (IS_ERR(cdev)) {
> +		ret = PTR_ERR(cdev);
> +		goto free_rproc_cdev;
> +	}
> +
> +	rproc_cdev->cdev = cdev;
> +
> +	return rproc_cdev;
> +
> +free_rproc_cdev:
> +	kfree(rproc_cdev);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(remoteproc_cooling_register);
> +
> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
> +{
> +	if (!rproc_cdev)
> +		return;
> +
> +	thermal_cooling_device_unregister(rproc_cdev->cdev);
> +	mutex_destroy(&rproc_cdev->lock);
> +	kfree(rproc_cdev);
> +}
> +EXPORT_SYMBOL_GPL(remoteproc_cooling_unregister);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Remote Processor Cooling Device");
> diff --git a/include/linux/remoteproc_cooling.h b/include/linux/remoteproc_cooling.h
> new file mode 100644
> index 000000000000..721912d1a5ec
> --- /dev/null
> +++ b/include/linux/remoteproc_cooling.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Remote Processor Cooling Device
> + *
> + * Copyright (c) 2025, Qualcomm Innovation Center
> + */
> +
> +#ifndef __REMOTEPROC_COOLING_H__
> +#define __REMOTEPROC_COOLING_H__
> +
> +#include <linux/thermal.h>
> +
> +struct device;
> +struct device_node;
> +
> +struct remoteproc_cooling_ops {
> +	int (*get_max_level)(void *devdata, unsigned long *level);
> +	int (*get_cur_level)(void *devdata, unsigned long *level);
> +	int (*set_cur_level)(void *devdata, unsigned long level);
> +};
> +
> +struct remoteproc_cdev;
> +
> +#ifdef CONFIG_REMOTEPROC_THERMAL
> +
> +struct remoteproc_cdev *
> +remoteproc_cooling_register(struct device_node *np,
> +			    const char *name,
> +			     const struct remoteproc_cooling_ops *ops,
> +			     void *devdata);
> +
> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev);
> +
> +#else /* !CONFIG_REMOTEPROC_THERMAL */
> +
> +static inline struct remoteproc_cdev *
> +remoteproc_cooling_register(struct device_node *np,
> +			    const char *name,
> +			     const struct remoteproc_cooling_ops *ops,
> +			     void *devdata)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline void
> +remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
> +{
> +}
> +
> +#endif /* CONFIG_REMOTEPROC_THERMAL */
> +
> +#endif /* __REMOTEPROC_COOLING_H__ */
> -- 
> 2.34.1
> 

-- 

