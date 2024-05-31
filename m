Return-Path: <linux-arm-msm+bounces-21298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A28D6447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42FE286FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F8E17C6D;
	Fri, 31 May 2024 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bwTlxMu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E53D848D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165098; cv=none; b=p5vkxYUI3UIVzQnzMI6r8BlKtr9gQ7h2td8IUWhu86K1BE4cCASwXx9pqvdMiCAROQUbdcm8ntVyxo03inJ+fTm8Ljw9Oa6AlTDkJFKs02HXqZ7t11zZc7EsBgvCB4iKGUsESWld7bkywpinxFEF3JKkeqOzA186EalqFimhI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165098; c=relaxed/simple;
	bh=1AbmZJJmSN77rtAE02BmHA4N/qXy1QsUr6jrIfOx+yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZPPPn78mcHr8bQ59MzHu6/2LWazbKq8EdBU/7FtofeNJWH3Cru8+lLSLF13odfdq0SXoWGotQQvcONdSqG8NycU3xZqXUE/SflbiIEian0GN/GtjuC8JOCq4gCRXIJoMqKU/s7UOahNs1+ht9lK6kMKbYx68It+x3BU8pcRaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bwTlxMu/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so3661138a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717165092; x=1717769892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrOr8lCmG5hi8Hyg8YEcbjrnGL2py1NkA3gWzmJrOa0=;
        b=bwTlxMu/tRaCQqlJh/M4vzyT31egrazq+ykv76cWkGn6lOayf+ZWIxxQv6k7Do/VKn
         tda9edTlyTgnYgpu92yjPbxPcJsgsXswVGC4orVkyp+y/T2TyxVP1akJdJLaBvep4AOT
         0H/qtai6pKL3GlSHeujIuLo+Ta6aS8iyKUcmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165092; x=1717769892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrOr8lCmG5hi8Hyg8YEcbjrnGL2py1NkA3gWzmJrOa0=;
        b=qZcmmrBaH44BXEj14czE9fE8qgP32xXoraUtwNqEx6qpgUnCaU8bEx1+xb5DW6NxKZ
         Fy03Yn3UqwGGs4TO6rCpO8sXD5ZVuBKhi8CcN/SoytHeFY5w6BvefcZyb0Sf5vmB3rYn
         B9pZAC2whGGuNqx2Q+sUFXtNCDIeiM7pmxzUxwUIb7rBiTo2balKjRkRCm+3h05FnQ2k
         G+3zV2/0O2slgHcg6eICUfzijYXvXER/cS2d0jMM3x5te5kb5uieWvaYHgHJbXVE8dCR
         3eBwAnSI0XmH8sZNbosS4c6QTpN9z9du+XpHh3txhl1bgr6WmF6vrhdqI960e2KDHTPk
         tktQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7binAhKtBj2n/i82GGMvgOnezgRInKj7Y+dy8/p4/llL8fQf0FZPmN3YfClGwf84Qd0zcYFfWSp5zdBTb/gOErF2ZvN1OEXGvaGK4pA==
X-Gm-Message-State: AOJu0YyRAsWReaKxCovYZCWh9qir7k+AIBE2Gfif2muK7J3lKMlvSHU/
	TFSnMoelwMuo0e5AlVJ32ajAG/5Wc3f0epn+GFpIW0hoTWyw+8WMxs4hRUIkOAOsKSszTi7Z4l1
	ssVfX
X-Google-Smtp-Source: AGHT+IGF6DWdkVqcd0jTK184MMvLiJjBWrE7LQM5of9v02p7gxbmtwMFLFp1az7ZQL83Ax7oYX+nOg==
X-Received: by 2002:a50:d541:0:b0:578:69be:6e7a with SMTP id 4fb4d7f45d1cf-57a3635ef9fmr1944219a12.1.1717165092401;
        Fri, 31 May 2024 07:18:12 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b99c42sm1048730a12.17.2024.05.31.07.18.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:18:10 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420107286ecso82765e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 07:18:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqnhvakJEwPke5FUYix4HZHwlt6SfD4AyYq05BCmtkK3lcjjRu1u6rispD6ECUdzASIlXxmbqyv6LBLz1dTxkQCksIygTGnRG0/rnwBA==
X-Received: by 2002:a05:600c:ac5:b0:41b:e55c:8dca with SMTP id
 5b1f17b1804b1-4212e0d6c60mr1426815e9.7.1717165090095; Fri, 31 May 2024
 07:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com> <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org>
In-Reply-To: <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 May 2024 07:17:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
Message-ID: <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 31, 2024 at 5:33=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 30.05.2024 3:34 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, May 30, 2024 at 1:26=E2=80=AFAM Krishna Kurapati
> > <quic_kriskura@quicinc.com> wrote:
> >>
> >> When working in host mode, in certain conditions, when the USB
> >> host controller is stressed, there is a HC died warning that comes up.
> >> Fix this up by disabling SS instances in park mode for SC7280 and SC71=
80.
> >>
> >> Krishna Kurapati (2):
> >>   arm64: dts: qcom: sc7180: Disable SS instances in park mode
> >>   arm64: dts: qcom: sc7280: Disable SS instances in park mode
> >>
> >>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
> >>  2 files changed, 2 insertions(+)
> >
> > FWIW, the test case I used to reproduce this:
> >
> > 1. Plug in a USB dock w/ Ethernet
> > 2. Plug a USB 3 SD card reader into the dock.
> > 3. Use lsusb -t to confirm both Ethernet and card reader are on USB3.
> > 4. From a shell, run for i in $(seq 5); do dd if=3D/dev/sdb of=3D/dev/n=
ull
> > bs=3D4M; done to read from the card reader.
> > 5. At the same time, stress the Internet. If you've got a very fast
> > Internet connection then running Google's "Internet speed test" did
> > it, but I could also reproduce by just running this from a PC
> > connected to the same network as my DUT: ssh ${DUT} "dd of=3D/dev/null"
> > < /dev/zero
> >
> > I would also note that, though I personally reproduced this on sc7180
> > and sc7280 boards and thus Krishna posted the patch for those boards,
> > there's no reason to believe that this problem doesn't affect all of
> > Qualcomm's SoCs. It would be nice if someone at Qualcomm could post a
> > followup patch fixing this everywhere.
>
> Right, this sounds like a more widespread issue
>
> That said, I couldn't reproduce it on SC8280XP / X13s (which does NOT mea=
n
> 8280 isn't affected). My setup was:
>
> - USB3 5GB/s hub plugged into one of the side USBs
>   - on-hub 1 Gb /s network hub connected straight to my router with a
>     600 / 60 Mbps link, spamming speedtest-cli and dd-over-ssh
>   - M.2 SSD connected over a USB adapter, nearing 280 MB/s speeds (the
>     adapter isn't particularly speedy)
>
> So it stands to reason that it might not have been enough to trigger it.

In my case I wasn't using anything nearly as fast as a M.2 SSD. I was
just using a normal USB3 SD card reader. That being said, multiple
people at Qualcomm were able to replicate the issue without lots of
back and forth, so I'd guess that the problem isn't that sensitive to
the exact storage device. I will also note that it's not sensitive to
the exact network device as I replicated it with two Ethernet adapters
with very different chipsets.

My only guess is that somehow SC8280XP is faster and that changes the
timing of how it handles interrupts. I guess you could try capping
your cpufreq in sysfs and see if that makes a difference in
reproducing. ;-) ...or maybe somehow SC8280XP has a newer version of
the IP where they've fixed this?

It would be interesting if someone with a SDM845 dragonboard could try
replicating since that seems highly likely to reproduce, at least.

-Doug

