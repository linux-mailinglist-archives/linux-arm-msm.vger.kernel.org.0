Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13F24CC7E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbiCCVVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbiCCVVp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:21:45 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D1F13859F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:20:59 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id u17-20020a056830231100b005ad13358af9so5710066ote.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Hwl7I4m0IAvH1IB5uiBYfdzL/5feDwEgsR7JKnlSjLc=;
        b=EAD636OXNSgrT0qYQwzcqOKBCCy5FKrDC+5Mqd/5OU2KBWeJSLDS8cpBaQq+Ah6bdP
         AdNMyTuBY30ce0lGFZbNQuEaQkG1qxqmLXUUsz2TWfRbuv7dFi1jsu8zhp/Kx3zAZTjZ
         xwPVNzDymKn5yvoqPzCnyC2DOIZl0LZ/wk3eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Hwl7I4m0IAvH1IB5uiBYfdzL/5feDwEgsR7JKnlSjLc=;
        b=z0ry+eYHV8ktjx5fsz+7yx5PAcouJuo8ZCcK56cOxVWAwpXOIAFvTU3xrCrmVLjNAB
         mrdbLBaSTFVKKb+kPo1vq+x7/4hDDxJvtqzKeFzi9b7AEA86gJhpImPvmaAHIV+5laL+
         XBSSAI2ADyGzxXDC5utVyVHbWHX4us6xTaUPhnkl7gMSY6c7hyX5W9Soh5MFfPU5yYhG
         VBtcXO9ctrDtMpVpGWGG+A+8d5d7eWvcxi/yGBr9EYY2ERjHOJPNpbrCcHVraFCixtnl
         EdcVqeH2B7mct3w0dC2sl8LDbgipNJbvaSTtKPiY2iq6GzK7TbjzIO+SafdJE+HJkVx/
         8Opg==
X-Gm-Message-State: AOAM530WTRxtm23u2uXwxl1QWGEvVMMO5ntkKcJu5r/h6C8Vw1bKgumG
        5V2Wr/jIb5CbtnVFv8jm2Ja19UMZTOr5yAjD/j69+w==
X-Google-Smtp-Source: ABdhPJw56B13uigu/hY5MG0oWkkMDqQ9qp7zzpqRCMOe29550tcjSwDProBE8u06q7bGyfbwjnolaU+cUTWXk6a4eOM=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20539994otl.77.1646342458677; Thu, 03
 Mar 2022 13:20:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:20:58 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-4-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org> <20220217043148.480898-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:20:58 -0800
Message-ID: <CAE-0n53q2BKcZPUwsesPxx6KktTsakpbjnJQzUceE+fFzWfe8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm/dpu: allow just single IRQ callback
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-16 20:31:45)
> DPU interrupts code allows multiple callbacks per interrut. In reality
> none of the interrupts is shared between blocks (and will probably never
> be). Drop support for registering multiple callbacks per interrupt to
> simplify interrupt handling code.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
