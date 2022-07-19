Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9912578EF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 02:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbiGSANA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 20:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236582AbiGSAMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 20:12:53 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3054537F87
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:12:51 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10d4691a687so12933666fac.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pCnOpb/tAWKWPuLC7zFzL9Qy3rXC3raHyDODfytTBvo=;
        b=R4AhdQijFE22qPnuP8yQk+M/z15peEnGnkKXOCnjUdkAyL/8qYwcHUjbV158/lM6gk
         sOyavYbNdkIe+MD0G2ei2o1p0XnUtTA2n1crgGwCQOVlDSiuU1QNw148fxYCb2Hn2CZ5
         00w5GIrzsUT6WALe+OkBqMLXZNrKjZXV/x8xQSScsq84JE0y1I8C2OxrD2HrX35UrIDS
         s/8jkY6F3XIMtaWX2O0R0XXeLtxRgzpwC9QLHT8YzHdbcbRJC6PQXYNlK3gb97tugHze
         EAd1IOnVRw6dG/2+z2/q8ET2qWYmUZRPaLYmdlIiPl1rxuoxhQgPNeLNoyKou+G0Hlbi
         KeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pCnOpb/tAWKWPuLC7zFzL9Qy3rXC3raHyDODfytTBvo=;
        b=jk2OSMzOEYe6ukmsRWnWVNi3rWFjO/zo6fBDCzqo3o1UZDeZletrNx1dZKiGFhlh6j
         V8U9jHq6/Ck4/uOXPDSPwEdOaK/38upKTNj2KboiPz/36+ZNGKid/4Nj4OQXGi/sneBW
         Pa+eYwRKDULY2UhsEjXXWc8sGQ13motJPypIEPOuypCxUv2t63zG/FWUpGYmEKaI9Y36
         MBQO03I0z6vsqy8np1Mgp0y7nC6QgB2Vi22XXB0x2/3t8p9eQWrlWyNIpQtP7CjosRtt
         ZQrthqAofU66aeSntbEgudrBCeWOfcrJx5C+BbJ+5PLlRIAffaue9bsv9hNIRzIAuV3z
         LSHw==
X-Gm-Message-State: AJIora90BUrFCX8YFEiEnW6jIbeaNqP8LPU/Ylg/Cl1r+KgBpnGhVPFU
        QmI6dJOR5Mcl7nnVvGI9h0E/MQ==
X-Google-Smtp-Source: AGRyM1vHxTCyv1ECJGzC7VKq76lVZumQrcmY3StVxmqIC00SmPeiy/bVkrqijGWSzpEwnT9EqgONqg==
X-Received: by 2002:a05:6870:2423:b0:fe:4131:6db9 with SMTP id n35-20020a056870242300b000fe41316db9mr15575223oap.75.1658189570175;
        Mon, 18 Jul 2022 17:12:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n23-20020a056870559700b0010c727a3c79sm7214120oao.26.2022.07.18.17.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 17:12:49 -0700 (PDT)
Date:   Mon, 18 Jul 2022 19:12:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: gcc-ipq806x: remove cc_register_board
 for pxo and cxo
Message-ID: <YtX2///aNWyhKpJn@builder.lan>
References: <20220706225321.26215-1-ansuelsmth@gmail.com>
 <20220706225321.26215-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706225321.26215-5-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Jul 17:53 CDT 2022, Christian Marangi wrote:

> Now that these clock are defined as fixed clk in dts, we can drop the
> register_board_clk for cxo_board and pxo_board in gcc_ipq806x_probe.
> 

Are you trying to say, that now that we have .fw_name based lookup of
these clocks we don't need the globally registered [cp]xo clocks to
bridge towards the [cp]xo_board_clocks which was introduced in:

30fc4212d541 ("arm: dts: qcom: Add more board clocks")

I think this change would work out if you also replace .name = "pxo"
with .name = "pxo_board_clk" (and same for cxo)...


But I don't think we can just drop these, as it would break
compatibility with existing devicetree.

Regards,
Bjorn

> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> index 718de17a1e60..883629de2751 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -3384,14 +3384,6 @@ static int gcc_ipq806x_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	int ret;
>  
> -	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 25000000);
> -	if (ret)
> -		return ret;
> -
> -	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 25000000);
> -	if (ret)
> -		return ret;
> -
>  	if (of_machine_is_compatible("qcom,ipq8065")) {
>  		ubi32_core1_src_clk.freq_tbl = clk_tbl_nss_ipq8065;
>  		ubi32_core2_src_clk.freq_tbl = clk_tbl_nss_ipq8065;
> -- 
> 2.36.1
> 
