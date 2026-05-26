Return-Path: <linux-arm-msm+bounces-109909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEuBI4rgFWpYdwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:03:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E58255DB259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A188E304607C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29425409633;
	Tue, 26 May 2026 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OReiT/is"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96841C2E2;
	Tue, 26 May 2026 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817803; cv=none; b=NFzZ8RlsbDbaHpKZpiuLlqDTq8BaVFHiSHaMDWB9PYxqGVJmkAO4z19iejfUlBkEFt5tnR7QgHGu2zvq9Jfrvg/rnfGCkVv2fpE+x+N1KIY/Jtvwf4OEXEZek3ncFWxSoFmNTm9L9X03Qnb5tyTLJswBDzTo+U9BR3CsBU2ywxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817803; c=relaxed/simple;
	bh=XGFSEQhDwXrxZgqdWZ8ceKERX/OG3XD9thhlCQCZRlg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pRFhly86nMcm8VZo9TPK0QYMRhMCBu3CLWmODXrKI53SGMUcWE+TP5rQXt0nvMxtJx/kM94x718dFRWp4ruJMUxSq9GDOg3yV01tptbhhc/dBUsIK6pgM03iCJUcptHClYX0Jva6Vq0kCDyVG+uFi2HwaF8r99STpwZ3/D2zvEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OReiT/is; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB07F1F00A3A;
	Tue, 26 May 2026 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779817801;
	bh=ofiSIFlawvbPZkKbhhlXK/wxasri0S2zyxT0M0BCN7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OReiT/is5MEv2jieGCnlifxCebSBCT6sPzrIKE7QR55HOw1f5Pi5pW2HQ8Jy0qC+y
	 8echsBdA0/X6D4G4tR21enRvXZ5hoDkglZxapcp0ZmoeiLJUx4YCm3QbN+3CQDmCii
	 Db9slBkdVZSKcNljcvvgYm0g+1GHP4nF405cvoUtri3VQ232aNDAnKSophtqE1f6na
	 ifu2yk4Y5J9BbgcvdNnPDETUy+IkvcDu5agKz1TfFknWNfLb4wZSNO+4pDoTMZv1Vw
	 G9+Hr0Jjz6w+QnKMo+3Lb6KpqevFCKe4lsJEYGKYJEHd2AVS9ZUueZqPBtBp3M8MgO
	 0tvukts72pa0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B9F380CEE6;
	Tue, 26 May 2026 17:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Use 100 ms SSR delay for rampatch
 and
 NVM loading
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177981780738.3917724.11762317643649803180.git-patchwork-notify@kernel.org>
Date: Tue, 26 May 2026 17:50:07 +0000
References: <20260525065156.2213123-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260525065156.2213123-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109909-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E58255DB259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 25 May 2026 14:51:56 +0800 you wrote:
> When bt_en is pulled high by hardware, the host does not re-download
> the firmware after SSR. The controller loads the rampatch and NVM
> internally.
> 
> On HMT chip, the rampatch is ~264 KB and the NVM is ~9.4 KB. The
> loading process takes approximately 70 ms. The previous 50 ms delay is
> too short, causing the controller to not respond to the reset command
> sent by the host, which leads to BT initialization failure:
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: hci_qca: Use 100 ms SSR delay for rampatch and NVM loading
    https://git.kernel.org/bluetooth/bluetooth-next/c/b74b39bc6d9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



