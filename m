Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70AD5A1B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 23:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243862AbiHYVjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 17:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243811AbiHYVjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 17:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D24C12EC
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661463546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZcIFJ5ndstDXyueuKitLh0n6/PvdcwcoUpyPYLTHmOk=;
        b=JZh7txnM1KHUTdFLXrkjTNF3CDH+NjPWL2isOcZmD1T4W8C+u8M+5uMfh6k0MxuR36lIt6
        WfYPshByOWX2UOQpGv+pyj/zBjGSU3rszBfWLEAAJbTP4xgZgvRTSQojC/HIasLwXua0Nz
        TmdyhEr5vEh9dGnYRqZX50pw80qjc7Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-kMSENICkPV2WztYS_vG_Lw-1; Thu, 25 Aug 2022 17:39:05 -0400
X-MC-Unique: kMSENICkPV2WztYS_vG_Lw-1
Received: by mail-qv1-f71.google.com with SMTP id l10-20020ad44bca000000b0049664e99a57so12600148qvw.17
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ZcIFJ5ndstDXyueuKitLh0n6/PvdcwcoUpyPYLTHmOk=;
        b=EDOQSyODv/MpaJpo2RDOoBGfZJU2fYCxhWsw00x4saoDbXxpwYeMspYtuWpsRuDYrF
         1g+Jex3fRNb4kFYK+XAfRl7xdAL3c+hNDKYwRSpOxbOajx9qnJtfdvkqwSvZ6CMaHV/T
         bdMnuA78VzMSZfrHlQTe8NDDRK9yNvlwMGl5M6PQpVPBxzN7+hgCyPVrh0yRDHax3dTH
         ojubShYZKnbAYaJR8xV4JRrWKmrHtxuy0K4tO9YBKBIn6vBkHUoUe+zvvLBTVj7sBije
         Qkc/cYwADnQTZxMeSIkTzoGh9iFsQraXPn6xuv2wrc/taYIU1Ruy04nGBMN/cYoWn5Hc
         ONjQ==
X-Gm-Message-State: ACgBeo1R2DjQ5RvFBkOWSKB+hDpk4yxr+Aw4C54Yf0UnpmXN1nUrDMCM
        DcMlJXvg82XCLeQwmYZvzK0so8L3+NFhQg7AhdaDsDlVFlyx4+2U1iZeTvUuZuZAHssALGGQAWU
        8CVmJsoIN/DGyIUX7zaKdqD/W9A==
X-Received: by 2002:ac8:4e4f:0:b0:344:a6db:1b58 with SMTP id e15-20020ac84e4f000000b00344a6db1b58mr5373562qtw.38.1661463545343;
        Thu, 25 Aug 2022 14:39:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR67T1K+fOtvPPC/ltEVEu6YGotNZqvbRbsVHyqcHmcKx11ioEat7LIJRldMn2RlqIek12eCsw==
X-Received: by 2002:ac8:4e4f:0:b0:344:a6db:1b58 with SMTP id e15-20020ac84e4f000000b00344a6db1b58mr5373551qtw.38.1661463545129;
        Thu, 25 Aug 2022 14:39:05 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id s22-20020a05620a0bd600b006bb9125363fsm476966qki.121.2022.08.25.14.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:39:04 -0700 (PDT)
Date:   Thu, 25 Aug 2022 16:39:02 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8150-xperia-kumano: Specify
 which LDO modes are allowed
Message-ID: <20220825213902.3pz37c7e4qarzs7w@halaneylaptop>
References: <20220825164205.4060647-1-dianders@chromium.org>
 <20220825094155.5.I51d60414a42ba9e3008e208d60a04c9ffc425fa7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825094155.5.I51d60414a42ba9e3008e208d60a04c9ffc425fa7@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 09:42:03AM -0700, Douglas Anderson wrote:
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
> Fixes: d0a6ce59ea4e ("arm64: dts: qcom: sm8150: Add support for SONY Xperia 1 / 5 (Kumano platform)")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
>  arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> index 014fe3a31548..fb6e5a140c9f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> @@ -348,6 +348,9 @@ vreg_l6c_2p9: ldo6 {
>  			regulator-max-microvolt = <2960000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c_3p0: ldo7 {
> @@ -367,6 +370,9 @@ vreg_l9c_2p9: ldo9 {
>  			regulator-max-microvolt = <2960000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l10c_3p3: ldo10 {
> -- 
> 2.37.2.672.g94769d06f0-goog
> 

