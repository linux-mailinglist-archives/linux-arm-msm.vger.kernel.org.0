Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83235A1B4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 23:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243829AbiHYVki (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 17:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243899AbiHYVkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 17:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F21A642DD
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661463603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TpiWfUhlZ2jUxhN+MMbGvXsRCYfyKWQ6ow6O6tQAlI0=;
        b=BchyBMlfTbIVXEycgV1pbb9zi1OKu9Dj6gKQRbRXpapj3yLJ56mCrRdTiO2eCjpbOung29
        4OiiQcvj4g66zbofmjhAVfmB2FOjp+XAR3o2a/60cI6WCyNbzTLB06w40sBPo6gubAFZ9Z
        v5ggg8NSkMCUS0Z+gUo6M5oWEqGdLU0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-0yZ3o6CBMXiZ2TvnZJx84g-1; Thu, 25 Aug 2022 17:40:02 -0400
X-MC-Unique: 0yZ3o6CBMXiZ2TvnZJx84g-1
Received: by mail-qk1-f200.google.com with SMTP id h8-20020a05620a284800b006b5c98f09fbso18534626qkp.21
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=TpiWfUhlZ2jUxhN+MMbGvXsRCYfyKWQ6ow6O6tQAlI0=;
        b=vUZaELSInJwOpFkJzpaoJHS8P0V0jQ7PQ4Tk/99zKo/AY0aU3Meicm/5zBdQMgorZk
         v70Nf8Pibf+EF7qXsZ3Ri5Wjgme45EkfQdMyrWd0wzFPSTig68i8tTXyO7zcX5b5Nc1S
         LCZul1jKuBkMT6tSGWfpck/zaAD3hGffJBsDdX1bN5LMw6iVgpYIHl1QZuX6HZd8ktUT
         Wt7Lp7W6pL5Yx3IurXU4eQ96dZYKORJRtovpdaVOjVOrsatnm4OAN1R9PJkgz3VVs9nB
         04wN7jy0WFB8vxnSR7hK2q37O6Ag/Kftul3sku6PDxc2vZbt+BgEv9Ab29TGg2bWxFM8
         +z0w==
X-Gm-Message-State: ACgBeo2Os54fk+TtulSTdjIoMlZoLCX00aceY3I80v0Dm/lNTHsAfbCo
        zlRfg1bvEtY2bLyQ+a1kUHaap1y3TVLyjE9f6VpFsx4hmxr4ipFCDJTm23I0Zi37/JOviW7X6wF
        +gtEXqT23b54UM8kxqeGWMzb3PQ==
X-Received: by 2002:ae9:ed81:0:b0:6bb:7a53:fbb with SMTP id c123-20020ae9ed81000000b006bb7a530fbbmr4588054qkg.495.1661463601765;
        Thu, 25 Aug 2022 14:40:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Nerzm4YQT8Tx+ilb6qBkrlQoRWCe3dB2Vlq/Vh0LYFnSA4FNKWkAqrEccjRaeEE0wlrLEyA==
X-Received: by 2002:ae9:ed81:0:b0:6bb:7a53:fbb with SMTP id c123-20020ae9ed81000000b006bb7a530fbbmr4588044qkg.495.1661463601540;
        Thu, 25 Aug 2022 14:40:01 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id r21-20020ac867d5000000b0034300e35487sm40110qtp.54.2022.08.25.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:40:01 -0700 (PDT)
Date:   Thu, 25 Aug 2022 16:39:59 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8250-xperia-edo: Specify which
 LDO modes are allowed
Message-ID: <20220825213959.pdiwfa7qxq37tjdz@halaneylaptop>
References: <20220825164205.4060647-1-dianders@chromium.org>
 <20220825094155.6.Ie446d5183d8b1e9ec4e32228ca300e604e3315eb@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825094155.6.Ie446d5183d8b1e9ec4e32228ca300e604e3315eb@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 09:42:04AM -0700, Douglas Anderson wrote:
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
> Fixes: 69cdb97ef652 ("arm64: dts: qcom: sm8250: Add support for SONY Xperia 1 II / 5 II (Edo platform)")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index 549e0a2aa9fe..5428aab3058d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -317,6 +317,9 @@ vreg_l6c_2p9: ldo6 {
>  			regulator-max-microvolt = <2960000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c_2p85: ldo7 {
> @@ -339,6 +342,9 @@ vreg_l9c_2p9: ldo9 {
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

