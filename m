Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C5164ECC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Dec 2022 15:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiLPOTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 09:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiLPOTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 09:19:07 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A1855A81
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 06:19:06 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id 3so1272500iou.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 06:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl0ZP4xK4Upd+cEBPXBThb9AV02PUTeFRKB2U0gXeKA=;
        b=h7Hp8co82FOYwMgBFNyRwl5UEW0DjFrlU1OxyWcWEStRdx8/2uo50bPmCKju4kCHMs
         ZLz0tmw4M2Yk8/4wuarPbGE4UJkQPxJI7BV6/EjCS819Ul440ukpe82XWfl1q1fjqlKL
         h0gEHODrQTaOrjFSEptVqYyf4PxscG/XUjrdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl0ZP4xK4Upd+cEBPXBThb9AV02PUTeFRKB2U0gXeKA=;
        b=l3pErJB2SRWzOaaz9jtWfjvf07shS+jgWkWnUgX5bMnvbS2+HfK4d5WNlsJKtafozt
         B5+KAHBCGvgFpFBtZvTuYFb1lEFWeXr7dEHj4WmwfcLrk1fj2a6IpPcYoHjxpqM+hrE0
         rCHaJOwEA8TYJLfFCYncerP5fi7UWcB+1XqvDZtTWElr2/6wLOFo7kN5nurPn86l07G7
         8EWrbAlV/J0xLb8fIhNC1DyC01+1MEQ08VrPmds9hUg2/H0cKCKXihNleOIji0jTPn0n
         yU6kV/Y0msn5d5T/wbhpZcGZP8em/zzXWLbmOswOAW6M7vUoc5mFPfdTEsjBStGavuLG
         wp6Q==
X-Gm-Message-State: AFqh2kr173hBSZYObveLgFE114ccfwRxEi6svSTe1lZ8NGycGF7ebaui
        gV6OpDbGFP06NRP6/IAVaHOgfy8Gkjp3QWff
X-Google-Smtp-Source: AMrXdXtPUW6Tpkax3Pl3MBRzQgK86qKjK/c8IXSjLRucLdvYx7JCaPonWbRFdZsrbBWNFHggfAQ8SQ==
X-Received: by 2002:a6b:c8d2:0:b0:6e5:d1b2:d921 with SMTP id y201-20020a6bc8d2000000b006e5d1b2d921mr1195863iof.18.1671200346177;
        Fri, 16 Dec 2022 06:19:06 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id z8-20020a02cea8000000b0037477c3d04asm728517jaq.130.2022.12.16.06.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 06:19:05 -0800 (PST)
Date:   Fri, 16 Dec 2022 14:19:04 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Document the sc7280 CRD
 Pro boards
Message-ID: <Y5x+WEwTtpoV0gaR@google.com>
References: <20221216112918.1243-1-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221216112918.1243-1-quic_rjendra@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 16, 2022 at 04:59:17PM +0530, Rajendra Nayak wrote:
> Add compatibles for the Pro SKU of the sc7280 CRD boards
> which come with a Pro variant of the qcard.
> The Pro qcard variant has smps9 from pm8350c ganged up with
> smps7 and smps8.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> v4 changes:
> Added the zoglin-sku1536 compatible along with hoglin-sku1536.
> Zoglin is same as the Hoglin variant, with the SPI Flash reduced
> from 64MB to 8MB
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 1b5ac6b02bc5..07771d4c91bd 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -558,6 +558,12 @@ properties:
>            - const: google,hoglin
>            - const: qcom,sc7280
>  
> +      - description: Qualcomm Technologies, Inc. sc7280 CRD Pro platform (newest rev)
> +        items:
> +          - const: google,zoglin-sku1536
> +          - const: google,hoglin-sku1536

Is there actually such a thing as a 'hoglin-sku1536', i.e. the Pro qcard
with 64MB of SPI flash, or do they all have 8MB of flash?
