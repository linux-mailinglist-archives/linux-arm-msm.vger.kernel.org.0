Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE562523ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 18:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345169AbiEKQuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 12:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345126AbiEKQuB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 12:50:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFAD1FE1DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:49:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bq30so4627807lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IIyLanREwoFCx9oDtJP6l/B2GLW4c3uyyeB7WHPqlcY=;
        b=hQAzUQgpbX2JYdHBjVsDzoxLXtlUQwzlLE3xUX4lIk/B4hD8khNTplc3IrbJgpxjNK
         QMob6SR1yxKEOuV7y5z8PgOVpPfRH8z7+LBnlMJx5EgIIE/orkkqAGNF9AGJd32nS0ca
         y2a2REBFsZudkVlDBZkJHyvfxl5fVtzMywgJ61Clbq3BnRVIK8KUf49I04U5uR46HiZE
         O1ai6iDAYhJzAb/C1XF1UCAZb+e3Z9iFGpuhyKPKan4B6GgQa3g27oowOmJ+jzTzayhm
         ApbPbRxQHSQpJrRRKLw8e88d8FFJn7rr9az2pTiBwbJlW94voFQ3ojN/MbJz1ypdaSeJ
         zYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IIyLanREwoFCx9oDtJP6l/B2GLW4c3uyyeB7WHPqlcY=;
        b=6IY+gOg8sy5xG0ClLlT4rPwoFkbx+x9iv//V+/OBppWY1hbPcxLh0kO1m3TJttQnwz
         063lun+pib9Nol4Sdvj62F6OBF2L8htgQojYU88NyhOFZoJkYw94fCfrG7ZGzc82jdpT
         i3YoSjOAsWgACUc05uXMD0K6Vllbac9FW8Qza1fxYRJ0gy4ahFW8OfDG0DZs1ck4S5tE
         MgDHAl5cmzKpnvOG98x6hH5+/ZyYDmkUJSEZYKXh7GMiSqM7FMmyujNvp2nRUB3uc3PA
         Pnq+GSN/nReCHZcD3wGlyjrNBWVmijWu3SjWj03HEHL7h3+KxvLvEoPp2Mtnbm+gawZg
         dGow==
X-Gm-Message-State: AOAM5331kl8uieqVBXzVSkIdEsu5VwIeHkFGSh2M8DwDjq4crdNJPvhK
        5RbnLe4N2LFiuKSAoCI70eHSow==
X-Google-Smtp-Source: ABdhPJxRxRD4JQYBVlHS8IbpgAaqLULxwcV4dQ97/QQyLbn3k+ah3uFu5iuDXB1dZuBPSADzZVyDAw==
X-Received: by 2002:a05:6512:1694:b0:448:3fd4:c7a9 with SMTP id bu20-20020a056512169400b004483fd4c7a9mr21053901lfb.29.1652287792448;
        Wed, 11 May 2022 09:49:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b28-20020a19645c000000b0047255d211c3sm351349lfj.242.2022.05.11.09.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:49:52 -0700 (PDT)
Message-ID: <8480eee1-42df-46b2-9ff5-2b09fdcc7dc6@linaro.org>
Date:   Wed, 11 May 2022 19:49:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/9] remoteproc: qcom: pas: Add MSM8953 ADSP PIL support
Content-Language: en-GB
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-remoteproc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220511161602.117772-1-sireeshkodali1@gmail.com>
 <20220511161602.117772-2-sireeshkodali1@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220511161602.117772-2-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2022 19:15, Sireesh Kodali wrote:
> Add support for the Audio DSP PIL found on the Qualcomm MSM8953
> platform. The same configuration is used on all SoCs based on the
> MSM8953 platform (SDM450, SDA450, SDM625, SDM632, APQ8053).
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 31 ++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 1ae47cc153e5..4dcb714a1468 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -617,7 +617,37 @@ static const struct adsp_data sm8350_adsp_resource = {
>   	.ssctl_id = 0x14,
>   };
>   
> +static const struct adsp_data msm8953_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.has_aggre2_clk = false,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		NULL,
> +	},
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +};
> +
>   static const struct adsp_data msm8996_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.has_aggre2_clk = false,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		NULL,
> +	},
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +};
> +
> +static const struct adsp_data msm8998_adsp_resource = {

This was dropped in 9ae45035ba2be4117edb8fd3952c3c5b84a0b820. Please 
take care when rebasing your patches.

>   		.crash_reason_smem = 423,
>   		.firmware_name = "adsp.mdt",
>   		.pas_id = 1,
> @@ -850,6 +880,7 @@ static const struct adsp_data sdx55_mpss_resource = {
>   static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
>   	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
> +	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8953_adsp_resource},
>   	{ .compatible = "qcom,msm8996-slpi-pil", .data = &slpi_resource_init},
>   	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},
>   	{ .compatible = "qcom,msm8998-slpi-pas", .data = &slpi_resource_init},


-- 
With best wishes
Dmitry
