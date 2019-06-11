Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBC041918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 01:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408239AbfFKXkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 19:40:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35882 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408240AbfFKXkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 19:40:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id d21so5783189plr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 16:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vrcKiJncQCvJeYdovjwcGHLQkpFI9UFvyKLS0tgyyJA=;
        b=fxr+p7sgq0hHqMWtLVWiiVUmwvCK2K9niwmP89I8eDAL9RbspWdO1Z1sQG60RUq0Jh
         T2MZsogyjVAyLqkT3ee99gA8N013logxMHyCVkL7mI3YgQv2TKxq/hfKC0YKDOW0Tejm
         rPOIm4epv87XbkFyGuS0bvymTWIYvDCh+1NrywAgLDi61i8nwyH0pvvPXN+tS0oTBppj
         21RpX2SJBsR0PDumQJSP7tyvgCg+e7HUPC5gc46suhRZBioDhD1l7sO+GOgTaRyKmgCJ
         5DYz2JA/jf2MVMgTV5F8Sm7cG6RQ5CQdljOJ1kjjHo3+2itX5/elS5w8RqMKPWEOBokX
         zYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vrcKiJncQCvJeYdovjwcGHLQkpFI9UFvyKLS0tgyyJA=;
        b=JxLOH7qz8uH61KtZXi/x6Zghg7xHr2ZvKldGlZm2k8PoNzdx4DmdQGn+lda+7ANRtJ
         ubEdWHwZDwjQ71s+1iGx4bnZY+tHPW7YACzDrKRievSOjuU3ywCUwPEFwK0OC3y+ayE/
         tW4BsBXAPKVvndHVxGi2boLzcsV4iIKkqmdifs7/KnIuTqx0W1EsHPF23atNnbFmMiO/
         GK44w9bXdufqKZSQIgIdtNhUK0sh2uoetUOWpafnIfaN8V8TR39RhhaO04s7LBKZLYOf
         1tXIngq41/tjVhb0pSBt88eciYNiHrZsCj54N7dnlNY6dfA9jGDFUaPGBMZ8IoU5PpmE
         oi+g==
X-Gm-Message-State: APjAAAUjKqDHU+NUMyISgUoMeNSNEtlG0h7+0a3sOHJ9roWewoH2o9sc
        8d5KRmDJD9jZ5HA6nGpikMWjuw==
X-Google-Smtp-Source: APXvYqwVvSeKZ9+8pgl/U+yQv0XwTRD+oXRVoAp/CkKUZM51Vh73fYHUpTMj6hpKkhxVYtdA9svC7A==
X-Received: by 2002:a17:902:d915:: with SMTP id c21mr11863733plz.335.1560296422678;
        Tue, 11 Jun 2019 16:40:22 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h11sm17090333pfn.170.2019.06.11.16.40.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 16:40:22 -0700 (PDT)
Date:   Tue, 11 Jun 2019 16:40:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, vkoul@kernel.org,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcs404: Add interconnect provider DT
 nodes
Message-ID: <20190611234020.GX4814@minitux>
References: <20190611164157.24656-1-georgi.djakov@linaro.org>
 <20190611164157.24656-6-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611164157.24656-6-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 11 Jun 09:41 PDT 2019, Georgi Djakov wrote:

> Add the DT nodes for the network-on-chip interconnect buses found
> on qcs404-based platforms.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> 
> v3:
> - Updated according to the new binding: added reg property and moved under the
>   "soc" node.
> 
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffedf9640af7..07ff592233b6 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2018, Linaro Limited
>  
> +#include <dt-bindings/interconnect/qcom,qcs404.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-qcs404.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> @@ -411,6 +412,33 @@
>  			#interrupt-cells = <4>;
>  		};
>  
> +		bimc: interconnect@400000 {

Please maintain sort order of address, node name, label name. So this
should go between rng@e3000 and remoteproc@b00000.

Other than that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
> +			reg = <0x00400000 0x80000>;
> +			compatible = "qcom,qcs404-bimc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus_clk", "bus_a_clk";
> +			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +				<&rpmcc RPM_SMD_BIMC_A_CLK>;
> +		};
> +
> +		pcnoc: interconnect@500000 {
> +			reg = <0x00500000 0x15080>;
> +			compatible = "qcom,qcs404-pcnoc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus_clk", "bus_a_clk";
> +			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
> +				<&rpmcc RPM_SMD_PNOC_A_CLK>;
> +		};
> +
> +		snoc: interconnect@580000 {
> +			reg = <0x00580000 0x23080>;
> +			compatible = "qcom,qcs404-snoc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus_clk", "bus_a_clk";
> +			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> +				<&rpmcc RPM_SMD_SNOC_A_CLK>;
> +		};
> +
>  		sdcc1: sdcc@7804000 {
>  			compatible = "qcom,sdhci-msm-v5";
>  			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
