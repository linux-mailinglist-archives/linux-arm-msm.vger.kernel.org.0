Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47E5365C8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 17:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhDTPrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 11:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbhDTPrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 11:47:03 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754CBC06138A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 08:46:31 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id h11so8182627pfn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c8ssYGouwaSQxS4XvnAPrHZNGOh02XxZ6Rmplg6qhmE=;
        b=WjtM64E8tq5y3tsNgJD8zpjHOkD0+lTSBFiFcPBuTqRUG15VZ6PgXhq2ZR69a37Y4r
         W7yax5Y5dc/hcVfA1IHTDWVS/4FiU7/G8oc6lOV0eV8rDifWA1LeDphkkW/SuVG6cXGO
         VUouDPaFSnQqowsNCP+ytJ5sJnOfeRN0anlJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c8ssYGouwaSQxS4XvnAPrHZNGOh02XxZ6Rmplg6qhmE=;
        b=gjxFsHJ9NOBw7yh3H+qChDenRTS/3x7xFjWQiiXS5OQSh6R181+B4Dpkn9eopayPsD
         Fd4IoV9TxljcZ0iJfoqQdkX92f9J0sujdrsp6ZvoGz0iOMx8dVENwGQOmzL4rmA1SkPo
         ev4Rnh+tYCGxHf6xk6/r4IdAGBYr1YDx91MAJ9TJCW4WX+RCWcvnTYpTBaflmQYFJwAa
         dQCRPcARqoyvGwHRMYFjgxHfE67rob47pNLyhpcM8ssLwquSbjISPYa0F1OrHvlMj4xV
         RCBOWkL0iGvnlqZk9p1Q562THwoIWfXX9AE5kmt3BCECCwrw1W/cOmWqAYi60Wlk3yL/
         IdDg==
X-Gm-Message-State: AOAM531H20yp9hGEYp/9W5yxKqXmqTyahDgmeHLw16v4DsBRAtdK/VPr
        hNg+4YP1LM8nh1V5bUNbZNT4FFmiqjg4UQ==
X-Google-Smtp-Source: ABdhPJy6gy7LAnUoij0pvKq6YQ3cakdNrlN8b9JOHux4pmSWQsdyD+DrID/+VNIQjFqOiwzQTyczDA==
X-Received: by 2002:a63:1316:: with SMTP id i22mr17206048pgl.419.1618933591048;
        Tue, 20 Apr 2021 08:46:31 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7a9:7e56:e9c3:13e8])
        by smtp.gmail.com with UTF8SMTPSA id n85sm1593685pfd.170.2021.04.20.08.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:46:30 -0700 (PDT)
Date:   Tue, 20 Apr 2021 08:46:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V3 2/5] arm64: dts: qcom: pm8350c: Add temp-alarm support
Message-ID: <YH73VU+mSHodeTSf@google.com>
References: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
 <1618389266-5990-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618389266-5990-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 14, 2021 at 02:04:23PM +0530, satya priya wrote:
> Add temp-alarm node for PM8350C pmic and also modify gpio
> node to add gpio ranges and "qcom,spmi-gpio" compatible.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index 2b9b75e..e1b75ae 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -13,13 +13,43 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8350c_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
>  		pm8350c_gpios: gpio@8800 {
> -			compatible = "qcom,pm8350c-gpio";
> +			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>  			reg = <0x8800>;
>  			gpio-controller;
> +			gpio-ranges = <&pm8350c_gpios 0 0 9>;

a separate patch for this would probably be preferable, but I guess it's ok

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
