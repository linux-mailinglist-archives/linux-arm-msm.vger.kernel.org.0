Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15D3659061
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 19:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiL2Sa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 13:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbiL2SaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 13:30:03 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671C398;
        Thu, 29 Dec 2022 10:29:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9F882CE16C5;
        Thu, 29 Dec 2022 18:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37D6C433D2;
        Thu, 29 Dec 2022 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672338560;
        bh=zpSbcCNK25rUjje8uqqFcgexRmkYeOWXvSLNq8K+unk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lCbmrJSG+11bT6Xk4w5ANPk6tJ9lXJCg/jnPVRQI6Iz5cqMi3EOu6GzdMdJKptvtK
         Fzg/3KfQKl1ncyFvBTFf7lZjxtFrvrQggVe9TKVLyq3Q1PPbrFWMreKzfMMx2IfopG
         kbBcYl4vKRR0ktb+qXv+TIsOr6tEySd+3Q0Ivukg641GnUdsFOp9ZAArZc5wd1FzYK
         KlBjW8+U4EPZCk4B2UiNa7bMHJFzoZo+oZmtbTGNvGNl/P0jqjiIuzP5tca3MNob0Y
         So24ukmCHqhqKNizbasfC9PX+ZZG0j59ygUBo+0WV5O/+VSEPMyXy8EGj3/8IG5p+G
         y9lBkTRhszorg==
Date:   Thu, 29 Dec 2022 12:29:17 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: apr: Make
 qcom,protection-domain optional again
Message-ID: <20221229182917.j6wrerqufom3hfx7@builder.lan>
References: <20221229151648.19839-1-stephan@gerhold.net>
 <20221229151648.19839-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229151648.19839-2-stephan@gerhold.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 29, 2022 at 04:16:47PM +0100, Stephan Gerhold wrote:
> The protection domain functionality exists only in SoCs starting from
> MSM8998 [1], while the APR bindings are also used on older platforms.
> 
> Commit 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to
> shared schema") made the "qcom,protection-domain" required but it
> should remain optional to avoid dtbs_check warnings on older platforms,
> e.g.:
> 
> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb:
>   apr: service@3: 'qcom,protection-domain' is a required property
>   From schema: Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> 
> [1]: https://lore.kernel.org/all/20200312120842.21991-1-sibis@codeaurora.org/
> 
> Fixes: 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to shared schema")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr-services.yaml      | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> index 290555426c39..bdf482db32aa 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> @@ -39,8 +39,8 @@ properties:
>    qcom,protection-domain:
>      $ref: /schemas/types.yaml#/definitions/string-array
>      description: |
> -      Protection domain service name and path for APR service
> -      possible values are::
> +      Protection domain service name and path for APR service (if supported).
> +      Possible values are::
>        "avs/audio", "msm/adsp/audio_pd".
>        "kernel/elf_loader", "msm/modem/wlan_pd".
>        "tms/servreg", "msm/adsp/audio_pd".
> @@ -49,6 +49,5 @@ properties:
>  
>  required:
>    - reg
> -  - qcom,protection-domain
>  
>  additionalProperties: true
> -- 
> 2.39.0
> 
