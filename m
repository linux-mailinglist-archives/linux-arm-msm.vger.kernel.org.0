Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6883277B5ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 12:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235135AbjHNKFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 06:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235912AbjHNKE6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 06:04:58 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798D3E6A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:04:57 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bf3f59905so551109966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007496; x=1692612296;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1Rc8nsD2ma3VBPVMcl4UyoPSVzGHKJ4CtGcabWqpTw=;
        b=nou4Cl1VoVcvl4ENiZZo8eV/gFxjXiX3xN/8B8yOL+X04lAgCBOIZT2WSkxTaGCxK3
         7Yc8q/nN0dOvKIMVTPnmhgd5h/EV85uGtprln6ypFYSQUIO8YfcTCdQnREWzyIE1OAHw
         kGvye/lpfo3yWcvofsAO/XLOzaG4wfzKO8voq15fQ8s9LZhs0b2Cvmbg5kK68OypZm/P
         wMvRuADlnLl6siSEa74QUMg4MHl06L4+TDvrCrBbsdFZ4RmSYrGkneGl3IM1mK9PFaQI
         hnNdW+mhdB+93VOz5dMGPob0JYuRBCpLQ9WzP9MpT+Jv+98GliX5rhWxhJ0CRu/6P7QB
         6k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007496; x=1692612296;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1Rc8nsD2ma3VBPVMcl4UyoPSVzGHKJ4CtGcabWqpTw=;
        b=cJlP4vVik5CnyBpNE08PgnSLtanKSitcI+nd1MsMPfUSTiXqEYrRtDuhXEpuHr5Ihw
         n0q26ITZ7XkT5MJ/f14pBkBqMKT0X0qKqohRl31hbJ7qwLsLG5WNWpynOLpTZwhr4lb7
         nvYpHuI3OpjNl3EqNvynwRkkILWrGA97V3pOjjjPd45w3vIvDkliESTTFb1Xpft/zqst
         46YOfBRSr6lFKh+8Jz2zzu9sYEToLgFZV9yF8QuerBHGeX6Ha3qD9gZvlqmfoDvQgRbX
         ULv2JFNgaZJGn1gmrpazl1gy+J8btQycWd8k4Lys1Rf3pOeU5bfh/S3+hmBaJ1OQrayv
         nmtA==
X-Gm-Message-State: AOJu0Yx+ugtFRM9NTrDhk4U8d2lgngRLL1Tb0NtX4am0r8/Ubu4IsUC/
        5A+6fcCq2LMhkajCSqe6uq7imw==
X-Google-Smtp-Source: AGHT+IG9TosK1slJfmyat8CD4+xcZshg2eMOd341aynBzaPj563ez339VfZMnOaM56aXf25DWuXM5Q==
X-Received: by 2002:a17:906:3d32:b0:992:9005:5ed5 with SMTP id l18-20020a1709063d3200b0099290055ed5mr7365657ejf.32.1692007495896;
        Mon, 14 Aug 2023 03:04:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id pj18-20020a170906d79200b009932337747esm5482230ejb.86.2023.08.14.03.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:04:55 -0700 (PDT)
Message-ID: <90da3361-6b11-7a1c-a845-af33ba03a686@linaro.org>
Date:   Mon, 14 Aug 2023 12:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 2/5] phy: qcom-m31: Introduce qcom,m31 USB phy driver
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1691660905.git.quic_varada@quicinc.com>
 <b17b55b2ff2277bb9bfa99acdb2f98ed420dfb6e.1691660905.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b17b55b2ff2277bb9bfa99acdb2f98ed420dfb6e.1691660905.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 11:56, Varadarajan Narayanan wrote:
> Add the M31 USB2 phy driver.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

...

> +static int m31usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31usb_phy *qphy;
> +
> +	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
> +	if (!qphy)
> +		return -ENOMEM;
> +
> +	qphy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(qphy->base))
> +		return PTR_ERR(qphy->base);
> +
> +	qphy->reset = devm_reset_control_get_exclusive_by_index(dev, 0);
> +	if (IS_ERR(qphy->reset))
> +		return PTR_ERR(qphy->reset);
> +
> +	qphy->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(qphy->clk))
> +		return dev_err_probe(dev, PTR_ERR(qphy->clk),
> +						"failed to get clk\n");

This looks misaligned.

> +
> +	data = of_device_get_match_data(dev);
> +	qphy->regs		= data->regs;
> +	qphy->nregs		= data->nregs;
> +	qphy->ulpi_mode		= data->ulpi_mode;
> +
> +	qphy->phy = devm_phy_create(dev, NULL, &m31usb_phy_gen_ops);
> +	if (IS_ERR(qphy->phy))
> +		return dev_err_probe(dev, PTR_ERR(qphy->phy),
> +						"failed to create phy\n");

Ditto... and in other places.

> +
> +	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
> +	if (IS_ERR(qphy->vreg))
> +		return dev_err_probe(dev, PTR_ERR(qphy->phy),
> +						"failed to get vreg\n");
> +
> +	phy_set_drvdata(qphy->phy, qphy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_info(dev, "Registered M31 USB phy\n");

Drop simple success messages. Kernel has other means to do it.

Best regards,
Krzysztof

