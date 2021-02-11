Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFB6319287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 19:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBKSws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 13:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhBKSwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 13:52:44 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998A0C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 10:52:04 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id k10so6133476otl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 10:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OVkOWiTcef92BZcXSFNKI6urGv4ClWKqZ2aHBAwr9WI=;
        b=OcKtPxTMPJ/pI5h/KaWloIQ13BI9MrFfYMnPg8duScubygGcThI6E2xXB64LlL6ubT
         l6A6w3WjIxITYaBdZvnWhSpbX3kEGtxW/lS84byVX6UzXpL78+Suf8SNIYStVsamPob/
         4TywyNhn7bkqLbDxNxNWkPxWBxOBI/fC0uP/GEZ1JYSJOmrYVAZ7v2mXU2OJVyJJkJfQ
         FBoBD9I2C2ogJ/YmvzqfQUueaAbKAgNBGXNqO+KWrlNB1Nin66InnfiYX01UFOrA+or2
         e1ym18sWol82D+9QLEBkjfSrLZcYkk77QtbbSIQn54G4kDYzKphdrSHM/JglFmm8qNvX
         L2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OVkOWiTcef92BZcXSFNKI6urGv4ClWKqZ2aHBAwr9WI=;
        b=hUEc9ypilGPqIVKA01LWtcpBFv4TNaUT2o+y3qEWKGVABEZVbeqyT4iDoaFwNimSne
         FhQVrBufveAhGbey5rkEIL4+HSELCPULCfExkMAMY1N+SMhoaPVviQw7uHTOX5e7ORmk
         9w2AETIfiUB/bSonnlcg2dbHvP+xIBr+N0bmmQpJN6+9Zbt7XO5VZKV0OWNmZYO+1sS/
         iqIilwMvF97iBRRmSVAE7VTJjhBY5bztaW0utJzWsSGqpjSEZo12HoX1F9MmS7aIhO/0
         ul3cYSWjc6jrddjk6MrKZDBDWv8C+UBsqzg1pitz7YtADyGVanQ77lpiBxcgmdQN6k9s
         KTPw==
X-Gm-Message-State: AOAM532UpyOI+Ay9+DWGBPVjb5nq6rTggxb9tk4dMgWJl/hoXNL/hdtb
        mvBYgkv2ngUUj/fwFTVFDJRUxA==
X-Google-Smtp-Source: ABdhPJwf6gkTQIas5Mts7gamBTwBrwhQ9GsZm1U8X195GnlW/kAkgV8Ivieym0/0ILPnR3HQuoP/Vg==
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr6796757otl.145.1613069523801;
        Thu, 11 Feb 2021 10:52:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b21sm122655otq.4.2021.02.11.10.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 10:52:03 -0800 (PST)
Date:   Thu, 11 Feb 2021 12:52:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8350
 remoteprocs
Message-ID: <YCV80dfkxXEPBveo@builder.lan>
References: <20210210104539.340349-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210104539.340349-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Feb 04:45 CST 2021, Vinod Koul wrote:

> Add the SM8350 audio, compute, modem and sensor remoteprocs to the PAS
> DT binding.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 54737024da20..41eaa2466aab 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -25,6 +25,10 @@ on the Qualcomm ADSP Hexagon core.
>  		    "qcom,sm8250-adsp-pas"
>  		    "qcom,sm8250-cdsp-pas"
>  		    "qcom,sm8250-slpi-pas"
> +		    "qcom,sm8350-adsp-pas"
> +		    "qcom,sm8350-cdsp-pas"
> +		    "qcom,sm8350-slpi-pas"
> +		    "qcom,sm8350-mpss-pas"
>  
>  - interrupts-extended:
>  	Usage: required
> @@ -51,10 +55,14 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8250-adsp-pas:
>  	qcom,sm8250-cdsp-pas:
>  	qcom,sm8250-slpi-pas:
> +	qcom,sm8350-adsp-pas:
> +	qcom,sm8350-cdsp-pas:
> +	qcom,sm8350-slpi-pas:
>  		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
>  	qcom,qcs404-wcss-pas:
>  	qcom,sc7180-mpss-pas:
>  	qcom,sm8150-mpss-pas:
> +	qcom,sm8350-mpss-pas:
>  		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
>  		    "shutdown-ack"
>  
> @@ -113,14 +121,18 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sdm845-cdsp-pas:
>  	qcom,sm8150-adsp-pas:
>  	qcom,sm8150-cdsp-pas:
> +	qcom,sm8250-cdsp-pas:

This should be sm8350, I fixed this up and applied the patch.

Thanks,
Bjorn

>  	qcom,sm8250-cdsp-pas:
>  		    must be "cx", "load_state"
>  	qcom,sc7180-mpss-pas:
>  	qcom,sm8150-mpss-pas:
> +	qcom,sm8350-mpss-pas:
>  		    must be "cx", "load_state", "mss"
>  	qcom,sm8250-adsp-pas:
> +	qcom,sm8350-adsp-pas:
>  	qcom,sm8150-slpi-pas:
>  	qcom,sm8250-slpi-pas:
> +	qcom,sm8350-slpi-pas:
>  		    must be "lcx", "lmx", "load_state"
>  
>  - memory-region:
> -- 
> 2.26.2
> 
