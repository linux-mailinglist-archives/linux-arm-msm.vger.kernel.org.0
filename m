Return-Path: <linux-arm-msm+bounces-111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B897B7E4A8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71162281329
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868672A1CD;
	Tue,  7 Nov 2023 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppQpqpxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1B2A1C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:23:56 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A07CD7A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:23:56 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-da41e70e334so5649199276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699392235; x=1699997035; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvTG10ABG0x3sP4grZoASxI3B60KESzfNKXhZ50ortI=;
        b=ppQpqpxLU/ScMTwdWIWqh37x7ql512apFKf7SNVefgiJ8rJvX9Eqbrnftroq1hn5xw
         OoRSeHEh4jOt4I+T6Jxn/PAYogTyQMKNncqY7Sw5QVPPkTdh4a/Rl9wxf/pupsrciN9n
         R2afkbBcom6jMu6R6r1/jfU4hUB+rHjaJEuXd6nJvBpk36PY3rODxNs4MlCjYgTJsO5/
         D3dbFa83U8p32hGdciCLemVdr6ZrecNtCooEkUgbb4OV9+kFde3R94Fdf89Kc2j8ImoJ
         ww2Gp7ZoSi56Cpk6jjY6XgZeCIdhCYV2RVKEk83mkeW02f1zbeFTFOLULp0ONCfkCDEQ
         6/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392235; x=1699997035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvTG10ABG0x3sP4grZoASxI3B60KESzfNKXhZ50ortI=;
        b=l9X12y9DdGWQh3QibkUc6hWoM6XtrZpSiy24+XEa6K+0nz7za7fbTRZkOPz78HEn1h
         ai7RLdA8EiiZxVUk8KZ/YJyR/CqabNn0cwUN9lc3r+wxMqjPk1ByqB8gz4a1J6E3YKrw
         2GIBnyIJrIxsDiQcg8O9/gGZ2Ze6kHoVQnKc0ChIuTu3xrq5aztK3hUJvKio9U3h7xT8
         7Aih+IEIrR5GWX5pbtWJS2DD2BLv4DmvThH6S1j4QhjmhBDsHdPxOIdd14Uq2k9VJOSr
         F4XCapxmSnkiGmGbN3Mw6YukUQhZFYfzG6UxQtIH5pRDB97r9y9zgZYlnt6cq3KgCGSQ
         654A==
X-Gm-Message-State: AOJu0YyG+69b03LgiSLaY5QYZ4u844MjLeekZ0uaZFlJa6hUWV0v47Ip
	ChHm1MPsCNGb/ygg+sHoyH4RpGdLKidEj+4mVCkkXQ==
X-Google-Smtp-Source: AGHT+IGTIU8jvCkV2BUmMTj6P61DCp2zrVll07uOzohXhnifKAxxWHa52coxZVe3Ciqk7nE0PKdFhk/25bhDX0311ks=
X-Received: by 2002:a25:202:0:b0:da3:b4a0:8807 with SMTP id
 2-20020a250202000000b00da3b4a08807mr19738231ybc.65.1699392235379; Tue, 07 Nov
 2023 13:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com> <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
In-Reply-To: <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 23:23:43 +0200
Message-ID: <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 23:01, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
> > On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> The purpose of this patch series is to incorporate pm runtime framework
> >> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> >> driver during system probe time. During incorporating procedure, original
> >> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> >> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> >> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> >> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> >> are bound at system probe time too.
> >
> > With this patchset in place I can crash the board using the following
> > sequence (SM8350-HDK):
> >
> > - plug the USBC DP dongle
> > - run modetest at any mode, don't press Enter yet
> > - unplug the dongle
> > - press Enter to stop modetest
> >
> > => the board resets to Sahara.
> >
> > Please ping me if you need any additional information from my side.
>
> questiosn,
>
> 1) which dongle are you used?

I have used several Dell and Hama USB-C dongles.

>
> 2) what code branch shoud I used to duplicate this problem.

I have pushed my kernel tree to
git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm
I had several UCSI patches on top, but they should not be relevant.

>
> I can not duplicate  system crash problem at my setup kodiak (SM7325)
> chrome book with my PM runtime patch series.
>
> my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)
>
> I did:
>
> 1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC
> cable directly to 1080p display
>
> 2)  stop ui
>
> 3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at
> display)
>
> 4) unplug apple dongle or DP typeC cable
>
> 5) hit enter key
>
> 6) start ui
>
> 7) display back to login page of chrome book
>
>


-- 
With best wishes
Dmitry

