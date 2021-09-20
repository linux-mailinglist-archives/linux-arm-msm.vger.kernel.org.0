Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE76410EEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 06:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhITEUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 00:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhITEUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 00:20:49 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A0BC061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 21:19:22 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso14954562ota.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 21:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+0zIusT79rEl3tQEMjYWSIcpYjJVkEmHA6tnDGzl4z4=;
        b=T5D3d5C49TTWEqm0Gqnnxr6W09e+ae6LIAYzdsXNjXmuFivuY9eEIexv/riOqJDEfC
         8SVpjDnyiGuizA12IGXQWIpOcTdGk20V22hjQMR4ZwfJ92F7eVDb75QBq9VpFKBUc+Mq
         Kp5DwOAOHFhPrcDZW7Set69UAfAVFqpdoBuOX2soDfvMdiE7ykd8CUawAnxU+4I0sAw2
         VBSPa9ujFFspiyENZSUxg9/I19R3g3SDQXMYhZ0LvHN/itTots90dVuVd+b/525qRxbx
         esegTFBKiPp795Zh4DNQpYW/DeHMckbhAayoK477pXL+6GyOGPolZhGQQUwGQZUXsYno
         xZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+0zIusT79rEl3tQEMjYWSIcpYjJVkEmHA6tnDGzl4z4=;
        b=GYzB0+1bDkUnXh8cUgkxB5giMJBbjpU1dZbpixta2ROJowaFE3r/BVM8bOeKc+irHR
         CtRI1/Wia9EevOom63bfC0N7FwtmUQ8vHOCiF3MLir+ugJ5uNwybjFQGTi4/aXnhjhdr
         PlRZ1HUwiLEhDereTe9olehR8jDhuRNlbBuFfIaGNj89pfsXaUgULfeAOV1BJ7Kz7gFO
         V/fDzAZFO2dh5PRNBuRu8HrkFD4H2myoXmIx9Mi0ao6+DXM5orIB25+ar8Rlr9dkhVRt
         OM0Mf2TUtZJrC79u0A7JBXsljtrPGaRwcM4D6d+LKHSzAyBKZPhOg9jL1anLY7A6/P3f
         uIrw==
X-Gm-Message-State: AOAM532zoAONLSJXXPOhRAINtuIAl2LIPQYXMerpuArP95KEosGnSiwu
        yYOyVTAqDgDsPezqDUUKfWwK9ccsjlaAXA==
X-Google-Smtp-Source: ABdhPJzH0nBJB1Qtu9giAw30slJTq7+MJuJoDjlBg22NMkKAlYNZH0G9+dpqkbjuzGTlm+H4d/kFAg==
X-Received: by 2002:a05:6830:1355:: with SMTP id r21mr19055808otq.11.1632111561348;
        Sun, 19 Sep 2021 21:19:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r23sm3205383otu.54.2021.09.19.21.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 21:19:20 -0700 (PDT)
Date:   Sun, 19 Sep 2021 23:19:19 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq4019 standalone entry
Message-ID: <YUgLx7zKmD/QTCfn@builder.lan>
References: <20210909060450.10111-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909060450.10111-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Sep 01:04 CDT 2021, David Heidelberg wrote:

> It seems that some ipq4019 boards just accepted architecture.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5169ebb97946..9b6dd7dc3825 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -174,6 +174,9 @@ properties:
>                - qcom,ipq4019-dk04.1-c1
>            - const: qcom,ipq4019

It seems reasonable to expect that the board isn't just a "qcom,ipq4019"
and in that case I believe this should cover all boards.

Please let me know if I'm misunderstanding things.

Regards,
Bjorn

>  
> +      - items:
> +          - const: qcom,ipq4019
> +
>        - items:
>            - enum:
>                - qcom,ipq8064-ap148
> -- 
> 2.33.0
> 
