Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C81402ED0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 21:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345873AbhIGTOJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 15:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhIGTOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 15:14:08 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F33FC061575;
        Tue,  7 Sep 2021 12:13:02 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id z1so72091ioh.7;
        Tue, 07 Sep 2021 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDAmrQspvTHk4pXz96SxgqAEoYvB8Qdlb33lW2JOQKI=;
        b=iiaLA9iMJ1l/ZVUFBUL09riUqd8KCAFHSBgHpVV94Te6gjyYNUe468qaok1x0albDO
         IxsvhA9VjWjL68B2TtpsU79ayleQF+6eLhi3eOsxorE/xnyq5VsPeAV1G5rXH1XH4vwH
         25yrQ3QdtaqOUQIimvO98kzNHEgIBnJK+fxLSSjhoy1U+KonCL69C9Bgpzhxv8L4t87q
         pIeQ+5LilhJTDuERHH0MjhPzDQ45jkofDeejMgOpldFf6hdwGuc4xMtsgv3Ic7qEriOW
         0OThCYpCF6l7sjDKKUHyqwFX4HJ/ejjXla4KWYGl3ARlMipeZTb3UNq6WeacvSz51VB0
         blPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDAmrQspvTHk4pXz96SxgqAEoYvB8Qdlb33lW2JOQKI=;
        b=luG6hfsF6DBrD5SoSpjAdSEfhcocreNMLdAg+A7l495VlKkKKPntkN/TBjmO6vUA12
         leZ6GmULSA1qvCB7IiUqDaWgNMgD+yX7FFjXZzczNpMpbJnrTv5eLPItuWbo/GSP+x0w
         rPRtqa1qgtVzSHGNpoO1IJP8zRYmRMp+L7O402gHpqepORMg3UVErN8I/zFv913Jmnoq
         JZ7EbMHJy91tbq7DM0/9AapsKWxgNhkd/5VflIUIQx2SEIvIBaJg6a9akZYWwglSNpyV
         to7//ZjnT8b1gXyO2RSVJOAVS1RH8BnDU1F7EeuV7cjzsVNr5mVf1sq+Mg7AU5hkzoPo
         EZDg==
X-Gm-Message-State: AOAM5321RdWHcmqtNHBkpOFxTCPJPvBLb7vuF2yWUKg0SFGX/m/Xvnr8
        VwruOf8ZJD9X74kXi2Up5ida+7Mv/AMrjk8ON2A=
X-Google-Smtp-Source: ABdhPJwzbaiPi0tOgc36KfgAKqrn62eE1qk9JEH9OxgwGowNbmENlYJ37v4PzRRODGJoiIfiZTATjqiN8fzzPEMm/24=
X-Received: by 2002:a05:6638:2690:: with SMTP id o16mr17203558jat.65.1631041981634;
 Tue, 07 Sep 2021 12:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 7 Sep 2021 13:12:50 -0600
Message-ID: <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Bringup functionality for MSM8998 in the DPU, driver which is mostly
> the same as SDM845 (just a few variations).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

I don't seem to see a cover letter for this series.

Eh, there are a fair number of differences between the MDSS versions
for 8998 and 845.

Probably a bigger question, why extend the DPU driver for 8998, when
the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
dumb, but I don't see a valid reason for both drivers supporting the
same target/display revision.  IMO, if you want this support in DPU,
remove it from MDP5.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785
