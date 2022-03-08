Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32D64D2283
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345619AbiCHU0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:26:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242196AbiCHU0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:26:50 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5FB50E1D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:25:53 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so342244ooa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2UXmQ50P7tN4nCifSsYLR5v4PC0QeUfNpesrP6Nz2bo=;
        b=UnBlg7FjIvKHdIM/8qFzs/2KBWiZLm7f9JvWz0IKkewxQ1/Zhr7+PheRLI05qkcc+3
         pASI0vapPEsrO9tpxNGtZ5cuekPc76PMGnIKbr9LMSAWUE9pakBEXWOFHi6+roOSpuUa
         QLT1GBBANS6oJ3m42NJnfwcF0Lc38etOsDvJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2UXmQ50P7tN4nCifSsYLR5v4PC0QeUfNpesrP6Nz2bo=;
        b=o1euIn4EC35NYvUo23Spn+IxrfsSu2W6SxQqRypnrUj5VSYW0o2fU9xT5RZokYIcnx
         HW3q97EzDkMiEyvByqwutkwcyQuIfpVceQfEQNP3TbP21ldDOwDWwEz4jc/q+I/pwrUW
         taLFnxL5kbmTk88soS9CDWv3jKPqvj2mH002F4C21ETM+z3qqXsieOoq1FeM+O9FSPSN
         V+T8bF/sKMVy04WHghWjn0B3IsqdrD7scWBDO8n0C8xmQFybIPTRMlDa4hJPFzvfo0QK
         ZBb3dFDjASIZuGoXGPQwpq/+qniX4uVsw5iOjzRbAHaNmTPlWmFKufWAlCzDOIaplPHS
         hoUA==
X-Gm-Message-State: AOAM531bDOLQpAfBZrAvBxMdf5KwYClv3lRwSG4Rsiw/m4wk7nRp3uSq
        L6f/CiMQwpco0mfnRjPcL6JqljJtvlStH0kMm68m1A==
X-Google-Smtp-Source: ABdhPJznHjaBW3HlsoRzKsRdv2O2Pu9HzfsfCXAIfzhdmW0Ezry2PXhAde/tG2cfzvENxhTq1veN8mnHh0KzqzzWoH0=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3469915oac.193.1646771152990; Tue, 08
 Mar 2022 12:25:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-2-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org> <20220304032106.2866043-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:25:52 -0800
Message-ID: <CAE-0n52wgr-EENZoNKTu5cAur5=f7spxu2EYFUkdKsFF_=q0hQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm/msm: unify MDSS drivers
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 19:21:02)
> MDP5 and DPU1 both provide the driver handling the MDSS region, which
> handles the irq domain and (incase of DPU1) adds some init for the UBWC
> controller. Unify those two pieces of code into a common driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
