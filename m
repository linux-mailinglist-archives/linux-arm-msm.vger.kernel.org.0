Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1906F32E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjEAPaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbjEAPaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:30:22 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6F71710;
        Mon,  1 May 2023 08:30:21 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1aad5245632so14596585ad.3;
        Mon, 01 May 2023 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682955020; x=1685547020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p2EtvQqozv5XZUrroLdq3UfVWiShL29jBpkbhu5Yvek=;
        b=gXYsAKLwQ50QR5Nt/QylS0U7wH8XZ/1lB+CkB6Y04xa1qtwQw88Hkeime5fhsn3oeL
         MavyRJhNekQqVp5SzQZzr1t7WpalGdC5zkcn9UfGMBjY78MogmgoMkdWwDo0KeKDdQLp
         kpk6sSJIgW5FgdH03mKJ5Vebrhnrbk7qatX4jVB+L59lHnu21tWHEfuXLbTizPSEC2on
         IgaM/QlsAFjYzUxkL0QapTvpTzcPnyh8p+4XwHv0/5TwSh8sye+AhtpTESVRjh5ITLIm
         T25v6Sm4C5+UYatq78pS+BbcXCJEvWDFh/6YZHhyynsRBYO8/qu6o6gPg6jzsOfEIlV5
         W7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955020; x=1685547020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2EtvQqozv5XZUrroLdq3UfVWiShL29jBpkbhu5Yvek=;
        b=Lg79UO6cZzVTtsltskNf/AJ9T1Z8dwQUwMFIbseqi3ovejI8XR9GwRk+Lb/YSSFz0u
         olcygOJoWskekmgiizd6yaaFs5SIZIhQY3oqnaCPm/w4H9waobjUR13kSvPzCAi9v79H
         OjlP8A0Pr8jnEIMVc7fdn1Ojq0PjzwaBSmYAWLTVeBx7F5E0gz/C7A1A6y2k5tiGzZnX
         /kuJtIhVLAt21HYkWVcloQ1uGhks6ZP+CheyWQqwPmExyd55tJW1tNoW4W1FTfFHY9Vl
         6+uNdwsU5QUekq4il+7ziE+hdl+jpNsQ4zm07QNcjxzAJDy0v5ZLvHMi1soHNUpEhS0k
         e1aw==
X-Gm-Message-State: AC+VfDzuoXUT44epP+5BHPDBHtvYCqgoCaPrOaAgwmixMai+/ktQrcMk
        SLNth71RF9isBL6wRSP60j2NQal1BNNYoHR/
X-Google-Smtp-Source: ACHHUZ5JCoIWoTwvZB+LFgGmicG+Kc7LesZkyMmboM+n4Z33ki1alRPl44HsgQ5QG73pVpqd2A58cg==
X-Received: by 2002:a17:903:648:b0:1aa:d1fe:9520 with SMTP id kh8-20020a170903064800b001aad1fe9520mr7672291plb.20.1682955020587;
        Mon, 01 May 2023 08:30:20 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
        by smtp.gmail.com with ESMTPSA id az6-20020a170902a58600b001a1ca6dc38csm17947863plb.118.2023.05.01.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:30:20 -0700 (PDT)
Date:   Mon, 1 May 2023 23:30:12 +0800
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
Message-ID: <ZE_bBKPYDiWI_WEZ@Gentoo>
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
Add new line before subndoe
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
Same
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pm8150b_role_switch_out: endpoint {
> +					remote-endpoint = <&dwc3_role_switch_in>;
> +				};
> +			};
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
