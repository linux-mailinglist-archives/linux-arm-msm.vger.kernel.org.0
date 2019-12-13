Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 746DC11ED22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 22:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfLMVrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 16:47:22 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36545 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLMVrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 16:47:22 -0500
Received: by mail-oi1-f194.google.com with SMTP id c16so1216319oic.3;
        Fri, 13 Dec 2019 13:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w5xdh98E7mr6+86lSxAaIdccaOQtAOZWUmlaUNXldZU=;
        b=LKV8rcMOgKk7/VE8asb2OpaD2VK/TNgns1UMYe7+6aLIrEY61UenWbxEI0Jz+vY/WC
         Vc+pipNBGqWTkX8it/xDgqelWIWoj4jB+6aEic4GqiUV2wOjk4UgAChhexqmL4sdI896
         Hc1TNm2O1FUNQrOuugxmkCBS4sFgL9vgnqGsny5dFfJ6mV1XDst2o7EWRaO/CgE9FqDI
         7p5SyFQtsz+XCYD5DT7nedfRA+1EnsWOHlp4by1iFOGl+rI/gjYFdE59jxSuUKyapCj1
         a13mEc1tZYAfALKPBX2d3rlNl3A39g7+TWl4nK8PxUzPFlQmPOar7XNyLug9klivhlc/
         W10Q==
X-Gm-Message-State: APjAAAV896p3/T45VD7YaENvsXcc5Sz3ekFL6RECQpKZawcfr5r2jdHC
        YKio3vin0PZhjkqLHnIgag==
X-Google-Smtp-Source: APXvYqzm62Y9qN5g4QrstJ8YOMO5rKtfDZ1qoaPCIsVdFH1v/4Bxp+t6KiBbsCr+3sooAIymdRKrSg==
X-Received: by 2002:aca:4a41:: with SMTP id x62mr7648394oia.148.1576273641167;
        Fri, 13 Dec 2019 13:47:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p83sm1913240oia.51.2019.12.13.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 13:47:20 -0800 (PST)
Date:   Fri, 13 Dec 2019 15:47:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: add sc7180 panel variant
Message-ID: <20191213214719.GA11149@bogus>
References: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
 <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 29, 2019 at 12:25:44PM +0530, Harigovindan P wrote:
> Add a compatible string to support sc7180 panel version.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/display/visionox,rm69299.txt

Source files should not have execute permission.

New bindings should be in DT schema format.

checkpatch.pl will tell you both of these things.

> 
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> new file mode 100755
> index 0000000..4622191
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> @@ -0,0 +1,68 @@
> +Visionox model RM69299 DSI display driver
> +
> +The Visionox RM69299 is a generic display driver, currently only configured
> +for use in the 1080p display on the Qualcomm SC7180 MTP board.
> +
> +Required properties:
> +- compatible: should be "visionox,rm69299-1080p-display"

RM69299 may be generic, but 1080p sounds like a specific panel.

Is there anything besides a 'display'? If not, '-display' is redundant.

> +- vdda-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- vdd3p3-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  (active low)
> +- mode-gpios: phandle of the gpio for choosing the mode of the display
> +  for single DSI

The modes are what?

> +- ports: This device has one video port driven by one DSI. Their connections
> +  are modeled using the OF graph bindings specified in
> +  Documentation/devicetree/bindings/graph.txt.
> +  - port@0: DSI input port driven by master DSI
> +
> +Example:
> +
> +	dsi@ae94000 {
> +		panel@0 {
> +			compatible = "visionox,rm69299-1080p-display";
> +			reg = <0>;
> +
> +			vdda-supply = <&src_pp1800_l8c>;
> +			vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +			pinctrl-names = "default", "suspend";
> +			pinctrl-0 = <&disp_pins_default>;
> +			pinctrl-1 = <&disp_pins_default>;
> +
> +			reset-gpios = <&pm6150l_gpios 3 0>;
> +
> +			display-timings {
> +				timing0: timing-0 {
> +					/* originally
> +					 * 268316160 Mhz,
> +					 * but value below fits
> +					 * better w/ downstream
> +					 */
> +					clock-frequency = <158695680>;
> +					hactive = <1080>;
> +					vactive = <2248>;
> +					hfront-porch = <26>;
> +					hback-porch = <36>;
> +					hsync-len = <2>;
> +					vfront-porch = <56>;
> +					vback-porch = <4>;
> +					vsync-len = <4>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					panel0_in: endpoint {
> +						remote-endpoint = <&dsi0_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.7.4
> 
