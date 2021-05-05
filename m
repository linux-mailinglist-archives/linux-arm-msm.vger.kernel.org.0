Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5273E3734EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 08:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhEEGVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 02:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhEEGVQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 02:21:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577C8C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 May 2021 23:20:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s25so1045403lji.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 23:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TLxMCAMVmX7HszajjiR4DcItst/hjHR61748KVvNPMk=;
        b=FHCIVt8rvdxQGtdJkX/I77dR4ioBIYq4/Ak2g7R9Joe/jSncLn00Getl3NuoNh4G7G
         1C89l3k+eOZW27qAY2WrLpNS0SJbUK78N63RFiqT/FD5ayYTXfEms+zgAf0i94NUTMlI
         YAfII+2QUsZDGNXxrtMJPOglA3C418kEBuHLoIBpXXQPxtNiY0IyC+Jz8LwRh+MF6AV6
         hBNsXYyJ4EqWB8RoyByNNUcMCtLPVAgUXo7A+WS4Dwop8tSqIqlGoVppH9ZQpuwPJbv0
         XmnyD7a8vFodhGuhPFVb8kFANU0wZYF35zlDVOvIC+FlxPcveG/dXubaNLGlBbMEuU0o
         kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TLxMCAMVmX7HszajjiR4DcItst/hjHR61748KVvNPMk=;
        b=J372+mHooNMVleTBJ7LaNEPG8a2dJSL5C7TY1uS/MJC8UBcU2OA8PfdeGGgPnic0u7
         mQWwIZTAUTv6YA7S79rEL5/oPTONtqplq3oppaK+3OSazchhhK4px6ZfvULzokJo/GfP
         Y8Lv83bUpe4V4/wK6seEBHMwIK6K4dNG9WDW/V6YNgfEi59y+rIIFlKr0PvU221vZdAq
         GKIj+KICmwdwgTNK83nEMb9k9K9cTfapimCOusj6NKohmEOJWvhoWxh1P+uy2INtnOXd
         Pazlf3igC+QLwdkWLZOzNzH7UhAbCNT0mRfYInh/hyGu6gH4PlDxuYNPhH61XlJK+Y5a
         3EYQ==
X-Gm-Message-State: AOAM533vGXqBA/61a+tW6WN4ozDt8aONs3iAh2KsN7xnA8D7ll1L3Ych
        C+96XDr/0QRo+F3OGxm0wvdL3zBWSKc0Itovmlobjg==
X-Google-Smtp-Source: ABdhPJzsebk+qwUhadwILiY3DIStmcEZqz+HCLys3KKQusW47otK40KA9ll7+jv8juCMYbdYt2LxFNodXZmiInkvhqk=
X-Received: by 2002:a2e:b4c3:: with SMTP id r3mr20143573ljm.232.1620195616627;
 Tue, 04 May 2021 23:20:16 -0700 (PDT)
MIME-Version: 1.0
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 May 2021 23:20:05 -0700
Message-ID: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
Subject: Regression: arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmware
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dmitry, Bjorn,
  I wanted to raise a regression I caught in the merge window on db845c.

I was seeing troubles with audio and while there are a few other
pending fixes needed, they did not seem to work for me. So I spent
some time bisecting things down and found the problematic commit was
7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
follow linux-firmware").

It seems for systems using the old firmware filenames, this will break
dependent devices on adsp_pas and cdsp_pas nodes.

Now, obviously updating the firmware files in userland should resolve
this, but it adds the complexity that we can't just replace the
firmware files because older LTS kernels will look for the old names,
while newer kernels will look for the new names. We can add both files
to the system images, but then there is some confusion on which
version of the firmware files are being used where.

So yes, we should align with linux-firmware file names, but I think
more care is needed for this sort of thing as it has the potential to
break folks, and this isn't the first time around we've had similar
firmware name changes break us.

So I'm working on fixing this by including both filenames in userland,
so we probably don't need a revert here, but *please* maybe take more
care on this sort of change.

thanks
-john
