Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD55439EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 21:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhJYTLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 15:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhJYTLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 15:11:20 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAD5C061348
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 12:08:58 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so16313872ote.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 12:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZE0JjpM0Q0zc0juqFDJv2RQLlUG83Wb6ZoaI1HZesAo=;
        b=Wq5mVuShBIeBPE2dq1ZkvKSVLHMCfkf57+Einu/HhZmxCD936+t5cWrh/KjN8u8u0K
         P48MOo/AkfEKnUdQUQJwgpFMauNviKDltHCXjuOO5dB7SO4htW0KPOhnnyzWGlNpAqgv
         aw+6DDXpW7BFazuGsDdVTHA86MtUipaL/GF2XHzdCUvjJHQ/msCHiyA32AfNAGY8uDxG
         MtRoWsylBI8WXkOm1fyBw5l5tSh2aWMtaOjQ+8o/J5eiJuPKj5s+KH5eZF0qUGS+3zbn
         DBhWsQRKfF8xm5rcFoEMa+26LBBrHYLN7jj+RfqVJAuqE3d9wf3Drr3d+rvKXQd8PH4c
         uSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZE0JjpM0Q0zc0juqFDJv2RQLlUG83Wb6ZoaI1HZesAo=;
        b=upPmxcSJ1ZUm0VbvnT6wbb2hgmadnkImEi+06apTILcjNVdCCYluAK6P0CVrmx4Xxv
         gZv7vgpV765qDk/ASsewXcTvV5/ZX9LsFDDU9U8giugG8C/bpfUpjXeT8bnySnZ8cGxa
         SMKEpfXCPmKQtuQo0cGnJQ30lwQgWJT/KL0V2ukKmSQJ4JuycaUZDDaDcLeGGATBoWbt
         IuDEjWifXnJZCR3oV9ZJxo3IdSVgrcHlvJVH/2LrHPStBB51FP2K+x8SFS61Hb8SPcrT
         rILjck/LF9cyIBzm2Qo+Fn6z9tgBAF/FgIygIXiRn4TURyC2IIQc+i3fUZDTiK1x6lmM
         CJvQ==
X-Gm-Message-State: AOAM533ekA70R+yQGGCWTT/I9SpfCAI2/R2UsbPVFik+Db54Yq9+hnoP
        /RiyZHIYMj+wOs7JRAaTRxgj4Q==
X-Google-Smtp-Source: ABdhPJxlyTnzcofbiP1oX8Ba0MWnwWVwrptFxsPu2kUurL3/DE7+Q/biKrqFKURTKRYPGhkSoHLIwQ==
X-Received: by 2002:a05:6830:1ad5:: with SMTP id r21mr14695613otc.98.1635188937533;
        Mon, 25 Oct 2021 12:08:57 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k7sm1539121oiw.58.2021.10.25.12.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 12:08:57 -0700 (PDT)
Date:   Mon, 25 Oct 2021 12:10:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd
 bindings for dwc3 qcom
Message-ID: <YXcBK7zqny0s4gd4@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Oct 02:07 PDT 2021, Sandeep Maheswaram wrote:

> Add multi pd bindings to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
> v2:
> Make cx domain mandatory.
> 
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 2bdaba0..fd595a8 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -42,7 +42,13 @@ properties:
>  
>    power-domains:
>      description: specifies a phandle to PM domain provider node
> -    maxItems: 1
> +    minItems: 2
> +    items:
> +      - description: cx power domain
> +      - description: USB gdsc power domain
> +
> +  required-opps:
> +    description: specifies the performance state to power domain

I'm still worried about the fact that we can't just rely on the USB GDSC
being a subdomin of CX in order to just "turn on" CX.

Afaict accepting this path forward means that for any device that sits
in a GDSC power domain we will have to replicate this series for the
related driver.

I mentioned this in v1, but I don't think we reached a conclusion.

Regards,
Bjorn

>  
>    clocks:
>      description:
> -- 
> 2.7.4
> 
