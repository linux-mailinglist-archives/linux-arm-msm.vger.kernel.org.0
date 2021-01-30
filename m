Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7353092F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 10:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbhA3ERG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 23:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbhA3Dsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 22:48:30 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3607FC0617AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jan 2021 19:47:41 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id x19so640570ooj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jan 2021 19:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nP75y4ZlajL2hHjYKNjPgV2d6UjbR2QsqHFCSmA9Tug=;
        b=EbQKlDL9Q0AC1ekv2k9jaEdwiQfys+GTv+HpiGBoUBXFl6HnnvlQBPa9kJi2i5Yw4Y
         SJlzsDH05ojH0EgVxnYvv1s6aUYWhTa91DWPSBXyc5zEegD3GLmvGl1oLjMqcG1WCDM/
         7bRYPVzupz0DROkGMhxCgQuOWTEKZdtYFpvrgmiwH+QLDdz81O9dH+wil0N1N6VbIh4K
         3WVvNwZUlsWro7rdwnwORgqP/UzYdF1a0RXwTAcfAqgqQ9ZCRq+S5hboT8qeViUFZrJt
         CdOK3i6PYFcXFlZrIk3l0OHxzgmRnc03E9vxToFQQU5pIolnSB71Mc/XxHBqsnUCZ6O/
         R9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nP75y4ZlajL2hHjYKNjPgV2d6UjbR2QsqHFCSmA9Tug=;
        b=Awo3y2YngNTIw/txhDDnG5Q4Z/kGc5oZh8gCYVKYa92xjBF+Y05GCwPS2mTgbrope+
         ZMCx9W0MV81nc0lPnC5dYcxJTYfXUeHU5mvVXkVg/EdcBzun91hvitfDie+AMBik1uGY
         ZF6DwtnkRhHTJh5hhmQAlXNZem3vQmaJ1UQQDTyr858MKHHqLZUyJ0ubpEyn7l4Wx+Yh
         6j/N9tfKc6i2VJJvrT7W/+3EzyJudUJnamTWHS3PwuKasQDPK5XA4dxE0o+5VEw7FwA1
         pYjS2mVbCjGLhYGuL1IK6b4S0KL8LJe9bPhzy/tQ8NYNOpi/iSkN+D4mNPwpVt9dRdDh
         YItg==
X-Gm-Message-State: AOAM5317RZKKRw2D/zD1+h8aHPMbmfFFuwgGllvjfn2uQ8Orv7iRDXbX
        Ez+cuQ8Lh5btP2PhZtOCbHHjcg==
X-Google-Smtp-Source: ABdhPJw+PYNPlKnGi2851SXcXGelsjzqO7Dy2YZ7mqAmciNAXHFBsBqoMoKN3XL5tGQg53QSAP/jew==
X-Received: by 2002:a4a:a5cc:: with SMTP id k12mr5164268oom.33.1611978460467;
        Fri, 29 Jan 2021 19:47:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t62sm2526969oif.2.2021.01.29.19.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 19:47:39 -0800 (PST)
Date:   Fri, 29 Jan 2021 21:47:37 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: qcom: dts: qrb5165-rb5: add qca6391 power
 device
Message-ID: <YBTW2et0IVCUGmdg@builder.lan>
References: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
 <20210128175225.3102958-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128175225.3102958-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Jan 11:52 CST 2021, Dmitry Baryshkov wrote:

> Add qca6391 to device tree as a way to provide power domain to WiFi and
> BT parts of the chip.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 61 ++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 8aebc3660b11..2b0c1cc9333b 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -151,6 +151,23 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
>  		regulator-max-microvolt = <1800000>;
>  		regulator-always-on;
>  	};
> +
> +	qca6391: qca6391 {
> +		compatible = "qcom,qca6390";
> +		#power-domain-cells = <0>;
> +
> +		vddaon-supply = <&vreg_s6a_0p95>;
> +		vddpmu-supply = <&vreg_s2f_0p95>;
> +		vddrfa1-supply = <&vreg_s2f_0p95>;
> +		vddrfa2-supply = <&vreg_s8c_1p3>;
> +		vddrfa3-supply = <&vreg_s5a_1p9>;
> +		vddpcie1-supply = <&vreg_s8c_1p3>;
> +		vddpcie2-supply = <&vreg_s5a_1p9>;
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		pinctrl-names = "default", "active";
> +		pinctrl-0 = <&wlan_default_state &bt_default_state>;
> +		pinctrl-1 = <&wlan_active_state &bt_active_state>;

I dislike the use of pinctrl states for toggling the level of the gpio
and would prefer that you use the gpio binding and api for this instead.

> +	};
>  };
>  
>  &adsp {
> @@ -1013,6 +1030,28 @@ &tlmm {
>  		"HST_WLAN_UART_TX",
>  		"HST_WLAN_UART_RX";
>  
> +	bt_default_state: bt-default-state {

Are you sure you need to drive the BT_EN pin in order to have WiFi
working? On QCA6174 I believe the "WL_EN" was actually RESET_N and BT_EN
was actually "blueooth enable" - so we wired that in the bluetooth node
instead.

> +		bt-en {
> +			pins = "gpio21";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	bt_active_state: bt-active-state {
> +		bt-en {
> +			pins = "gpio21";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-high;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	lt9611_irq_pin: lt9611-irq {
>  		pins = "gpio63";
>  		function = "gpio";
> @@ -1119,6 +1158,28 @@ sdc2_card_det_n: sd-card-det-n {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	wlan_default_state: wlan-default-state {

JFYI. You don't need this "dummy" subnode, you can put the properties
directly in the state node.

Regards,
Bjorn

> +		wlan-en {
> +			pins = "gpio20";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	wlan_active_state: wlan-active-state {
> +		wlan-en {
> +			pins = "gpio20";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-high;
> +			bias-pull-up;
> +		};
> +	};
>  };
>  
>  &uart12 {
> -- 
> 2.29.2
> 
