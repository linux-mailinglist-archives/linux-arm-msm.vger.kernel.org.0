Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7073E6C9D2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjC0IHT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbjC0IHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:07:19 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA1A49C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:07:17 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4584460wmo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904436;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w3BXJHRqLhTTME/YDrOdZdEXqG+CJPYxx5M4Us1a9r8=;
        b=M7EYQ6MtqtfRW3p5L7v+qmSOoubmRqT0HBtgywY/4G7eXviMq5mFf9JKzwgrLJUFLe
         gKLYFK4QcqaCgGhOoUOZF10F2qXh01NnYueFGJMV4UuDdP9zPYi/eQlCcIt+BCjn77iV
         7vbsQppjLuQ30irT+gWKb8y7Wd8EWUXmljL4ysbZgH+i+Zs7uUK2YOo/SAAy9pwgeqjS
         z+onuVvomwWMTBuo5ZkOBznqklP9KWlx3I09/vuAm2rhGJ7c5JrX6ZggDpnKSwtDBBQV
         8xxmCKMbRTJMSaRBLQk4mRKi2sUP/6LJ2w5chWCKKwqUwptFypT0ijHRuOunaju7gRj2
         uxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904436;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3BXJHRqLhTTME/YDrOdZdEXqG+CJPYxx5M4Us1a9r8=;
        b=Vew4TtAiE9CqU3OcYDfNoUMpij59CT3EchnyvWRm4iUdYvoHysgYFYtTeq66WPyOB0
         G4rddJLDDX+E0VdKUfQ8UAk4PgaHYR5U7UhTHIA2PHtM+m8ih3ZAHLj5zdbJXJZzxAeZ
         Jw2ic6pTisIWpyIFKOrt35z7uF4BfLCSKYy+/eiCpzZaLwcm+zte2nmgji7pk6law/RT
         /+hLo2GR6addu0Sexp6oE6oBLK8bcbI9IspMSnwkKpkhyNrbFOwpy05aXCBWTwsMqLHz
         MexEXDj1Z9/CVg9BxSYfUnYqve6B9LmmgBaO83XznSeYKKhgE49OKoA+ID3XhAMrolly
         ZnEw==
X-Gm-Message-State: AO0yUKW0omi7B7q5EUMqdPNPIIX3EBuWxj6gsJ/zSq2PVgh9T5FFPknS
        hk0H83iNQYB4y0SMuvPndRzcTA==
X-Google-Smtp-Source: AK7set/oJ1SVfTGrAElXRaKQMglzcGmkyA8aUaIdAlnAZFEUMz07Qbst+rFKA+ELhcPXxRVjFbQ+8w==
X-Received: by 2002:a05:600c:204:b0:3ea:d620:57a7 with SMTP id 4-20020a05600c020400b003ead62057a7mr8933124wmi.8.1679904436573;
        Mon, 27 Mar 2023 01:07:16 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c2b8b00b003ef5b0a533dsm9076532wmc.47.2023.03.27.01.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:07:16 -0700 (PDT)
Message-ID: <005b7c8a-4f2f-539c-a9ec-b5f022839bd3@linaro.org>
Date:   Mon, 27 Mar 2023 10:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/9] phy: qcom-qmp-combo: add
 qcom,sc7280-qmp-usb3-dp-phy compat entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
 <20230326005733.2166354-5-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326005733.2166354-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/03/2023 01:57, Dmitry Baryshkov wrote:
> Add separate device entry for Combo USB+DP QMP PHY on sc7280 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 5ce68d211998..8fadf92095c5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3431,6 +3431,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
>   		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
>   		.data = &sc7180_usb3dpphy_cfg,
>   	},
> +	{
> +		.compatible = "qcom,sc7280-qmp-usb3-dp-phy",
> +		.data = &sm8250_usb3dpphy_cfg,
> +	},
>   	{
>   		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
>   		.data = &sc8180x_usb3dpphy_cfg,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
