Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7834F65D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 18:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237834AbiDFQgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 12:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237921AbiDFQfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 12:35:55 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C793348B64
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 08:09:16 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id x8-20020a9d6288000000b005b22c373759so1896272otk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=n0YAsSJflCGF17Y0CR0O5w5xtp+VT/eBUOzd06C/67A=;
        b=nt6HFrO6S4nJO5qShNjR/7i7MnFB2r+0qZ7G8mTuqwFw7QqpnlX7iOCRWBtKU9dmWN
         02o4oH2sKqTiuuOMFcHpXVZpAHLAYJB0cPL+gY9LCvFyYHfatrW/QowE2xVkXKDcFh6N
         PcDJys37DNbIh1Ivdt8hT6c7TqNwvLPrVRfrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=n0YAsSJflCGF17Y0CR0O5w5xtp+VT/eBUOzd06C/67A=;
        b=qbf0fHq7fifun4AskxizpioYGRbLPPdiAuRSuwwsaqs+hmiHd9ipFKhWz5GcRNOMQ4
         q/DIzyeTZrZpjc+oJmRSe2XoOSxDcwbKxNc7e/RO74z3gN2k2Vg0HCe3MUhLyj9zVDx5
         /vr1bRSe60RpWm4G//2eBJGIReJ00LDIpVSbWeIUPeMmGOcemovJzh4RlRAZDoKUVwyk
         Rl01ivU+xqQu5PslKoiSr823NqdlvTdXz08eJtkD+VeogqfL5cJxbej4C/eWh8TgkwZ9
         Xb9tfOl+e84eIxXDupPeInbhLht5rwwArfUtquP5hVFIowxoXfq7jtvpcpQiAAY2fePK
         GnpQ==
X-Gm-Message-State: AOAM530Wz9EOYOFXhmbrmN8wHVUEOR1mjxShg7JQlbVeYnv2Feq8xU2v
        LMVMNi3lhF9xHFzYxTNUnc8Mv0KDVeh+nvO+AN0lfQ==
X-Google-Smtp-Source: ABdhPJwY2K8gzH413UXm6KXC3GBFZaVngaMQK8CtDE8wz/y+//wltFYxSuFffZiD4gecnGqEKCSEQx3687G9pOM0Q30=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr3142392oth.77.1649257755820; Wed, 06 Apr
 2022 08:09:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:09:15 -0700
MIME-Version: 1.0
In-Reply-To: <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
 <20220405234551.359453-2-dmitry.baryshkov@linaro.org> <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
 <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Apr 2022 08:09:15 -0700
Message-ID: <CAE-0n519eqMMzv0HXmnYob4RUtdmMbdTn=T5EPc5pDQHNHcGsA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/hdmi: properly add and remove created bridges
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-06 03:21:25)
> On 06/04/2022 05:51, Stephen Boyd wrote:
> >
> > Is there any Fixes tag for this? Still seems worthwhile to have one even
> > if this is a lockdep warning.
> I thought about this before sending v1, but ended up not doing so. Each
> of these changes is not atomic. A call to drm_bridge_add() without final
> drm_bridge_remove() in the core msm code would leave dangling pointers
> in the drm core. A drm_bridge_remove() is not sensible without
> converting _all_ users.
>
> So there are two alternatives:
> - leave this patch series as is w/o a Fixes tag
> - squash four patches into a single patch and add 'Fixes: a3376e3ec81c
> ("drm/msm: convert to drm_bridge")' tag
>

The atomic change. That's because bisection could trip over these
patches and then break because it picked the middle of the patch series.
One atomic commit fixes that.
