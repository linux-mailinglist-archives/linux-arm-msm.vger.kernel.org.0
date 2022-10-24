Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186E760AF69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbiJXPsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiJXPsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:48:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2724110B1B
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 07:41:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p8so17027424lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48QRiPSkyAXEiO5tejGFOhq9qKIkuEQxYvh+zCSe1rQ=;
        b=AlxEoE8Z/iKF5aYZqd7lFy0indUeyF+usAszriTmec+DUSqOtDowAVNnUtEw8/8iNp
         1Drtyn4ddu+rAhUwAi9CmKhajqaqrZfSWiKnWxLH4qsb/oeCKnWkRuNySfcDDTt0FICP
         TpbQS2AF+2Pxu64YhUSA/ZhIFqScuQQ+Ru9qNrCLPU4ikd9seq5CSQ/WELgo4ZKQXjqJ
         h+8P6x7Ho22oa59SblEqMkccLIUaFqEBStFefReiZqcJy8cmZGeEEDgdonNkB4EF4E8L
         xFY4RRVtg7wZMtYifDXVyTt2VZZtf5PjhDVcm7GohcQpYGp1UlALK8A7ihMg/VFX6QpX
         cgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48QRiPSkyAXEiO5tejGFOhq9qKIkuEQxYvh+zCSe1rQ=;
        b=ILlQHktEPs5tkEIRVqWlrGW4rchju4Yr9pmiXt7kLUAZlun5z5HBKrdvFyfhf/qbUJ
         lvjNo9x7wq9pEw6fZZv4ZG1oc2kIklN83MBdmrVbMtdOPho4+kdjWgszCmodzp5eVdMH
         mbihsO1MrfuVwn4QWYnXoD/0/LEQ6+0X/cOJ5Mp326t7YvhsIftybvLK875Ib+Gr7vf/
         4Rd7pXAzBv7Fi1tKMvB0PXf3cPDthSK7RonMIui2Qzu6Idku1aP3s87SOA7rU2GckPep
         aXwivswyLAHMqS/iocj+FXqpCLbKJpmnQ5Kmgevxg+0ud6hx2O/3OaEtDRD+rcTiRb5V
         gE1w==
X-Gm-Message-State: ACrzQf22IwjMCLH1kW/nj/96YUnHMrRwMrt3WxM0tUDUsK1wyydEAsi9
        9+noqcCaDqshQqFU5ndmk9i7WphJ3MhY1kRW
X-Google-Smtp-Source: AMsMyM6m1tYusvtcWN+1mQQDBonnIuGtubOqJCb75Q+1wDN3YjX0bl2egvkd+XFHgwlXvFOzUiyy6Q==
X-Received: by 2002:a05:6512:2201:b0:492:f874:39fa with SMTP id h1-20020a056512220100b00492f87439famr11850139lfu.365.1666620204586;
        Mon, 24 Oct 2022 07:03:24 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y13-20020a056512044d00b004a044928923sm4522341lfk.293.2022.10.24.07.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 07:03:24 -0700 (PDT)
Message-ID: <29271240-f66c-33b0-5e9e-29b559eeda5c@linaro.org>
Date:   Mon, 24 Oct 2022 17:03:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 00/10] phy: qcom-qmp-ufs: fix sc8280xp binding
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024090041.19574-1-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024090041.19574-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 12:00, Johan Hovold wrote:
> This series fixes the UFS PHY devicetree binding for SC8280XP and adds
> support for the new updated binding to the driver.
> 
> The first half of the series clean up the driver in preparation for
> supporting SC8280XP and its new binding that drops the legacy child node
> and the (incomplete) description of register subregions.
> 
> The other QMP bindings suffer from similar problems and the PCIe driver
> is being fixed here:
> 
> 	https://lore.kernel.org/lkml/20221021110947.28103-1-johan+linaro@kernel.org/
> 
> and follow-on series will do corresponding changes to the USB and combo
> QMP bindings and drivers.

Great! I'm looking forward to seeing the combo patchset. Then I can 
probably rebase my regs layout patches on top of your tree.

> 
> Note that these patches depend on the linux-phy next branch of today and
> the following two series:
> 
>   1. [PATCH v2 00/14] phy: qcom-qmp: further prep cleanups
> 
>      https://lore.kernel.org/lkml/20221012081241.18273-1-johan+linaro@kernel.org
> 
>   2. [PATCH 00/20] phy: qcom-qmp: further prep fixes and cleanups (set 3)
> 
>      https://lore.kernel.org/lkml/20221012084846.24003-1-johan+linaro@kernel.org
> 
> Johan
> 
> 
> Johan Hovold (10):
>    phy: qcom-qmp-ufs: move device-id table
>    phy: qcom-qmp-ufs: merge driver data
>    phy: qcom-qmp-ufs: clean up device-tree parsing
>    phy: qcom-qmp-ufs: clean up probe initialisation
>    phy: qcom-qmp-ufs: rename PHY ops structure
>    phy: qcom-qmp-ufs: clean up PHY init
>    dt-bindings: phy: qcom,qmp-ufs: rename current bindings
>    dt-bindings: phy: qcom,qmp-ufs: fix sc8280xp binding
>    phy: qcom-qmp-ufs: restructure PHY creation
>    phy: qcom-qmp-ufs: add support for updated sc8280xp binding
> 
>   ...phy.yaml => qcom,msm8996-qmp-ufs-phy.yaml} |  17 +-
>   .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  83 ++++
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 381 +++++++++---------
>   3 files changed, 287 insertions(+), 194 deletions(-)
>   rename Documentation/devicetree/bindings/phy/{qcom,qmp-ufs-phy.yaml => qcom,msm8996-qmp-ufs-phy.yaml} (93%)
>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> 

-- 
With best wishes
Dmitry

