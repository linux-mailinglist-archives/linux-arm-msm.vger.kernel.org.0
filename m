Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D07E402A23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 15:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344865AbhIGNuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 09:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344900AbhIGNuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 09:50:21 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9471CC061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 06:49:08 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso12849428otp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZKPnvNF1nG8+W6yNbYSXeoKYI5gY0M+REzFTki3a8W8=;
        b=s8uJ8k5WsHJwSQTqbjT/Ro69aYHbfAaZ6P58wCSurU8gnUPUjgTUQY5OP4mnI3Da4e
         LKHAmvWMvd7SD0sj/+IqLTummhME09VpZ8C8KKCWPE0XQfR8kEObgH8Y0rFquwmdzPxR
         beKdLJWZM9+MLIJttl2PbBFqpweasmSjwwNdc91VJwQR4WbmrzI/Iv/hRiMLTE0umjdd
         T/DOUJ+r+d7pAA5JP6wrTSbEhHhcb4xS4YSys7igSUlsNUD8kolzRMvKDxUNGhB+5gI4
         IbCZOsfGGvJFFNsXe3vWC9Ou2hKoaj/aR2lawL2iZrqCUpmYvkU0ZR7Wu54ZQM7Ix4aW
         enFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZKPnvNF1nG8+W6yNbYSXeoKYI5gY0M+REzFTki3a8W8=;
        b=YTvJoiUrUM0WA5mUM2dR7csdwYvo+/VJoVniPZZYKq+1SPMME6EVX8l/opLCmM3AtM
         Jvwyv9qx6kgQ9rwKGpM8Sfn/NoyDRknDGcDVvZpLpIdP52jpBwW9B1T2NNzYlopAk3Jv
         3KlXm3u8ZJ7VerrPOzmtxju8aznMHbKgU+4WimjHMvkgY/blJjkYxjm7KMb17O1/tBUQ
         iD962mpdZmqXjNYeIOXeQWtr9Lo2Iwo8b9I+tMcq2ouRG6eif0UXSX0QagvjI7rhS0Sd
         mcJae6sBcAJb1+P8nJX1QoIr1N9UDLT70vbb5Jwi9/5hk3EnSPIFYUis0UiTDaqs6lku
         WjSQ==
X-Gm-Message-State: AOAM533RKAKbJqYJUtZSYLcutUqIIUSmLV4HEiR6abcHowA75nXQNdrD
        XNEhK7uVpNq7UXuB0kaPX3Zr0w==
X-Google-Smtp-Source: ABdhPJxOgJqbbRECRpG09kc5DklBurZ0ptKiSfkG5hC+0QVqKiI8CcS0w1sVyQmO6ltcTZO41kC8rg==
X-Received: by 2002:a05:6830:353:: with SMTP id h19mr15545460ote.119.1631022547966;
        Tue, 07 Sep 2021 06:49:07 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w23sm2134477oih.4.2021.09.07.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 06:49:07 -0700 (PDT)
Date:   Tue, 7 Sep 2021 06:50:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
Message-ID: <YTduDqCO9aUyAsw1@ripper>
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
 <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Aug 10:54 PDT 2021, Sandeep Maheswaram wrote:

> Add multi pd bindings to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index e70afc4..838d9c4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -41,7 +41,18 @@ properties:
>  
>    power-domains:
>      description: specifies a phandle to PM domain provider node
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: optional,cx power domain
> +      - description: USB gdsc power domain
> +
> +  power-domain-names:
> +     items:
> +      - const: cx
> +      - const: usb_gdsc

But "usb_gdsc" is a subdomain of "cx", why can't we describe this fact
in gcc?

Regards,
Bjorn

> +
> +  required-opps:
> +    description: specifies the performance state to cx power domain
>  
>    clocks:
>      description:
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
