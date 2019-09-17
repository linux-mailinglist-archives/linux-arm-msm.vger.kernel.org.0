Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86900B55A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 20:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbfIQSvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 14:51:18 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36733 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfIQSvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 14:51:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id f19so1913424plr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eUL3CofObSvtROvpchYQhoATJQhwSk2E5xxOcu56n6w=;
        b=PgRbwawkQd6LmSRskqO7m760QviTkXlgObSFz6CAACWi/lOTqYkqayC36yfARrHAAp
         uhFAx39ebPmvQCQYKTV9rW0ZULAmd4MV4UWA69kzWaKww1Kw72O3aaL3kagH7GjGpwsq
         22kL0hVuaHH/4+d7E6hvz6Y/AlcF3tjd1d83I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eUL3CofObSvtROvpchYQhoATJQhwSk2E5xxOcu56n6w=;
        b=NfKt9I/XMvZ+l5MTnxcnAhGyWhdhJvVoy6FeiWJwGhNaMLa3FVtYkGcg6TUkBDpEjX
         Vp9iv7guQJwoI9PujW/tA4wB9sET+XZChzHwkVF9N02CmNW4t9Go2SHciV5ijJwE/BfM
         FeK2WRDrOmKBs7j57sw1rwoWo/vKHxg1ghndziBYwtQ+ta4WKmU/k5bFFFUXXS714TvG
         jibJeDaP7HUv2kOGovXS1lxABHeaXVuQAip4K4WNDTR3tlWmVrovDZ5QrT16fa8XjvUD
         v22GhE1l46kbbrjOfM5f/KwTqetFSOFFBCPrCj4PgA1MzHGmhMwV+QXmMlNicV0sgWV3
         zIXg==
X-Gm-Message-State: APjAAAXGyM6XQ6LP0Cnc7Y9KNAdOsceAoasOWmMfpDgseWU4Qs0bu0pi
        MlRqINiD0NznofgoD8Axkw9G3g==
X-Google-Smtp-Source: APXvYqxP3wJP0JnkZvGN1bLYAMx//+LYQw9lbbuqTBfWIfZwqS+8S2S/rz8gWsFyMDZSkDm71eCYXw==
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr110407plp.140.1568746277416;
        Tue, 17 Sep 2019 11:51:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id bb15sm2849267pjb.2.2019.09.17.11.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 11:51:16 -0700 (PDT)
Date:   Tue, 17 Sep 2019 11:51:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 1/3] dt-bindings: Introduce interconnect properties
 for Qualcomm DWC3 driver
Message-ID: <20190917185115.GJ133864@google.com>
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
 <1568718649-20124-2-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568718649-20124-2-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 17, 2019 at 04:40:47PM +0530, Chandana Kishori Chiluveru wrote:
> Add documentation for the interconnects and interconnect-names
> properties for USB as detailed by bindings/interconnect/interconnect.txt.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> index cb695aa..428565b 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -33,6 +33,16 @@ Optional clocks:
>  
>  Optional properties:
>  - resets:		Phandle to reset control that resets core and wrapper.
> +- interconnects:	Pairs of phandles and interconnect provider specifiers
> +			to denote the edge source and destination ports of
> +			the interconnect path. Please refer to
> +			Documentation/devicetree/bindings/interconnect/
> +			for more details.
> +- interconnect-names:	List of interconnect path name strings sorted in the same
> +			order as the interconnects property. Consumers drivers will use

nit: Consumer

no need to re-spin the series just for this.

> +			interconnect-names to match interconnect paths with interconnect
> +			specifiers. Please refer to Documentation/devicetree/bindings/
> +			interconnect/ for more details.
>  - interrupts:		specifies interrupts from controller wrapper used
>  			to wakeup from low power/susepnd state.	Must contain
>  			one or more entry for interrupt-names property
> @@ -74,6 +84,9 @@ Example device nodes:
>  			#size-cells = <1>;
>  			ranges;
>  
> +			interconnects = <&qnoc MASTER_USB3_0 &qnoc SLAVE_EBI1>,
> +					<&qnoc MASTER_APPSS_PROC &qnoc SLAVE_USB3_0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
>  			interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
>  			interrupt-names = "hs_phy_irq", "ss_phy_irq",
>  				  "dm_hs_phy_irq", "dp_hs_phy_irq";

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
