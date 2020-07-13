Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D6121E0E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 21:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGMTi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 15:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgGMTi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 15:38:59 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9B3C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 12:38:59 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id q17so6455486pfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m1cPmH+hFXrNBeuHVfceQp+ZKi7rr5KGkoahmXXlTpc=;
        b=ArYa7GKnxfKy/XekmLKd1+ZnWE4Eg6I4UU4+OKmmLrwXdnc56kNSOYjrPaUt099Sls
         u8IB1YtXiKVrsQMMYDO4jSG9wIEv4LLd08ILqh4GKk3KLAHzURA6/Zc2DR8kG6eLs4b7
         BJtW5pmIahiNelrizIOnhJiEU8MIiqa2Ih3PwT3WT7o2OJl4eZCk4O4bIq8fQZspvc59
         25PR4vIo6ZB3LAZCJfYoPNyA51nFnCcjwF4obr42R4BtB4F1pt6WziuffgL7XRzA5ql+
         2AArRgTqKmkuG7T+aED3DUQqWanG71c3x7PjKN4nzo3k9i496q0ugI8tW//+tEJCHRRZ
         J/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m1cPmH+hFXrNBeuHVfceQp+ZKi7rr5KGkoahmXXlTpc=;
        b=rYYajlJFUnHa52ArH6/1CMb+IMeocw+Pa9bt0JN4MeX23H5kc21fYBr4lvRUDaHUlS
         zFAGEa01fJjzw3jQ0PAZCfmJbh8sCYGbU5W5jh5irvpFw1NTnm+Su8QBJ4eXX4Q+Wjk/
         SVjbv6PGQajDov2YOkHYb4NZ/iNIn6QqfY5Nx1Q8qRkQ+8/82Lk1SGQnAeznHfuDMru2
         l+oYzmKUWJZLiq5rmhbBG5uTOomFnr4lWJSWOgjX8Zm0kwdO9qJeC568ToUDk60lhunj
         /+ht014u0I8+PKa1i1ti3SglH1ISiLQOBxm8G+YG4dzHNLZPTeIxUL4JCrPFWFySk3+U
         +UMA==
X-Gm-Message-State: AOAM532LXAxUvJHfcJugkDA2pG8bDVW1gadiuBPJRayOke4DKMAyev+F
        cpNlSeynkaCvSxRsY7v8PbZVqA==
X-Google-Smtp-Source: ABdhPJyIR701lX4zcq/mDuzWOuwYckJ9T8VeG8AiIhMwwek593fSPu/by5Xh72G/oC6bd6Jw2x3AQQ==
X-Received: by 2002:a63:cf49:: with SMTP id b9mr570890pgj.31.1594669138418;
        Mon, 13 Jul 2020 12:38:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h194sm14224374pfe.201.2020.07.13.12.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:38:57 -0700 (PDT)
Date:   Mon, 13 Jul 2020 12:36:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] mailbox: qcom: Add msm8994 apcs compatible
Message-ID: <20200713193650.GC1218486@builder.lan>
References: <20200624150107.76234-1-konradybcio@gmail.com>
 <20200624150107.76234-6-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624150107.76234-6-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 24 Jun 08:01 PDT 2020, Konrad Dybcio wrote:

> MSM8994 has an APCS block similar to 8916, but
> with a different clock driver due to the former
> one having 2 clusters.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 12eff942708d..5125ca3533d2 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,ipq8074-apcs-apps-global
>        - qcom,msm8916-apcs-kpss-global
> +      - qcom,msm8994-apcs-kpss-global
>        - qcom,msm8996-apcs-hmss-global
>        - qcom,msm8998-apcs-hmss-global
>        - qcom,qcs404-apcs-apps-global
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index cec34f0af6ce..6d892136e0e6 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -41,6 +41,10 @@ static const struct qcom_apcs_ipc_data msm8916_apcs_data = {
>  	.offset = 8, .clk_name = "qcom-apcs-msm8916-clk"
>  };
>  
> +static const struct qcom_apcs_ipc_data msm8994_apcs_data = {
> +	.offset = 8, .clk_name = NULL
> +};
> +
>  static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
>  	.offset = 16, .clk_name = NULL
>  };
> @@ -146,6 +150,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
>  	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
> +	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
>  	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
>  	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
>  	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
> -- 
> 2.27.0
> 
