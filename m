Return-Path: <linux-arm-msm+bounces-7385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A482F2D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 18:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0908F1C2375E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 17:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA75A1CA89;
	Tue, 16 Jan 2024 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="MyvjPZ/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD141CAAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705424782; cv=none; b=Az9feNrpEcmd3PGbXbsw2EXD0x2sN7PMzY1/MdRMIeB0lKuOUwgTo4vyUkX4yJUt5I4KYUMCNlCVhXN/vDnwebBgnqb1QQdppoWbYd/G4TTwECUrTCTWAh4RJc7jJjM9ruTfQ1vROuuEqSDZHLTlvt2V5rIu1FqgzNRN8+rsY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705424782; c=relaxed/simple;
	bh=XI/97lEXxQjnyFeWWFvmUnGKCIYeJT6Fts70j+TRXMg=;
	h=Received:DKIM-Signature:User-agent:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type; b=SyAZ68qSIHiMrzVSJ5rRNpkvJEUzGC12nljIJLPETZiy6vMLHVsdFPhRXrkAhGIs2Der2ZRMkvMK7D50MCoMo/AQt5N4FYF5W/7a9MGYPB0kAQOcRQ/PZsMcSebpy+fKxvR9xtfFEyj2zOtUPNWVfPmtpqudv8XIstGmI9v/Uxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=MyvjPZ/k
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 5DAF244023D;
	Tue, 16 Jan 2024 19:06:06 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1705424766;
	bh=XI/97lEXxQjnyFeWWFvmUnGKCIYeJT6Fts70j+TRXMg=;
	h=From:To:Cc:Subject:Date:From;
	b=MyvjPZ/kum+OZM/P+JmvPng7vYaZBQUXwvvO6ozaZNtJIe+XQZBhSMaZPE6oOm87o
	 /85LQryXh1cbrilhDTHuNjSO6hc3tal/5TV5it+dsKnghCVly0g3pgyeJdm+ic+Xzl
	 2wGRRl+sqWmZbqJmQg20pMRad6IX8k7/xUhPzzsfJJVZ1A/cELkyY/mcgh6eDeT7sy
	 1qMijMV9fH1GRralDU3hF3gmC7yFMf29B+KFNEAJemBJBKq1HKZ9zwdN5tdwwuxAEJ
	 iLIZeTHgmQ5ApUVcc2Ekeqo1e1cFH/C/NkVmyWQmfj34EP11gvPrP4rAGIdNCFzg1y
	 oUfuoRwFy6Wng==
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Carl Vanderlip
 <quic_carlv@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Ramon
 Fried <ramon@neureality.ai>, Orr Mazor <orrm@neureality.ai>
Subject: QAIC reset failure
Date: Tue, 16 Jan 2024 18:58:30 +0200
Message-ID: <87ttndw6m6.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi qaic driver maintainers,

I am testing an A100 device on arm64 platform. Kernel version is current
Linus master as of commit 052d534373b7. The driver is unable to reset
the device properly.

[  137.706765] pci 0000:01:00.0: enabling device (0000 -> 0002)
[  137.712528] pci 0000:02:00.0: enabling device (0000 -> 0002)
[  137.718230] qaic 0000:03:00.0: enabling device (0000 -> 0002)
[  137.725720] [drm] Initialized qaic 0.0.0 20190618 for 0000:03:00.0 on minor 0
[  137.734326] mhi mhi0: Requested to power ON
[  137.738520] mhi mhi0: Power on setup success
[  137.855108] mhi mhi0: Wait for device to enter SBL or Mission mode
[  137.861578] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
[  137.870733] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
[  137.879063] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
[  137.887334] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
[  137.894866] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
[  137.904006] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
[  137.912263] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
[  137.920517] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
[  140.807091] mhi mhi0: Device failed to enter MHI Ready
[  143.695094] mhi mhi0: Device failed to enter MHI Ready

This is with firmware from SDK version 1.12.2.0. I tried also version
1.10.0.193 with similar results.

Some more state information from MHI debugfs below.

/sys/kernel/debug/mhi/mhi0/regdump:
Host PM state: SYS ERROR Process Device state: RESET EE: DISABLE
Device EE: PRIMARY BOOTLOADER state: SYS ERROR
MHI_REGLEN: 0x100
MHI_VER: 0x1000000
MHI_CFG: 0x8000000
MHI_CTRL: 0x0
MHI_STATUS: 0xff04
MHI_WAKE_DB: 0x1
BHI_EXECENV: 0x0
BHI_STATUS: 0xa93f0935
BHI_ERRCODE: 0x0
BHI_ERRDBG1: 0xc0300000
BHI_ERRDBG2: 0xb
BHI_ERRDBG3: 0xcabb0

/sys/kernel/debug/mhi/mhi0/states:
PM state: SYS ERROR Process Device: Inactive MHI state: RESET EE: DISABLE wake: true
M0: 2 M2: 0 M3: 0 device wake: 0 pending packets: 0

Any idea?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

