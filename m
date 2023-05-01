Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6D16F3304
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbjEAPhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbjEAPhf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:37:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A6510CB;
        Mon,  1 May 2023 08:37:32 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aaea43def7so11467495ad.2;
        Mon, 01 May 2023 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682955451; x=1685547451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9FCZMBq11lAmej2VPmlV0pLjiGpnVUF7q2DXSb1+bA=;
        b=UKOmtk3HoA7k1VX4gOLi0r2AKJI4UDtuFBjBFkgKUs5O6/MLHJbYdpieyrlFVPPCSY
         DBgG3W4SrMLv7AKOoPQWOCXTmd0E8kDb0SpqcxsuXJLhw+Gq5vXCmfSYKkM5gdiyyzFe
         DYBJniO9kihWt1hC9umMvGkEJtGfLXToRXcByP0yIAwxSRO28RLhgiX4K5PZ+9lCA5KL
         DnaO6VlSNA01Rg7zajcrWQU9QMP0N2uaLEUqFxyVe7l1A3F2hYPJ6Nmi6yLvbklL6MQV
         KnP+EPcmJnodBOaXMkm5ulQJC7srDp8okcKInBH+QFr1ORee/Dg8PfP6wV6meqZ3JbU7
         voiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955451; x=1685547451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9FCZMBq11lAmej2VPmlV0pLjiGpnVUF7q2DXSb1+bA=;
        b=WHzPalvv4iXXgV967bFDOwmC+12Tcpuq50s8k2cRkldKxoqoKfin+B27btC4VUrSdj
         AozG54nRsH+MqjTFO6sQfOd/tobOUQ95jaXjKvpG/CrDkJTTiPvOLkLveEe64e1yfUzt
         DmpIz44avGumFZ0IN+xlz+m2ZEIhpUVVtPWpv2dSpLV0vGe0jH5wErNSbfuYqWSFuQ2W
         j2uw16GrlgIXpdZnwXJ9Dmdx4DghQh7WmE2mHDI7GiPcqACDdouKsh8GHy2ge1F9kfF8
         hmy3HBfEbXnq9Xhryp7TxnTqtSyohIRgahJ2F/6R0Vn7/E46gzV69Mxrg2jb44mEE7EA
         7Anw==
X-Gm-Message-State: AC+VfDxSr2CTlyKZ2Vn6G71U9BUIRsFVkTI8my19kdKKNchcW7fUhl7+
        4625cWpy6ZpUelnheGXry9A=
X-Google-Smtp-Source: ACHHUZ47tgq+hJhcF3+9cjGgSUuSG6zEbUXH8sgsaxmGPNFJMccTKMjygk07ZuYRNAyzIc5x6AVhjA==
X-Received: by 2002:a17:902:c609:b0:1aa:fe4f:9b8f with SMTP id r9-20020a170902c60900b001aafe4f9b8fmr1840259plr.39.1682955451287;
        Mon, 01 May 2023 08:37:31 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
        by smtp.gmail.com with ESMTPSA id jj2-20020a170903048200b001ab016e7916sm1018217plb.234.2023.05.01.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:37:28 -0700 (PDT)
Date:   Mon, 1 May 2023 23:37:19 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v6 13/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 orientation-switch for usb_1_qmpphy
Message-ID: <ZE_cr5X3UNKObsXd@Gentoo>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-14-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501121111.1058190-14-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 01:11:11PM +0100, Bryan O'Donoghue wrote:
> Switch on USB orientation-switching for usb_1_qmp via TCPM. Detecting the
> orientation switch is required to get the PHY to reset and bring-up the PHY
> with the CC lines set to the appropriate lane.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index b5cc45358a474..8935a8e327904 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1295,6 +1295,14 @@ &usb_1_qmpphy {
>  
>  	vdda-phy-supply = <&vreg_l9a_1p2>;
>  	vdda-pll-supply = <&vreg_l18a_0p92>;
> +	orientation-switch;
> +	ports {
Add new line before subnode
> +		port@1 {
> +			qmpphy_typec_mux_in: endpoint {
> +				remote-endpoint = <&pm8150b_typec_mux_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &usb_2 {
> @@ -1375,6 +1383,12 @@ pm8150b_role_switch_out: endpoint {
>  					remote-endpoint = <&dwc3_role_switch_in>;
>  				};
>  			};
you should add port@0 for usb_1_hsphy because it is required.

> +			port@1 {
Same
> +				reg = <1>;
> +				pm8150b_typec_mux_out: endpoint {
> +					remote-endpoint = <&qmpphy_typec_mux_in>;
> +				};
> +			};
>  		};
>  	};
>  };
> -- 
> 2.39.2
> 
> 
