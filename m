Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EEB2A4D84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgKCRxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgKCRxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:53:22 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2966C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 09:53:20 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id 9so19227922oir.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 09:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qsTSf6EkquY3dHustq6mQzDJDGGNrho9XMEHXQz+zxk=;
        b=T/jljiOHu3j1XVKoaYXHyf8vTSL4gc9s5VAX2LHAlgrIovWbr3SArKhviYapCZ6w7T
         tzStg2v8w9tLnHaCO2DRh/2XTj+yidm/1uRIGqpBetS62g8ogFbE41qsqWzS3rZquF7o
         WwTjsM9XquZcdSuSGLlNN2SRZyXPC3DzmY5K9o7gLks/oSA3moHP8tx/BuLjdjd5MHZG
         Kj8DmBVDvkLKP3Bdi7ypcM3C3evAmAXIvN8Pohpkxy68jM45NEawFS9CpMRHMUkCPFOO
         6RtkmVzRkjsvjdz81uc4w5Voo7n2VmgIfIPjb27itJYPgoiPTsYyA3KIYfCCfsXgXEp3
         fPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qsTSf6EkquY3dHustq6mQzDJDGGNrho9XMEHXQz+zxk=;
        b=dRjSZlv86JtQDhbE53XsH4xCg6irY18B/3LvJuhv3TA4Xv+ps/epmuhOw9Be8b9IxW
         KH6RclWfneBpf1gZTDVX60w3kLIRdIAlPY8393dtcdp8myJtsViIS0uNgKMsHvMXlADv
         +XPbysr/bK4FgzeuTxz5ZdfdOXyzT0k/Fh90QIuZm4D5/cP91s899+1Dqp80GSu6FXYd
         RZYQ/Zha3/0Dc1rfvl3lJ2W+PSri6MS+yfgT77f63xJ6CpWXQm48CYiGn8XqYkaLxTS7
         mqXkbbTOmTSsBq8hpVywKwihgfaHk+5zRcEf6cVg1ddKNE2yni4Pf3OLEyN3x32k0fDr
         nbsw==
X-Gm-Message-State: AOAM533r+gjvJ5KJy83pbEQJtMNMr1N98+NAsws2PT9d4+eWcrKA+V6u
        Ibu8onOEOVN23Acph75xA+8pMQ==
X-Google-Smtp-Source: ABdhPJzQ7GJ3R7rKvOo77Qr7qMs/c4V4qPn0otWyL884sE+OfSLJ/CbXizTazkSMy2Fd79MwmWSx6Q==
X-Received: by 2002:aca:fd86:: with SMTP id b128mr197258oii.103.1604426000377;
        Tue, 03 Nov 2020 09:53:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm539928otp.0.2020.11.03.09.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 09:53:19 -0800 (PST)
Date:   Tue, 3 Nov 2020 11:53:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Message-ID: <20201103175317.GC65067@builder.lan>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
 <20201028074232.22922-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028074232.22922-5-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 28 Oct 02:42 CDT 2020, Manivannan Sadhasivam wrote:

> Add support for clocks maintained by RPMh in SDX55 SoCs.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index e2c669b08aff..88d010178b59 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -432,6 +432,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>  	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
>  };
>  
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> +
> +static struct clk_hw *sdx55_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
> +	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> +	.clks = sdx55_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sdx55_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -519,6 +538,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
>  	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
>  	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
> +	{ .compatible = "qcom,sdx55-rpmh-clk", .data = &clk_rpmh_sdx55},

The sort order is off here.

Regards,
Bjorn

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
> -- 
> 2.17.1
> 
