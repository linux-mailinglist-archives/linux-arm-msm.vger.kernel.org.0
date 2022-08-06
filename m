Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F7E58B84E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 22:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbiHFU5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 16:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbiHFU5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 16:57:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64DC11800
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 13:57:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e15so7842857lfs.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 13:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+uP/G8pUlcnlOuRWgNx4UrZhwmsQF+f6tSwLwCsnVUY=;
        b=GL2IOBbZQUuBa6AuZkN6AZTAq/G+kLxYJTHyIMV5CaePKtKNcfQqQp9N3m9oHJ4e4A
         eEi9q0DLHLQOaQp4H1im/EGKJcKfIuWsRdGSKUxeC2EBnl/9ODLnZ5P5je15SHYeIcmo
         b083p9tY0C0WO1XxVTV8Hw+ZffoY8X7gC/OqLt9vxXFXHyEkXaqBBo0CfD6wgavk+EIT
         3Uh4f9X5/T112+dfTN5ePerG4DVnhkWzAIOn13a5Tr1shKSGl42Ttdqw5q3fY6fHC7sD
         oYpi9guj4egqk8O028RwJIRp7UjwdE3uVYqLHLwgI2+8a1YCQ1EA0g4C4LVn3KrsdIWn
         lapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+uP/G8pUlcnlOuRWgNx4UrZhwmsQF+f6tSwLwCsnVUY=;
        b=4pdHwirb2nh3Wdm9WE0PBS4Es9MRgievHBEttrFCxQ8f9Du5nR+Jw8zSXT6ZTzLyWs
         TKSlJKUoRKRR1/J3Cj5Y14cSZTCVpxDwK14w89A7ouBykZ0aWX83j2Fc0c21cwrEBeVY
         4Cb1sWOI8u6g17fI8e3NOuohxjvJQMAf0XLy+HWx1qcd4hMK393yt9ziIm50Abpai+5b
         OzrTy+UgA0spdbynvUXBP8ri8drEwOIPKUG5dwRHiTNkDdO0oTTuArayybKIZX3WGEY+
         rpGwKO3Lr6PxlEaVwZxqcXYqjgWzLrCQfCQHawI6mEizlzFyRzdSr+6lHoamWnLoPdcE
         +0CQ==
X-Gm-Message-State: ACgBeo2wS7atV/Jh4efKAbMD0uHyUrt8XumL638Bael0V3tgo+da5dG6
        DQvIg+4I2qQIYMzZk3twJgvOzw==
X-Google-Smtp-Source: AA6agR6B3HqqBKVlr5mYx8WAbe6Wd609r4Y5sMmlKKH3pGnKyeP91pTfUAioXwGzKmOC4+/3H79sPg==
X-Received: by 2002:a05:6512:159e:b0:48b:239e:c9 with SMTP id bp30-20020a056512159e00b0048b239e00c9mr3805721lfb.621.1659819421275;
        Sat, 06 Aug 2022 13:57:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25f65000000b0048b572e721asm518527lfc.107.2022.08.06.13.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 13:57:00 -0700 (PDT)
Message-ID: <6327ba5b-f3a9-7390-0456-67ba5ffde0b6@linaro.org>
Date:   Sat, 6 Aug 2022 23:57:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/8] remoteproc: qcom: Add compatible name for SC7280 ADSP
Content-Language: en-GB
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        devicetree@vger.kernel.org
References: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
 <1659536480-5176-4-git-send-email-quic_srivasam@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659536480-5176-4-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/08/2022 17:21, Srinivasa Rao Mandadapu wrote:
> Update adsp pil data and compatible name for loading ADSP
> binary on SC7280 based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>   drivers/remoteproc/qcom_q6v5_adsp.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 2f3b9f5..bb4494c 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -697,6 +697,24 @@ static const struct adsp_pil_data adsp_resource_init = {
>   	},
>   };
>   
> +static const struct adsp_pil_data adsp_sc7280_resource_init = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mbn",
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.is_wpss = false,
> +	.auto_boot = true,
> +	.clk_ids = (const char*[]) {
> +		"gcc_cfg_noc_lpass", NULL

The clock is not mentioned in dt bindings.

> +	},
> +	.num_clks = 1,
> +	.proxy_pd_names = (const char*[]) {
> +		NULL
> +	},

Is the empty array necessary?

> +};
> +
>   static const struct adsp_pil_data cdsp_resource_init = {
>   	.crash_reason_smem = 601,
>   	.firmware_name = "cdsp.mdt",
> @@ -737,6 +755,7 @@ static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
>   	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
>   	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
> +	{ .compatible = "qcom,sc7280-adsp-pil", .data = &adsp_sc7280_resource_init },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, adsp_of_match);


-- 
With best wishes
Dmitry
