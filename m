Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552046F32F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbjEAPfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjEAPfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:35:46 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5CB118;
        Mon,  1 May 2023 08:35:45 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-24e14a24c9dso362148a91.0;
        Mon, 01 May 2023 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682955345; x=1685547345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvbKDKllPH9+/Eoa36DwBvRS2i1Z5edSn4diVeMZ3wI=;
        b=buuyAHLv8SsxnOLAvaiPZ7tw4nVUpulkjeeQVub1/ffQCE1o7kQHlE4Iz+ikeTTMg7
         MQFDAOvh3HrLmP5ZKEZshsoofRr2nz8TjRWgqBRcslv6KNFLK78OIl0eXQHo9eZUREOA
         suMxFO/MzBDQtI7KEzi9l1xjuW8fIObrI2IwXOjwBsfNNEyHt8qt7cOYt/e7WpxXVlLZ
         nSydv5bzVOYfkNfmRVzZRkfQLIsWwv6hPcZn2HRInacIDwThas9Xmg59u/gqer5mmrRD
         Mba6J3d3yfjwlAL0Wr1XwqmfGcSk/7V5unMNNwj7wQ4I7H93+lEUyeq7WK8JanuOShog
         RDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955345; x=1685547345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvbKDKllPH9+/Eoa36DwBvRS2i1Z5edSn4diVeMZ3wI=;
        b=INqXwcIPIDHDaOEn25EXqnVslL8zdJpd88k/pYthu6bDsAQ1X2Aw9trQiwUZSi4zN2
         WhqpcsZoFmme0LopX9xzHJQ8BdG8EmjpY7NE7ijRvB8VNREDkb98oB3jCq3iJXUCqhF4
         N7FpubGHl3Y3/G3sCxd9/70qcK1DxgPB2Q8POUiDk1esdEqYCIUWOTNSN0xSlg+eyw+L
         +C0wFMgJeTlf0wmwT2IJMAOh5dx9w/hUHRPooBQU2EmrSiAPNT1obtYSNME1Ncm1N/xD
         lfBOqss6jzaTTEgb+lJVQzTOQJ9eErZtGg3dCq3vUCr7o+eCsKVOdzjbi6XPolH7pyi1
         wYYA==
X-Gm-Message-State: AC+VfDwfDALSdwUMYEQ2xD7hhkDQS4Hh9jBL1NPLJaaWDyAfMUB+NtEo
        0etC5FM8DZ4l9HGYLCrSeUc=
X-Google-Smtp-Source: ACHHUZ7v02d9uOOOlignCO4TCRoNSZ2UJe239Lkm40nu7sO4R4FfdTmtt2zbhZ3mu9EuG5HqFdf1gg==
X-Received: by 2002:a17:90b:1a86:b0:234:28ac:ec4a with SMTP id ng6-20020a17090b1a8600b0023428acec4amr14084173pjb.2.1682955345217;
        Mon, 01 May 2023 08:35:45 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
        by smtp.gmail.com with ESMTPSA id ga14-20020a17090b038e00b00247abbb157fsm19487043pjb.31.2023.05.01.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:35:03 -0700 (PDT)
Date:   Mon, 1 May 2023 23:34:22 +0800
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
Message-ID: <ZE_b_sVAEd8Roz87@Gentoo>
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
Should add port@0 for usb_1_hsphy because it is required

> +			port@1 {
Add new line before subnode
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
