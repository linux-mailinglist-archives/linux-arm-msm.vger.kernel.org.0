Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17654CC84E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiCCVqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiCCVqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:46:36 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F37B546B1
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:45:50 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id k22-20020a9d4b96000000b005ad5211bd5aso5785192otf.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+D9KZ+TZBc5mJAc5ZBrKXdGjjaQ+oV8E1MHR11bjfGA=;
        b=aHSIQO3gotT4d2PpILUEdU0BlfMPsE64+4FBQZTvhbuHXzA/PE8no/nyZDE5dJmeZB
         yxIm+6s7NrD70OFZ/CUSCAx+1fE4dQoUOCFJ58Uy0DvCbKBPAYG7Iq/EK5v8dz2rjWxA
         lKkxjyo5UqbV6PCtouphV8t8jfY9fnISZd2bf5icms8GL7MEZqvtSgRaseo6yqbcl2Ng
         WnmCRAR1lbHkUvSjDjWCV7EjnitYX54dATUWAz5PHBbERYfnDBWgJlVGjqvhul+TxQ6Q
         Gk8ggxAsj+T3IfL/HerbcxR4DCuKPXsbMJZjMGWGTar46vqfG/K/rwxBsKzj/ywvMwye
         jvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+D9KZ+TZBc5mJAc5ZBrKXdGjjaQ+oV8E1MHR11bjfGA=;
        b=dpXVD/2gTjbhtHCGwftcwaXaXmE4I0FeBy/fWHUUBvvjdZE6DTdMkOaj/Apxj3JwOa
         o+QE3HhR4eVs0rm6ALZrfXGOwlNxTqiHENeOJXmoj7XYc2QHIzdMY+lig9ug8sxdVIaX
         SDmphRK0fl8GXwhF8l3/tHf1cGkDUiQuAmBEyxHCE/NAQ7eDTdbGquC88ia6SgL+/sqv
         HRaodo5XieMLQNxWbew4FI6Roe2RN3oVYJlEZarsWmy1gWxFZfA9JqSPDTyIXPcgdSAw
         XcU05Z6UNa9U60voYZQ0pB5nLiIP8GA2MFf5y8BywVl6t/ssvdjW7fN+8kf1vD8Exbg4
         3c0Q==
X-Gm-Message-State: AOAM532hDDXTqVv297Otpa6GvHFuET5+ER1YG/gcslIHh5KQgFuVdxmR
        /23R6jY4DwrjkiVmjqg5ZDNkHg==
X-Google-Smtp-Source: ABdhPJzo82QXMbB5D2MSX2V622d9vJLKLZ2JgZW9JJZBk9T6Ti9H7CWqa4bozUVh5GJ3dUMXWFTG5A==
X-Received: by 2002:a9d:6a43:0:b0:5af:6595:458c with SMTP id h3-20020a9d6a43000000b005af6595458cmr20511219otn.241.1646343949729;
        Thu, 03 Mar 2022 13:45:49 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r4-20020a9d5cc4000000b005af6f4ff5e2sm1526906oti.61.2022.03.03.13.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 13:45:49 -0800 (PST)
Date:   Thu, 3 Mar 2022 13:47:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
Message-ID: <YiE3eqkUCLSFMUOv@ripper>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Mar 13:22 PST 2022, Stephen Boyd wrote:

> Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> > This is the second part of
> > https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
> >
> > Changes since v1:
> 
> v2?
> 
> >  - Fix warning ins dpu_trace.h related to
> >    dpu_core_irq_unregister_callback event
> 
> Any plans to migrate to hierarchical irqchip in here?

I like this idea, since it would give us some more visibility, both in
form of /proc/interrupts and the standard irq tracepoints.

Regards,
Bjorn
