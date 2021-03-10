Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FBC334385
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhCJQrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbhCJQrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:47:47 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8ABC061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 08:47:47 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id t83so9813481oih.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cgRubcZ8gr18dJhcvKQdRz6M5SF9Mz8KCxOcwqh5JmQ=;
        b=cqnjaqFB0OmWcdCXsjguLAYjjyYyP82rMBcE4lKkkX/QiviAZO8XzI4j9luqkOiBIP
         mhoGQ0yM6NIoNOrNsSnBEKfMbH/b0QUQYPtpvJD1IBKbMPqcMZ0Bu+58bi0PQr/b5z6/
         3mOga/X6KVAKsz7Qn55+ALzzXgbds2yV0aMITdx11vPYqpHJXNb56rNxgZ3cH0MlQqKg
         uqKPuPK4nOza1aPJU9HqyXGCTC6kj+6FUxweBnnoVFzn9/A+s3a1TbJJi3FtrL0oClmg
         /CMsvabp8KaRDfnePh6mRkWQkazFC61OjThNEskGPBsL7ndR211vkPcK92FimrfqDDx+
         UmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cgRubcZ8gr18dJhcvKQdRz6M5SF9Mz8KCxOcwqh5JmQ=;
        b=p/33jjiWCZ24eotDjIVpopqgs6AaBBpHMtnYS0W1dbVSERoGtMG1fPdiBOCU06ZfgW
         4UUGB5JAo8Uko0FCXl/nqOBTf6pinhKnLT4bFiEt+++sTtDmzYTP91ORBPqkbDpVAXbx
         NuXB69CygDuep6HwMQdiiDwXcWgNCdgDY5kIrkPmLecCk2BTmuHW9CJMeivhDDy1ehkg
         ldSnlZuwKT3xm4COOXzPhuVX/6ajhggMCe0rJQ0Pm9XcN1ZLdaf5IoN9X9XnrB71agqg
         n1oUnXkhJNMh8ZZINeI8vETswYVPLhMEwsFsIrQyUlljYLNNmlDjk8JhewjJLCm+/y4A
         Y5/g==
X-Gm-Message-State: AOAM532HhvfnbcUHeSJAh/fMRe/7Ap9qaIN8F5uyNM44DcsjxDK2YCDZ
        Nso1u1L70Gk3l/W5HNpi3V4PbQ==
X-Google-Smtp-Source: ABdhPJztaVdC+W5hHxektR9FJRuokTIP9WnnTNOujKJ5N09MgSgrQaMoN1U+uNB3eubmcsr7K0n9UA==
X-Received: by 2002:aca:bf8a:: with SMTP id p132mr2935725oif.9.1615394866584;
        Wed, 10 Mar 2021 08:47:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b21sm3588101oot.34.2021.03.10.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:47:46 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:47:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
Message-ID: <YEj4MKMervDzUO6k@builder.lan>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Mar 01:28 CST 2021, Rakesh Pillai wrote:

> Add WPSS PIL loading support for SC7280 SoCs.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

But can you please follow up with a patch that converts this to yaml?

Regards,
Bjorn

> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 35 ++++++++++++----------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> index 1337a3d..edad5e8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> @@ -9,6 +9,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  	Definition: must be one of:
>  		    "qcom,qcs404-cdsp-pil",
>  		    "qcom,sdm845-adsp-pil"
> +		    "qcom,sc7280-wpss-pil"
>  
>  - reg:
>  	Usage: required
> @@ -24,7 +25,13 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - interrupt-names:
>  	Usage: required
>  	Value type: <stringlist>
> -	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +	Definition: The interrupts needed depends on the compatible string
> +	qcom,sdm845-adsp-pil:
> +	qcom,qcs404-cdsp-pil:
> +		must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +	qcom,sc7280-wpss-pil:
> +		must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +		"shutdown-ack"
>  
>  - clocks:
>  	Usage: required
> @@ -35,19 +42,17 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - clock-names:
>  	Usage: required for SDM845 ADSP
>  	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> -		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
> -		    and "qdsp6ss_core".
> -
> -- clock-names:
> -	Usage: required for QCS404 CDSP
> -	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> -		    "q6ss_master", "q6_axim".
> +	Definition: The clocks needed depends on the compatible string
> +	qcom,sdm845-adsp-pil:
> +		must be "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> +		"lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep",
> +		"qdsp6ss_core"
> +	qcom,qcs404-cdsp-pil:
> +		must be "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> +		"q6ss_master", "q6_axim"
> +	qcom,sc7280-wpss-pil:
> +		must be "gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> +		"gcc_wpss_rscp_clk"
>  
>  - power-domains:
>  	Usage: required
> @@ -65,7 +70,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>          Definition: must be "pdc_sync" and "cc_lpass"
>  
>  - reset-names:
> -        Usage: required for QCS404 CDSP
> +        Usage: required for QCS404 CDSP, SC7280 WPSS
>          Value type: <stringlist>
>          Definition: must be "restart"
>  
> -- 
> 2.7.4
> 
