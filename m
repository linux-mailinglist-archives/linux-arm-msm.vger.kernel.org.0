Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C00F72D2E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 23:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239148AbjFLVLQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 17:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239873AbjFLVJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 17:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F0A173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686603998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UVvZ3v/vxKNyCI7w7GwLJIJ0X+T6wDAbj+0uoM6y2a8=;
        b=hevaT2moI9QTk5ON+SkwNEGYqUGrm4A0poCMTULGdCdAgFsXXUgf5tz76ntTmzcYaQiYDf
        Ly0epKZCmNroh3996M4dtlwocX7KkAUng1KlHmIqSWiTs+lqD0ggM0MwEMbmY/3iTqu9vZ
        G3qhecMOCHXZxvNqAbCH4BRA5/6W0dQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-hcUnB2x-M7WHG8GGRrtwkg-1; Mon, 12 Jun 2023 17:06:36 -0400
X-MC-Unique: hcUnB2x-M7WHG8GGRrtwkg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1a316a3929bso3164101fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 14:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603996; x=1689195996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVvZ3v/vxKNyCI7w7GwLJIJ0X+T6wDAbj+0uoM6y2a8=;
        b=abcHYPEH7f6ofUkcS+W3YjXUcprdzdxS/4DySnYTlRFvI+AC81Elfs+l2O3BMcIARo
         jE7/Ljpokf/LWC/AMdg+a5HPiIafsd8Z8cXdvvRTxpcDR2HCL+5MWiZ0pT5fQZdAc7Sh
         90zhHmp0s148Voa8UOYSzijLxs33drE2na+Z9CO052BZz9DboV0+wNq6kd71MRNK7b+x
         Ma3MfqWIoK/T21KI/3jaBSaricOkRBGaTJIZ63iUSdSgsSHMnTOVOCoG27nu+Q6goBrW
         GKtPQnamxUeYmw71j2KRBU8KHxLIGApKsTE2nwHsOu1t+JxHpU36Gw0jKUS7ksgH0Re1
         SDQQ==
X-Gm-Message-State: AC+VfDy9wTE+/odbfCyOxl3y0EU0Mikjgh5m3eVqnQHzIDuH/9n4m1zj
        L7ljnEi08ZDwAZB0VS3nyq9Y3QjOaVecJ2VHjl/qmvT+379RSUMlzwNGp5j8OfMr80p6MSXQFIb
        JTOKebekULnnGD6EobC1846ugWA==
X-Received: by 2002:a05:6870:770d:b0:1a6:7ae5:8e31 with SMTP id dw13-20020a056870770d00b001a67ae58e31mr2707693oab.15.1686603996097;
        Mon, 12 Jun 2023 14:06:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5l8CIOc/fjbn/4dLBsqStqDJVa3ICb/fLC7IjnpwzGvy8FQcOZ753YVKUTI3PaLVSqB/0bAw==
X-Received: by 2002:a05:6870:770d:b0:1a6:7ae5:8e31 with SMTP id dw13-20020a056870770d00b001a67ae58e31mr2707670oab.15.1686603995860;
        Mon, 12 Jun 2023 14:06:35 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id nw27-20020a056870bb1b00b001a6825ed5cfsm2251974oab.4.2023.06.12.14.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:06:35 -0700 (PDT)
Date:   Mon, 12 Jun 2023 16:06:32 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 15/26] net: stmmac: dwmac-qcom-ethqos: add support for
 the optional phy-supply
Message-ID: <20230612210632.agp4ybeseujblao2@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-16-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612092355.87937-16-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:23:44AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p-ride we need to enable the power supply for the external PHY.

Is this for the external phy? It doesn't seem like it from the board
schematic I have... the regulator never makes it out of the black box that
is the SIP/SOM if I'm reading right.

My (poor) understanding was this was for the serdes phy that's doing the
conversion to SGMII before hitting the board... good chance I'm wrong
though.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2f6b9b419601..21f329d2f7eb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -8,6 +8,7 @@
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
>  #include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
> @@ -692,6 +693,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_config_dt;
>  
> +	ret = devm_regulator_get_enable_optional(dev, "phy");
> +	if (ret < 0 && ret != -ENODEV)
> +		goto out_config_dt;
> +
>  	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
>  	if (IS_ERR(ethqos->serdes_phy)) {
>  		ret = PTR_ERR(ethqos->serdes_phy);
> -- 
> 2.39.2
> 

