Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D603B40D9C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 14:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239435AbhIPMXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 08:23:23 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:34526 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238923AbhIPMXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 08:23:22 -0400
Received: by mail-il1-f176.google.com with SMTP id w1so6429100ilv.1;
        Thu, 16 Sep 2021 05:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=EVQqC8AW3pOLfAZpC/J13w/nd9TcW2QmXYLcYpULoW0=;
        b=6Kg1ikkvBHD6a1sj9pbDS4UI3K9CfV+HFMWrLKSUoFs2JF1+rio1DL95OQor2KJZcH
         UOyALJlOMFbUqCOIkAiTnaG7fpK6uPInHOd/aR2+TPF63RBvwI1FI1cTcOr0b9yRP/F+
         W280c1ByhH0rYyot/fABKruYlH4udXAwTvHqLJ+6wroKMQseHwhjqyMzoFeQNtcMO5ko
         WrH4mLygf+K27Q788u1YRTejHwTBi3NHUUqS3YhO2j2ZiOtFHesogOPsDmmI06L8rOL1
         0XPS2la1DfyXMamWSpVshQEW/x9hz+nZtAd7fd9KLhe5xOkJyHr8aK+v7HB/1puS8hDM
         iMDw==
X-Gm-Message-State: AOAM532a7uYsxTxukQYrTAG1lYkwhD13Qy6n5N+fmCvPFryOHUiIJLx6
        2XjM93d4SCc4qmJTJxEoegiQ5y5e7A==
X-Google-Smtp-Source: ABdhPJwf4LTJaVVOvBti2mp++cV6RVQejghzfyjFl1WK2fdLYY06RrcvFWCtsVFoXJlhrSb+x0UeIQ==
X-Received: by 2002:a92:c98b:: with SMTP id y11mr3665064iln.205.1631794921982;
        Thu, 16 Sep 2021 05:22:01 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id i14sm1737953ilc.51.2021.09.16.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 05:22:00 -0700 (PDT)
Received: (nullmailer pid 1119418 invoked by uid 1000);
        Thu, 16 Sep 2021 12:21:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sean Paul <sean@poorly.run>
Cc:     swboyd@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        intel-gfx@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org
In-Reply-To: <20210915203834.1439-13-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run> <20210915203834.1439-13-sean@poorly.run>
Subject: Re: [PATCH v2 12/13] dt-bindings: msm/dp: Add bindings for HDCP registers
Date:   Thu, 16 Sep 2021 07:21:53 -0500
Message-Id: <1631794913.488685.1119417.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Sep 2021 16:38:31 -0400, Sean Paul wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:0: [0, 183042048, 0, 5120] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:1: [0, 183308288, 0, 372] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:2: [0, 183373824, 0, 44] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528559

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

