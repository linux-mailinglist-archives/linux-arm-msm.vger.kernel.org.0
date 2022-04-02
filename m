Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9726E4F0477
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 17:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiDBPjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 11:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiDBPjw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 11:39:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22AF147AC6
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 08:37:59 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bg10so11627445ejb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Om7g1lbZHptt45F5/8EMxdm2FJFfgH0D0EuLInj36vU=;
        b=JVpQL/v5kWGf/e2/0JHBaEUGGw/gj3Ojbu7L/yyxICvL6KyitRYisyaCKKvLuhnzRR
         bAfAQP9PDU2bjs9AqA2JVHTfBGMh8fmWIugeGXrIAu6aDnRrJW7zkBjzeIA3lxhPcJak
         SZkNWnlrUSlK3Rd3vLkZqXMrEcEVjAlK+O5bwuXqMDa1vGIOlmnhvuK68upNgJyomv7G
         sc3KNTc4y9T5EXLE/guXbGP0nyME9ORiSoViSq/PG2SA573R80+wm5VdUkKA1OWYXX0R
         pTnm9LSwLzLb/WXEzClRvpw2rsunxAiftvC1xqcKI18olKG7ZZnq5RGSNnw/MlN5LwvF
         6Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Om7g1lbZHptt45F5/8EMxdm2FJFfgH0D0EuLInj36vU=;
        b=1Eyt/JtT0LZf+VKmZgBCAd5E5dtMW0ch7zd9xohKxcVnzNJEtT75G0JRC0xZM41jY8
         mi/jqijIom6JJ8nOJm94Z7zRLBkTscoMn6UP61LMkOKzwqhM/V4QC3smMRhY7ExcjsHZ
         LDFmz/2Qu/2Gcz42fqGK3hAcGMYjHaSqxz3dcCt1EZY2vGq370Q3BAhj2CC1Ihk8XyYV
         N+MtxAE6AZ9bkTkVIU9123kCrNfhBrNancvXkXBAKgaXaGpfgyB47Eu+bdmGdBxKK9rV
         0gLNR3ypW1cEvw43c3Jm2S9Bvd9AIMoUlF+mMrBx++hblGsECU1LZhdx9oHsw+8EB/8G
         xPLA==
X-Gm-Message-State: AOAM532GBU8+TKaZ1sQ5BbICmjChlmIfcOrLgEeFYyIdhTutUmpP9n7L
        zDJvW3hXXB/+RP8g7b2FnJXz7g==
X-Google-Smtp-Source: ABdhPJyxFZOKe4x3u3oQufe6RweNYX1YclatcvzBUnGqI5aWiZseTdOA+bMUDSEEh3I460buuu9lLA==
X-Received: by 2002:a17:907:7f0c:b0:6e1:42ee:3e71 with SMTP id qf12-20020a1709077f0c00b006e142ee3e71mr4248325ejc.127.1648913878505;
        Sat, 02 Apr 2022 08:37:58 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b0041cbaba8743sm434843edk.56.2022.04.02.08.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 08:37:58 -0700 (PDT)
Message-ID: <523c6f46-54eb-22f0-221c-981879b8311e@linaro.org>
Date:   Sat, 2 Apr 2022 17:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/5] dt-bindings: serial: Update Qualcomm geni based QUP
 uart bindings
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-4-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402051206.6115-4-singh.kuldeep87k@gmail.com>
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

On 02/04/2022 07:12, Kuldeep Singh wrote:
> Similar to i2c controller, move geni based QUP uart controller bindings

s/i2c/I2C/
s/uart/UART/

> out from parent schema to an individual binding and let parent refer to
> child schema later on. Uart bindings also stand incomplete right now

s/Uart/UART/

> similar to i2c, complete it along this process.

s/i2c/I2C/



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
