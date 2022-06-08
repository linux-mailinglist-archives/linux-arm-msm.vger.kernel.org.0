Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B75B542EB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 13:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237667AbiFHLEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 07:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237684AbiFHLEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 07:04:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8355F1F89BC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 04:04:19 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so10892103wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 04:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=IU+Wnu+858a67r67UjRky1bkHMcNVgM3o6W1D+ENT84=;
        b=da7gIO01521hVerrm97QisYV7ITwbgby2F648j1xu6Gm+pRSfk8pJ+ZqFHzSyTDyTC
         DwOC7Dvbd42xGrXI7EgGTScP99k+jHUs38Sdc9Fv531QnxbaqSkd3tv9p1LmdTYWSQJQ
         Xw9JwQUS+lszMLVu+C7qDpzd97jJSHW2vjv72kBNuazWcEu5csZMk6nI1INFXyUZuymB
         jG/+UkzgME3b+F0Gq0WBUWl8KHTxpjh9gqx9YZVZHGdihCJkC2hqyrho9L2lT8skUhrm
         Vg6yaC+xPhE5YB0t6zQp6ltslaj0Uey2d2xTKcVEpUXrDRuVTqX6gsNra503jelXVXrO
         onmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IU+Wnu+858a67r67UjRky1bkHMcNVgM3o6W1D+ENT84=;
        b=5339Y5YaWmXbH0h7DhnWUBYaJexjs+5aM3CdwgML4R3i/R3eDajTsk2h43ZmkcFsGg
         YBL1vNcCnIJhEuB5AbGGJvETLK6fhmidyvq3qGDmG9MYyT0AAixBLKmlH6Xw+bsdMIvR
         aR9kJ8Bzlgv5GPfiICCXxB/ESl+yXvfDX3GPP1go+35I2jHrcpbK2ittbyJog9QReNQo
         vMYy01b11P5P7Df9ORfKFpK5f27us3Ao1PhyQRh2Q+4jzkkojvIcN2kpKtSx8B/2K9Ei
         EPAt1h+25tKq1KURd0VEuAbe2cqtt/SJNZCURIA+23qHFEDk6g8GuQPYvS5rZcrtWLj7
         u3ww==
X-Gm-Message-State: AOAM532typ5g1/Wv8nXzxkTjtRLbc0SPg0ySsczzcVFdVSs8T2eRTuiV
        qmK4kqnSvJ5ifPG3XwHsJ4Fdog==
X-Google-Smtp-Source: ABdhPJz1MjWO0EbYP4tnqOtIlELTAxzX8+SuS5EDFPjou2XcZR1ZoG28fw94OHfgk5oA6727UgVe7w==
X-Received: by 2002:a05:600c:4e50:b0:39c:eeb:dabe with SMTP id e16-20020a05600c4e5000b0039c0eebdabemr50348552wmq.190.1654686257815;
        Wed, 08 Jun 2022 04:04:17 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id u15-20020a05600c19cf00b003973b9d0447sm25238793wmq.36.2022.06.08.04.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 04:04:17 -0700 (PDT)
Message-ID: <7b855cc5-5f6c-6668-5ec6-1b5f011a0916@linaro.org>
Date:   Wed, 8 Jun 2022 12:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] ASoC: qcom: soundwire: Add software clock gating
 requirement check
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, vkoul@kernel.org
References: <1654667824-3760-1-git-send-email-quic_srivasam@quicinc.com>
 <1654667824-3760-3-git-send-email-quic_srivasam@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1654667824-3760-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/06/2022 06:57, Srinivasa Rao Mandadapu wrote:
> Validate software clock gating required or not and do software
> clock gating on hclk if soundwire is operational and keep it
> running by adding flag in private dat structure.
> This is to avoid conflict between older architectures,
> where software clock gating is not required and on latest
> architectues, where software clock gating is mandatory.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>   drivers/soundwire/qcom.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 38c3bf5..930aa93 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -194,6 +194,12 @@ static const struct qcom_swrm_data swrm_v1_5_data = {
>   	.default_cols = 16,
>   };
>   
> +static const struct qcom_swrm_data swrm_v1_6_data = {
> +	.default_rows = 50,
> +	.default_cols = 16,
> +	.sw_clk_gate_required = 1,

.sw_clk_gate_required = true,

instead of 1 and 0

Once fixed,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini



> +};
> +
>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>   
>   static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> @@ -659,7 +665,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>   	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>   	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>   
> -	reset_control_reset(ctrl->audio_cgcr);
> +	if (ctrl->audio_cgcr)
> +		reset_control_reset(ctrl->audio_cgcr);
>   
>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>   
> @@ -1312,6 +1319,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   			return PTR_ERR(ctrl->mmio);
>   	}
>   
> +	if (data->sw_clk_gate_required) {
> +		ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> +		if (IS_ERR(ctrl->audio_cgcr)) {
> +			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
> +			ret = PTR_ERR(ctrl->audio_cgcr);
> +			goto err_init;
> +		}
> +	}
> +
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
>   	if (ctrl->irq < 0) {
>   		ret = ctrl->irq;
> @@ -1337,10 +1353,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>   	ctrl->bus.clk_stop_timeout = 300;
>   
> -	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> -	if (IS_ERR(ctrl->audio_cgcr))
> -		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> -
>   	ret = qcom_swrm_get_port_config(ctrl);
>   	if (ret)
>   		goto err_clk;
> @@ -1494,7 +1506,8 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>   		qcom_swrm_get_device_status(ctrl);
>   		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>   	} else {
> -		reset_control_reset(ctrl->audio_cgcr);
> +		if (ctrl->audio_cgcr)
> +			reset_control_reset(ctrl->audio_cgcr);
>   
>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>   		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR,
> @@ -1559,7 +1572,7 @@ static const struct dev_pm_ops swrm_dev_pm_ops = {
>   static const struct of_device_id qcom_swrm_of_match[] = {
>   	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>   	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
> -	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_5_data },
> +	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>   	{/* sentinel */},
>   };
>   
