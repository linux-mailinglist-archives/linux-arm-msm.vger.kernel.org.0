Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62DE6F32BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjEAPVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjEAPVT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:21:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5E510C1;
        Mon,  1 May 2023 08:21:17 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-24e0c29733fso736822a91.2;
        Mon, 01 May 2023 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682954477; x=1685546477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIW8hGeCn/ue9KjRFquGeBC2nEcAJQT+02yegm0SocM=;
        b=m2UHHXvRGgaSM8dENcJZiaVawtH2use02hDfKHt1qkzkzchJvNWhEyG/bJEBdAFqWY
         oQlQFJ0YH4fPtC0itJsVLNMiOPbkV330f6+au788eu1b72Hs9avGA+AzErA7IvftMzlD
         s/L3Gh4Jhin/76f0aMghP4/aD3uralJbyZGpdPxr1sHXaYl049jzvs9WC9WBk9kPEvyz
         ZSb2opy6hXUSi3RfxuIsfVAozh2Yk75uGSqDKt+JTxJ4rQkUkpROVa0wuw9qIdr6Ycuv
         vYyHffHBMtSzlqP5dxN+L9/CbhtxiFxa8aUz+94Hvv3qzoVPQCbO6mA+OWe2hvSPVgU2
         TWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682954477; x=1685546477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIW8hGeCn/ue9KjRFquGeBC2nEcAJQT+02yegm0SocM=;
        b=WKRE7BpGHsrrPt/SUtNASAtekZxYHjdwHJSRuOGkfVqeKOMCSCQ6Th/OS2CAoNd2jw
         ON4cmtL8guHoNdG/diDndGfPDdtWPqKVKoDpI2NmjPe1F3cxWIpy5JWYHAV6Oplb7xv+
         FzPWFsS6sw+PuThkOxhEeMoHgA7D0BnXAgyUpRRRuvR4hKIfxG6SV3o+Y7dqbYiW3lpv
         JplEamhYTC0GrjZ3Un6moeT8o5HNHfxCxtvQdIhsrpqGeWyJhbNaFC/ozx5wU2CkpX2V
         xhcQov57e5Ua9tmppLK4q+VLAr9AjpqIERKB+seWqqcExVP8p9Qt4cbTsESPP6RNKw/l
         4giA==
X-Gm-Message-State: AC+VfDwwDfMt6QjOd23JTGJ4hLERAYrbhpUt5pMFwRFPPzKJ01oYMPb0
        hJGlR6iC0Q2Zd++2fo8d4eY=
X-Google-Smtp-Source: ACHHUZ6QiwkjIxtXvOSW/qLrIvk3SCU2xO8RalT5TCxA8EqDnwm2+lhUK1ySph96OG1n9a8ar+28sQ==
X-Received: by 2002:a17:90a:bb17:b0:24d:d7fd:86c3 with SMTP id u23-20020a17090abb1700b0024dd7fd86c3mr7546946pjr.16.1682954477327;
        Mon, 01 May 2023 08:21:17 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
        by smtp.gmail.com with ESMTPSA id n4-20020a17090a928400b0024c1ac09394sm6157536pjo.19.2023.05.01.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:21:16 -0700 (PDT)
Date:   Mon, 1 May 2023 23:21:08 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Message-ID: <ZE_Y5BvxiimB9mu8@Gentoo>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 01:11:10PM +0100, Bryan O'Donoghue wrote:
> Switch on usb-role-switching for usb_1 via TCPM. We need to declare
> usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
> which provides the necessary signal.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 ++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 1e0b6fd59abc9..b5cc45358a474 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1273,7 +1273,13 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +	port {
> +		dwc3_role_switch_in: endpoint {
> +			remote-endpoint = <&pm8150b_role_switch_out>;
> +		};
> +	};
>  };
>  
>  &usb_1_hsphy {
> @@ -1359,5 +1365,16 @@ connector {
>  					 PDO_FIXED_DUAL_ROLE |
>  					 PDO_FIXED_USB_COMM |
>  					 PDO_FIXED_DATA_SWAP)>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pm8150b_role_switch_out: endpoint {
> +					remote-endpoint = <&dwc3_role_switch_in>;
> +				};
> +			};
This port node should be moved out to the block of pm8150b_typec rather than
usb-c-connector. Otherwise, 

[   10.998897] OF: graph: no port node found in /soc@0/spmi@c440000/pmic@2/typec@1500

> +		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index af16d3ba76b8e..af988328db6b9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3740,6 +3740,10 @@ usb_1_dwc3: usb@a600000 {
>  				snps,dis_enblslpm_quirk;
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +
> +				port {
> +					dwc3_role_switch_in: endpoint {};
> +				};
>  			};
>  		};
>  
> -- 
> 2.39.2
> 
> 
