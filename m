Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC19841F567
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355323AbhJATF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 15:05:26 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:38655 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354843AbhJATF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 15:05:26 -0400
Received: by mail-ot1-f42.google.com with SMTP id c6-20020a9d2786000000b005471981d559so12714531otb.5;
        Fri, 01 Oct 2021 12:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=32WLAnTHFBoGOE/uJ6iRvB75W1i2TcrETEHjkCusN0w=;
        b=vevin/46Bf17t6NW1IR8nGQSgehOpOn4K/Dm8f0rdU1SkMlJIytlzrEFSIOr+UfTkv
         BPCjYJ7qimYIDCwgIRCM9uk97Xssv99jhc0pPsJ+XLqeEdR2NT0SKLjOEBwfzazLD/Pf
         seP15INeAD/Y/g/xXR9Ux4SKNPPVC4LAW1SiRKaWYu03yA//QAnsgX2sQD9J4W4MYDbU
         vxnqjc56kIT5ZMBq5wFLRmXleaNvuvoo3mCdzq2JsE7w9Io/NVlwl5lqZBvJcbVSCWtz
         wdU6n7SR6HVh+GiKUMM9wgtRneY5UVdVoEnLDavjyBSJ0JVPm1zEHNgmqbGrpmhVVoaW
         ibrA==
X-Gm-Message-State: AOAM53340OnSiWbKnEONu627NexmhM14AZ+VB6+4DeG7DiHp18hO/8Ku
        BHunqb7fN7ETvZ+Yx1R7aQ==
X-Google-Smtp-Source: ABdhPJxvqWx8WLaWrgLnXX754a4A9djuxZTWjsNil7QKepEnxsdlv1ptk1BXwQPeNQu83EeoL/L/pQ==
X-Received: by 2002:a05:6830:2685:: with SMTP id l5mr11810994otu.9.1633115021277;
        Fri, 01 Oct 2021 12:03:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j23sm1289849oih.30.2021.10.01.12.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 12:03:40 -0700 (PDT)
Received: (nullmailer pid 4113074 invoked by uid 1000);
        Fri, 01 Oct 2021 19:03:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sean Paul <sean@poorly.run>
Cc:     Rob Clark <robdclark@gmail.com>, jani.nikula@linux.intel.com,
        swboyd@chromium.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        David Airlie <airlied@linux.ie>
In-Reply-To: <20211001151145.55916-13-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run> <20211001151145.55916-13-sean@poorly.run>
Subject: Re: [PATCH v3 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
Date:   Fri, 01 Oct 2021 14:03:37 -0500
Message-Id: <1633115017.933633.4113073.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 01 Oct 2021 11:11:41 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> We'll use a new compatible string for this since the fields are optional.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> ---
> 
> Disclaimer: I really don't know if this is the right way to approach
> this. I tried using examples from other bindings, but feedback would be
> very much welcome on how I could add the optional register ranges.
> 
> 
>  .../bindings/display/msm/dp-controller.yaml   | 34 ++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
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

See https://patchwork.ozlabs.org/patch/1535361

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

