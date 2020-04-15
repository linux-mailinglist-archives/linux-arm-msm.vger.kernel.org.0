Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420871AABCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 17:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506429AbgDOPYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 11:24:43 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43319 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505511AbgDOPYm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 11:24:42 -0400
Received: by mail-oi1-f195.google.com with SMTP id j16so13776881oih.10;
        Wed, 15 Apr 2020 08:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jhBF/0NDo7VWagdd1bbsqqHnNKZNs8SZkRbVtCJaHvo=;
        b=qE6cFqBzL9Y0TlEtOgt9XHYqzKx8UNpBYvk53CeOGCjBqm41rm1SskfTQT5gN3QIvM
         zkpTHTMjjm4sTEMWV30edO2yqaBa1O5dDpF6D7vDT0bGuyApAn/cMWP3VtxwwDVSCoQD
         /dS74/FNTJXvJqUZN9scaHKnzhWT45RZyVbJ5OF/Z5diuxQgLjg2JYBz6blCmOQAohWx
         7d4zy3Oelxe3/HO/BtHzeSfBOpAHhH1c5lyKa225yz27XLnPeB6mhkSjzZBUc79p1Iim
         s8KSFz69r7DsOwfsl928YAtKnCIVOukBrrBJI4uAapVSOgcKATU/W0a3AuEv5eOu69FO
         Vgnw==
X-Gm-Message-State: AGi0PuYR0ZJ0UDAQQdMZ8N526kohM1Mq37z1eg8NN9BD63ArFKLR8g+4
        olsLxxlVFk50TeW7+ReDiQ==
X-Google-Smtp-Source: APiQypK60RgLEmAsFyOZF/N+fWwAL92n4oq7mY6wF7D/JLdoeMdx6S6XMdXiReUTulsqlMeSpxJPaw==
X-Received: by 2002:aca:dd55:: with SMTP id u82mr19163342oig.27.1586964280896;
        Wed, 15 Apr 2020 08:24:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w6sm402075ooa.6.2020.04.15.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:24:40 -0700 (PDT)
Received: (nullmailer pid 14651 invoked by uid 1000);
        Wed, 15 Apr 2020 15:24:39 -0000
Date:   Wed, 15 Apr 2020 10:24:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        aravindh@codeaurora.org, varar@codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: Add Display Port HPD GPIO
 bindings
Message-ID: <20200415152439.GA9882@bogus>
References: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 07, 2020 at 03:48:28PM -0700, Tanmay Shah wrote:
> Add Display Port HPD GPIO description in bindings
> 
> This Patch depends on:
> 	https://patchwork.kernel.org/patch/11468505/

This belongs below the '---' and probably means you should send all this 
as one series.

> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> index 761a01d..003f5f7 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -155,6 +155,11 @@ properties:
>       data-lanes:
>         description: Maximum number of lanes that can be used for Display port.
>  
> +     dp-hpd-gpio:

We already have a standard property for this. Use it. 

It belongs in the connector node as HPD is part of the connector.

> +       maxItems: 1
> +       description: Specifies HPD gpio for DP connector without
> +                    USB PHY or AUX switch.
> +
>       usbplug-cc-gpio:

Note that this too should be in a connector node.

>         maxItems: 1
>         description: Specifies the usbplug orientation gpio.
> @@ -282,6 +287,8 @@ examples:
>          aux-sel-gpio = <&msmgpio 110 1>;
>          usbplug-cc-gpio = <&msmgpio 90 1>;
>  
> +        dp-hpd-gpio = <&msmgpio 117 0>;
> +
>          ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
