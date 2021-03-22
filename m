Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F645344AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 17:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhCVQSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 12:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhCVQSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 12:18:15 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465FBC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:18:14 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id b7so22264540ejv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5fPU70P+apIZaZ90738281RBQVtiFO6xyPzB24/nFj0=;
        b=PPVMKoO2LmrxB/EqF6MdsVCuOvCwzdnYIGu2CT53plAQh+yZIwJP+JPbBQG8Mez/X4
         dL+oIx21/VF4Hq39I/bVUmtrzWJmFH7xgszYCiT6J/He6X7upD15585k4QOPFADu+/eD
         QGre1T0qcLb0GWCg+tAd2MOaQpSFdYMLRvJ9ocygy2vTtaMWSScKS0tdYl6wOAWqz4wo
         LuanlAHsC/rGWiQE/jkEUFFhBiiHpYDaYCa8eUN8gX7TC4Pna+GrsqForZ85Nrxp3sbW
         U9FgvTr2gCIpDVhOQvLw9b1r+gGjYEy2RnlbmW5LH+1/GPpC1dGpGaafVjfP69uGspZ+
         3Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5fPU70P+apIZaZ90738281RBQVtiFO6xyPzB24/nFj0=;
        b=CC4cJwN5GDevHWTM/iaceNadbPLSq2TCjEryRDYpvEvOK0cVyrpeqaRBHTLtYFR1lV
         BSlTq6UPIX+80wEefbLPy/B4NrwtAAKQ43gGvHl9P4VfTrN2exDYw3vr7pKiamiZ09/x
         dlmIYUToCHuTfrd+66MZzdibAobXT9N9jG0uDLgUlPNck5gvoaVM+FC8zZGfAnvEcQPw
         eG8tBid79ysxkRwrhRK/Gg/4REPHaNLqvNitt7Qiss6xH7/QKHWPiwHgmAzudjNpD0fm
         FH5qv4Nrll08lSVaCHMp0MXbN1zAFsOJycrYcOlnVYhIRVbNyOWUaQ3GoA6nnkZshyy6
         tMQQ==
X-Gm-Message-State: AOAM532U+tMCsOGtJAjZSPlf/uBXcwEtRWqNzuGhlQdWPPaF66Kd5Cci
        lsG7l67ZgdUHoKgut7Et/QBZZg==
X-Google-Smtp-Source: ABdhPJxWxOTWcNLPwlbFuHUTnCQvbb7chDavRLIX6ffZBF7loKDa89ZLnniTNDnUEtQqJ6ccAuewSw==
X-Received: by 2002:a17:906:b316:: with SMTP id n22mr539237ejz.249.1616429892990;
        Mon, 22 Mar 2021 09:18:12 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id q12sm9950268ejy.91.2021.03.22.09.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 09:18:12 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:18:10 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210322161810.biagj2qro66rv4gt@maple.lan>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3bc7800eb0a9..497b9035a908 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1704,6 +1704,7 @@ static int wled_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id wled_match_table[] = {
>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> +	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
> -- 
> 2.30.1
