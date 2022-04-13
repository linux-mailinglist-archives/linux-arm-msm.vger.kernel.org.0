Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAEB34FED2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 04:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiDMCyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 22:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiDMCyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 22:54:12 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048E02FFDF
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:51:53 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id q189so722589oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HVH7QAhZQB3tg5B5cSKsQRo5YTnVdUYXR/8k4eeHpb8=;
        b=BFfQqJtXcBpAOHK6q3+PfT6Vgeqp3P9SBAApVncmmxq1KFjC/2ONP+RWb9k1ntzk8z
         j5QbZd9rzEPOYSj/vGO/2mEs6QNGpzApmDra/GfX6ml3aOUwhpvqmszU3V3DbpysYqdD
         OxV28cSIOQuSw3SicfYHSKHU3dKatUQvKUvXHtnzqpVSVvIYRjWuoJm5hKvXLOSGyjvX
         1PXqInK1npNQMJxoY64XjEQij6wOJAsKUR+wv5svp/HQfMrWshOGymonGIhSEGMFQDSy
         5YzSDw3H+295t2EBWO9KWSZrzPMsrDtB9NhvQIlPE5ilpEAuoJqTw2a0WvyDm2kYYfcS
         ibkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HVH7QAhZQB3tg5B5cSKsQRo5YTnVdUYXR/8k4eeHpb8=;
        b=2UMK/I/A22ymExLPj/DKhv7QXHtaClYVQBYdt3hZo8O1gTAYIKqf77CA32vZCw1fyO
         PwT7Mlaq0CEe8s4FQ7ZvnboUt7N6N+GnHVH0+hnwaQPrHD8QVpf6+zWeIxbQjz2SM9YU
         qdtmtv+8JMHg2Qt+K23CueW3DtwWQ1Aud6EUuL0sCRITWdmCYVyDhadqmGA1Nw7tGpVx
         7fiBioEFy3zVW8oMSdF4t6yDmkMs2a5ckmqwCEaJmFgHk1GOVhirica7bBDlEqtFAScl
         hZUIXbUbOdPSs5miq1CnBNHeAW5iHWI9GfcAC3rL+VamOvngGngd4GL6bp1AH++Hwt7B
         sb/A==
X-Gm-Message-State: AOAM530tTS6fMQuKXKeWOE1fuTHw279J/9I5b8cnBvkanexBYTCfJiiI
        Gyou0SeBN1GSvsbBlkSvFwdkHg==
X-Google-Smtp-Source: ABdhPJwU80osdz4iRKvX1GLyQTFHMYsg1auB0Qa2q6sWvsEq+gM/08tDznpKsJBqB3dND5znwKo9XQ==
X-Received: by 2002:aca:df03:0:b0:2ef:895e:7373 with SMTP id w3-20020acadf03000000b002ef895e7373mr3136939oig.177.1649818312373;
        Tue, 12 Apr 2022 19:51:52 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id r81-20020acaf354000000b002ecf46e8016sm13083003oih.51.2022.04.12.19.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:51:51 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:51:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/7] clk: qcom: add camera clock controller driver for
 SM8450 SoC
Message-ID: <YlY6xYvy+Zzo9Bmm@builder.lan>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
 <20220314114252.1636683-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314114252.1636683-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Mar 06:42 CDT 2022, Vladimir Zapolskiy wrote:
> diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
[..]
> +static struct pll_vco lucid_evo_vco[] = {

const

> +	{ 249600000, 2000000000, 0 },
> +};
> +
> +static struct pll_vco rivian_evo_vco[] = {

const

> +	{ 864000000, 1056000000, 0 },
> +};
> +
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3E,

Please use lowercase hex digits throughout the patch.

> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x32AA299C,
> +	.user_ctl_val = 0x00008400,
> +	.user_ctl_hi_val = 0x00000805,
> +};
> +
[..]
> +static struct platform_driver cam_cc_sm8450_driver = {
> +	.probe = cam_cc_sm8450_probe,
> +	.driver = {
> +		.name = "cam_cc-sm8450",
> +		.of_match_table = cam_cc_sm8450_match_table,
> +	},
> +};
> +
> +static int __init cam_cc_sm8450_init(void)
> +{
> +	return platform_driver_register(&cam_cc_sm8450_driver);
> +}
> +subsys_initcall(cam_cc_sm8450_init);

Camera isn't critical to boot the system, so I think you can replace
this with just module_platform_driver(cam_cc_sm8450_driver);

Rest looks good to me.

Thanks,
Bjorn

> +
> +static void __exit cam_cc_sm8450_exit(void)
> +{
> +	platform_driver_unregister(&cam_cc_sm8450_driver);
> +}
> +module_exit(cam_cc_sm8450_exit);
> +
> +MODULE_DESCRIPTION("QTI CAMCC SM8450 Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.0
> 
