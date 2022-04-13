Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1A94FF092
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 09:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiDMHb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 03:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiDMHb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 03:31:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326C43DDE5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 00:29:35 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y32so1940978lfa.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rY7vyMdlEpNIsttCtPLzQ1mgAimhBwJO1tKyaimvoG4=;
        b=ZWc5DRzC+yYGA1khhGAvv1AqdIyxTwikHCFAXQM4OxtxDTY2v3BeAhwwpvImOk9ezA
         EctsSxENGFGFFkZkrZpcoGTkmulLyh3rWeFn62oqrKKF2H+NyzGhKX/r91YF+1/BF6m2
         vFcc4LtRO7sKJdj6lSbM+ZTycfN5B9+dX6+jTsoIvYcfHSO/qqNa8+3jhWrXMmYX1oxD
         bZnx6bEd8kVaJFEaYO3+WR//lF+gjNomOzHAsFaXrGLlIJXwoCO8aU3mqq3vhxwn5Vzv
         mOrtDqrmLOA+Gt+nyz/GP2LGtK52C1H26npq3xk+otWIXph+hmF8yZtC+rj2ghfKm5Ql
         z6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rY7vyMdlEpNIsttCtPLzQ1mgAimhBwJO1tKyaimvoG4=;
        b=le4tnr0hTq/M1yqgiyE1RO+vGICCMQ2fY2B3hHPXO8WjKox/8TaJYxK6foFW8BnyZH
         sFX41av6uXWc7rOcm8MyztlmTTsaxEIFetfgw0ey8WWbnFdTMlQFoROaUYS4KcJD/QHy
         EEjCZe0PqsFoxepGvdwTWKM1frN0oTfIHesKYD+VktGRfym2C9PfGSrwFmrxzC8kz+PR
         D2BsQYfXYRIkXVlDHalx+SojFaq5px+lurOWGm/GVyLXMQHIJxxgZtwWyQ9BAzB4QLO0
         2Ls2kIY8vqkFdQpXBfR+LsnaA2Sh1IdEb9IDEqUd+9vpl1D8I0JKsqWbW2GnlWCrf6xr
         r2jw==
X-Gm-Message-State: AOAM533lqJz/LLuEmCzMdVtHitVPxyoGXJaYwovNGsCS9qiBtZb2Ecle
        PB61LcutKe4b/BItpYfFeMoqZQ==
X-Google-Smtp-Source: ABdhPJxbpXxaRtGS8rUTdc137nOix+yIIq1RTO6cjqs8ic6+IBNmp3CSmSmUgUfzcJu8+ky5RX0Pyg==
X-Received: by 2002:a05:6512:308d:b0:464:f074:68cb with SMTP id z13-20020a056512308d00b00464f07468cbmr21784787lfd.482.1649834973445;
        Wed, 13 Apr 2022 00:29:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p21-20020a056512139500b00447c9b87945sm4012100lfa.172.2022.04.13.00.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 00:29:32 -0700 (PDT)
Message-ID: <fc3214b7-8bc2-3c9f-7ea6-231c4c57a8e4@linaro.org>
Date:   Wed, 13 Apr 2022 10:29:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY
 bindings
Content-Language: en-GB
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-phy@lists.infradead.org
Cc:     bhupesh.linux@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vkoul@kernel.org,
        bjorn.andersson@linaro.org, Rob Herring <robh@kernel.org>
References: <20220325222130.1783242-1-bhupesh.sharma@linaro.org>
 <20220325222130.1783242-2-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220325222130.1783242-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/03/2022 01:21, Bhupesh Sharma wrote:
> Add the following two PCIe PHYs found on SM8150, to the QMP binding:
> 
> QMP GEN3x1 PHY - 1 lane
> QMP GEN3x2 PHY - 2 lanes
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index e20d9b087bb8..1e08acb8a59a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -39,6 +39,8 @@ properties:
>         - qcom,sdm845-qmp-usb3-phy
>         - qcom,sdm845-qmp-usb3-uni-phy
>         - qcom,sm6115-qmp-ufs-phy
> +      - qcom,sm8150-qmp-gen3x1-pcie-phy
> +      - qcom,sm8150-qmp-gen3x2-pcie-phy
>         - qcom,sm8150-qmp-ufs-phy
>         - qcom,sm8150-qmp-usb3-phy
>         - qcom,sm8150-qmp-usb3-uni-phy
> @@ -336,6 +338,8 @@ allOf:
>                 - qcom,sdm845-qhp-pcie-phy
>                 - qcom,sdm845-qmp-pcie-phy
>                 - qcom,sdx55-qmp-pcie-phy
> +              - qcom,sm8150-qmp-gen3x1-pcie-phy
> +              - qcom,sm8150-qmp-gen3x2-pcie-phy

If you add your compatible strings to this block, it means that the dtsi 
will provide 4 clocks (aux, cfg_ahb, ref and refgen). However judging 
from the patch 2 it looks like you don't want to provide ref clock?

>                 - qcom,sm8250-qmp-gen3x1-pcie-phy
>                 - qcom,sm8250-qmp-gen3x2-pcie-phy
>                 - qcom,sm8250-qmp-modem-pcie-phy


-- 
With best wishes
Dmitry
