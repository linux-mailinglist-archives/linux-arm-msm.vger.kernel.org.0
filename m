Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5ED5720AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbiGLQWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbiGLQWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:22:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A21CA6F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:22:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55DEBB816AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 16:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B34C3411E;
        Tue, 12 Jul 2022 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657642948;
        bh=RHus7zUVV6kdbvQ05m7eCv4BdgCiLhzwvBmLHSeMxF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z8I7FFdj1qV3iCQpK0J9uBA/IBfBvmhOkX4UBHumw00HIigkDVbH682PCDJmdYRZ2
         0x0LtCL7d1m9OYhkm1HsltEEccoy0d0ywls/rq2mvHit1cwMhUK4B9544JkRJW8wp4
         d9FDxyAFx+4Q5TeUFEojMkZL3A0WH5rkDtTx8gxH5qht65cF4c8ZqFi7e79M9Xxc//
         3iY2La5gYPHhQl0XA3Fz6nG4Du2AvLZiplQgzzBrQxXDDwvzbCRuHiZQ5tZ3TIBHIy
         GaW1ysaLi9PL28W1SDzsKmbBcczQPEHCZpDFwbVV+XVF35VaXkDiy49R33je3bif2h
         PtruJ2VmjWBdw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oBIec-0005VO-KY; Tue, 12 Jul 2022 18:22:30 +0200
Date:   Tue, 12 Jul 2022 18:22:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <Ys2fxjVLOCnkWp9u@hovoldconsulting.com>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712140009.20765-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> Wrong values have been introduced for interrupts property. Fix those
> ones, and correct the mapping of context banks to irq number.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..1276a833251e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1580,7 +1580,6 @@
>  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> @@ -1591,6 +1590,7 @@
>  				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,

Not sure how that happened. Looks correct now, thanks.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan
