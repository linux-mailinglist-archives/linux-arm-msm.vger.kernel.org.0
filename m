Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C05495623A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 21:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbiF3T5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 15:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235499AbiF3T5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 15:57:13 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6C645040
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:57:12 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id y77so712129oia.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=asrsLCve7ft+8NRUNZKYtim8NNgQyrp9MB13KeU7AbI=;
        b=yNpeqvk1lvjfuzCg0bY5aNNrru2ODDt+C/BmJ7Om+4lIpk/yrCC9CllVrX14RMSHLU
         pgSKuIL2rAv3z3/VqEEoMHNKH+2v8H6VUimjl91OxDgajjUDw/je7y6/KEr9XFbyWA1y
         vCqgii46QzT1JkSkLDa54gq5BIXpfqqaxv4Dxrb2W32jLJL21qbBlwDC1KwfPGBs3uJd
         3bAxYVrI4fanNVhr84Rmowx8YbUBYqqD7VYgkgB0smp6/DJQTixRIQBwXA+HU5DD6MAR
         ZV1A4hWIqHzrGY9Y8YroHP5M6vmp5y9x5m0ZWIzj6Ux342u1cvKdmD6ONidWglNDyktY
         u9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=asrsLCve7ft+8NRUNZKYtim8NNgQyrp9MB13KeU7AbI=;
        b=clldaUwyaOi5pSp52y51O++xwq3JWLo5Xqze5qZEtH2Jbx7c7AWgu4mkNhwBeNqPh7
         C5EqJBTQeuoLu2DOUC0tLQE8GlFLcrwabCwck88mzEY+3YaqRZImq0uZuFfSabLVqNE8
         fSR/ZMPS2WDvVHSsjyBuMztTFVUZo7cEDKoaayO1fjzbZpHLbK1UZAc1Oles2Us+Y+h6
         n5HyLSeJqnY/WCSMusy0BlAlg+ekXZJeFK63ZP/t9vEofgYVk5b9XcVU2oVLHUepuLyE
         /6OVvrUV6Z4V0yyrsdd72++Rq18cxSr+zwpz/zwRrsixKaT25p8E6fZZqOpDv95BXNQv
         en+w==
X-Gm-Message-State: AJIora+3guyilac2197w50B1ow0sCogSxo5ixOAyFc2dgSN1OwH8oShT
        6rrh96hMAwbb9MsDiLc/hYyAUg==
X-Google-Smtp-Source: AGRyM1s1HI8pDKjCbt5ffi/PZEpuSXDvN+CbToQtKcmm9nU++mum28Dm+XRBlc2un5/DA+FFmCZq7g==
X-Received: by 2002:a05:6808:2113:b0:335:5252:ddf3 with SMTP id r19-20020a056808211300b003355252ddf3mr6648541oiw.94.1656619032354;
        Thu, 30 Jun 2022 12:57:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n14-20020a4ac70e000000b0042313f42b26sm11273140ooq.39.2022.06.30.12.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:57:11 -0700 (PDT)
Date:   Thu, 30 Jun 2022 14:57:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: qcom-lpg: Add compatible for
 PM660L LPG block
Message-ID: <Yr4AFu3jf+9hGMKK@builder.lan>
References: <20220511190718.764445-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511190718.764445-1-marijn.suijten@somainline.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 May 14:07 CDT 2022, Marijn Suijten wrote:

> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> index 409a4c7298e1..cd02811583ec 100644
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -17,6 +17,7 @@ description: >
>  properties:
>    compatible:
>      enum:
> +      - qcom,pm660l-lpg
>        - qcom,pm8150b-lpg
>        - qcom,pm8150l-lpg
>        - qcom,pm8350c-pwm
> -- 
> 2.36.1
> 
