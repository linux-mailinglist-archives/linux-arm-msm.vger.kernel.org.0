Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8977F6CB955
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 10:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjC1I05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 04:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjC1I04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 04:26:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C7B2108
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 01:26:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id br6so14720002lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679992013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=na5dU8j4hUSz+LpMVxaZjUT0LscrMVekYoZzcEuim40=;
        b=hQXUQLS56F8ZLe+bGijxEYa0a9spAHLUQs9im3IBj4CBlv4vkmoJWcutK2iG6meywx
         2bU4stm8VOZoqid+CKszvznC1LoZn6dNlhGRqrqHYqQLmsb/jHGQgHWXYmHrYj7Nzl5D
         gmOVBjJkMBFIFAlLDQ1z9s3L5EB3a72hPJhIe5OTSSrjfTaCFlzLJrI6Bf3aR3Mcy7RI
         AAWa7Lf8uBfdGAKryJEc1cjfrAN8yoUYGWOEsBP0WioGi8oy2YYZS001TsdorLxgKv7r
         9LzLnPzFU+x5iYo8okVQHK9SXdYNFzLl+bYDkItBeQjXR838fRkDxbvI1d3f/FeHw9qy
         KfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=na5dU8j4hUSz+LpMVxaZjUT0LscrMVekYoZzcEuim40=;
        b=YUoxX9aoAP0j6tnheatVRMk6Dqbiqds+RtaaMyTsVt/SyYHNFky7vDEK9QMCMGQgS2
         cJXGoICYYlizKn+tQkbWwtzDlqmqIDiQcGcRgPZ80djegbHEf9k/SHjYH8nSvMZkGkrp
         b2yppMI+NtJWGdeiF2Jk91v6sHZZk5d8sul4cE8u84NaOAIA16hh9lWUkVh6W2pJR2m7
         1SQQotPc1UOP4AXz4vhBgXXjdvXTpNnbpERl/usH3FN4C3r8OE/STor/3ICYzVMGk+NU
         390Cnbz2xuljLOFocxJUMjNhvfN5AXRE5GhLC+mKExutbGF+RwerzDsuh7kIUeSU2K7p
         8jUA==
X-Gm-Message-State: AAQBX9cobMBTlJtJ5CIlVpCBXANSwiWHJGSXtgC5jP2UwtgxKOq6ibi9
        NQp9gb9Ayt/TOhLcU6XUxn+N+w==
X-Google-Smtp-Source: AKy350bTbvRrCFBHeHCC8lXZAkKRffXvsoOFUgqkWKF2uDVfSEajVbD+IdiUn+Dn/totoL0zUVOYDg==
X-Received: by 2002:ac2:5551:0:b0:4dd:cef0:c27c with SMTP id l17-20020ac25551000000b004ddcef0c27cmr3908984lfk.33.1679992012939;
        Tue, 28 Mar 2023 01:26:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id d8-20020ac241c8000000b004cb14fa604csm4953863lfi.262.2023.03.28.01.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:26:52 -0700 (PDT)
Message-ID: <5a835e27-cc9e-d04c-a1ec-2756b0476d98@linaro.org>
Date:   Tue, 28 Mar 2023 10:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] remoteproc: qcom: pas: add SDM845 SLPI resource
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230327183736.496170-1-me@dylanvanassche.be>
 <20230327183736.496170-3-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230327183736.496170-3-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.03.2023 20:37, Dylan Van Assche wrote:
> Add SLPI resources for the SDM845 Qualcomm SoC to the Qualcomm
> remoteproc q6v5_pas driver to define the default firmware name
> and GLink edge name.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index c99a20542685..d82b6f4bced4 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1028,6 +1028,22 @@ static const struct adsp_data slpi_resource_init = {
>  		.ssctl_id = 0x16,
>  };
>  
> +static const struct adsp_data sdm845_slpi_resource = {
> +		.crash_reason_smem = 424,
> +		.firmware_name = "slpi.mdt",
> +		.pas_id = 12,
> +		.auto_boot = true,
> +		.proxy_pd_names = (char*[]){
> +			"lcx",
> +			"lmx",
> +			NULL
> +		},
> +		.load_state = "slpi",
> +		.ssr_name = "dsps",
> +		.sysmon_name = "slpi",
> +		.ssctl_id = 0x16,
> +};
Not sure why you're adding this just to remove it in the next
patch. You can just assign a different one here and then clean
it up for all others.

Konrad
> +
>  static const struct adsp_data sm8150_slpi_resource = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
> @@ -1201,6 +1217,7 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
> +	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource},
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
