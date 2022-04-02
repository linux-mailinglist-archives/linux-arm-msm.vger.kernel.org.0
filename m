Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0E34F0481
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 17:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357324AbiDBPny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 11:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357321AbiDBPnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 11:43:52 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1FD14F138
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 08:42:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x34so6212034ede.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/1ro8tQBrzzhuHYGCTTW51lxgZYPTb0hWOj8uVPdJaA=;
        b=DE5ZXzwihk3hW0BjtGv20tWuAI8fOMnS7J36BsXSJd99OEZLeqnWTaKqHHfMml4hBL
         lcpOVvLisM6Gxc/vonNnxpipkZMHWhKPYgyVjQ7vN5YxnA+68bT8yqbeZVSU2lfnJ4yx
         fX7QssMbDqVm0vCF6e3cpugUNCP2j5dxenp9Ndg3+knoNKkXRMj7ROgi+yh73j9E1B8p
         a4aMe08MlbWb8NVv5F3dFZiWvT0LEU0oQ222ovPiEGm2NiFPuIZXD5HsB2GkKJZYohyf
         X8QTWY5maQ/+ddkm/wTSIIUzZnvWtiFp5T1GG4zoNYV7nq7ckOzf1e2mbXPLVhn0fPrc
         Oqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/1ro8tQBrzzhuHYGCTTW51lxgZYPTb0hWOj8uVPdJaA=;
        b=Omcvwv2i3rgA2+XyL+fhMk6e/eMJVEHsyGGcZ7S2+UBao35o9Q5CkFxjTRgWK+nUKZ
         f5myc2nCANoIBJpzDcMA0/A2L33jASLQvlTXp3YLcFGzl32PmSvj8TTK7NcwVI2d+V6m
         lo8bmJpiRwKPoWG0Aw21fhtBI3EdksqafFzgzDDfWMt1NjjqJlICbOdpc5O+ROSH7G1B
         Y8oDzdgm1+Ng068vHAczbAa1rcequ6nX1YvDKP3s55QisdY/SUA3D7X8AXIe8wBRvKA6
         RfrccsFaSpSbTbcmBU9Sqs8TBxy8UiTNK2YvSGg7lD+hl1UvNjDuwT7NtZP6h7Biumc7
         8bxw==
X-Gm-Message-State: AOAM530tJZI/Tekw0Z8b0vJV60Xlb1qfsWMQw9idBwvzpn6tGk2zTfrX
        1NQ7LTP7Qlbwg8bmPgZuUjpAJq797UJUTaze
X-Google-Smtp-Source: ABdhPJyYAMzycUzG/gC7klzE1UkCsDtDrTomQZ7OR1EahlBRjc65F8msj8gZuIK0bq0XpsKgWWCEIA==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id g9-20020a056402090900b00415cdbf4748mr25505067edz.395.1648914119101;
        Sat, 02 Apr 2022 08:41:59 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id kb28-20020a1709070f9c00b006d5d8bf1b72sm2200799ejc.78.2022.04.02.08.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 08:41:58 -0700 (PDT)
Message-ID: <5822a845-3291-70da-cbac-933983a22442@linaro.org>
Date:   Sat, 2 Apr 2022 17:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] dt-bindings: qcom: geni-se: Remove common controller
 properties
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-6-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402051206.6115-6-singh.kuldeep87k@gmail.com>
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

On 02/04/2022 07:12, Kuldeep Singh wrote:
> Now that Geni serial engine controllers(spi, i2c and uart) have their
> own individual bindings, it's time to remove all common properties of
> the controllers from parent schema.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  .../bindings/soc/qcom/qcom,geni-se.yaml       | 33 -------------------
>  1 file changed, 33 deletions(-)
> 

This should be squashed with your previous commit, because removal of
last direct child schema, makes the common parts obsolete. IOW, the
common parts are only because there is children are open-coded here.

Best regards,
Krzysztof
