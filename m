Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F0065A58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfGKPYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:24:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45592 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbfGKPYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:24:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so2903090pfq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TsgjI6A1vEKCJVe48OG6ptqWe4oPYT0gZQ720DWV3VE=;
        b=ozetUNtyRheSd+VdhwPAM5wrvc+f8mvMKkOURx4/tEoKFISzUJmS2477HhXfCIFOOS
         FmYLSbqB6AnpJiH1KJDfDXI9d90HYrEM4D35rnTVknKkedp+M7KAaCeBmhgsPmYZdTuB
         XwUHoyrBmI3pZNPuVHmPlUWXzsDmo6WQEXhM7O+jL0cC+aflW9noghj5znx8UpJ/DibH
         g8pLQWyE2/aPdUUjAcVceo6GVMiwSHKlFor+rNNwBQhJPqGrND07WghJ+prqY9B7iF+3
         z8u6xfmhxGxyrAf+elgdVXM4+Jhe55JgvuZapNURsgMUkVsrBUW1qxfv7wCVlm4mUMei
         Kxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TsgjI6A1vEKCJVe48OG6ptqWe4oPYT0gZQ720DWV3VE=;
        b=oanOZLY3QTwg4wprsHHU02ESRRsNf3b7u93pyeLEW7qz0ja4XthcR9kaX+C0WMlbhV
         qOGR8+fju1CIeu2XzKBIsE3A1kYEcJPIHvMW/arEl4ud5hp5gSOsNOqTFOOJrOLL77eC
         dR7/4ozFkwJBSEPcm62ecZLIufR8vbJcpaOdHnC5KdTYIbiFm/W6aOjcXBl8+dhDf+v1
         neepFpoCmAkL2/zYUPH4jHm19DnPxYPysCuOMWCSyH8dUv5yly6qK94Qur3HM79wBgG6
         0VA4seyhnLQmo3Jgb/5QlrjHlwxbt8rF3TKWmFlh2E4wbz7ZZ6JomXdPPKMEZwj3alcn
         5E1Q==
X-Gm-Message-State: APjAAAXHcWaC4eG+tiyl1i1+JWrbj+N7nlbaPZ/7K3HZA2v7bS+Cimke
        qioqlDEmBOcp7OWZT8CVbdUmaw==
X-Google-Smtp-Source: APXvYqyEpYbkpfwqRdcziDPck/m5fzfiUQiMpS/Mps7J1p8ekHZ6G5fQe/WamqVJ8U7S4TKMOB6gmA==
X-Received: by 2002:a63:211c:: with SMTP id h28mr4999710pgh.438.1562858670371;
        Thu, 11 Jul 2019 08:24:30 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v14sm4462918pfm.164.2019.07.11.08.24.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:24:29 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:25:39 -0700
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
Subject: Re: [PATCH v3 11/14] arm64: dts: qcom: qcs404: Add HFPLL node
Message-ID: <20190711152539.GL7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-12-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-12-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> The high frequency pll functionality is required to enable CPU
> frequency scaling operation.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index d876dae5b0a5..94471aa31979 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -852,6 +852,15 @@
>  			#mbox-cells = <1>;
>  		};
>  
> +		apcs_hfpll: clock-controller@b016000 {
> +			compatible = "qcom,hfpll";
> +			reg = <0x0b016000 0x30>;
> +			#clock-cells = <0>;
> +			clock-output-names = "apcs_hfpll";
> +			clocks = <&xo_board>;
> +			clock-names = "xo";
> +		};
> +
>  		timer@b120000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -- 
> 2.21.0
> 
