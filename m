Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2024147B65E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 01:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhLUABX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 19:01:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhLUABX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 19:01:23 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64131C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 16:01:23 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so14589630otl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 16:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PRRlE08tRQGUC/ML6AzImHY04yPHs+qeigbIK6/ghCA=;
        b=WTin9bf+zQCthKwRftbe7mXH1Hwkj0/++A2ImlNyEdbKrQyYcw7vxaOSmoo3yhQTYB
         8xus/V01oDtDh/8outB78i7WyWUyy2yHdZAahe1edvGG7m/Pm69awBYMJboaizx89H3H
         TySg4EtqKrNEYuEE4Q4R0OqqygxISuJbOAKbu80bTIDm7yKlpB/HMYXa1z94jjfhHSk7
         DfdTZ/CV+1TIYTyrPNVOAAGiqu207MBdjUqyhP3wWXVU8NaOfYZFdsI77fTCVihYsS9b
         ZslrJ3NsLR1SnC6wfdADYXanvW/E7ZUcqEbmT9QSZ8HX9kWfqZYoAtFQuRmEA5A11uId
         gdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PRRlE08tRQGUC/ML6AzImHY04yPHs+qeigbIK6/ghCA=;
        b=pjtaBKXTSEpt68faaGtvntbUR9SsPvGGLMh7DIojAiD8GdRjtM0SZwvfOwyk6g92po
         18Df7LM8Jjc3OBAGZvnH7dVClVRrgDUpy0gMzYPqbG6K+rAe9+KwsVH2OtWo3ZXZ3WFw
         CIg1QSgO3MX2ba9J6/OvU2fOeKCh//vLIGVt9llxsp4dn/vDtXgoNT9RpauV2kHoDJfM
         T1zsJMtfUzEPyV9Mh0MHJpkYwUq+A/+infup8+5F4TYUiuNUWDKNpUn2xpq+d/1qFS+G
         cDPP91H7WWCZqzszBzQnf+IJTbOG5zcEpaJj+p967HoJKmpLhQ/Y00zKtWX7SJgi+H9G
         jErA==
X-Gm-Message-State: AOAM53323F/ZEoW9pxLxspTT5u2J/zhvP2RljBxI5Nm5uf16sFlZaeWl
        4AcYZVz3wolF0ZrVyvMFSaOxG11Xa78ybQ==
X-Google-Smtp-Source: ABdhPJxLH6ATKCV5pwDXNkHsZfhkl8m3cSUMOoFFfS0pKDKjPYh+aUzBCxMsy2pZgtNiipr6geA0jQ==
X-Received: by 2002:a05:6830:8:: with SMTP id c8mr407528otp.115.1640044881961;
        Mon, 20 Dec 2021 16:01:21 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x16sm2181504otq.47.2021.12.20.16.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 16:01:21 -0800 (PST)
Date:   Mon, 20 Dec 2021 16:02:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: Only create debugfs for PRIMARY minor
Message-ID: <YcEZljENYJQAk9We@ripper>
References: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
 <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Dec 15:53 PST 2021, Dmitry Baryshkov wrote:

> On Fri, 17 Dec 2021 at 03:19, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> > of the files created are unrelated to the minor, so there's no reason to
> > present them per minor.
> > The exception to this is the DisplayPort code, which ends up invoking
> > dp_debug_get() for each minor, each time associate the allocated object
> > with dp->debug.
> >
> > As such dp_debug will create debugfs files in both the PRIMARY and the
> > RENDER minor's debugfs directory, but only the last reference will be
> > remembered.
> >
> > The only use of this reference today is in the cleanup path in
> > dp_display_deinit_sub_modules() and the dp_debug_private object does
> > outlive the debugfs entries in either case, so there doesn't seem to be
> > any adverse effects of this, but per the code the current behavior is
> > unexpected, so change it to only create debugfs files for the PRIMARY
> > minor.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v1:
> > - Moved the check up from msm_dp_debugfs_init() to dpu_kms_debugfs_init()
> >
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 2ee70072a1b4..a54f7d373f14 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -193,6 +193,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
> >         if (!p)
> >                 return -EINVAL;
> >
> > +       /* Only create one set of debugfs per DP instance */
> 
> The comment is misleading. Could you please fix it?
> 

I agree, and as Abhinav pointed out I didn't update $subject fully
either.

Will resubmit.

Regards,
Bjorn

> > +       if (minor->type != DRM_MINOR_PRIMARY)
> > +               return 0;
> > +
> >         dev = dpu_kms->dev;
> >         priv = dev->dev_private;
> >
> > --
> > 2.33.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
