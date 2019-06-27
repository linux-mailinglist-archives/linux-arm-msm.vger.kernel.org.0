Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F133A57966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 04:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfF0CVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 22:21:54 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:39408 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbfF0CVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 22:21:53 -0400
Received: by mail-lj1-f170.google.com with SMTP id v18so625072ljh.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2019 19:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RRhh2BLMZL95EMjVW2in5uISjMR/OjhejEPFgKSUvXM=;
        b=nrCIngIDKNrFoCwFgn6/okDJclVnto0cZ2YimrTJ3yOMp12imq8hQEshF237VELdQz
         FgbQVvhVKEaUYW+FXxTbwnEEc2ghU8LbALSMCZ+lWNl6baQbdwb1UFlKrhJ1l1kC5vY5
         t6aIArR503EMgFLZKOYiKZm5x0PamvKNok1VuBfO9AOGv5W/BK7niLt6kHDwcYLlxnX4
         vpiZKZuWGeeujHWx2nrY4zQ2bJq1BmfxqflIxw232AUd2lsyfwQ+NuwaZBUWjEJZuXuT
         LZG7ueV8hYwRUzMVTWqJVFCyx2Y16ac9RZOM0dEMcuWTPHxPfJe9p1zBpeHzxObQHUHc
         m+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RRhh2BLMZL95EMjVW2in5uISjMR/OjhejEPFgKSUvXM=;
        b=XoNjWRoerjzFTveCB6iwLtJZ//bF/+8iTffqX/hcjo7H00jNh+rYjrpIZW3BTK1gM8
         89Gpulz3Vm6nsV4eKzDbqiS/H1p/XO3utdOpbuSxSwXkv9fmhs/QfHCc69MkRsVhoGC+
         Xcl/ZCiLMJ4ugiSxNDLC7USV3uojec9GuKxoHDf+/sgVkEfvbub/ondg67/vmt8P/h1l
         yFMpaCufiIK98J205OZE+WuOgntKHhWbHmMTq0bl4jvo7S4xkyYF/5bQjizHHkGIVWhV
         DbbK8+bN0kMQYdZcrMF4tNDeEPBl2fyWluGvbDJJSYxc0YFW6HWfFr4MmwcjF5dczSEz
         Pipg==
X-Gm-Message-State: APjAAAU4aGg1bzulVE6x4FBaGVrYE2ggQuFH5iS2e7zQkSXG5OfwMPdE
        fDPDRkD3GnXu8pLjtPK68Ca0MhO2fj/G6Cb2LsQ=
X-Google-Smtp-Source: APXvYqxqJ/BTGNE5tosMdEVYJoTmCd9DGd6+UWGNZDmQGmFo1PU2KIrEjbyCeARqJ4YNIKD30UsMO1ljccBByn7JSO0=
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr851068lji.188.1561602111271;
 Wed, 26 Jun 2019 19:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
In-Reply-To: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Thu, 27 Jun 2019 12:21:39 +1000
Message-ID: <CAPM=9txROe0mxv+w=v3trMbn7pPxj5wbjkh5=RJarsDbGwV7BA@mail.gmail.com>
Subject: Re: [pull] drm/msm: msm-next for 5.3
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Jun 2019 at 08:34, Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave,
>

Naughty naughty rebase.

dim: f47bee2ba447 ("drm/msm/a3xx: remove TPL1 regs from snapshot"):
Subject in fixes line doesn't match referenced commit:
dim:     7198e6b03155 drm/msm: add a3xx gpu support
dim: fc19cbb785d7 ("drm/msm/mdp5: Fix mdp5_cfg_init error return"):
Subject in fixes line doesn't match referenced commit:
dim:     2e362e1772b8 (drm/msm/mdp5: introduce mdp5_cfg module)

Please fix or squash those and resend.

Dave.
