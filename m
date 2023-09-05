Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5724793026
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 22:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243839AbjIEUi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 16:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbjIEUi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 16:38:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE1AD1
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 13:38:53 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so460367166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693946332; x=1694551132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qISIWFWT+90Xd6ZFQOF4flQ0s4igN8yW6IgB7edRboU=;
        b=EXUsCprzN/8aLF0Iu/mxNAx95RkFFRi84JZSccKHyfRknf3ADFEJyxJ1WO9tzF+spd
         EiBJ4xkFWcdGMhdZWMzfR3bjm7LfOZ3VayL6AtkPl0qUzsD5P1OIMUWXiySg4xlTs1K+
         beP4tIL/tLgoxCD5StNEOBXFR8rbEnDKy3eY3VmGLi9Jz5o9JDeQ4ufw9h3LTzih3KG3
         17My8+VXp+IUb4xrzQ6C85RFp6Hmp4IRQw83p8kpRBhII3nGMGvIH3vmutsnX0RBRwHx
         AOSlsiqRHfpLzE9Oxmco9A3wrlq70sbGNYt22OO4G/2+E3DXNur5xgQ1OwVJtpKEqdll
         Ej6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693946332; x=1694551132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qISIWFWT+90Xd6ZFQOF4flQ0s4igN8yW6IgB7edRboU=;
        b=EvyVhwoxlSzjFiN8ceIvPy4MEmB6zd9Yn2W2fg63zjyIzMkMy1xPDkuQYZOXDfrIIk
         0uW/uSwH8AM+fymSXjd2QWP91yaYUTotPgeJ9uIgZ/Ftkz8+FJFDOuVbH+c8LBUW0wFc
         KSe90eh0W8f+CtrttAApYgprBSSsB1Qr4xr2duusnvXGAsJXSi1jHaFWSknT8HRwBB1t
         /YijDvYmwF/8ynV3g9N6gWg+H0Kk6MfKK5MYhlk6gIuCsauMmucdUzqnOV3skHGjPc8Z
         IpniF1qk01sp1ELMt11rRl36heG6AzbEY1ZcZuo2ug3IKPWtWP+Nyyqt5vBSBh80/q2d
         2VbQ==
X-Gm-Message-State: AOJu0YxjK6agYYKZJajT3lRtkp+OD/BR5tUqK/ZYDvaZZ+18IIz5k/6Q
        8QxLgKsMUxQpXiTmyXaSiUetkw==
X-Google-Smtp-Source: AGHT+IEwOKhjqGOu2h/QRhHr/SAOH0IQAohqcX26Y4rMgNvLsbCvrMoYVYHzeWdQFLWTxxzvuqgoEQ==
X-Received: by 2002:a17:906:5a70:b0:9a1:c370:1aef with SMTP id my48-20020a1709065a7000b009a1c3701aefmr695845ejc.55.1693946332043;
        Tue, 05 Sep 2023 13:38:52 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709064a8a00b009937e7c4e54sm8001110eju.39.2023.09.05.13.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 13:38:51 -0700 (PDT)
Message-ID: <8aefd8f9-cfe9-4011-a24b-ebb13d28faa0@linaro.org>
Date:   Tue, 5 Sep 2023 23:38:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY
 support
Content-Language: en-GB
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693909838-6682-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693909838-6682-6-git-send-email-quic_rohiagar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1693909838-6682-6-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 13:30, Rohit Agarwal wrote:
> Add support for USB3 QMP PHY found in SDX75 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 158 ++++++++++++++++++++++++++++++++
>   1 file changed, 158 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index 0130bb8..57b8b5b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -23,6 +23,7 @@
>   #include "phy-qcom-qmp-pcs-misc-v3.h"
>   #include "phy-qcom-qmp-pcs-usb-v4.h"
>   #include "phy-qcom-qmp-pcs-usb-v5.h"
> +#include "phy-qcom-qmp-pcs-usb-v6.h"
>   
>   /* QPHY_SW_RESET bit */
>   #define SW_RESET				BIT(0)
> @@ -858,6 +859,134 @@ static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {

[skipped the tables]

> @@ -1556,6 +1685,32 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
>   	.has_pwrdn_delay	= true,
>   };
>   
> +static const struct qmp_phy_cfg sdx75_usb3_uniphy_cfg = {
> +	.lanes			= 1,
> +	.offsets		= &qmp_usb_offsets_v5,

v6?

> +
> +	.serdes_tbl		= sdx75_usb3_uniphy_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_serdes_tbl),
> +	.tx_tbl			= sdx75_usb3_uniphy_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_tx_tbl),
> +	.rx_tbl			= sdx75_usb3_uniphy_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_rx_tbl),
> +	.pcs_tbl		= sdx75_usb3_uniphy_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_pcs_tbl),
> +	.pcs_usb_tbl		= sdx75_usb3_uniphy_pcs_usb_tbl,
> +	.pcs_usb_tbl_num	= ARRAY_SIZE(sdx75_usb3_uniphy_pcs_usb_tbl),
> +	.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),

Clocks and resets are gone in 
https://lore.kernel.org/linux-phy/20230824211952.1397699-1-dmitry.baryshkov@linaro.org/

> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v5_usb3phy_regs_layout,

This must be v6, if the rest of the PHY is using v6 register names.

> +	.pcs_usb_offset		= 0x1000,
> +
> +	.has_pwrdn_delay	= true,
> +};
> +
>   static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
>   	.lanes			= 1,
>   
> @@ -2256,6 +2411,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
>   		.compatible = "qcom,sdx65-qmp-usb3-uni-phy",
>   		.data = &sdx65_usb3_uniphy_cfg,
>   	}, {
> +		.compatible = "qcom,sdx75-qmp-usb3-uni-phy",
> +		.data = &sdx75_usb3_uniphy_cfg,
> +	}, {
>   		.compatible = "qcom,sm6115-qmp-usb3-phy",
>   		.data = &qcm2290_usb3phy_cfg,
>   	}, {

-- 
With best wishes
Dmitry

