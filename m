Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1123940B446
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 18:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhINQP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 12:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhINQP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 12:15:57 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98FFC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 09:14:33 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id v2so19732240oie.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bayy++x+q4ZvPh0XfqtGYK+C1gpsHQlhZj47g4V8IeQ=;
        b=An8f7RFCD2w7aWPhrfYgWH7oUfRSscFDHWB2hOayxWdmgE2vuQZi8tael3xG5oiEll
         MAeXeu6QkjyCEaTO18HrHbmfc22UNkBHglkKJCr4h2EaAlRkdzcLQdLV6eU2JxJsMokx
         vmFWNMXE3vS2rSh7VBbMXATTCgbR/rHQxetoKudb/YxuOgSh8BabqKLNoA1U8seoUJvb
         xJ0GHzBPjYFUVaFTczXLYlh4reIiNZvHMBLU4osF6gZodsSOMv76BlW62cpy1MeqcDMw
         KhV2MOxsIeFHNMHSZ4cS8VhnvhWoMKTw2vwvglJlSkgmLlTCGxtBLURvZMnRHHQhgVFi
         eHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bayy++x+q4ZvPh0XfqtGYK+C1gpsHQlhZj47g4V8IeQ=;
        b=Z1q+RUA8W3Vv5914xqe3vBLeWNq0a0N/Fxh5oA/TdCh8WjovNaRIUDXE6A29bIdGUa
         oJS4JfGmF7HpviXXGeK8FeiCDgcOKGZw7tBfzRqhk22IVH+TE3oFVv8+/+/1kgveUNsa
         pR2QF6GkSF5KCtiaCRHt7ty6FkJf2+3Tngm52pk52VQ0EuM1ANd/K55RPKM4IPNCbnqo
         M7Prx7sigFAEGqG9M+OJBLnJjhdY2WsG45DkRPixNCkrrY3YUaZztk8WSJGOwh4H8JwX
         lWctZ4kI05qj6q6dqzGabiRrLyH6JOWSBImY0rJMescf2o8mZ2G5lf3WvuEaVrVLiF60
         ojVQ==
X-Gm-Message-State: AOAM532O4eIZOi/wNveUGOn2WqJPHaakcbXEAGQFNBvPFi/vLDy1mY2T
        mDIPL/9U6sGBgIIUeaTVDKZmmQ==
X-Google-Smtp-Source: ABdhPJycW74bahLCuLxw+NBWjUNIBq41E4aq+9jVnngqziSSjBuWG+6vsk4fiI85MbLzijc5BJ9qfA==
X-Received: by 2002:aca:220a:: with SMTP id b10mr2024338oic.101.1631636072753;
        Tue, 14 Sep 2021 09:14:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y138sm2523722oie.22.2021.09.14.09.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:14:32 -0700 (PDT)
Date:   Tue, 14 Sep 2021 11:14:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 16/18] arm64: dts: qcom: sm6350: Add iommus property
 to USB1
Message-ID: <YUDKZh5bEiXUspFV@builder.lan>
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
 <20210828131814.29589-16-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828131814.29589-16-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 28 Aug 08:18 CDT 2021, Konrad Dybcio wrote:

> This is required for us to be able to access the associated registers, which
> are (on at least some devices) gated by default.
> 

Please either merge this with the patch that introduces the SMMU (which
I presume causes this "issue") or introduce the SMMU earlier in the
series.

Regards,
Bjorn

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index a3a1f0e63ace..95e69d9f8657 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -584,6 +584,7 @@ usb_1_dwc3: dwc3@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x540 0x0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
>  				snps,has-lpm-erratum;
> -- 
> 2.33.0
> 
