Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432C739CC97
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 05:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFFDw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 23:52:59 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44770 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhFFDw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 23:52:57 -0400
Received: by mail-ot1-f52.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so13279144otp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 20:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4rqhGjnDlpC1oNukvP0eTeh77UaYLbqMMQo6bxEo8l0=;
        b=DaHACcopN32+0wLXCuZjlfPuqdZ+qlJPu68BA/6gxWPWGQ1YVqHyEftSobGd3QGl8S
         JKM4Qk101Um4jiTzKiRR/IigX1KkfJ3eKQeddtRXJjOP7m+g2hrOFNQqHyZ2IgFdG6xM
         Vsf/A3C1qpIu5cSaVwY+XF4eob71fEfPu0bl/M03Hh+0k23LrsJclZVSto2bGivuFRN2
         RvCzeG4aH/nKKPtJPoJgTyJ1zSUqAql1CPSdWmnMeXtcC9G1VgB+xoe+l7w9aydKGAw9
         MdfpTuuF6F8q9Yi3xAzxYIvuZCD/UqZoKNzGr3T4eXlrZGb+VnOHD6MygVHNjSjZNKmM
         Rwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4rqhGjnDlpC1oNukvP0eTeh77UaYLbqMMQo6bxEo8l0=;
        b=GFgn0FTSAFbjF3/BfC1uFR9ygxVRNzU6eEdeHEbZ5tY+8kVcin1tmo9hQSq4PTd2lv
         09GF+PBgWzxFnaBWVDzcTA4GMjXEZ8T0Nl81jWKUhcB658hg7KvWH0cdhyBLOw1p44h6
         B981fqNWkxIJCKcCC9cC6wgfYVahlcfsOxdNK7tORobbudTK3uCKsclKTjFH6/62hS7n
         cHoB0ACDOVD2TRiLcfFkX1s8t83Pyt/Rln/wP8aso6z5vxFqSwsbWIRuVzxwLnsj753e
         vHD8R3vsSmPoUXUB2LBPq1QfrP3ZIumIMANuVlwbU1Gry4YDSkX+eI5wK0eL9SiAiYHY
         ndQA==
X-Gm-Message-State: AOAM530PpIK24xip82euLdH4HSnpsILwdQBdAQS8tcrkE3c6PgD2Wf6l
        3Q48oeEiRC6h0yWZ0fki8U1wOQ==
X-Google-Smtp-Source: ABdhPJzr9Ti3c1odUbilk5W5+gzqQrUKOyFr3FdZNtNWxEB2/vX/u2LcvU2DIX9ITYtMFlm7+l6U9g==
X-Received: by 2002:a05:6830:1d64:: with SMTP id l4mr8940386oti.95.1622951397192;
        Sat, 05 Jun 2021 20:49:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a24sm1466630otr.3.2021.06.05.20.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 20:49:56 -0700 (PDT)
Date:   Sat, 5 Jun 2021 22:49:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 2/3] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <YLxF4rGFDrFXQRDi@builder.lan>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-3-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604135439.19119-3-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:

> Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
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
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  97 ++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 750 +++++++++++++++++++++++-
>  2 files changed, 835 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index d0edffc15736..f57458dbe763 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -292,6 +292,16 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&uart7 {
> +	status = "okay";
> +
> +	/delete-property/interrupts;
> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>  
>  &qspi_cs0 {
> @@ -307,16 +317,87 @@ &qspi_data01 {
>  	bias-pull-up;
>  };
>  
> -&qup_uart5_default {
> -	tx {
> -		pins = "gpio46";

Commit message says "add stuff", but somehow uart5 is no longer
gpio46/47 and these gpios are no longer specified.

Can you roll this in a way where the giant patch actually _only_ adds
a whole bunch of stuff?

> -		drive-strength = <2>;
> -		bias-disable;
> +&qup_uart5_tx {
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +

Regards,
Bjorn
