Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A4D347C0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236516AbhCXPTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:19:07 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:45929 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbhCXPSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:18:55 -0400
Received: by mail-io1-f51.google.com with SMTP id k8so21874851iop.12;
        Wed, 24 Mar 2021 08:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mHWIX01g5QwAZ8qLk5RpjZQyq2xV+NH9VhPdBzNv998=;
        b=NLZ/SbkMReiudueDGuLUBu3Bae5GE0GT2v6AkGmQCVd6qdJZC4BVMniGDkHENt8VWd
         qR4kOHTzyA2r1vjkMD3aJ5HeaOhHWWDW95fThiDSHKQ60aDoXAj5nYbaCsV04cMnav6W
         t6FpBTMAuAij+J6pT2TD40LO3HjIlfepbMWQO/+/HrBEQ4FEt7GULM+WvcXXgUZhd9VK
         sCXRPnVuBN3KMpUx6LiH8XI8AxOBstfNyRslpIczy9GDZUla9q9yEOWY6B8B2bD/xCzm
         EvgNBdF1i0WbmTLWtpRgtff7RTOekiGztUulMxKDelClDgO9giCUeyPaVAKlRzp5AAQ6
         y11g==
X-Gm-Message-State: AOAM5300V1b4WTVKYqIzbI5AyBFOLlDvEkpY2VXNvbUX9kJgM4OXKaQi
        PuUDyOqq1jusKgtil13FbU9HzIo3pg==
X-Google-Smtp-Source: ABdhPJyYehFovzVqPSlDFqfKh5uY8GMU71gp2Kc8r4Nc+hKYTdtZOlPiFGXnKWZsYxztRDEZm1EN4A==
X-Received: by 2002:a5d:87d5:: with SMTP id q21mr2809629ios.105.1616599134524;
        Wed, 24 Mar 2021 08:18:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i67sm1264206ioa.3.2021.03.24.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:18:52 -0700 (PDT)
Received: (nullmailer pid 3084914 invoked by uid 1000);
        Wed, 24 Mar 2021 15:18:50 -0000
Date:   Wed, 24 Mar 2021 09:18:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn6750
Message-ID: <20210324151850.GA3083022@robh.at.kernel.org>
References: <1615481904-9400-1-git-send-email-gubbaven@codeaurora.org>
 <1615481904-9400-3-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615481904-9400-3-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 10:28:24PM +0530, Venkata Lakshmi Narayana Gubba wrote:
> This patch enables regulators and gpios for the Qualcomm Bluetooth wcn6750
> controller.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../devicetree/bindings/net/qualcomm-bluetooth.txt | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

This is a large change. Please convert to DT schema first.

> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 709ca6d..e70fcb7 100644
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> @@ -15,6 +15,7 @@ Required properties:
>     * "qcom,wcn3991-bt"
>     * "qcom,wcn3998-bt"
>     * "qcom,qca6390-bt"
> +   * "qcom,wcn6750-bt"
>  
>  Optional properties for compatible string qcom,qca6174-bt:
>  
> @@ -39,6 +40,26 @@ Optional properties for compatible string qcom,wcn399x-bt:
>   - firmware-name: specify the name of nvm firmware to load
>   - clocks: clock provided to the controller
>  
> +Required properties for compatible string qcom,wcn6750-bt:
> +
> + - enable-gpios: gpio specifier used to enable chip
> + - swctrl-gpios: gpio specifier is output from SoC,used to find status
> +		 of clock supply to SoC.
> + - vddio-supply: VDD_IO supply regulator handle.
> + - vddaon-supply: VDD_AON supply regulator handle.
> + - vddbtcxmx-suppl: VDD_BT_CXMX supply regualtor handle.
> + - vddrfacmn-supply: VDD_RFA_CMN supply regulator handle.
> + - vddrfa0p8-supply: VDD_RFA_0P8 suppply regulator handle.
> + - vddrfa1p7-supply: VDD_RFA_1P7 supply regulator handle.
> + - vddrfa1p2-supply: VDD_RFA_1P2 supply regulator handle.
> + - vddrfa2p2-supply: VDD_RFA_2P2 supply regulator handle.
> + - vddasd-supply: VDD_ASD supply regulator handle.
> +
> +Optional properties for compatible string qcom,wcn6750-bt:
> +
> + - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
> + - firmware-name: specify the name of nvm firmware to load
> +
>  Examples:
>  
>  serial@7570000 {
> @@ -67,3 +88,25 @@ serial@898000 {
>  		clocks = <&rpmhcc RPMH_RF_CLK2>;
>  	};
>  };
> +
> +serial@99c000 {
> +	bluetooth {
> +		compatible = "qcom,wcn6750-bt";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;
> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
> +		vddio-supply = <&vreg_l19b_1p8>;
> +		vddaon-supply = <&vreg_s7b_0p9>;
> +		vddbtcxmx-supply = <&vreg_s7b_0p9>;
> +		vddrfacmn-supply = <&vreg_s7b_0p9>;
> +		vddrfa0p8-supply = <&vreg_s7b_0p9>;
> +		vddrfa1p7-supply = <&vreg_s1b_1p8>;
> +		vddrfa1p2-supply = <&vreg_s8b_1p2>;
> +		vddrfa2p2-supply = <&vreg_s1c_2p2>;
> +		vddasd-supply = <&vreg_l11c_2p8>;
> +		max-speed = <3200000>;
> +		firmware-name = "msnv11.bin";
> +	};
> +};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
