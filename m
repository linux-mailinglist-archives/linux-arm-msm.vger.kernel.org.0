Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3EB275BFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIWPfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:35:51 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39224 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWPfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:35:51 -0400
Received: by mail-io1-f67.google.com with SMTP id v8so17436836iom.6;
        Wed, 23 Sep 2020 08:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SFNrQMIkZSGzSXfxSnz2HMSRbPyQR0/tk0QCtxV27LQ=;
        b=huw7CxTzba4vieE2rddHa3ilfnuZscE/WHBAiSlZ8rzQUse6D/cJ+lgV9NKeIj5+KH
         8irfGfkC55U3drYXNiWc7MQNfwHkvXsZTvzAr0Vk+UzF52Gp1TYCaqja9cV6JltEF447
         2FZHJL/iHcs11vIb/6g0/JvRMsy5BBmH43FRQ6mu11Yzksj4T9oS42yYAwgmD7c+A3Vb
         07bpukjdWZkJKf2qG4SlvyAPJtSFyDk5LtjbDnDl2yBjy6XSSr8yhTi7acLwx9ibUOyM
         EA2HNwdAR87cEffLsf4Zbl4xCWVAyNSkEZvA29obdao14oZSRSkPnr/ICshO1IewDjW7
         mZfg==
X-Gm-Message-State: AOAM533TKZJ6J4vVaPpcl59KCKxo+cwaF/YFvrIu64v+M8rAP+WOUCY5
        pocjk874admrfSGmpThpCA==
X-Google-Smtp-Source: ABdhPJz4NDi2DPM7aMlx9HsGKp74UHvyZ9evLNEx9Eielqsipyamdybieeul0nPsIEzZpC1EMaYyDg==
X-Received: by 2002:a05:6638:220c:: with SMTP id l12mr8608241jas.139.1600875350509;
        Wed, 23 Sep 2020 08:35:50 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q2sm8042280ils.81.2020.09.23.08.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:35:49 -0700 (PDT)
Received: (nullmailer pid 792167 invoked by uid 1000);
        Wed, 23 Sep 2020 15:35:48 -0000
Date:   Wed, 23 Sep 2020 09:35:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 05/10] dt-bindings: remoteproc: qcom,q6v5: Deprecate
 regulators for PDs
Message-ID: <20200923153548.GA789614@bogus>
References: <20200916104135.25085-1-stephan@gerhold.net>
 <20200916104135.25085-6-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916104135.25085-6-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 16, 2020 at 12:41:30PM +0200, Stephan Gerhold wrote:
> Newer platforms vote for necessary power domains through the power
> domain subsystem. For historical reasons older platforms like MSM8916
> or MSM8974 still control these as regulators.

Do you plan to change these platforms? If not then I wouldn't really 
call this deprecated.

> 
> Managing them as power domains is preferred since that allows us
> to vote for corners instead of raw voltages. Document that those
> should be specified as power domains and deprecate using them
> through the regulator interface.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt     | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 1f9a62e13ebe..7ccd5534b0ae 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -113,8 +113,8 @@ should be referenced as follows:
>  For the compatible strings below the following supplies are required:
>    "qcom,q6v5-pil"
>    "qcom,msm8916-mss-pil",
> -- cx-supply:
> -- mx-supply:
> +- cx-supply: (deprecated, use power domain instead)
> +- mx-supply: (deprecated, use power domain instead)
>  - pll-supply:
>  	Usage: required
>  	Value type: <phandle>
> @@ -123,9 +123,9 @@ For the compatible strings below the following supplies are required:
>  
>  For the compatible string below the following supplies are required:
>    "qcom,msm8974-mss-pil"
> -- cx-supply:
> +- cx-supply: (deprecated, use power domain instead)
>  - mss-supply:
> -- mx-supply:
> +- mx-supply: (deprecated, use power domain instead)
>  - pll-supply:
>  	Usage: required
>  	Value type: <phandle>
> @@ -149,11 +149,11 @@ For the compatible string below the following supplies are required:
>  	Usage: required
>  	Value type: <stringlist>
>  	Definition: The power-domains needed depend on the compatible string:
> -	qcom,q6v5-pil:
>  	qcom,ipq8074-wcss-pil:
> +		    no power-domain names required
> +	qcom,q6v5-pil:
>  	qcom,msm8916-mss-pil:
>  	qcom,msm8974-mss-pil:
> -		    no power-domain names required
>  	qcom,msm8996-mss-pil:
>  	qcom,msm8998-mss-pil:
>  		    must be "cx", "mx"
> -- 
> 2.28.0
> 
