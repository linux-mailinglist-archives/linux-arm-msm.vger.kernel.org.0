Return-Path: <linux-arm-msm+bounces-6437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD8823F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 11:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4932A286EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 10:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F6320B05;
	Thu,  4 Jan 2024 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XncFqWVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9B820B0B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jan 2024 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704363449;
	bh=y183evW/XcRPkxzgHvYxGkQfcCMqxg7W3jmSwaXb6k8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XncFqWVrk9Z4outscR5Z5N6Zbs07bLZbxBrZdRZR80It570VNEaHow2xnCYzeeL4w
	 bCrIniCtyPt+Wqnn2pJoGaH7uoxO9/t42UKs+0vjJzX8sJt46qu7Z+1EX9KyJpeDk8
	 v2pxE2TuwN166dDlpDwUaKp+OwPXZ1uUhyucDNYKFRH1MT2De0dbug8Y0LD6vD9MR7
	 TGQWi1vSuBbgJSOsbeTSlZhKpa6At4PMVa8wMdSrV9IXCntFIRGO130MXJMXW1eFRI
	 roBDeeFhMhlx26NeyvDrZ3rV104cqdPMwElazih6NdgGazNgl+8GbesclYduUHxwtF
	 wjta9R5KWLoKg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AB4673780FC7;
	Thu,  4 Jan 2024 10:17:28 +0000 (UTC)
From: Laura Nao <laura.nao@collabora.com>
To: dianders@chromium.org
Cc: cros-qcom-dts-watchers@chromium.org,
	dmitry.baryshkov@linaro.org,
	kernel@collabora.com,
	konrad.dybcio@linaro.org,
	laura.nao@collabora.com,
	linux-arm-msm@vger.kernel.org,
	swboyd@chromium.org
Subject: Re: sc7180 kernel hang with linux-next
Date: Thu,  4 Jan 2024 11:17:35 +0100
Message-Id: <20240104101735.48694-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAD=FV=XE-FKi1UXAczaPah=aDjsiJnfKBuULdvoJp2ANEHuuiQ@mail.gmail.com>
References: <CAD=FV=XE-FKi1UXAczaPah=aDjsiJnfKBuULdvoJp2ANEHuuiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi - thanks for the feedback!

On 12/18/23 23:48, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 18, 2023 at 1:17 AM Laura Nao <laura.nao@collabora.com>
> wrote:
>>
>> Hello,
>>
>> KernelCI has reported a regression on some sc7180 based platforms
>> (lazor
>> and kingoftown Chromebooks) for linux-next: the kernel seems to hang
>> after initializing the SDHCI controller (~2 seconds in the boot),
>> nothing is reported on the console after unused clocks are disabled:
>>
>> [    2.241767] mmc1: Command Queue Engine enabled
>> [    2.257574] dwc3 a600000.usb: Adding to iommu group 9
>> [    2.261398] mmc1: new HS400 Enhanced strobe MMC card at address
>> 0001
>> [    2.270452] msm_dsi ae94000.dsi: supply refgen not found, using
>> dummy
>> regulator
>> [    2.274496] mmcblk1: mmc1:0001 DA4064 58.2 GiB
>> [    2.294482]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
>> [    2.301798] mmcblk1boot0: mmc1:0001 DA4064 4.00 MiB
>> [    2.307847] mmcblk1boot1: mmc1:0001 DA4064 4.00 MiB
>> [    2.313799] mmcblk1rpmb: mmc1:0001 DA4064 16.0 MiB, chardev
>> (507:0)
>> [   14.899579] clk: Disabling unused clocks
>>
>> This was observed on next-20231123 first and is still present on
>> next-20231218.
>>
>> Full kernel log from a couple examples:
>> - next-20231205:
>>    https://storage.kernelci.org/next/master/next-20231205/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-sc7180-trogdor-kingoftown.html
>> - next-20231215:
>>    https://storage.kernelci.org/next/master/next-20231215/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h265-sc7180-trogdor-lazor-limozeen.html
> 
> Is it really hanging? I haven't fully dug into all the logs, but it
> sure seems like the kernel is not hung, it just isn't doing anything.
> This looks like the state where the kernel is sitting waiting for the
> root filesystem to become available so that it can run the init
> process.
> 
>  From your command line I see "root=/dev/nfs". Yet nowhere in your
>  boot
> log do I see a USB network adapter register. I'm going to assume
> that's the problem.
> 
>

These tests all use an initrd, so I'd expect the kernel to spit out a
few more lines before waiting for the network to come up (log from a
good run as reference: https://pastebin.com/raw/rhPsLy1q ).

The USB network adapter is usually initialized a bit later in the boot
process indeed.
 
>> Sometimes the kernel is able to get past that point, but crashes a
>> bit
>> later - here's an example from a decoder conformance tests, the
>> kernel
>> boots fine but crashes shortly afterwards:
>> - next-20231214:
>>    https://storage.kernelci.org/next/master/next-20231214/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h265-sc7180-trogdor-kingoftown.html
> 
> This log has all kinds of badness. I see the "stuck clock" on the
> display that Stephen has been talking about for a while. I couldn't
> reproduce it for a while but I saw it the other day. This needs to be
> figured out. I then see an "oops" in qcom_stats_probe() that should be
> fixed by the revert that landed in Bjorn's tree over the weekend:
> 
> a7dc63435197 Revert "soc: qcom: stats: Add DDR sleep stats"
> 
> ...then I'm at least slightly shocked that the kernel continues on
> past an oops. You really don't panic on oops?
> 
> You then seem to load the r8152 USB Ethernet driver which lets you get
> the rootfs. Then you're hitting a totally different crash in venus
> (video decoder/encoder) that needs to be debugged.
> 
> 
>> Any idea on what might be causing this issue?
> 
> This seems like the perfect thing to bisect. Is it possible you could
> do that?

Thanks for the useful pointers!

Yes, I'll try to bisect this through KernelCI and report back.

Pasting new links to the logs mentioned above for future reference, as
they were removed from the KernelCI storage:

- next-20231215: https://pastebin.com/raw/C7RzgHn0
- next-20231214: https://pastebin.com/raw/VtpUS5D9

Best,

Laura

