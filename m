Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E683D615E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 18:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhGZPa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 11:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbhGZP2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 11:28:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2D1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 09:08:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso710427pjo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BHTk+Z+0QSOpCt1sappkmwhVqvSoFxs0RZxbYZqcDGg=;
        b=iG9Cnaei0YWF3dL5PXk9Go6U1qBL6VEUhK+y+da767lITj04u3O07EZ7CSEdmLxT6+
         z+WKSbAjjUAmr0Jf9C7enUdsjh6fO17iGTDgOt2KKuap7hWNAcEsM+RKTFdAskec1kLM
         hJNEtLjaGHW641moe7Qa5waVLuX+WKfSUuBzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BHTk+Z+0QSOpCt1sappkmwhVqvSoFxs0RZxbYZqcDGg=;
        b=svGtsV3DPtUQ33N+maPRbVA+gEyvTa9UI5wm/VWI9i4mIL5ffok2fTvHn7Uy5bctTh
         eVDKiMwNcmS43Ypp1oV0r6ibp+fT6PbBituG/P3VLDPbxFbUIAxipnX2TsxNQ0C7qY31
         dKCn9SZTErtMoCV9OQdeR37ebciu+n5BitNKEuKRzK0vFVXJOgVkscALKpbu1iuAJRwr
         CfP7Lv+l29pVY51KIRGpsys5W3HmDG2nu1WYSskP1x/J9zxpzn07V44xG7+PaUeBERVj
         DdICcynmdWfF1pDnEgqQU/RA4iiyYPJu1+daW6p0gq5AYd+7a9G0UIF/OPT1PGLC0T8/
         e3uw==
X-Gm-Message-State: AOAM533sq2PDFyCnN0cEkRXCtOfohfNREHPIV/Ny1syY6D2wnypQpniI
        ReMw+jFBkDVqLViSCeKzhonbwA==
X-Google-Smtp-Source: ABdhPJwboRD80dRmLYgrVd44lIf45dc8GDVX9YVZCQF81QLG7Tl1Q2ldVi03GG90aHmZI1321dPhiA==
X-Received: by 2002:a63:1656:: with SMTP id 22mr19008943pgw.163.1627315679965;
        Mon, 26 Jul 2021 09:07:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f794:2436:8d25:f451])
        by smtp.gmail.com with UTF8SMTPSA id m1sm484988pfc.36.2021.07.26.09.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 09:07:59 -0700 (PDT)
Date:   Mon, 26 Jul 2021 09:07:58 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7280: Add QSPI node
Message-ID: <YP7d3gZGnfj9YqSY@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-2-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1627306847-25308-2-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 26, 2021 at 07:10:44PM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Add QSPI DT node for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
> Changes in V4:
>  - As per Stephen's comment updated spi-max-frequency to 37.5MHz, moved
>    qspi_opp_table from /soc to / (root).
>    
> Changes in V3:
>  - Broken the huge V2 patch into 3 smaller patches.
>    1. QSPI DT nodes
>    2. QUP wrapper_0 DT nodes
>    3. QUP wrapper_1 DT nodes
>    
> Changes in V2:
>  - As per Doug's comments removed pinmux/pinconf subnodes.
>  - As per Doug's comments split of SPI, UART nodes has been done.
>  - Moved QSPI node before aps_smmu as per the order.
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 27 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 62 +++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 73225e3..b0bfd8e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -269,6 +269,20 @@
>  		};
>  };
>  
> +&qspi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <37500000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -346,6 +360,19 @@
>  
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>  
> +&qspi_cs0 {
> +	bias-disable;
> +};
> +
> +&qspi_clk {
> +	bias-disable;
> +};
> +
> +&qspi_data01 {
> +	/* High-Z when no transfers; nice to park the lines */
> +	bias-pull-up;
> +};
> +

This configures the SPI flash of the SC7280 IDP board, which is neither
mentioned in the subject nor the body of the commit message. IMO this
should be split out into a separate patch.
