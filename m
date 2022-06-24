Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF341559705
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 11:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiFXJwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 05:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiFXJwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 05:52:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729A7794E7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 02:52:16 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id cw10so3638841ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=rivE4wr8UJbawIIZz5aCEb4ZT16feQhkHfAphnrA6WU=;
        b=uGneM71SQXFdic/t3HGx3tsStz5Qf4y9dXBWUgspI0995RcXcn4IYS7syHPwcRyVUc
         WwGFfefcpd48S8sI74mHc12zc3vJBPS4ChSzrEmrbXI+odU+6jNV4KZuueSe+tx15RU0
         jd6uKblRbSC0jmWgPQBhh1VsW20Wrbp/ByeZRchbsguXhCvKD+M7Ros6v7KiAuhmxTBA
         iekZXm1+h/Jhm92dnXnUZ7ybm4m0I4fd4Lcsc1ZVA5CrYz1yZtIccQUoF4aM8//TMKQY
         6VzED93Rbd3e66t37ayYGrNp5rjkpoiSBfkisrvrgbdxL5UjQ5cAdrLJ8LKX/6ha9PMp
         DK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rivE4wr8UJbawIIZz5aCEb4ZT16feQhkHfAphnrA6WU=;
        b=0DqRD4Tqg/75vMPvcmn3XmC7G/Mz5akMReGRQMaHMH09cy/6ChRmplvPc5Q9fU8RI3
         9fj3L1+QEsnbo60wiiL/VmvFzKKuzJUU+N1U+2X1q2R2zqT3pD27tFHa3SMS5pneEBhw
         qA0/WqetD/AvrrSOwJY7R/Re0bVehoV09dA/FCYsT2mI+RrUgTucab2EJRx7HyQz61Wh
         RBuNrhga8KfVcHba8Yq2tI4BCOqYGWVzLZnaKg7ZorjmlOPRPd/Iph1qUgqmyM+BDI9H
         9oRjDUqdzEQ47u+MW1IzPlKiz+eBWzywfhDCsvFozStef2G32Ls/foD9BEO/OgT65/lg
         e3yw==
X-Gm-Message-State: AJIora+UopcrisBmzsd65vJYFPGL9Xn/siel7oHet0sZ028QZ5EgC3Yz
        w4ggLZZeVUCBEp2K58nNCMtkvvwBIQcWPA==
X-Google-Smtp-Source: AGRyM1thP2j2F1e2C7KdSKxzE1Ry8ZMuQ/aeS7RCYjBG/O6aI3BQ7HnUd6GUGN4g3imvS3JUTHQHwg==
X-Received: by 2002:a17:906:76d7:b0:726:31da:55a with SMTP id q23-20020a17090676d700b0072631da055amr2041726ejn.607.1656064335085;
        Fri, 24 Jun 2022 02:52:15 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b15-20020a50e38f000000b0042dc8dd59c7sm1596608edm.51.2022.06.24.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 02:52:14 -0700 (PDT)
Message-ID: <26cdc24c-e0e8-1059-f6ca-11c08615eeca@linaro.org>
Date:   Fri, 24 Jun 2022 11:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: firmware: qcom-scm: convert to dtschema
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20220623182542.1116677-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623182542.1116677-1-robimarko@gmail.com>
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

On 23/06/2022 20:25, Robert Marko wrote:
> Convert bindings for Qualcomm SCM to dtschema.
> 
> SoC compatibles that were used, but not documented were added.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

This was already submitted:
https://lore.kernel.org/all/20211218194038.26913-1-david@ixit.cz/

David,
Do you intend to work on the bindings you submitted before? There are
several pending on your side (things to be fixed), so I am not sure if
work is abandoned or just waiting.

Best regards,
Krzysztof
