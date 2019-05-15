Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDD01FA10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 20:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfEOShP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 14:37:15 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40177 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfEOShO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 14:37:14 -0400
Received: by mail-qt1-f194.google.com with SMTP id k24so864876qtq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SFNuIJemdTLO0xp4SS7eD7mTRt2jx19bhUfAq2FJGCg=;
        b=eEBO9MSQNtsb6zqoHTndPS0B0pR8E0sMp9T7yHW6qouW7Epg5SAzibiwdCmR3ibNGl
         D/S1jOoC2CAkyYprOIQpXzrm0BT5s0wI2sn0Gix9ARpYci3hGGmbmMyqd9it3GwAEj7C
         CiPRdXhZFO7FQKxofCxcAcaW6/fdl4oUvWmlMZSqXpiRT0sTARPesrhuPgFwsZ/HWvIr
         Nkkx6vFla5YJskiuqMxOiGm+DTXTF5AslGYsE1aXObkoOPMRkJ81w7W9Ne791MKUj9aU
         +saNoD9teyzZjIyA/28tOSqexFL/GyVjCBQCAOer25Gs869VftGpTli5Am3dCRe1qaQh
         NE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SFNuIJemdTLO0xp4SS7eD7mTRt2jx19bhUfAq2FJGCg=;
        b=ZUpqOaCnl112NlT2t8zyPS/pT8ZePhqHMHipSJTTtmz37YnghijtHbmMU734MfiAs6
         zFtvNLUqFMZx+ZaDYJv7JYD0C4rJXFAQu5nVOHA3oyocYiz1EdT1uNdgyjab2K9QcTAL
         KXGqJ+3pXSqs5WzeoyAvjiSF/1wfentGDjPbcwL37xrXoTOA+xKgwDsHBkelfB+CTF4k
         l+mPRYG9PTrZf36grqfsXfKlxhpc+9q+8syMCoga04rNIEzVfhffu8tgJpY9i8il9XsP
         nMVlJbYG9BVVJrSku31CCZIFZ7tLg5tNO9zyX+WPFPa7PEUkhJnFNpNqfyOzgZZkwumM
         bCQQ==
X-Gm-Message-State: APjAAAX04ixR9HFlB7/n5kUDzyzGolWguQTr3sjaNoRRL+BnyXiEVIuN
        WaFWkjpM3/luuuO6ANNcnjl7sA==
X-Google-Smtp-Source: APXvYqxMIfZBBwCvYBUULJBhCR4PNZQyPokNd7gubEnQIC9pIP9wcs/fACEqVBe4sfNi7KMbt+/qXg==
X-Received: by 2002:ac8:534d:: with SMTP id d13mr13916550qto.217.1557945433945;
        Wed, 15 May 2019 11:37:13 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id b19sm1396281qkk.51.2019.05.15.11.37.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 11:37:13 -0700 (PDT)
Date:   Wed, 15 May 2019 14:37:12 -0400
From:   Sean Paul <sean@poorly.run>
To:     Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Cc:     robdclark@gmail.com, airlied@linux.ie, seanpaul@chromium.org,
        jsanka@codeaurora.org, jcrouse@codeaurora.org,
        chandanu@codeaurora.org, jrdr.linux@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Remove duplicate header
Message-ID: <20190515183712.GZ17077@art_vandelay>
References: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 14, 2019 at 12:57:28PM +0530, Sabyasachi Gupta wrote:
> Remove dpu_kms.h which is included more than once
> 
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux@gmail.com>

Thanks for your patch, I've applied it to drm-misc-next-fixes.

Note for next time: The patch didn't apply cleanly since dpu_dbg.h has been
removed upstream. In future please make sure your patches apply cleanly and
at least build against upstream.

Thanks again!

Sean

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index dbe48e00..d692dee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -16,7 +16,6 @@
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_mdss.h"
>  #include "dpu_dbg.h"
> -#include "dpu_kms.h"
>  
>  #define LM_OP_MODE                        0x00
>  #define LM_OUT_SIZE                       0x04
> -- 
> 2.7.4
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
