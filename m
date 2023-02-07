Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F23668E2A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 22:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjBGVGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 16:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBGVGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 16:06:42 -0500
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C04911A;
        Tue,  7 Feb 2023 13:06:42 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id i21-20020a4ad395000000b00517895ed15dso1568406oos.0;
        Tue, 07 Feb 2023 13:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J313f1fFwjARml3wmkpP/9/rfqZBYmRUA6HuCdszao=;
        b=h405AfHu5zuQU/JwW/zWilfVAldxDAT3bh+PWCxgn5Hh0fUdc1RSFoMX7LvTvsDWzK
         Jc80GZZFl2ZLhzYv4Dhcn83H9k5U53zeBEfLH/WAoOT/uxxWHx/i96s+C7HoOKR2cu62
         trsgecainx7vAJe6lgmxys5zpi4nhOZ/ixZ3VAkwc5tNGFJaikXz2xjF2X5BhpFM+Cea
         8xM7zHKa90yHuxbJ9/9e6rN7YPPnFTZ8e4bwKKpgANGl/1sWdjQZ7z2QxeGku7RoXVjn
         KsKtMExQZcMa1JRAddW2eUu/bxLr44cP0VakXSeQDNu+BkC0Bib5//TMk7qNVWPN0zfR
         EBeQ==
X-Gm-Message-State: AO0yUKXtgm/nNiFWu1QGJw9bMwTPc2InyhIhl9S17ARbOX379YNCReKq
        GBfkQkBssffoWAVpNbmlhQ==
X-Google-Smtp-Source: AK7set9ouCRwzhuZPPza9sCy0hSempMs3/0tikUGOU+FIPe23o+hHRX5Ij/JGGiN1zgVEy09pJszJQ==
X-Received: by 2002:a4a:d6c2:0:b0:517:452c:f4d2 with SMTP id j2-20020a4ad6c2000000b00517452cf4d2mr2301431oot.5.1675804001467;
        Tue, 07 Feb 2023 13:06:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a4ac284000000b005175b972e52sm6462223ooq.31.2023.02.07.13.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:06:41 -0800 (PST)
Received: (nullmailer pid 4154455 invoked by uid 1000);
        Tue, 07 Feb 2023 21:06:40 -0000
Date:   Tue, 7 Feb 2023 15:06:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,q6apm-dai: adjust iommus for
 SM8550 ADSP
Message-ID: <167580399988.4154399.8014326136743257868.robh@kernel.org>
References: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 06 Feb 2023 16:05:32 +0100, Krzysztof Kozlowski wrote:
> It seems that SM8550 ADSP remote processor uses two IOMMUs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

