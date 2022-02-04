Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCF74AA2CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344602AbiBDWGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343746AbiBDWGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:06:03 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD5EC061401
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 14:06:00 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso6111697ott.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 14:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GgMTuyFhfMGaPgXyT5djEh66US2TKTv1WM+9qJD9okI=;
        b=OcPENJ2t+b1YpK3TYoG1ZSd8XbIyVovoWvPyKNoMXWOhG3lsFVkVYjWt0EBCJ4sC6n
         AKGIP8rraXMkhZZocjOHDHNyjJvA+uTbtEmcsBBzNNTlRA9jKPUm4OwSoRn9Bcd7oC2a
         C/qhC2R3YqDGKBMfz9KlFpcgP+BtQudL/rQmlnQgf4JHUe1WaVwOA+3d73EqDFipz6C0
         kHW81p3ZKBAAA8c8NwDT/4AJ2sY3EIFGqBKdOGjNM26MMn3q1hcBCfOMRQQCmPmIt5MO
         9LFU7l65k6j1ATQY/XdxgOtRp0hLCdrsT7KqXlYyya8Puj3CDbqSPFtI6goo2DksIrRv
         J6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GgMTuyFhfMGaPgXyT5djEh66US2TKTv1WM+9qJD9okI=;
        b=EO1jlfPmw9fpy0sDRezLcCIOkHmwZp95bo2a/+PkG06kKhVKNM+Nmamex+rcnaCQ3a
         ixbWaMPQYO6s1Oc9thTVP3CxmRGA/7s+lJrn6AgeCvFczrcPTWbcGCCBCULw3xtr8nb3
         zB7Jc/5HFYV/JP3DdipQd8hN/cv7EWxIqYU21PVCo41kWdkW4wRJPxOak4fB9VSXthtr
         3jWyBfmRSovbrWMlq9Rdx2lsvNuQANC7ZOoJzM4HPt1hRRExB4dzSnxphsrygItT3sPr
         dGieVHQu/gNQxhRfZ7/R8iPt2lNQOyORLKj8roaze8imyuUbe0NpPoOottLiojzB5xD0
         whTg==
X-Gm-Message-State: AOAM533eHe8zqtfgwUeupAyYGYUwpvbZSF9KZu7Fzk2Y4iXlw8a7zv19
        2EAkqzIN4K7LpLPI+g+WeLfVrw==
X-Google-Smtp-Source: ABdhPJxW4MWaRb1wlF8fzuNsLsYeXFnj6m66SEWmLW4wwzzgN+hd2bSOY2XNtxOTmhqtid4nBCXg+Q==
X-Received: by 2002:a9d:6d01:: with SMTP id o1mr411112otp.204.1644012359264;
        Fri, 04 Feb 2022 14:05:59 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l1sm1222303otd.18.2022.02.04.14.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:05:58 -0800 (PST)
Date:   Fri, 4 Feb 2022 16:05:56 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Wilczy??ski <kw@linux.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] clk: qcom: gdsc: add support for clocks tied to
 the GDSC
Message-ID: <Yf2jRAf5UKYSMYxe@builder.lan>
References: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
 <20220204144645.3016603-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204144645.3016603-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 04 Feb 08:46 CST 2022, Dmitry Baryshkov wrote:

> On newer Qualcomm platforms GCC_PCIE_n_PIPE_CLK_SRC should be controlled
> together with the PCIE_n_GDSC. The clock should be fed from the TCXO
> before switching the GDSC off and can be fed from PCIE_n_PIPE_CLK once
> the GDSC is on.
> 
> Since commit aa9c0df98c29 ("PCI: qcom: Switch pcie_1_pipe_clk_src after
> PHY init in SC7280") PCIe controller driver tries to manage this on it's
> own, resulting in the non-optimal code. Furthermore, if the any of the
> drivers will have the same requirements, the code would have to be
> dupliacted there.
> 
> Move handling of such clocks to the GDSC code, providing special GDSC
> type.
> 

As discussed on IRC, I'm inclined not to take this, because looks to me
to be the same situation that we have with all GDSCs in SM8350 and
onwards - that some clocks must be parked on a safe parent before the
associated GDSC can be toggled.

Prasad, please advice on what the actual requirements are wrt the
gcc_pipe_clk_src. When does it need to provide a valid signal and when
does it need to be parked?

Regards,
Bjorn

> Cc: Prasad Malisetty <pmaliset@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.h | 14 ++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7e1dd8ccfa38..9913d1b70947 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -45,6 +45,7 @@
>  #define TIMEOUT_US		500
>  
>  #define domain_to_gdsc(domain) container_of(domain, struct gdsc, pd)
> +#define domain_to_pipe_clk_gdsc(domain) container_of(domain, struct pipe_clk_gdsc, base.pd)
>  
>  enum gdsc_status {
>  	GDSC_OFF,
> @@ -549,3 +550,43 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +/*
> + * Special operations for GDSCs with attached pipe clocks.
> + * The clock should be parked to safe source (tcxo) before turning off the GDSC
> + * and can be switched on as soon as the GDSC is on.
> + *
> + * We remove respective clock sources from clocks map and handle them manually.
> + */
> +int gdsc_pipe_enable(struct generic_pm_domain *domain)
> +{
> +	struct pipe_clk_gdsc *sc = domain_to_pipe_clk_gdsc(domain);
> +	int i, ret;
> +
> +	ret = gdsc_enable(domain);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i< sc->num_clocks; i++)
> +		regmap_update_bits(sc->base.regmap, sc->clocks[i].reg,
> +				BIT(sc->clocks[i].shift + sc->clocks[i].width) - BIT(sc->clocks[i].shift),
> +				sc->clocks[i].on_value << sc->clocks[i].shift);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gdsc_pipe_enable);
> +
> +int gdsc_pipe_disable(struct generic_pm_domain *domain)
> +{
> +	struct pipe_clk_gdsc *sc = domain_to_pipe_clk_gdsc(domain);
> +	int i;
> +
> +	for (i = sc->num_clocks - 1; i >= 0; i--)
> +		regmap_update_bits(sc->base.regmap, sc->clocks[i].reg,
> +				BIT(sc->clocks[i].shift + sc->clocks[i].width) - BIT(sc->clocks[i].shift),
> +				sc->clocks[i].off_value << sc->clocks[i].shift);
> +
> +	/* In case of an error do not try turning the clocks again. We can not be sure about the GDSC state. */
> +	return gdsc_disable(domain);
> +}
> +EXPORT_SYMBOL_GPL(gdsc_pipe_disable);
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index d7cc4c21a9d4..b1a2f0abe41c 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -68,11 +68,25 @@ struct gdsc_desc {
>  	size_t num;
>  };
>  
> +struct pipe_clk_gdsc {
> +	struct gdsc base;
> +	int num_clocks;
> +	struct {
> +		u32 reg;
> +		u32 shift;
> +		u32 width;
> +		u32 off_value;
> +		u32 on_value;
> +	} clocks[];
> +};
> +
>  #ifdef CONFIG_QCOM_GDSC
>  int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
>  		  struct regmap *);
>  void gdsc_unregister(struct gdsc_desc *desc);
>  int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
> +int gdsc_pipe_enable(struct generic_pm_domain *domain);
> +int gdsc_pipe_disable(struct generic_pm_domain *domain);
>  #else
>  static inline int gdsc_register(struct gdsc_desc *desc,
>  				struct reset_controller_dev *rcdev,
> -- 
> 2.34.1
> 
