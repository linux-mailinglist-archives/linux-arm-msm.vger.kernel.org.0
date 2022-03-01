Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79E04C9974
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 00:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbiCAXmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 18:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiCAXmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 18:42:35 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D03B140CC
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 15:41:53 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so50914ooa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 15:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FB5c7fGmjY2vzPSIYKpRpN7o3fvL6nPabR7+/6/jJm4=;
        b=Uolg8BYJVwfuHgOiNxsceDGgDSsKATbYPtepoOM7JTnDPCxPMI5RGAAnretva9wYIC
         0TOSjs8/RItMx2J051qhbIGE4dWLJieNORbNWDKdVLpZjidfBdnkNAG1PyENMwAbCtiS
         hQjDqZlJaDqlnplT1nbn+R2rBNE9Uxpiroy1EMiGvvMraag+LsSaTE9kuuRH2vPmESy7
         g9RkleevVgwvpP1b0zFrW7hd78zr4REht5fmRhJQz7CDQE/i6oXvR+kRC898Bosp5ZSs
         t8DUW/ppfEjRhqJRSY7wJ49hRPDacbeu8kAyoqzutoDrAGfuhf6EKRcigmNBttLgK6Fr
         bPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FB5c7fGmjY2vzPSIYKpRpN7o3fvL6nPabR7+/6/jJm4=;
        b=NHutFrnFySp48Y3B5gI+nC5JWv4qoPVbigtvyzezXkEKml/tpcsBfk77unILIMPkdt
         hOlAFP2zgB8YhgGotX+88b7nqE4r6QmtI8SDU2Nycm9hBNeXRlvSsJGvelSpzhtODlhI
         2ew3BtW4WJl5Wbfrvo2s0JqTsf996QMOtSXWYas448A8jN7qOKd24Qe11eZqGmlP7Ltm
         f1lGr90+bSN7VZQgTo68zgmrVGcyRPwImMy4WPAJ21DJr/T+hfx8keLdOPcqu/VDydgF
         GIAAdC0Zli7m+vddF7dDPo20BDqeu5iHpFThtRVE3Cd5NFpHEI6Kg3jN1U7aVs4Q7G3+
         FyfQ==
X-Gm-Message-State: AOAM533z34yXXLDIYuuoqqsVg6dZzUW0JBQp+CFjI97i2DDirZNEV+v2
        EkA5cd5d0MssyuL8/PVD1DXFvA==
X-Google-Smtp-Source: ABdhPJwOLx+LHzza/QTY1wZDAJCLy+G1/aPn3XmGmMMH67gZxp+p2fLhfQdVgQ39wLKg4GR4MjZY7w==
X-Received: by 2002:a05:6870:702b:b0:d7:433a:dd9 with SMTP id u43-20020a056870702b00b000d7433a0dd9mr5663415oae.97.1646178112947;
        Tue, 01 Mar 2022 15:41:52 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k22-20020a056870959600b000d277c48d18sm7016330oao.3.2022.03.01.15.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 15:41:52 -0800 (PST)
Date:   Tue, 1 Mar 2022 15:43:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: add missing brace in
 dpu-qcm2290.yaml
Message-ID: <Yh6vsN6WspOR3Cdv@ripper>
References: <20220301233037.2257996-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301233037.2257996-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Mar 15:30 PST 2022, Dmitry Baryshkov wrote:

> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index 8766b13f0c46..b1b4652077db 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -209,6 +209,7 @@ examples:
>                                          remote-endpoint = <&dsi0_in>;
>                                  };
>                          };
> -                 };
> +                };
>           };
> +    };
>  ...
> -- 
> 2.34.1
> 
