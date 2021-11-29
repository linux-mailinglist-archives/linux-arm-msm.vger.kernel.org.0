Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D874623F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 23:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhK2WJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 17:09:03 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:46605 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbhK2WHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 17:07:03 -0500
Received: by mail-oi1-f176.google.com with SMTP id s139so37246930oie.13;
        Mon, 29 Nov 2021 14:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wL2j/zhnCBNuLmFuTXzTlUDE4xxt9w3i13nGa7X0Qrc=;
        b=c+LW+1BMxK8uPKW13RRse/nUFRo/mp8G4G3HcPmpmdzS570+uD0L6wbU96Vxylo2ah
         Rt4++/4r9j+yjoNbDlC7qIlwZEB6E+W01O9oX8La66drb7Vo/9dbDahmBgp73wQB/+vH
         QiR/i+YeGpLNeZJJZbgMx6jBAdv92cq07TG7EQDesi8K25yPaPk3TNCkPzQScnFRlhdv
         y8Py44EPV01W0nLNvjuzi7pj/e/wuUrVmiSeBgf9Ru7rHjv+Mu2mcdfkypPwqYqGKUVi
         30XbZcyrnKHVij/vqA9b6SABkcf2fN6I/MLd3BIJG8OBlj7TMe0ALbMho2SQI5uC/TEQ
         JPoA==
X-Gm-Message-State: AOAM530OhpWAQY2LE1PyraDJ9GQdiOvaMqdCeYDu1yPo9Vu+xxhljNuD
        BD5yY1eioKCIE0A8kL/77w==
X-Google-Smtp-Source: ABdhPJyRltEG100ztU/F/vjH3VbBNGkp77YNJmZqqf5Mb0uG7mYLeNCPrngtXJ+IzOzkeDGFqvrfsw==
X-Received: by 2002:a05:6808:199c:: with SMTP id bj28mr721992oib.98.1638223424595;
        Mon, 29 Nov 2021 14:03:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m2sm2484366oop.12.2021.11.29.14.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 14:03:44 -0800 (PST)
Received: (nullmailer pid 690738 invoked by uid 1000);
        Mon, 29 Nov 2021 22:03:43 -0000
Date:   Mon, 29 Nov 2021 16:03:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Paul <sean@poorly.run>
Cc:     swboyd@chromium.org, seanpaul@chromium.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        khsieh@codeaurora.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
        abhinavk@codeaurora.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v4.5 12/14] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Message-ID: <YaVOPwmWinSJ6z2m@robh.at.kernel.org>
References: <YY7lb9k2UArZf7I/@robh.at.kernel.org>
 <20211115202153.117244-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115202153.117244-1-sean@poorly.run>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Nov 2021 20:21:48 +0000, Sean Paul wrote:
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
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-13-sean@poorly.run #v4
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v4.5:
> -Remove maxItems from reg (Rob)
> -Remove leading zeros in example (Rob)
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
