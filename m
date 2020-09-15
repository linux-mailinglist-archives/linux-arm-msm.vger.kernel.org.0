Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9997326B583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 01:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgIOXq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 19:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbgIOXqV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 19:46:21 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B11C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 16:46:16 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id r8so4686157qtp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 16:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y+mU56xK7i6tjhZtyAJE59dGywQqOtikX6Sw6kpTVGg=;
        b=w0QgiRoKgTC40eN101OXJSkL0FWds8BKRmS5XeBcJaKHJ9/LdtU44pzHkDmAsPJRG4
         7eX8XlmozsGuaonEumkRs9hRB+XkvhIlr0cMfezb7RC9CRkuqvxxcR0Cp32ejSKH0kUc
         sPdTf1dNNQOW++2HCBlozFPe/4Orwf7T7vz5IJS2u/m/O5q8zW3zBQJo45qwJ+td97qt
         jO+KSZQzBYh9/RrQTlGkanJLduiF5RFfnyXi7G5/+msQhycMLItovb1Nvn/o+UwCV1ih
         tNVFHzPKp1Feo/zh/v910sfF6yQDRsHiIeIhX9TRIp8lpWadxT7oiwoohvMXmKXaHwEc
         Putw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y+mU56xK7i6tjhZtyAJE59dGywQqOtikX6Sw6kpTVGg=;
        b=nwpO8V8siSwBHAqT+3hk1yDJUqT0dZs/N10GH0AsplWhZILxwkq0hfZqjz56IqxIsD
         xnG8M22dzDJByjAO8uENrlAC6J9aML+dgkMVSjLc4DLaQ1DNZfgm7XOUguZBd8jlFoyj
         vj6hD42i8TFeJ3zscVJJNBX37+XYkU960r0AkZikl58939IGzW2ugEOLdb6Bprq7D9Mp
         FAClKqyFcDIyvrgDQpXloBaV6YRXBrobfIum/tVMH0vHc8nJs7Et7KdtN2xaTHaL6zN4
         QMLhvya5Or741gMoQQgZL/OKFqV6obfUkLkcVNvga+nDfp7yT2TK6hAD9+JtM696gFoe
         kuSA==
X-Gm-Message-State: AOAM5329aRkxZelfj9gUw6pl6OhjfG4jJR3onSQeAEoMIMU7tG8DF0ZI
        FQRhFbDuHe9mAHktLWb6ixN3Zg==
X-Google-Smtp-Source: ABdhPJxw/EiYrVp46YY0gZPBZYURmwszTivr8SElDE1s0pAfvJEh+82Opm+tBAZQq2LyqOdFMmxGgA==
X-Received: by 2002:ac8:6a01:: with SMTP id t1mr20539420qtr.26.1600213575388;
        Tue, 15 Sep 2020 16:46:15 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id b43sm18477881qtk.84.2020.09.15.16.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 16:46:14 -0700 (PDT)
Date:   Tue, 15 Sep 2020 23:46:13 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     robh+dt@kernel.org, robdclark@gmail.com, amit.pundir@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add interconnects property for
 display
Message-ID: <20200915234613.GL478@uller>
References: <20200915214511.786-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915214511.786-1-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 21:45 UTC 2020, Georgi Djakov wrote:

> Add the interconnect paths that are used by the display (MDSS). This
> will allow the driver to request the needed bandwidth and prevent
> display flickering.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> This patch depends on:
> https://lore.kernel.org/r/20200903133134.17201-6-georgi.djakov@linaro.org/
> 

Applied, together with this dependency and the additional patches you
pointed me to.

Thanks,
Bjorn

>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 86457d9bc229..f8f09ab3442f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3813,6 +3813,10 @@ mdss: mdss@ae00000 {
>  			interrupt-controller;
>  			#interrupt-cells = <1>;
>  
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mem_noc SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mem_noc SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
>  			iommus = <&apps_smmu 0x880 0x8>,
>  			         <&apps_smmu 0xc80 0x8>;
>  
