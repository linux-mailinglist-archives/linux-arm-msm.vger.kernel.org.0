Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BEC356058
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 02:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347367AbhDGAcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 20:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236581AbhDGAcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 20:32:35 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004E7C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 17:32:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i18so12562198wrm.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 17:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TBcLhKjW+lNY/xHMeacy+VBYq5BuH339oLlIaOMVibo=;
        b=IXhlNg1gk9Q3afzinJh5cGsiYymSXr6wkyTOm+Ds+w3bDDzzGycebedGuFeGt2igkF
         UvnbwZQWL8+jz7ieuQRU3urPeeMbecrBx7c3m7UFt6CPsgzAA1ofZo1YCPBuq61Uoxwz
         0p6yOSzuspqJxGLlok3vFVOyTvFUkVXiyf+ffLN+xBzfauX4lQ59J2b9WfTOxMB+PISB
         671VIA7N3yYMy6fn21stzg8rpYnrMp7n6LDndN6nye5QH+M0JSpbSRZ15vN90kbQ4RxX
         fOfQhp2IxS5nwJRqT3K43hxTvaHRmjQnOtk5ogFLQz3dUOwKhsZMYykLRXuVycBcbeD0
         8Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TBcLhKjW+lNY/xHMeacy+VBYq5BuH339oLlIaOMVibo=;
        b=ETaF0mVqa3NLXTRh0YkXXz4UGhAiDS8S7yu6e6Fwq80wnX7Ytl8XiSbJvn36FGNB1w
         NnyPs7gIZ8iruZ9nXo/Ef9l4Wr1lc1t9pLxFaetbfU5BzpUJb8y6PVn5AtQ9Y/tUFLIw
         3jBshb4lHCVuO+ITiisKdOUsGj4vQQa7fYXTimQa7LPxtzINWhAvIQopmCu+ewqVNuGk
         /tp6AszgcXOm86qCg7l13lqVvksXCjtwyeFendihOCA+R3A2wO71TTiotl0+hDTUL795
         /GhJGfIdrPo4ptzZVgLdTyFs8nUooaT+fBVBZFzsXO/zDgMQms/OJE6okf9vquUSeb0u
         qQFg==
X-Gm-Message-State: AOAM531Ff2evs2qcDC3RCddBSUuTCiQa7Ccf64JpXIfvMWwCVt+74d90
        /giRmElII/6bWj6t8JS0sk4VsME5cK0Nx8KDWReUOc4Dr6c=
X-Google-Smtp-Source: ABdhPJy1ZhlxVS19+Yc8gcG2+QL19bhVjKgeEE0UjD9U4MdOCxq8CxV73gq8KOJ9Vp1y1ok/zkwogk/hw1PvbAdNMT8=
X-Received: by 2002:a5d:5612:: with SMTP id l18mr990419wrv.28.1617755545584;
 Tue, 06 Apr 2021 17:32:25 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 6 Apr 2021 17:35:54 -0700
Message-ID: <CAF6AEGvWq74nswoUWCMUcUGACDhZEs4BzCwuy18JrmR=NFPwTQ@mail.gmail.com>
Subject: [Heads-up] drm/msm: msm-next-staging for v5.13
To:     freedreno <freedreno@lists.freedesktop.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PSA: msm-next-staging[1] should have more or less what will be in
msm-next for v5.13.

I've done some testing on hw that I have with me, but I don't have
everything, so this is a good time to test and let me know if you have
any issues before the patches are merged.  And a good chance to double
check that there isn't something important missing.

Also, I've pulled in (at least for now), the swappable GEM object
support.  But compared to the patchset on list, I've flipped the
default to disabled.  It can be enabled with msm.enable_eviction=1 in
the kernel cmdline or:

   echo 1 > /sys/module/msm/parameters/enable_eviction

It won't do anything without some sort of swap enabled.  (On
chromebooks, we use zram swap, that is what I recommend since it is
not nearly as slow as disk backed swap, yet still gives a useful
increase in usable memory.)  Since we have a lot of generations of
devices supported, paired with a few different possible iommu's, it
would be helpful if others could try enabling it and report issues.
In the best case, it all "just works"(TM).. otherwise if at least the
iommu is working properly, you may see new iommu faults.  In the worst
case if the iommu is not working well, you'll get exciting random
memory corruption!  A good way to test is, with something running on
the gpu, run mmm_donut.py[2], ie. something like:

  ./mmm_donut.py --free_swap=1024 --taste=20 --chew=20

you want the free_swap param to not be more than half your swap size.
You can get a summary of the state of gpu buffers with:

  localhost ~ # tail -5 /sys/kernel/debug/dri/1/gem
  Total:     5264 objects, 328941568 bytes
  Active:       0 objects,         0 bytes
  Resident:    11 objects,   8527872 bytes
  Purgeable:   44 objects,   5591040 bytes
  Purged:       0 objects,         0 bytes
  localhost ~ #

Total minus Resident will give a rough idea of what has been unpinned
and swappable..  (it is normal for Resident to be *slightly* less than
Active, because sometimes userspace allocates things that it doesn't
use, or hasn't used yet, and newly allocated GEM objects do not have
pages allocated until first use).

BR,
-R

[1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-staging/
[2] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py
