Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A57455198
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 01:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhKRAVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 19:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbhKRAVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 19:21:17 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7990C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:18:17 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so7745621otk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LL5DubqQCg6kyrjHofbR7ktAH9QXKAwsUlnh6eFxqLs=;
        b=tSptpTtxWS5DDHnjcndc2UmZr2MqGJnCLlzU/lKAu9zZEOqhKfqvS4p3iH7xPo5Q1L
         swxo+RtjrqATnlBng3/usZvoyl6MuiQK31gX/uRYyLJsetuPgvwzpebmLmlIrN4+1Q2c
         BFfR/sgSWZC3MmEGBD4D6AiMrmS3qCM81ac38ei7ylQP70C4h580B/GKiqehJzkuYu+Q
         c+pvo9PTluJYxsdYCERTiNPhT/aDtOSRAGM4yYeZ3/mbB+iUDgs6lfdeeboSgcynbLK2
         4TZKKMN2YNKCUmCQO9ziDV9kUMMVhpXByH+WteD5B5Teq74OiUZngfWRFOerMIq4+XKH
         FvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LL5DubqQCg6kyrjHofbR7ktAH9QXKAwsUlnh6eFxqLs=;
        b=WecxsFpDodW7lSFX11yuCXARX4qPCkidU7WU0I5aepLOofBUl4ZcXeJ57xyQaCfnJf
         z6v9ziGZBz2iAzMORyLop68yTrCDhvBu46VreDe4fyMiEcKxSCf31RUJIFVZxqmMObEJ
         ojLPKhakfVPJu1uzyIEgySwhted0WeBIcb4Kll3bl7DBcEUjS1Kvw61UyyXulLz9iACz
         /FvAcRyIP/1GsE247xu+nwC5jsQLWbyzsCbOUT+MbnZOa+FEfCFOV9yYkJp9AODuxxs0
         IiZWzhj5bIeX3qQLKN5rcNUnnyFYhBBVKGY72W0Kq6hoK4QEebQfmp2PmPzVUGkLIFoO
         uddA==
X-Gm-Message-State: AOAM5338KeQThpAcLMvOpTHSnu1W+w8I/rzya+F5Bn3bMEFH7VLcV4jY
        xCL2HlmziAfVPPPmjvKhhRzkdQ==
X-Google-Smtp-Source: ABdhPJyy41hemM9tjAl5AU+OoMFMVSQH3VD+GSG/X51UXF0JFbJWOzE/XyQmsF6xEE5SDYtjjnLqlg==
X-Received: by 2002:a9d:5d0f:: with SMTP id b15mr16866484oti.172.1637194697044;
        Wed, 17 Nov 2021 16:18:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g26sm298945ots.25.2021.11.17.16.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 16:18:16 -0800 (PST)
Date:   Wed, 17 Nov 2021 18:18:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] phy: qualcomm: ipq806x-usb: Fix kernel-doc style
Message-ID: <YZWbxdnfHKdCI/hz@builder.lan>
References: <20211116103951.34482-1-vkoul@kernel.org>
 <20211116103951.34482-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116103951.34482-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Nov 04:39 CST 2021, Vinod Koul wrote:

> The functions are documented but there were style issues, so fix
> the style and add missing description for phy_dwc3
> 
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:130:
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:174:
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:212: warning:
> This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 26 +++++++++++----------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> index bfff0c8c9130..e1b8fa911416 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -127,12 +127,13 @@ struct phy_drvdata {
>  };
>  
>  /**
> - * Write register and read back masked value to confirm it is written
> + * usb_phy_write_readback - Write register and read back masked value to

"Writing kernel-doc" indicates that you should have some parenthesis
after that function.

> + * confirm it is written
>   *
> - * @base - QCOM DWC3 PHY base virtual address.
> - * @offset - register offset.
> - * @mask - register bitmask specifying what should be updated
> - * @val - value to write.
> + * @phy_dwc3: QCOM DWC3 PHY base virtual address.

I guess this was "base" at some point? As you're fixing up the
kerneldoc, it would be nice to correct this to say something like
"usb_phy context".

Regards,
Bjorn

> + * @offset: register offset.
> + * @mask: register bitmask specifying what should be updated
> + * @val: value to write.
>   */
>  static inline void usb_phy_write_readback(struct usb_phy *phy_dwc3,
>  					  u32 offset,
> @@ -171,11 +172,11 @@ static int wait_for_latch(void __iomem *addr)
>  }
>  
>  /**
> - * Write SSPHY register
> + * usb_ss_write_phycreg - Write SSPHY register
>   *
> - * @base - QCOM DWC3 PHY base virtual address.
> - * @addr - SSPHY address to write.
> - * @val - value to write.
> + * @phy_dwc3: QCOM DWC3 PHY base virtual address.
> + * @addr: SSPHY address to write.
> + * @val: value to write.
>   */
>  static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
>  				u32 addr, u32 val)
> @@ -209,10 +210,11 @@ static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
>  }
>  
>  /**
> - * Read SSPHY register.
> + * usb_ss_read_phycreg - Read SSPHY register.
>   *
> - * @base - QCOM DWC3 PHY base virtual address.
> - * @addr - SSPHY address to read.
> + * @phy_dwc3: QCOM DWC3 PHY base virtual address.
> + * @addr: SSPHY address to read.
> + * @val: pointer in which read is store.
>   */
>  static int usb_ss_read_phycreg(struct usb_phy *phy_dwc3,
>  			       u32 addr, u32 *val)
> -- 
> 2.31.1
> 
