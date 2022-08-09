Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574A558E188
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 23:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiHIVLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 17:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiHIVLm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 17:11:42 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1255E31B
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 14:11:39 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10bd4812c29so15480841fac.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=0RDlI0yOZFKLzfsXOiJhSEf3VmQ/yEncp6iJ3cB4fto=;
        b=gMasx+0sDjRymuLWGt9b7mXSG5oWJydXMpw9X46dcNXprWjNn48EPwebcrs61YCsgv
         0rCLP6e5Z6aVOtJKVpYWqBFdk9JTfPWxh4Dx6aecrZXlwWaqMSfmUEaYBgrDmWK4gyv7
         s/1CoZljQU/Xv48NHvR/z9cFORA+T+mDbX3JmnE8mfvQhVO4mhDnIDnlrmC/fln4L8Ky
         Ku/GzFC+NkTh/IXenqQPvCJcWPcrpyNkhSTr2tI4xYdpofLdSj9RFkS13/2K6xOlwAbn
         kIVpAaV6354QUOirWlVKniNri7W5et4VYRcd5M87hQlMJXcu26xskMLjwKkXHAN2ljH9
         1ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=0RDlI0yOZFKLzfsXOiJhSEf3VmQ/yEncp6iJ3cB4fto=;
        b=c0hfZQlyq7pYoY773e5PL0KeFjmwa0yZ42Uymuxv45n/1ea/0nuMpC/+DF9oYq45TJ
         zKGzzz6dDEAQFC1v8Sn81vatHmeCi9I3A8+Kv+YZIh2lls8RPrvyMG83yCcNta2Sx+I0
         uCzzALWDm9rFMvYc8g8IoIWtJpSuQKmQL+Bwcs14zg76irtf3DQXEqETCAdyosaVAtQ5
         FjtfDL1TEvWLkOZOOHnG2YU58VsbBOifcQ+wP8cUYCKyxs7IWX5+97DtMpR2ZVHPqLzS
         Z0NWa6/fxYfqfbEIVZYSt6gIxNPK+Y2UBJ67ImgRXtGO8RLwmRqnhIJZ4ys89X60CrVb
         lHMQ==
X-Gm-Message-State: ACgBeo1uaYtPugw1Ja0ascxSTztxQzcLWsX6qpI5Qqdqt+UnVPHUKUj2
        bZFd6qcXdCKDbaSG1ytZ1CoNyA==
X-Google-Smtp-Source: AA6agR5Dm0fRPPYug/WAD/FJ+8g5sch6O4DIf560RcIw2R1zzt4YkkkbsV4kVW1csUcD7MQX3u72qg==
X-Received: by 2002:a05:6870:3281:b0:10e:4d35:dcb2 with SMTP id q1-20020a056870328100b0010e4d35dcb2mr149316oac.283.1660079499050;
        Tue, 09 Aug 2022 14:11:39 -0700 (PDT)
Received: from baldur ([2600:380:785a:7aa8:200:ff:fe00:0])
        by smtp.gmail.com with ESMTPSA id s9-20020a056870630900b0010c17e6c699sm3391992oao.47.2022.08.09.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:11:38 -0700 (PDT)
Date:   Tue, 9 Aug 2022 16:11:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shinjo Park <peremen@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ARM: dts: qcom: msm8960: add the device node of
 USB1
Message-ID: <YvLNhO4DmeaF2GyM@baldur>
References: <2654048.mvXUDI8C0e@ainazi>
 <20220803074608.21048-1-peremen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803074608.21048-1-peremen@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Aug 02:46 CDT 2022, Shinjo Park wrote:

> Use the same USB definition as qcom-apq8064.dtsi, tested on Casio GzOne.
> 

I think this looks good, but I have a v2 of patch 1 and a v3 of patch 2,
and I don't seem to have patch 3 in my inbox(?)

Can you please resubmit the 3 patches with a --cover-letter, instead of
each patch being a reply of the previous instance of that particular
patch? This will make it much easier for me to merge the end result.

Thanks,
Bjorn

> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> ---
> 
> v3:
>  - Include missing clock/qcom,lcc-msm8960.h to make cleanly applicable
> 
> v2:
>  - Rewrite commit message
>  - Reorder status line
> 
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 33 +++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index e14e1c5d1..0e099aa7c 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -3,6 +3,8 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
> +#include <dt-bindings/clock/qcom,lcc-msm8960.h>
> +#include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  #include <dt-bindings/mfd/qcom-rpm.h>
>  #include <dt-bindings/soc/qcom,gsbi.h>
>  
> @@ -167,6 +169,37 @@ regulators {
>  			};
>  		};
>  
> +		usb1: usb@12500000 {
> +			compatible = "qcom,ci-hdrc";
> +			reg = <0x12500000 0x200>,
> +			      <0x12500200 0x200>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> +			clock-names = "core", "iface";
> +			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
> +			assigned-clock-rates = <60000000>;
> +			resets = <&gcc USB_HS1_RESET>;
> +			reset-names = "core";
> +			phy_type = "ulpi";
> +			ahb-burst-config = <0>;
> +			phys = <&usb_hs1_phy>;
> +			phy-names = "usb-phy";
> +			#reset-cells = <1>;
> +			status = "disabled";
> +
> +			ulpi {
> +				usb_hs1_phy: phy {
> +					compatible = "qcom,usb-hs-phy-msm8960",
> +						     "qcom,usb-hs-phy";
> +					clocks = <&sleep_clk>, <&cxo_board>;
> +					clock-names = "sleep", "ref";
> +					resets = <&usb1 0>;
> +					reset-names = "por";
> +					#phy-cells = <0>;
> +				};
> +			};
> +		};
> +
>  		acc0: clock-controller@2088000 {
>  			compatible = "qcom,kpss-acc-v1";
>  			reg = <0x02088000 0x1000>, <0x02008000 0x1000>;
> -- 
> 2.34.1
> 
