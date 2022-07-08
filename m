Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2CF156C35A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240499AbiGHVcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 17:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240487AbiGHVcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 17:32:10 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F2AA026E;
        Fri,  8 Jul 2022 14:32:09 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id h200so149838iof.9;
        Fri, 08 Jul 2022 14:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vVYCFAFM3u7M5ctS+8Pi5ElwP8UGTsNsPbFnqh+Srfk=;
        b=jULTtRkEhcTqAWWr376PtJLwAIaD4d7zDPD/BgEd/WrpOYc9igAW2AW8ftgqhhvwxI
         xK8jYnzVxvbnwj2D++QpnA4i2IdvrKrBnjMn0DErjNdhc/QiHTRW/GhALuVgUxEq+f8+
         dA2hmyymB9FHW7d52vxJ+AnRbFkI9d3hLCWam4MGehZINjvV6kymaMFFgMsOjbMnBB6V
         ZFKRxUrv6wsGdosYmdkEHsAOKFY+bMD8dN8HMTIt8Z0o5oeHEoSCS0QlP3xri/DrBV7P
         sLgOemAH/ZoptZaDMA89PG5wsM6aziqCusqDz8RAmvv9cXogW0vi2pQmnivxB9tOS/yK
         ebCA==
X-Gm-Message-State: AJIora/AyEDJavoTYLNo+5aYqmj9ozVZ0vthz0PH5BbcJx2Z/UqfWmGn
        y50ihBpC7QFzRKQ+G0O2Ag==
X-Google-Smtp-Source: AGRyM1sumiMM0+0KfOQZuDKX7asNwIIbBAJhw4KV3PPTXCSZPJWI1RTnSfkQKj91GRcwWUfAc6DP+A==
X-Received: by 2002:a05:6638:d51:b0:33c:b03e:8035 with SMTP id d17-20020a0566380d5100b0033cb03e8035mr3433812jak.251.1657315928727;
        Fri, 08 Jul 2022 14:32:08 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
        by smtp.gmail.com with ESMTPSA id e24-20020a022118000000b00331d764e5b5sm18707972jaa.97.2022.07.08.14.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 14:32:08 -0700 (PDT)
Received: (nullmailer pid 1508201 invoked by uid 1000);
        Fri, 08 Jul 2022 21:32:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org
In-Reply-To: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org> <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Date:   Fri, 08 Jul 2022 15:32:02 -0600
Message-Id: <1657315922.448144.1508200.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 08 Jul 2022 00:31:56 +0300, Dmitry Baryshkov wrote:
> The p1 region was probably added by mistake, none of the DTS files
> provides one (and the driver source code also doesn't use one). Drop it
> now.
> 
> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dtb: displayport-controller@ae90000: reg: [[183042048, 512], [183042560, 512], [183043072, 3072], [183046144, 1024], [183047168, 1024]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

