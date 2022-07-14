Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4935748C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237349AbiGNJ0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbiGNJ0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:26:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C6B28704
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:25:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n18so1843719lfq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NNwnWPeD5mRbFNqIkyD+pTqqMFhALyWUWBLa+q1m/vk=;
        b=w/U2Ib08cu6VWEhiJkRblQLMSvBTtDz7j4qlNQtZxMc+Mi3OrHuTc+Mskpl49Se6eY
         p9yzf8xWYTkF5SayKsMSxNjdC1SWIsyyby9Vp2g3+hvBp/GQFAoEaE0J3fB2BlJD2Zta
         A/f2gxZrhGA5QFhQqi7X+H0h6tSYAefV4CFxdVNSqf1eXD7UFuUGGeYaRkoAQtbBEZ1x
         1uWnWnBWnvuZSpzeTDS6tVbbvHMGqOLVKoQlE8SYdEyqWWQHvu6S8rzd2o4EDA82PvDM
         CS/UQznDA6APOivjdgs4xO+nW5gSpON9MthZc5U1ev+Me+yPtvAj980LUsDyGZ/bp4Hz
         2KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NNwnWPeD5mRbFNqIkyD+pTqqMFhALyWUWBLa+q1m/vk=;
        b=FhmumX57lOmp2KUKL0YmPD9DSxs0wvZWHYPJftrNMXMAJScDWze1QjZ4jnjMD1xfUz
         0jtkhDdFWR+04/48fAreh1qhfezl2S40oXFNDF3B3oKLM0KtF6lmY6FjjLElmU+Byhc3
         MivhWDUVI9+V3a3DEzMntcryMTv/rgKIGM+qI6/rOf1ywcvKNT3S0w/VZfuNX7kV6zhJ
         mzgcTc6ggCt9ogJmkHp22tJTK5rn0F3WF2+QT8KcAH2VeHbM50VxemnPLAByugUpWL4Y
         aIukFSaTLxdtnx4AR3KLIC0e5Sc9zUKxtyv+2YkVSfC9CfcHUOJ8cfxsvP6vp7aulZ89
         lxyQ==
X-Gm-Message-State: AJIora8T7f4AJIiO45DdLVI3f3JlNK8pg12vkj77QWbQ7BSOnGIYAkC3
        r+UMYp9oCX7AEPhgNcF3AfyTlw==
X-Google-Smtp-Source: AGRyM1uWrgChUqWYOMuYeJaQIptSFkQDwvmHHhgzJG6FWsn+s+0B3XZyI9ve6trSThI6ZgQIVZmfAg==
X-Received: by 2002:a05:6512:224a:b0:489:db85:53c6 with SMTP id i10-20020a056512224a00b00489db8553c6mr4476143lfu.383.1657790702471;
        Thu, 14 Jul 2022 02:25:02 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id u14-20020a19790e000000b0047fab4c3651sm259673lfc.85.2022.07.14.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:25:01 -0700 (PDT)
Message-ID: <9f226d8b-f5b9-2978-991b-69a37907ab2f@linaro.org>
Date:   Thu, 14 Jul 2022 11:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 21/30] dt-bindings: phy: qcom,qmp-usb: deprecate PIPE
 clock name
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-22-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-22-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:47, Johan Hovold wrote:
> Deprecate the PHY node 'clock-names' property which specified that the
> PIPE clock name should have a bogus "lane" suffix.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb-phy.yaml | 3 +--


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
