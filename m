Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEBD303F85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405661AbhAZOAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405664AbhAZOAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 09:00:22 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D80C061D7F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 05:59:36 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id v1so16211909ott.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YTsupxga+KtJHJ2/NwGiOg8d0eBxSmIPJj1rUhYEku0=;
        b=yZ54dQI7WHPKCbJ+/b1AnRgCgElbV/u79mPNAInoK/gifKSkO/cgksWh5+YswXIUkB
         X66rUBm/PkWwkTrXbSReCtBrnOhvjVVXExV7yfeos0jPSQtjTz/uvEuZBr5hZDojhvWw
         HjbWc2KUBDg7j66deFQaLawYvG8xk7JH/zhjA9WomtqszMWICRrnb75pOLKC70hxQ7E6
         7IF7FmTP1IrI8um/tg2lYWbR9IdUBZ0wsrhKjQxosu9T0zTJ2efRETym6gkwsr5+1l85
         BD1XHMN6NXPUh9Rt1Yi4Vpo4e57AGV60/0R6oGQZm2sVDLhOy6h9V3cK+mRs98Tt67CK
         S0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YTsupxga+KtJHJ2/NwGiOg8d0eBxSmIPJj1rUhYEku0=;
        b=BFJOqlIEubLHrXScQrw8L65QapEp9IQEAZx6lc7KTuvRUmiAFELg79pizU65npLPlk
         SJ/rXYoCXzGkaqI7eLgNpKgYU0sXYsDnYcJS0H3loU//UXlDeDtHSwL+41Ge5w8/etcS
         uwnR5ZHER/wXtumohixL4SqMygWSdeg9Z3002jD2MtO4ujsNcorhVnmNN0DqDbwPAttM
         odPLMgKFzmHQ/FUunw4eJ9YX4eNk5F+PcBxxkmnp0/WAOmF4ANm6HDLUwfdvmjXajOnw
         Li/lut876LZ7C7hG0UvAUsivB2bzzPxTHnwppRWbRahGHTWSpWu+X6RBbjnyaGJEssBM
         Y+mw==
X-Gm-Message-State: AOAM532O0fLzoQ0coACone/t53c5l21FGPt/5jNwv1yiaSunDFRMPTuL
        68RQWAYl3o69fyoQ9weD3c6cVA==
X-Google-Smtp-Source: ABdhPJymcp9pMAiu4zVhoCug/E78peraXZ+L6YX6ZbPuuw5jYLiWmahXMCax5kRqBawVjHCZAWMf+g==
X-Received: by 2002:a05:6830:1614:: with SMTP id g20mr3941554otr.77.1611669575430;
        Tue, 26 Jan 2021 05:59:35 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z3sm4126369ota.80.2021.01.26.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 05:59:34 -0800 (PST)
Date:   Tue, 26 Jan 2021 07:59:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/21] clk: qcom: clk-regmap: Provide missing description
 for 'devm_clk_register_regmap()'s dev param
Message-ID: <20210126135932.GC1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126124540.3320214-5-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/clk-regmap.c:97: warning: Function parameter or member 'dev' not described in 'devm_clk_register_regmap'
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/qcom/clk-regmap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-regmap.c b/drivers/clk/qcom/clk-regmap.c
> index ce80db27ccf2a..92ac4e0d7dbe2 100644
> --- a/drivers/clk/qcom/clk-regmap.c
> +++ b/drivers/clk/qcom/clk-regmap.c
> @@ -87,6 +87,7 @@ EXPORT_SYMBOL_GPL(clk_disable_regmap);
>  /**
>   * devm_clk_register_regmap - register a clk_regmap clock
>   *
> + * @dev: reference to the caller's device
>   * @rclk: clk to operate on
>   *
>   * Clocks that use regmap for their register I/O should register their
> -- 
> 2.25.1
> 
