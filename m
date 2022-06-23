Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACC1557EA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 17:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbiFWPce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 11:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiFWPcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 11:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76D0941989
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655998351;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b2n5xLD7AQDK+GpcG4O4X1piM0yxBHUCyVpdCvBcmLA=;
        b=jLsuyRQ0L4+mpIGD3ZTFv6MBqlConFdYHax7tTtXC/GhXy3gKWmxKoJBR2do0ELW7Ks45P
        y4A0heWJQj7sN+Cl9G94Zud2iIKGD9iDsq3el4Xq69Xz2BbwpYk32TduA7g9hUuQt20vPo
        jYNh6knHlQxatb6QRYwt7y24EnPE1ok=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-eARE9DbbP_mWRwuf7U4McA-1; Thu, 23 Jun 2022 11:32:30 -0400
X-MC-Unique: eARE9DbbP_mWRwuf7U4McA-1
Received: by mail-qk1-f198.google.com with SMTP id ay8-20020a05620a178800b006a76e584761so23818071qkb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 08:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b2n5xLD7AQDK+GpcG4O4X1piM0yxBHUCyVpdCvBcmLA=;
        b=LxpJ5BlY7DrxKfHCkagJdnU4pimBs7MRaaXDdQWNGsr+Dh1JT0zTWPdtM9tD3tJt+R
         E87psnSTWCwSNsLzM/s0f3CRBR/3Bc/T4VDqofYBonyG6y7+PLc6274C5D/i3g4T6FVH
         u3JR8dxl6SHzQZr7jXL53JlJhEsdX2+JF+Tvnuft/ZgHGcffVJmvWmuFE3G3yJ3JnX6f
         3EVIj7/I6kh9yNUt4yG4t3djMyp40Hd+dwuGwGc4mFGOH467tUHXLq6y1ReAz2gP0xq4
         URzl0C6jJf9lLa8O7FbceGl32KSlvsqxXF3KDk4DifBAx8O34RxazG8SgZ60+AUZEaC9
         Pslg==
X-Gm-Message-State: AJIora87MsUwErp6CNqJu2kSFSS2RyrUIExZ7V/GOIzH/HectwtyQ+PD
        zxo2L9W3/KXuvuneSPecWO6nOCTVEZX9/13cSpOYJyuLxjfpUwzhmH5kUfkYS9Eh3GVtB3lc4wV
        GehBUufMBPqAASeFAyNtAGK0FLQ==
X-Received: by 2002:a05:6214:29ca:b0:46b:92c5:9f3b with SMTP id gh10-20020a05621429ca00b0046b92c59f3bmr32129039qvb.20.1655998349428;
        Thu, 23 Jun 2022 08:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3ddAmHP4GNMm6NGiuKRAyJLCHiaGoJECW7QzVyWqpeYX0hMGqRDuYk0d3CinVTSkb2kBBeA==
X-Received: by 2002:a05:6214:29ca:b0:46b:92c5:9f3b with SMTP id gh10-20020a05621429ca00b0046b92c59f3bmr32129018qvb.20.1655998349055;
        Thu, 23 Jun 2022 08:32:29 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::46])
        by smtp.gmail.com with ESMTPSA id y29-20020a37f61d000000b006a3325fd985sm18291762qkj.13.2022.06.23.08.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 08:32:28 -0700 (PDT)
Date:   Thu, 23 Jun 2022 10:32:26 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Brian Masney <bmasney@redhat.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <20220623153226.drrbx2jolrxxe7as@halaneylaptop>
References: <20220623142837.3140680-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623142837.3140680-1-bmasney@redhat.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 23, 2022 at 10:28:37AM -0400, Brian Masney wrote:
> The sa8540p automotive board has the same SOC as the sc8280xp. In order
> to get the first UFS controller working on the sa8540p,
> GCC_UFS_REF_CLKREF_CLK needs to be setup as a parent to
> GCC_UFS_PHY_AXI_CLK.
> 
> This clock name came from the DTS for the downstream MSM 5.4 kernel
> sources for the sa8540p. It also references GCC_UFS_CARD_CLKREF_CLK,
> however that wasn't needed to get the first UFS controller working.
> 

I'm not knowledgable enough on the clock subsystem or have access to
documentation to comment on correctness outside of the 5.4 MSM kernel
you mentioned, but I think this probably deserves a Fixes: tag?

I can at least also comment that without this change the sa8540p doesn't
boot on the QDrive3 boards we have.

Thanks,
Andrew

> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> I originally added this under GCC_UFS_PHY_PHY_AUX_CLK since that's
> what's in the downstream DTS. I was getting errors about
> GCC_UFS_PHY_AXI_CLK being stuck at off so I moved it there.
> 
> Also I don't have access to any documentation for this board so I'm
> hoping that someone with docs access can verify that this is the
> appropriate place to put this.
> 
>  drivers/clk/qcom/gcc-sc8280xp.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index 4b894442fdf5..4639b50da418 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -5685,6 +5685,19 @@ static struct clk_branch gcc_ufs_phy_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_ufs_ref_clkref_clk = {
> +	.halt_reg = 0x8c058,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8c058,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_ufs_ref_clkref_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_ufs_phy_axi_clk = {
>  	.halt_reg = 0x77010,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -5696,6 +5709,7 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "gcc_ufs_phy_axi_clk",
>  			.parent_hws = (const struct clk_hw*[]){
> +				&gcc_ufs_ref_clkref_clk.clkr.hw,
>  				&gcc_ufs_phy_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
> @@ -5899,19 +5913,6 @@ static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_ufs_ref_clkref_clk = {
> -	.halt_reg = 0x8c058,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x8c058,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_ufs_ref_clkref_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch gcc_usb2_hs0_clkref_clk = {
>  	.halt_reg = 0x8c044,
>  	.halt_check = BRANCH_HALT,
> -- 
> 2.36.1
> 

