Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57CE34DF63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC3Dcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhC3DcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:32:17 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1D4C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:32:16 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so14290561oty.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i2x/X9BG63R//CVLfSoE0M4KR4xNiPeiHIWesuqNXQg=;
        b=hMekMY8xTYLPRNDqnA+0imQMhad461ftjU5eP/+mf/CZ/k++ps0jhGHZZ/3GZT38gJ
         OYWq8SQQv52tqliPkoRTSe48ZsO/BQ4O1uZTqGehyB4eNFAWUQooPRWDN1yRS1zM8eQ0
         xxOJXW5qCILG1qelliq4BhJ0BrvXhIw8SKFZ+Trk6pExuJgeBnzsb6NKm6dQmfOlEYDE
         0a2aeJMUacJlA9kyNy0vBygD2lZ3BeF23giehHJjsuBL4gD0xRbl1r725KJv5878EBOH
         meQcPDGcvEZ76LWfiIoIhFK7rUTHV6HMFBuyGF9yRkzg4XT3EyQDnJai1TxIeyste2r6
         LAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i2x/X9BG63R//CVLfSoE0M4KR4xNiPeiHIWesuqNXQg=;
        b=TDWxMnE6R3P6BrVcbjANHK5cOHiISD/eoDUEE0Naab+K0Uyc80wemT0LgmeKwbc+92
         NjWqRI8PvxcGjpbqoklE1nvLRcqnznz2WeNn44IRGYGFjI8KZ/s5QKxF5QPCqiQy9mU6
         Q0hV0SAUWO+W9/Z0mRrokG09wlpIzRzIiv39i9g+d1Tqpf0nb5kU9448ifIWyMVzrFbU
         wX9ipN5ekEg9LLnnxY3rPKzpwdPMpAv9LCl9NG9tKIHwBRxIVXvDg/tbdaKNlQi4mRUw
         LfcBUKkfejqo7NL4uhrP/bLP3j7QU8OlARMuomAl/UXeVPdIKMp4R08OhRM41lARaxwo
         NnkQ==
X-Gm-Message-State: AOAM530QziOljcqPyg1EngMnoL3RkbO0lt06676WGWsqOPLARk2sBeHS
        V+oDUSahxYThzBrxZzm7FQDz3w==
X-Google-Smtp-Source: ABdhPJxsln1U2m1k+HQ5cLe+ywzbiHn8tOkGFBZBq7QPXmwIiDtU3emRaud6vI5YtnvpQZWzaM9UMQ==
X-Received: by 2002:a9d:624f:: with SMTP id i15mr25198184otk.6.1617075135673;
        Mon, 29 Mar 2021 20:32:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c7sm4133937oot.42.2021.03.29.20.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:32:15 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:32:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: sm8250: switch usb1 qmp phy to
 USB3+DP mode
Message-ID: <YGKbvc//txcWJtA+@builder.lan>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
 <20210328205257.3348866-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328205257.3348866-7-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 28 Mar 15:52 CDT 2021, Dmitry Baryshkov wrote:

> USB1 QMP PHY is not just a USB3 PHY, but USB3+DP PHY. Change device tree
> nodes accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Vinod, will you let me know when you've picked the driver changes so I
can pick the two DT patches?

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 947e1accae3a..0f79e6885004 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2097,12 +2097,11 @@ usb_2_hsphy: phy@88e4000 {
>  		};
>  
>  		usb_1_qmpphy: phy@88e9000 {
> -			compatible = "qcom,sm8250-qmp-usb3-phy";
> +			compatible = "qcom,sm8250-qmp-usb3-dp-phy";
>  			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x20>;
> -			reg-names = "reg-base", "dp_com";
> +			      <0 0x088e8000 0 0x40>,
> +			      <0 0x088ea000 0 0x200>;
>  			status = "disabled";
> -			#clock-cells = <1>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> @@ -2116,7 +2115,7 @@ usb_1_qmpphy: phy@88e9000 {
>  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
>  
> -			usb_1_ssphy: lanes@88e9200 {
> +			usb_1_ssphy: usb3-phy@88e9200 {
>  				reg = <0 0x088e9200 0 0x200>,
>  				      <0 0x088e9400 0 0x200>,
>  				      <0 0x088e9c00 0 0x400>,
> @@ -2128,6 +2127,20 @@ usb_1_ssphy: lanes@88e9200 {
>  				clock-names = "pipe0";
>  				clock-output-names = "usb3_phy_pipe_clk_src";
>  			};
> +
> +			dp_phy: dp-phy@88ea200 {
> +				reg = <0 0x088ea200 0 0x200>,
> +				      <0 0x088ea400 0 0x200>,
> +				      <0 0x088eac00 0 0x400>,
> +				      <0 0x088ea600 0 0x200>,
> +				      <0 0x088ea800 0 0x200>,
> +				      <0 0x088eaa00 0 0x100>;
> +				#phy-cells = <0>;
> +				#clock-cells = <1>;
> +				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +				clock-names = "pipe0";
> +				clock-output-names = "usb3_phy_pipe_clk_src";
> +			};
>  		};
>  
>  		usb_2_qmpphy: phy@88eb000 {
> -- 
> 2.30.2
> 
