Return-Path: <linux-arm-msm+bounces-14258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D480C87CFF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBF201C222AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70143C6B3;
	Fri, 15 Mar 2024 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SRjD6dOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AC3BB52
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710515739; cv=none; b=LR7BRWOf8RQfDqwKesybR/Auj8paTtDvq2iYu/X3ULkzGr7RdamgzXsbfiaadXB5ZLh8UVP0YPMoqh3+AyKgsAAZSiXxDjc0VqPRBHdP8m2ZLaABGLFkO295Y7t4sdY8XQGcYVMqskuRPDE3erP409taPUF0HlNLVQRDZX07070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710515739; c=relaxed/simple;
	bh=1p+2qEhn/qrjk/VPCWJTzuUwNlO3E+p95QBrqAO/oNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYhUU3ZVMddjnFnl/y/TPItim5gTAE+S71jMxNnJH0cWL/BAqGKubUeERUinp5brGFDyhWKt3mc1WWWqZ6EJKS6yulLefGuMH06h1EL6oqn+NWhuvlKPE86vjVNHdSHmwfk4QjQ21X+JqgbC+HgP6I9XZ8q2TvvP+jf0B0RskQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SRjD6dOp; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36683ec014dso6671565ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710515737; x=1711120537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSZdYN59DhOS8QyekeyWoGZ8e/VbiOIdQPzuTpNSPUk=;
        b=SRjD6dOp+7pQCt2DNTUef6Ui4n4waDnY/Av9/n9/YCcVBcUpzFhT7/I8+CPfs6BHKF
         tpKTPvunqNJb0K7Anq9PBKE5NdB33N7zWo74InphmBouACAcfO1MyVjQwv2e0Z1Zxg9p
         EPeVjRMORCohVmVEAyI6zYn3UUQryWzEfRmYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710515737; x=1711120537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSZdYN59DhOS8QyekeyWoGZ8e/VbiOIdQPzuTpNSPUk=;
        b=OhTtlBQpiauSkImMjTu2PmTPBD2mBsi3ofurLUVNwc3GsGlyuUUXZSNrIIu/kp/9VT
         Xl7EsNXvt8E/n2Nnfk+wD1dBSVahQv7x10hV0VNSJ2MFimTJsxCSKTv4l9bSxfenNc2j
         uYQztF6cemAOHIKDHBk7bT9e1AydXcA/7fSmoFYVs97GqsVxkk16bthGAnqau334bqXf
         K2O2qRyGjB9ezgiBhHWpiL/E8BTpD8H+4zi5vAe5p9JhkXn2fSQygnUAn1CEDo4JUr8V
         nXsfJqN4y8pV4c/iml9bS13jwFSZ78y/iLVBCQtfm/9cxvgbGs+kuNZfzHq50mQxDRhH
         I9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXsAgZpznmNhcFpR/MucILQaIQ+j8mKRn57UdRGllx9Fz0NYnDCDhCWh3lrA0qLM7HrShHq+mnLVFKxGVOmnHP8pDsbhS/iwz3BtohyNw==
X-Gm-Message-State: AOJu0YxQmM4kK69jvqG/nbVY20KHaO1p9rRZNDcSxyvdLC9G6Pgzrcs9
	TTS1wHbgg+OJwVke306ubR+bT9l2ah/nMRjBmkxK5PwBEgn+2/D5NVVZo4C3R8U4OSA0WSZYq5k
	=
X-Google-Smtp-Source: AGHT+IEEA5vhvGGrmXUmUNdWeO46lQFcAe9JOCbPDnWxsipR4xDfy9naQfnabWWlJC+6yn0RjBjwQA==
X-Received: by 2002:a92:cbd1:0:b0:366:4967:d932 with SMTP id s17-20020a92cbd1000000b003664967d932mr5145044ilq.7.1710515736976;
        Fri, 15 Mar 2024 08:15:36 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id f8-20020a92cb48000000b0036679fa037dsm317106ilq.39.2024.03.15.08.15.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 08:15:36 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-366a04fb186so52145ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 08:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk1GVXwrv1deqXGYtgop4ZTN/hj3uvb4o3LlGrooRb0VMvuJOJ2Yli+EFGP+ts8vMIbLKINSjHbcCpVFB0tMhyAwnR7ybUDP+ctLu0jg==
X-Received: by 2002:a05:622a:292:b0:430:b2ee:d6bf with SMTP id
 z18-20020a05622a029200b00430b2eed6bfmr193108qtw.25.1710515292052; Fri, 15 Mar
 2024 08:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230703085555.30285-1-quic_mkshah@quicinc.com>
 <20230703085555.30285-4-quic_mkshah@quicinc.com> <CAD=FV=XWH+Eoa9XjDns--NSDTZHeUwTdrX_r_QZhSPpbZNwz+w@mail.gmail.com>
 <f638e848-36c5-4cea-c2c8-841a003b1863@quicinc.com>
In-Reply-To: <f638e848-36c5-4cea-c2c8-841a003b1863@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Mar 2024 08:07:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgwrFWZ7uQ1fQbykyipFmyZB6nyJnKmS1s=hdAANd-gg@mail.gmail.com>
Message-ID: <CAD=FV=XgwrFWZ7uQ1fQbykyipFmyZB6nyJnKmS1s=hdAANd-gg@mail.gmail.com>
Subject: Re: [RESEND v4 3/3] arm64: dts: qcom: sc7280: Add power-domains for
 cpuidle states
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maulik Shah <quic_mkshah@quicinc.com>, andersson@kernel.org, ulf.hansson@linaro.org, 
	swboyd@chromium.org, wingers@google.com, daniel.lezcano@linaro.org, 
	rafael@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, sudeep.holla@arm.com, 
	jwerner@chromium.org, quic_lsrao@quicinc.com, quic_rjendra@quicinc.com, 
	devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 14, 2024 at 4:39=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> Hi Doug
>
> On 3/14/2024 4:20 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 3, 2023 at 1:56=E2=80=AFAM Maulik Shah <quic_mkshah@quicinc=
.com> wrote:
> >>
> >> Add power-domains for cpuidle states to use psci os-initiated idle sta=
tes.
> >>
> >> Cc: devicetree@vger.kernel.org
> >> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> >> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 98 +++++++++++++++++++++-----=
--
> >>   1 file changed, 73 insertions(+), 25 deletions(-)
> >
> > FWIW, I dug up an old sc7280-herobrine board to test some other change
> > and found it no longer booted. :( I bisected it and this is the change
> > that breaks it. Specifically, I can make mainline boot with:
> >
> > git revert --no-edit db5d137e81bc # arm64: dts: qcom: sc7280: Update
> > domain-idle-states for cluster sleep
> > git revert --no-edit 7925ca85e956 # arm64: dts: qcom: sc7280: Add
> > power-domains for cpuidle states
> >
>
> We noticed that some variants of sc7280 herobrine boards didnt boot but
> some did atleast till linux 6.8 rc-6. I have not tested linux 6.9 rc-1 ye=
t.

Wow, really? This doesn't seem like it would be related to the
variant. Maybe the firmware version? FWIW, the device I was having
problems with was a "villager-rev2" with FW 15368.0.0.

OK, so I just pulled out a `hoglin-rev5` with 15432.0.0 and v6.8-rc6
boots and WiFi comes up. However, when I move to full mainline
(b0546776ad3f (HEAD, linux/master) Merge tag 'printk-for-6.9' of
git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux) I get the
ath11k crash.

OK, so I updated my villager to 15432.0.0 and things work even without
reverting ${SUBJECT} patch. I guess that's the answer: this patch
broke things with some old firmwares but with the newer firmware it's
fixed. Hopefully that doesn't happen again since I don't think there
will ever be a newer firmware than 15432.0.0.


> > (I get an ath11k crash after that, but that's easy to hack out since I
> > don't need WiFi)
> >
>
> hmm, wifi worked alright on 6.8 rc-6 for us.

I guess I'll leave it to you to track down / report as needed.


> > I suppose the two options here are to either:
> >
> > 1. Track the problem down and figure out why the breaks boot and then
> > fix it. I'm personally not going to track this down, but if someone
> > wants me to test a patch I can do that.
> >
>
> Can Maulik help us do that?

OK, sounds like we don't need to, as long as everyone updates their
firmware. This should be OK.


> > 2. Delete all the herobrine dts files.
> >
> > So far we've been keeping the herobrine dts files alive because I
> > thought some graphics folks (Rob, Abhinav, Jessica, for instance) were
> > still using it. ...but Rob says he hasn't booted his in a while. No
> > idea if Abhinav and Jessica are using theirs. Any opinions? Is
> > herobrine hardware support near and dear to anyone these days?
> >
>
> Yes, so we have been using sc7280 herobrine devices even till the last
> cycle and quite a bit of feature development was actually done on that.
>
> It was the only device having eDP other than sc8280xp till x1e80100
> landed last cycle.

OK, thanks for confirming that they're still useful to you. When I got
the failures I feared that nobody was using them anymore.


> I do want to start using sc8280xp as well because from the experience we
> got, it has more visibility in terms of users. So that will address my
> eDP concern.
>
> But, the nice thing about chromebooks is we really like to use them for
> IGT development / CI debug as CrOS provides a nice environment to
> cros-deploy IGT.
>
> We can continue to use sc7180 for IGT development but if we want to
> debug issues with eDP + IGT, sc7280 is a really useful platform for that.
>
> sc8280xp or x1e80100 is not a CrOS supported device. So we will have to
> develop and test IGT directly on the device (which is a bit of a pain)
> unless someone has a better way of "cross-compilation" for IGT on
> non-CrOS images.

I'd have to let others comment on IGT.

-Doug

