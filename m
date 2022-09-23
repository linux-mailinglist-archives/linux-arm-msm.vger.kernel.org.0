Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0470C5E733C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 07:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiIWFHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 01:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiIWFHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 01:07:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5D212644B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 22:07:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a3so17985628lfk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6SRopPv1VZUvrQ8nf2qs0INKVyUhQiNiZRamaiV44Kc=;
        b=y2bx1FkhdrEL9PegBuK2kr8kg8dU6GdxgTleR8K4gD8didfEtmZM5fQg0OKcWaihPD
         uGylENtXvfkvXdELuIslpbK21VvUbqYbkRYyN3RlIQuYVr+5xB29/4R2JlC4WxLwXNpw
         8AVgjptIxf8Vkd8s4pZ4BPMePbGwfn0pj2wVyTIJfh+S01zReY3+V4X7Nz0QKjSaospp
         al6YG+/Oe+fv7BwfFQNQ1zsluRAbJ7rSwyQBtQiuNexAQdNRFwhuYmsol9EHEZ6+EsNv
         DSjQxPxZ72NEhVKoT/gPsbITRuwL2V+ypjMkgi/fSkbCQRdo2x3VRC4+bx9fBZ1EI0Rc
         ZC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6SRopPv1VZUvrQ8nf2qs0INKVyUhQiNiZRamaiV44Kc=;
        b=s4tuou+MKwf8Z+eqVXs+erFogHVTSbmsx/aGYbiDyGPKArQz0lJWp1bzJ0O4qrRhj5
         wgEgepPppigfIYNJsJOuVNoYtTD23Lz1obEBp8+L67tGUT320UOqx6UpiufS0/CBq7NZ
         5UD2PcEH/yi5XqQxowuhGXE9r+kry85xZQ0ufnZ6X3sJO37Q5YpjDRa2c9HHDD/5GzzD
         5mbEPfuyFLN24E1kaJMg7kTSowzsnhICetKQStd+cDIxwAVBUpgLDnP+XzlyCth6pMRM
         MM6ZVdXJKzBrogdEMzrhnIeHEhaJcPKVVgQaVTPbXbW8CHYB0MTYnJkT5MXwcrNZBEt7
         Djcg==
X-Gm-Message-State: ACrzQf0VlzVo5wGPknh+LA4y2HlE+1QYftO9+yLpehUm8mQztuDLOzXX
        qRj48Vlfp3Lp2F5n3rOxZuvtmxmgSWLNrEXCs241LQ==
X-Google-Smtp-Source: AMsMyM7jhzaPESmCoeuAYSF4rA4Td92S4N4Zl0cAlLTH/fuwv6ofca88CLG5+LcoidVcs60EetMpwTZfk9KrPd66smg=
X-Received: by 2002:a05:6512:a8f:b0:49f:4c33:4473 with SMTP id
 m15-20020a0565120a8f00b0049f4c334473mr2427418lfu.125.1663909628798; Thu, 22
 Sep 2022 22:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220923014322.33620-1-mailingradian@gmail.com>
In-Reply-To: <20220923014322.33620-1-mailingradian@gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 23 Sep 2022 10:36:56 +0530
Message-ID: <CAH=2NtzDpa6mySzitzWC+W_dkApeC=irHfM1OhFiFS70mWOZ_Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] SDM670 SDHCI support
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 23 Sept 2022 at 07:13, Richard Acayan <mailingradian@gmail.com> wrote:
>
> This adds the compatible string for SDHCI on the Qualcomm Snapdragon 670.
> As I noted before, I think it's fine to include something like this
> before the initial device tree because it is trivial.
>
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  drivers/mmc/host/sdhci-msm.c                         | 1 +
>  2 files changed, 2 insertions(+)

With the assumption that the initial dts would be available for
upstream review soon (as we need to see actual user before integrating
such driver changes) - for the series:

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
