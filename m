Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EC01B6A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 02:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgDXApR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 20:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgDXApQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 20:45:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3FCC09B043
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 17:45:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y25so3935050pfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hOf+x2Y/Qe7ScdzUkVaxYfAFCfFShTVPAhN8bzkGnXg=;
        b=gpboAXekQ409ikcKnsJINuleZnjwZW1LBae+1wFSPlBf4tiLiWDNQ50LbNngeu9sf/
         Xgw9IU+pc6c9DnwvAakrbtb4HLsIk+0g2BZkddeMsg4+2/8PQEIz10vKTmoT/NhZiFmK
         B48ElTPt8fsDWhuiJLmZE1NkMURXV9l0CNq1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hOf+x2Y/Qe7ScdzUkVaxYfAFCfFShTVPAhN8bzkGnXg=;
        b=UiCVxQT411DzFkeodNxdj2UxR1+Y99gtrdtW6qYbQh2as2C2A1dJTiSorRhuwSEPiu
         tElZxJflt2O5vCdmFFPABU0Q3ufrErXLns+oD1G8NkUUP59LCmG/i8uOcUIJ/MaExE2p
         dL0p64nDbU9VyzDiebr1jt1XyDlLi3/MFVocQmJe7FrXzajNHyVfUsp2ZKlpcULDjlgA
         5SAzkDGUrPsUmZfKrYrhklqLx+Bt4lxfrx7pYiu//zPpR9ZaORX2wp6JDELZLprlKhEF
         3UGmGyuIFZly/PbOdzj5eJGfgOIHMpXoOQ2JGrmcOS1ZQtMzz26WNbt/G+c0Kn2ZT0nz
         /KQQ==
X-Gm-Message-State: AGi0PuakzMOfbtBzvF7qr5b2RhC/wxq7CCzyjjrSzQu5AawKredim3zH
        gPqTJXrTiguIzTLzv2jTg29MoA==
X-Google-Smtp-Source: APiQypIyIZtDVKhOHp8Y5kuCR8rED5XYlhlovTxBBx+WS6MOfMqJu+zBJGNouJUoijlxSK6x5TwpPw==
X-Received: by 2002:a63:41c2:: with SMTP id o185mr6315849pga.139.1587689114561;
        Thu, 23 Apr 2020 17:45:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y186sm3166133pgb.69.2020.04.23.17.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 17:45:13 -0700 (PDT)
Date:   Thu, 23 Apr 2020 17:45:12 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom-qusb2: Fix defaults
Message-ID: <20200424004512.GL199755@google.com>
References: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 23, 2020 at 11:10:27AM -0700, Douglas Anderson wrote:
> The defaults listed in the bindings don't match what the code is
> actually doing.  Presumably existing users care more about keeping
> existing behavior the same, so change the bindings to match the code
> in Linux.
> 
> The "qcom,preemphasis-level" default has been wrong for quite a long
> time (May 2018).  The other two were recently added.
> 
> As some evidence that these values are wrong, this is from the Linux
> driver:
> - qcom,preemphasis-level: sets "PORT_TUNE1", lower 2 bits.  Driver
>   programs PORT_TUNE1 to 0x30 by default and (0x30 & 0x3) = 0.
> - qcom,bias-ctrl-value: sets "PLL_BIAS_CONTROL_2", lower 6 bits.
>   Driver programs PLL_BIAS_CONTROL_2 to 0x20 by default and (0x20 &
>   0x3f) = 0x20 = 32.
> - qcom,hsdisc-trim-value: sets "PORT_TUNE2", lower 2 bits.  Driver
>   programs PORT_TUNE2 to 0x29 by default and (0x29 & 0x3) = 1.
> 
> Fixes: 1e6f134eb67a ("dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters")
> Fixes: a8b70ccf10e3 ("dt-bindings: phy-qcom-usb2: Add support to override tuning values")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 144ae29e7141..f8bd28ff31c1 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -97,7 +97,7 @@ then:
>          - $ref: /schemas/types.yaml#/definitions/uint32
>          - minimum: 0
>            maximum: 63
> -          default: 0
> +          default: 32
>  
>      qcom,charge-ctrl-value:
>       description:
> @@ -130,7 +130,7 @@ then:
>          - $ref: /schemas/types.yaml#/definitions/uint32
>          - minimum: 0
>            maximum: 3
> -          default: 2
> +          default: 0
>  
>      qcom,preemphasis-width:
>        description:
> @@ -152,7 +152,7 @@ then:
>          - $ref: /schemas/types.yaml#/definitions/uint32
>          - minimum: 0
>            maximum: 3
> -          default: 0
> +          default: 1
>  
>  required:
>    - compatible
> -- 
> 2.26.1.301.g55bc3eb7cb9-goog

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
