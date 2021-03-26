Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFF3349E94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 02:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhCZBUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 21:20:50 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:42806 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhCZBU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 21:20:27 -0400
Received: by mail-io1-f47.google.com with SMTP id r193so3823419ior.9;
        Thu, 25 Mar 2021 18:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g1oETLj9wrtiRU5jJdQngaNgqEMC1XIzi2QLypitg8M=;
        b=f8IT7DmZXaLyDnisWOHCjo5x8L9z6YmOUDAvREHyIIbdRuRAbNvHxjMBZQn67XcG3u
         g7olOlLrWGKdIY0AeNc8zjbGVRPOysoYZl48ez5LxUu+cXzfY7+wWm3HslfLdxvR/wuV
         GbuHRi7OE6f5ceofHZ2btn6aef2ENA7L8/q7xAmeQbw+shUWz9TcBA4B+0N6ZSl+jA+7
         8v2A6Cabn64Gkph5FOGdpnhAiAnmqGSSxExvj1gwOkIPnn4uYgS2PvqXyfIjfb3s8/ww
         ImGtMj1+AYhqHFteRdkw02qEbnpMofISnkGml7zm0VoPpk3jQZlKePLVOOZJMn8LJPhJ
         a1Pw==
X-Gm-Message-State: AOAM533FWOEQtTNJtM8Wb9/TgMLYx5CWQ1gHykRdlydwzIhrU9kfI0Cj
        Hn1VVt6y7gBZWfgd/11W3A==
X-Google-Smtp-Source: ABdhPJxYmVVGBFzXcMDsujbo5nPWB+1tT0lwupMFLXYKKgZAlEzQvcn99uSGJxAzmIAXSUL6k6pbCA==
X-Received: by 2002:a02:6654:: with SMTP id l20mr9845749jaf.55.1616721626359;
        Thu, 25 Mar 2021 18:20:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y18sm3607719ili.16.2021.03.25.18.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:20:25 -0700 (PDT)
Received: (nullmailer pid 2113392 invoked by uid 1000);
        Fri, 26 Mar 2021 01:20:17 -0000
Date:   Thu, 25 Mar 2021 19:20:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: qcom,qmp-usb3-dp: Add support
 for SM8250
Message-ID: <20210326012017.GA2110606@robh.at.kernel.org>
References: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
 <20210318195930.2229546-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318195930.2229546-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 18, 2021 at 10:59:25PM +0300, Dmitry Baryshkov wrote:
> Add compatible for SM8250 in QMP USB3 DP PHY bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 1 -
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 626447fee092..c558aa605b9d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -38,7 +38,6 @@ properties:
>        - qcom,sm8250-qmp-gen3x1-pcie-phy
>        - qcom,sm8250-qmp-gen3x2-pcie-phy
>        - qcom,sm8250-qmp-modem-pcie-phy
> -      - qcom,sm8250-qmp-usb3-phy

Why is this being moved? Not sure what the differences between the 2 
bindings, but doesn't seem like a backwards compatible change.

>        - qcom,sm8250-qmp-usb3-uni-phy
>        - qcom,sm8350-qmp-ufs-phy
>        - qcom,sm8350-qmp-usb3-phy
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> index 33974ad10afe..9792cc567cb5 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> @@ -17,6 +17,8 @@ properties:
>        - qcom,sc7180-qmp-usb3-phy
>        - qcom,sdm845-qmp-usb3-dp-phy
>        - qcom,sdm845-qmp-usb3-phy
> +      - qcom,sm8250-qmp-usb3-dp-phy
> +      - qcom,sm8250-qmp-usb3-phy
>    reg:
>      items:
>        - description: Address and length of PHY's USB serdes block.
> -- 
> 2.30.2
> 
