Return-Path: <linux-arm-msm+bounces-110677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCGPJA/ZHWpsfQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 21:10:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504662470A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 21:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F36EE3012550
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 19:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2025368277;
	Mon,  1 Jun 2026 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvLCVzus"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC7364EA5;
	Mon,  1 Jun 2026 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341004; cv=none; b=uBaKaVSSnV6tYYRpVaNJBoMcjBFHw54I2msy+H/fbMXa2VTV+RFelvFYgaLRJWqICcadCQ+c+TNpnIdLHRLLKSqW+Ni7bvrwrpnHAgw8WYmjwirTHDU0LnZjmQei5jtr3GnR8XTk65zW/dE7hyI6WfV/vVrA1Lt4NuCWjiUVyc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341004; c=relaxed/simple;
	bh=4mTbPWtbXMA+Hm6QHY+n699R/X0Ek79GYR7L3HpIlE0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZBcv/NJjnguBSeX6yp2G0/DCOQshrbtD5z7IxjlXORWN1/cACT20jJuKlpO0c6k4TJzsIilYXCiA88u/TqdjSxFXelw8Tyr3KnWx2bHZM1fHa9nimDPTOPRLnEvic/DXaAx7+bYXibqZwN1xZC519MHG/19GccUMqK8MAwr2vqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvLCVzus; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AC91F00893;
	Mon,  1 Jun 2026 19:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780341003;
	bh=z26v2DaPN9zHzIgN3kwWr0iyk7uBm630pFoLMAhbVjk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kvLCVzusPqjU+ir28Wmog5B12bOlkjOd14pmd4Jlxtny253Pa/fyyUcNPUBS/fDLs
	 pPNdwFFgfbsI/6WiI1XytuibaEnUg7RUq7ulo3Y3KSmgLnMJWbW5KASe1IHE5eaFnj
	 MaqGPWKnIkXmuwk5zP8ziwXptW5EPml1tRD5zs6qwFIgJbwoIPuyvB9blwHzTfJ7c2
	 ZIkFnbBltfLNpyQDLh1sdz/4O83nf/osSZd2ygDYvJO7Vdl8Ug/nNMOYNqpacF0o2H
	 OvLxfNlSLnvuYCTVkxCVrjD9DQfLx3dPqHDoXt0vNUZUe9IPSwIdvAzeadU9DpUED6
	 5eK+Vt43qUFZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 16C8738119F4;
	Mon,  1 Jun 2026 19:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Bluetooth: hci_qca: fix NULL pointer dereferences for
 non-serdev devices
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <178034100604.57646.7464742328539604683.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 19:10:06 +0000
References: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
In-Reply-To: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 mengshi.wu@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 quic_saluvala@quicinc.com, zijun_hu@icloud.com, luiz.von.dentz@intel.com,
 bartosz.golaszewski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110677-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com,quicinc.com,icloud.com,intel.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 3504662470A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 01 Jun 2026 04:30:54 -0700 you wrote:
> When a QCA controller is attached via a non-serdev path (e.g. hci_uart
> line discipline), hu->serdev is NULL. A couple of code paths dereference
> it unconditionally, leading to NULL pointer dereferences.
> 
> This series fixes two such cases:
> 
>  - qca_setup() dereferences the result of
>    serdev_device_get_drvdata(hu->serdev).
>  - qca_dmp_hdr() dereferences hu->serdev->dev.driver->name.
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: hci_qca: fix NULL pointer dereference in qca_setup() for non-serdev device
    https://git.kernel.org/bluetooth/bluetooth-next/c/7bfdd3d9129c
  - [2/2] Bluetooth: hci_qca: fix NULL pointer dereference in qca_dmp_hdr() for non-serdev device
    https://git.kernel.org/bluetooth/bluetooth-next/c/4fcae45539b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



