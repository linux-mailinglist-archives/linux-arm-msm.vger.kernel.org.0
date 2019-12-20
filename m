Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EF7127355
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 03:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfLTCIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 21:08:39 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55698 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfLTCIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 21:08:39 -0500
Received: by mail-pj1-f65.google.com with SMTP id d5so3393314pjz.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 18:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YgvV3JiKfTlI0AC6OxzkH9DBISf/5R3CxM7BpAzpYkU=;
        b=nTFMDuI5r0hPonHwCOmY38ZRalajQ7FNgMs8hvXzjY+eN6YLoLpM/VHZU+GfKHoMl2
         tBbpXoXqhQEMwl36O6OXNJg5BuTZ/tCorNbprd+Iot/cvhVHT6qVtrAuMeecMR9eNlX3
         Yum6w4BZBzSnQmH1MeSVyy+gyRZjyTMyANYGwOm+jmf6+4hWSaLcUQ0FxXd09ZFmZYzu
         G33aOhxz4VQpI85aGAl53GyJMIzI+waf52lKU8rKPt+t8JJDcr0bOruM+NnF2/rsEx6p
         PawStYSSJ9bhY7L91n4IryV6R7xiG5lpyxV4GVvWnNn7jFD1LoxfcyfRfLS1/NU86jF5
         SDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YgvV3JiKfTlI0AC6OxzkH9DBISf/5R3CxM7BpAzpYkU=;
        b=Mow2h2sK9vNHegKTVlsnETnbnhlHKiM8fTdy7wrrBOslidRm8tn9rKpWmNODQlh6Mg
         SjN1Xk4VsdeAI6xCqcoTv4TBemqg6bANHInJC26ytD2WRiJ6TTX9eFZTIvVb5AdVdXm7
         j280E/ha/o6xafGhpz0gd+Nd1xDg4PD7VfMzerMUQlqI5b2eSK+dv0+BGdgeIzc1p47a
         q4kxfAZblEgQlucdwoQYGTyr9Uvs/L5nFYpVQFATqZgN1b/xnZttf/L2Fa4Po0xSuDPL
         E2rwmfkZnOoOFcOhbrXaq+7HAm4RhPNN/RGNDeZmLfpizT2QkL8NLpm4pTSuzsRjCl6p
         Y5lw==
X-Gm-Message-State: APjAAAWbF4FUs+2y/v6vcUjgauxD13JRE1BB9LpZmxGIVXdhYtCEZbtw
        pxaDtM0PjgeakzuLsQfObp6/Xg==
X-Google-Smtp-Source: APXvYqwQ14+aR8caqAjIWLVwonbpH1I+WYABcpfUV25nRJAyDe7M4sZ8y+X77Ngtju5gOW7X9Dx5HQ==
X-Received: by 2002:a17:902:9043:: with SMTP id w3mr12454955plz.8.1576807718574;
        Thu, 19 Dec 2019 18:08:38 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 11sm10238716pfz.25.2019.12.19.18.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 18:08:37 -0800 (PST)
Date:   Thu, 19 Dec 2019 18:08:35 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Increase the phy init timeout
Message-ID: <20191220020835.GK448416@yoga>
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219150433.2785427-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Dec 07:04 PST 2019, Vinod Koul wrote:

> If we do full reset of the phy, it seems to take a couple of ms to come
> up on my system so increase the timeout to 10ms.
> 
> This was found by full reset addition by commit 870b1279c7a0
> ("scsi: ufs-qcom: Add reset control support for host controller") and
> fixes the regression to platforms by this commit.
> 
> Suggested-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

This does look familiar...

https://lore.kernel.org/linux-arm-msm/20191107000917.1092409-3-bjorn.andersson@linaro.org/

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 091e20303a14..c2e800a3825a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -66,7 +66,7 @@
>  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
>  #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
>  
> -#define PHY_INIT_COMPLETE_TIMEOUT		1000
> +#define PHY_INIT_COMPLETE_TIMEOUT		100000

100ms seems a little bit excessive, and we do end up waiting this long
when we have PCIe links without an attached device...

Do you need >10ms or could we just have my patch merged?

Regards,
Bjorn

>  #define POWER_DOWN_DELAY_US_MIN			10
>  #define POWER_DOWN_DELAY_US_MAX			11
>  
> -- 
> 2.23.0
> 
