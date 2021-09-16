Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4550240DA77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 14:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239621AbhIPNAC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 09:00:02 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:39626 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbhIPNAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 09:00:01 -0400
Received: by mail-il1-f171.google.com with SMTP id h9so6498363ile.6;
        Thu, 16 Sep 2021 05:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xuGmIRYmRVR4BbQ5sSs7x/lja/8gmIMOpkyKDr7Fynw=;
        b=C/U/JPvWVEvlebZwVX5InGDODs0BMuuLS/rTQvIDtY9/vxtIFNyfPZi9Q+i+FU/zVx
         3uViaKBQEzIy68Bi2jMo09XNs8cRVth8u6/x0buE9JH/GU2cAOrDDiCMS6s4g0ptXrad
         LJXpZ1xpI6ffcqy4QZEM3x7XBXMD+Ufy9uuWdkVYRTvRSDl53Ec8BkLginC1COITiqGJ
         iu2P/iOsL8fCO5dG8rN9oJZoAP0BnP+jLJNn94cWYtSzBThXpAy3xL+S8FsYiQ3JZUYD
         pSb3rHwJHZ9kANKWSQL0T6Do4SaLJ0aY/Wk20GkMuNidHgrHDiymH0nxSEtMy4OFJOrG
         8tfQ==
X-Gm-Message-State: AOAM531gXWNxpyp76Ymc3nAHacRSpbQuCL6ZV3du0a8pL1Wv9osDpVKz
        cPazVzkeXqGZ7VBdVoB20w==
X-Google-Smtp-Source: ABdhPJyyXBHunWFCmA9Dfv2/1tQjiuIFaS0T9uMZFgBdkv0SEDRIS4IlK00+pb6X39FFOXCwOT2fsg==
X-Received: by 2002:a05:6e02:dce:: with SMTP id l14mr3985745ilj.272.1631797120682;
        Thu, 16 Sep 2021 05:58:40 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id k7sm1654209iok.22.2021.09.16.05.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 05:58:39 -0700 (PDT)
Received: (nullmailer pid 1170339 invoked by uid 1000);
        Thu, 16 Sep 2021 12:58:38 -0000
Date:   Thu, 16 Sep 2021 07:58:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, swboyd@chromium.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/13] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Message-ID: <YUM/fl0U95Cxc+iM@robh.at.kernel.org>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-13-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915203834.1439-13-sean@poorly.run>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 15, 2021 at 04:38:31PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e5e47a..80a55e9ff532 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,7 +19,7 @@ properties:
>        - qcom,sc7180-dp
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 3

You need to define what each entry is.

items:
  - description: ...
  - description: ...
  - description: ...

>  
>    interrupts:
>      maxItems: 1
> @@ -99,8 +99,9 @@ examples:
>      #include <dt-bindings/power/qcom-rpmpd.h>
>  
>      displayport-controller@ae90000 {
> -        compatible = "qcom,sc7180-dp";
> -        reg = <0xae90000 0x1400>;
> +        reg = <0 0x0ae90000 0 0x1400>,
> +              <0 0x0aed1000 0 0x174>,
> +              <0 0x0aee1000 0 0x2c>;
>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> 
