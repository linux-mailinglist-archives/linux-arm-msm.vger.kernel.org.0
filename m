Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E021A4BBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 00:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDJWFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 18:05:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42040 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgDJWFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 18:05:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id 22so1570316pfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 15:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WJPAqjvaGysQuB90nzKXpbDUa7LF339sB+AetSfbwOI=;
        b=bTMY0271bIDACX85sLdIjwrpr38A6MyN24d/CCWrHTx0/XKvE8MUzZEFf14gdPz2oZ
         AVjkCPW5j5X+xfwOAoO0IxhCJUD2CpItPvdzElCUv285RgWWnseoU00xPNDpamK0AMd/
         OaSeO90jVwzwuIFX6Vd8sPEykKepXxxnQypwx3PMk2GmR3lbo3FGjSCawqv4GO3BvCFR
         tDFFx4Ye0OsTkuQ2Z1/tVIO0X0ggnQrUdX2PLrLgFjyCdjHfVYZP+0C2FBXf7V0mI6nK
         NuMLZmB8r2XAlyDG9/2HrLHMv5VH4Rr4kfns84hCoRXWAAgtERBhZ98X91pgkQlNxDbM
         mKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJPAqjvaGysQuB90nzKXpbDUa7LF339sB+AetSfbwOI=;
        b=U+RK8WNPjbkgrbtZ4d6kLLBCJakfOZwv7EtctgfyFwgFN2kIXTIfc/y5g5sTP3Mjm/
         HAjd3XccQtThMVc1Pwg5UQuWuCxJbl/j8WhkId0zT/sShb58eqXGkAORTFTLvUPo5+o7
         d1mml3Amh0g/UElTKiC+SIL8PA/oxQdfHkQEBimON/uSSJ/wplOcYzH7oFIsu6CEEgTl
         sj4xHHrCyOwM996n1fZllFv/oOXlbMTWVtUtiRMhI29c/F6JD5TaP3s4sVOQQe0gWPWx
         Kib9BvaiMvhPzULxZ1t8yTszlcb4p5eUZIUvMkF/vOSlGtqxzWAPrltg1fdEVVC1BQ9W
         UZ4g==
X-Gm-Message-State: AGi0PuatGj7LVR7sJQSHhQBxYE+41YYWxulS17Dz1TScrQy954uW2fpT
        HwQIjf5SHKZDwZG7LSKK/4O+Xw==
X-Google-Smtp-Source: APiQypLe08RXuFzmmwjUjIbmVyTfuoHtXvruSQlyRMlPzYCGDdLB6bl5Wq6T5eCwFT1SoVHnG6sY5w==
X-Received: by 2002:a63:d709:: with SMTP id d9mr6189744pgg.82.1586556331029;
        Fri, 10 Apr 2020 15:05:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 203sm2684025pfw.25.2020.04.10.15.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:05:30 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:05:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add ipq8074 usb dt
 bindings
Message-ID: <20200410220540.GC20625@builder.lan>
References: <1586543372-13969-1-git-send-email-sivaprak@codeaurora.org>
 <1586543372-13969-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586543372-13969-2-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 Apr 11:29 PDT 2020, Sivaprakash Murugesan wrote:

> Add ipq8074 qmp phy device compatible for usb super speed usb support.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 18a8985..d60c845 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,ipq8074-qmp-usb-phy

I believe you're missing a "3" here.

Regards,
Bjorn

>        - qcom,msm8996-qmp-pcie-phy
>        - qcom,msm8996-qmp-ufs-phy
>        - qcom,msm8996-qmp-usb3-phy
> @@ -166,6 +167,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq8074-qmp-usb3-phy
>                - qcom,msm8996-qmp-usb3-phy
>                - qcom,msm8998-qmp-pcie-phy
>                - qcom,msm8998-qmp-usb3-phy
> -- 
> 2.7.4
> 
