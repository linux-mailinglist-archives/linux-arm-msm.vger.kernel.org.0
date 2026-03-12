Return-Path: <linux-arm-msm+bounces-97099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAH7L8gFsmnXHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:16:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E726B8F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C48E307095D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2392D282F07;
	Thu, 12 Mar 2026 00:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VnP7UX3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAA927A123;
	Thu, 12 Mar 2026 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274501; cv=none; b=sKBaHlrlVwl8Nkb+Sei2KN9bYipgXW4dgxALGNP0MBQqlt4up6a6aMUnpEW4FCIeU5vAlpBzi+kr0FKSNP3S0L4Jf7vA2oLxK9M7V0xeXT2jDAHU83eExQHeWZhF1WmXSI4d3UGAAx8pRLWxzqh3E7weU5SRwqwBtgz1EQyQ9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274501; c=relaxed/simple;
	bh=uEwGpzlVxctJkvf0fZdXST7AmXE2XY+GnimDRwT9NGE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FtJE0mt73PAh/MGcz+bWECvzaSelKfjHnDD7p5GI3gj5Cfae44dtKhp3fDYDDdgdPv3ba/+7KghjmkC1EpiNVSGCEmGWu0hlzCs6IvL+6Aqrx8UGR3GtIl1gPV8wNEeMlqBgwTI43r7xy/upMFjkz636OFjeE12ioNHq59jV9VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VnP7UX3O; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773274484; x=1773533684;
	bh=uEwGpzlVxctJkvf0fZdXST7AmXE2XY+GnimDRwT9NGE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VnP7UX3Oy+4bP7Cj0ugzyHslr3aVQu1FBd/sTHRDX1pJasuVTRNRCaVPKVdzvOW4m
	 JbaTfiTFzmog0zUtZW+fqFNJF8VYa6r/jd1iYPFghtaNdXpnUZujdKHJBoB8lEeLsv
	 BUnbv6/MVtuVlz10meCofnN42MknZRTKE3NZ6818T8JeBt67kbZjuHsO2QyI6GSol8
	 2PBke3ouy8XJ6vg8IKVGShvJdjMJX/Pe0fgZejXNKnWvAmsXZMh0O6flR7mUNwdzVj
	 y3QYa9oPpGx/sJAPXG44kS+j/3YIyxzw5FTuqfbu/BvAI11TI5QfKShWH4RdLBtc5f
	 9xSwTRoOwp2+g==
Date: Thu, 12 Mar 2026 00:14:39 +0000
To: Srinivas Kandagatla <srini@kernel.org>
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: qcom_slim_ngd_ctrl_probe: blocked on a mutex
Message-ID: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: f0457d073aa9cab600ca62b306ee709796741611
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[proton.me:+];
	TAGGED_FROM(0.00)[bounces-97099-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:dkim,proton.me:mid]
X-Rspamd-Queue-Id: 314E726B8F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently working on sdm850 device (Samsung Galaxy Book2 W737) and=20
seeing kernel hang early and never recover when probing qcom-ngd-ctrl=20
platform driver.=C2=A0 Only able to capture a photo of the stack traces as =
a=20
result; I'll try to transcribe the important parts here. My diagnosis=20
suggests that the module is calling __platform_driver_register() twice=20
and may be the cause of the hang.

INFO: task swapper/0:1 is blocked on a mutex likely owned by task=20
swapper/0:1
INFO: task swapper/0:1 blocked for more than 1232 seconds.
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Not tainted 7.0.0.-rc2-adm845 #80
task:swapper/0=C2=A0 =C2=A0 state:D pid:1 tgid:1 ppid:0 task_flags:0x <-- n=
ot in photo
Call trace:
__switch_to_0x104/0x1c8 (T)
__schedule+0x438/0x1168
schedule+0x3c/0x120
schedule_preempt_disabled+0x2c/0x50
__mutex_lock.constprop.0+0x3d0/0x938
__mutex_lock_slowpath+0x1c/0x30
__driver_attach+0x38/0x280
bus_for_each_dev+0x80/0xc8
driver_attach+0x2c/0x40
bus_add_driver+0x128/0x258
driver_register+0x68/0x138
__platform_driver_register+0x2c/0x40
qcom_slim_ngd_ctrl_probe+0x1f4/0x400
platform_probe+0x64/0xa8
really_probe+0xc8/0x3f0
__driver_probe_device+0x88/0x190
driver_probe_device+0x44/0x120
__driver_attach+0x138/0x280
bus_for_each_dev+0x80/0xc8
driver_attach+0x2c/0x40
bus_add_driver+0x128/0x258
driver_register+0x68/0x138
__platform_driver_register+0x2c/0x40
qcom_slim_ngd_ctrl_driver_init+0x24/0x38
do_one_initcall+0x60/0x450
kernel_init_freeable+0x23c/0x630
kernel_init+0x2c/0x1f8
ret_from_fork+0x10/0x20

My analysis:

=3Ddrivers/slimbus/qcom-ngd-ctrl.c
module_platform_driver(qcom_slim_ngd_ctrl_driver);

 =C2=A0 =3Dinclude/linux/platform_device.h
 =C2=A0 #define module_platform_driver(__platform_driver) \
 =C2=A0 module_driver(__platform_driver, platform_driver_register,=20
platform_driver_unregister)
 =C2=A0 =C2=A0 =3Dinclude/device/driver.h
 =C2=A0 =C2=A0 /* Each module may only use this macro once */
 =C2=A0 =C2=A0 #define module_driver(__driver, __register, __unregister, ..=
.)=20
return __register(&(__driver) , ##__VA_ARGS__);
 =C2=A0 =C2=A0 =C2=A0 // __register =3D=3D platform_driver_register

 =C2=A0 =C2=A0 #define platform_driver_register(drv)=20
__platform_driver_register(drv, THIS_MODULE)
 =C2=A0 =C2=A0 =C2=A0 =3Ddrivers/base/platform.c
 =C2=A0 =C2=A0 =C2=A0 __platform_driver_register(struct platform_driver *dr=
v, struct=20
module *owner)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3Ddrivers/base/driver.c
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_register(&drv->driver);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus_add_driver()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_attach()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus_for_each_dev()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __dirver_attach()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_prob=
e_device()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 real=
ly_probe()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 platform_probe()
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3Ddrivers/slimbus/qcom-ngd-ctrl.c
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 qcom_slim_ngd_ctrl_probe(struct platform_device=20
*pdev)
platform_driver_register(&qcom_slim_ngd_driver);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 // and round we go again!



