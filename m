Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7E53379D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhCKQqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhCKQqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:46:14 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65AEC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:46:14 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id p24so2047379ota.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l/1U5vc3zDX47LlCqTrjXX0iLGOV5x5fp7K+0BsABJs=;
        b=Sq/mvknOLOF/QZypkG3ttmBDkhKY+SDbZE1SK0GVwjb32X02rdKIlc9eY5yG7IWZzk
         4MFondXJKusyi3Zs/Yki9EZ9daQMQYulk2TuK1iVaIBHmuFwNyYwdDdspgG3GPRLShtK
         iGkB3mzec5uuMNYEkr4DzkSGWK9gCs8GZdTrlimz3mT7B+1FezN1da5p7NKLuSc9DrFZ
         Xllr3wrA94brZu7yHhncGWYe2iH1so734lF00S+CECEVt/7eKoNhGP7MrvY0GgSOtVIu
         YJnX1RQaY4x8KfeYjwctcW7ZIv5OwBht3/4RH33bhM85h7cdNzhHWo4a8YrOKOJkgxCf
         EGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l/1U5vc3zDX47LlCqTrjXX0iLGOV5x5fp7K+0BsABJs=;
        b=AwjXTFAVchYN7YVOD681hIgBBC6k/p+S0/+MhtXCApY4PQjSdMKXuNzLh9y7WH6gCK
         n1DzN3gpkeRUAz6zVDj3AFDRwb0Bnfrb3nqDWAhgNjrVAr7tDTDc2dg9BbOO0T8unP7s
         4XewzgD/W+9kamWMcuFqd9HYEYyj0z2UWhuBczVB6oDbgleYuy53LVguYOPLc15/l/Qm
         k4zCr70SvDZPMxmTAQK6/cOutOBo/CJqNBH/fIapgEe4fznxhpoYfD3GEw5xsw+DctAm
         UzZ1kyZYDUQ4vqqGVEUnReNrQ+OAj09fBwhLbvG2vBVxJHcBWEuGK/R7N59CfUAFTNVx
         R/vg==
X-Gm-Message-State: AOAM531Slc496QGhwUHVZYFqOSqVGpIN9sJjgNHTrglvUvBr1SJEgd5w
        DWcx0bIC9WrLmOEtJzyFG1JBrkgzM+z/cQ==
X-Google-Smtp-Source: ABdhPJxiCEFavjpOD0ZUqBAjEVyWs0zHAZ8Wud5m/5mUpEhM80rz3gxtpFR14QVCiUY9g4AHWpkGKQ==
X-Received: by 2002:a05:6830:57:: with SMTP id d23mr7267691otp.44.1615481174112;
        Thu, 11 Mar 2021 08:46:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f197sm655972oob.38.2021.03.11.08.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:46:13 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:46:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org
Subject: Re: [PATCH v3 04/14] dt-bindings: qcom,pdc: Add compatible for sc7280
Message-ID: <YEpJVEwojufxphAF@builder.lan>
References: <1615461961-17716-1-git-send-email-rnayak@codeaurora.org>
 <1615461961-17716-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615461961-17716-5-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 05:25 CST 2021, Rajendra Nayak wrote:

> Add the compatible string for sc7180 SoC from Qualcomm
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

This would better be merged through the irq tree, so please repost it
alone.

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index e9afb48..98d89e5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -19,6 +19,7 @@ Properties:
>  	Value type: <string>
>  	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
>  		    - "qcom,sc7180-pdc": For SC7180
> +		    - "qcom,sc7280-pdc": For SC7280
>  		    - "qcom,sdm845-pdc": For SDM845
>  		    - "qcom,sdm8250-pdc": For SM8250
>  		    - "qcom,sdm8350-pdc": For SM8350
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
