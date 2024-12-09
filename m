Return-Path: <linux-arm-msm+bounces-40986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21FF9E8F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10DE128411D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 09:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D13217F2B;
	Mon,  9 Dec 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnTBb8tX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616E217F21
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738121; cv=none; b=dS2B/HpcoDRLCIlAj18KADeN971GSd0dxuWPD2J5//RKWPUhyQdKWNF00t2q7+kRFuLdZdmsrWlHy4beziIK/CUcEREVKxOSWXi39nXI7e6vcPRdnkOO+eZxs9WlLaYsCL1iYD1rVmFXWQRoP/XaFHHYduEaVF6KMPps8UiouLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738121; c=relaxed/simple;
	bh=OF8IHFpfgACEKTILhJU5a7s5El9km9y4LUVYegXHvF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owyaMie+4z9zowtkOmaL2K4kKDo7Ve8YwRzaLmsuJtWJVHJW4BUgjhsGVpjLlLKcfOASRBkvWazXs2nC1QRB8QjwjuYFD4d1aygBQGN4d6EWw8qILxVl0MOSDeWcq0uEsW72e3RahJyvarVdrGFxg1+qwMGw9wRgh51rRYYATYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnTBb8tX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434e3953b65so13157085e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 01:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738118; x=1734342918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoYbdSz7UumczsvgvFq1gtMn7sm/DrqPSyNoisj4lhc=;
        b=UnTBb8tXHaARaDPXq1ryqjBBZXGt/litInd+4ctv3b6nvs0ej3AztAN5P5wkG3IRGu
         QhrdyH1qPFx1tgGYjuYjsNxgcjUl3GxDrnIbymP9DgVuLLr5ko20LfudYR2Xcr5mzs5v
         1Y31NTUb0eZ1E9hb0AGuhNT48GD1eHQ6R+/6ETAodMwzKN/uOrXJs3uj/ZBWQwiayLfk
         2qUkDeQhTQ9Kbii03hMbrWLcJ4kTyjzXcpJ2wUzF9SUdssejQ8aYYAvphjqZ7NIwRJ9s
         eHEoJE9O1G8twbbwfOs3X+ZRqAJ9DLU1Xtwt2p1gY/Yg48ytTYxE0joU1qubWXL/wWA5
         Ox3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738118; x=1734342918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoYbdSz7UumczsvgvFq1gtMn7sm/DrqPSyNoisj4lhc=;
        b=vRTQ7lGD9x6f5VyRW7tYqxYdNCFHbMI/khWg/C66yagUqTNZVZqXHUNjaOuCr+X2uu
         rnpBtirSsVvAUMT29U3mph4orlJl2dOuHfw8AysbPKr8XS+rqeawSZvJoddaCM3RkmcW
         uPL31sYh1lYSCItrfCr/3Z95BPxympum28GS8q+X2A2+LxkkQQRAroU0weAfljtcUgiy
         4xbTqmsZkYRLaBHWRs7YBqbnUE1CAMW3QAuLl0Zb1AkBwZZBqWxKWVwKASKufbfli7TG
         Vsf1HbSEdxpwmu7vtlpxltnk5xTYsA8QP3P8Rd3zZ5xxqQ+iFvbM74Rgit7NcMVe7tKZ
         qDWw==
X-Gm-Message-State: AOJu0YzMyjDKejVmq/ona2UeuDa8SMjGZk4IqintDxEImhaSe0XY1Hbi
	AK15/KI1qqDMdxwo6cVcVYVHUSkEh0aMWAcclUrgqi4LdaPq2fwkE6BXzYBnqm+wFcDP3wVlgQ2
	d
X-Gm-Gg: ASbGncvhyoXHUeNd4gc+/YhtB4hYWJRf3lw66xwBrU0b43347A6QdPlf2VpdIQltS4i
	w6SLmfeW9L2YtJbfHXixfyh8KivdD4IhknN6FkF1nufaJlVl63OQkww6HoYJAe9fOIutpfUY/MT
	Ew8ZlBgXcHE8rElmWHIPKCpBlLVsghakdVFUFma1YmrJG53H4Ww1Se1qiIHI864JLDd2s7yunU1
	udT1qKSasy7K1cMBhsNMeLBlF0BT2konN6q6cOHNM3me/xOqfUekg3FrzRNYtFwFZV3
X-Google-Smtp-Source: AGHT+IG58sGqm9G4KF/wa5VnL28uIHDOt5c6w/WNR71o0EjNxa2YOdsi9O6TM91fztvfDHXZagiiTA==
X-Received: by 2002:a05:6000:1885:b0:386:32ca:aa0e with SMTP id ffacd0b85a97d-38632caaad0mr5793733f8f.5.1733738117915;
        Mon, 09 Dec 2024 01:55:17 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3862d9cf980sm9537280f8f.44.2024.12.09.01.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 01:55:17 -0800 (PST)
Message-ID: <60068361-ddb7-4906-84ca-195e5eb13a0f@linaro.org>
Date: Mon, 9 Dec 2024 09:55:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] nvmem: qfprom: Ensure access to qfprom is word
 aligned
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Naman Jain <quic_namajain@quicinc.com>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2024 23:42, Dmitry Baryshkov wrote:
> From: Naman Jain <quic_namajain@quicinc.com>
> 
> Add logic for alignment of address for reading in qfprom driver to avoid
> NOC error issues due to unaligned access. The problem manifests on the
> SAR2130P platform, but in msm-5.x kernels the fix is applied

Is this only issue with SAR2130P?

> uncoditionally. Follow this approach and uncoditionally perform aligned
> reads.

If there is a need of having proper register alignment this should go as 
part of the nvmem_config->stride and word_size configuration and not in 
reg_read callbacks.


--srini

> 
> Fixes: 4ab11996b489 ("nvmem: qfprom: Add Qualcomm QFPROM support.")
> Signed-off-by: Naman Jain <quic_namajain@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/nvmem/qfprom.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 116a39e804c70b4a0374f8ea3ac6ba1dd612109d..cad319e7bfcf34c9b9ab15eb331efda822699cce 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -322,15 +322,28 @@ static int qfprom_reg_read(void *context,
>   {
>   	struct qfprom_priv *priv = context;
>   	u8 *val = _val;
> -	int i = 0, words = bytes;
> +	int buf_start, buf_end, index, i = 0;
>   	void __iomem *base = priv->qfpcorrected;
> +	char *buffer = NULL;
> +	u32 read_val;
>   
>   	if (read_raw_data && priv->qfpraw)
>   		base = priv->qfpraw;
> +	buf_start = ALIGN_DOWN(reg, 4);
> +	buf_end = ALIGN(reg + bytes, 4);
> +	buffer = kzalloc(buf_end - buf_start, GFP_KERNEL);
> +	if (!buffer) {
> +		pr_err("memory allocation failed in %s\n", __func__);
> +		return -ENOMEM;
> +	}
>   
> -	while (words--)
> -		*val++ = readb(base + reg + i++);
> +	for (index = buf_start; index < buf_end; index += 4, i += 4) {
> +		read_val = readl_relaxed(base + index);
> +		memcpy(buffer + i, &read_val, 4);
> +	}
>   
> +	memcpy(val, buffer + reg % 4, bytes);
> +	kfree(buffer);
>   	return 0;
>   }
>   
> 

