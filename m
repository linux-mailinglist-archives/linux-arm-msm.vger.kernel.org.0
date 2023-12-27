Return-Path: <linux-arm-msm+bounces-6007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35381EB58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 02:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32C41C20B94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 01:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18A54403;
	Wed, 27 Dec 2023 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8Z2I4aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A38440A
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 01:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e18689828so4884073e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 17:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703641396; x=1704246196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVbiyMv2oFYAbbw/EcuzGTtqEIvLrA4YELHXiLQOTVs=;
        b=I8Z2I4aTFjEgeXHic+U4venIXgFzrfdTCmzCRpqNdHiFhcNKLjgyQTw/nBHHTWwXDc
         BrU4A3sVGWgFXujIYQA8X6os7CrKaPc3VTOG4h9MG3Mfl+4yiplT3XssQpxYqWW71hDs
         PHhKNYBqqD0r8AyvMMstFIOzIpkqM7i+TNBRYd3OiR5uQl43F1hYYIEvr6IFEIqQoi3g
         qkmsxLVb+qCWJN4XqwgBmm1v3ZRxSWqLpp3jMlwWyZLcm9JBViDcT/jUmtoMo5XwBO4D
         7Laq8TuYN4VcPqe58N9g+4V4W8ecRT9TS0DXySOs7xx/Z7W8Q0Mk9uuSZ+c+Hsh27oqU
         xlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703641396; x=1704246196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVbiyMv2oFYAbbw/EcuzGTtqEIvLrA4YELHXiLQOTVs=;
        b=MEXHd9JHhbIe2JSvl7PJiOIR9enmjxQWWRuOHkd0E2CLS3WRJBhAfMfg4gae8DN9zS
         GSqE+MWhYPlC3b7LrRPHnDQD+jxPKT5Py+P4nv6U7mxoUirakDMitgdCalJx2OhcLZY5
         lL6+YO1C0EJoRk4aDTkYJdEuwjOzL5BBELgWgfk77mkwEOy20fX2LG/8BhC3n9F4s+i7
         kLE54lpUVD/+SoUCrpUzxMfZnLMxc2WJ3zKSBG5rIp5KRBFZ5DHfTOe+YDTr7jnYVjIi
         jUM06KVcA3EciB0la1D4T4ReFn/xNw/BFT1ZfAYVtos46cu+xxJ/69wtNStXXBFphYeZ
         fHYw==
X-Gm-Message-State: AOJu0YxnC4Oo3KPlCa9dq/5bF4o3DGQK26EG9kLKDJh/Z9/Ry6EpaGvW
	U8+HSL7vbCkJLk1OuBw9g+/2hP+hVVZjJA==
X-Google-Smtp-Source: AGHT+IE3M9rMpS1XtnmEqVW9uMH/7gA6t9ycmhPBwcJgCqKASk222aB431k/SOLcagnhW8U88Q4fCQ==
X-Received: by 2002:a05:6512:21aa:b0:50e:3907:46b7 with SMTP id c10-20020a05651221aa00b0050e390746b7mr2205712lft.107.1703641395939;
        Tue, 26 Dec 2023 17:43:15 -0800 (PST)
Received: from [192.168.199.125] (178235179028.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.28])
        by smtp.gmail.com with ESMTPSA id da22-20020a056402177600b00554c92fc1b7sm3488953edb.24.2023.12.26.17.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 17:43:15 -0800 (PST)
Message-ID: <3561f0ea-f6a7-42e5-a51a-3efa75de8661@linaro.org>
Date: Wed, 27 Dec 2023 02:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] remoteproc: qcom: mss: add configuration for
 in-kernel pdm
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
 <20231226003447.3044365-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231226003447.3044365-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2023 01:34, Dmitry Baryshkov wrote:
> Add domain / service configuration for the in-kernel protection domain
> mapper service.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/remoteproc/Kconfig         |  1 +
>  drivers/remoteproc/qcom_q6v5_mss.c | 84 ++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index f1698d4c302e..8152e845f7a3 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -202,6 +202,7 @@ config QCOM_Q6V5_MSS
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>  	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> +	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
>  	select MFD_SYSCON
>  	select QCOM_MDT_LOADER
>  	select QCOM_PIL_INFO
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 394b2c1cb5e2..0bc611165657 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -26,6 +26,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/pd_mapper.h>
>  #include <linux/iopoll.h>
>  #include <linux/slab.h>
>  
> @@ -163,6 +164,9 @@ struct rproc_hexagon_res {
>  	bool has_qaccept_regs;
>  	bool has_ext_cntl_regs;
>  	bool has_vq6;
> +
> +	size_t num_domains;
> +	const struct qcom_pdm_domain_data * const *domains;
>  };
>  
>  struct q6v5 {
> @@ -242,6 +246,9 @@ struct q6v5 {
>  	u64 mba_perm;
>  	const char *hexagon_mdt_image;
>  	int version;
> +
> +	size_t num_domains;
> +	const struct qcom_pdm_domain_data * const *domains;
My ocd says num_x should go below x, but that may be a DT leftover..

[...]

>  
> +static const struct qcom_pdm_domain_data mpss_root_pd = {
> +	.domain = "msm/modem/root_pd",
> +	.instance_id = 180,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data msm8996_mpss_root_pd = {
> +	.domain = "msm/modem/root_pd",
> +	.instance_id = 100,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data sm8150_mpss_root_pd = {
> +	.domain = "msm/modem/root_pd",
> +	.instance_id = 180,
> +	.services = {
> +		"gps/gps_service",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data mpss_wlan_pd = {
> +	.domain = "msm/modem/wlan_pd",
> +	.instance_id = 180,
> +	.services = {
> +		"kernel/elf_loader",
> +		"wlan/fw",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data *msm8996_mpss_domains[] = {
> +	&msm8996_mpss_root_pd,
> +};
couldn't find anything on 96

> +
> +static const struct qcom_pdm_domain_data *sdm660_mpss_domains[] = {
> +	&mpss_wlan_pd,
> +};
matches my findings

> +
> +static const struct qcom_pdm_domain_data *sdm845_mpss_domains[] = {
> +	&mpss_root_pd,
> +	&mpss_wlan_pd,
> +};
can't see this wlan one, maybe just on my device

> +
> +static const struct qcom_pdm_domain_data *sm8350_mpss_domains[] = {
> +	&sm8150_mpss_root_pd,
> +};
matches my findings

>  static const struct rproc_hexagon_res msm8998_mss = {
> @@ -2309,6 +2389,8 @@ static const struct rproc_hexagon_res msm8998_mss = {
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8998,
> +	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
> +	.domains = sdm845_mpss_domains,
>  };
matches my findings

Konrad

