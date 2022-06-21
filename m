Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51BE35535D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 17:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352650AbiFUPVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 11:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237311AbiFUPVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 11:21:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CD328705;
        Tue, 21 Jun 2022 08:21:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id g27so12782612wrb.10;
        Tue, 21 Jun 2022 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=qd+fXNIigO6bT/TI4/YvAL8F3wpHGElIc1OVu6S8MEo=;
        b=hm+qUkm+3WNmF/VXhDTQ7wkhJUBeAZiFDPrDnEp8BWAeR8d3pFOZeDGCyK1N39ydx0
         yn8pHHS0DXq3j8mR/JozSCkdo9RTvoNhnzYbPtyzqGiyQzxGCzmQzCBrM7T24pHY7K/m
         7fUZHwx7l0mi4092IciMkNS+PfTw1X6n0fxqXrB+vDJyS/Ydl2MnVH38Awygy9hd1y3K
         L4jcq8kOeXqn0m/mHeM53cn+C1yzvT29hbEVXUQK/C6bcOoHaUwdq32A+AEt6677EbVr
         toLz3Yz2L/2ZVww0CFftAe58d2/nT4CH26d/AAAKG3nahAP4N6Bt0/KJMX1XhRQB3VNI
         tLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=qd+fXNIigO6bT/TI4/YvAL8F3wpHGElIc1OVu6S8MEo=;
        b=uBpcz58g2MTjqG/E45Pz0RLak2h7up0vpt4JrE7BIbhkBi5F/E93Bu+CbUTq1ATHhT
         neih6YfBldgSmh/p3BDUSEhdjzErUFfwsOEPzv8X9PqIPrXmqWsv+a9EuydFsNRJVZ7w
         ewcRGtrO9HEo1i1xOcI1sQxoc6lQswAEqznpCpBBXQinNmOXymiXZGsb9y71BwuRiYkc
         M1O3Qy+7ruBX/PMJEIPdji4fX70OgNxxjXN7dfh68X9mATyNSiDbJbjCgIJJF1Qzkxjk
         6bBCtTtj47UfD+WdiIPHQ7v1kaWNphLcnl/APaxfk/vYEatRDLwhhGfYWBRDF4g2oaum
         2TOA==
X-Gm-Message-State: AJIora8ACHyB5JxYq4zPRk+2Ie+iXSP69OES8mjobAoAE1FUEaCBND9n
        W5wJHiVSGuzR5xetp9ZjY8w=
X-Google-Smtp-Source: AGRyM1tQfP7qGqIvY8mVsTifRoAdgXmtbjWBgNERiEbu572ag1ss0LEijGLxMRoKfsRanU1QFaSf7g==
X-Received: by 2002:adf:e801:0:b0:21b:873f:ed62 with SMTP id o1-20020adfe801000000b0021b873fed62mr17015242wrm.17.1655824875093;
        Tue, 21 Jun 2022 08:21:15 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id f23-20020a7bcc17000000b0039740903c39sm18405298wmh.7.2022.06.21.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 08:21:14 -0700 (PDT)
Message-ID: <62b1e1ea.1c69fb81.aafda.3244@mx.google.com>
X-Google-Original-Message-ID: <YrHh6YN6WiGOH1d4@Ansuel-xps.>
Date:   Tue, 21 Jun 2022 17:21:13 +0200
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 21, 2022 at 12:51:50AM +0300, Dmitry Baryshkov wrote:
> Use parent_data for the last remaining entry (pll4). This clock is
> provided by the lcc device.
> 
> Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> Cc: Ansuel Smith <ansuelsmth@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> index 718de17a1e60..6447f3e81b55 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
>  	.enable_mask = BIT(4),
>  	.hw.init = &(struct clk_init_data){
>  		.name = "pll4_vote",
> -		.parent_names = (const char *[]){ "pll4" },
> +		.parent_data = &(const struct clk_parent_data){
> +			.fw_name = "pll4", .name = "pll4",
> +		},
>  		.num_parents = 1,
>  		.ops = &clk_pll_vote_ops,
>  	},
> -- 
> 2.35.1
> 

Hi my intention was finding a way to directly reference the hw clk from
the lcc driver instead of using fw_name/name parent data. Wonder if that
would be a better solution... Seems wrong to me to eventually add also
the pll4 clk in the dts to correctly use the fw_name definition (when
that will be fixed in the ipq8064 dtsi)

-- 
	Ansuel
