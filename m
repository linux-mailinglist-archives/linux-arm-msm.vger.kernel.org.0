Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6354FE811
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 20:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiDLSeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 14:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbiDLSep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 14:34:45 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEBB4EDF6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 11:32:25 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id a19so15417194oie.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2WXD2iuN6pAX6EeuItghKADIiBu6DLmqZqNZpUmEXOc=;
        b=EMPEg9LFAWgd3a+DMjzgPTmhKsM6uLowfqpCHmXQhQZs/+/GOsTGlejnBfFZdMHtHh
         FlWAI/CZUYOz00Z8i4AE7heKXRlTIYlk8HGghgFd69LLA2JSfITxN/Qfoe3EPX50SpHK
         uWrHxz1IT70mjfsQHtt+CQN0fG7RQ1iOCzyqbtwQ3Cxqhru3rQXAo7HhA3qJy5qQGgm/
         XknH2NzfrUDG2XDjhLlG/8aHVtAlMYSq7AIzlhNUhXDTfhC/v66dyYKVoY4UCmh5ODXs
         uQvA8InWhkZMCy+/Qk4bt+H1ECJGla+CWDuBPvv7X5W70fGuJZKFh8fGLPLxchn5Vg5E
         J2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2WXD2iuN6pAX6EeuItghKADIiBu6DLmqZqNZpUmEXOc=;
        b=cxmRV2Z3QB7KbePShgO4gSsP9iphXLO5JCRhP3uvBdYhopQHdW0iJH+M3Ozb8OUMEy
         U0htdnCe+JkbR5OniLlj8FfoQQYqcADomvotRCWSjUcNfUNm8XJb2PXtevgthKesN5CP
         vO8YnLeZM9waCh6N/d6Bjzi+b2CDhTSYycZF6z1EatdXJ2/xUnpCTlWrAMfnfm5Y78db
         /lZaXXOVabBl/xg4pPMirJ2BXAbLk05v2JsylRS4TccgCXAFrP343lUOoDwjPm38piLm
         ORvej/0wUGCLimmnwbWDbHON3czLBJhYKNUv6DyBd8AG8Uge0JBPTXoIFT8tjOrvOfGt
         p6dg==
X-Gm-Message-State: AOAM5332gW4PgdMhSLW2ABRRMbzRUmdM4VWLuqxpKS75fkk7XPvCx2H0
        fkbxFOS1hMGN2cZw7GjNAdQ9og==
X-Google-Smtp-Source: ABdhPJy2zx0uyPdG59VNJ1iJmbVIEDs1PL1AmyuQKjinnL1M/SJFFtLw2w90LUGh1zi1vgTtWzYpXg==
X-Received: by 2002:a05:6808:1925:b0:2f9:b8ca:8333 with SMTP id bf37-20020a056808192500b002f9b8ca8333mr2443295oib.12.1649788345125;
        Tue, 12 Apr 2022 11:32:25 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id r23-20020a056830237700b005b2610517c8sm14236071oth.56.2022.04.12.11.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 11:32:24 -0700 (PDT)
Date:   Tue, 12 Apr 2022 13:32:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof Wilczy??ski <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 1/5] clk: qcom: regmap-mux: add pipe clk implementation
Message-ID: <YlXFtt/+YwpMQ0va@builder.lan>
References: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
 <20220323085010.1753493-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323085010.1753493-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 23 Mar 03:50 CDT 2022, Dmitry Baryshkov wrote:

> On recent Qualcomm platforms the QMP PIPE clocks feed into a set of
> muxes which must be parked to the "safe" source (bi_tcxo) when
> corresponding GDSC is turned off and on again. Currently this is
> handcoded in the PCIe driver by reparenting the gcc_pipe_N_clk_src
> clock. However the same code sequence should be applied in the
> pcie-qcom endpoint, USB3 and UFS drivers.
> 
> Rather than copying this sequence over and over again, follow the
> example of clk_rcg2_shared_ops and implement this parking in the
> enable() and disable() clock operations. As we are changing the parent
> behind the back of the clock framework, also implement custom
> set_parent() and get_parent() operations behaving accroding to the clock
> framework expectations (cache the new parent if the clock is in disabled
> state, return cached parent).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-regmap-mux.c | 78 +++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-regmap-mux.h |  3 ++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
> index 45d9cca28064..c39ee783ee83 100644
> --- a/drivers/clk/qcom/clk-regmap-mux.c
> +++ b/drivers/clk/qcom/clk-regmap-mux.c
> @@ -49,9 +49,87 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
>  	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
>  }
>  
> +static u8 mux_safe_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
> +	unsigned int val;
> +
> +	if (clk_hw_is_enabled(hw))
> +		return mux_get_parent(hw);
> +
> +	val = mux->stored_parent_cfg;
> +
> +	if (mux->parent_map)
> +		return qcom_find_cfg_index(hw, mux->parent_map, val);
> +
> +	return val;
> +}
> +
> +static int mux_safe_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
> +
> +	if (clk_hw_is_enabled(hw))
> +		return mux_set_parent(hw, index);
> +
> +	if (mux->parent_map)
> +		index = mux->parent_map[index].cfg;
> +
> +	mux->stored_parent_cfg = index;
> +
> +	return 0;
> +}
> +
> +static void mux_safe_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
> +	unsigned int val;
> +
> +	regmap_read(clkr->regmap, mux->reg, &val);
> +
> +	mux->stored_parent_cfg = (val & mask) >> mux->shift;
> +
> +	val = mux->safe_src_parent;
> +	if (mux->parent_map) {
> +		int index = qcom_find_src_index(hw, mux->parent_map, val);
> +
> +		if (WARN_ON(index < 0))
> +			return;
> +
> +		val = mux->parent_map[index].cfg;
> +	}
> +	val <<= mux->shift;
> +
> +	regmap_update_bits(clkr->regmap, mux->reg, mask, val);
> +}
> +
> +static int mux_safe_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
> +	unsigned int val;
> +
> +	val = mux->stored_parent_cfg;
> +	val <<= mux->shift;
> +
> +	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
> +}
> +
>  const struct clk_ops clk_regmap_mux_closest_ops = {
>  	.get_parent = mux_get_parent,
>  	.set_parent = mux_set_parent,
>  	.determine_rate = __clk_mux_determine_rate_closest,
>  };
>  EXPORT_SYMBOL_GPL(clk_regmap_mux_closest_ops);
> +
> +const struct clk_ops clk_regmap_mux_safe_ops = {
> +	.enable = mux_safe_enable,
> +	.disable = mux_safe_disable,
> +	.get_parent = mux_safe_get_parent,
> +	.set_parent = mux_safe_set_parent,
> +	.determine_rate = __clk_mux_determine_rate_closest,
> +};
> +EXPORT_SYMBOL_GPL(clk_regmap_mux_safe_ops);
> diff --git a/drivers/clk/qcom/clk-regmap-mux.h b/drivers/clk/qcom/clk-regmap-mux.h
> index db6f4cdd9586..f86c674ce139 100644
> --- a/drivers/clk/qcom/clk-regmap-mux.h
> +++ b/drivers/clk/qcom/clk-regmap-mux.h
> @@ -14,10 +14,13 @@ struct clk_regmap_mux {
>  	u32			reg;
>  	u32			shift;
>  	u32			width;
> +	u8			safe_src_parent;
> +	u8			stored_parent_cfg;
>  	const struct parent_map	*parent_map;
>  	struct clk_regmap	clkr;
>  };
>  
>  extern const struct clk_ops clk_regmap_mux_closest_ops;
> +extern const struct clk_ops clk_regmap_mux_safe_ops;
>  
>  #endif
> -- 
> 2.35.1
> 
