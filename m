Return-Path: <linux-arm-msm+bounces-84236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B7C9F474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B2764E1150
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3BE2F3C35;
	Wed,  3 Dec 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFKO9xfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F682FB62A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771871; cv=none; b=XqIItyKfNbPJmoODIBq+DxyBkjP1DkMlcl9f7J74INe3HxzSV/pgFTUFMqdWLr7enistqsHVsKIfoRmEqTm+6OQLPd3/YIbGnffr0gdOrwXrOIlBCPFq4NBVeiTJSKPPaf4fo2+bPOOM+Xr9QZX97QsP6K49RKp4K0muylbNRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771871; c=relaxed/simple;
	bh=NTh9onWS6Fq5wa7tEf7oXXwR+ePGN88wyB1SfKGOWN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0ozGed/CaxWrWSQzoZeTSgt1ETRqEBiGm8GgBk+5eu2XwFXwEx80gOpW7a93uiBvGZQWgmJyV905XOG8GHZaARNpXRcto71TlNWoCxdKVEuOpQ1NI6iYt69UWR11SdBtkEJMcCSwyDcXjF9p37SXKA6UMfDiNsWLQ/p41HReQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFKO9xfz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2d7c38352so104130385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764771869; x=1765376669; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5qskISDAKCg4z+QIWL0gtQ4d2iJmhM+zHnIWEc1eUg=;
        b=AFKO9xfzSGliIo+f/ZOtOGirHrWAQaxlHW7FXUZ7ZeDWIWCFm3f7JLqEuZEbij9UBq
         0mUAb4xmQ+SC33/xiYIiVPV+GcZPJd8A35mwkUGqSbza6Cw1Rh+ipUXRQc6wolQpbDzM
         P3w/vAScGNYCbiLIlf2DyJUm/Oq9NddQmiEIPvVZCe1zW2IzVyqntQzgaqA6Of97OeiG
         zVXsYcUw/2YLL2KsRC2c6sQ4Fwxsujat9YytZuqLVjJdM5x2etm5S1RnlYy8ISqdbASH
         17Vp9FNQPJHh6dKXh0sn8hdCutN3I9oLJDOac1BwAg8LAF4eqmm2oA1Tfr5Hm0GRh1aI
         endQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771869; x=1765376669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5qskISDAKCg4z+QIWL0gtQ4d2iJmhM+zHnIWEc1eUg=;
        b=wXaOHfID9o41jJV70WqDs7D027lrPGBcXSe+ihVwyVTkZpr5LGS3R1MyHklGVXppg6
         ZPC9N8taJ5wsMZeiDOoBVGK/FU0WxiXZ/7qfyk0ew6XE6hPP+pwJUZMfY1QTdOfXL50H
         yaJAXdzASh5PhloFnbZMY41Aj+qfLbV3PVrA4Q9+982U3ABkH35JAGPHcA+mz9FQkYeZ
         aUz60mum4KjRLMDQ/JHdK5JioUuy8vJaQ2yiDnEI9x38AcrNbHIlNVv3WGt6uFGlQ7KO
         SuPBujcS85hM2V4PhgzpOBdrY5ThRcUuee/JUPlgzujG650Zho+O3NeaqzoHhiPec2kz
         SG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkyGn2XqW6Xs+PfTVa/G8In+R8kypKeEQ7S5I3qK0yjPqrsRDVmt7SoJALiz8Yi/biyqjFXdyDsuCKXoO+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvb2Ogvn1epMLv9QPjl1/XEcF+E8oqAdVBbhszGdOnjLSHX7wW
	xU4pUTOzufMpBr0sUaC6LVs5HBvyrx8b66ns5KMp6MBfaQr8gHXNiSqURLsybh5BPzWyF1kRFxi
	/ET66JaL7ZAKtzoXj75joU1KmVwdjVMXRqV4AoX6BmA==
X-Gm-Gg: ASbGnct6cYg1yJIXIP+r9s9Rf/CL3Fs8VAmJMpo5Z3krKaEPAvmgZuNoMKFanJ49Gfw
	fvkQWpxz00KCAuB1dlECzUPysrY0RNw73TBasMLSGtesKvpO882BwsfZAMuIBR289YIRMKXerEU
	MnATR3CI1SnNUw1SN6c6elH5TrwZPk9f0m5ZIe229q3KBvxGekX2LMIQwwjtumCmSak27UeR8h2
	XVsdVMnNmVDjXisyxEKAo3LPwhGy/a1oc9KZdeIpwK8jJpO5XDVM4WPFAbhmQ8cmD7RGdQaW3WK
	Vu/iACA4EHKRPVow4nRhnTIiiCQ9
X-Google-Smtp-Source: AGHT+IHW/wvz46cirJVdb0ydTGRkXFpB8nU++eDo7RKgpwGtmzjwrPlqlevKOHAq78DzOPpbB2V/P/w7c/OdxPVoer0=
X-Received: by 2002:a05:620a:4509:b0:8a6:1a5d:7ae8 with SMTP id
 af79cd13be357-8b5dffddeb6mr382232285a.28.1764771868569; Wed, 03 Dec 2025
 06:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 3 Dec 2025 14:24:17 +0000
X-Gm-Features: AWmQ_bnPqOnbB2FC46dO5gwckHxNG_hP9_zgKDxddjfNsZgM-YCOIMCE4ibSDP8
Message-ID: <CAJ9a7Vgd7+Gd5=Es=z17BB+DbOiL1WYGvNWx3uC0VyEngj2v0Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Add a list to store allocated etr_buf.
>
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>  drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index be964656be93..4d249af93097 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>                 idr_init(&drvdata->idr);
>                 mutex_init(&drvdata->idr_mutex);
>                 dev_list = &etr_devs;
> +               INIT_LIST_HEAD(&drvdata->etr_buf_list);
>                 break;
>         case TMC_CONFIG_TYPE_ETF:
>                 desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..292e25d82b62 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>         s64             len;
>  };
>
> +/**
> + * @sysfs_buf: Allocated sysfs_buf.
> + * @is_free:   Indicates whether the buffer is free to choose.
> + * @pos:       Position of the buffer.
> + * @node:      Node in etr_buf_list.
> + */
> +struct etr_buf_node {
> +       struct etr_buf          *sysfs_buf;
> +       bool                    is_free;
> +       loff_t                  pos;
> +       struct list_head        node;
> +};
> +
>  /**
>   * struct tmc_drvdata - specifics associated to an TMC component
>   * @pclk:      APB clock if present, otherwise NULL
> @@ -242,6 +255,8 @@ struct tmc_resrv_buf {
>   *             (after crash) by default.
>   * @crash_mdata: Reserved memory for storing tmc crash metadata.
>   *              Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
> + * @reading_node: Available buffer for byte-cntr reading.
>   */
>  struct tmc_drvdata {
>         struct clk              *pclk;
> @@ -271,6 +286,8 @@ struct tmc_drvdata {
>         struct etr_buf          *perf_buf;
>         struct tmc_resrv_buf    resrv_buf;
>         struct tmc_resrv_buf    crash_mdata;
> +       struct list_head        etr_buf_list;
> +       struct etr_buf_node     *reading_node;
>  };
>
>  struct etr_buf_operations {
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

