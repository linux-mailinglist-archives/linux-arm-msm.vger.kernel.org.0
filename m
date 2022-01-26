Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8898D49C28C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 05:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiAZENe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 23:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiAZENa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 23:13:30 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A80C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:13:29 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id m9so20787197oia.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=arlsOb01jlapXGYkUDdz2+HVDdsCdZVHayoQG3dctsA=;
        b=aRw558Bs+cD7R+EE0gKoDAtx5fJCW/0eUBB3Eb9xqOjGKCurtCz8BNg019D4D2LQEE
         64sMWUQoYJ2WxspIU/aTCLPh8JisbrmEtJxVDw5GihQR+VTJBuMrwj1Fa7JH08DPLjyj
         k7RUHgNYf1Uy14xWUQAWAJMbF3TRYtutPsP5L+8vUZBsGp6MRaHckNo7bResbmdUu2ab
         J/PVjvXQIRUxN8qrRrQm3AxcOvrL+lFhhfR3O3RYXJtbdvdrrAGwMNoFl1utu5X2mhxy
         hlIfMkMe2rAuRD2PZYhE4D4GFMmSEjZFOyn5uxe1vMk4ritPS5jLhGp31uowjG/DAem1
         hBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=arlsOb01jlapXGYkUDdz2+HVDdsCdZVHayoQG3dctsA=;
        b=ifCMd1Vhc68BMCkTThikS+7GZFgexGjfJsuYFjMSKeV8raSOMJ3zr1Se0CfSFu5xgR
         Wku9R3exJE6qRcyUoTuwSkhI4DFKDBUoXvlsnoWM9ROhynrF4FSUToNCE69BT36JzKm8
         jR0GugokiT6HyfCBUbOauyPs419B9F97IvRYZKzZXtRO/PwgqRnFmYX7pbrkfK3oa30L
         ysoM425vd82qcPM7hWvdt+73bsk5TnPPf0U77JkviWmnADA0UGKAzZ4HNXafr4n/irLb
         vHF13FfUIyjaOPvz/yqYHR+ROhAiBsXeVAa1al4rqcl7XY1ly3QQY2bnDfxEskBCIq54
         NnVA==
X-Gm-Message-State: AOAM533bwVLPNB6AH6VEN46MxfT7J4KPNzjCFk06X3B/RkTy/qv1oqUR
        79aZIqp+jfsr+dnZu3CLz5FnzjOEnl2HXg==
X-Google-Smtp-Source: ABdhPJwIJPX03WhOM4Ospo3ClShjQf2IYkb6IpRHWm2I1wBOP49Jm24472UAfLlXwku/XJXVauXlrw==
X-Received: by 2002:a05:6808:f11:: with SMTP id m17mr2632520oiw.77.1643170409349;
        Tue, 25 Jan 2022 20:13:29 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id w62sm1254229oie.4.2022.01.25.20.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 20:13:28 -0800 (PST)
Date:   Tue, 25 Jan 2022 22:13:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ben Wolsieffer <benwolsieffer@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: document HP TouchPad
Message-ID: <YfDKZxciezuDXL54@builder.lan>
References: <cover.1643075547.git.benwolsieffer@gmail.com>
 <aa59002aeae45a95097300213fc34490aa8db250.1643075547.git.benwolsieffer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa59002aeae45a95097300213fc34490aa8db250.1643075547.git.benwolsieffer@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 Jan 20:07 CST 2022, Ben Wolsieffer wrote:

> Add binding documentation for the HP TouchPad.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Ben Wolsieffer <benwolsieffer@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 370aab274cd1..f7418a8a49fc 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -119,6 +119,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8060-dragonboard
> +              - qcom,apq8060-tenderloin
>                - qcom,msm8660-surf
>            - const: qcom,msm8660
>  
> -- 
> 2.34.1
> 
