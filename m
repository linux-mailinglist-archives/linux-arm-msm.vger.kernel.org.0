Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0847173C439
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 00:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjFWWmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 18:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbjFWWmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 18:42:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCA99D
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 15:42:19 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso1593048e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687560137; x=1690152137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceYAW1D/l6c2aC4P/IW3chCmC7PvALUSV1nl27dPWYk=;
        b=mgkAs6qZt8kuxOrDzoIZW4QCsDGDfDvOp5K8+jJ4wLDqBhPKx6vxhSTZZV3moO+sHv
         Gpl3LzveWrWexOcqc3yoLXcC/NNwceYa3eFx4LX1qtxsrbz/+ERKLhl1x2jflZYEK/Cu
         eyocr4i0CYgI3vCrc8iLDoZkExslBF20eEhcDAeUhtcsY4I5AD36soe0UWLmrgFnVAj8
         lUOEhKtiLa0CabJfo2tuEZVrViL1AZZ5h+e9A4k49C/0YEHmwSgUdsF7Sk+e+feC1FDI
         D/BeWmsvJSO1IObUhGsELs5V8UknLKu0b68376fK6X0KQwxO4dZWla+vZc7GWHhV/g6d
         Jpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687560137; x=1690152137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceYAW1D/l6c2aC4P/IW3chCmC7PvALUSV1nl27dPWYk=;
        b=KwJShspQyu8KUfc2x6MsDe6KdpmBFKcef2FwWCyAYIdAZQlGHHeXNJxsXK635A2Ezf
         mYNqEPHcAtL5DtF4wxDN8NhfVY2x/xbhLzbXzhxf6QfbBr8kpj3H0r4N5WS7Y+OxDSQ+
         PF/5p6Q7yRjWH7R2C/GIb4weYXxMaW2AvyW1aQfSziXK0A9TsXqVB++xtrLMoagdv8Mg
         d2fq7beU3fqlPI4VCqz3TZSd78zcuWusn+qzosyII2005cw9jzP0pLJh98ShJvM5LSVU
         lVAvbblNh+q44H7fF/gKQrMNI67gFKeFNJsbbLbACDmZeExdit3XsMDx/T2sVPOx3AF/
         wcUg==
X-Gm-Message-State: AC+VfDxqSG4gf9Vg5iUIgPYjPAyd9xK1UhievlTGqwkLO5tri3W0c2pp
        1XE6UVGfevq36LtQdyqvJwXxVA==
X-Google-Smtp-Source: ACHHUZ4GWtl3oNIy1/jbJrzgy1m8PE7Ek4gU3iSOPeZeCRWVhPUTCk0F6/icRBQLhgZBUNQ0e3Y2OQ==
X-Received: by 2002:a05:6512:556:b0:4f9:5673:f6f4 with SMTP id h22-20020a056512055600b004f95673f6f4mr7400008lfl.59.1687560137537;
        Fri, 23 Jun 2023 15:42:17 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id v15-20020ac2592f000000b004ec6252aa37sm54482lfi.116.2023.06.23.15.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 15:42:17 -0700 (PDT)
Message-ID: <144c5bff-6d81-b681-57ac-b1e51993c9b3@linaro.org>
Date:   Sat, 24 Jun 2023 00:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 10/10] arm64: dts: qcom: sa8540-ride: Enable first port
 of tertiary usb controller
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20230621043628.21485-1-quic_kriskura@quicinc.com>
 <20230621043628.21485-11-quic_kriskura@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230621043628.21485-11-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21.06.2023 06:36, Krishna Kurapati wrote:
> There is now support for the multiport USB controller this uses so
> enable it.
> 
> The board only has a single port hooked up (despite it being wired up to
> the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
> which by default on boot is selected to mux properly. Grab the gpio
> controlling that and ensure it stays in the right position so USB 2.0
> continues to be routed from the external port to the SoC.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> [Krishna: Rebased on top of usb-next]
If that's your only change to this patch, you should have kept the
Author: field unchanged.

> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
Same comments as patch 9

Konrad
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 24fa449d48a6..53d47593306e 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -309,6 +309,19 @@ &usb_2_qmpphy0 {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb2_en_state>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +	phy-names = "usb2-port0", "usb3-port0";
> +	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> @@ -401,4 +414,13 @@ wake-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	usb2_en_state: usb2-en-state {
> +		/* TS3USB221A USB2.0 mux select */
> +		pins = "gpio24";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
>  };
