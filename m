Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCE06723A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjARQku (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjARQje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:39:34 -0500
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A7056EC1;
        Wed, 18 Jan 2023 08:38:44 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id d2-20020a4ab202000000b004ae3035538bso8881173ooo.12;
        Wed, 18 Jan 2023 08:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f4AajlKivLZzEuRli1ZnJsZtgypNSW0pfvgWosYbSg=;
        b=awzTsS64IXxNz0rscXHDnb0WBW1fuN1F0OokANk5hEIc/tY9Sm3CPTe/8Q0DRzLw4B
         1af1+3QGV3JoQUFZvKQQrVvyMQ3HHEHLYKDlI9Rx+sv+wLzRZtHcuu5JtSzFaGR8fmW/
         O4qb4TBTf0k0nfDYmLAhXe8Qa8D+eaIWkPhiRpYq3VePOXk0/PzxI1GEcRxPumcboe02
         6Wu7nA1WgUAD1c9FetRIEBZvgPWuQQ0xT9gPx/MCbyuy3SPKDN/H58Zu/9h4dmYlFn6y
         bwQiEC0CtWRfIPrm0u0SUEmvD/9gHXM/E/IG/lM6evWXOAyr78PsPfXWAe5RrWWF9feX
         kxxw==
X-Gm-Message-State: AFqh2kre1rl1tPYqZgubPkBul0aJuTpNUF7tnFntMYqHBNlA/iU4uNQ3
        +QuyA6sUvLWWWf543ULF0A==
X-Google-Smtp-Source: AMrXdXuxkYOQs5Ku/hOsUiwkyRuQTRSetfG/ANmbqW9hvEZctLIMrBYb93DE+Crp+bmR/O1ZXrXd5A==
X-Received: by 2002:a4a:3745:0:b0:4f2:cf1:36ee with SMTP id r66-20020a4a3745000000b004f20cf136eemr3662087oor.1.1674059924192;
        Wed, 18 Jan 2023 08:38:44 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id l4-20020a056820030400b004f73632d096sm2905262ooe.6.2023.01.18.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:38:43 -0800 (PST)
Received: (nullmailer pid 134153 invoked by uid 1000);
        Wed, 18 Jan 2023 16:38:43 -0000
Date:   Wed, 18 Jan 2023 10:38:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: add qcom,sc8280xp-edp to
 list of eDP devices
Message-ID: <167405992255.134101.6407970989523760202.robh@kernel.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 05:17:15 +0200, Dmitry Baryshkov wrote:
> Add qcom,sc8280xp-edp to the list of eDP devices, unblocking `aux-bus'
> property and fobidding `#sound-dai-cells' property. Also since
> sc8280xp-edp, overriding sc8280xp-dp, will contain 5 reg resources, drop
> the reg contraint (as it will become equivalent to the top-level one,
> requiring min 4 and max 5 reg entries).
> 
> Fixes: b6f8c4debc00 ("dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
