Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1194670A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 04:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238410AbhLCDXN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 22:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbhLCDXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 22:23:12 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA4CC061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 19:19:49 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id r18-20020a4a7252000000b002c5f52d1834so659099ooe.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 19:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HDps2h2SWpU4Y94NDG4hPcR7AZPRkd1wfAyLJyas85E=;
        b=iqgpLT8egn4PIMWsEDOkPYE+RgYdrE6libBZXgFiThm4cinKjw7geQDuINCFfWn09A
         tIGLKTiGej1fB9A9oqta/iqAVKevU4g0Phacs2pjKP+4igkQzqvZAe1VsII8qFiQSR1I
         YXIvlweVfBAbmJS8fDPZhYjhraL/YCEku3vCYPT3eO6rn7k0G8+J2MAFn2i6Hbc3yhbc
         7Oq7ymRfxBprWwo6duLAEB/nO8VYoiL9XbkOhGHL0cvPxa7wfPWAVgFIQPMP8pt6UXY/
         wYQVtlT/9h0Ps0zbDW7WiTswJh4yvhb4GRSYQ6j+EotrsNQNkPEx3M1GSFpludCOrarG
         9BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HDps2h2SWpU4Y94NDG4hPcR7AZPRkd1wfAyLJyas85E=;
        b=a+g/5cpVfLYUV9CG4xNzzInmHk4jHTQ2dKGud+uPFiZ634NOtbIkduvq7FTbMmlpab
         mKIJSgBhPSa60L5mG3HqXPkQt1PH4UdreLEWNssZMBxqqjTZgbLzkp01QlK1qU3wTW29
         r+4ZpfToh5C8Y04O751XMQ6ewSMj9vDgBaFq0MJdraktNDI9pKL4WaGMK+EhzFRlxCaq
         hq7kRCk5unXj+0U47LdIZSUXaz8wYbh3OKbJnlDk/jirY6jLppsJM4ERyFolUBvDDdv4
         4KsVLAiN8T7oI1NVoZRTKM9Or0Pl/n4zASqqVK1kizGfWvIgPvZWlZRpP8CWdGe9DB0Z
         yfUg==
X-Gm-Message-State: AOAM532FeeUiCV3OH/UV2WcZ7gqz5+04upP2528Mtd0xKB92Nv8noLR/
        4RYA9W3FbnpJIGZWxmB5ncLYjw==
X-Google-Smtp-Source: ABdhPJyysufsZZCbU1g7sOlT62sjkNFODXgIPH+tINlFxiO0KOVS5s/AJ0HJthESGvOmoWsrPbnv3g==
X-Received: by 2002:a4a:d486:: with SMTP id o6mr11038405oos.49.1638501588648;
        Thu, 02 Dec 2021 19:19:48 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s9sm440136otg.42.2021.12.02.19.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 19:19:48 -0800 (PST)
Date:   Thu, 2 Dec 2021 21:19:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: phy: qcom,qmp: Add SM8450 UFS phy
 compatible
Message-ID: <YamMz3JYoyDh8O4B@yoga>
References: <20211201074456.3969849-1-vkoul@kernel.org>
 <20211201074456.3969849-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201074456.3969849-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Dec 01:44 CST 2021, Vinod Koul wrote:

> Document the UFS phy compatible for QMP UFS phy found in SM8450 SoC.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 630ceaf915e2..c59bbca9a900 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -50,6 +50,7 @@ properties:
>        - qcom,sm8350-qmp-ufs-phy
>        - qcom,sm8350-qmp-usb3-phy
>        - qcom,sm8350-qmp-usb3-uni-phy
> +      - qcom,sm8450-qmp-ufs-phy
>        - qcom,sdx55-qmp-pcie-phy
>        - qcom,sdx55-qmp-usb3-uni-phy
>  
> -- 
> 2.31.1
> 
