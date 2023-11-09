Return-Path: <linux-arm-msm+bounces-387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E317E72F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 21:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A401C20979
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 20:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18341094D;
	Thu,  9 Nov 2023 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2WtohrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AD21802A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 20:35:54 +0000 (UTC)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E723C15
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 12:35:54 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-da37522a363so1399523276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 12:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699562153; x=1700166953; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5oZmXInrzdGzWD7f4M1kpaUKNSP65Mx0CXqNe5IV7Pc=;
        b=d2WtohrVOl5lIIO8D4L5Zu72p/SOitbYno0Swxet/WgO+eXkSrncvNKs4wAKFrG7kr
         CS7+uUT+3lFgBDP2Kli/sqID3gJyN/5pcgm/6hSAR7wGCwy8nS7pJlAH0+CuAxg1WXhG
         R2RBBh69VP2O4x24I6tQ1+BgzBdzzLdz9PjkXV3lJ90LDx3P2Oq956uG8yyP/ZnQxs1q
         5KmkAtEQq3/VdcQj23NqvZURVinXCH+YVX4o9bx/ya+kezI2osErpp6sGpiCRyHWslvU
         KwhFVcLfLDomqMT+d/PR+nQQUsEM95DahCUstr/OzSXkpBSlPQjXYGKXiK2ZYT82k9LQ
         BPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699562153; x=1700166953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oZmXInrzdGzWD7f4M1kpaUKNSP65Mx0CXqNe5IV7Pc=;
        b=nKJzfpBNEXpJzGDJtMnXgBpYv4JaYBat0mPCxAX+2l5BDoGgF5liGE0c6oVSmIl/WT
         8F9kDOUWC6CL5zUblM4LyOj1gQr2e2+6lspXMPhikXK/iB/IdJnPaCQP3LWswkhoiDw7
         wvbDHpbS6jSGmqVUKCMmzhYyIm4HEGw3oRWHidFRjff/8vUGanJoeKb1aZePO02Dn/Rz
         3l6zowH/+iEnGtDmStmtkOL/p49GJ0cS6doht7EEQuNqJRUj+lLHubsmzkfB5yKthNcI
         dSJ4xLlBsN7HBGKQYvNyjn3UIk1/LpbPpjhapiDmn9XEJmz0ngb0zoLi5uXjq/zfrY6R
         m5hQ==
X-Gm-Message-State: AOJu0Yzr3xy79JY1kecRd8OTn2oz9ym52hBf/x7CzkyAW7ffBipOjNM0
	+4krMmrKp9h1lSstwmQMzNAqVIi57S67a2tTyiao1w==
X-Google-Smtp-Source: AGHT+IEfI4SV96c7xYyRllAmVp2MeceQwUYUvbneQR8XxoK0jOqTT/Sia80rFO0jgZvmNOshJlS2DpAFLu2D8cdIuZk=
X-Received: by 2002:a25:774f:0:b0:dae:1c87:79c0 with SMTP id
 s76-20020a25774f000000b00dae1c8779c0mr5916705ybc.19.1699562153154; Thu, 09
 Nov 2023 12:35:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
 <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com> <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
 <b708df07-6812-df43-1313-cf6f1289fd47@quicinc.com> <d597554a-ad3a-0af1-e21b-3001c80f6d30@quicinc.com>
 <748da144-af4c-5a2a-e82b-3a870995cbce@quicinc.com>
In-Reply-To: <748da144-af4c-5a2a-e82b-3a870995cbce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Nov 2023 22:35:41 +0200
Message-ID: <CAA8EJppsyS_BTWwtVdX-B3V=O7nSWsadW4G6o-nshUNo-Z71rQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, 
	dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, 
	agross@kernel.org, andersson@kernel.org, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Kuogee,


On Thu, 9 Nov 2023 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/8/2023 10:27 AM, Abhinav Kumar wrote:
> >
> >
> > On 11/8/2023 10:10 AM, Kuogee Hsieh wrote:
> >>
> >> On 11/7/2023 1:23 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 7 Nov 2023 at 23:01, Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> wrote:
> >>>>
> >>>> On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
> >>>>> On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh
> >>>>> <quic_khsieh@quicinc.com> wrote:
> >>>>>> The purpose of this patch series is to incorporate pm runtime
> >>>>>> framework
> >>>>>> into MSM eDP/DP driver so that eDP panel can be detected by DRM
> >>>>>> eDP panel
> >>>>>> driver during system probe time. During incorporating procedure,
> >>>>>> original
> >>>>>> customized pm realted fucntions, such as dp_pm_prepare(),
> >>>>>> dp_pm_suspend(),
> >>>>>> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with
> >>>>>> functions
> >>>>>> provided by pm runtiem framework such as
> >>>>>> pm_runtime_force_suspend() and
> >>>>>> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq
> >>>>>> handler
> >>>>>> are bound at system probe time too.
> >>>>> With this patchset in place I can crash the board using the following
> >>>>> sequence (SM8350-HDK):
> >>>>>
> >>>>> - plug the USBC DP dongle
> >>>>> - run modetest at any mode, don't press Enter yet
> >>>>> - unplug the dongle
> >>>>> - press Enter to stop modetest
> >>>>>
> >>>>> => the board resets to Sahara.
> >>>>>
> >>>>> Please ping me if you need any additional information from my side.
> >>>> questiosn,
> >>>>
> >>>> 1) which dongle are you used?
> >>> I have used several Dell and Hama USB-C dongles.
> >>>
> >>>> 2) what code branch shoud I used to duplicate this problem.
> >>> I have pushed my kernel tree to
> >>> git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm
> >>> I had several UCSI patches on top, but they should not be relevant.
> >> git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm <==
> >> I synced out his branch and it is still work at my chromebook Kodiak
> >> DUT.
> >>>
> >
> > Perhaps the gap in test results with the same tree is due to internal
> > hpd vs hpd pin. We need to try this on a device which does not use
> > internal hpd.
>
>
> Hi Dmitry,

First of all, I was able to reproduce the issue without this patch
series. Kuogee, I must ask your pardon, it is not a regression and it
is not caused by this series.
So, we have a bug, but not a regression.

Second, a stable reproducer:

When you unplug and re-plug the dongle, switch the orientation of the dongle.
This way the system crashes in 100% of cases.

Here are the last messages that I see on my console:

trying to open device 'tilcdc'...failed
trying to open device 'msm'...done
setting mode 3840x2160-30.00Hz on connectors 34, crtc 84
failed to set gamma: Function not implemented
[   25.504828] [drm:dpu_encoder_phys_vid_wait_for_commit_done:487]
[dpu error]vblank timeout
[   25.515024] [drm:dpu_kms_wait_for_commit_done:494] [dpu error]wait
for commit done returned -110
[   25.621146] [drm:dpu_encoder_frame_done_timeout:2342] [dpu
error]enc33 frame done timeout
Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.0-00848-LAHAINA-1


>
> I have two more questions,
>
> 1) are you see test pattern shows at external DP when you run modetest?

Yes, I see the pattern

> 2) is *.kcrash file created under /var/spool/crash/ when system crashed.
> If it is, can you share it?

There is no kcrash, as there is no kernel crash. The system reboots to
the download mode.

>
> Thanks,
>
> >
> >>>> I can not duplicate  system crash problem at my setup kodiak (SM7325)
> >>>> chrome book with my PM runtime patch series.
> >>>>
> >>>> my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)
> >>>>
> >>>> I did:
> >>>>
> >>>> 1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC
> >>>> cable directly to 1080p display
> >>>>
> >>>> 2)  stop ui
> >>>>
> >>>> 3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at
> >>>> display)
> >>>>
> >>>> 4) unplug apple dongle or DP typeC cable
> >>>>
> >>>> 5) hit enter key
> >>>>
> >>>> 6) start ui
> >>>>
> >>>> 7) display back to login page of chrome book
> >>>>
> >>>>
> >>>



-- 
With best wishes
Dmitry

