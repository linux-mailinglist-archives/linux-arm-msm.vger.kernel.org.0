Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150105748C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237929AbiGNJ03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238261AbiGNJ0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:26:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353FB4B4BC
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:24:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id e28so1828374lfj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yubhiqrPQElezyYpGNTpbSnd7pGxHNBvmiiE7QcQT+M=;
        b=eDf9NKMnm4+mrPZuV51N+ftUZw5oNP8KCjsDn/YGI0Amg+W3ifMA61sLrJodQdJNs4
         rHlCkw3SzEkZisVFzU84gep+Ugc8ur1JLbT3/ZLqmJ0XnF92HK8197PpmdjDc+MA2xn+
         A8xb+KuLAAOhutsU4NuV4sqmJ2n7+wm8NY+7xiAGX+NDdNK5jkJmZsEtiYSt2F1GPqBP
         QSj1YUTj4nFPA7piRi7PK0yaeMqzvTfklZfQysan7sVc/4CaT53cTjeRZMPukRQytDKb
         jCB5Rep/9vERo98pau0nTsZa3nP010wCgPIGij7RNGGM7qihVxVfrFOW1extB1wBRUTo
         XMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yubhiqrPQElezyYpGNTpbSnd7pGxHNBvmiiE7QcQT+M=;
        b=UaCk2ac4EFeR4fuEYv11RysccDLDaaNIa8dug2nQ0HTrdaK+HJMcL+LwfwI9lrjjjM
         5C1W4mCYrRVQbpMDwuZ30fsoo3W3f9e1q+g/UHtss2Btc4NGkS1i+44Y/9FVoWvuvZnT
         pZ28iHslRhVwQ5VyV7V/Ycg2YXaSpKzjT9q5BxXlgMyiu9xMDALj9GlAawMfTVFhmyH8
         DjYSk4WgiW8/8YYcagluKVb4+IBda1Crww9i+DUyLd1iN8iWNKyR1e2UYSI+iBBhhT2Q
         m7BzDc/TUzBxV8BBfO40VMP9zwT+3D0OjF3PYW/F4XWTljunzGQRLBSYZqFeo1FGTHxq
         zbTg==
X-Gm-Message-State: AJIora/Jb5aDXHWHX6BoKcMaCSaKntMXbaVAyVzS1x7tA5IYryMmhq0+
        kpJlYBwWWdpFqQZZIi/eVc6AwQ==
X-Google-Smtp-Source: AGRyM1sFb52gQlDNDFiz0Q5stdfKzyZ/u012oRIIGRHTAOOSPEWkYgd1hbvaQ7xWAKh1si5XxdgrBA==
X-Received: by 2002:a05:6512:c02:b0:48a:80f:b92d with SMTP id z2-20020a0565120c0200b0048a080fb92dmr4724868lfu.675.1657790692582;
        Thu, 14 Jul 2022 02:24:52 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id a5-20020a05651c030500b00253c8dfc4e4sm175589ljp.101.2022.07.14.02.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:24:51 -0700 (PDT)
Message-ID: <3c454669-9317-28fd-ac57-dfab6fd75598@linaro.org>
Date:   Thu, 14 Jul 2022 11:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 20/30] dt-bindings: phy: qcom,qmp-usb: add missing
 child node schema
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
 <20220707134725.3512-21-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-21-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:47, Johan Hovold wrote:
> Add the missing the description of the PHY-provider child node which was
> ignored when converting to DT schema.
> 
> Fixes: ccf51c1cedfd ("dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
