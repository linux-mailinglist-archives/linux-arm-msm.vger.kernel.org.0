Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B84E5662B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 07:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiGEFTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 01:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiGEFTd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 01:19:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB75B10FEB;
        Mon,  4 Jul 2022 22:19:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6EED5B815FE;
        Tue,  5 Jul 2022 05:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E207C341C7;
        Tue,  5 Jul 2022 05:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656998370;
        bh=Nan9B/WhP+R80VxCKfZuBKrlbu2KTkNVySZBPTQurr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iDpdLIwL2W9I72GrLDRGUChEUERlHuAVoGfvfNCN1x6TXDlgw7YDLGnSq3RXmw+LS
         MEYpmdBgAhZs2XbSKEDhXvXKtzHiX9UOx3lRjwPKi7oOUxmD3yHYZzeD5TkpJVXoyE
         feE9Uh3m9NJ8FHM3cTYUB2roORHtAipczvvw8MoCNO5rcmxsJ3MZTEeXNj8oQSLNzM
         RGQapQE8jbfrUonx55SR15avYqRpPosB3M2TOhE5GSwfDbXmPfsyqyPlXG7jZgEsri
         9Fk1CJgZ87eZhPQBCwYq8nJRt09onEjvCR/FCI1S7U9fe6lYVCLSyJVQClTRC3v3nW
         77R30MRF/uR+Q==
Date:   Tue, 5 Jul 2022 10:49:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
Message-ID: <YsPJ3Z5+N4ZmCmcS@matsya>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
 <20220704161148.814510-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704161148.814510-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-07-22, 19:11, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required. Also add the XO clock to the list of the clocks used
> by the driver.

Acked-By: Vinod Koul <vkoul@kernel.org>

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,hdmi-phy-qmp.yaml           | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index eea2e02678ed..83fe4b39b56f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -28,12 +28,15 @@ properties:
>        - const: hdmi_phy
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: iface
>        - const: ref
> +      - const: xo
>  
>    power-domains:
>      maxItems: 1
> @@ -44,6 +47,9 @@ properties:
>    vddio-supply:
>      description: phandle to VDD I/O supply regulator
>  
> +  '#clock-cells':
> +    const: 0
> +
>    '#phy-cells':
>      const: 0
>  
> @@ -75,9 +81,12 @@ examples:
>                    "hdmi_phy";
>  
>        clocks = <&mmcc 116>,
> -               <&gcc 214>;
> +               <&gcc 214>,
> +               <&xo_board>;
>        clock-names = "iface",
> -                    "ref";
> +                    "ref",
> +                    "xo";
> +      #clock-cells = <0>;
>        #phy-cells = <0>;
>  
>        vddio-supply = <&vreg_l12a_1p8>;
> -- 
> 2.35.1

-- 
~Vinod
