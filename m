Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CDE554C22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 16:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357667AbiFVOFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 10:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357604AbiFVOFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 10:05:13 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842BC31917
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 07:05:11 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id t5so1986955eje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UE1r6lMX1LSKeFLb/8EsOLr5fmA/Z61QnVe45iog/zI=;
        b=htE6GCh2vnEGMBL5lrnsbYR45vdl28LfLNMWLEEshX6SzWblWskBdUnGbX0nXtc7s3
         y03iqpFLQUk27Aid5UzHoBlpYQ2rD6XgtMFLyxMgZlnRsU5kq5dlR8GkYaM8d52J8HBE
         f7HvghdigHQ/njXsQmktBklyLfuoFNmocna1SID3my6jUrJNf8WlAKIIfy+Caxkb539M
         Rwbc6Ydn3aqbM6Xl8FIW+Q6qaB7ks1mxR1EsQhKAANiZqzj/zGmCGGXYViAJeSymm1/F
         BJjA/DzToixOcq2SJFD6bnS4vb8CvWD/HkP04sopNPmaNfkIcvNCiw9bZ/Ra9bVqcuzD
         B1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UE1r6lMX1LSKeFLb/8EsOLr5fmA/Z61QnVe45iog/zI=;
        b=m/4rosIjizOYBAtRI8EX77V6CyGAOk/XyXfQj2UxzBZVNe0yJwTbn91qTC2AzNCdbd
         YYoSI6i6b+TiqeDFZY/0Q3aWVrwHx9zmYCC/hh7FNATNqSgvq7I0u/gSDYYkqmddmhLU
         WKcp3Pd9NGyutJy/4LjzAI8/KLFZxB1d2Ea4mMVj2VGvJOh/PBLMvskxtxLjJoCimIX2
         VrehHsQjpQgz/dPvekhUqeikez+RoaUcKKI+d++DRy4Za2xt7WbXfiKnyRHTw1ZsfdGx
         BCr01RHttEV/bfzywDRqP2rp+LUKQQkk3GPEyqtNrhwF2x3D7jwuxZfu2rV9hRcVtZXQ
         qv6g==
X-Gm-Message-State: AJIora9BEhny/abqnMteMpx67zOHHg/kAsHfF1kEF0ESS+GkamL0SsBa
        85Sq9iWS8nq808d3qIGFAQeWFA==
X-Google-Smtp-Source: AGRyM1slfBibZDlu5JXLddr1PQXZ6Z5bDa5qcMSAicpyowa3br/kP6DsF2xLoR8e8QZUOJCOZQuQng==
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id g8-20020a1709065d0800b006ff08eddb63mr3262078ejt.408.1655906709967;
        Wed, 22 Jun 2022 07:05:09 -0700 (PDT)
Received: from [192.168.0.224] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ek6-20020a056402370600b0042bdb6a3602sm14526265edb.69.2022.06.22.07.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:05:09 -0700 (PDT)
Message-ID: <f32f6b2c-462a-da3f-d74a-cec7d42f7dac@linaro.org>
Date:   Wed, 22 Jun 2022 16:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: qcom: Document additional
 sc8280xp devices
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220622041224.627803-1-bjorn.andersson@linaro.org>
 <20220622041224.627803-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622041224.627803-2-bjorn.andersson@linaro.org>
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

On 22/06/2022 06:12, Bjorn Andersson wrote:
> Add the CRD (Customer Reference Design?) and the Lenovo Thinkpad X13s to
> the valid device compatibles found on the sc8280xp platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
