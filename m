Return-Path: <linux-arm-msm+bounces-115544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+YJEfUnRGoUpwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:32:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D01936E7DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:32:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UODlY8XX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115544-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115544-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 422DA302735F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 20:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CEC47AF4B;
	Tue, 30 Jun 2026 20:32:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BE2135C5;
	Tue, 30 Jun 2026 20:32:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851571; cv=none; b=cHRGKYO9Pb+MLhoHfqCBRyf3+x0wYKThEMlfxuBeFXluarpExWmmonKUUrjc/FBmQdQ3E6sso0C3iFPTQzETOq7HDM4vDEDrjbV62kJL6BAA3nX76C9jWrHVV0ByFAZPyfJY95CuMt60uq9xBWz3HnUWvYUrb0M9qAJ3S1AK0Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851571; c=relaxed/simple;
	bh=Yieu/SMxq5J0mC8kb9rgbzQUvx7C8Pf5wPUcwTx11dY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Il93frFlkU3bh6k6JcVpXxuKvGDiiifSREmhT+d7v1ibHCVhToEHqoCpVWdj/ucgYO+v64AUNM++pdrKnsCAn/vDwq+wp19jRM4aqNffZwgYZPBYYgXOJ/J3I7aGLJp+iEYtC5Efb0q074lqijEucQYD5sOFy5UkJDRNoI4/eQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UODlY8XX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED181F000E9;
	Tue, 30 Jun 2026 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782851569;
	bh=1A1Noy8LRGtvZrlICTzO9rRKUHCfaLihrFNikt0V8C4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UODlY8XX/WY4jhttC8cENg6ahMfkdnjFLT2WSqRYQS/f+a09Pv+8CGxtbDVlVGfwJ
	 NCo6SBrqQ1r+eRsSt+6Wg4umWbzkgTr/L9ihH1UFdQBdMeDFBeEv5ByH80Sw71E69T
	 p3CWfdYPZMCZuLOqjAxTQ+l22ITvliKoBtDJtHxAne+bbAVo3USUXMx1DFb3Eq3VHU
	 r3W0JdcxeMPiDcFS5+UNuiIhmp8RBWARiy80nIF75/A/KOPXN5zmPRgA14qtxpxGfE
	 AqYBDU00u8p//61y+1EJbOUTqBQVVd9k0yuayrKjF+POC3H95LqR5KeeJdxfVU0l2L
	 AWifVimadab4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AD8393A951;
	Tue, 30 Jun 2026 20:32:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/12] Bluetooth: btusb/btqca/hci_sync: Clean up btusb
 and fix several bugs
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <178285155338.267316.7362111098834622157.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jun 2026 20:32:33 +0000
References: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
In-Reply-To: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, quic_rjliao@quicinc.com,
 brgl@kernel.org, ytkim@qca.qualcomm.com, quic_bgodavar@quicinc.com,
 mka@chromium.org, quic_tjiang@quicinc.com, zijun_hu@icloud.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 luiz.von.dentz@intel.com, linux-arm-msm@vger.kernel.org,
 bartosz.golaszewski@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115544-lists,linux-arm-msm=lfdr.de,bluetooth];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D01936E7DA3

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 25 Jun 2026 22:19:45 -0700 you wrote:
> This series cleans up btusb in preparation for adding a new chip,
> QCC2072, and fixes several pre-existing bugs found along the way.
> 
> Bug fixes:
> - qca_set_bdaddr() waited for HCI_EV_VENDOR, but the controller replies
>   with a Command Complete event.
> - btusb_set_bdaddr_wcn6855() sent the BD_ADDR without byte-swapping it.
> - btusb QCA populated devcoredump fields on devices where devcoredump is
>   not enabled.
> - BTUSB_IGNORE is a bitmask and must be tested with '&', not '=='.
> 
> [...]

Here is the summary with links:
  - [v2,01/12] Bluetooth: btqca: Fix qca_set_bdaddr() waiting for wrong HCI event
    https://git.kernel.org/bluetooth/bluetooth-next/c/1718f3a121dd
  - [v2,02/12] Bluetooth: btusb: Fix BD_ADDR byte order in btusb_set_bdaddr_wcn6855()
    https://git.kernel.org/bluetooth/bluetooth-next/c/cb9fed45d399
  - [v2,03/12] Bluetooth: btusb: Record matched usb_device_id into btusb_data
    https://git.kernel.org/bluetooth/bluetooth-next/c/97138867591e
  - [v2,04/12] Bluetooth: btusb: QCA: Fix populating devcoredump fields on unenabled devices
    https://git.kernel.org/bluetooth/bluetooth-next/c/0a7575521e2e
  - [v2,05/12] Bluetooth: btusb: QCA: move qca_dump out of struct btusb_data
    https://git.kernel.org/bluetooth/bluetooth-next/c/bafbbfe43876
  - [v2,06/12] Bluetooth: hci_sync: Introduce __hci_reset_sync() for device drivers
    https://git.kernel.org/bluetooth/bluetooth-next/c/dc4d5e617358
  - [v2,07/12] Bluetooth: btqca: Simplify qca_send_reset() by using __hci_reset_sync()
    https://git.kernel.org/bluetooth/bluetooth-next/c/6ccd5c9a56dd
  - [v2,08/12] Bluetooth: btusb: Simplify btusb_shutdown_qca() by using __hci_reset_sync()
    https://git.kernel.org/bluetooth/bluetooth-next/c/738df2031c56
  - [v2,09/12] Bluetooth: hci_sync: Simplify hci_reset_sync()
    https://git.kernel.org/bluetooth/bluetooth-next/c/a16a8312f80f
  - [v2,10/12] Bluetooth: hci_event: Log error for HCI reset status error in hci_cc_reset()
    (no matching commit)
  - [v2,11/12] Bluetooth: btusb: Reduce a redundant assignment in btusb_probe()
    https://git.kernel.org/bluetooth/bluetooth-next/c/37ecdbcfd7cb
  - [v2,12/12] Bluetooth: btusb: Use & instead of == to test bitflag BTUSB_IGNORE
    https://git.kernel.org/bluetooth/bluetooth-next/c/5d490bc8bda1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



