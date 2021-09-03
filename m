Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8659140035E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 18:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349940AbhICQe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 12:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235689AbhICQeZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 12:34:25 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F89C061757
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 09:33:25 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t1so6042629pgv.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tqMg1ZebpCNplH/x6OLfzFPMVt1JW72f2Hu9Wiq2UWc=;
        b=HnWKqjrTmBKv1PyyWr+sEF0WLQvRSvWmijEvLEPO6ZGJYkB96BbKxmDzXO5bEVkNX0
         Gye0CJ1csIVvZi8XD+4ae++jUySAp5kkfTghNWYupSN2tSAMPs8/Wpag2Eh23zVGKRlf
         jc/vYfuXkkusmhG79jqu0+r4s4r/XQpAOsdfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tqMg1ZebpCNplH/x6OLfzFPMVt1JW72f2Hu9Wiq2UWc=;
        b=gVySTpma4rXcWf/ec7nhqFNxga/qWhAcqLyTlCVhGJqRX08t1QetavBWE+v5hj3OWb
         87AuXBJTTX9NRGGfr1NImsUL/JagoWvztkGtxP2yTduTlwc4ioPkKKMkVy04xR5CVa4g
         eHBRRkDteUN565ydJpUkbkySF63BRRfjzj9Qh3i5ksAUfqS3wNd3+2nXht6nPwnSKNM+
         XT+aH5T5OchLbAwEZjH50Pm0crGkWrWXL3OWjNFcVpmeiKmAO6j40R10f52Gq2Q9Ey6r
         m/fdUIi7+MedmLhq1ea2HeQkYtV7Ovh9NvsfDvVWgSpVO90IhyN+ev/liDJQAHzmvIb8
         5+pg==
X-Gm-Message-State: AOAM5339QEoueywNYl07B7MAzQKztGRUJ12s21bxetlflSNjDkOEXeRx
        aMWMjSAr0QMCEBwR8vTArfHMnQ==
X-Google-Smtp-Source: ABdhPJw1enRwqkfNnYs1tJ1J4jtIZtEfyJa5iYoj/xe7pu98hWndi/JcWDD+rKPRbERxiEHXvx2Xqg==
X-Received: by 2002:a63:1e0e:: with SMTP id e14mr4372914pge.5.1630686805312;
        Fri, 03 Sep 2021 09:33:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:80b3:9f00:3170:fd8b])
        by smtp.gmail.com with UTF8SMTPSA id q126sm5940224pfc.156.2021.09.03.09.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 09:33:24 -0700 (PDT)
Date:   Fri, 3 Sep 2021 09:33:23 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V7 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <YTJOU/oVWSdxD1uz@google.com>
References: <1630643340-10373-1-git-send-email-rajpat@codeaurora.org>
 <1630643340-10373-4-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630643340-10373-4-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 03, 2021 at 09:58:56AM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 684 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 682 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 7ec9871..5c6a1d7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>
> ...
>
> +			qup_spi0_data_clk: qup-spi0-data-clk {
> +				pins = "gpio0", "gpio1", "gpio2";
> +				function = "qup00";
> +			};
> +
> +			qup_spi0_cs: qup-spi0-cs {
> +				pins = "gpio3";
> +				function = "qup00";
> +			};


I think we still want this for all SPI ports, which existed in previous
versions:

			qup_spi0_cs_gpio: qup-spi0-cs-gpio {
				pins = "gpio3";
				function = "gpio";
			};

It just shouldn't be selected together with 'qup_spiN_cs'.

Maybe a follow up patch would be good enough, so:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
