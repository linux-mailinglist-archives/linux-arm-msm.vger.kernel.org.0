Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668826814FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 16:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbjA3P2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 10:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238140AbjA3P2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 10:28:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB3822A03
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:28:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05AD1B811C7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5FDC433D2;
        Mon, 30 Jan 2023 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675092480;
        bh=bqL4veyRYlHjdDEeI6LPtzHVJN3nrx3Xbxd6h50NwKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uR3YQE9sGVQzKCMD4oZFNU+wimUqOrlfPlO903/IX+hE9SaAtl613MmPlB6DMiFXS
         mNlKE22rd+l+qYWWgwv8X1GcLwTbPoZu42CgcH4dlqq0UweN0DX6fL36fpCoW/ruGU
         nSJszr7X8n0PAk0e9HimDhggTTlvHbikDj62favtskBJF8RvveHDTOWikbpz8dMPKX
         umMiVJRalVaQiguBxjyDhYU1Hy6jcqV10pBUHIZUk1mfuVJW+TbULABzI/k5hlOdRC
         EbR8VQs5rXKKScboBLh9SaXHg923nkxxNc9O+5oyDl7QrDl51dMV+maUU2ZKA18Fxn
         G2wyCwmSHfQDg==
Date:   Mon, 30 Jan 2023 09:27:58 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable qcom msm8994 clk drivers
Message-ID: <20230130152758.f5hh7zydyca22ipu@builder.lan>
References: <20230130111014.27980-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130111014.27980-1-pvorel@suse.cz>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 30, 2023 at 12:10:14PM +0100, Petr Vorel wrote:
> Enabling the clk drivers on msm8994 allows to boot and test most device
> drivers on this SoC.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Now that we can handle probe defer on the power-domains, can this be
made =m instead?

Regards,
Bjorn

> ---
> NOTE: Working as part of SUSE hackweek, that's why I use my work mail
> instead of usual private gmail.
> 
> Kind regards,
> Petr
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index bfafb4313436..c6b08a9d8944 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1105,6 +1105,7 @@ CONFIG_IPQ_GCC_6018=y
>  CONFIG_IPQ_GCC_8074=y
>  CONFIG_MSM_GCC_8916=y
>  CONFIG_MSM_GCC_8994=y
> +CONFIG_MSM_MMCC_8994=y
>  CONFIG_MSM_MMCC_8996=y
>  CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
> -- 
> 2.39.1
> 
