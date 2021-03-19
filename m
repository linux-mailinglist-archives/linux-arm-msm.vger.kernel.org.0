Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7B63420A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCSPNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCSPNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:13:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230B8C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:13:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a198so10533305lfd.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ayTZjFxRhnC8VGTqHsHaHigGOs8/jskQ5TUarpfnr58=;
        b=HqB+ZHZwCbGOtObgPGMI3s8QN70KKaFwnotbPiKFqdwgugyXo8Odhnnc6qKk9kChbD
         w9lXWIo7ASUpeobdz+HDIJ2PdFmYAVCG8VFrlJGq3X012qiXzu+acWEI4sqLDBtHpyrm
         CbjymU9vs8WGSkfLB+1PKXdcE0HeJaR0dWz3tQavRNyZuxrcBH0H+2CoR9wxA7zQV7cH
         qraZKRBjeSgPwBF+DGvh2DLbNMVIkd7dpqAVXvw+ugLo1ga44CrpYOCl0+E1dMsDluH5
         pZS4r+mJBDmGQgdSxeK2b1axCfOc+EH1+7f7ynyVoPmcMaVljiS2F2xJHwxB5AsYJE5X
         Jv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ayTZjFxRhnC8VGTqHsHaHigGOs8/jskQ5TUarpfnr58=;
        b=n925e4Twj7FtcJbTOt+QciVFRN/bvysKK1tPQS+lIyjyj7+iy0RJcn+Z2HDwMRhiXu
         6zzO9WHr+IWmJQH+NtmN0ZZhHkFblU7XcLEw8bbmWg0+4KWMLk61qnKULb4QtmbN51Xu
         kg3ga/THYe7jSvf+lRxPznNCXDK/3dAofnipvdYI21i65PSrV8Nrr5yzbNJX/vgB+eOb
         kAb5fY9ux3TAiz2G9leg2aeWhSOYKzWcNOB2bwXrOO4Qfl4b/x4lenX8LsfsIPTdMj3h
         xfB1gUpXU6ek5Vgj4/Ut10mO6GHwki6BNf9oDwDvLljNpSQ/kTPO5/NjKGmTPkheDHe2
         vBeQ==
X-Gm-Message-State: AOAM533Z7TxTX4gcDDZCkPD3UB7lkuk00CWR3chJwgsW9EdVMI2xokO1
        7Bgvgn8GTDEkgIrhZA2M4Im6CfQRzmwNv+cbifU=
X-Google-Smtp-Source: ABdhPJwNGBC6FdrWz1YtnwSBdmcRHIEvYv1CuN2qrAxfSf7ep3pfkDcpcXIc+9Bu7hMtEsRrnZxSCYGTFWHSGzy0nL8=
X-Received: by 2002:a05:6512:1031:: with SMTP id r17mr1058146lfr.583.1616166812521;
 Fri, 19 Mar 2021 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com> <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 19 Mar 2021 12:13:20 -0300
Message-ID: <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Fri, Mar 19, 2021 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:

> I think that might not help if something fails to probe due to (for
> example) a missing dependency, so !priv->kms is probably a better
> check to cover both cases.  But the 2nd patch makes a good point, that
> the suspend/resume path probably needs the same treatment

Thanks for the feedback.
I will follow the same approach for fixing the suspend/resume path then.

Let me test it and then I will re-submit Dmitry's patch and the one
for suspend/resume as part of a patch series.

Thanks
