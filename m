Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0A2570E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 01:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiGKXOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 19:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbiGKXOM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 19:14:12 -0400
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBC913F2B;
        Mon, 11 Jul 2022 16:14:11 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id l24so6338969ion.13;
        Mon, 11 Jul 2022 16:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jumFwK9AGbuw9kGgRypv2bAf7SdJSaOWQBO8STW7sIs=;
        b=6d/oweNDHP8ZBWpyT6bGXmIe9jSCZNhsfSb2tZJYZwNogQwHMiiTUiPbAo/KZEzij+
         VkgQuWNMmOl98JDlTFIgNNBgdK/01OW5vp8IoCKrdMpwE3RqcL3iQL8aCq0+u+V0sJg7
         m7nFJlz7e7s3VagEKqan+aYl3nLGcuFSvnxNWzawNO66MOGFAz7LWCcTxv4kZwjF5WJY
         OJXv9XRDUTIDOq0LDV7mRenwzpsApwUH3I+apcEGyHj/Tmh7GUt7xjtPd/juxHaaY4em
         NPHYL5w26QYs3AMnV+berYxJW7++1EDPJriNSWeWT772dQNNkunBE7o8rhcE+G+/G53e
         ApnQ==
X-Gm-Message-State: AJIora/KPJsM4QVYQPyD3bDtsTucl5jnBkvALMBvg3PJBbeXIpPO5AhL
        RxTqBcUrP2Vm4GVpEFqvwg==
X-Google-Smtp-Source: AGRyM1vPxgUEpN0i8lM1LCBi9mDWLlkHFHm+Ttu/CfuM1eV6NvUwcHx/wnckUb8o2p/1IymFz+cRjA==
X-Received: by 2002:a05:6602:2c49:b0:67b:a4c7:33a5 with SMTP id x9-20020a0566022c4900b0067ba4c733a5mr740339iov.151.1657581250743;
        Mon, 11 Jul 2022 16:14:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z22-20020a05663822b600b00335c0e07abdsm3467799jas.14.2022.07.11.16.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:14:10 -0700 (PDT)
Received: (nullmailer pid 449698 invoked by uid 1000);
        Mon, 11 Jul 2022 23:14:07 -0000
Date:   Mon, 11 Jul 2022 17:14:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
Message-ID: <20220711231407.GA449642-robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
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

On Sun, 10 Jul 2022 11:41:31 +0300, Dmitry Baryshkov wrote:
> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies
> from the DP controller driver. These supplies are now handled by the eDP
> or QMP PHYs. Mark these properties as deprecated and drop them from the
> example.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
