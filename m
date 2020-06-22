Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC973204083
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 21:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgFVTcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 15:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728588AbgFVTcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 15:32:19 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4B4C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 12:32:18 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n5so14133287otj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kDvWJFrzfpWbkxz8YXuc2rLUJQ0CoVh8mMluFwhFK9g=;
        b=X4t7jax66/02t8oexfXxT0PX6kXxK5rECyLccSKXxOoR/BkGQMHjqxEkJEN2Mm/X5C
         YlhyuvZzjl2K51NtRfnqMTHkwxtI8Uq0QybiLU6lXgXwrWDYh7IL84D9cm5G/+7ATEVl
         OCOfKFp6jJAOR6rkGn2vefwW2qKFVjRwzEs4z6NnDS7PLZU3CwM5YdQVmZ2xtadDm/Fb
         vtQUapslp69ZExR2yYVeVqY7DHLy0vGOCzFNzhhDzqVrZRt45QgeZ3lmcFYM8mkvG4JR
         5t2QO9VHFSR/CJ0E+pOVnXztmWWnD7FvUKEfCiGiWNgIgeoVy/op0sPXg6XwEFxkZpWB
         yNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kDvWJFrzfpWbkxz8YXuc2rLUJQ0CoVh8mMluFwhFK9g=;
        b=m+SsFyBSlHD3o0+Dzr6p0Ua+e1dFPvhWjsjOwYufRJBJD2XTizh771QyzVpq2d1YCy
         6Zr96dqZhnEiagP3GYquUKRWYAanD4cn8BZ08D16dkWyuIGzGxbRYoJEvH3WSWtavUkq
         lStpdqpWFK8Zjqgtk2TQG0fMah1baZwiIHJYSRmg0F6/ehgNgjAhNt8sckyzjkVaeq/A
         zfWYTq3760hnyoxb+0mLw102IAAR9Av8I/vlFQVs0/QiSraKjhlv08aWjpWmO5ThZw5a
         xBJn2W9ueOls5ZZNRr7fABM+U4d9GAJy9EWguhpP3+2iPUuFfABnk/QjbhMyPDhzo8MR
         7cMQ==
X-Gm-Message-State: AOAM533az0DB31bLD5NST6mp6lOGt3Costrx87iWit2d+sqnHvoDWphB
        pEBfT66n4IuH6H61vdSRVpZpIQ==
X-Google-Smtp-Source: ABdhPJw1Yikg9xiPvrCpS0EyuUZHl3QTpNdEklGCVVNVy0Q/IhIJ13yL7Nwk/uZDAT74cBkAEULrRg==
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr14225076otn.27.1592854337928;
        Mon, 22 Jun 2020 12:32:17 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a10sm3630772ooo.39.2020.06.22.12.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:32:17 -0700 (PDT)
Date:   Mon, 22 Jun 2020 12:29:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, john.stultz@linaro.org
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Set suppress_bind_attrs flag
Message-ID: <20200622192932.GV128451@builder.lan>
References: <1592808805-2437-1-git-send-email-mkshah@codeaurora.org>
 <159281658960.62212.15968925558324290917@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159281658960.62212.15968925558324290917@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jun 02:03 PDT 2020, Stephen Boyd wrote:

> Quoting Maulik Shah (2020-06-21 23:53:25)
> > rpmh-rsc driver is fairly core to system and should not be removable
> > once its probed. However it allows to unbind driver from sysfs using
> > below command which results into a crash on sc7180.
> 
> What is the crash? The world falls apart because rpmh APIs start
> referencing pointers that point to freed memory?
> 

Presumably the devm_of_platform_populate() will cause said drivers to be
dismantled as well - but I think it's safe to say that that code path
isn't well tested...

I've applied the patch, but would have preferred that some time was
spent to make sure that things are unloadable as well.

Regards,
Bjorn

> > 
> > echo 18200000.rsc > /sys/bus/platform/drivers/rpmh/unbind
> > 
> > Lets prevent unbind at runtime by setting suppress_bind_attrs flag.
> 
> Ok. But when the Android module brigade comes knocking they'll have to
> revert this change and solve this problem too. Have fun!
> 
> > 
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
