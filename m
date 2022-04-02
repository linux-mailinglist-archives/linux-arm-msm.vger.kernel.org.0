Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F351D4F047B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 17:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345631AbiDBPlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 11:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238221AbiDBPlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 11:41:13 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B81B49F28
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 08:39:21 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ot30so1692631ejb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HTmUhSuCrBAcFcQhQWbSE2rt50dwUkFKMEiyaB7NEhE=;
        b=AEZrl/zeCFxqxju9n6mCoWbjEGWNrReWJ5oQ7xjuZArWt3Y4td45VhA/bq0miFC8/H
         L/WYr61+ZypaTjgH6FShELlAaAaXy97B5KooPp6phZ9J69h3IHRbxau36JXJwgPnbJcI
         INNCFsgDPG5siiVsS2CCre5uwaOsTBfgaXz/lSQQJF5h/3jZkQ6rOaoxnHYtIsg8faye
         ufniQ7xg82zX4eiMzg4gsS+MUcuwa7DbQpcbnjaodEQvTMQu1iY6Dy34QVcoJjSyqkVo
         YitlEbnDE/vKkLSUqgz3Tf68B1I18To42fAeHPMuxwx3W83XX7Uf1jHOruxEgppAXh20
         GDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HTmUhSuCrBAcFcQhQWbSE2rt50dwUkFKMEiyaB7NEhE=;
        b=FvnnBleNpS0ElSByI1rJcLSgN+Mm/xQSsJ7bowZsmH3HcmJGbM5akEMKUA1odpwayX
         vNUX80MP7eQbayUK8cb+PMucY65M9rkExuC1rbKy43HL+WbgsTkwzzvDYEwW/fgdk0aD
         O16xuitVPtjdbVcKo3oQHD8KAJyYirPf/9Egp6LBPW9d8w2e2t6q5lxPrx0EdQ13ghl4
         DBKspAXFcieWjhu3a0uidFJf3CNg0lFKlOdNKA04Gh108jaR90Zi8iH46u+QeE028yV2
         6XKw7W7VGOcOySueumKi4w7BOjrvP5rggHfNrHAFd3oDgEOgCEMI4sQC20lcl3ujnQaj
         aUPA==
X-Gm-Message-State: AOAM530XjM2ClqkdJbTjpyDpgbDdqokObAcp9BAj5mf4Oin8qTbDKnSN
        ifYss2cajGC8zppCMcLqX3B06Q==
X-Google-Smtp-Source: ABdhPJw3Y286jmT/soJyEkKu4z1IM0wel1treU/ae2nrWcaZmJslO3+Do9LPqy0zfPirmjgr9nBZQg==
X-Received: by 2002:a17:907:971c:b0:6e0:d0ef:393e with SMTP id jg28-20020a170907971c00b006e0d0ef393emr4191888ejc.562.1648913959787;
        Sat, 02 Apr 2022 08:39:19 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709062a5700b006ccd8fdc300sm2154593eje.180.2022.04.02.08.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 08:39:19 -0700 (PDT)
Message-ID: <78f475c2-c6ed-7f3a-22ec-f5f290cfd107@linaro.org>
Date:   Sat, 2 Apr 2022 17:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/5] dt-bindings: qcom: geni-se: Update uart schema
 reference
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
 <20220402051206.6115-5-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402051206.6115-5-singh.kuldeep87k@gmail.com>
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
> We now have geni based QUP uart controller binding in place as

s/uart/UART/

Similar to your previous commit - this could be one, max two sentences...

> dt-bindings/serial/qcom,serial-geni-qcom.yaml similar to other
> controllers, update reference in parent schema and while at it, also
> remove properties defined for the controller from commown wrapper.

s/commown/common/

> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  .../bindings/soc/qcom/qcom,geni-se.yaml        | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
