Return-Path: <linux-arm-msm+bounces-5249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC058174D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 16:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CC21F20FCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 15:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4263D57D;
	Mon, 18 Dec 2023 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pk+tFcji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E0B3A1C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a233bf14cafso191840266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702912142; x=1703516942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bgQmz8t1GBIjgiSotCqtrsnCSidXviMtymxQF/RD8ok=;
        b=Pk+tFcji9a07Oz2ZyKX556cQ6SOcslk2+oIZ3M2mdH+GAX3qXKjKqcd+ddRtfojmzH
         dn/KN6sBp1lTJX2Vz++SO7enNAZ97Tj5w3wU6WlsdjdJ/wnJvhahv5jvJuI+w20Y0LLq
         rg6QnKxY1cjs3UEHBeSd+ygSBOAz+WgGk+U3NJyqTrMTJqSy1kxcuuZvKtfSvYpvtrcM
         f1og2i3FrFu5/5e3UvpHPQDzj+zCDn7WA7OsvQFSNOeMpqCJ+Tb66BAUde8LyHd93T68
         BNR902O5QoSybkoa34KatcMI0zvVmzk9Cd1qidmFxQbJunXahhNj/NYCBVApuP9KuU/I
         uJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702912142; x=1703516942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgQmz8t1GBIjgiSotCqtrsnCSidXviMtymxQF/RD8ok=;
        b=tXrMKZd7HqezfkxFkyNxlYtNDc1km+SvhCqcnFK8LzGKnmhTUMxKA2/6UHv80vjSH0
         AcMdHm2qKa4szWEe2sXZXHsGC9bo8zCyWHSlidfXkypcALakUv0enUIVl+IJ0ewZMRAc
         OMsxFKvH5m8UJq4m9F1pWnPixlrKIulmnBm5Trh0670cqp1RRV6MPwcJcfRaWQYLHaS/
         AKtlYkMhUSTqfUtGGLpd7g0zJ0yRC5OTmtpWVhwjJsDoCMCJm38+7cGnGFYBWR13O3wD
         SQY0pM7Cf0QptzpSZXmN7KySt56K7oQJ4992mTFm7hCZmqVPg1CAceOa1G7mup5BQm5V
         buRQ==
X-Gm-Message-State: AOJu0Yy2rgtM2wj9BKPca2UcGfnvK4XcH6sNv/Da3h7Z221GxWSEhgVu
	yXznyOMd6P8RhWVzXdcE2jh/5PZl++dIUA/nP98=
X-Google-Smtp-Source: AGHT+IEM/4dJ8JsMs3NF0LnYKFomqSOUVeXrx/p7qr04OFjJEYMJLYfdKlq2Q9gdpIwiXfw3sW0lCA==
X-Received: by 2002:a17:906:2207:b0:a1f:b467:9b93 with SMTP id s7-20020a170906220700b00a1fb4679b93mr6006306ejs.78.1702912142538;
        Mon, 18 Dec 2023 07:09:02 -0800 (PST)
Received: from [192.168.199.59] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm14201700ejc.77.2023.12.18.07.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 07:09:02 -0800 (PST)
Message-ID: <6c2e7cac-6f3d-42f0-84de-72a14e8f9ef5@linaro.org>
Date: Mon, 18 Dec 2023 16:09:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/34] media: iris: initialize power resources
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, mchehab@kernel.org, bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-8-git-send-email-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <1702899149-21321-8-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2023 12:32, Dikshita Agarwal wrote:
> Add support for initializing Iris "resources", which are clocks,
> interconnects, power domains, reset clocks, and clock frequencies
> used for Iris hardware.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
[...]

> +	ret = init_resources(core);
> +	if (ret) {
> +		dev_err_probe(core->dev, ret,
> +			      "%s: init resource failed with %d\n", __func__, ret);
> +		return ret;
You're supposed to return dev_err_probe, it propagates the errors
this way

Also, I think __func__ is excessive, throughout the code. You can
very quickly grep for the error messages, which are quite unique.

[...]

> +
> +static const struct bus_info plat_bus_table[] = {
> +	{ NULL, "iris-cnoc", 1000, 1000     },
> +	{ NULL, "iris-ddr",  1000, 15000000 },
> +};
> +
> +static const char * const plat_pd_table[] = { "iris-ctl", "vcodec", NULL };
> +#define PD_COUNT 2
> +
> +static const char * const plat_opp_pd_table[] = { "mxc", "mmcx", NULL };
> +#define OPP_PD_COUNT 2
> +
> +static const struct clock_info plat_clk_table[] = {
> +	{ NULL, "gcc_video_axi0", GCC_VIDEO_AXI0_CLK, 0, 0 },
> +	{ NULL, "core_clk",       VIDEO_CC_MVS0C_CLK, 0, 0 },
> +	{ NULL, "vcodec_core",    VIDEO_CC_MVS0_CLK,  1, 0 },
> +};
> +
> +static const char * const plat_clk_reset_table[] = { "video_axi_reset", NULL };
> +#define RESET_COUNT 1
Are you sure this won't change between platforms?
[...]

> +static int init_bus(struct iris_core *core)
> +{
> +	struct bus_info *binfo = NULL;
> +	u32 i = 0;
no need to initialize

[...]

> +static int init_clocks(struct iris_core *core)
> +{
> +	struct clock_info *cinfo = NULL;
> +	u32 i;
> +
> +	core->clk_count = ARRAY_SIZE(plat_clk_table);
> +	core->clock_tbl = devm_kzalloc(core->dev,
> +				       sizeof(struct clock_info) * core->clk_count,
> +				       GFP_KERNEL);
> +	if (!core->clock_tbl)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < core->clk_count; i++) {
> +		cinfo = &core->clock_tbl[i];
> +		cinfo->name = plat_clk_table[i].name;
> +		cinfo->clk_id = plat_clk_table[i].clk_id;
> +		cinfo->has_scaling = plat_clk_table[i].has_scaling;
> +		cinfo->clk = devm_clk_get(core->dev, cinfo->name);
> +		if (IS_ERR(cinfo->clk)) {
> +			dev_err(core->dev,
> +				"%s: failed to get clock: %s\n", __func__, cinfo->name);
> +			return PTR_ERR(cinfo->clk);
> +		}
> +	}
Are you not going to use OPP for scaling the main RPMhPD with the core
clock?

> +
> +	return 0;
> +}
> +
> +static int init_reset_clocks(struct iris_core *core)
init_resets

'reset clocks' is an old downstream concept

> +{
> +	struct reset_info *rinfo = NULL;
> +	u32 i = 0;
unnecessary initializations

[...]

> +
> +int init_resources(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = init_bus(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = init_power_domains(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = init_clocks(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = init_reset_clocks(core);
> +
> +	return ret;
return init_reset_clocks(core);

> +}
> diff --git a/drivers/media/platform/qcom/vcodec/iris/resources.h b/drivers/media/platform/qcom/vcodec/iris/resources.h
> new file mode 100644
> index 0000000..d21bcc7e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/vcodec/iris/resources.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _RESOURCES_H_
> +#define _RESOURCES_H_
> +
> +struct bus_info {
> +	struct icc_path		*icc;
> +	const char		*name;
> +	u32			bw_min_kbps;
> +	u32			bw_max_kbps;
u64?

> +};
> +
> +struct power_domain_info {
> +	struct device	*genpd_dev;
> +	const char	*name;
> +};
> +
> +struct clock_info {
> +	struct clk	*clk;
> +	const char	*name;
I'm not sure why you need it

> +	u32		clk_id;
Or this

> +	bool		has_scaling;
Or this

you could probably do something like this:

struct big_iris_struct {
	[...]
	struct clk *core_clk;
	struct clk *memory_clk;
	struct clk *some_important_scaled_clock;
	struct clk_bulk_data less_important_nonscaling_clocks[X]
}

and then make use of all of the great common upstream APIs to manage
them!

> +	u64		prev;
> +};
> +
> +struct reset_info {
> +	struct reset_control	*rst;
> +	const char		*name;
this seems a bit excessive as well

Konrad

