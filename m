Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4843F23BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 01:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236933AbhHSXjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 19:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236872AbhHSXjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 19:39:21 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D408C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 16:38:44 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id bd1so10794427oib.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 16:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xct87dPQUKJVUu3N8FqHnD1YvrlqEBt4s0ORd5SdpdM=;
        b=eudFGYTfZ16z1QhF2vBkVkOEGuyji6cJHYfDN+vaWhHK9+rd5vH14VbxAFS+2eC/Oa
         4Ba8R/88FJ/OPWCZCtBMsieEh/pm7qtYFwo0TirY0lTm7yCkB4ikLG4icFgNZa27zUvD
         BJBWXenoc7pm9fKQWpviuAKcgL8Df47rbgz6yQURrhmHOtRSecJ10uQ/D9jJoKjchcaT
         N88vkjjFz7L88TbHiR07A5xpRDrDWzx7jyyWYQNuz4UGLkZj+Y+eCNAqTYc3PrKVQ9mE
         uxtGqO5cni67yc6BYcRmxcxcBMWHGdqV0DZH4RZws/7uEVXHrYjTkJDfXhbO+YTxMWd0
         nkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xct87dPQUKJVUu3N8FqHnD1YvrlqEBt4s0ORd5SdpdM=;
        b=IO5CCwyRsMbsZe5g7t25UrnNSmoIB/4Gc5469x5j4sqlsMV6D7eRHPsBZcgh7Vb43I
         bJot1d37pt2NUCj4Bo+VihDGEz5V1yDLD2lIw4dOhr1sxvOusLMIGFWEjNkmgnMJrjTt
         haVxrVZtx3pgF89lZcC6rN29CxXzuh4+cXRBOc8ZxLPdtXOJ+BrfmPd1IwdzppPo9+J6
         dszXwSHSBchdfnUsZiCn4badVgxVK6woAx5oX+dcLdrs3bfJKnIQtDZDladFxeMQy3Vz
         GxEVqrKUysxqZypTdu/P1+Hn/MUdKKXjUSSvBR69BZgYx3/MMq+AVzX5HfvZKFgcekQt
         DahQ==
X-Gm-Message-State: AOAM530DuHVQ7OwVTG/inREStZHT5a1M+4jYuyI0545ROQp9pj2e7GlW
        EWtF97fIdicXjllzvDsE291DfQ==
X-Google-Smtp-Source: ABdhPJwkOK+fwhCjDa07/ZAhRRmQGSXN+VsHKhGQP49+rc5kMdF59S4PHF0J6u327Ln2bdc4Y0LlgA==
X-Received: by 2002:a05:6808:1494:: with SMTP id e20mr861952oiw.111.1629416323497;
        Thu, 19 Aug 2021 16:38:43 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j2sm999557oia.21.2021.08.19.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 16:38:43 -0700 (PDT)
Date:   Thu, 19 Aug 2021 16:40:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [RFC PATCH 11/15] arm64: dts: qcom: sdm845-db845c: switch
 bt+wifi to qca power sequencer
Message-ID: <YR7r1sWrLR18vGzr@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817005507.1507580-12-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:

> Switch sdm845-db845c device tree to use new power sequencer driver
> rather than separate regulators.
> 

LGTM!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 21 ++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       |  6 ++++++
>  2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 2d5533dd4ec2..c9b694e934d4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -629,6 +629,16 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&qca_pwrseq {
> +	status = "okay";
> +
> +	vddio-supply = <&vreg_s4a_1p8>;
> +
> +	vddxo-supply = <&vreg_l7a_1p8>;
> +	vddrfa-supply = <&vreg_l17a_1p3>;
> +	vddch0-supply = <&vreg_l25a_3p3>;
> +};
> +
>  &sdhc_2 {
>  	status = "okay";
>  
> @@ -916,10 +926,8 @@ &uart6 {
>  	bluetooth {
>  		compatible = "qcom,wcn3990-bt";
>  
> -		vddio-supply = <&vreg_s4a_1p8>;
> -		vddxo-supply = <&vreg_l7a_1p8>;
> -		vddrf-supply = <&vreg_l17a_1p3>;
> -		vddch0-supply = <&vreg_l25a_3p3>;
> +		bt-pwrseq = <&qca_pwrseq 1>;

I suppose there will be a DT binding and some defines for the WiFi/BT
argument to &qca_pwrseq?

Regards,
Bjorn

> +
>  		max-speed = <3200000>;
>  	};
>  };
> @@ -1036,9 +1044,8 @@ &wifi {
>  	status = "okay";
>  
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> -	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> -	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> -	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +
> +	wifi-pwrseq = <&qca_pwrseq 0>;
>  
>  	qcom,snoc-host-cap-8bit-quirk;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0a86fe71a66d..78e889b2c8dd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1051,6 +1051,12 @@ psci {
>  		method = "smc";
>  	};
>  
> +	qca_pwrseq: qca-pwrseq {
> +		compatible = "qcom,wcn3990-pwrseq";
> +		#pwrseq-cells = <1>;
> +		status = "disabled";
> +	};
> +
>  	soc: soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -- 
> 2.30.2
> 
