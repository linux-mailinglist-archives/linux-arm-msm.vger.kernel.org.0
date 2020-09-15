Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B2526A854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 17:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgIOPHn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 11:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbgIOPHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 11:07:03 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56BDC06178A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:07:01 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id z18so1863998qvp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JuX459iPFiSF2qCYffrxdDG4JgmCWY9w05aQrmrwrn4=;
        b=XpwQxxGVDx+xrsemy5ScChUBWXTkrBb5ztt0FlDJ3uymeXh/OO/cNp0IM4TEb3Uyfs
         IUC/AvvzoY6L8QOMZautES1qOTI27M+ibJlW7puRi80nhlnhx4wgybOKNVZEKcQnuidk
         zgHvauaW7ZMz44TUy5YVxCCYWpPg0nVG8xyPOfYxEetICmdxoVwvQwR8spNBwr8bv7ax
         qecAUVJwVwjNgloeErbvc19Wr453Acbo3ApTn/3l9FpXeyPrjl9asz5Lce6Fefo9qLvo
         EZSnX8fsl2ei0DJQqwGVEptmSviBadbGoVy6cYdX3RMWcSCS3lRNx1NHaJsHrLJBCvEo
         FgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JuX459iPFiSF2qCYffrxdDG4JgmCWY9w05aQrmrwrn4=;
        b=UoGRxx2yPZND/n0zjetzo5z4CN+Vf3q5gDOc7b4H2OZ6eILrpG/BXZaaZwt8uX55P1
         cO59Ubqp9+6VsmWd7lN40L6A45NUb1w9LUmtn2VIXiScEDRGIduVrPgluMtZwR/RiDYk
         BoMIUaa1iT+vVP0G2EqP/fRj8AVQJL27y+1gGw91QmhsmVJqKWXSl7j0nmL/v4mzMaXY
         mUMtm3RNTnZVrShJmscdwlCUTopO6g5Lr2GhyQfHJrMGQAEZHCmgqy/49wt1c+fnYxJl
         W3iSfGB6pSo05M3qjitPh2UQLRYVEPInqf/XopGd6G+9djzKRKO5tRPAM49srjOVt6mC
         2Z1g==
X-Gm-Message-State: AOAM53369zYJMa7JMAEFh5zM3N8voPO6caRElUvyN+ptZ01OKYIFAOB+
        KRaEwsJbHTGlEoI9IUED7FXDAQ==
X-Google-Smtp-Source: ABdhPJzQNEKsjzjvUXu8OdTjWfm9ukfaozEj2Gwqj3nATSffbkC/gWbqDs4+YaOFn/Dt3gNcgp/7Ng==
X-Received: by 2002:a05:6214:7a1:: with SMTP id v1mr18903517qvz.19.1600182420944;
        Tue, 15 Sep 2020 08:07:00 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id s18sm16389547qks.44.2020.09.15.08.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:07:00 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:06:58 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8996: Add VFE1_GDSC power domain
 to camss node
Message-ID: <20200915150658.GA478@uller>
References: <20200915142316.147208-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915142316.147208-1-robert.foss@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 14:23 UTC 2020, Robert Foss wrote:

> As the MSM8996 has two VFE IP-blocks, and each has a power domain,
> both of them have to be enabled. Previously only the power domain
> of VFE0 was enabled, but not the domain for VFE1.
> 
> This patch adds the VFE1_GDSC power domain to the camss device tree
> node of the MSM8996 soc.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 9951286db775..df6e1b246a19 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1009,7 +1009,8 @@ camss: camss@a00000 {
>  				"ispif",
>  				"vfe0",
>  				"vfe1";
> -			power-domains = <&mmcc VFE0_GDSC>;
> +			power-domains = <&mmcc VFE0_GDSC>,
> +				<&mmcc VFE1_GDSC>;

Fixed the indentation and applied this.

Thanks,
Bjorn

>  			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
>  				<&mmcc CAMSS_ISPIF_AHB_CLK>,
>  				<&mmcc CAMSS_CSI0PHYTIMER_CLK>,
> -- 
> 2.25.1
> 
