Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A71C56AFFA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbiGHB3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235434AbiGHB3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:29:54 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CAD72ED1
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:29:53 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id j193so3563727oih.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PpvA7vQA+z5udKCHSpv+s9htl2aBC/iRxeWyaMCuGEU=;
        b=mPZbe8dmikNK7UvVbyxLe30aFtXeZfHb2mwKSxi7WHI0ELKEgTN0v0ScL6BkIwehW8
         wCWNKgYNusYXoK29wKcexwFVvLFlVIo5QxyBPwIms0NpFFihQyvPzAab05XAVl/5g0Qx
         KQwxzGXZubTTVlNLDIOZblaTDoM8m7okKqsdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PpvA7vQA+z5udKCHSpv+s9htl2aBC/iRxeWyaMCuGEU=;
        b=GhjnVgFQ4YzJWozl/wNjt1vW8zPsOepZSSwE67mpU+OdQ5s/M7cgZpDzOnppTPyVkO
         YUsLD79BxdPVKRnWJA4ugfkknfSAZ3jURvq4kkAEy1xXcXdwE0juYD+gN0J8aBnF7dHE
         OotYcJdQiALjBJJzvxu32Ve45dwxKrZe0LQtmhWTDe/lWMp1zrY9MlDQdsZx99XdLuTo
         Ft1+H0n45JT8rrVaY5tcPIZXS5/DADTwuAPjzSF0kejmXpQb9XmBZ0EDPdEpf5ynFB4E
         SSLdbQdMUCHRLDGx9GQWMooglW6FJnVdV8MbGLYGxkn1kpFA/k+zbtP5yGcCZqA6CqTT
         MvPA==
X-Gm-Message-State: AJIora+N+zb0r3tnF5sq61jI9bYYAB49N9q3wWnxctCgSPovEOI1voCb
        H8jszSK1ToAKWvIuKUigjLudt0dya65oUkJZx9+86A==
X-Google-Smtp-Source: AGRyM1sG9aigMbjMOM2ftKDyZpg/JcbL4BqzsFm0snHRfp+ujnNkRfj/Vrv6x4lsFZLIELBbixkV9cqrKRK4Hvo8zQI=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr459094oil.193.1657243792902; Thu, 07 Jul
 2022 18:29:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:29:52 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org> <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Jul 2022 18:29:52 -0700
Message-ID: <CAE-0n519u3S0WK-712aM-2zhZXrRvr7gh9aDSvRfMtkh-f4eUQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: msm/dp: bring back support for legacy DP
 reg property
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-07 14:31:57)
> The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> changed reg property to list separate register blocks, which broke
> validation of DT files using single register block. Restore
> compatibility with older (single register block) DT files by declaring
> it as a deprecated alternative.

I think the intention was to quickly migrate the dts files to the
multiple register regions. Why not just do that and drop this
deprecation binding update?
