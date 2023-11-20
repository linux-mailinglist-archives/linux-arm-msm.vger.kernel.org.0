Return-Path: <linux-arm-msm+bounces-1228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C17F1D97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 20:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 820CD1C20F95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 19:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B65F36B00;
	Mon, 20 Nov 2023 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZRx1lOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4140792;
	Mon, 20 Nov 2023 11:56:51 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40839807e82so13551195e9.0;
        Mon, 20 Nov 2023 11:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700510209; x=1701115009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IupAvwev6oBUFLNeQ7ZfeBu1thzkNwuSAYfTF2EO4Nw=;
        b=GZRx1lOSbGvSqRmbW7Iq5To21mrEjm9qusrt/o+GLA2CpmBQNI3m0zjbBmkfnrcWVR
         /9m/3jp+fq/p6x4t03lZvcMpBAfDFYZVZr5hVKA32JZV8neUxg5G6ONBjwDNQznv8ioN
         MDiotjXGNOiozPsZWfP4CsAwrdEZcyyf7WnVAtuDFiDf3qpxGtqvCVwx2bjpI7njDBUm
         bl/Z2hknzFpG6iPGpY1qrzv1NgUDMPJ1BCzk/9xaNR+w9NW3z4YdT7602f1MIghNHhjX
         3hTXaJjWqy9h9DCcWHHQeJT/NBPGNm4/eAOL6Z0HTlZ8z/p8mmc2eY/yiYPFmdqtNYa2
         TR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700510209; x=1701115009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IupAvwev6oBUFLNeQ7ZfeBu1thzkNwuSAYfTF2EO4Nw=;
        b=grZ0JRKNJ7UYH0QbjsgpuAPd22kOB0QTzo40vZbT6qg1B3nRnz+IQadyxenkidzDRG
         7c9xb/BeBGy0vbu0bXZDtR3JOB2G8xQ9FcbsMKEhB6AYVj/o+tCa5QLXZr9aWjxCIRTX
         nWFCD7B7tAxH9WuTt+g2mtqHICQC937P3I4vpBeR96TZowKfZZuctcICd5aqe9XdkKLF
         MZmTQfUiQRnF5O+3rJhsP+Zn1mM+Fb3rxD/RgCLnZKvrFQK9klByV2tSNFe9puNl8LVk
         5xeErsVn0lWxM6tPYsQKgV9Ki8k49kaD3CrQwu54/uoMVDTQQivAwzKRUP43zSRG/ywZ
         622A==
X-Gm-Message-State: AOJu0YwvPzeaghlTLPCtuqab9QdKT0GY3IJUyrvS5ky7/xc9yGhAhGL6
	XGPXNOLoCbAGWJXmOrH+2wk=
X-Google-Smtp-Source: AGHT+IFOVyt+UsiUMNW3SwODANiNa7qL47ApDq5sA6MJK5eGLMX2ULynzicCEynEb0wPsT7uCBwD/Q==
X-Received: by 2002:a1c:7902:0:b0:405:3ab3:e640 with SMTP id l2-20020a1c7902000000b004053ab3e640mr393238wme.20.1700510209312;
        Mon, 20 Nov 2023 11:56:49 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id x16-20020a05600c21d000b004063cd8105csm18443804wmj.22.2023.11.20.11.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 11:56:48 -0800 (PST)
Message-ID: <2f14aab8-a5bb-4af4-9475-afe6b678a7fd@gmail.com>
Date: Mon, 20 Nov 2023 20:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: qcm: fix unused
 qcom_scm_qseecom_allowlist
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20231120185623.338608-1-krzysztof.kozlowski@linaro.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20231120185623.338608-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/23 19:56, Krzysztof Kozlowski wrote:
> For !OF builds, the qcom_scm_qseecom_allowlist is unused:
> 
>    drivers/firmware/qcom/qcom_scm.c:1652:34: error: ‘qcom_scm_qseecom_allowlist’ defined but not used [-Werror=unused-const-variable=]
> 
> Fixes: 00b1248606ba ("firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311191654.S4wlVUrz-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/firmware/qcom/qcom_scm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 520de9b5633a..ecdb367dc9b8 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1649,7 +1649,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>    * We do not yet support re-entrant calls via the qseecom interface. To prevent
>    + any potential issues with this, only allow validated machines for now.
>    */
> -static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
> +static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>   	{ .compatible = "lenovo,thinkpad-x13s", },
>   	{ }
>   };

Thanks! Given that we're right now only allowing qseecom clients to load
on devices within that list, maybe it would be cleaner to make
QCOM_QSEECOM depend on OF explicitly instead?

Anyway, I'm also fine with this solution.

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>


