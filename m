Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7194F3EA7EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 17:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238248AbhHLPqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 11:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238025AbhHLPq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 11:46:29 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D991C0617A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 08:46:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id b7so7835326plh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dwk5L2MpOulYe6pRzNF9OUp6M0ggFhdZIW74sN75qi0=;
        b=ehFUTy2BHWlvdA8vgjz8PIQTASRmN1GADXs6tiMRnUutjlx2irkyPcS0GfKMgPdek4
         HuuqXMHFMg8Od+JPchGJAD0WOWRa6Z+icb98hUeVZf4bsDmlVEi6PHRe0LhDSMFRdsH1
         ThjPRLS5joNJvGJ3FqplVCsER1zAQsqJ6P0UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dwk5L2MpOulYe6pRzNF9OUp6M0ggFhdZIW74sN75qi0=;
        b=LzdEQzMhNpbH9dDPLIcWoI+XjMxox7+CCZuQCVz+bF2SLJBV5fE4N3cP72RmP31uub
         gTGgEdCt4piCO/JTGvY4h087qT9wACXMr+PWS70KO9kpQUzBUTV829KFU9DiiJ5hOTur
         vSxBjBTesNEDiRGSc3XWIPt0s3xOyJj7JBLIZUe8xEYs3xz+LAZxyi8jt1GyxSZmLyru
         aiXjd0XRxNNn+LSNvtqHKkeDD1w6ovoO98tJcT9l6eVKTp3UIl1xC9WAcLhoK9C6Bplk
         uZ8t4k3PHcvry3GItSVuTGtvYW8u7b6WOmxIjCHRkBFMp+ARPx7NBskX2UD0wHvdSIbA
         r68Q==
X-Gm-Message-State: AOAM532uCyXc/Fk8tk4tEqu65JC4FFx08KM9WBUklsVbGZXbPCP8kGXQ
        1Q3QGC4Qo3JncTP0OVj7dZxPcQ==
X-Google-Smtp-Source: ABdhPJzrQhQ8LMVgm0wqd0ZDzBIqrIopYqXqGXmzsZRKSRLr9eOwL0eJH/QGsBycHk4xcPRe2HVFQA==
X-Received: by 2002:aa7:90c9:0:b029:307:49ca:dedd with SMTP id k9-20020aa790c90000b029030749cadeddmr4746287pfk.9.1628783164040;
        Thu, 12 Aug 2021 08:46:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6683:43e5:ba4c:d76c])
        by smtp.gmail.com with UTF8SMTPSA id m4sm10693720pjl.6.2021.08.12.08.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 08:46:03 -0700 (PDT)
Date:   Thu, 12 Aug 2021 08:46:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V5 4/7] arm64: dts: sc7280: Update QUPv3 UART5 DT node
Message-ID: <YRVCOS6SZGRM003t@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-5-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1628754078-29779-5-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 01:11:15PM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Update the compatible string as "qcom,geni-uart".
> Add interconnects and power-domains. Split the pinctrl
> functions and correct the gpio pins.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e461395..2dc7e8c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -861,13 +861,18 @@
>  			};
>  
>  			uart5: serial@994000 {
> -				compatible = "qcom,geni-debug-uart";
> +				compatible = "qcom,geni-uart";
>  				reg = <0 0x00994000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
>  				pinctrl-names = "default";
> -				pinctrl-0 = <&qup_uart5_default>;
> +				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>, <&qup_uart5_tx>, <&qup_uart5_rx>;
>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
> +						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
> +				interconnect-names = "qup-core", "qup-config";
>  				status = "disabled";
>  			};
>  
> @@ -2255,9 +2260,24 @@
>  				function = "qup04";
>  			};
>  
> -			qup_uart5_default: qup-uart5-default {
> -				pins = "gpio46", "gpio47";
> -				function = "qup13";

sc7280-idp.dtsi references this node, so if this patch is applied the SC7280
IDP DT would be broken, unless "[5/7] arm64: dts: sc7280: Configure debug
uart for sc7280-idp" is also applied. I think you need to squash the two
patches.
