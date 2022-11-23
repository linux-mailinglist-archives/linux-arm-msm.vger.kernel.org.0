Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948C063619A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 15:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238520AbiKWOYo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 09:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238302AbiKWOYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 09:24:20 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8E87019F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:23:41 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id r81so13242898iod.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1UkvXdyB5grsDX+DpfpfHGwXdyLwRQSW7ihYUh2OCI=;
        b=CNywUmiR/9i11uGJf/eNyJMRc1L93C/RW6z93yCkxxnDILf2BhI9PRzh2Rn/gCIy/M
         o7zT3QPNe2tFbY5fAzn++qudN7wFVJuP2+aaUBsw5BxytmbpV6RGw5IX/3UdQ1wcorsl
         yE/AlNuxpi/3sjGYPihKlndBTEdAreoe/wtEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1UkvXdyB5grsDX+DpfpfHGwXdyLwRQSW7ihYUh2OCI=;
        b=bJpIpceDS91w+3wo7y1/cei1Jz45jxdVnBCAXp0ehUfjQubD/T4xMXdpw2lExQBFGk
         6MnH1BMXefltp9uCwzztiwCu8PZXAFy0pUpw7KSUshKqqHm5RXldLYPRxVn2Z8W7fbo4
         QehydyHES63cShVfnEB2g6WL/UlVHvd7WCUDcxanMULinSehh4spqlluTYjBWaKfC6Wm
         gm8OG4mQgcLQKpMFPGCzqV0VXJka6rLfvYyfwZX+bWWeWtmKWH0pZFlJUI0tq5bmXvqZ
         PoB+3rR+14D3hmEyVxFMLTWRnTSnqwRrTvk5In0NMNCXDyLecPzg8u1SYZjTESLySkzQ
         483Q==
X-Gm-Message-State: ANoB5plntgTUNORggp0veO+ZO9MrM3m2Xd4l32BCdv52na1FU6/fJj7t
        znCjYnm+9AWFof3/vmyiiuANAw==
X-Google-Smtp-Source: AA0mqf7O1OlIF5XvMdBZppWjK+uOto8yKrkkOYEtQGIu4fAkGVLl1nEiXYAkf1yX5gMlNeS8FMIpVQ==
X-Received: by 2002:a02:c603:0:b0:387:bdd5:a05d with SMTP id i3-20020a02c603000000b00387bdd5a05dmr859941jan.136.1669213420538;
        Wed, 23 Nov 2022 06:23:40 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id m30-20020a02a15e000000b0036e605a3e79sm6143933jah.17.2022.11.23.06.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:23:40 -0800 (PST)
Date:   Wed, 23 Nov 2022 14:23:39 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Adding DT binding for zombie
Message-ID: <Y34s6xRnroQ6fAd2@google.com>
References: <20221123181043.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123181043.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 23, 2022 at 06:11:12PM +0800, Owen Yang wrote:

> Subject: [PATCH 1/2] dt-bindings: arm: qcom: Adding DT binding for zombie

nit: s/Adding/Add/ besides dropping the redundant 'DT binding for' as
requested by Krzysztof.

Please version your patches. This is v3 if I'm keeping track correctly, so
the next one with the fixed subject should be v4.

> Add an entry in the device tree binding for sc7280-zombie.
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 463509f0f23a..7ec6240311db 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -655,6 +655,16 @@ properties:
>            - const: google,villager-sku512
>            - const: qcom,sc7280
>  
> +      - description: Google Zombie (newest rev)
> +        items:
> +          - const: google,zombie
> +          - const: qcom,sc7280
> +
> +      - description: Google Zombie with LTE (newest rev)
> +        items:
> +          - const: google,zombie-sku512
> +          - const: qcom,sc7280
> +
>        - items:
>            - enum:
>                - lenovo,flex-5g
> -- 
> 2.17.1
> 
