Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123065A1B52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 23:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243927AbiHYVlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 17:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbiHYVlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 17:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43A23B958
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661463670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KNs/b3nl3FKvMjHZZMNTWfTvykJjWYkvtDKyXB8RuwY=;
        b=LiBltKoWD2lnmX07v/nasssSaR3xsXPjSHk4wIYkf7bffp2++ABNGXD/gOhNrWCU5MzPLu
        YnaZQI3hvud9sAx2xTdzfwxi0C3kId5kMzUQAWHlKm8iFpVaWYnK1IcsfPXLWlM3Dz01zz
        1xnp6/iKC7Ni1WWhXY9kU/YyaA/Tvv0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-RmaE3itANVqfff4LTQFO9A-1; Thu, 25 Aug 2022 17:41:09 -0400
X-MC-Unique: RmaE3itANVqfff4LTQFO9A-1
Received: by mail-qv1-f70.google.com with SMTP id gh7-20020a05621429c700b00496b1a465b1so12488922qvb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=KNs/b3nl3FKvMjHZZMNTWfTvykJjWYkvtDKyXB8RuwY=;
        b=75lUQvXmd3vOv6moXbSqmZlSO+zcGs2IOZ6bylgEFRavB4Rdk4QnAHcbW4X/2UZ5lB
         J8TCTim9YNbLdN7LAf8Q95Be6sYzc28mgGg+wi0vGabz65PFati1eUQiWWfbrRI8+SG7
         G/ydGUuxFoC5Webz+uiLP/Oy80VXZpT1S4FSWeypTZBD8PgvZTFdZy531a8Kw5ONaDq5
         qe2lWCpjvYZp+slt5IOt44SFsA+ykB9Z8NZMIuKXCoXmjXnChyuNggSxSGp1eUFaHluO
         7XnMix3VR16rNLFk0QXNcrkkQMkTrTa3Gpc/5a4pfvYAT3HakhgBu+xT43NqxZbES44J
         OqKA==
X-Gm-Message-State: ACgBeo0TFST00q6SbJC7Nvay/rHdG0Xvw8t4UFyZTGFqXGIVEUiSbKiO
        qb563NrL9jE4WYl2pBwQNGhiGCKs/9BzUcbNB4sztVJx+J2cNGONaEPtfJQXoeaJrd/mhhGhhYX
        km5EES5ZW7H7I09gyhFv+lZ/CyQ==
X-Received: by 2002:a05:622a:164f:b0:344:b216:ada6 with SMTP id y15-20020a05622a164f00b00344b216ada6mr5521535qtj.302.1661463669092;
        Thu, 25 Aug 2022 14:41:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6uINL2Y8JXcvIzugi3NqXWYW7yZbu3WUyduDaOM7zAuo3MK9r+QghKTBJK8w4xG6sO7ewQ5g==
X-Received: by 2002:a05:622a:164f:b0:344:b216:ada6 with SMTP id y15-20020a05622a164f00b00344b216ada6mr5521525qtj.302.1661463668879;
        Thu, 25 Aug 2022 14:41:08 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a150800b006b928ba8989sm397643qkk.23.2022.08.25.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:41:08 -0700 (PDT)
Date:   Thu, 25 Aug 2022 16:41:06 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: Specify which LDO
 modes are allowed
Message-ID: <20220825214106.7d7mzhpavpuwyik3@halaneylaptop>
References: <20220825164205.4060647-1-dianders@chromium.org>
 <20220825094155.7.I6799be85cf36d3b494f803cba767a569080624f5@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825094155.7.I6799be85cf36d3b494f803cba767a569080624f5@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 09:42:05AM -0700, Douglas Anderson wrote:
> This board uses RPMH, specifies "regulator-allow-set-load" for LDOs,
> but doesn't specify any modes with "regulator-allowed-modes".
> 
> Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
> get_optimum_mode(), not set_load()") the above meant that we were able
> to set either LPM or HPM mode. After that commit (and fixes [1]) we'll
> be stuck at the initial mode. Discussion of this has resulted in the
> decision that the old dts files were wrong and should be fixed to
> fully restore old functionality.
> 
> Let's re-enable the old functionality by fixing the dts.
> 
> [1] https://lore.kernel.org/r/20220824142229.RFT.v2.2.I6f77860e5cd98bf5c67208fa9edda4a08847c304@changeid
> 
> Fixes: 9208c19f2124 ("arm64: dts: qcom: Introduce SM8350 HDK")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 0fcf5bd88fc7..69ae6503c2f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -107,6 +107,9 @@ vreg_l5b_0p88: ldo5 {
>  			regulator-max-microvolt = <888000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l6b_1p2: ldo6 {
> @@ -115,6 +118,9 @@ vreg_l6b_1p2: ldo6 {
>  			regulator-max-microvolt = <1208000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7b_2p96: ldo7 {
> @@ -123,6 +129,9 @@ vreg_l7b_2p96: ldo7 {
>  			regulator-max-microvolt = <2504000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l9b_1p2: ldo9 {
> @@ -131,6 +140,9 @@ vreg_l9b_1p2: ldo9 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> -- 
> 2.37.2.672.g94769d06f0-goog
> 

