Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93ADB6E77E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 13:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjDSLAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 07:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjDSK7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 06:59:50 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3006FE7A
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 03:59:48 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q21so4311366ljp.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681901986; x=1684493986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhnqP+JYWpX2HzWlP/4Ls+kriv5dclaEILtvuX+5sLA=;
        b=mY5tyJSkOj/2kORwfVDYq4JcHGiHCOhqzdd5ZaIGn1JodDgn5ZqqSLmXjwZppX7SP0
         6zMD/rwN5e2WpuVzqp4U0iT8aWlM+j7scpoc+AF93ywH/8bc6VRABQbTLyMn9Hj34TeS
         rJmAN9m34DzVTWLUU730Xmcq0w4PxViaH0xXo6hy3Sl4qA7fSiky8yNYjOkNZjCOrjAw
         pkYw2ASL7Y6JtItvPWaZwidRqXMDQAg9uQOji0uVmjMaeyNP4BAauczpqdhw0oIxnSBE
         7L4hdrH3Bslwy1LN0wP9gZLznTYhp+/EJ+T+edBqn3Pme+gndSMuma+OGQdli2NBrhuM
         Ys/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681901986; x=1684493986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhnqP+JYWpX2HzWlP/4Ls+kriv5dclaEILtvuX+5sLA=;
        b=Yhfou6mlia7L3wH1MQawEPLfsEvWTK6vinb95LcEo5gQMK2BISUT3z0yUTMsogHUzb
         Aln+QvtEN0e8uvm5fVLGOL1wniwMiB8lG9WBQDkxniVzJymPahO5xP97KPIWKIOkAFZW
         vnfTjfliKZzR8bj09MBEhS+Hnm8McjMJVVW1E9dcBDQ0686p2XjkMHREps9JaYuXBECF
         MJaCZwkraeTMnQJwMpAoGByEI1gAaHHq2cYW79qn3PVUywD9KayNdPqmoTzycsZNwcBG
         ZH0KcfY3EdgXM3KhFl3GzP214VbdDR+SRlb94RIS7zfLTfzSVwqflPpqk7EqH5qRK6bn
         em/g==
X-Gm-Message-State: AAQBX9cCfChY3mxlnmOxxrXqIXfuOr2UORUhlufgIEKOMKVXU8OAatwq
        PTnAV3TxCw9X51kk3LwK1r+teQ==
X-Google-Smtp-Source: AKy350ZjeZSUx9Sx4A07w+LgFw5upEP+9BoCC223A2ue0kIg4ouVlq5wBRBb5urxg/Mny1IsBKlPYg==
X-Received: by 2002:a2e:994e:0:b0:298:aa76:2fb8 with SMTP id r14-20020a2e994e000000b00298aa762fb8mr2180765ljj.12.1681901986441;
        Wed, 19 Apr 2023 03:59:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id u25-20020a2e2e19000000b002a7e9e4e9dcsm2804138lju.114.2023.04.19.03.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:59:46 -0700 (PDT)
Message-ID: <999af225-2f21-0cf5-0292-3c5afa332121@linaro.org>
Date:   Wed, 19 Apr 2023 12:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] phy: qcom-qmp-pcie: correct sm8350 PHY tables
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230414205425.3878902-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230414205425.3878902-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.04.2023 22:54, Dmitry Baryshkov wrote:
> Correct sm8350 PCIe PHY tables according to the vendor dtsi file.
> This accounts some additional differences between PHY programming on
> sm8350 and sm8450.
> 
> The name for the PCS register 0x8 is not present in the vendor kernels,
> but since on other generations the register prior to POWER_STATE_CONFIG2
> is called POWER_STATE_CONFIG1, we can establish that as its name.
> 
> Fixes: c70052739d16 ("phy: qcom-qmp-pcie: add support for sm8350 platform")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Are you referencing the entries in lahaina-2.1.dtsi?

[...]

> +static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0xa8),
e.g. my downstream says 0x77 here

> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RATE_SLEW_CNTRL1, 0x0b),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x05),

Konrad

> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_pcs_misc_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG2, 0x0f),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG1, 0x0f),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
>  };
>  
>  static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_rx_tbl[] = {
> @@ -2325,15 +2349,15 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x1_pciephy_cfg = {
>  		.tx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_tx_tbl),
>  		.rx		= sm8450_qmp_gen3_pcie_rx_tbl,
>  		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen3_pcie_rx_tbl),
> -		.pcs		= sm8450_qmp_gen3_pcie_pcs_tbl,
> -		.pcs_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_pcs_tbl),
> -		.pcs_misc	= sm8450_qmp_gen3x1_pcie_pcs_misc_tbl,
> -		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_misc_tbl),
> +		.pcs		= sm8350_qmp_gen3x1_pcie_pcs_tbl,
> +		.pcs_num	= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_pcs_tbl),
> +		.pcs_misc	= sm8350_qmp_gen3x1_pcie_pcs_misc_tbl,
> +		.pcs_misc_num	= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_pcs_misc_tbl),
>  	},
>  
>  	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
> -		.serdes		= sm8450_qmp_gen3x1_pcie_rc_serdes_tbl,
> -		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rc_serdes_tbl),
> +		.serdes		= sm8350_qmp_gen3x1_pcie_rc_serdes_tbl,
> +		.serdes_num	= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_serdes_tbl),
>  		.rx		= sm8350_qmp_gen3x1_pcie_rc_rx_tbl,
>  		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_rx_tbl),
>  	},
> @@ -2369,6 +2393,8 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x2_pciephy_cfg = {
>  	},
>  
>  	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
> +		.serdes		= sm8350_qmp_gen3x2_pcie_rc_serdes_tbl,
> +		.serdes_num	= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_serdes_tbl),
>  		.rx		= sm8350_qmp_gen3x2_pcie_rc_rx_tbl,
>  		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_rx_tbl),
>  		.pcs		= sm8350_qmp_gen3x2_pcie_rc_pcs_tbl,
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
> index a469ae2a10a1..ea466e14ca12 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
> @@ -8,6 +8,7 @@
>  #define QCOM_PHY_QMP_PCS_PCIE_V5_H_
>  
>  /* Only for QMP V5 PHY - PCS_PCIE registers */
> +#define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG1		0x08
>  #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG2		0x0c
>  #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG4		0x14
>  #define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x20
