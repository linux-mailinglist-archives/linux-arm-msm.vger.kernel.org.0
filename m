Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE4E1CC18A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgEIM76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 08:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgEIM76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 08:59:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFD1C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 05:59:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a5so5524723pjh.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xj1T5YhvcvBwjGMJQVL7Y5xOMpKxjTRljl4dKQ9HXJo=;
        b=CvFkioWPZs+/vvAZ+Voj7zix8SnckXQ6RWMT0akzkWEfkwaFK/PLHcZaC5kxZE8Fxq
         1vx3VBzxpahwyVqwlOFH5JknOvVXQ8fF+vaSA/UUG+zJX38cVbzxuEZmI/ELtxJw5/sN
         PIQPGi9SSZ2Z/cSBBhF2unEZA+56ostGZ4+wHcAzXRcul4uK93aBOrvuhgyNs9SXSHJq
         NZJm4vY9vY8Y7jNUSbeoE+nRhzPMu0YHNhpeRUuPUhO2hnImUdWjXHZapJLNVZr1R+Tk
         61OKI5t3DqZx2gi7wpqnw7SKXFrtEnMuKGWVtHpg82WE4DQiuOzbP5Try5cSTej6jmyP
         BQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xj1T5YhvcvBwjGMJQVL7Y5xOMpKxjTRljl4dKQ9HXJo=;
        b=TW6h4BSO3wGc1f9enFag4FJ0BhdBUrrQCai7BGXkGE+zJ3liSF3Nf8nul66CX5GYuE
         lAr6usB1n79xkO6cNya/2FOL/a8FgIEjcLeNaz4w7W1npxOg5+wrpBOopax/2ctulDht
         kli2aYKykcQfocgGedLwAJsc5rqiRUWRPnzCh0OsTvTMFsD88IO6Htv6WEfuop5xwccH
         8gbEMhb85u6zR023EdAFJmsGTurrMY+lmaPIRGHf1371L611i0Yb92M+lTSg2hRgNPii
         bmOUS0H0gVGvObHHcR7t8XZJMVIyt7WFfO22/LyUUaED1fZGfDvuMAgdT8Yopb+kYtFM
         G3LA==
X-Gm-Message-State: AGi0PuY+kYNn7RI1nxUI3AmJZOlknTG9iXGIoQ4JfaevqPBOhTAEuQ9M
        Tz9WvioxqKmGpnk1bcGw1ys9Gw==
X-Google-Smtp-Source: APiQypKBuBxoge/WoRey+HXDRJR/KwDvY4v6JT6FlgETkFS/2RfUCD9RD8qn0q0SidSfKsq4mMpKzw==
X-Received: by 2002:a17:902:9a08:: with SMTP id v8mr6763383plp.90.1589029197880;
        Sat, 09 May 2020 05:59:57 -0700 (PDT)
Received: from dragon ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y63sm4540692pfg.138.2020.05.09.05.59.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 May 2020 05:59:57 -0700 (PDT)
Date:   Sat, 9 May 2020 20:59:44 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     freedreno@lists.freedesktop.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        zhengbin <zhengbin13@huawei.com>,
        Rob Clark <robdclark@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [v2 PATCH] drivers: gpu: drm: Add MDP5 configuration
 for MSM8x36.
Message-ID: <20200509125943.GC26840@dragon>
References: <20200509104812.202981-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509104812.202981-1-konradybcio@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 09, 2020 at 12:48:10PM +0200, Konrad Dybcio wrote:
> This change adds MDP5 configuration for MSM8x36-based SoCs,
> like MSM8936, 8939 and their APQ variants.
> The configuration is based on MSM8916's, but adds some notable
> features, like ad and pp blocks, along with some register
> changes.
> 
> changes since v1:
> - add an ad block
> - add a second mixer @ 0x47000
> - adjust .max_width
> - write a more descriptive commit message
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Subject prefix "drm/msm/mdp5: " seems to be more idiomatic as per
git log of file/folder changed here.  Other than that:

Reviewed-by: Shawn Guo <shawn.guo@linaro.org>
