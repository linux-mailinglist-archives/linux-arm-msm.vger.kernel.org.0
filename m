Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D96B2F5154
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 18:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbhAMRpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 12:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbhAMRpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 12:45:15 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129CDC061575;
        Wed, 13 Jan 2021 09:44:35 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id q1so5797958ion.8;
        Wed, 13 Jan 2021 09:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GxOtgS+Xh2c4gM900gflGCTwmZ9LNPxRPIIevu1BMTQ=;
        b=s/uS08K1TOWmct0CItrFzvdfPNoOQ4CeK69QPLn+8OCg+m0ndwcicHhFN25oBzg4hI
         fbixGl9R2OPq2JxeQKbGRtqDwA8fih6HYxYGLiuzeFCiVnQrnSPy3jojfqI+mWuEtZcF
         y1arMNUfqiQUH98P20+/QvdfLE16WYzP9S29udSIjkj6vYhvtoUbx+5mcq4ILXs45esJ
         O6wAwnoDcv5q1VY9RGXHjre5jS/hF51em0bD6UJqUE5w7stwBoskl9mDNBhJSu7Wpl32
         GqgVnXSd+81XXnpAURO0bGH+ldEjNbYEDP4iRjNKaP5vCn65qeMaMKdGb9Ao4emNPyTd
         2ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GxOtgS+Xh2c4gM900gflGCTwmZ9LNPxRPIIevu1BMTQ=;
        b=RQcdSv0wVE2+xPEtft550qx81B2oTnRi92+nsgSEeM2eQ0SItImfBw0yB7P9AYfdUE
         Q+FoXeH91jWf43IH0mPV8Ov9cZ+TGi0y7TKEm4efV/fwLB6i1eb1fbMKk+3+yQ+5uGX+
         DhylW6iIyhh3GdAT7qZ2Ua3t6CtlA59nBmoRY7QxjIqbOn7Fc+R/NHWmdNWdbq9TCFX1
         5c+5+LdeLNMlWH7g0XIXT5r3w592nFzOZSnPruawc+ho+7EWv+qZX8YkrsZ1rtcZPFr+
         LTpX6C6N8N2qzkYOn/iECsSdiwEx5qWVF0abTLfJNI3IuGL5hGqK7944y5pr9WzHXn4C
         3TUw==
X-Gm-Message-State: AOAM533n+8gHi0fsEtqArbOFaqwCG3Yyob1j0frCMIhEAvmTnLFjmjGx
        92mOXeOjv92MrcHmTzvRc+0nwyi8MNoMGSD0FZo=
X-Google-Smtp-Source: ABdhPJwcDQQVvfaGVTJJyPO9agnc0YgtInIwM7HMx4jMe26R8aVur5CsSkUR1G9z2v+HBghKr3jQXWY3zxe85jyhom8=
X-Received: by 2002:a92:410b:: with SMTP id o11mr3483527ila.306.1610559874466;
 Wed, 13 Jan 2021 09:44:34 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLiUBhJdsgw9bjQxxhkeBHQFoE_vN_Na6kw3ksr89r+HOg@mail.gmail.com>
 <X/2Rr5LDNbxGz456@kroah.com> <CAOuPNLiVP2d29td0b20Tx7=UBy5fGk5S9Yt=usUH+VtSYORe+w@mail.gmail.com>
 <X/7m4787HEIcxZzm@kroah.com> <X/7nZjjJ3doGT3XO@kroah.com>
In-Reply-To: <X/7nZjjJ3doGT3XO@kroah.com>
From:   Pintu Agarwal <pintu.ping@gmail.com>
Date:   Wed, 13 Jan 2021 23:14:21 +0530
Message-ID: <CAOuPNLg8QncBr0vzfbFhi0AgpMwRFpdnB-ZZ=Fn-m18Y+saayw@mail.gmail.com>
Subject: Re: [BUG]: Kernel 4.9: Kernel crash at fs/sysfs/file.c : sysfs_kf_seq_show
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, landy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        indranilghsh428@gmail.com, stephen@networkplumber.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Jan 2021 at 17:57, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

>
> And, if you look close at the above links, you will see where the error
> is, and what the out-of-tree code needs to to do be fixed up properly.
> An exercise for that is left for the vendor :)

Seems like I have fixed the issue myself. There is problem in the
probe method itself.
Further debugging in progress.

Thanks for your inputs.

Regards,
Pintu
