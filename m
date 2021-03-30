Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6685C34DF49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhC3D2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhC3D17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:27:59 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16D6C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:27:57 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so14284145oty.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8DbFJ3M1KptfbL7xxLrTG18whdlv0dnlNnoRLxaa9Tg=;
        b=G6bCnZEXEeDMrcEirVNwI79rVnOvK5cnEBznAA6jt7cWSs8Ywg/5KusLilOi8zv/tm
         yFeAuIlS4+JKUjKURUdTohpFARW+q5WVTCmwa2Z5FU7AIWSbmnZXgcDQf4OavpeYfOjh
         mytTXHHObIprDm+hNjuq79cNTcv45PKsIp6m7PlUtOg0YFJB5plkUplw4M9bzz6zmVmk
         yATQhT6QVqDI2KsaRUK9qdbUM2VFvJ2GKpQD/ew3PkDOb7MgfrnVRcybGOCAkWjFAQG6
         vLLdoHCSa0r2J0AWbHdheUtV5tSJmbogmBA0te2G0IvNuriakwvd8AqenxeL93NwAMOI
         ZuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8DbFJ3M1KptfbL7xxLrTG18whdlv0dnlNnoRLxaa9Tg=;
        b=RojaDxTZ5kNQaAqhU2H0KnhUIaJtb255Y9vW1Y2jG3r4mK8RTTEldZZz28Qc3uVmng
         6EhuDLyb8pU2oN7QdsLbeqThrooD8mKUKuJzqUfLDe2v3kXj3xMKusLqaRZuHmNhiK6T
         LPaLz3jyeiBpLUG7qTjYTL3iaqbvNfg1BFC3bZSBK3jb+hGl6O0pSdY3vPcioibD69Y1
         Vg9jAgKKliQSHO1jNtUKbnelT9AkrGqFbLKsakNh6GgaoQ1NL9nxBAQTnJL1aDU/6A8I
         SL6I5hKz6z1eCKeCzA+/9G2R1I9XOiWhe2f2/2VzPDNHCu/d1DLLrx5C24dtsyFk9w5l
         z9ww==
X-Gm-Message-State: AOAM531BW7KSQAP6j/RbfvlLjVbQ8O07CzTiQT4Q1SBH5X/PjMQkQDj9
        nf609OSylVeuZa1WChDy9WzX1w==
X-Google-Smtp-Source: ABdhPJzkO+2sPQfxp3IkoZFiefo3ExhfKmCm6Rdil8CIyeiMiC/iYxryzL7zecU76P2w2kIdfV2xTA==
X-Received: by 2002:a9d:1c7:: with SMTP id e65mr25209471ote.259.1617074877280;
        Mon, 29 Mar 2021 20:27:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g13sm4820693otq.3.2021.03.29.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:27:56 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:27:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: phy: qcom,qmp-usb3-dp-phy: move usb3
 compatibles back to qcom,qmp-phy.yaml
Message-ID: <YGKaumYvK4EI8haV@builder.lan>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
 <20210328205257.3348866-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328205257.3348866-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 28 Mar 15:52 CDT 2021, Dmitry Baryshkov wrote:

> The commit 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy
> information") has support for DP part of USB3+DP combo PHYs. However
> this change is not backwards compatible, placing additional requirements
> onto qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy device nodes
> (to include separate DP part, etc). However the aforementioned nodes do
> not inclue DP part, they strictly follow the schema defined in the
> qcom,qmp-phy.yaml file. Move those compatibles, leaving
> qcom,qmp-usb3-dp-phy.yaml to describe only real "combo" USB3+DP device nodes.
> 
> Fixes: 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information")
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 2 ++
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 626447fee092..7808ec8bc712 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -25,11 +25,13 @@ properties:
>        - qcom,msm8998-qmp-pcie-phy
>        - qcom,msm8998-qmp-ufs-phy
>        - qcom,msm8998-qmp-usb3-phy
> +      - qcom,sc7180-qmp-usb3-phy
>        - qcom,sc8180x-qmp-ufs-phy
>        - qcom,sc8180x-qmp-usb3-phy
>        - qcom,sdm845-qhp-pcie-phy
>        - qcom,sdm845-qmp-pcie-phy
>        - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sdm845-qmp-usb3-phy
>        - qcom,sdm845-qmp-usb3-uni-phy
>        - qcom,sm8150-qmp-ufs-phy
>        - qcom,sm8150-qmp-usb3-phy
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> index 33974ad10afe..62c0179d1765 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> @@ -14,9 +14,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-qmp-usb3-dp-phy
> -      - qcom,sc7180-qmp-usb3-phy
>        - qcom,sdm845-qmp-usb3-dp-phy
> -      - qcom,sdm845-qmp-usb3-phy
>    reg:
>      items:
>        - description: Address and length of PHY's USB serdes block.
> -- 
> 2.30.2
> 
