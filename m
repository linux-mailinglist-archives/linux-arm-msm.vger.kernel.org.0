Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AD23F567D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 05:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhHXDIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 23:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbhHXDCT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 23:02:19 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E7FC0617AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 20:01:06 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d17so11341240plr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 20:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TpG2C/kTpX//F2miD5d/GHYF7TDY1xK3/TUlOMxRjGk=;
        b=EKuFH0fI9CerzqGCgehqbp4QGN5xQ9rR8p8kg9Q35QXQRIWEJEacI+SYARkmnHPSUw
         11NXDLb7Cti2vFLiGo3gPdgFZgoulpeVjYKE6owQ2wAFdV7wr7LLQQfocM5BR5VysNb5
         LLwXR9tVP/UrjeMh+HPL9Yspo9Xb3DcVNN/ubvqZI9AkHCeeBNFiMwN5Q55FgKobGt22
         IXcQpI1BTj1WehCpHeitGMRYqsOqQvSzynyHOY3Rh6idQzKvAQKGLnSh7xQXi7mlstCa
         OoB7X8D/C1CvEdlZB/f3IxYf5y6PH88NRTl1k4OXscGcmW04qGZfawlv2rqd8NDZV3Hf
         5J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TpG2C/kTpX//F2miD5d/GHYF7TDY1xK3/TUlOMxRjGk=;
        b=PhGgGFtMYF5hGXZAiQwoc/GgJB9ECa9T5OB/MudcAHy6ytpXdC1uKRuVY2xXtC8X0Z
         StyHxvcj/Kengc8oHU7R1Pmss5hs7jPa4MGiWhZnKxC7OPkh8X71y+sOf9ykAnb9unPJ
         5ye78zEVHtH9lWqDnb5PCMElDlRK9Oy7TUzpvcOo8EnT306FELM2AbSoDQNWV70x47+i
         Q11oUhm28EfdECztzgDMpHMUYe0VDMmILSMp5fIvgDKHLqT3Kqzvi/acMPIzolSZ3vAF
         728Rc6RRY9n+0mETSpS45Uw88bsY5M8gEvE3gCNpBTmi6FzkFcbJatOvJ9rIHNnOOsum
         SZkg==
X-Gm-Message-State: AOAM53311iRjFVvSm9Vsr7DWnq/XMSAPoe11v//SKzrXuZYl8qldoC0+
        IFor35QvTJ4TPcOuCO8hw3E6Vw==
X-Google-Smtp-Source: ABdhPJyfyflcQvmdxe6+Ho8zP4jQiEKjDXw3D+8njaCvhvBwYbGhbuesOmAm3f/o/UGmnQy8jhjuMQ==
X-Received: by 2002:a17:902:b601:b029:12b:d9a:894f with SMTP id b1-20020a170902b601b029012b0d9a894fmr31544547pls.63.1629774065643;
        Mon, 23 Aug 2021 20:01:05 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y13sm17822792pfq.147.2021.08.23.20.01.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 20:01:05 -0700 (PDT)
Date:   Tue, 24 Aug 2021 11:00:59 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Warm reset support for pm8941-pwrkey
Message-ID: <20210824030058.GC22595@dragon>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714095850.27185-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 14, 2021 at 05:58:47PM +0800, Shawn Guo wrote:
> It adds warm reset support for pm8941-pwrkey driver.
> 
> Changes for v2:
> - Export symbol 'reboot_mode' to fix the build error with pm8941-pwrkey
>   being module.  (Thanks Luca Weiss for reporting)
> 
> Shawn Guo (2):
>   reboot: Export symbol 'reboot_mode'
>   Input: pm8941-pwrkey - Respect reboot_mode for warm reset
> 
>  drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
>  kernel/reboot.c                    | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)

Hi Dmitry,

Any comments on these patches?

Shawn
