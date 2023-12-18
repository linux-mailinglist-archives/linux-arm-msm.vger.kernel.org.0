Return-Path: <linux-arm-msm+bounces-5300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE0817D66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 23:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F9E285720
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 22:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0690E49893;
	Mon, 18 Dec 2023 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dga4+qnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2274E3E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 22:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d12b56a38so28602855e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 14:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702939695; x=1703544495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iv6NYV5GSJ9qaD7OlPZj8019oW+677mrNLYVja/dHPE=;
        b=dga4+qnN0Wxo9vq2102wZN8IDSFTH8ra92WalamPKemCfjIiORu+zv8Em1kL+gY4br
         uoI9UnBeaF9CaR/LvQmXMgFlKCwVixLiwOjeyxMgMMRlRPJPGhXjoMcq5/NWyZLuV//y
         dVHESO4kTdIveWvmHN6Ln+CVqt3kNcnXb5eIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702939695; x=1703544495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iv6NYV5GSJ9qaD7OlPZj8019oW+677mrNLYVja/dHPE=;
        b=QbV4wL2pGMq9tg9KhxdKfkVobc5AuACqhc407I9BA6j38/pCClKG+mMvFaUuR47NoT
         aW0TMkDmlNzbhhauQkTsi80xShhdzOWV04KxqY7QUGWZJ8RS9ERJ2yZ9ZJ/lw6ZHRhOe
         KA0K8gztehib9SeJXjZoqaZLo5AE+3LTDCeAAlOFOH+3PnN7Ft7Ddw1fZZMDkwyNQqLO
         4QY6YUMou0PWNkTXM7P+E8QVSJOC2uK1SMVZEn4WiBbRm8tnbxzDMMlpqLK/g6vy9MQC
         vJgHDtQ3BQzxfgGajwiEte1MG0dglUo9CuGhHywQgO44/Gs+5+H43sua8SkJg1KJZYz/
         gdLw==
X-Gm-Message-State: AOJu0YzRO/p7SX43Y7B9AkrRno8k4Ah6X4Kc0utuAddXRF5STY/lQoa5
	pqDcQHcxyTJ1SEzuR8b8p9rftZ0lH9PZRqFb0/RUErGW
X-Google-Smtp-Source: AGHT+IH/2convURKiYWOndtHp68R//hOTW22TKkekdROINpNzaKOVGiBgWgZGiXdUgtCkDTPacwQ2A==
X-Received: by 2002:a05:600c:548e:b0:40c:69dc:18bb with SMTP id iv14-20020a05600c548e00b0040c69dc18bbmr1538516wmb.142.1702939695127;
        Mon, 18 Dec 2023 14:48:15 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id sf22-20020a1709078a9600b00a1ca020cdfasm14591228ejc.161.2023.12.18.14.48.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 14:48:14 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c3963f9fcso7415e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 14:48:14 -0800 (PST)
X-Received: by 2002:a05:600c:6a99:b0:40d:251a:d6f7 with SMTP id
 jl25-20020a05600c6a9900b0040d251ad6f7mr3668wmb.0.1702939693953; Mon, 18 Dec
 2023 14:48:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218091806.7155-1-laura.nao@collabora.com>
In-Reply-To: <20231218091806.7155-1-laura.nao@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 14:48:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XE-FKi1UXAczaPah=aDjsiJnfKBuULdvoJp2ANEHuuiQ@mail.gmail.com>
Message-ID: <CAD=FV=XE-FKi1UXAczaPah=aDjsiJnfKBuULdvoJp2ANEHuuiQ@mail.gmail.com>
Subject: Re: sc7180 kernel hang with linux-next
To: Laura Nao <laura.nao@collabora.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	kernel@collabora.com, cros-qcom-dts-watchers@chromium.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 18, 2023 at 1:17=E2=80=AFAM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Hello,
>
> KernelCI has reported a regression on some sc7180 based platforms (lazor
> and kingoftown Chromebooks) for linux-next: the kernel seems to hang
> after initializing the SDHCI controller (~2 seconds in the boot),
> nothing is reported on the console after unused clocks are disabled:
>
> [    2.241767] mmc1: Command Queue Engine enabled
> [    2.257574] dwc3 a600000.usb: Adding to iommu group 9
> [    2.261398] mmc1: new HS400 Enhanced strobe MMC card at address 0001
> [    2.270452] msm_dsi ae94000.dsi: supply refgen not found, using dummy
> regulator
> [    2.274496] mmcblk1: mmc1:0001 DA4064 58.2 GiB
> [    2.294482]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
> [    2.301798] mmcblk1boot0: mmc1:0001 DA4064 4.00 MiB
> [    2.307847] mmcblk1boot1: mmc1:0001 DA4064 4.00 MiB
> [    2.313799] mmcblk1rpmb: mmc1:0001 DA4064 16.0 MiB, chardev (507:0)
> [   14.899579] clk: Disabling unused clocks
>
> This was observed on next-20231123 first and is still present on
> next-20231218.
>
> Full kernel log from a couple examples:
> - next-20231205:
>   https://storage.kernelci.org/next/master/next-20231205/arm64/defconfig+=
arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-sc7180-trogdor-=
kingoftown.html
> - next-20231215:
>   https://storage.kernelci.org/next/master/next-20231215/arm64/defconfig+=
arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h26=
5-sc7180-trogdor-lazor-limozeen.html

Is it really hanging? I haven't fully dug into all the logs, but it
sure seems like the kernel is not hung, it just isn't doing anything.
This looks like the state where the kernel is sitting waiting for the
root filesystem to become available so that it can run the init
process.

From your command line I see "root=3D/dev/nfs". Yet nowhere in your boot
log do I see a USB network adapter register. I'm going to assume
that's the problem.


> Sometimes the kernel is able to get past that point, but crashes a bit
> later - here's an example from a decoder conformance tests, the kernel
> boots fine but crashes shortly afterwards:
> - next-20231214:
>   https://storage.kernelci.org/next/master/next-20231214/arm64/defconfig+=
arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h26=
5-sc7180-trogdor-kingoftown.html

This log has all kinds of badness. I see the "stuck clock" on the
display that Stephen has been talking about for a while. I couldn't
reproduce it for a while but I saw it the other day. This needs to be
figured out. I then see an "oops" in qcom_stats_probe() that should be
fixed by the revert that landed in Bjorn's tree over the weekend:

a7dc63435197 Revert "soc: qcom: stats: Add DDR sleep stats"

...then I'm at least slightly shocked that the kernel continues on
past an oops. You really don't panic on oops?

You then seem to load the r8152 USB Ethernet driver which lets you get
the rootfs. Then you're hitting a totally different crash in venus
(video decoder/encoder) that needs to be debugged.


> Any idea on what might be causing this issue?

This seems like the perfect thing to bisect. Is it possible you could do th=
at?

-Doug

