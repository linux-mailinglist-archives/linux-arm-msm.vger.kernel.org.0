Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8CF5A1B24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 23:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243774AbiHYVfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 17:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbiHYVfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 17:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9173EA61E1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661463307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JICveRMgrKIohjs6LWwa5w2kG83O8Uzo7FGURzBNI/k=;
        b=ShM/p42gMksHH+nGmxmbtA/hmxqubeZPARTv5PbW0VM6Bg99XQIG8E5+8KipVNXHzNb6yx
        02tjh20SGwfApgkzEXiKKshmz62GdAn2vP+8aimTLWBu6oUMnwckKBuhCzmqyi5oUMcJC2
        1myCYxZ8pkE3uY4QaJFT5lOOQbfPesE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-f82Dyk_1MCmvql24GjrK9Q-1; Thu, 25 Aug 2022 17:35:06 -0400
X-MC-Unique: f82Dyk_1MCmvql24GjrK9Q-1
Received: by mail-qt1-f198.google.com with SMTP id cj19-20020a05622a259300b003446920ea91so16185829qtb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 14:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=JICveRMgrKIohjs6LWwa5w2kG83O8Uzo7FGURzBNI/k=;
        b=gbSIZxL35/YLRuvmjWxJrFl1xvG5XxuR9j1Eg/4QZ11XkNWQWajRvx1LEK2k7obdlY
         cmhZhZJoO0biuKkoU22fIFm15gVq+Qqng8/N92/kKEOjGXAB4Bto1TpZsY4Jg0UUPufX
         ZPjub7kK0xTWHVVR9JH/Q+youAdZnrw2ugwr/y8m/pyBCYAPMhi+tRgTGB6KT2EisxAH
         6XisXeHinV/3qFYEI09tR+bm5wRA5ikNlm+rGNtIqd7ZGE7qwyyI+LrJiVi8GYB3CAUr
         DlfC7dZ/IMcjZrtjK6bdIz9y/0IKxArI0JDbhja3pXE+6aQjzy48WJ68c6yAejoPY11w
         vAiQ==
X-Gm-Message-State: ACgBeo1XZoqonfAizJeXxEasDnKXIKJBw5fGJ6puHMlv70h1bD1cVwVO
        cPjfm/gAJ3SJPCWX4bWmwfe7YJsT8/xT6tsQoDVT9W4/Jwq3Tx7GBDxnEa6p2zxoZlaVoq5heMi
        jsQGW55EV1n8tRuVL12Bpf0pbjg==
X-Received: by 2002:a05:622a:2d1:b0:343:6193:3348 with SMTP id a17-20020a05622a02d100b0034361933348mr5387436qtx.633.1661463306175;
        Thu, 25 Aug 2022 14:35:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vekjCktFDw9vN21MT/LB4Vvr1Rgv1cTA5GVVEQ3/sr6cpjl8oaIlGlzKDMRTi+yXJyQ0xRQ==
X-Received: by 2002:a05:622a:2d1:b0:343:6193:3348 with SMTP id a17-20020a05622a02d100b0034361933348mr5387423qtx.633.1661463305953;
        Thu, 25 Aug 2022 14:35:05 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id h15-20020a05622a170f00b003436103df40sm77411qtk.8.2022.08.25.14.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:35:05 -0700 (PDT)
Date:   Thu, 25 Aug 2022 16:35:03 -0500
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
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8280xp-crd: Specify which LDO
 modes are allowed
Message-ID: <20220825213503.2appw3rguwnnuxw6@halaneylaptop>
References: <20220825164205.4060647-1-dianders@chromium.org>
 <20220825094155.3.Ie7d2c50d2b42ef2d364f3a0c8e300e5ce1875b79@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825094155.3.Ie7d2c50d2b42ef2d364f3a0c8e300e5ce1875b79@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 09:42:01AM -0700, Douglas Anderson wrote:
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
> Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 33 +++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index d6f272c71a47..f64d58e371bd 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -88,6 +88,9 @@ vreg_l3b: ldo3 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  			regulator-boot-on;
>  			regulator-always-on;
>  		};
> @@ -98,6 +101,9 @@ vreg_l4b: ldo4 {
>  			regulator-max-microvolt = <912000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l6b: ldo6 {
> @@ -106,6 +112,9 @@ vreg_l6b: ldo6 {
>  			regulator-max-microvolt = <880000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  			regulator-boot-on;
>  		};
>  	};
> @@ -120,6 +129,9 @@ vreg_l1c: ldo1 {
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c: ldo7 {
> @@ -128,6 +140,9 @@ vreg_l7c: ldo7 {
>  			regulator-max-microvolt = <2504000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l13c: ldo13 {
> @@ -136,6 +151,9 @@ vreg_l13c: ldo13 {
>  			regulator-max-microvolt = <3072000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> @@ -151,6 +169,9 @@ vreg_l3d: ldo3 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l4d: ldo4 {
> @@ -159,6 +180,9 @@ vreg_l4d: ldo4 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l6d: ldo6 {
> @@ -167,6 +191,9 @@ vreg_l6d: ldo6 {
>  			regulator-max-microvolt = <880000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7d: ldo7 {
> @@ -175,6 +202,9 @@ vreg_l7d: ldo7 {
>  			regulator-max-microvolt = <3072000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l9d: ldo9 {
> @@ -183,6 +213,9 @@ vreg_l9d: ldo9 {
>  			regulator-max-microvolt = <912000>;
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

