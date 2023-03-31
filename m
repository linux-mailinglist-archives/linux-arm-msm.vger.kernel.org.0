Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6067F6D28C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 21:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjCaTnH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 15:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjCaTnF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 15:43:05 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB66723697
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 12:43:03 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id e9so8975290ljq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680291782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sehubCagA5aNt1ghQYew9DpGyR3IiV4Tr5g7aqEM3ZA=;
        b=ibHbux3mByAgnIVoQxABLN5Jl2WI6jGFcoETwSinUHFPxDWhC5hXlm4ZfK/cyJ22n2
         ON03k+HRmoCvjQIUAGDR6l0PdRU80Nn9f4gQahcFTF/Tdgg/f4sKxUe6xyYmLRJuT4uN
         luQQKk5sOACRDEwvrpDLXkJYkFaYxRQ45ItOOeMFV8dim0A9SJ7dI1PEiORd3Zf/lWV3
         LSMbrShY/USruw2oRvIxzoewKgY3lJDCMQQaVU4ugKWQCOl3kpusUSjMgIRI0BC8VYT0
         wTqhDvITPm3Yg0eZ09igFVB8NOnKzXzL4E4TusAIv8ikQK+LXQPcCpeDmx7NIO3UxaM+
         50dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680291782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sehubCagA5aNt1ghQYew9DpGyR3IiV4Tr5g7aqEM3ZA=;
        b=XdHKe28nmcOXIdZDi1GZackOLYqModQMam/58DaZOQ8vfkgF48caKyBDhGorPlNAnk
         lezdJAV515p6YlOrbNxy0oVY0GtQrcfB2qVtTm3d4h5LIZVnJSb9F4uy0qoN+3BxFfR6
         mrJ/cGMMz6JGGYRQZ9geCn4RNHTuzHWwj0mTZMonEhKbYfimB76GvhJxQB4+S6EJIp0e
         lGieaXFbACheoYbmXLwgm1oJNNTS5cbvdQpYLfciOLXaGLQ0iFjv17IzihJUzReGVQvi
         4VjYJLdSCgGGAsPKsJNVDUVf1oe/6HHqUMI0+d2Jqw+z+8qa7sdjV7akF6KMrP+ye9di
         Pk4A==
X-Gm-Message-State: AAQBX9dk8A4Xa6IZCFARybwHj+07ZsPKEyziKlJ+mvCHXYuHx2tpvTil
        +Kh/rVFnhYTJ4e51qStOy0BZxQ==
X-Google-Smtp-Source: AKy350Z+p4cwTvZPZdfQSVVE3COHMQ6zlB9Ujb+Huyiur8ueUUTDR+1S77pnMASrKt3Uwydq77Yw1g==
X-Received: by 2002:a05:651c:207:b0:29c:39aa:7b3f with SMTP id y7-20020a05651c020700b0029c39aa7b3fmr8398795ljn.21.1680291781905;
        Fri, 31 Mar 2023 12:43:01 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id u4-20020a2e9b04000000b00295a3a64816sm486167lji.2.2023.03.31.12.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 12:43:01 -0700 (PDT)
Message-ID: <8b785c0b-082f-308b-8346-9bb3c89e0048@linaro.org>
Date:   Fri, 31 Mar 2023 21:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v2 2/2] phy: qcom-qmp-pcie: drop
 sdm845_qhp_pcie_rx_tbl
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20230331151250.4049-1-dmitry.baryshkov@linaro.org>
 <20230331151250.4049-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230331151250.4049-2-dmitry.baryshkov@linaro.org>
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



On 31.03.2023 17:12, Dmitry Baryshkov wrote:
> The SDM845 QHP PHY doesn't have designated RX region. Corresponding RX
> table is empty, so we can drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index f378c1ebefd7..df505279edfd 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -725,9 +725,6 @@ static const struct qmp_phy_init_tbl sdm845_qhp_pcie_tx_tbl[] = {
>  	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RSM_START, 0x01),
>  };
>  
> -static const struct qmp_phy_init_tbl sdm845_qhp_pcie_rx_tbl[] = {
> -};
> -
>  static const struct qmp_phy_init_tbl sdm845_qhp_pcie_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG, 0x3f),
>  	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG, 0x50),
> @@ -2212,8 +2209,6 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
>  		.serdes_num	= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
>  		.tx		= sdm845_qhp_pcie_tx_tbl,
>  		.tx_num		= ARRAY_SIZE(sdm845_qhp_pcie_tx_tbl),
> -		.rx		= sdm845_qhp_pcie_rx_tbl,
> -		.rx_num		= ARRAY_SIZE(sdm845_qhp_pcie_rx_tbl),
>  		.pcs		= sdm845_qhp_pcie_pcs_tbl,
>  		.pcs_num	= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
>  	},
