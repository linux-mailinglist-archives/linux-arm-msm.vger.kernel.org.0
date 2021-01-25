Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D4C3049D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbhAZFXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730028AbhAYRLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 12:11:14 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA247C061793
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:10:31 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id k25so1382107oik.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CiQwU0uQMl0x2LLoEUfiYuSqNBnhBy8hs2yd2mhpH0A=;
        b=cDbyQlsCCe8Cot3vrfN5F/iXSU/8y9dODtuV7WZ2sjlCDEP7cN9foP1BzFPJc6SFlW
         Vdy0MGAths5Uo9w3678VYa+qxbIBd4ZkSsa2iPexeQDp+4AZQjhJVIhsh4/xdQCaTt+6
         u7VN2XBVyIthAijZX2yYZqwQkrvvXs2NcCcU7a6Fcs0+kDIBw5c9QJlVD3OCbNVeUny/
         jenR4l1nMdwRbj2J5Ts38jT2O5iESUd9xyqMUXZOIsjOVmx1wSaH/rrSloptYzGamNTW
         uaoPSPdKqwD3PW3HzZJ2V+5bSksP6P1TwRE1o97fANuVx1pPQET0HopxxUkWcXBqNL25
         09MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CiQwU0uQMl0x2LLoEUfiYuSqNBnhBy8hs2yd2mhpH0A=;
        b=cjo4oUAZQxbfK3o3PvDyKZnVyAXPspUNfrHpiPfjfFsPYFyISmXK+G6l3hZdp+LLbD
         CC1gN5bFsxIcIIFM825U6rMK7oKU31ui3PXp0h2wc7A3Q3Msocj67pPsAbQI1w9YC+pO
         E2AZRq1G8I57YY9BT/LwUdBplHDX6fdNnpY1rXHf8YZrM9WZgnF/+JpKGcB6fzMLfdq+
         fX6u94l30Wg4Idpp9G9c6OQ3rciHZherueJ0AIGETNXEs0j1BtTkOJpJTvYjPcSbI+zf
         MsRT0rjTHsFbW3nZiwmDrLUQinrI4sRx/mzXT9sh0mo/Cqz0JVJOWYUbAb3+sWjUEDow
         joFg==
X-Gm-Message-State: AOAM532s7OvGl6sZEglwzmPFA8j3dvQ7OoEYz2ETCmndwyZzQaScQd3A
        0b5G1MailidxNeyYAlG3pMBi9Q==
X-Google-Smtp-Source: ABdhPJwvzgGBdYbZSP0vhyScwPdNWTzVfw20HDZVrDrLYGkEsg2A9FYv4lzLJATK9Kj9OG46uvpb+A==
X-Received: by 2002:aca:f551:: with SMTP id t78mr721431oih.34.1611594631387;
        Mon, 25 Jan 2021 09:10:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n18sm702450oov.4.2021.01.25.09.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:10:30 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:10:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,qmp: Add SM8350 UFS PHY
 bindings
Message-ID: <YA77hbH6aOW7mzbF@builder.lan>
References: <20210125100906.4004908-1-vkoul@kernel.org>
 <20210125100906.4004908-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125100906.4004908-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 04:09 CST 2021, Vinod Koul wrote:

> Add the compatible strings for the UFS PHY found on SM8350 SoC.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 62c4f2ba5b9f..bf804c12fa5f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -38,6 +38,7 @@ properties:
>        - qcom,sm8250-qmp-modem-pcie-phy
>        - qcom,sm8250-qmp-usb3-phy
>        - qcom,sm8250-qmp-usb3-uni-phy
> +      - qcom,sm8350-qmp-ufs-phy
>        - qcom,sm8350-qmp-usb3-phy
>        - qcom,sm8350-qmp-usb3-uni-phy
>        - qcom,sdx55-qmp-usb3-uni-phy
> -- 
> 2.26.2
> 
