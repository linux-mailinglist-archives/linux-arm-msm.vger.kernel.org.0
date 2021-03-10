Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AA63334B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhCJFJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:09:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:56682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229762AbhCJFIm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:08:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 189EB64FEF;
        Wed, 10 Mar 2021 05:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615352922;
        bh=XLMTeCIJNduQG9mTktvo7Qp6KxOYA96vDonTJLJkh0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ge+Vz72eVPVxMF1tyOaWp0gne+QB8qtppQzFygQRJ625gavlxkBLgcfT1FneED+m2
         koSVdPZmv3gOo/7sgUDiuPeQlLLtNj5Gnevwj6KDawEf8h3F2Suq1cQVBZMlE4Gdlx
         Z9wJkdURp6lDh004OGlXSHYAvDD68SoPwhHvVo5HjD7xwTluM/3Y09sHSejXg78abN
         dgSikue9ngCuGS1OCmpAHt51NtUL7hhBGT13xSRHDq9l0cNHZ5GUAh1z2u+gmg3IKa
         46BKFpa1O3iLQWT1yQG7z4DSYaxM+KoKELj+zBrq9vfSK7QblY1JRZcGINTlUpGwR5
         uaJatDYY1BiVw==
Date:   Wed, 10 Mar 2021 10:38:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Add SM8350 HDK
Message-ID: <YEhUVVFwpTlfwMgW@vkoul-mobl>
References: <20210310035710.2816699-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310035710.2816699-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-03-21, 19:57, Bjorn Andersson wrote:
> Document the SM8350 Hardware Development Kit (HDK).
> 
> Reported-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 174134f920e1..9d8acf6f6152 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -187,6 +187,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,sm8350-hdk
>                - qcom,sm8350-mtp
>            - const: qcom,sm8350
>  
> -- 
> 2.29.2

-- 
~Vinod
