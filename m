Return-Path: <linux-arm-msm+bounces-3335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347C5803ACA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CF51B20BB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC4628DB5;
	Mon,  4 Dec 2023 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EpWhAeo4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF36E6
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 08:49:12 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5cfc3a48ab2so48818307b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701708551; x=1702313351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNOR5hPbxSi6oOJtDcDO/9t8S2G/RM9x8pzeEdejC9g=;
        b=EpWhAeo4UI9P2IP1aN/8YnOTsH/vx52X+4Rupu8NqBA6A7hn5f8lqJsbUgPyiDqBvU
         dJGOvWaeH6B5gih7j5QtOs2q/suoXEZfywrogG7ehYoFih3vyaY5HiA9B24LDxplaoG0
         p+n9AWDjT8ah4+cLW1zJ7Ru9Jo4mnCvPEszvCvbzPauWVm+AlyKgJJI7tnqfE/TQHd2R
         Q9k3oNl8MrmdmsfCpq9uckvqzWOgnxiVgF6fYFlYaNEK2k42dkNmHL/5XPQvgOYmJ+61
         Z+KzZJ9rvaqH549ptrZ+H1HuzLDCMKQd11HGaLfk1Iuwpg1M/PPijDNidTvWDzNGRKOJ
         JZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708551; x=1702313351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNOR5hPbxSi6oOJtDcDO/9t8S2G/RM9x8pzeEdejC9g=;
        b=X4iAoc/vq1C4Xyn3i/cgnxhj0dfnwrAqBB0OJ4dBDaCo1aHgDbRfN/et+eiesObMfX
         KJOMTLbotp6hVHien+z1NwNj1ENILRi7TJpRLwd4Bj0L/IyppEVV/35Lt9rqIVKOXeLM
         xG1GB+KBBemysZoWJzqdpTflboxJfusVcxf8WykS79Fim13GlA3/XtMhWflZfydghWtv
         y4CDr6CLDcuGq9Z2EEKyHY8p0U7vcrwewkZzO1VU2xE3JhZUpP9dYbEtplchN27XOZ7r
         qtS0tEaLrNEbYcdC3xh/hn+RC042V4JRs6rWgCQDQnAcvBhnqLUFwqDCwn3klmAIqCZf
         /z3Q==
X-Gm-Message-State: AOJu0YxvXE+bO/Y6GY62YRITGTs4eBhXNL/SMdUrZMEbTOyyDGDJG9mO
	nuKQGTiCp0g7zizOuZDGSjPIbbKQ3PTVkmzjWojOhA==
X-Google-Smtp-Source: AGHT+IFHh6JHzSU9qHaDuUKxHyO45txUlNPSX7zn38qqp5CrYHqcA3g2fJfazOckxp3XQ/bZY+vFQOjhCpU8XvUebG4=
X-Received: by 2002:a81:9a4f:0:b0:5d7:1941:aac with SMTP id
 r76-20020a819a4f000000b005d719410aacmr3444165ywg.71.1701708551653; Mon, 04
 Dec 2023 08:49:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
 <87leaaqg7a.fsf@kernel.org> <CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
 <878r6aq71z.fsf@kernel.org>
In-Reply-To: <878r6aq71z.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 18:49:00 +0200
Message-ID: <CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 18:14, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Hi Dmitry,
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > I wanted to ask your opinion regarding one of the issues we stumbled
> >> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
> >> > snoc (WCN3990) WiFi "card". We noticed the following messages being
> >> > spawned on the console, which I traced it to the
> >> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
> >> >
> >> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
> >> >
> >> > As a reminder, on this platform the wlan firmware and firmware-N.bin
> >> > files come separately.
> >> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
> >> > tqftpserv request (which is served from the board-specific folder
> >> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
> >> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
> >> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
> >> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
> >> >
> >> > I'm looking for suggestions on how to make ath10k driver load
> >> > firmware-N.bin file which corresponds to the board-specific
> >> > wlanmdsp.mbn.
> >>
> >> We have had similar discussions in the past but it didn't go very far.
> >> It would be so nice if you could finally fix this :) At one point we
> >> even had a discussion that we might need something similar for ath11k
> >> but it didn't go anywhere.
> >>
> >> > In particular I'd like to hear your opinion on the following proposal:
> >> >
> >> > Add the  optional property to the board DT, that specifies:
> >> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
> >> > will be used as an override for the firmware directory. So, while the
> >> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
> >> > look for the firmware-N files in the specified directory.
> >>
> >> Back in the day I was thinking something like below, please let me know
> >> what you think.
> >>
> >> So the normal firmware path for WCN3990 is:
> >>
> >> ath10k/WCN3990/hw1.0/
> >>
> >> My idea was that if we could extend it for different "platforms" (not
> >> sure what's the proper term for this) by having platform specific
> >> directories:
> >>
> >> ath10k/WCN3990/hw1.0-platform/
> >>
> >> (Replace "platform" with a unique name for the platform, for example
> >> "acme-kv7" for a product from Acme with model name kv7.)
> >>
> >> Then DT could inform ath10k about this "platform" string and ath10k
> >> would then download boath firmware-N.bin and board-2.bin from the
> >> platform specific directory.
> >>
> >> And even cleaner if we could have the *.mbn firmware files in the same
> >> directory, even if ath10k doesn't access them directly.
> >
> > We can, and a symlink from qcom/SoC/.../dir to that subdir.
> >
> > So, for example, for Pixel-3, using your schema we will have:
> >
> > ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> > ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
> > ath10k/WCN3990/hw1.0-blueline/board-2.bin
> >
> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> > ../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> >
> > This sounds mostly fine to me. My only suggestions is to change it as following:
> >
> > ath10k/WCN3990/hw1.0/board-2.bin
> >
> > ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
> > ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
> > ath10k/WCN3990/hw1.0/blueline/board-2.bin
> >
> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> > ../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
>
> Is there a specific reason why you propose adding a new subdirectory?
> Personally I find it confusing that hw1.0 directory contains the
> firmware files and then there's a subdirectory which also contains
> similar firmware files.

My main idea was to allow fallback at least for board-2.bin. I don't
think we should have 10 instances of the file (or load it from the
platform-specific location).

-- 
With best wishes
Dmitry

