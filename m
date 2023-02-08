Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73AD468FB6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 00:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjBHXp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 18:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjBHXpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 18:45:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD511D90D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 15:45:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E771A61808
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 23:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA0FC433EF;
        Wed,  8 Feb 2023 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675899905;
        bh=vNz/rBmDSOd5HZY2YcM1OBkPkEVBGy+glezFDkjkl74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aeF/nZ7wVUMtrpadLoPLzBLdVy3X8OGealBrBMudPWeDvw/aDHjMRU4iVbcpqfKSP
         uhE4Ik6/PWX7k3Eit8IruVsVXYlHFKbEUAHdOrab/iMfqWsNXqVUTZCOrGoZJu6Flu
         wW9LGk8p6LmNF7W8lFcdggNJCrFnxhfICYfiDcj8o0F2mLa0QcNBgJ8osWEPWMmZMP
         qRFAC3/lBJgbfyqIDNqenYP384x3EV9Nt+fLIpsUhRyv7V03n/7KAAhyzPsKLngwa2
         EtrfURmWNk+TTSomI88I26LulVEk4f7JzEZox33/EaDfNLv6Ng71AJQ1iHTgJ1fzVZ
         jpomL+62m5uIg==
Date:   Wed, 8 Feb 2023 15:47:17 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: msm8994-angler: removed clash with
 smem_region
Message-ID: <20230208234717.gums2uqipzzbkhwn@ripper>
References: <20230131200414.24373-1-pvorel@suse.cz>
 <20230131200414.24373-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131200414.24373-3-pvorel@suse.cz>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 31, 2023 at 09:04:14PM +0100, Petr Vorel wrote:
> This fixes memory overlap error:
> [    0.000000] reserved@6300000 (0x0000000006300000--0x0000000007000000) overlaps with smem_region@6a00000 (0x0000000006a00000--0x0000000006c00000)
> 
> smem_region is the same as in downstream (qcom,smem) [1], therefore
> split reserved memory into two sections on either side of smem_region.
> 
> Not adding labels as it's not expected to be used.
> 
> [1] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-mr1/arch/arm/boot/dts/qcom/msm8994.dtsi#948
> 
> Fixes: 380cd3a34b7f ("arm64: dts: msm8994-angler: fix the memory map")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi          | 5 -----
>  arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 5 +++++
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index cdd796040703..a100b05abf56 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -60,11 +60,6 @@ reserved@5000000 {
>  			reg = <0x0 0x05000000 0x0 0x1a00000>;
>  			no-map;
>  		};
> -
> -		reserved@6c00000 {
> -			reg = <0x0 0x06c00000 0x0 0x400000>;
> -			no-map;
> -		};

I've not picked up the change that introduces this, and it seems that
there's some request for changes on that thread.

Please try to sync up with Jamie to get the patch updated, or let me
know how you would like me to proceed.

Thanks,
Bjorn

>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> index 59b9ed78cf0c..29e79ae0849d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> @@ -41,8 +41,8 @@ tzapp_mem: tzapp@4800000 {
>  			no-map;
>  		};
>  
> -		removed_region: reserved@6300000 {
> -			reg = <0 0x06300000 0 0xD00000>;
> +		reserved@6300000 {
> +			reg = <0 0x06300000 0 0x700000>;
>  			no-map;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 9ff9d35496d2..24c3fced8df7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -228,6 +228,11 @@ adsp_mem: memory@c9400000 {
>  			reg = <0 0xc9400000 0 0x3f00000>;
>  			no-map;
>  		};
> +
> +		reserved@6c00000 {
> +			reg = <0 0x06c00000 0 0x400000>;
> +			no-map;
> +		};
>  	};
>  
>  	smd {
> -- 
> 2.39.1
> 
