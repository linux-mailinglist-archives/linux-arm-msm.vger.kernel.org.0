Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C46339B56A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 10:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhFDJAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 05:00:42 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:56249 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhFDJAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 05:00:41 -0400
Received: by mail-wm1-f41.google.com with SMTP id g204so4901217wmf.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/0XS+taR8uO0Puxfl2+DmxsoWoL/hO28ux66/TfeXRE=;
        b=WfJOqL6TtKt8J4Be3wgOm4JHJ8FOJwSwNKlkmW/uNwzuaZ/SyU+xkNLZD5idPTHDB8
         TvyBoiOtv7ZEwPlikHdvUA46RQCybUiS27Cth69Dz0oxwSB45rhkkwf9nYHUJVwue+0A
         iwnZKX4V54W2Sw8Fz6RP/n/idZWnjG3fobAMtTQaJIQSKG/sanGE8KpnFzoDpbicJ0qU
         1aGEdAoZpGiBpFlD+goILCI7RhOHiBgjfyKTsDjkDuJOMGLZpnwDGmqjEVSE33SiKDX5
         q4bS0Ag4SzLVxMFIJGr2VB2Vogv/PrBZIKcyssJud6xsHVYQB0nrRD6bKzHr0fUSCKHl
         6IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/0XS+taR8uO0Puxfl2+DmxsoWoL/hO28ux66/TfeXRE=;
        b=kn3t+12fQ3qUE+VFPztaOKbsiETD5Dn448p+W/uEgAuE0fTCUis9rBr8phupmpqWQ6
         0BZ/+Wepv1h5pv+Abxbob9HbeFVIMxjlqRPSmZMShiECiazxogxY+eDoSY5T5ygO0LDA
         uyvA2cEBwwrMOj90mw2fSSixWJ4lhyzmybbHvfxo/I+uEiOds6b4YJBA3QsoL9HX1oJl
         JkZEfrKePoHWdzv0IhpiW+OR4A0C2GlQxEENaGnXKUcZveqTyDNUa3vhTOvaUeMRHv5x
         LF8IvFu0iSHa079Z79ikB7k4xiVYpuL+LVL06TItyLlwRB0nNpMGvFQsnv7ozYTFg9Y1
         6KFA==
X-Gm-Message-State: AOAM533XdSm4CTAJWElc0RAEbrVmzLRcfRO6iNJSZYFE/VlC/iv6NhNc
        JM4lFuyu11eyT2CmIPriXnfxUA==
X-Google-Smtp-Source: ABdhPJxSerMJo/NyEAwIjmxLZAscEMfLRp3dsxK1fpB61fIULrq5CngQm+FyXIn4sq6jKtWiJ2gD8A==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr2515531wmq.143.1622797075254;
        Fri, 04 Jun 2021 01:57:55 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id x11sm6033904wru.87.2021.06.04.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 01:57:54 -0700 (PDT)
Date:   Fri, 4 Jun 2021 09:57:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RESEND 10/26] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a
 bunch of kernel-doc abuses
Message-ID: <20210604085752.GI2435141@dell>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-11-lee.jones@linaro.org>
 <85bd6c24-0e4e-6f18-ccf0-6acf62d0f0ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85bd6c24-0e4e-6f18-ccf0-6acf62d0f0ff@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 04 Jun 2021, Dmitry Baryshkov wrote:

> On 02/06/2021 17:32, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17: warning: expecting prototype for Register offsets in MDSS register file for the interrupt registers(). Prototype was for MDP_SSPP_TOP0_OFF() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:35: warning: expecting prototype for WB interrupt status bit definitions(). Prototype was for DPU_INTR_WB_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:42: warning: expecting prototype for WDOG timer interrupt status bit definitions(). Prototype was for DPU_INTR_WD_TIMER_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:51: warning: expecting prototype for Pingpong interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:71: warning: expecting prototype for Interface interrupt status bit definitions(). Prototype was for DPU_INTR_INTF_0_UNDERRUN() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:85: warning: expecting prototype for Pingpong Secondary interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:94: warning: expecting prototype for Pingpong TEAR detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TEAR_DETECTED() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:102: warning: expecting prototype for Pingpong TE detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TE_DETECTED() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:110: warning: expecting prototype for Ctl start interrupt status bit definitions(). Prototype was for DPU_INTR_CTL_0_START() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:119: warning: expecting prototype for Concurrent WB overflow interrupt status bit definitions(). Prototype was for DPU_INTR_CWB_2_OVERFLOW() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:125: warning: expecting prototype for Histogram VIG done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:133: warning: expecting prototype for Histogram VIG reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_RSTSEQ_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:141: warning: expecting prototype for Histogram DSPP done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:149: warning: expecting prototype for Histogram DSPP reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:157: warning: expecting prototype for INTF interrupt status bit definitions(). Prototype was for DPU_INTR_VIDEO_INTO_STATIC() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:170: warning: expecting prototype for AD4 interrupt status bit definitions(). Prototype was for DPU_INTR_BACKLIGHT_UPDATED() instead
> 
> Most of these defines are gone in msm/msm-next. Could you please rebase and
> repost just this patch? Other patches apply clearly.

Sure.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
