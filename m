Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768AC1EDCEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 08:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgFDGGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 02:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgFDGGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 02:06:23 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8E3C05BD43
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 23:06:22 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q24so702251pjd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 23:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wSUOXIjPIqvXRdtIPsOKER88eB6mQwHB8BxVGXTrHbI=;
        b=gPuwbWv0S/+O9VwhBZiCsbdU7ZqJLcrxTT1b6p3dpa+ERoTE1FyivuxyHG4AC6oegJ
         d8tszDHimq78/YuNXNFfTLnOx3jeoSUmARTO4kASS4W4qv/OMOdMsB7NqjDhXn5btitW
         oBdkcvbwSdaksWBszTNV1guz/tUn+n84UG0D8nxGbdLngx53ioSrWfJqQ5J5+ccU25Jg
         wlXJow0pWmAyMWYkI6gjTB0ViX95IQmklncHOqDFx210fPflr3AWaaD2EH/xXlnyh3eX
         e9HgwhC9594rotQ8iuhhGqQLzxILSo/0chAm2eQAEcfubZZV29JUEaHqPoH4ppzhF8lk
         fLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wSUOXIjPIqvXRdtIPsOKER88eB6mQwHB8BxVGXTrHbI=;
        b=JC9RAhU6KLrEmxKptE6vu28dIv+FTPNCvTI6yEtxLcQCPdrKLmKwIDx9H6Cw+R8Bh/
         /CGCgUKupVpBaY6WREKaJhlMePYL3p9ftkAk+CwSkIaCa+/4O5xr5VpLz9YHy1Hrtvmh
         zvRf0slW6Kp7LRFqC3kTE4L5evijkSeFrm5tgL7XR/k1QWAuMM8Layz6PSL0bJ7E7Cxy
         BiVIP+R/rSYwGrmtjfb7mizTl+oEVVZf1tresrm25g3z7SA4aKT12RNRAHmHbhsWnDjk
         hgzLXMiupkBROaZSXFcM7seRTK6W0bnj+vx4pzoQVMzbLG91q+vCBdDq4J/wk15/RrVa
         uE/w==
X-Gm-Message-State: AOAM531qCB/M1N2+rdxHSmqCH2rD95KPkAfnjoBvGbP6IeEgos9StdX5
        PvOeEvB7W2mY7XZQRp9Wp4V0
X-Google-Smtp-Source: ABdhPJyokjSpZ//8KnXDyF5Snq9dAmOwmmHlXyQ0DtErxGVoeH0Whmm/V4yAXMYE5J+xXpbJxzsWIg==
X-Received: by 2002:a17:902:7602:: with SMTP id k2mr3108154pll.296.1591250781888;
        Wed, 03 Jun 2020 23:06:21 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id r8sm3484924pfq.16.2020.06.03.23.06.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 23:06:21 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:36:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: add watchdog device
Message-ID: <20200604060613.GC16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 03:43:31AM +0300, Dmitry Baryshkov wrote:
> Add on-SoC watchdog device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 972d8e04c8a2..f1641c6fe203 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -1662,6 +1662,12 @@ config {
>  			};
>  		};
>  
> +		watchdog@17c10000 {
> +			compatible = "qcom,apss-wdt-sm8250", "qcom,kpss-wdt";
> +			reg = <0 0x17c10000 0 0x1000>;
> +			clocks = <&sleep_clk>;
> +		};
> +
>  		timer@17c20000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> -- 
> 2.26.2
> 
