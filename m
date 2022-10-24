Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250DD60B2B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 18:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiJXQus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 12:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbiJXQuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 12:50:05 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E828437E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:33:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g1so17296589lfu.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3gD1nv/Lrd3QPYB7fENBBybs/4CZXBub8RTxNrR1VE=;
        b=R8+rYfXyKsG3jqXrxTyd9WTnA/jEl9RpToVnSG3tIp0JL7QCoLT7as8ZUq5An9M8vf
         u+7Z1K6Jxrgz8EdRH2EiXGoyataMIf+v0Bp42RSps3n13iV/7LMepHJi8pGDyMESkNf5
         L7UEf66aU6voSvnpNe6H+E4HSWKiZdVCXJdz8e66KN2Vvr3BTo91hZxOs0AXeVUJSB+c
         gUSupI414Uvo8JtjA6Bcx0+1VWq7DokCUha0qS7TTgCqGcxJ0tjGcPnGrblkseoEYg6Y
         mqnV4YDIXe9yvY/OU8pmzzQKRRhFIcpHyRHEokKsJTt8ek5lDGHrhUR1M9vsEHWcS1Vj
         IV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3gD1nv/Lrd3QPYB7fENBBybs/4CZXBub8RTxNrR1VE=;
        b=oZFZOX08cPa3faJDgbx2gY1ehlsNF4Ox4tbsKx201sL4jVIlraGvKVcEpOg37oMWgJ
         359valbrAz7HQankCNQ8fdsEA5NI8XP2ESlaNVCzn2Z2ScCF/F9NaoUm3L+HZ+HdTk0G
         HOAQJTa60sHGbbU2NVqesYMgkH6uC0y7PiADVNgvQiEZbCOHgncYQaswxNQELZkxFNyo
         L9cK1kU2qtWzymldJwNgbeyfiF6GJeLkeS1w/3ZY9yPYky4gOiJC3GiHUd4Sw3tAHcJb
         mtpQQWjK88f1dJq+qya7JvLoX42RAaM6FzxBSg00eVTWKZBfGeE1POZSSthDkn6xb9ai
         ynYQ==
X-Gm-Message-State: ACrzQf1/VYgBTlI00R/jDbwgw2LVomiA5CrWNex7XdBcUsVSZsFLOP6H
        9KoZ+2rHY1cZxx1/BaiI9v3h4ReSqgOBNuU7
X-Google-Smtp-Source: AMsMyM6RAtit+Dc9aHBaf8KKnIDnNsKgiMqSjXSFrs+1CHsQZlQxAyKBab0q0Ycd5njTWflwY/UOEg==
X-Received: by 2002:a05:6512:150a:b0:4ab:11d7:4bc1 with SMTP id bq10-20020a056512150a00b004ab11d74bc1mr2149160lfb.447.1666618399373;
        Mon, 24 Oct 2022 06:33:19 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 10-20020a2eb94a000000b00277129b4a10sm105072ljs.86.2022.10.24.06.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:33:19 -0700 (PDT)
Message-ID: <0fc47209-54c6-8bcc-0366-f6086d7554ea@linaro.org>
Date:   Mon, 24 Oct 2022 16:33:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 03/13] phy: qcom-qmp-usb: move device-id table
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
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> Move the device-id table below probe() and next to the driver structure
> to keep the driver callback functions grouped together.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 126 ++++++++++++------------
>   1 file changed, 63 insertions(+), 63 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

