Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC62F65A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfGKPXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:23:44 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33974 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbfGKPXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:23:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so3216165plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 08:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CSfzn244zMxZzCnzEJ3aLKTkuzXbWd6fbHt5WU7kz70=;
        b=bfgFzyXO2fBQCSypPnFTn+swixOumjnXHhHumedREAjORqwINppI7oBdn7JVXBZRP1
         SBG3MN9K7Y8oMszK9cPs22p1SwNWQzZKY0UhQjtBkgIvPSR3jNjwslOPLCc+t1ZnaIz6
         vRLNVftkxpDQTfwUYShAk/WmPxOFd5L+dXDn7qNKXZ/02M3d2iyEZJHdsOIgELYSc+Pb
         /eOwGYeNsg+jtpRIMohfcX57KX2iyWjg758Xf6uVtIu88pKaAEuFS69GVhzM5l7wDi8Z
         G8QHOxO6E7g5kstUcj2BpC7mKw+2NgKFqhu6V077ipaZRPsxVHrpV+uQiKhDKauLWSh7
         Lw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CSfzn244zMxZzCnzEJ3aLKTkuzXbWd6fbHt5WU7kz70=;
        b=elrXmdGVthTICocUE9whHH9syvlxMKV/pzMtujXF1TaxlhMyxwpWqxmsh24K1t7Rkt
         iIzUgnZnuvnXjft3YvaOH1T9w1/iD8In5IMXtBCRckjk22ZBaWbLWarzGqR6jZwGNg2q
         EqXgFLRnwH/cI/L/cq80EZKm+AeiMGkw9wZ8ELoHD03IUVXGIgfUyUgucqy+zFtuhkPN
         SP1r6I7gnquM0DB4Wm/TcGV2+i9HMFNUq8W5QXxz0nY+SMlcorNNJ2gyg1fdL7pqmkLi
         LbSUasyXE/i/+zPgDyU4fMsiHIYHwjfEYvlXDK23vIU0DogveMM2VCVzIQ6zxyFVlhVM
         ZkMw==
X-Gm-Message-State: APjAAAVRcmI5Xnt/q4nKcJSziixtaZNijpMGIu/2HT99F/oRzscc4mZ5
        1GoVb7UtXJs23LISkd/z9I+C5g==
X-Google-Smtp-Source: APXvYqzC8zW9AaWRDb9ZlRE16EvYVQBSACMCbbatUXf1UeDd0+O1VMv1PBXTJBbV67HowoIWiWdnlQ==
X-Received: by 2002:a17:902:20ec:: with SMTP id v41mr5011846plg.142.1562858623622;
        Thu, 11 Jul 2019 08:23:43 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r1sm5002102pgv.70.2019.07.11.08.23.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:23:42 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:24:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 09/14] arm64: dts: qcom: msm8916: Add the clocks for
 the APCS mux/divider
Message-ID: <20190711152452.GJ7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-10-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-10-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Specify the clocks that feed the APCS mux/divider instead of using
> default hardcoded values in the source code.
> 
> The driver still supports the previous bindings; however with this
> update it we allow the msm8916 to access the parent clock names
> required by the driver operation using the device tree node.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 5ea9fb8f2f87..96dc7a12aa94 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -429,7 +429,8 @@
>  			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
>  			reg = <0xb011000 0x1000>;
>  			#mbox-cells = <1>;
> -			clocks = <&a53pll>;
> +			clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
> +			clock-names = "aux", "pll";
>  			#clock-cells = <0>;
>  		};
>  
> -- 
> 2.21.0
> 
