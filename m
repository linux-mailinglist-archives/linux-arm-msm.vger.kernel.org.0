Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C655D2F98F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731039AbhARFGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731011AbhARFF6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:05:58 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3810DC0613C1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:05:18 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id p72so3819522oop.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1cA8KQOVzAZi1qthCDCnnRXj/Fv2EJ3SpZpVbcIQrlI=;
        b=iwybqSthJFoyWkVGMOhvVQJbpQdH+N3CwYI4L0pp/wKChuQhNJua1QIuJAgiEuJwbb
         lSCNJV+CSiB5LFHR3F1+WKBdFJ4l3GSsB3uA6DknRxUoalRyFjMyl0/96fOZ3wCC6kIB
         OA6GeOqIi6TfYSoxyIiaifhRnNDmcwHbcBYPiwHN0hFg5gdZxiEaQUyxHjuCAfBoXbj8
         2uT3sTRAvPCQgJpJhNtNNjENdTPWaaTBHvHhPukahxdJgaSXOmBTAKovBrvKQxU/MiKb
         x2int3iIkZaiuw5hYXdCDaoAXl8XCNKVDq5qOxWLggT3LD+979IPH+TPhcWseyG7esad
         4HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1cA8KQOVzAZi1qthCDCnnRXj/Fv2EJ3SpZpVbcIQrlI=;
        b=qfQL/LLmQ1CynQzCNVorDDwM7vOJVJ7RTBheZ3VIZg8kxR29eoEolFcVPyb29wIiiz
         XJbAWK4JJAU4kWNKK8KF3BY4e8PkZ+kMPXxVvom9aE+9rl53d6TZhin0wD4WAVFfc7Kx
         szrOgtWIQ29Q+PijGJGOBFSX8R21ya4pt4hTXMqD0VLV/f+KDmrsRzSlvYb5nd7wnS0c
         HPTiwVJ8WiWapTCJRplsAG04jFmwSIAHo5u5I7/46JMBhsN5/PGm/tmPTocYJdIgiRc6
         8UWkJ5PRUokqya3GWy+6uWXqebupd8AV19/XQR6Y+K33Nh2xfSbvCVjtaaciIXcxPVOT
         GbQg==
X-Gm-Message-State: AOAM530flmIujECfQ9HfyytscJYMcZYotDSS9tr+ETTNxOSn3uLNyJzk
        hErJGszeyZoP2OHrkDFNI94Auw==
X-Google-Smtp-Source: ABdhPJzQW+rHISa9y9+fn/1pREshRpEry/PTHq3JBUQqeyNAK11p/H6DXGulx8qGnue1rTF25F336w==
X-Received: by 2002:a4a:364a:: with SMTP id p10mr16140161ooe.48.1610946317656;
        Sun, 17 Jan 2021 21:05:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w11sm2034729otl.13.2021.01.17.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:05:17 -0800 (PST)
Date:   Sun, 17 Jan 2021 23:05:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 SM8250 and SM8350 bindings
Message-ID: <YAUXC/90mUt6R9zz@builder.lan>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-4-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-4-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Jan 11:47 CST 2021, Jack Pham wrote:

> Add the compatible strings for the USB2 PHYs found on QCOM
> SM8250 & SM8350 SoCs.
> 
> Note that the SM8250 compatible is already in use in the dts and
> driver implementation but was missing from the documentation.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index 4949a2851532..ee77c6458326 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -17,6 +17,8 @@ properties:
>      enum:
>        - qcom,usb-snps-hs-7nm-phy
>        - qcom,sm8150-usb-hs-phy
> +      - qcom,sm8250-usb-hs-phy
> +      - qcom,sm8350-usb-hs-phy
>        - qcom,usb-snps-femto-v2-phy
>  
>    reg:
> -- 
> 2.24.0
> 
