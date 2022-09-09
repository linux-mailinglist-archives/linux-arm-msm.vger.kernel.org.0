Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A2B5B3904
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiIINbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiIINbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:31:05 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0545DEE522
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:31:03 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y29so1829657ljq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8fE1xHhj1rx7cmMJremD4HsnXubaysHbogPQ0gvVKrs=;
        b=laeCQogBil0kNKmOq4YbG5bMScPrE3bPhL5U9Hk+ak1VKEstHONjqMLZ7sG5gCRu9S
         PmEUz+SuAvmiodyr6GKez9ANBSXpiTtMq/586ziSa0OBTLP2pgWotP5nY0Hlku7LJmOm
         cnM3ILo+9G+0be+meMd0kWxxkoHZq/H54ra2gt2GyZ2IGU8x+SRX0JUN3m0DQo7f0QmI
         gfpQhNqBvZ34qnAtbvruTDiKChRAxP1Qjad6xdUTR9TynGOXLor6bDbk7tLvJUltuMG4
         ate1ouOW8xMUzKNV+uB3hoOnM/2NnPrCj9xjPMw6AMBiFXKEtkki/CIjXiQ4HVFBQtxd
         5jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8fE1xHhj1rx7cmMJremD4HsnXubaysHbogPQ0gvVKrs=;
        b=3juQTLIfmKJxUV4O37F3ieYRJ3pr2CBjmJBJ1G8/voCAewvLXEwaYdyrmVXcWS2pzB
         a+5tN/JR56pX/z6gzKLDpw9bm46bDFbe4S6BjANCyCfDao7nfXWibvcrI7eHM6EzkNA7
         n4Hoy3aTccem/5oxzL9jvQ8irc/NrAh+u3yji9VcgdG5Qz7/vGUlzpy7hsKrRDft7n03
         oi2nA1X7fY0Mo3oopdjBB6Idwl8HbztTw3FM+nSEtJp8FKJqbZkvUI8Auif/O+lZJ6ya
         apaRYl81sL/vfoneLre3qxYZ25ld3J4wa3YFIjeHCsTtTI/9imUjbjU3Gm4dL0okFnsu
         09+Q==
X-Gm-Message-State: ACgBeo1eV6thRRUdErlgLkmx752kTI/s7BM9kA0I2gj/9M/6gjW4WTFR
        dZ6/2QZ41lpRYPBP3ZWp7RLdig==
X-Google-Smtp-Source: AA6agR4qK78Xi8NqPtj6vXo5jScWYdrp/+Se2i5pDNRdMOUUycdnrpLChWBksA67m61uFhum4k72VA==
X-Received: by 2002:a2e:a28e:0:b0:25e:734f:38fa with SMTP id k14-20020a2ea28e000000b0025e734f38famr4025040lja.446.1662730262156;
        Fri, 09 Sep 2022 06:31:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m5-20020a056512114500b0048af3c090f8sm92057lfg.13.2022.09.09.06.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 06:31:01 -0700 (PDT)
Message-ID: <fbc3f608-4686-6d06-c679-8f51dc5a0240@linaro.org>
Date:   Fri, 9 Sep 2022 15:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,hdmi-phy-other: mark it as
 clock provider
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
 <20220909132010.3814817-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909132010.3814817-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 15:20, Dmitry Baryshkov wrote:
> Eventually all HDMI PHYs are going to provide the HDMI PLL clock to the
> MMCC. Add #clock-cells property required to provide the HDMI PLL clock to
> other devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
