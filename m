Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9052C56297D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 05:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233989AbiGADQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 23:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbiGADQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 23:16:51 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6972664D68
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 20:16:50 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id e14-20020a9d018e000000b00618ca3183a0so266978ote.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 20:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HPNd4ReapLodwhnbZtj5CIOKPYAgQKMIlbQzUVzo7PA=;
        b=KgpRiaQlIInDtNWwve1xr8qYAEVPtOLJSS1jE74EkT3DPKl/jQttI+vc0RdNjD5SYw
         tfyEDkQmueRl6sgGxQ4sSLROHm9f6O6wnbgbsdQ8ZNqM0rITQFfgKm+JuHRNPoLEbjvH
         P6JiruMLvhfpqCeMYTKRzJ1ZQp+2lmLdCgirJA2JK+pd8Rdpl+Qn8/GFjuRaMouW35NY
         t7EczL0tzK5RLMSL5zEpBmEUbRuPWHWjxh+probLRdM4CvOq2X288oC6r3IcKLywyOLL
         4VqQ8P714xErkirPgvHVr9++FDnfmWyWAG8aewvfSiTA0LZzmhhhEqfzbQf3eltFY/G4
         F0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HPNd4ReapLodwhnbZtj5CIOKPYAgQKMIlbQzUVzo7PA=;
        b=rc5sb2SZFwk3wIk+3ddbrmbnQcZKUHFfpAlnZv2d3G1pOt9K2VKRyLIXcJvMD4bbgn
         qToNAEPCcchs87rwaOEc20JTvdGVycR7utQBhdKz1rMXCa53uZPBCMvrctMyKrTAa3ga
         9wk4ffhuhDh5kiEMIKyj36zLOvpPhx6ly3HXwubdEqpBSnpUSEMklWocVzT8tkMiyLJp
         CekDZZZyulDiZNafXLgkWczO+ShmbJwkhdTfNeezvN4ycHJdfV4Pgc3t+uz7qYByjGr6
         Ce2bMIYfGtAsDopY2uD7mGnBvL0RVVtOA6eB6TO8DAIMKdQMGhn/ODKqu9Yxrx37P8B3
         iRWw==
X-Gm-Message-State: AJIora/z5a9reMkY1D6OsASruAK7TBLW8tlVINZ4+0m7Gr3QdWOrawVH
        5+9FthK1tzys1FZ4C4Pxq8Lo6w==
X-Google-Smtp-Source: AGRyM1uO+s50h/3fmKyKSQ72i2tbY3t4VXAXY3PiTJmIZ5tobtdNuA66C58BgCeCFycW6fHZs/26wA==
X-Received: by 2002:a05:6830:4491:b0:618:b000:97b1 with SMTP id r17-20020a056830449100b00618b00097b1mr2996109otv.148.1656645409774;
        Thu, 30 Jun 2022 20:16:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 7-20020a9d0807000000b0061706c58a9bsm2867121oty.61.2022.06.30.20.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:16:49 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:16:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Teguh Sobirin <teguh@sobir.in>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 7/7] fixup! arm64: dts: qcom: add support for AYN Odin
 Base and Pro
Message-ID: <Yr5nH5O4gJlCIsmI@builder.lan>
References: <20220606230522.107428-1-teguh@sobir.in>
 <SEZPR03MB66669DF0DECE022290F7C9E9DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR03MB66669DF0DECE022290F7C9E9DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Jun 18:05 CDT 2022, Teguh Sobirin wrote:

Please squash this with the commit you're trying to fix and repost with
a cover-letter.

Thanks,
Bjorn

> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
> index 545debd7c275..8deeb375bc1a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
> @@ -133,7 +133,7 @@ vdda_usb1_ss_core:
>  		vdda_qusb_hs0_1p8:
>  		vdda_qusb_hs0_3p1:
>  		vdda_mipi_dsi0_1p2:
> -		
> +
>  		vdda_ufs1_1p2:
>  
>  		vreg_l1a_0p875: ldo1 {
> -- 
> 2.30.2
> 
