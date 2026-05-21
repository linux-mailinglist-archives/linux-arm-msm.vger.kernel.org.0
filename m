Return-Path: <linux-arm-msm+bounces-109121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIVMJu8yD2qSHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:29:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C85A94A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23869314C90A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3451E361667;
	Thu, 21 May 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIfROiPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91529BDBF;
	Thu, 21 May 2026 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377410; cv=none; b=qMr3cTVvv9A5gzAlhBOpxyaj83K+XWNeVpC9ZGyQDv9BHUbT5Irj/GCeNnT97b9C3p0Eh35F0VuMeKdAryrJde/SFhbT++Aj0c8l84QzEFD6pZ2St92Q5FKgoRKa22QnVAVvrCcxTxNhZQI1MmO4pzzLxn00q7fQGcpQsIwD9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377410; c=relaxed/simple;
	bh=+TEJm4dW9tk/Wlz65VLUbdAkwntXRTY2XitPNjSQ3Q8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=u2KIsk+V3VylaNNH8G9rdisAwobd1btr6/JSA41GDDrYe7SN3WVRBnnFd2BvbSkXAa9JiFCPE5vEskdmWpa28mrt6BR+0IKx2wJoOg+uyUhmeH+u1whauAs6HniIvkoZ+qSyoOo6HXdEG1AgFELTDpZ0rw5/59y0JfjyCqwvMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIfROiPQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAB21F000E9;
	Thu, 21 May 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377408;
	bh=f/tIIdoMsH96yPlZqQC67EuXL567zhHUBXOrvuoX9sc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NIfROiPQR63fGY+q3ktp3cAgB1IrWXrDUEJBak4UkxRBSFt9D8Q6Wssspu04LSUE+
	 VP20Anw7ZpKtzNf564cBxRIiPe19GBiIryLQfYj8rXPEqjg03R1Bec6QiJz4kvtxXL
	 UV5OBpZnVPzcVYxT9Y+eeSIR7+bE8MZld/EoHBMTxeV+rTCvipnCTxsJOheOCjI1l5
	 fRMpGytz710CdP691GNrUACze0MKN7kgRVwo9JaMYh8CdmXsoe9lgPDb0f0m+enq/p
	 wVJAM66jzIMs96gCXz7cJx6Df67iSRwVIHBvNv//MN+3JJuarHpcjVJalAq+n0szBy
	 gKhLn+cLrDLtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938FE3930E02;
	Thu, 21 May 2026 15:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when
 version
 matches
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177937741813.384060.14319271092503544369.git-patchwork-notify@kernel.org>
Date: Thu, 21 May 2026 15:30:18 +0000
References: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109121-lists,linux-arm-msm=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E58C85A94A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 29 Apr 2026 20:12:07 +0800 you wrote:
> The Bluetooth host decides whether to download firmware by reading the
> controller firmware download completion flag and firmware version
> information.
> 
> If a USB error occurs during the firmware download process (for example
> due to a USB disconnect), the download is aborted immediately. An
> incomplete firmware transfer does not cause the controller to set the
> download completion flag, but the firmware version information may be
> updated at an early stage of the download process.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btusb: Allow firmware re-download when version matches
    https://git.kernel.org/bluetooth/bluetooth-next/c/3c2c428f25e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



