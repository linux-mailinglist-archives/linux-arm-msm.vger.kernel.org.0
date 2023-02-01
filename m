Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1EF686D88
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 19:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbjBASAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 13:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjBASAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 13:00:13 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528DD4DCDC
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 10:00:11 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso2119136wms.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMPRrxUBoBI3GJFXWBxFBuHLcyvjM70But0PbdWLZd8=;
        b=zcq1J2eLIL+k2q8df55+ye7Hxys2tMJLTMlQRglp0sCTmeX/RqUd9z3mxGK/mSKkqd
         ANH3AhrvgDD2klQxeiJ55Gef5I2N2kQFnkp7P2PbRPdMVFpHRcGHU/XeV+pjTbIw8Mcv
         QL+M+250rUWo6HGkkyd4nXZNeGEdXgQUNAzBylF6Zy+nY1DSsmqxVOkL+7JRGniqf11F
         fRiGPtv6/y62En1ObVdszuTROgt3dO/1wTFwi9mkTO1mKbHGyoG4PRHu3f0scB2eZtOt
         Hx8SzQwXntyvEl4p+yxIAHqRpzNvTNrucANIy8kfq54JUgTAlbJ0i/bch4ldoDb2vqGH
         mDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMPRrxUBoBI3GJFXWBxFBuHLcyvjM70But0PbdWLZd8=;
        b=yC/8H3vQVc0gRq+50YddznWPbUbRlw6LEPL/aJgiD8Z/ftqIl+j9Qv+vYTwxtCiVEx
         rzUw/rLydREV3vux7/e7dv5aJvbMoUctPOJbtximU7kRyy/o3lW5L9gZHJF2/eJyp++l
         fZ4e8e/FHEgFrcGxo2E0W9HPPjcC+EXU8dKzc/mf2IW83Sj/j6qPefD0ojumjKkEFfPa
         h2j1VlchMdePxGWNp2xyt1nslI78jbMCRI0Zk23N5SkkJdbD/kGXghqebO/Y0oE4aB3I
         u+NDpXOpc6urjmfEI3k8HSCQP4v1VmWIb+6fsIBuOEFsnz+ExpnAes3kdV5dSqEMCA4p
         yuGA==
X-Gm-Message-State: AO0yUKW+h+sUsNZEEHRsvEzrUbES+0TRomzq1/45drObcK23bDPp5mg9
        MTP/cKuYOIxgv+KkzLRKwafBkA==
X-Google-Smtp-Source: AK7set+rZR3r6zfz/UnvhpCpt95V3+7+BylVCA1TjSIvxc28PMNGrKHsuxPu+R81HdFHgJKsJ7dsOw==
X-Received: by 2002:a05:600c:3ac7:b0:3dc:557f:6123 with SMTP id d7-20020a05600c3ac700b003dc557f6123mr3078809wms.1.1675274409864;
        Wed, 01 Feb 2023 10:00:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c16c400b003dd1b00bd9asm2241103wmn.32.2023.02.01.10.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:00:09 -0800 (PST)
Message-ID: <63371986-1690-3515-57e3-8b18e33bacc7@linaro.org>
Date:   Wed, 1 Feb 2023 19:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/5] dt-bindings: mailbox: qcom-ipcc: document the
 sa8775p platform
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230201152038.203387-1-brgl@bgdev.pl>
 <20230201152038.203387-3-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201152038.203387-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 16:20, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a compatible for the ipcc on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

