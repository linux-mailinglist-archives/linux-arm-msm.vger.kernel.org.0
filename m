Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABAE5A1B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 23:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242778AbiHYVdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 17:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbiHYVdo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 17:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0312BFE97
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661463221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6aPloejq6vPvAglHpAJmylSnk+VauqCSWbgwN5T3xFw=;
        b=VVEQrkLvIpBcXcAbsRnyKVhbi9DGcvqawmQ142+4+l1GMYARMa1YpQmMcUzkv9BCtIpoZR
        DbW8OuEAPfikXfWRS5bLwVUNk4rD+CtHqPZuEIWmOdtcX+hvEvmhmrtfPD7yrpwX7LENPr
        j+8RiSHUza6J3FHxqqBadbIajV34+aA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-xT8sgTQNMDSMra5C_11vMg-1; Thu, 25 Aug 2022 17:33:40 -0400
X-MC-Unique: xT8sgTQNMDSMra5C_11vMg-1
Received: by mail-qk1-f200.google.com with SMTP id az11-20020a05620a170b00b006bc374c71e8so8941044qkb.17
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=6aPloejq6vPvAglHpAJmylSnk+VauqCSWbgwN5T3xFw=;
        b=dXk0xFTcTGtYU2An9AgRMy/+xJK0EpycqwOCwAEmhbB7ucnjQLXVqs0gLREaYXW21f
         f23hkiZNvM4ajdRoawC9b3ZVWLVYHmniLwNkMPizve4/8q1xzvbmDiQfmPwQ0ez0N3jW
         NyS/GuEX9O8iQ1h51OPSvviPdDDx0KCMVYcDkPGil8TU7nrKhoNRpbxd70vYjfuLbq5n
         tXUK4Vz+QOsGJ4sO2eKm65ftEku8gRYN3dA4duJXrL8EXw6Ma/YcS0mx4htOO39JzdNc
         pOu7BrD4Q9G8+5CC/7y8BuOkIVsAtjxN6x2AHBpAxi3LJeFbvi+uT+EKdImA13v1ig0P
         1HIw==
X-Gm-Message-State: ACgBeo1LOJgam4mZNizCLiHj661Mpd96/mjNHI0LWdiFFvPNd4W7O1/w
        91IIfltZCOJi+BXaltozZqF5qEHe/YTLWEyhCF+sc3I6wA/mm6C3IA+ay1pGAjH2zlBNT5vuJ+5
        EWTCdU9H3FJSTyFKmdJLs8U+Ifw==
X-Received: by 2002:a05:622a:342:b0:343:71c7:9be6 with SMTP id r2-20020a05622a034200b0034371c79be6mr5617606qtw.72.1661463219745;
        Thu, 25 Aug 2022 14:33:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rio0ubMv+vXsQgasbaBeWjrLzOszpzRC+aB0GsBY5/h2vBh2/WaaV1Gk73dWYTWUJ4jVdwg==
X-Received: by 2002:a05:622a:342:b0:343:71c7:9be6 with SMTP id r2-20020a05622a034200b0034371c79be6mr5617582qtw.72.1661463219519;
        Thu, 25 Aug 2022 14:33:39 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id o6-20020a05620a2a0600b006baf3ffba23sm411321qkp.38.2022.08.25.14.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:33:39 -0700 (PDT)
Date:   Thu, 25 Aug 2022 16:33:37 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sa8295p-adp: Specify which LDO
 modes are allowed
Message-ID: <20220825213337.3h3in2csbdcom7on@halaneylaptop>
References: <20220825164205.4060647-1-dianders@chromium.org>
 <20220825094155.2.I430a56702ab0af65244e62667bb7743107de0c96@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825094155.2.I430a56702ab0af65244e62667bb7743107de0c96@changeid>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 09:42:00AM -0700, Douglas Anderson wrote:
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
> Fixes: 519183af39b2 ("arm64: dts: qcom: add SA8540P and ADP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index 9398f0349944..6d05cb54e32f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -36,6 +36,9 @@ vreg_l3a: ldo3 {
>  			regulator-max-microvolt = <1208000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l5a: ldo5 {
> @@ -44,6 +47,9 @@ vreg_l5a: ldo5 {
>  			regulator-max-microvolt = <912000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7a: ldo7 {
> @@ -52,6 +58,9 @@ vreg_l7a: ldo7 {
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l13a: ldo13 {
> @@ -60,6 +69,9 @@ vreg_l13a: ldo13 {
>  			regulator-max-microvolt = <3072000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> @@ -73,6 +85,9 @@ vreg_l1c: ldo1 {
>  			regulator-max-microvolt = <912000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l2c: ldo2 {
> @@ -81,6 +96,9 @@ vreg_l2c: ldo2 {
>  			regulator-max-microvolt = <3072000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l3c: ldo3 {
> @@ -89,6 +107,9 @@ vreg_l3c: ldo3 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l4c: ldo4 {
> @@ -97,6 +118,9 @@ vreg_l4c: ldo4 {
>  			regulator-max-microvolt = <1208000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l6c: ldo6 {
> @@ -105,6 +129,9 @@ vreg_l6c: ldo6 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c: ldo7 {
> @@ -113,6 +140,9 @@ vreg_l7c: ldo7 {
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l10c: ldo10 {
> @@ -121,6 +151,9 @@ vreg_l10c: ldo10 {
>  			regulator-max-microvolt = <2504000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l17c: ldo17 {
> @@ -129,6 +162,9 @@ vreg_l17c: ldo17 {
>  			regulator-max-microvolt = <2504000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> @@ -142,6 +178,9 @@ vreg_l3g: ldo3 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7g: ldo7 {
> @@ -150,6 +189,9 @@ vreg_l7g: ldo7 {
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l8g: ldo8 {
> @@ -158,6 +200,9 @@ vreg_l8g: ldo8 {
>  			regulator-max-microvolt = <880000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  };
> -- 
> 2.37.2.672.g94769d06f0-goog
> 

