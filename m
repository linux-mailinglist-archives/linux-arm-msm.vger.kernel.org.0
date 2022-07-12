Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571CA57213A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbiGLQml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbiGLQmS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 490EFD1CA2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657644114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qPa5tZuRG1/lXriH/kKRS4KQrfWM88MJ99Qp+ga/ojg=;
        b=jGdDmkgcr6m4FkXs+4VoVt4JhTG70HP7bBF+GtyVadXEDqWU1OMlAGiXnuJw1avHlRN76O
        NTuZSuPlCRy4equM8khZB7qfbh6sGAnh9W2RUgZq/hNZjq6m7rySHNS9UaPw170cK8tVyt
        VM17y7adjNt8vnVYWqgWKlntOJ9NXXg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-z_uf1HjsOZCJlnYixVShJA-1; Tue, 12 Jul 2022 12:41:52 -0400
X-MC-Unique: z_uf1HjsOZCJlnYixVShJA-1
Received: by mail-qk1-f197.google.com with SMTP id bm2-20020a05620a198200b006a5dac37fa2so8194960qkb.16
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qPa5tZuRG1/lXriH/kKRS4KQrfWM88MJ99Qp+ga/ojg=;
        b=6fMhGfTQQJio1KsPPHbtFJxeZb7OjsynAa03QnYulmRY37HTC4VR1NjlewWGLXuv4S
         vw7aBkYxIcf/ixpv/MRJXRpGKaySQMWwJ18IQ/W//cs8pn673FY0Dpsaq5uwppPt3+G7
         n5BK3AGasdWpxPuFKQjwF7Xz2VURTueBDtJy9/SOkRnuxpf7wNGRqM5myrd+IGvWYyG4
         anttrYE+IEYpq2y544gNzdd/MDKvG9/Jzob5zu1vs4ORVw27Wa4uDyTfvf3dytJbQNk/
         z5hfijBeKVUTJm5pcZHUEouUqpJMwInHQYV9pflaTk5yLk6z4K4yxQKB97CoGvGN9u1Q
         AhxA==
X-Gm-Message-State: AJIora/dGjUaKWrrRsw1F3FoRZokOIYPL0+tIDE/RKN1t9KlJrCRKfnH
        vT9+j6PBY44FKIBeFlcR/3NyZaMOxY9QvntS5KMj4i0uidSt6lj8UMet2Za7RcyQIOOGi/Z4te8
        alCjMpQ5MbJlZDw3Dpa0U8/ZZpw==
X-Received: by 2002:ac8:7f8c:0:b0:31e:beec:ecaa with SMTP id z12-20020ac87f8c000000b0031ebeececaamr3880618qtj.413.1657644112069;
        Tue, 12 Jul 2022 09:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKbRtHZs4kF0vxmDM1D1nANgRgXfnjhO9tZ/su4gKrq5A2Wxh6krmWAV1dXrN+cep0KcIY3g==
X-Received: by 2002:ac8:7f8c:0:b0:31e:beec:ecaa with SMTP id z12-20020ac87f8c000000b0031ebeececaamr3880479qtj.413.1657644110369;
        Tue, 12 Jul 2022 09:41:50 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id dt8-20020a05620a478800b006a91da2fc8dsm6806704qkb.0.2022.07.12.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:41:50 -0700 (PDT)
Date:   Tue, 12 Jul 2022 11:41:48 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <20220712164148.ymmfbghfwngwacoz@halaneylaptop>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712140009.20765-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
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
> -- 
> 2.17.1
> 

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

