Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E069ED4152
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfJKNdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:33:01 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:39745 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbfJKNdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:33:01 -0400
Received: by mail-yw1-f67.google.com with SMTP id n11so3471679ywn.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 06:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TZTffmmupDFz1doz+bHhDhbAscp+GEPuUpXNsilC2Ho=;
        b=df2UzdDjrnt0N5G/L9ZQ36gK5sN5z3WRz5y/9YYFzPtv0td7DJIKojiK1J7aU5q0Qn
         TCIVpwMBm+qiUZcadW+hJIVkdT6f6JcQN+AQTFTz4D1ZapseNr0kTt3puhmY4Of0+0zf
         ZigYX4YJyDxRN5EgeqhG9pqEMAj+fHFhrORqFQL74tAgeTB9EThimOtOU/aPGsuY+Rq7
         rxTgWoO+T8WVZfF/rWExCkISQIPep8TPhj399CaH9UDBqpw5Lx66kyOvI1E2I9a14zzB
         t+h9Soemp4VJBsyGonBAQCit06isSe510OuvB4T86xZqVS1fWvWRi2QAV1VgVTDDB9Fj
         5zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TZTffmmupDFz1doz+bHhDhbAscp+GEPuUpXNsilC2Ho=;
        b=jDbJ/8aKDMlzVNz+sSMrWKsdAu6QkrcAG2Jp6cn3SeP+NA97aERVHuvhGxuKVPjYNn
         PdoubzBq2+hFx946vCkcP9dX4mppHWs4pfXAdzzLEaw9Zpu/QijkgyKuCZZeK9c33RiQ
         kG6MEjqkWWFkwLAtpbR4lUyilw7Jxp3092DGjMFIxcJx1ANTsdI5/vGpLTMPjWnyvmbo
         zhTUqM5J2o/MAH3XQxfjVfSq8+angvEu6LMy6tmKIHX286vKzj+G81XP810HL4fFjEdT
         OS6mrhbuDJyegEE5vlr0JgvbXiPWD3xX0Uc+t2X3+SCHrmpWqbQGJGCX2TaAYSF87MCD
         up1g==
X-Gm-Message-State: APjAAAXi/K5x+zSHZ2Ub7bPpFCnZsPHQPe6MlWGPWr04r89s2a5aFP0A
        4lUhc2CdxK9meMiVRB82RHtF6w==
X-Google-Smtp-Source: APXvYqw7TSPnpy3MWYRruhfAeMHRoulJ8w8nfVVhcNU0/ogVq+g/zJY+92/9O6keIoubCGk38eXy5g==
X-Received: by 2002:a0d:ea56:: with SMTP id t83mr2230445ywe.351.1570800780441;
        Fri, 11 Oct 2019 06:33:00 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d63sm2234513ywe.55.2019.10.11.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 06:32:59 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:32:59 -0400
From:   Sean Paul <sean@poorly.run>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     robdclark@chromium.org, sean@poorly.run, airlied@linux.ie,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/msm: Remove four set but not used variables
Message-ID: <20191011133259.GR85762@art_vandelay>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 10, 2019 at 02:55:02PM +0800, zhengbin wrote:
> zhengbin (4):
>   drm/msm/mdp5: Remove set but not used variable 'fmt'
>   drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in blend_setup
>   drm/msm/dsi: Remove set but not used variable 'lpx'
>   drm/msm/dsi: Remove set but not used variable 'lp'

Applied the set to msm-next, thanks for the patches!

Sean

> 
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c  | 2 --
>  drivers/gpu/drm/msm/dsi/dsi_host.c        | 3 +--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     | 6 ++----
>  4 files changed, 3 insertions(+), 11 deletions(-)
> 
> --
> 2.7.4
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
