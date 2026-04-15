Return-Path: <linux-arm-msm+bounces-103307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL6ZHefK32nVYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 19:29:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7754D406CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 19:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 743B3304C724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 17:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6663A3E8C72;
	Wed, 15 Apr 2026 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJlDCc+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwKw84Gm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E883E4C61
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776273388; cv=none; b=FPUi/7axqniW4ZMHNBQXprXFXG0M6/YIKdsM7q0ZCL5+Q8DrrKlWZaD4mpObiPJA5e4ZdeMukQa0pzSsBibp1bVfhAxoOruMOZ/CYDP/Pom5imAELsfZBN+8w/W5OQwRonfR77Sn1TPJZWkad2C5AR6A56lySMi90OR7EX4ja8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776273388; c=relaxed/simple;
	bh=S0EDPJ9l+fvj9T5naoPwWY+Enw0gjv+15LBTelh/VlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3wnj8aHs+2zc8XSk89ELfmHNk2r3Ivs43jPysVyWhnpwSAH/9pGn1oE7aqeUTCq1oK068OrI7Elh5hL8OFoiMNUcarDjF8IOuxXmQoLRQVsTpQA+GLzm7Tc+1WXz4NNNSsDqny+kGrXSXIzsWF/BSsI/Lw5lb0HcRPKVPOtgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJlDCc+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwKw84Gm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFGNjg1793612
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 17:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXvT4zjNncbaQTzuRUGDRSkWnu4bijnWhJgtWj2vfqg=; b=DJlDCc+P7kvAcR3W
	1i9+1MbX2YXxQYZ/Z48HaSJr9AdMUgXqCSWSChH6RoDXEE2xBPyKp9anBuYiWgxS
	bqS9J0ixRzZwbUaxsx6M9EtAnU0bUKxa17zlMssX+JUzW/RcLm9LWjHcfmH6Hagj
	q073QblXiX5Zec20+sZ/rKek5Wv46TrczYvsEH9l6hs1TPcj89bGrALmS14g7u4/
	lk+qWOq7Q3Ynwx/jB7RAcRVSRPd2vUaqjZa70JGyLcS8pJeuJUisDox8hLY3aeFR
	WmtZvKh4MTnzwgQjNEtyazblgy3ItIlwsOrJn3pbrBF9nDkIKHcxdDXZr+RYjJqv
	k9VjJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd5prefq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 17:16:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so100427065ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776273384; x=1776878184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXvT4zjNncbaQTzuRUGDRSkWnu4bijnWhJgtWj2vfqg=;
        b=UwKw84GmX1twq9q14oz7h9emayFdfayY3yYIfZ6Dzy+T9dhHQwAVEx9Cy8oY2wa2aw
         8a30kr6AFjodFHxNaDmdyYUaW+Dh21v41d1c3vDaxmX8LsFmZZU1Aa1wNarvc33pcjXO
         iiQk0nSJ+aSTo+K+tcRFiuyDpRNXo6JltgU12Kmmt5nfwnrPmMBWvEJENyrfHIqsNclH
         w1iMkP+9zOdwH/qxq+e1sx1MJXuAcj7gDEooiGbjn8yyKLUoCW7By/qs2BbP1kSZ2s2M
         SlnhLcvs3mDgzI2Neej0GI+r5yy9g9hHzs8wPHiHjGbZnjecz9Zv0Jr9zJfoxpKCgISn
         EfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776273384; x=1776878184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXvT4zjNncbaQTzuRUGDRSkWnu4bijnWhJgtWj2vfqg=;
        b=M6246SKk6PDPmTpHwtG0S4L+30zWuCtrkBuYRVx3a5FYuhkM7VhHO0cB8l5jaqDDDY
         nPc2NbC5+nyak4L8Q7xRbbtPZfzGhYHIzRg3qS1Rfq01FPJqtwnhDQ5sW7z7Rpz7yRpT
         +CZkmYrqrcvVdEf5tcuSBGJveO0EPqb1tolqgEH/5/MpELtIwcuPoZogHgi2BzdJgHe2
         4JUyHeDaqLrSgBacWHPdBVGw8N6I+o0YUDManS0rAm1vWXly0YWbOuB9iZ60XfWas+A1
         3eHeKCSelndNfuVOV66tY9bng3diF4loQhTTBlRA3aaSLAezo9UvEwhgBRhZoI3bjo0x
         rzXA==
X-Forwarded-Encrypted: i=1; AFNElJ8/SMmb7Y482+Sok5Sz7UYwVVea38KcG/JQbRwcK0l/nGbc1746bt3aE/9x1cz3Vwr9TxQ1jExMoDqG78w6@vger.kernel.org
X-Gm-Message-State: AOJu0YweevxrV5hd27ewL6VQ/kR9nz1Ld0DukV7RdAhQLgFRYLgGDV3J
	GJ2HpIgCV5/ulBsGIZSzgh+QeRifLMsQ5LJsfUqnSx99GLZn9HjDQVYDKPM8JL0DsO0Zlg3t9NM
	lWV41B39AdzbX+O4yC+uGLsJgBP7uyPJdWtoXatUc+m4HOVGw+J7Qy3f2RdugJFvLcP7H
X-Gm-Gg: AeBDievzB2/Qbyjhmvgb5Nn7Dq2vT/AxEJjsaQQzdtA11lGgLfgTx11miLkA6BB6CC+
	pkUEPfiJVMXf4x/vjFUlkS2+YLLJIWLKDqL9M1Ih6c4N2grMPUzmtHGAFCQCP4WCB1wVYTvwqdx
	UKgNMjd6ho/7WT2porDd3W5ZpkpAkT37n1czbTJiKX5nIQpYMlRGWZ+2s7gbkN5k4+bhoOVfOhX
	IM37MCuIMHxdKANIshsdNmQ8F9FB3lkJkS4QHuEZsf5SrajRzJAqf02y/m0mxR0/mpVAMhGtblN
	qthj5NDXS+L0s88W+sVm+uZ2myHboXgcEKNkui9jnnLEUzPifKkvAPclipZFXh0qXFDTDvqt3dB
	GcI0VXqtc6NrNhe3pWGhcCPnI87EoU6+O+d0XY60WSBuZccz2ehEubw==
X-Received: by 2002:a17:902:cf05:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b2d59adee5mr234505645ad.14.1776273384141;
        Wed, 15 Apr 2026 10:16:24 -0700 (PDT)
X-Received: by 2002:a17:902:cf05:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b2d59adee5mr234505285ad.14.1776273383593;
        Wed, 15 Apr 2026 10:16:23 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e306sm27292945ad.46.2026.04.15.10.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 10:16:22 -0700 (PDT)
Message-ID: <75191131-2eb5-a7d3-0222-8c03a5ded45a@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 22:46:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
Content-Language: en-US
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 55mEEPMNcygpX2xdtPC4HPpothvNJda_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE2MSBTYWx0ZWRfX9xE6/KN+yjP7
 0YuLnThyrv6OvOa/oWYmHFeyRjVnrvAHMul2mjpzAgbZBP/Uki8vgPN9Y0jofPvc9aueYIreZ2M
 Bh7P2UMsffb34vmOyMZTC5fl01hBzgHnOrPqAlf+NMs5btRgk4uygMmJl0wvUhbwt0T/+pO60o/
 OBSC6Gd6osSU4vxcLxP8Zg1jt6zgK2pVncCWltOfLTa27eBQ3XRLz8UJC1RbjN0ZlrSV6KASGhZ
 0ZArkohP4ORty2dhPGkU0Qc12Oy6ob7tzlUf83EExJvdidYBK2IKiAGTWrqQ1hCuk2ELF4q5060
 9LjUVihoz8Kll7+IJXSRuhvs1wARuMtSt2zaZi30jF3gFcPDgTg0dCcAlBVVrR/IKNFjrst9ofn
 hKXWOmSrPqX4gvWmbifMYsHRfWx+PBtetAkrJ89Cl9ngzOXyz+RKtmWitos+4a4TldUsTQSsEN8
 01KAw6VeKIuUX3o3bZg==
X-Authority-Analysis: v=2.4 cv=AcmB2XXG c=1 sm=1 tr=0 ts=69dfc7e9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=m666xMD4OwuZyzqZ95sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 55mEEPMNcygpX2xdtPC4HPpothvNJda_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150161
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103307-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7754D406CCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 10:01 PM, Ekansh Gupta wrote:
> Introduce a new generic bus type for synthetic context bank devices
> that require IOMMU context isolation. This bus provides a shared
> infrastructure for accelerator and GPU drivers that create virtual
> devices representing IOMMU context banks.
> 
> Currently, drivers like host1x implement their own bus types for
> context devices. This generic implementation allows multiple drivers
> to share the same bus infrastructure, simplifying the IOMMU subsystem
> integration and reducing code duplication.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>   drivers/base/Kconfig        |  3 +++
>   drivers/base/Makefile       |  1 +
>   drivers/base/context_bus.c  | 24 ++++++++++++++++++++++++
>   include/linux/context_bus.h | 15 +++++++++++++++
>   4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index f7d385cbd3ba..479bc4bb442b 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -4,6 +4,9 @@ menu "Generic Driver Options"
>   config AUXILIARY_BUS
>   	bool
>   
> +config CONTEXT_DEVICE_BUS
> +	bool
> +
>   config UEVENT_HELPER
>   	bool "Support for uevent helper"
>   	help
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 8074a10183dc..ab9a0b2dc73b 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -8,6 +8,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>   			   topology.o container.o property.o cacheinfo.o \
>   			   swnode.o faux.o
>   obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
> +obj-$(CONFIG_CONTEXT_DEVICE_BUS) += context_bus.o
>   obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>   obj-y			+= power/
>   obj-$(CONFIG_ISA_BUS_API)	+= isa.o
> diff --git a/drivers/base/context_bus.c b/drivers/base/context_bus.c
> new file mode 100644
> index 000000000000..6ddb6c27bf69
> --- /dev/null
> +++ b/drivers/base/context_bus.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +
> +#include <linux/context_bus.h>
> +#include <linux/init.h>
> +
> +const struct bus_type context_device_bus_type = {
> +	.name = "context-device",

add the .dma_configure callback instead of calling from the client driver.

> +};
> +EXPORT_SYMBOL_GPL(context_device_bus_type);
> +
> +static int __init context_device_bus_init(void)
> +{
> +	int err;
> +
> +	err = bus_register(&context_device_bus_type);
> +	if (err < 0) {
> +		pr_err("context-device bus registration failed: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +postcore_initcall(context_device_bus_init);
> diff --git a/include/linux/context_bus.h b/include/linux/context_bus.h
> new file mode 100644
> index 000000000000..0cd44cb5b147
> --- /dev/null
> +++ b/include/linux/context_bus.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __LINUX_CONTEXT_BUS_H
> +#define __LINUX_CONTEXT_BUS_H
> +
> +#include <linux/device.h>
> +
> +#ifdef CONFIG_CONTEXT_DEVICE_BUS
> +extern const struct bus_type context_device_bus_type;
> +#endif
> +
> +#endif /* __LINUX_CONTEXT_BUS_H */
> 

