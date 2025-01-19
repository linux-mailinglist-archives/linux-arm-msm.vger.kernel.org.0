Return-Path: <linux-arm-msm+bounces-45530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18CA16413
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 22:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59553A2B4F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 21:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D9F1DF96F;
	Sun, 19 Jan 2025 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="H+LE+ewQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305114658B
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737323610; cv=none; b=AVem7wt1wknfsK7hLhzGgVA2zYF11ZnwO1zAY6Qc8EcXs6G0aOe5h+ydmRiZgM3M538RpiSuLkH5/AGKN8bjRrTiNevCbCxvOChYHe8odDZN1kDjRPQ7zpkYXBcM/BdN6wZ3lF/ekCJvngBPCb61+CaC5Gr28bW314Mj8vYaKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737323610; c=relaxed/simple;
	bh=AX8K1jReoFWrI0yHFrI1SgJSWnSJF6CMKYxFPSqw/+U=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=Bz7+AMvcr6RtDj5k20vn+TTzqoqsY7AJMBOR/IlyzK+cudH6DnWrbXWXh4uZ7bX2hRxukiXPdJ17YXizAYuEv/DTx/fYVxCym/9jAs9DVwoTtMpNIkHKEpTnSB1p9N91NSR0Lu8WoSXCKoVrnep487ur0IQg3KGbZhegxyYJcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=H+LE+ewQ; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: cfd7d949-d6af-11ef-bc52-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id cfd7d949-d6af-11ef-bc52-005056992ed3;
	Sun, 19 Jan 2025 22:53:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=/IIyz0YS3Cse1DeJBPcdEXao4RqtlqxFlCw2jjdvxao=;
	b=H+LE+ewQUAlaaMM2wgbKsAbBcpOuoFmeunoB/cmyhGJRTsSSS3YCet0puTQhjC+BE/3wL3TbLdSWz
	 I8/h/w+5cZlF5myMvZ5uVNuaCM5d8GYr/BjxJEiTrQH6f7McF8mA09t6J4nvo8k6l3HzbG7WCX+oye
	 U7YqFYkmo3WBYA19bf9bAe3RSFPXXgJAFEWbZvjjV4cA1xghJ/Rug4kQPpvQvwBsReKwBvticBJBJl
	 SmRsUSPt88Ez+SVTCl6RprMq7xnMf5LLuFD/ytru47wj3l1N2LKkZpNJEw7Bpik9fKOtGvIKCCRAEC
	 4BEAg4NE2nRwUciOefxO2OBTBgg29EA==
X-KPN-MID: 33|PLUa6yKevZGuuON10RfGcZsyMasS+yJddn/oD2PrV+RNIWNc7cX5UwJdovcBiDK
 0haFKtVol9B9fCNrvjG3kcRk/BUQsev0ru/a92FVoszk=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|nILbYhy6bX0J58qqr6z9gRWZxNNpU5MsC0bQ/s8sFiY8jPuPFV+i0VFiHaFmvkc
 wYjVJHAT/rOTBdCpWZ42Wog==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id cfd5a934-d6af-11ef-8950-00505699d6e5;
	Sun, 19 Jan 2025 22:53:27 +0100 (CET)
Date: Sun, 19 Jan 2025 22:53:26 +0100
Message-Id: <87cygitqqx.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maud_spierings@hotmail.com
In-Reply-To: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com> (message
	from Maud Spierings on Sun, 19 Jan 2025 15:50:50 +0100)
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-vivobook-s15: Add usb a and
 sd-card reader
References: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

> From: Maud Spierings <maud_spierings@hotmail.com>
> Date: Sun, 19 Jan 2025 15:50:50 +0100
> 
> The Asus Vivobook s15 has 2 5gbps usb A ports on the right side which
> are controlled by the usb_mp controller enable them and the retimers
> required.
> 
> There is also a micro sd-card reader on the left side below the two
> usb-c ports, this one is attached to the usb_2 controller. Enable it and
> the retimer to enable the micro sd-card reader.
> 
> The micro sd-card reader seems to have so interesting behaviour, on my
> machine and someone elses it kind of half works, but not really, the
> same under windows, unusable. Either we both got unlucky with a hardware
> defect or there is something else going on, however two other people did
> succesfully test it, one of which on (free?)bsd instead of linux even.

OpenBSD ;).  And yes, the SD-card reader works just fine for me with
this series.

> One hypothesis is that this area is where the charging circuitry is,
> which gets *very* hot while charging and might damage this bit of
> hardware. However this is very much speculation and not based on
> anything concrete.
> 
> Symptoms of dysfunctional sd-card reader:
> The sd card will get detected, a usb device will appear as "Genesys Logic
> STORAGE DEVICE" 05e3:0747
> 
> log:
> [ 2456.648075] usb 1-1: new high-speed USB device number 3 using xhci-hcd
> [ 2456.792703] usb-storage 1-1:1.0: USB Mass Storage device detected
> [ 2456.795530] scsi host0: usb-storage 1-1:1.0
> [ 2457.840518] scsi 0:0:0:0: Direct-Access     Generic  MassStorageClass
> 2402 PQ: 0 ANSI: 6
> [ 2458.072281] sd 0:0:0:0: [sda] Media removed, stopped polling
> [ 2458.073001] sd 0:0:0:0: [sda] Attached SCSI removable disk
> 
> /dev/sda will appear, but it will not do anything, fdisk rejects it etc
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
> Maud Spierings (2):
>       arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
>       arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card reader
> 
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 142 ++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 1 deletion(-)
> ---
> base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
> change-id: 20250119-usb_a_micro_sd-4c476ea769b1
> 
> Best regards,
> -- 
> Maud Spierings <maud_spierings@hotmail.com>
> 
> 

