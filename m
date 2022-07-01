Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E54563A41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 21:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbiGAT5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 15:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiGAT5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 15:57:04 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537DE44A06;
        Fri,  1 Jul 2022 12:57:03 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id l24so3216140ion.13;
        Fri, 01 Jul 2022 12:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2236WeJFhld+gP+seBGzERxVMGLyh9tBEeYJJbEdYHE=;
        b=NvSDJnEndXCLRvu+33eX1TKiLHaQAGZbC3i2WQw84BMoNophcMVnZhMi7+v6VRXzqs
         kevdr4mlovV3zM4G6Uxd2JkMgfoRMwpIUuEmhHLFo/cVBMq5X6Uz/rO6l6lzVU7qtYZs
         f7wliDU3A0KtyEGdKaYxMejaMyZvpAvWPrbvpUbDkWZIvuQFwjZBSTeNf0BGzCxOwckH
         J5yZXbaPjB9JzWatdfcIahQOmt43L2eD0Qrqgb3SG8INwVQ+Aq3nw66aH9kKIkWWSaZz
         T5R724+EGfs2piUWHPT+b2Fa02XCXA5Vp6KwnwmqYRSCxCR55N0OxFqwzCD6G/UPZ5RA
         BfoA==
X-Gm-Message-State: AJIora9NY6/FbevX6xt5PTNz6O52Nv9TLxD1/30XJWid6C/KtdnN/Y8n
        lhZmDqD3GXjsEiOYzfxhaQ==
X-Google-Smtp-Source: AGRyM1ssGJMKXpVscalQyMv8NhtOBWfOOYKnSAoLW+RU5N3w9LbS3Z9hEO7Wd8qTb11ruIeOEAtfhg==
X-Received: by 2002:a05:6602:26d1:b0:669:734a:4c8a with SMTP id g17-20020a05660226d100b00669734a4c8amr8404169ioo.209.1656705422645;
        Fri, 01 Jul 2022 12:57:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c68-20020a02964a000000b003315fa78c0bsm9926313jai.146.2022.07.01.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:57:02 -0700 (PDT)
Received: (nullmailer pid 1416680 invoked by uid 1000);
        Fri, 01 Jul 2022 19:57:00 -0000
Date:   Fri, 1 Jul 2022 13:57:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        swboyd@chromium.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Message-ID: <20220701195700.GA1413048-robh@kernel.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
 <ff3caa0b-a248-d5ee-a3e5-c49fc41b8cff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff3caa0b-a248-d5ee-a3e5-c49fc41b8cff@linaro.org>
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

On Thu, Jun 30, 2022 at 08:59:03PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> > The driver doesn't care about the name of the phy in DTS. msm8916 has since
> > 2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".
> > 
> > There's no reason to have a constraint on the name here, simply to have a
> > name. Remove the redundant const in favour of maxItems: 1.
> 
> For single entry the names field could be as well removed. But if it is
> there, let's make it specific, not generic. Therefore instead add
> allOf:if:then restricting it per variants.

If we really don't care, an if/then seems excessive. Just mark as 
deprecated and remove it in all the dts files. 

Rob
