Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8365C5BF7C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiIUHcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiIUHcc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:32:32 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1675F8305F
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:32:31 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a10so5976661ljq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7JnyjGpATcgNnreZxcfkb+tq461mqhrMUKVJHIj5DbQ=;
        b=vLFU7P0JUVxQwOQIwPN3s8EzOvkEvnQUUIFTWMHjnKADIVVn4W1UGRHPn53b9fj8AK
         +0ouEq/nVkmiq5TrtOG2AIzkCUAJf9fTrxRTV+YrQC5C2FgRQhJNix7sVi7v7g73K9kj
         0ShtvgtF16s/6cwsT2jk9N5Xou7/qJ0holB0980EIpkHruaZEwvowJfAKfiNRs7g/4ae
         5nBuNMN5auKV9iNAW4G+pDySil1/Pf5qaxHp1nnycjMsoCwFCdWjnyW+kFMQs0YrCmHb
         VIy9ga2JQjHBWYjcZnIQzawK7wDwuxgfMAosmkAueEa1w7UWx+vff+eaub7Xcz5n7ifV
         Y8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7JnyjGpATcgNnreZxcfkb+tq461mqhrMUKVJHIj5DbQ=;
        b=HxcRvIARQn6bhsZYaU/LB/G84i72gNkxBM8Md/276moqVtALC+eqFhT3yBmraoYNBd
         E/fsHnNn6hwqyNvFhh9NJLlKCygxl747cFoj5HWf72MEeIM1H3M2dRMyzqOx1QnztkZi
         S5GZD6sjf964ROAR2ZGPuBhNUqPBZEk/qg3RAsA0iS2Fgj1bMZfyBb3bxs3FAEuwof2F
         InemKwJ+GP7W4zvtc6KFu+46+PdO0a/bdiBcqlzMGKjo8GkLL7FSbZY3l1sStGxMjZQx
         ArOYHOgh0SdgA0g+TI0ZN+baJeD6Vrh96ReATRvG98ioa3SETqUCLrcut68lVZyNfDSo
         L4lQ==
X-Gm-Message-State: ACrzQf2LWjuFtTOdCqBVOYPKHCohn9wgINSEigkkKqpCJZlupT3qXIRV
        +9+09N3UOP8iUmQniRlxIT1siQ==
X-Google-Smtp-Source: AMsMyM7pGy1YVzFvNrD56K13wYvuEXn7Yf2+HAavQCUFPDqZERqo62flx03xCE0JQukad7Ad5dV3Uw==
X-Received: by 2002:a2e:a448:0:b0:262:f7c4:31ad with SMTP id v8-20020a2ea448000000b00262f7c431admr8145408ljn.283.1663745549394;
        Wed, 21 Sep 2022 00:32:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f13-20020a2eb5ad000000b0026ab83298d6sm316063ljn.77.2022.09.21.00.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:32:28 -0700 (PDT)
Message-ID: <adc622c8-d2b4-5867-60eb-49eaf10cf701@linaro.org>
Date:   Wed, 21 Sep 2022 09:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: dwc3: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20220920224320.152127-1-mailingradian@gmail.com>
 <20220920224320.152127-3-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920224320.152127-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 00:43, Richard Acayan wrote:
> The Snapdragon 670 has DWC3 USB support. Add a compatible to reflect
> that.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Missing changes in allOf?


Best regards,
Krzysztof
