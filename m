Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B1371619F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 15:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjE3NXi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 09:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbjE3NXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 09:23:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F16A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685452964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9h2qv+kuQ8pwupuNrZsU9iPA+8ZB55lYhU0C+yRT42k=;
        b=UoXOips0Cws9N8pA6/ddApUGc9ixspE4TSUbZ1RnxxWyUhUBC4W/cEO+1aD+W9JSpGUFbQ
        MINxdUbEgSZbWbky/1CoFLV6C5peEjpvaylpww0aAzgStoV6so8MnNoPRQf3jyNE9vzvv2
        dvyMw3XjEX501GFztTW7CRtU3GikC6Q=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-W7iOfVspPu2myQGAfO1Wyw-1; Tue, 30 May 2023 09:22:42 -0400
X-MC-Unique: W7iOfVspPu2myQGAfO1Wyw-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3985cabc77eso3511511b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452961; x=1688044961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9h2qv+kuQ8pwupuNrZsU9iPA+8ZB55lYhU0C+yRT42k=;
        b=TqHwzcssn4nZbFbI0SacSvTObOgzXevz8fDuYRAAiYqkQP0MMp4ba3z5vaMkQGMFEC
         rfvlxWFniuCLev5FOfaHZ53zVh3O6raO+9wlZkNI6PH8GcAHPvjRzK4SRqDGgKTrjPjX
         XIkd6D8m/Sc92rCKHp5ZT8pZ7df3yZcv36qreW7/AP38C+d7C5Iq1i7hViQ/uR3cpA73
         sz3stubyvRUo8XznXnbqJ4N66aPxpuwqe15ijiEJFaZAAfTVmxyKyOt+9nTM76nAKIvf
         y5x7g50ylav629JMFo1mJPIyuYNhsii0yEZqKBXsRLmWd3mo+rZyD1mAUUmuww0tDXoY
         B9SQ==
X-Gm-Message-State: AC+VfDyMH6kweMWXok/Pc/0Il/cUDA7zbVUQDpuTRUKnazbVpX7rK5dm
        pRzTK9j99QzyzgZX3QwkpXg2DWOnxxyN56TKe+ChgQnt/omqG2YYYj0Q+Mc0PXgNpGhD4PYDFWA
        cAoel0i/388qZcfhs0JM67JF4/g==
X-Received: by 2002:aca:bf86:0:b0:39a:4170:6840 with SMTP id p128-20020acabf86000000b0039a41706840mr423824oif.21.1685452961711;
        Tue, 30 May 2023 06:22:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hvJly164alHc4qnzJk9MLJR7zrivpgNQbh/WGkmSgj9lPucLLDbx/4axIxdcaCBEb1Ukjfg==
X-Received: by 2002:aca:bf86:0:b0:39a:4170:6840 with SMTP id p128-20020acabf86000000b0039a41706840mr423814oif.21.1685452961485;
        Tue, 30 May 2023 06:22:41 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::12])
        by smtp.gmail.com with ESMTPSA id m18-20020a056808025200b0039a03e7b65esm3099937oie.53.2023.05.30.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:22:41 -0700 (PDT)
Date:   Tue, 30 May 2023 08:22:38 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] phy: qcom-snps-femto-v2: properly enable ref
 clock
Message-ID: <20230530132238.7xl2efx4of5u6vzz@halaney-x13s>
References: <20230529185638.32376-1-athierry@redhat.com>
 <20230529185638.32376-2-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529185638.32376-2-athierry@redhat.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 29, 2023 at 02:56:36PM -0400, Adrien Thierry wrote:
> The driver is not enabling the ref clock, which thus gets disabled by
> the clk_disable_unused initcall. This leads to the dwc3 controller
> failing to initialize if probed after clk_disable_unused is called, for
> instance when the driver is built as a module.
> 
> To fix this, add calls to clk_prepare_enable/clk_disable_unprepare at
> the proper places.
> 

I'm a sucker for a good paper trail, maybe add:
Link: https://lore.kernel.org/linux-arm-msm/ZEqvy+khHeTkC2hf@fedora/
Fixes: 51e8114f80d0 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")

good work!

> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 6c237f3cc66d..8abf482e81a8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -166,6 +166,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  	}
>  
>  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	clk_disable_unprepare(hsphy->ref_clk);
>  	return 0;
>  }
>  
> @@ -181,6 +182,12 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  		return ret;
>  	}
>  
> +	ret = clk_prepare_enable(hsphy->ref_clk);
> +	if (ret) {
> +		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -380,10 +387,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  		goto poweroff_phy;
>  	}
>  
> +	ret = clk_prepare_enable(hsphy->ref_clk);
> +	if (ret) {
> +		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
> +		goto disable_ahb_clk;
> +	}
> +
>  	ret = reset_control_assert(hsphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto disable_ref_clk;
>  	}
>  
>  	usleep_range(100, 150);
> @@ -391,7 +404,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  	ret = reset_control_deassert(hsphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto disable_ref_clk;
>  	}
>  
>  	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> @@ -448,6 +461,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  
>  	return 0;
>  
> +disable_ref_clk:
> +	clk_disable_unprepare(hsphy->ref_clk);
>  disable_ahb_clk:
>  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>  poweroff_phy:
> @@ -462,6 +477,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>  
>  	reset_control_assert(hsphy->phy_reset);
>  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	clk_disable_unprepare(hsphy->ref_clk);
>  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>  	hsphy->phy_initialized = false;
>  
> -- 
> 2.40.1
> 

