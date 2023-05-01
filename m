Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FEA6F32DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjEAP2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjEAP2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:28:52 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4F6D2;
        Mon,  1 May 2023 08:28:46 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-24b725d6898so1638440a91.2;
        Mon, 01 May 2023 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682954926; x=1685546926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VkcSOt/Gzi9QBKAIM2mIsqPI2pYq+Ao2+UfznD2y144=;
        b=ZckyGJmJAtfcDf/ni4a3IlPazkUco2N3YGFFG5/wCGH5oKnvS+16OTh6nxfs67pyde
         MrqEXb9SYx9QD5xqhrVdhYloaEXWoWRP90C0cIhb35QV4q4f/O9KxpTUw/Cdm5l8rRdU
         TBLYxL/ZBLhGXf+xHr4HhMS31MFTv/JGQIgvZgVlBDWyQ+3OmKMgo2RF48Jz25whj2dj
         JlLLG8GUFhAj+4ahE9WruUjzNRUxUj8FVA/LwFra/3DjwpYqa2cSQwy9JpNPlnDUSOUX
         rPnTs3/n3d0j0EkGYlCaUTS24ScbRdwOJe2dgA1S3IOyBodsiI93eh8DqjMnfqAOtvQv
         LBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682954926; x=1685546926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkcSOt/Gzi9QBKAIM2mIsqPI2pYq+Ao2+UfznD2y144=;
        b=RuZ4NigsKx85rqUdkBbKjazClZs/2uGTYSZkVCb7YpTQywlG1/QVp9486RrYtaoN28
         wZTTaXSMcFV0VDJW5qbSvlwUW8RalzgMqOcZT4CtIGbxn/aLCMT0qi9ruq0G0Z0/dxfH
         vbP0krKpdwR3eoTmGmlWr5c4BTm6Pgw+iwxffs3ZZ2UsP5VKMnIRqllOobc1+Vb0BUwM
         K+UkvYX8sux1Ez3bbDh0h0uUqJMv4yD9D2yRtoqQurt1845qrbfxGPfIgYbeqFdrjwbI
         1SOkS3YBdI42rOS+mIa96R+6+r9zIgnOCqG9jwibORwMLW/6n0vrV85IW7A4KYMUqaJQ
         EG3g==
X-Gm-Message-State: AC+VfDzl1gS/XTWWUQIOPaXM5vkg3GvwKTEivfUqKcgxiDHKJIaSTIoC
        I76ojRetUW5Hr2y0N/gP+Dw=
X-Google-Smtp-Source: ACHHUZ54hAhGIai+2zBKZhNtWwOBX4FU+K/7uBuJkpV82jgeAHOlQwMi7UYriu0/0q+RS2sXjEOXRQ==
X-Received: by 2002:a17:90b:1b4c:b0:233:ee67:8eb3 with SMTP id nv12-20020a17090b1b4c00b00233ee678eb3mr14814752pjb.24.1682954925901;
        Mon, 01 May 2023 08:28:45 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902ec8d00b0019e60c645b1sm9426823plg.305.2023.05.01.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:28:45 -0700 (PDT)
Date:   Mon, 1 May 2023 23:28:38 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v6 11/13] arm64: dts: qcom: qrb5165-rb5: Switch on basic
 TCPM
Message-ID: <ZE_aprcJ-GELBIcb@Gentoo>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-12-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501121111.1058190-12-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 01:11:09PM +0100, Bryan O'Donoghue wrote:
> Switch on TCPM for the RB5. Here we declare as a source only not a sink
> since qrb5165 doesn't support powering exclusively from the type-c port.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index b326bdeeb7742..1e0b6fd59abc9 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -1344,3 +1345,19 @@ &pm8150b_vbus {
>  	regulator-max-microamp = <3000000>;
>  	status = "okay";
>  };
> +
> +&pm8150b_typec {
> +	status = "okay";
> +	connector {
Add new line before subnode
> +		compatible = "usb-c-connector";
> +
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 3000,
> +					 PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)>;
> +	};
> +};
> -- 
> 2.39.2
> 
> 
