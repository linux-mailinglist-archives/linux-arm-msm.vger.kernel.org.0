Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39BE25EDB7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 13:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbiI1LOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 07:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbiI1LOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 07:14:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3FA1114E
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 04:13:02 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x29so13985214ljq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 04:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=F99mTczSxOdNAN6W4JqadV98hAJQX4pGEisajQkbFpU=;
        b=wrotcg3/HeGgo3IHOLG+qLERYGRLjzhDBFippdTXUXJIzm0FXqnm0xt4PA+09J11Ta
         PjNi5F8i7zulKsFmjj6H9MJvisUm5lW5NsSNbgU9LCjXtwyiyd98oNrKH3xsYLVKbX4V
         Iqv9pwreSrZ2I0TIGoKfT4tTcLbn3zvZXJO//SAquS7WKUl90T28EcVt8/7xMFAexgBW
         PYK2nBIJ3Lu/EPvHpn2BChVbSFcwW8cCGAGRaZykjphHywFxRR9EuFda2OFwuYCAZSld
         GxtZ03xOwTXSsM1cc4wevT0h2kInApMJNzRIIBhkWp9O1hxkGg2zpk++V5hQ8Dix8W3P
         9shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=F99mTczSxOdNAN6W4JqadV98hAJQX4pGEisajQkbFpU=;
        b=mKivVklZ3+yvbQEgCfAmkkFxQE0yaFkIRnLz48r/RRaxOYx6iIU7Xd7PNQ27PXmoZn
         yogAx9NkZotGDxgRudxMauVtcudA6isOdD/HdwyPgNDCdD3RMzyDLNVB1o7RiULZ5gUz
         xQutl6k6fByNYx+c+C7oPV2KJTvZ/zmSEDTveGu9ZGjPP+ShUk00gjtcFc3r3zK8iSkm
         vlRpT53h1fl1gghHCH3SIJ+2MyruQbkaRr6NXC708Oe/dhOqPN81CdLWz6SHvmm8rUE1
         KQWa5VeWerXuaj9VCSq6uLiJ1kzjW53hHupQUKuVZYyM+o4VkTOwfqLHneqnxmNHTp9O
         cr7A==
X-Gm-Message-State: ACrzQf3DF3sJieom4zDEL36NaAk21C8bnPjdUNOFQXFO41VYB/rHHoU9
        X7xJ2TYVwkHTGjaZNnXcK/jZog==
X-Google-Smtp-Source: AMsMyM6qVX4OKTkuH0HP9YpXpMKG2FaKhkTj8gjxJVRcBU6NdRZ3PzpuAGruLVSgf0MhE0x6RomTOw==
X-Received: by 2002:a2e:a54d:0:b0:26c:64ae:236a with SMTP id e13-20020a2ea54d000000b0026c64ae236amr12359061ljn.207.1664363581102;
        Wed, 28 Sep 2022 04:13:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651c118c00b00261d6f45c2csm409600ljo.124.2022.09.28.04.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:13:00 -0700 (PDT)
Message-ID: <2f9f0b2f-4380-a155-f6ac-3ce1be3bcf91@linaro.org>
Date:   Wed, 28 Sep 2022 13:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: add xiaomi,sagit board based on
 msm8998 chip
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220928103319.621698-1-dsankouski@gmail.com>
 <20220928103319.621698-3-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928103319.621698-3-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 12:33, Dzmitry Sankouski wrote:

Missing commit msg.

> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> To: linux-kernel@vger.kernel.org
> CC: Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> CC: Bjorn Andersson <bjorn.andersson@linaro.org> (maintainer:ARM/QUALCOMM SUPPORT)
> CC: Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM SUPPORT)
> CC: Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> CC: linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
> CC: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)

None of these go to commit msg. Remove leaving only your SoB.


> 
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index fb1d00bcc847..00e51d22aeb1 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -76,6 +76,7 @@ description: |
>          mtp
>          qrd
>          sbc
> +        sagit

You do not use this way of compatibles, so don't extend it.

>  
>    The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
>    where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
> @@ -239,6 +240,7 @@ properties:
>                - sony,xperia-lilac
>                - sony,xperia-maple
>                - sony,xperia-poplar
> +              - xiaomi,sagit
>            - const: qcom,msm8998
>  
>        - items:

Best regards,
Krzysztof

