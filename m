Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA92570A0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 20:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiGKSiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 14:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiGKSiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 14:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE61D61108
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 11:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657564696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4n16Yt+8s400EKLieodFyDNV7FgyK4ZR0YFNhCagKNQ=;
        b=SwvuMSP50UakMhmWmouHBkGS7qX1o9W18XROXATf8CwpKS9E6/tF2y932UfLLfFU4M35BA
        gIgPG8CiW7qRwulB46ciDmfKvwXCUWbexPa69VPmz+z1KUTZahi7NAFLpskcXkBI/0Rou7
        nYY5JxynWXE5MLiG/VWa6aN3NKF25II=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-btI1FFvFODuYrzxkqd6v7Q-1; Mon, 11 Jul 2022 14:38:08 -0400
X-MC-Unique: btI1FFvFODuYrzxkqd6v7Q-1
Received: by mail-qt1-f197.google.com with SMTP id f14-20020ac8068e000000b0031e899fabdcso5351899qth.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 11:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4n16Yt+8s400EKLieodFyDNV7FgyK4ZR0YFNhCagKNQ=;
        b=lhfOzAzb+czHcLr5xMdCTDy2MF5yRoEakgmjT0pRy6w337JTSWHXbY7yNYkalj/Tg3
         s7auRHwSTzMEDJfCnv36mZ2l4T2IPvwi4T9aQVOVpLqG1QVGRLe0W49Fr/tCbd2bD/6N
         ds0MSM9Bm2yrgA0fCW9x8CyEuOtThQKQSpHEUHw+ayrAuaegiNF2LwACgrq3XqfkWoiT
         oOxJf6NGCPZHoI5itVDYvgBHze2Fp6VGghu4nd7ntkQ9Ld4HlJwmRIcY8bH1OklHT6Ih
         B8oGvDV7gFQ5k+gMSy/QlhPdtVaeWqTHQoa2SNcFacFA/eU2pHuXbgmfoFb5DY+RCC0m
         ZnhA==
X-Gm-Message-State: AJIora8ub/Z5+4o3S2DZ2s2K77OgHZzTZiqMDnSfgb0DJGW2Fkv0hEyy
        +1KY2h/haHOXKgPwInngQt/GCIFMt0lHqqOKK4Cdlbwns/onnKtRyhGj5HEGgC9pTv31pcLgs8u
        1d6mqo6AXKQdu0WycKPYxIOQlPw==
X-Received: by 2002:a05:622a:1453:b0:31d:4c06:4a04 with SMTP id v19-20020a05622a145300b0031d4c064a04mr14681114qtx.432.1657564687906;
        Mon, 11 Jul 2022 11:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sIexEenaeSwV676Y/VE21H4Cph7mukJ5FKJ7p986rl/1IADamzFkBtlzkzvoZniBYBDS22VQ==
X-Received: by 2002:a05:622a:1453:b0:31d:4c06:4a04 with SMTP id v19-20020a05622a145300b0031d4c064a04mr14681092qtx.432.1657564687675;
        Mon, 11 Jul 2022 11:38:07 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id w16-20020a05620a445000b006a693e46d5csm4776106qkp.11.2022.07.11.11.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 11:38:07 -0700 (PDT)
Date:   Mon, 11 Jul 2022 13:38:05 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: fix the smmu interrupt values
Message-ID: <20220711183805.ilsutjpl3tdjs25p@halaneylaptop>
References: <20220711174133.28882-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711174133.28882-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 11, 2022 at 11:11:33PM +0530, Parikshit Pareek wrote:
> There has been wrong values introduced for context interrupt for
> smu node apps_smmu. Fix those ones with due correction.
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
> -- 
> 2.17.1
> 

I think you'll wanna use the subject prefix "arm64: dts: qcom: sc8280xp:"
here, and in my opinion removing the 424 irq should be
referred to as removing a duplicate (since its still listed), and
then another patch adding the missing one. Super pedantic but I'd do it
like:

  1: arm64: dts: qcom: sc8280xp: remove duplicate apps_smmu irq
  2: arm64: dts: qcom: sc8280xp: add missing apps_smmu irq

That being said that's just my opinionated drive by review.

For what it is worth I checked the downstream source I have access to
and the diff here makes sense to me, so with the commit message fixed up
a bit (at least including the proper prefix):

    Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks,
Andrew

