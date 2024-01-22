Return-Path: <linux-arm-msm+bounces-7822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A56DC836BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1E71C25888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 16:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D10946442;
	Mon, 22 Jan 2024 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIiOoEA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16BC4643D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937301; cv=none; b=p3QXEzpwFdfve5iwA5ptKdR5G9lIAiazjF3kJMAxJMnJuklHpNzy30IoINka9nSufSJa2LdN9HQ34ytVHmIFSyDhcgX3Zn2LXYJlcOQUtj+XjsbuT6W2HngxSq9AitmFqY18Xmc3WkEZHVMPdp0ZFp6EOmZIJPPycpwYMqKlAy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937301; c=relaxed/simple;
	bh=gJy6V6En8oglansz0+6dCHlstxS4CBQ5FEsC6dHHVuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YVHATWeJnLM00VS8PKxMdCtJ0Gu4+/Hiwo7xXcB0/BdkZ/NiKKck/5+FNoxOq3wwF0+6WMmPESQf4vso/o6f/gRnfUKEuKUqplUhWPVP7hP0ttO47exaH4Q9YfXCNIs6PGL9epdWjngWib4rSpZoSlh+CPztvlMOBinnkBXFb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIiOoEA3; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so5817974a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705937298; x=1706542098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivoj0IdiB6s2UMY3NlBWWJcKrLIKVYX5ec1XAbyGp20=;
        b=GIiOoEA3ZCj7/E1zfiMZqxry/s2q5+oFkfJ1xChenKyFyjhQXU0oeysgxmUe9Ss4Dw
         7pNciGtfNchvzOPGpOP0W8e8mxgwk7cD3Ld1+DzX2YXQcmOlG2QWYKWaFFrB/q8sWOFd
         vR7caWMloP5qh0jJTMqD14PgT7wyo/4mEUpenQc0YZ0N9fOWsAil5mmqTiKdeGfvFyZq
         4v5nCgA1LsVBjvWVuoeRns3WOb9+9mdLbv8fBjWLpPmTbNWRwo80boXpGoXJE0C0ugak
         +Ble7txpkFfqYZCCHllDv8qfuYR5gd7IUDNLMvx+NDXGx2R50qNGfZNCXaLjVmRAwDvz
         dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937298; x=1706542098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivoj0IdiB6s2UMY3NlBWWJcKrLIKVYX5ec1XAbyGp20=;
        b=Fsa1g0pV6Eh1arrjP29ucxiPlg3kHn/hbZQvR22uZafsCiAqF+vdTvs/VFit3EesE1
         87WqgHBu4DcgUCMm6QaxZ9lcsAs2m7tnAK9H/1WhZ3XQ1acAjr+D7SPGiD6OOoSqr87D
         wcubOI/aPE2crMsTWAu62o56pqVG3hSkSEHC83NPwdQVMBi4Prrs4UwlziXGouNQuWTp
         Z3de8m/kBkyr47U3vvB6YAkdijr6J7iQ+tiVZN+1qesQKYKJnnpml9ArtZy207sxJjka
         6Ioc2y627BgHKo6oGww/t4MmhPmKMuXpqv/r7PAhUjV7qF7PZKOWrTjv+wYrkscmJSTO
         nrmA==
X-Gm-Message-State: AOJu0YzfFJSj65zaYQEhG8eaXX1uJEPOI8lWyZEJ5rHL616HUnvPnwWU
	iwpRdVh65r+e+XWzF+QqFUevDsamLNTfHgdqmjFUtFPproJSWOqbAd/U63yJOcSvafhH9vTOA3S
	D
X-Google-Smtp-Source: AGHT+IG05z7/zQiSaBaTxMhSPIN7Oz0gWhKCEPa2yIsUouLEDwJED54o+9fiThp56KqzXZOvMwGJTA==
X-Received: by 2002:a50:fc18:0:b0:55a:1e6a:496f with SMTP id i24-20020a50fc18000000b0055a1e6a496fmr84736edr.33.1705937297885;
        Mon, 22 Jan 2024 07:28:17 -0800 (PST)
Received: from [192.168.231.132] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id j9-20020a508a89000000b00554930be765sm14754031edj.97.2024.01.22.07.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 07:28:17 -0800 (PST)
Message-ID: <ebed24aa-e190-4735-b618-7d74fadd900c@linaro.org>
Date: Mon, 22 Jan 2024 16:28:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [2/4] interconnect: qcom: sc7280: enable qos programming
Content-Language: en-US
To: Odelu Kukatla <quic_okukatla@quicinc.com>, georgi.djakov@linaro.org,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240122143030.11904-1-quic_okukatla@quicinc.com>
 <20240122143030.11904-3-quic_okukatla@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240122143030.11904-3-quic_okukatla@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 15:30, Odelu Kukatla wrote:
> Enable QoS for the master ports with predefined values
> for priority and urgency.
> 
> Change-Id: I1c4515402bcd6df8eed814be096aa5e1fc16cef6
> Signed-off-by: Odelu Kukatla <quic_okukatla@quicinc.com>
> ---
>  drivers/interconnect/qcom/sc7280.c | 250 +++++++++++++++++++++++++++++
>  1 file changed, 250 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/sc7280.c b/drivers/interconnect/qcom/sc7280.c
> index 7d33694368e8..719844c34894 100644
> --- a/drivers/interconnect/qcom/sc7280.c
> +++ b/drivers/interconnect/qcom/sc7280.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   */
>  
> @@ -16,29 +17,59 @@
>  #include "icc-rpmh.h"
>  #include "sc7280.h"
>  
> +static const struct regmap_config icc_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,

If you don't bother having .max_register, perhaps it could be defined
in a common file?

Also, do you really need locking between each access? If not, add
.fast_io = true

Konrad

