Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633D83157F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 21:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhBIUsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 15:48:53 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:43346 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233538AbhBIUj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:39:27 -0500
Received: by mail-ot1-f47.google.com with SMTP id l23so7085582otn.10;
        Tue, 09 Feb 2021 12:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+b3no4S6tPR9GkQZ2NNZiFO6SO8UXN4Y7IGlIsfkFlU=;
        b=QPJOcmpOC24+6nRh0F1ozsOzjLixbnOAPyfioFk7Kw7U7Jqro+rQUBthLyKMW/FQaM
         /fYlee7mljzzBL2oTvINasZKbqP5XVOpGG42aa1pwbZydg+zKPvwWBqf3LuTeGVs0ooT
         dffs+3Unehe/i3HujegJ+f4M3nexC1Xa2ISIgv6qfFY2zK1UItVsxMeIcjyUNFIXA0cr
         zHh4vHzE2ChIn6vEFYcURVzCFKqgcsL5aSPOFdY9VgGdrnfdHJ79O+a6R5+iW3g71heo
         PN9Ulck2gRDftJtqrHjBAxun7EKbqYIW+FsRHCDKOGtsG62vykhpMyHFFo2seqKC1Bd7
         oplQ==
X-Gm-Message-State: AOAM533iK5bab2FkkS+0y+NJTZfCHWDNxLUCATFaTNXXA1zqekqQ8s8U
        CDEX5TwrM5E1go/VnAYRMQXwF4Szdw==
X-Google-Smtp-Source: ABdhPJwCMhN9eVCFYtSeCIytQ3vC3Cr8S0JoccLSz2ofPHGeOKWnLItB/sMia+njhoBRERRsV//MPA==
X-Received: by 2002:a9d:4d0a:: with SMTP id n10mr16869282otf.73.1612903085857;
        Tue, 09 Feb 2021 12:38:05 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i9sm4473410oii.34.2021.02.09.12.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:38:04 -0800 (PST)
Received: (nullmailer pid 131928 invoked by uid 1000);
        Tue, 09 Feb 2021 20:38:03 -0000
Date:   Tue, 9 Feb 2021 14:38:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom_scm: Add MDM9607 compatible
Message-ID: <20210209203803.GA129939@robh.at.kernel.org>
References: <20210131013058.54299-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210131013058.54299-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 31, 2021 at 02:30:57AM +0100, Konrad Dybcio wrote:
> Add a compatible for MDM9607. It uses the "legacy" calling
> convention.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  drivers/firmware/qcom_scm.c                             | 3 +++
>  2 files changed, 4 insertions(+)

In the future, please split binding changes to separate patch.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> index 78456437df5f..df8379356021 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -12,6 +12,7 @@ Required properties:
>   * "qcom,scm-ipq4019"
>   * "qcom,scm-ipq806x"
>   * "qcom,scm-ipq8074"
> + * "qcom,scm-mdm9607"
>   * "qcom,scm-msm8660"
>   * "qcom,scm-msm8916"
>   * "qcom,scm-msm8960"
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7be48c1bec96..b5b9b13d8d29 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1265,6 +1265,9 @@ static const struct of_device_id qcom_scm_dt_match[] = {
>  							     SCM_HAS_BUS_CLK)
>  	},
>  	{ .compatible = "qcom,scm-ipq4019" },
> +	{ .compatible = "qcom,scm-mdm9607", .data = (void *)(SCM_HAS_CORE_CLK |
> +							     SCM_HAS_IFACE_CLK |
> +							     SCM_HAS_BUS_CLK) },
>  	{ .compatible = "qcom,scm-msm8660", .data = (void *) SCM_HAS_CORE_CLK },
>  	{ .compatible = "qcom,scm-msm8960", .data = (void *) SCM_HAS_CORE_CLK },
>  	{ .compatible = "qcom,scm-msm8916", .data = (void *)(SCM_HAS_CORE_CLK |
> -- 
> 2.30.0
> 
