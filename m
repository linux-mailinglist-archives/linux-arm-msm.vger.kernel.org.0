Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976DE4CC866
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbiCCVw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiCCVw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:52:59 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE3653B63
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:52:12 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id bm39so5102401qkb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7H8W+iRhHgP+pCnSQOjF4hQNmgpqnsMBxwOtw5ONNI0=;
        b=D8Lunl+P1XayMvWFGPMHQYu097oqvfILbigErXwqOgwLBbKtZycF9/9n+LUfKjiqCG
         psC0r6hbO7EOWq8kiPCUK6tGeckGqfUZVvcYldpC4NGnHFD1J+n2OctfkOOsC7xEiVQ9
         xjqri+didOFMYxx6FXIXiCvds9aDw3dhoWuB0GfT8nasQAluVBwE+KOpKQ1rI5T8GBK9
         tvmiZHbdjZRRhYvFa+Rp1iNNrFmG//Do4tZLx/tCIQZwFxEKlHX86GZyoIGkPFWbVD9J
         tge97PbNMDG9G5skmhv3PD6Gw6rK06l3C6rIdfae411dKfo/FYqv1JHFZm9got+3M563
         EkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7H8W+iRhHgP+pCnSQOjF4hQNmgpqnsMBxwOtw5ONNI0=;
        b=yfIjFKJiqN1pEvVtjjdqsPDxAQfuVb4/NJo8XQGMK/THnKpywallpl0abycDixIMra
         gpIx0+IZEu49lvHyhR/V5zHprsiLhHUHA/meB9sDHE57Vp5/+zD903yawHKin4X+F1kW
         tKeYVKrtzNATgGo2J4LzqwU/uX5dn1HfXbRfkWuFcU7YQGkW5F0/hrWsjy8T9QtAqZrG
         Oyd0Xukq7VmQKDA9xM88rz1nDc+AsMfO2+3WWEnof57L/0r3UbjkmkyJUsVRqsGFauSF
         jHxP/OCO2JpdIFj9U1WzbOAt0q5vYtMX+sLqqcu7cGSoerHBNQK4mcwBjO/SI9OFTd5r
         y82g==
X-Gm-Message-State: AOAM5306uDplQcp1TPtSnqETTyxRvlVvzJv7iT4KXxyNbiVXlg5cijDd
        eOn7OBIeYNY7cRTddXCG0D/RkvJ1/VUSfa8z+wrOXA==
X-Google-Smtp-Source: ABdhPJxOwj+3tNXzMiaHU4qnZoihRIXcuB3LLrxVK9tzS/R5Y4vbwr2p+GBm/Qq+c8tRTIsvJT8y+j4N85Uo+hCDgnI=
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr821322qko.203.1646344331420; Thu, 03
 Mar 2022 13:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org> <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
In-Reply-To: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Mar 2022 00:52:00 +0300
Message-ID: <CAA8EJppziFTb-L=aSkr7nU8EwS=nv5rbX+aKwq8YZDCCvu2TJQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Mar 2022 at 00:23, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> > This is the second part of
> > https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
> >
> > Changes since v1:
>
> v2?

And the series should have been v3. Thanks for pointing it out!

>
> >  - Fix warning ins dpu_trace.h related to
> >    dpu_core_irq_unregister_callback event
>
> Any plans to migrate to hierarchical irqchip in here?

I haven't thought about it. I think that using Linux irq framework for
the DPU driver internals might be an overkill.
I'd say that it's not at the top of my todo list. However the point is noted.


-- 
With best wishes
Dmitry
