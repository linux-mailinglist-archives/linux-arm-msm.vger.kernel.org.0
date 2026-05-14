Return-Path: <linux-arm-msm+bounces-107511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMxCJkg3BWp9TQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAD53D24E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40081304CFEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 02:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB9B3002CF;
	Thu, 14 May 2026 02:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IaIXncM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F584306760
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726709; cv=none; b=S3LnpZ4RhH5J3qUoyq4rK8MW79HPGknp0FrG3iQCa1xXLHmlsvIvRX1653L59JgmTUIQuAMEAfmPJ0bIKwELHoL9DmUG7B+k0rcxDnRphinYEq2QyNsHjMN/4axbsGAg/EFC+AXisEtDzWMp8eQ3tLHKFMtbLdhVOV+IZb8+U9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726709; c=relaxed/simple;
	bh=SILkXwUflzPdjEJbCQ/3qpbB5gDE+H5fM8C44fxIHlo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kmw2COigdnfQNlDj2ks+bI+jWkTnYCl7Hf5Vx7p3gVYB+helWeShVWT178JC6aajDRpNqZjjxJI1CxhvEOgal5LevAzgdCHSJ129i8vWzx6LoEMIg9VKbNmsO0uXGqmiTf3H8D1o4EjH1yOA13CeWkazKHTMp2Lcld/XhuC9Ebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IaIXncM5; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778726689; x=1778985889;
	bh=jrXRkM9lAz7zYKdGDPSkmQy7ff+j3Gi77kdyFz+HJBI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IaIXncM55wwlGoecFHt40uq3SBu8GUTvVzuLeYGPwkTBAv8z3dlSN9KEKIIVoLnTL
	 Y+/+YAuY4udRDXpNuD/WkZW+mHFKayYRsrk5MTUQQE7qm7lzEJDpmVA2sDXstW9947
	 MUnAL8k7JfrB2RoYUOAWyRdLQ7GlJ1uST17XW6r+0Bm4DmSWKb6COiB+JvcGoFOgqQ
	 KcHmptc1Uvwym2FKYfxrz59P7StjrRuCL0R8t/1cYUzf83XWXmyaYiTxk0IXKQ57zx
	 gKsUUnd7a5RdrLaTTxNUTPX8dWT6vLYZWpQs96kAMd3SqTEuVGhGqIQoMb9eoxEfWO
	 BaZ5DhFEp/B5w==
Date: Thu, 14 May 2026 02:44:45 +0000
To: "shuai.zhang@oss.qualcomm.com" <shuai.zhang@oss.qualcomm.com>
From: makro-kernel <makro-kernel@proton.me>
Cc: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "marcel@holtmann.org" <marcel@holtmann.org>, "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when version matches
Message-ID: <GCBTvsv1x8qAB3ZmSCpTLo7M63lTTXM2c5n1TJLmQuus0g4gViSSJVRZzl6CzehnMdSHDqtZkQA33RYCVSxdAm7tGEeVYCflhV3QgbLIcfg=@proton.me>
Feedback-ID: 197359692:user:proton
X-Pm-Message-ID: ce91ed0a5e4d1cceb7211aa4f37f2f404aeebb17
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2EBAD53D24E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107511-lists,linux-arm-msm=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[makro-kernel@proton.me,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,holtmann.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Shuai, Luiz,

I sent a patch earlier today touching the same function for a related
but distinct failure mode in the same family of chips, and only just
saw this thread.

  https://lore.kernel.org/linux-bluetooth/aD_Lix2EVXOHmbZ4L1CunlWiLqfiKlU_1=
_FcVh4CBuIgud4kmE_544xjW2zFKsmh4pNAo9yIQ7q8_GZ4YcmgAXPp8LgW9rfWKqnu06WSjgk=
=3D@proton.me/T/#u

In my case the *outer* check fails first: on Foxconn USB 0489:e10a
(Qualcomm WCN6855/WCN785x, ROM 0x00190200) the chip reports
QCA_CHECK_STATUS =3D 0xe0 (PATCH_UPDATED | SYSCFG_UPDATED) on every
probe, so btusb_setup_qca() never reaches load_rampatch() or
load_nvm(), returns 0, and the controller runs unpatched firmware.

AVDTP setup later fails on Acquire and A2DP audio cannot stream. The
PATCH_UPDATED bit appears to persist across cold boots somewhere on
chip -- originally set by Windows on dual-boot-then-Linux systems
we've seen, but the bit sticks even after a successful Linux firmware
upload, so subsequent boots also see 0xe0 and skip.

The rampatch itself also persists on this silicon at least across
suspend/hibernate resume cycles and driver reload (whether it
survives a true cold boot I haven't isolated). Either way, once an
upload has succeeded the chip reports patch_version equal to the
file's version on subsequent probes, which is exactly the condition
your patch addresses. With my outer bypass in place but without your
inner change, the second and subsequent probes hit the existing
`rver_patch <=3D ver_patch` check, return -EINVAL, and controller
setup aborts entirely:

  Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00190200.bin
  Bluetooth: hci0: QCA: patch rome 0x190200 build 0x8567, firmware rome 0x1=
90200 build 0x8567
  Bluetooth: hci0: rampatch file version did not match with firmware
  (btusb_setup_qca returns -EINVAL, hci0 never finishes registering)

So your fix is doing the right thing here, and on this hardware both
sides are needed together for the chip to come up cleanly across
reload / reboot cycles.

In my local tree I skip reuploading on equal versions rather than=20
re-uploading on every probe:

  if (rver_rom !=3D ver_rom) {
          bt_dev_err(hdev, "rampatch file ROM did not match controller");
          err =3D -EINVAL;
          goto done;
  }

  if (rver_patch <=3D ver_patch) {
          bt_dev_info(hdev, "QCA: rampatch already current, skipping downlo=
ad");
          err =3D 0;
          goto done;
  }

  err =3D btusb_setup_qca_download_fw(hdev, fw, info->rampatch_hdr);

Best,
Makro

