Return-Path: <linux-arm-msm+bounces-14599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BBB880485
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 19:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD171C21E3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 18:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150072BAF0;
	Tue, 19 Mar 2024 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xfk9pT+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F69282E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710872167; cv=none; b=SfvhYN3urWhelSgfUSHXPsGOAVmfXOjJV4Rk3aebyOjbiHWpahYcSJpqsS5H0Rk5DNEMpLY8XzAVtH0O6eLlMrve5DayslRwdJJ6cm8qX2cw7AbCYVEI+0AfMpLkRTQ/CEcGPS0f1KpMbUOj12BXkEG+edcmABidJNmwUIVLfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710872167; c=relaxed/simple;
	bh=3rkOtNqRZGNeJ0BmlK/wCNlX+LHzHZmWg6oBPJO2b7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkSduGl2zMXMWgIUjzswXh8GOUrg9PH6x8kgM9Upm0Lk1v4VZRG92XU/Esv50c+01FX/Cl9dM3eN+7dHF1JbWjVsQuVHL+klcSyJE4yiPp/QrbWnTJvnmrTCc3ZNOvAS3602kM8ehGdR1VinbyhcOFnbZLKhVH2PiMeVtqixmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xfk9pT+l; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-690e2d194f6so40313746d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710872163; x=1711476963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY3JC7lCg0J0NbLsthogiU7IlW38IYTYvI5MHCluIsY=;
        b=Xfk9pT+lbC6sSIIcTKhTGdAFiMJHi85OVBxvBA2OEh1w1+YVNxCd+1YBNgH63Ho1em
         hAjbpYu/Kgv8JCNriwPi3c+X8lXS6qNwj6o5OhyiT0ihPyVa4lazNECcJPTc/NxHQGqr
         Ohp5sw33xZQmRYS29szxXBE0R5NzUAAU2ukYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710872163; x=1711476963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY3JC7lCg0J0NbLsthogiU7IlW38IYTYvI5MHCluIsY=;
        b=nulorpWmAsx3MTvTutjBpk6KyPS3REWKPVNp3QtBY1xFnbMuJiB9ATy5cYCkXT0TLK
         1lAS7nlHw5qU0flUPI41g3bgKAAAn9hkqE8rGgGPaZkY136Nz5evziaSqNtUWsKzJusO
         4wFtAiWYhS56vPRsqgcYv9JJlWrzyWANUcrjUDYuuM3WLLpuQ86JMq611aVL/4BHW/sO
         KK4pLvashjZeACaPbnLCFvM1nLcBM0RuTKFcQQzr9+gi6kYCErcU7QdvJ9X/F70PFF5Z
         su3Q1E35x8k2uR/9WK+Pk4udE+3yiNR38KQFhIUKWjRQky3xRfRy3oVOfZr847Ow80ZM
         r8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtJ0Xui43rOyeEm8JiNL4PREDdHM33UncyINvdXlOw+T0AB2kPJYQqf0q7CLl6xUcvx310YKBKSo1lnczUatHk4Lf0bLxLJ5rX5L6/0w==
X-Gm-Message-State: AOJu0Ywa/HIz5qVl51a0/1lpOD5zPQXeq7ZPJ88mDJx0wgBgLn0M8oZv
	H2BxZ3yGgY8s9Qm/OrtdLnq40R3xlyziUThUZ3k8rrh2pZu3oUKT0DGuIVbTOvT4woy7Ogdt6zQ
	=
X-Google-Smtp-Source: AGHT+IG2AWZAzrfiFVd59h5c+kq5iOo2ZXCfO1mUhCRNHfs/f7WQKWRKPdDgyOjDN2C504sQQ66iUg==
X-Received: by 2002:ad4:4208:0:b0:691:59ad:ff43 with SMTP id k8-20020ad44208000000b0069159adff43mr3401357qvp.12.1710872163057;
        Tue, 19 Mar 2024 11:16:03 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id pp26-20020a056214139a00b00691732938a8sm5816379qvb.73.2024.03.19.11.16.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 11:16:02 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-428405a0205so42581cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 11:16:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFuCh7s9yCOQ6Uqd8B3skrIDeCsND/G7/DNBojSSV+AF3qZKJ8cuhMaPtmbWFvSlrK7lgbLMJZ7jsqnLPq6PtDZ89gFx7J++NPxaTxNg==
X-Received: by 2002:ac8:7f0d:0:b0:430:ed72:bc0d with SMTP id
 f13-20020ac87f0d000000b00430ed72bc0dmr39379qtk.26.1710872161807; Tue, 19 Mar
 2024 11:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com> <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
 <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com> <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
In-Reply-To: <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 11:15:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Message-ID: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 10:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 19 Mar 2024 at 19:13, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> >
> >
> > On 3/18/2024 5:55 PM, Dmitry Baryshkov wrote:
> > > On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.co=
m> wrote:
> > >>
> > >> +bjorn, johan as fyi for sc8280xp
> > >>
> > >> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> > >>> Before the introduction of the wait_hpd_asserted() callback in comm=
it
> > >>> 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> > >>> drm_dp_aux") the API between panel drivers and DP AUX bus drivers w=
as
> > >>> that it was up to the AUX bus driver to wait for HPD in the transfe=
r()
> > >>> function.
> > >>>
> > >>> Now wait_hpd_asserted() has been added. The two panel drivers that =
are
> > >>> DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: T=
ake
> > >>> advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> > >>> 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> > >>> wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> > >>> wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> > >>> ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There=
 is
> > >>> no longer any reason for long wait in the AUX transfer() function.
> > >>> Remove it.
> > >>>
> > >>> NOTE: the wait_hpd_asserted() is listed as "optional". That means i=
t's
> > >>> optional for the DP AUX bus to implement. In the case of the MSM DP
> > >>> driver we implement it so we can assume it will be called.
> > >>>
> > >>
> > >> How do we enforce that for any new edp panels to be used with MSM, t=
he
> > >> panels should atleast invoke wait_hpd_asserted()?
> > >>
> > >> I agree that since MSM implements it, even though its listed as
> > >> optional, we can drop this additional wait. So nothing wrong with th=
is
> > >> patch for current users including sc8280xp, sc7280 and sc7180.
> > >>
> > >> But, does there need to be some documentation that the edp panels no=
t
> > >> using the panel-edp framework should still invoke wait_hpd_asserted(=
)?
> > >>
> > >> Since its marked as optional, what happens if the edp panel driver,
> > >> skips calling wait_hpd_asserted()?
> > >
> > > It is optional for the DP AUX implementations, not for the panel to b=
e called.
> > >
> >
> > Yes, I understood that part, but is there anything from the panel side
> > which mandates calling wait_hpd_asserted()?
> >
> > Is this documented somewhere for all edp panels to do:
> >
> > if (aux->wait_hpd_asserted)
> >         aux->wait_hpd_asserted(aux, wait_us);
>
> That's obviously not true, e.g. if panel-edp.c handled HPD signal via
> the GPIO pin.
>
> But the documentation explicitly says that the host will be powered up
> automatically, but the caller must ensure that the panel is powered
> on. `It's up to the caller of this code to make sure that the panel is
> powered on if getting an error back is not OK.'

It wouldn't hurt to send out a documentation patch that makes this
more explicit. OK, I sent:

https://lore.kernel.org/r/20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d=
94f5b6b41@changeid

-Doug

