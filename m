Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65742836E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 15:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgJENuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 09:50:19 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42045 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgJENuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 09:50:19 -0400
Received: by mail-oi1-f195.google.com with SMTP id 16so1130167oix.9;
        Mon, 05 Oct 2020 06:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uMTeVXr/m5HzdYhs4WD9dPdsSbIpts4am22UhAG32ws=;
        b=na9ve26p6NOyZbGEvNkXx0weeWujLMwNxQELCjnhfVCxFMPhCn7wjdciDuRV0RofwF
         iVRVJic4ix8Wv7Nz2JAoffYs7srhyvi24prPVq0R+qNnFMLHxnio+2UVTGO+cPmTkrJU
         iLEMp9sVqrsF93d5iBk/NogNEVgwT//5+0+51QrRNP2WWqO9sBmaGCBbRFjgnqI10sTR
         z3SSXo3r8trw8iN3awLPscp5yR03Pi9I0GZ3c5uhf0SeQPHMgNQsCxz9WKiRHYct/0H1
         lV36viAkg2hf9gZqsWJ3seluJjCwdWC9UxyY0ahkbIMv0cQnDFEMbNbDrFe9t2dlKJ7N
         GauA==
X-Gm-Message-State: AOAM5311bsatxf0x7asT/hjCOB3/LiQCUo/ZwXrlTdVHNuAq5mnUdY/b
        d83hAWzxVFgPk/bxhnVQXQ==
X-Google-Smtp-Source: ABdhPJxdcgI1IgoyO6zDjjLjO4OE16NOhrJ5doTvU6D3HYFwm/Up+DW1tV+2bByaGdw+T8CfHpdesw==
X-Received: by 2002:a05:6808:359:: with SMTP id j25mr9092936oie.85.1601905817893;
        Mon, 05 Oct 2020 06:50:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m3sm3056570otc.72.2020.10.05.06.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:50:17 -0700 (PDT)
Received: (nullmailer pid 80511 invoked by uid 1000);
        Mon, 05 Oct 2020 13:50:15 -0000
Date:   Mon, 5 Oct 2020 08:50:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace
 #pwm-cells
Message-ID: <20201005135015.GA77667@bogus>
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930223532.77755-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Sep 2020 17:35:31 -0500, Bjorn Andersson wrote:
> While the signal on GPIO4 to drive the backlight controller indeed is
> pulse width modulated its purpose is specifically to control the
> brightness of a backlight.
> 
> Drop the #pwm-cells and instead expose a new property to configure the
> granularity of the backlight PWM signal.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml: properties:ti,backlight-scale: {'description': 'The granularity of brightness for the PWM signal provided on GPIO4, if this property is specified.', 'minimum': 0, 'maximum': 65535} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml: properties:ti,backlight-scale: 'not' is a required property

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml: ignoring, error in schema: properties: ti,backlight-scale
warning: no schema found in file: ./Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml


See https://patchwork.ozlabs.org/patch/1374751

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

