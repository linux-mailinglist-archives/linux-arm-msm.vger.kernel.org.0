Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F405E5CAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 09:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiIVHu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 03:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiIVHu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 03:50:56 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE90EB6D48
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:50:54 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id y82so11585951yby.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Sds/Dyb9ikOJ5Khfgi4mahargaDHP26IO9csDUpISkI=;
        b=AL32irr9FYBKUHIMMo9eydEHfgQBuJXAF1H89Pdx7WfEOgLxDFof1d2iloaxmHz3MU
         7A6q3mQUUPlbgcPO1mv30xD6Jh46/G3ZSbLL9NzwwHNOmyDfps3O0ZS5hNnQHVsGEjqw
         kXXFtzjE6X/0uMrKBwPoj9qBj1e6naSv66VFWpxMUPKtV8A8owNf7h3nT5KRtiJqtjz+
         GicpVKAZCIBSVdcU/cNIZ7FW/Si2ErxCcRy15qVAjuTmExkgv/eU+gkTLgcWwLd4u0GQ
         nU8nLPhL81yotdmJHno45uTGy12/qx7v/7BFzCS7mnB6kltpVmz7iQx9Y2+oc7L3Lsai
         WRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Sds/Dyb9ikOJ5Khfgi4mahargaDHP26IO9csDUpISkI=;
        b=FcT5uHCbeQM6icmuti4Mr6elNU5PoNKC7H/25gv7bEEKI022qIMljifpZnHiCJMSJf
         3I3FjPYMyRQo36BblT0Ugvrjcg+YlLadb1yzQ07wtOg+AXNLE9PNGkpuUcr2llJzW3sa
         xb+l6PRYXMhyL5VmTXKl/H1YazYh8QwwQ+m98B4pqxt/wvCV+X8VbduACpIruoP1IMuy
         N3xmaJOfeNIhF024VLjLgrLL/elag/IMl0icu8ogXOrI6qXjV9HNGB/jWhssGxdRRTF7
         jFnpl0igVxMNZX2+iocwGWF1fgGFe747vM7G8S37Anp2yFBCAgq6HVh9Cs8MW1QIE9jg
         VWdA==
X-Gm-Message-State: ACrzQf2KTphn1A7ZonrvdX9vzFtIAfdtrInpAVwKdJPMo7ylRa5tDuqQ
        83mzpVzv+Jph/XLO9w9iHDVuBTbpZyElqsD1tvO6zw==
X-Google-Smtp-Source: AMsMyM4crSAFL+O0e+s4NTT408WVmhHJaTlutWu7sbiOJhejjg0f2UMZVY1/RmXcx4UZDj4v7SZabrQOYZMdyXO+xKs=
X-Received: by 2002:a25:81cf:0:b0:6a9:4d0d:5ee6 with SMTP id
 n15-20020a2581cf000000b006a94d0d5ee6mr2392450ybm.153.1663833054098; Thu, 22
 Sep 2022 00:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org> <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
In-Reply-To: <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 22 Sep 2022 10:50:43 +0300
Message-ID: <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Sept 2022 at 10:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> > Move properties common to all DPU DT nodes to the dpu-common.yaml.
> >
> > Note, this removes description of individual DPU port@ nodes. However
> > such definitions add no additional value. The reg values do not
> > correspond to hardware INTF indices. The driver discovers and binds
> > these ports not paying any care for the order of these items. Thus just
> > leave the reference to graph.yaml#/properties/ports and the description.
>
> This is okay, but you loose required:ports@[01].

This is fine for me. The ports do not have 1:1 correspondence to
intfs. Usually platforms add ports as new sinks are added. For example
a platform can start with a single DSI node and later get second DSI,
DP, eDP, etc. as they are receiving support/required by end-user
devices.

-- 
With best wishes
Dmitry
