Return-Path: <linux-arm-msm+bounces-13516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94961873BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 17:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E79F1F25792
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 16:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AE5137911;
	Wed,  6 Mar 2024 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IV4t6jld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB9137752
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709741931; cv=none; b=GEuH5FboNS8yW4UQya2PBe/0sX0p1HKxHQ8HF4wZFmyJbWT1aCl4KD3Bj9D064wfDixZujC6uRX+R4NW0BoeGV+SKj7SwXGur3dNsw1yEYCBsPLNWyRLtmRReO6Fw/FuN0VkKHC4FmXuu72XtjzcBkXEsDN2rpEPDZMH+3AD++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709741931; c=relaxed/simple;
	bh=4VWeBYARvXlXtxRM3ztD5oedY7YP+mKI+ej/UlpRijk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8mOHJ1MKDISPymayzg+p6yP96COriPDhm/WuT7xxJyN/QINBG1stbdeX2zho2OPUV+U8ip61YQPIzs8GjUEph3UCBgkncL2kEX4lXut0OUVavhUXVoiKGUecFJ09g05Ahs6uNOKUgQ0egeyAgT3aWR2etqZ8NJh3yESEKGM2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IV4t6jld; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51321e71673so1206345e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709741927; x=1710346727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hrydq/RdJikRIfc87umFKTutUZLP8jNuTQIOBJnDlns=;
        b=IV4t6jldN0Yf3RpFUBlzaFdtPsz6tMrLHX57u0bj4Zs60faOWEnJBjVnFP6mGsgkE+
         Z5a9FWChfJUbrIo7QMnXJzKUd14ypd8mc38Bv+WeA+1lUVCmj0m9hkkU9yNF+WfaxQN0
         qJ3Kv0UIRrK14JK4yQjFkpZIViKTqDkJrUptQed8I6ikz/dI2e60AZGqdnavs0smlraN
         6PF+O0SG3eRFakAUVK2sxCm66kAcCs+v99pANbzCr/EJgIUFcUa42nO2jcH9XMBN8Hy/
         Fxy5eZDOrMFX2aL0q10HlYZCDVRcX3hc1DMHCrOoBgI2nf48xiQTur36AbFOWBcE3exi
         GoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709741927; x=1710346727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hrydq/RdJikRIfc87umFKTutUZLP8jNuTQIOBJnDlns=;
        b=Lj+wB8FWxjg/cYktLET63L5v5+J9hxH211aXXO0LQD6YnjtLtWScvE8Y74ZJb+pnnP
         xZvf6GcY+uHby9cDgtC1s4Wn9rBf2hMOSQuBp/MPg6C/zk0HTgQw678KBHqAclXta2Wn
         Fj2h+0H4tbW4zhOZ2Ssel65PJCzhu/t5J8nU5cYKnaaXyvy4eL3aXXyDQseJGIaCgMDZ
         /O0iJL8jRch09YfXl1iK6iGgLFPevLeXBI4wMnumLjn2CehfoMmnbiQmKXCcq9MzIXOY
         c9oDTJpJl0KVqr64ojoZMLQOSbUOh7Tpa4vGUECwt69ivsMEohEAwH4eAsYHEdjD4Jg7
         0Iqw==
X-Forwarded-Encrypted: i=1; AJvYcCWleIXIi3nOb1R48UIxcozBO7GvqlSXtMyJp46nV3zvlY2ePVynG9WxuncPYbjggwCK1DOsVTffxfbYYG0MhW2jwSr2Zq4cw+PJxCHgDw==
X-Gm-Message-State: AOJu0Yys2MWY4875WzJV0RbWTgLbe1aCA5PajiPYRCErE/H0nkUYusq+
	MsJi9jH9U5p5khGQt1n5dgVg5baef+FVo+oKlxn98XWj5q51wRDYhXgAH+gdwqI=
X-Google-Smtp-Source: AGHT+IGKdJ4IIIOuKLJDe+yk/Iutux3iHWYuZ2nSTLmqZtFgNnLz9ofothAzyQzmMciLDmY7KjCTUA==
X-Received: by 2002:a19:e006:0:b0:513:25b9:6cf8 with SMTP id x6-20020a19e006000000b0051325b96cf8mr3681484lfg.19.1709741927501;
        Wed, 06 Mar 2024 08:18:47 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b005131941f7e9sm2668396lfo.5.2024.03.06.08.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:18:47 -0800 (PST)
Message-ID: <b5ade82e-3a7e-427f-907f-bafe1d203d45@linaro.org>
Date: Wed, 6 Mar 2024 17:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] interconnect: qcom: icc-rpmh: Add QoS
 configuration support
Content-Language: en-US
To: Odelu Kukatla <quic_okukatla@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, cros-qcom-dts-watchers@chromium.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, quic_rlaggysh@quicinc.com,
 quic_mdtipton@quicinc.com
References: <20240306073016.2163-1-quic_okukatla@quicinc.com>
 <20240306073016.2163-2-quic_okukatla@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240306073016.2163-2-quic_okukatla@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/6/24 08:30, Odelu Kukatla wrote:
> It adds QoS support for QNOC device and includes support for
> configuring priority, priority forward disable, urgency forwarding.
> This helps in priortizing the traffic originating from different
> interconnect masters at NoC(Network On Chip).
> 
> Signed-off-by: Odelu Kukatla <quic_okukatla@quicinc.com>
> ---
>   drivers/interconnect/qcom/icc-rpmh.c | 105 +++++++++++++++++++++++++++
>   drivers/interconnect/qcom/icc-rpmh.h |  32 ++++++++
>   2 files changed, 137 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index c1aa265c1f4e..b4681849df80 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -1,19 +1,57 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
>    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> +#include <linux/clk.h>
>   #include <linux/interconnect.h>
>   #include <linux/interconnect-provider.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/slab.h>
> +#include <linux/bitfield.h>

Please keep the alphabetical order

>   
>   #include "bcm-voter.h"
>   #include "icc-common.h"
>   #include "icc-rpmh.h"
>   
> +/* QNOC QoS */
> +#define QOSGEN_MAINCTL_LO(p, qp)	(0x8 + (p->port_offsets[qp]))
> +#define QOS_SLV_URG_MSG_EN_MASK		BIT_MASK(3)

Mixing BIT_MASK and GENMASK is very confusing..

> +#define QOS_DFLT_PRIO_MASK		GENMASK(6, 4)
> +#define QOS_DISABLE_MASK		BIT_MASK(24)
> +
> +/**
> + * qcom_icc_set_qos - initialize static QoS configurations
> + * @qp: qcom icc provider to which @node belongs
> + * @node: qcom icc node to operate on
> + */
> +static void qcom_icc_set_qos(struct qcom_icc_provider *qp,
> +				struct qcom_icc_node *node)
> +{
> +	const struct qcom_icc_qosbox *qos = node->qosbox;
> +	int port;
> +
> +	if (!qp->regmap || !qos)
> +		return;

This is not possible if you follow the code flow, I think..

[...]

> + * @prio: priority value assigned to requests on the node
> + * @urg_fwd: whether to forward the urgency promotion issued by master(endpoint), or discard

space before the opening brace, please also wrap to 80 lines

> + * @prio_fwd_disable: whether to forward the priority driven by mster, or override by @prio

typo: mster, please also wrap it

Konrad

