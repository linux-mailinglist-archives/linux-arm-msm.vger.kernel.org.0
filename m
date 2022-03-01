Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095E04C81E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiCAEH5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiCAEH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:07:56 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBFF4F9EC
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:07:16 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id p3-20020a17090a680300b001bbfb9d760eso1015368pjj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DaUtZIJE57Vq9SZxZBhHAxebl5xJ9yYYEaN9hQal+Yc=;
        b=zkOAS1NuNVVA37+a+9a5ZOpokz2S8PWO35PvVGMMThDauaYUOPsvyVjtc8Zr41iFQi
         evBontnp0ibEks/7mYoY/YuqsCVhfpUaez7NR3mQ0Sa4AfaUz3NIZ7rvzqT9zXMSljSt
         jicjvB603m34d1Vm7FPVEsF93+5HqkdpbTJlR8aaCL3RSFn22ck2ctV0flqmUD8K22aX
         rBn1xW1ZmBx4pBckCgQoMMVFxwuuIu4PoBfFW1nuuS6InmoX/5JQDMz3HQ8pbqIOzO/o
         WBivj9pQFfdMjgHIT5CIYTmXNNtOvZ+OWI1ZbDsQbvnZOWTjZM6+zR9aSqlKeFTtKg89
         hDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DaUtZIJE57Vq9SZxZBhHAxebl5xJ9yYYEaN9hQal+Yc=;
        b=zGstt+VksOiA51omVh68dG0eV7Lri0M9tjH7Vsgjp0s1pMdpclehxAAxNzxlFqgSQj
         XIbD1CIi0G8LGnpNuevMGkxsOOm0O0Wamgr6H1guT4Hg8YVcS5tbVzRIZNubwXC6tQkB
         c6cw+EuVNAc91cZgqy+Zj0Sh2DzaVFWJC1mIqIGFi/onrelZsSTNA9SzLuKorF339ujO
         qBJiAVXfeepsqFuTtbRTK/F/KWTBlGj5rb5sy0DYJWDxr4XaNxOOejekqQacKiXkMFLH
         7gDLC041rv7uBHzg2kSRAMi1V14ALz+JkTGFwRw5ttDxd39CPCJZjD3X2C2MKtAypfXa
         Udag==
X-Gm-Message-State: AOAM533gK3ngR5sJKRNp8jjlYL3rQaf1JjzkgkRKUVnQqPW4yK2GiYRB
        zpKzOUrfF7+F7Ck3CFjBgrvnFA==
X-Google-Smtp-Source: ABdhPJzWqb7Tsc9wjdCtlNdc3HRUiLy0CedyQh9cebhriMji18nhdC0SewddXyCwWxQiEaQ3kO+ocg==
X-Received: by 2002:a17:903:2448:b0:151:8173:abf5 with SMTP id l8-20020a170903244800b001518173abf5mr1730249pls.55.1646107636043;
        Mon, 28 Feb 2022 20:07:16 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id a32-20020a631a20000000b003756899829csm11509153pga.58.2022.02.28.20.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:07:15 -0800 (PST)
Date:   Tue, 1 Mar 2022 12:07:09 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: phy: qcom,qmp: Describe phy@ subnode
 properly
Message-ID: <20220301040709.GF269879@dragon>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
 <20220228123019.382037-8-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228123019.382037-8-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 06:00:18PM +0530, Bhupesh Sharma wrote:
> Currently the qcom,qmp-phy dt-binding doesn't describe
> the 'reg' and '#phy-cells' properties for the phy@ subnode.
> 
> Fix the same.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 70e7cd75e173..f8a43acd229a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -115,6 +115,13 @@ patternProperties:
>        Each device node of QMP phy is required to have as many child nodes as
>        the number of lanes the PHY has.
>      properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 6
> +
> +      "#phy-cells":
> +        const: 0
> +
>        "#clock-cells":
>          enum: [ 0, 1, 2 ]

While you are at it, what about these properties?

	clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
	clock-names = "pipe0";
	clock-output-names = "usb3_phy_pipe_clk_src";

Shawn
