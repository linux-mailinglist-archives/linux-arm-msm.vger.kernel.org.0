Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5861A2CB211
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 02:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgLBBH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 20:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgLBBH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 20:07:28 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D6EC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 17:06:48 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id h19so182216otr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 17:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TzeqoxtSCwOZivYVrn0z0SfSqZzaISmAjmKpXvYn4l8=;
        b=Cq+cR4c3OVPQaxrFJOVz30dXDnWjBJhnqGAs7L4dBRSGcXSq1EGarExWt50WSDI+jU
         wERxtHTA1hQ1kfv+jxVNjegv7iBnwOOgEtK4Utc/9KOPLX0e/7Cl0OISHVFMTmSiKlO9
         X5e5kvkstbdL6D7TtAXRuTh8EMFeKWr2adcrpUf/YILoB3Aw8JrPQbS+x3Mld6M/8k9h
         /4sxuqAmsdt989NxClZRE2Nvh3iRmZcCl5iNBMiTrGSb4IQiDbqhBcxyvFvNE+ecLrWZ
         FQl2EVg2FvzdPMsvQb6U25FTNMeEQy1UhbS9FmNVReC/sZEr95iO34DYQPSPrgo1FLR8
         ahww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TzeqoxtSCwOZivYVrn0z0SfSqZzaISmAjmKpXvYn4l8=;
        b=rh4FAl6QfCSYIKhS0tjrAsA79Va8/hHKgzFs8LEend7r+VDTeygn2NCmfCZowNtoB7
         PXk2HP3xQ4oqAOzLZ0kina8J/ucNfY1YBBVrfbpNKNRGit8nUER9JDnLGGWwePdl9KVM
         yJias29HbArF2DgBqsV8GHbjqHuKhPtg8P8u8R8t6P8/+37QTPhA+uPne7eDctlXsLPB
         J1H98upLbK3VFN1xrZh9EmGkM3TcU8aauf7JBShpoI8iNcCpvc65pcyB/iq6+pztkLXl
         Vx+YjlSzKahODrJ8LJeuuyrIe7Bw/qIQ99B9vwzZ23bMV9HeMQ9UhH12obTUKnIzxCj3
         6nKw==
X-Gm-Message-State: AOAM533bf0N/Yyr164kRnlcPpHGjPxMYzC4sbqojY2E/LAA5ejbQ/L1P
        pQAXjcK0hCCvJnkZeoeU8pmqAQ==
X-Google-Smtp-Source: ABdhPJzW0j1aFxBws0ERK/8CeaFHALeC03HBtEzgnq+tJMwDS0p6UG67m1ITDLHOt9ZWR9XKJq46RQ==
X-Received: by 2002:a9d:323:: with SMTP id 32mr136962otv.309.1606871207574;
        Tue, 01 Dec 2020 17:06:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w70sm17223oiw.29.2020.12.01.17.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 17:06:46 -0800 (PST)
Date:   Tue, 1 Dec 2020 19:06:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: db845c: Enable gpi_dma0 node
Message-ID: <X8bopaei69fbdcSs@builder.lan>
References: <20201201042520.2116271-1-vkoul@kernel.org>
 <20201201042520.2116271-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201042520.2116271-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Nov 22:25 CST 2020, Vinod Koul wrote:

> gpi_dma0 can be used for spi and i2c transfers on db845c, so enable it
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 7cc236575ee2..0653468f26ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -418,6 +418,10 @@ &gcc {
>  			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
>  };
>  
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +

But you're only enabling the gpi, you don't have anything wired to it,
so why enable it?

I took a look downstream and they have all the i2c and spi nodes with
their dmas filled out - and the two gpis enabled at all times
(sdm845.dtsi). Can/should we do the same?

Regards,
Bjorn

>  &gpu {
>  	zap-shader {
>  		memory-region = <&gpu_mem>;
> -- 
> 2.26.2
> 
