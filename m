Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8AC4CACE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 19:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbiCBSE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 13:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244283AbiCBSE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 13:04:56 -0500
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4D2532DD;
        Wed,  2 Mar 2022 10:04:11 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id i6-20020a4ac506000000b0031c5ac6c078so2806247ooq.6;
        Wed, 02 Mar 2022 10:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NyCZbFNG5zXvLkeeXgNZuh7pG1t1jvI75UWVDVGd5RM=;
        b=4TB6mlsx22GljFbMfm0Zbc9BUlVxagZ+Fw7zaLXG9X0E81tkZN26vRylqOjBki0NTS
         ARowXatAP8YOGo//40JhOCm1OA0NYwMKMr+6BIxSkZbdzV7c+CzWiXDzMfAkx7vVXiqR
         E58J3WVSiknwi3QM1CPT5ifpFgH+D0T1oLmDUSYGsLThwalYw1RwUUbk7i0ehOepsc/f
         gZHw4D5dWUkmf2XniwKglT1sv0uOMCKwLGe2bzm1htVh26yxEF/puV2NlR+yb5WEJaxE
         0d4Tv4v0cBuNjQUE+hf/X5BgjGiCPbiX/g+HRHE64We8n6ZjbLqi3u9TcxwNZw0JhTQG
         4skw==
X-Gm-Message-State: AOAM532hTA3+ecgxvDG7eEBcPYilshKaO7xTWQWo9VmEmi+Y2JmAn7V/
        iSOuINR5q/HjBawf2tnrFA==
X-Google-Smtp-Source: ABdhPJxRfEvne9Olzfj87R4/ZAFsMzyq/AgkwsOQIj7de/21zewdDmDo8cR0oklkbOky7y2+ovYPKg==
X-Received: by 2002:a05:6870:f611:b0:d6:d3ad:75d0 with SMTP id ek17-20020a056870f61100b000d6d3ad75d0mr796616oab.101.1646244251160;
        Wed, 02 Mar 2022 10:04:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id gz3-20020a056870280300b000c2e2d0a326sm7449557oab.38.2022.03.02.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:04:10 -0800 (PST)
Received: (nullmailer pid 3973831 invoked by uid 1000);
        Wed, 02 Mar 2022 18:04:09 -0000
Date:   Wed, 2 Mar 2022 12:04:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in
 dpu-qcm2290.yaml
Message-ID: <Yh+xmSaLHc14ZNnV@robh.at.kernel.org>
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 02, 2022 at 03:14:10AM +0300, Dmitry Baryshkov wrote:
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Didn't include freedreno@ in the first email, so resending.
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks for fixing.

Acked-by: Rob Herring <robh@kernel.org>
