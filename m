Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67D53C3242
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 05:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhGJDdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 23:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhGJDdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 23:33:51 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2070CC0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 20:31:07 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so11549726otp.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 20:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=628XlwR0qY2cfM6R9xRL/FEnuuCOAFzEXqSiz//9b68=;
        b=qfWkF+Sqrkh5K+66fQnOvQcVgs3gS97rI2z9q1i8PSoPmRBqw2EynL9TDIkS8ln0pW
         lzEoFCzopYcMM9OWO/Ba/Jbv2yjTZpDEogAy+gURxWPk+8TugtvLNnTCNxT40S3MEGpi
         H0lXhdq8gnm4XW8iYwsmQyGLwVYdbFexm/BcMnJtAJpih56MnJKXgyUcRF1vhCYAjtyM
         UsVpN6qZGQ6FiKnns6OTguJT7UhcxSu+gBMy0jPNcGwliamCwW6cQC7m/9iV8p1Ym61M
         Hf9XEsmzg1qUrROGJeBQH9vVx2Xt6vXYVUaipow1pNZpSVW3jATWemFpshW06xCEtvI/
         aSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=628XlwR0qY2cfM6R9xRL/FEnuuCOAFzEXqSiz//9b68=;
        b=XTx9mleMSj7qLKd1iZj98qqtPRbVVcR2eoLHAOw2AUWEJbe3gLUlFrr5gXXoeTTEP5
         vIw9reqiiE7ThsYtIL/m9NDX+4ux5ZYwgiKc7BncECiw1N8TSGXVd1+PGoC6OvsFO/bj
         DUwvuBRfD3PRd9J2omcbV6RfLDond972qE1obc7z7hOyfkuaJVvUQfW6IRkW745KqKVj
         1h8OYyd/n7ldLPWtNovhq/wsyg7YWxKR0ZhqyD2ogTWcLi7IzoeDOscD4D1O9uxtgBby
         i8xrDLkS2WbiaF8fTHTrwcTT6NMPi2qEK7J4AvW0ztfMaD46TzYcuD5SvONteLi3s2yg
         lc9Q==
X-Gm-Message-State: AOAM532gOEfWXekDHZc4IOiGKXTEytPxHFtFbkG4v4e2nLhTKfJx+Z55
        acAu0SvKBVxVhXqTYtR+olADXQ==
X-Google-Smtp-Source: ABdhPJxtddVvy7AlxqGl7cdNcA0g5E+M2xFoVJ0okMmuet0quLQh0YL5ldkb7hb/C21TqcjHXXVuzw==
X-Received: by 2002:a05:6830:85:: with SMTP id a5mr7670999oto.154.1625887866376;
        Fri, 09 Jul 2021 20:31:06 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y18sm1585169oiv.46.2021.07.09.20.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:31:06 -0700 (PDT)
Date:   Fri, 9 Jul 2021 22:31:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 5/5] dt-bindings: clock: Introduce pdc bindings for SDX65
Message-ID: <YOkUd3B0vvclk7un@yoga>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-6-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200339.17638-6-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 pdc.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

That said, this patch is independent from the clock patches and would be
picked up by a different maintainer than the clock patches, so including
it in the same series only risk complicating the pickup of the patch.

And with that in mind, looking at the recipients of all your patches you
forgot toadd Stephen to the clock patches, Linus is not involved in
the clock patches and you completely missed the irq maintainer.

Please use scripts/get_maintainer.pl to list the appropriate recipients
for each patch(series), to ensure that your patches will get the
attention they deserve.

Thanks,
Bjorn

> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index e9afb48182c7..7bdbffb572dc 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -22,6 +22,7 @@ Properties:
>  		    - "qcom,sdm845-pdc": For SDM845
>  		    - "qcom,sdm8250-pdc": For SM8250
>  		    - "qcom,sdm8350-pdc": For SM8350
> +		    - "qcom,sdx65-pdc": For SDX65
>  
>  - reg:
>  	Usage: required
> -- 
> 2.32.0
> 
