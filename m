Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D684C81C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 04:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiCADsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 22:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbiCADsJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 22:48:09 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D7F21BC
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 19:47:29 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id x6-20020a4a4106000000b003193022319cso21195099ooa.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 19:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h1OElnG4x1T4fzahm9wnw8ojuxCj+kiWdCPzk4ihLng=;
        b=Sr0WtitDvf1kgdrN3J7mYOmYSoRZODO+RwwQlzbpjJG9NTAMcd0z6yB89XhArvDoBm
         JyJ2cg+e8RoM7L2a52Kub3X3Ql0KESEsFq0Iq9N6fM2LNH3mYTPwJS8p7g+y+7hxKWee
         j4wkS/CkaYzYi2gQ0rMIVHhKNz8ePTsXftrwMHSmKFahxngludTQH0EsXLpFHPZRwL5r
         uKA82CddPdgi/xKHv/hLe7DhL1glgQMSWj9Rk2VZYmHGQrOHxFtincEyLntLow29+nBA
         e/ha/hwT9lQxUrK+qG8ZXYgRraBRoAHcIb4VAny5AqTzenjMewFmpJGxjvsf8H9AvLrV
         3eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h1OElnG4x1T4fzahm9wnw8ojuxCj+kiWdCPzk4ihLng=;
        b=rppvZH7k+IVRkSdyYmiQ3f+QTheqld7HwyNUiqbVufl6q9qaTnbF6pKGhylftFEYc+
         yfsh3/7aLX6QJcxBQkgQ/alW7JlYZKHGkJBj2ElEqVvaZ7wf26Y6gWsnal69zFbuH7Jl
         08NqQnk0pd38PSDC1ExII9jCU+4yspEmZm9iqlsLypafIjc5atvckkEAgvjh0g1fT9m0
         Hfrd+mqSm6TVg/R+r/MEOUdyH8y3fDfzAaiHewPW2Z6X+yYCiCDIEBLEkDyX/QKoSwhP
         HAsJQAXjJvJ2j/qdNPuW6LVctB/+8mOfRNDDPWWGyypP3AMICgtjtB/M8yiLNnHE+vz5
         fNAg==
X-Gm-Message-State: AOAM5327mXc8uFofkjjR4xNVGdMNbc3CqW42nFRSnMUXBFYMdssw3ffv
        qj9vb8mXGY6IWiwH1E3p2EabOA==
X-Google-Smtp-Source: ABdhPJx3Ydjw1e6f0f/FFdKlvUURmly7eAqEkjrIIGr3Z7CHOyPLM5ZJHANihQJ8aOtZ6dqbah2OAA==
X-Received: by 2002:a05:6870:b4a7:b0:d7:3513:5e5a with SMTP id y39-20020a056870b4a700b000d735135e5amr3703381oap.38.1646106449102;
        Mon, 28 Feb 2022 19:47:29 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id i47-20020a9d172f000000b005aed7ea7b44sm5722198ota.73.2022.02.28.19.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 19:47:28 -0800 (PST)
Date:   Mon, 28 Feb 2022 21:47:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: phy: qcom,qmp: Mark
 'vdda-pll-supply' & 'vdda-phy-supply' as optional
Message-ID: <Yh2XTjyBICVkn0Jy@yoga>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
 <20220228123019.382037-9-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228123019.382037-9-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Feb 06:30 CST 2022, Bhupesh Sharma wrote:

> Fix the following 'make dtbs_check' warnings, by marking the
> 'vdda-pll-supply' & 'vdda-phy-supply' properties as 'optional' in
> 'qcom,qmp-phy' dt-binding:
> 
> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dt.yaml:
>  phy-wrapper@88e9000: 'vdda-phy-supply' is a required property
> 
> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dt.yaml:
>  phy-wrapper@88e9000: 'vdda-pll-supply' is a required property
> 

These two supplies denotes the power for the bus and the clock of the
UFS PHY. As such I think we can expect that if pdx215 has functional UFS
then it has these supplies, and the "bug" is in the dts.

It's probably safe to assume that the two regulators are the same as on
the MTP. So my suggestion is that you just wire them up in the same way
as the MTP; and please Cc Konrad.


PS. This change is unrelated to the rest of the series, please send such
changes alone, because it could have been merged independently of the
rest of the series...

Regards,
Bjorn

> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index f8a43acd229a..82b102b7d42c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -436,9 +436,6 @@ allOf:
>            items:
>              - const: phy
>              - const: common
> -      required:
> -        - vdda-phy-supply
> -        - vdda-pll-supply
>    - if:
>        properties:
>          compatible:
> -- 
> 2.35.1
> 
