Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE83CA209
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 18:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGOQQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 12:16:06 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:43940 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhGOQQG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 12:16:06 -0400
Received: by mail-il1-f169.google.com with SMTP id w1so5458483ilg.10;
        Thu, 15 Jul 2021 09:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=INqydYVqBnEozqGm9V1u8oUYFOYwO8CFRCdoptgUzv8=;
        b=L6hSUrsU9QfY4YadNhTzsjwC6NdSZnwnLzlzh793xKx2S/dlq9BAxdSuVqCDcTQ0rN
         JuvfXzdBhvIoLbW8UXAziDA2PmmXVd2RZUgLOkmxhY1xhVbI/pKW4kCLKOBrlMPqm9zf
         +tvjDGrQuOpsmCJk1DrdxeDU4H+dEuV3zp7LYvk/1tsGYPLlVZBjGcSLKuqHw9siesG7
         sCNIp5Qx66NJEmdgw5UipAJflaZ6feGm4c7b9nmupFILEMzpmtsAH2OZ3N4MSpqK1AQs
         4CodZEkGGisfCuxHA+NKQQQiBy6d7LeIfaOW0/whPUExrs1lZMaLXb8b73m+t49Xre9S
         IduA==
X-Gm-Message-State: AOAM532intFE3jjqjPOGWuxhkrqQoLuDLItVRvCK2ifXD2jV7EpVbDhS
        NZJ6Ir+ETpP1z3EYObInrQ==
X-Google-Smtp-Source: ABdhPJyM8wIs0dlQi7v3/BdJc9ArZh2RqFdkIyWotDVluHG+DyKTsTkEBu7lmr86PJOuuRRWPh9eXg==
X-Received: by 2002:a92:a005:: with SMTP id e5mr3129206ili.22.1626365592974;
        Thu, 15 Jul 2021 09:13:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t11sm3124669ilj.63.2021.07.15.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 09:13:12 -0700 (PDT)
Received: (nullmailer pid 1172210 invoked by uid 1000);
        Thu, 15 Jul 2021 16:13:10 -0000
Date:   Thu, 15 Jul 2021 10:13:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi S <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: qcom: aoss: Add SC8180X and
 generic compatible
Message-ID: <20210715161310.GA1160636@robh.at.kernel.org>
References: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
 <20210709174142.1274554-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709174142.1274554-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 09, 2021 at 10:41:40AM -0700, Bjorn Andersson wrote:
> Add a generic compatible for all versions of the AOSS QMP to the
> binding, in order to allow a single implementation for them and then add
> a specific compatible for the Qualcomm SC8180x platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Mention the generic compatible in $subject and message.
> 
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> index 783dc81b0f26..3747032311a4 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -18,10 +18,13 @@ power-domains.
>  	Definition: must be one of:
>  		    "qcom,sc7180-aoss-qmp"
>  		    "qcom,sc7280-aoss-qmp"
> +		    "qcom,sc8180x-aoss-qmp"
>  		    "qcom,sdm845-aoss-qmp"
>  		    "qcom,sm8150-aoss-qmp"
>  		    "qcom,sm8250-aoss-qmp"
>  		    "qcom,sm8350-aoss-qmp"
> +		    and:
> +		    "qcom,aoss-qmp"

Are you going to update all the dts files to add this?

Rob
