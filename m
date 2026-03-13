Return-Path: <linux-arm-msm+bounces-97478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELwjOC4FtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:38:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E0928323B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66725300B06A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E7F397688;
	Fri, 13 Mar 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="BrkeFO9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6930395279;
	Fri, 13 Mar 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405436; cv=none; b=UttAnmU7lOInsg8tm/zmFr/w2GViLmM+BBtg+fTbpjqFJlM0agiS9At990+cX0rL/pM+FP6c+h6E7KA/yVBrCY+6rL7ybOfNyo710bz/WRkH5pOnMy8EnRcHB6posWRrmR8asCkiphoqPYtiMdescbUS5MG0UoGvxHhItW3cB6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405436; c=relaxed/simple;
	bh=drJxjPYYn4yLlsDAZKfAjq7zL4hGx7yjY8uuovq1vFU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QAbset7IFxSY48Z/BcXZvnLyl3qr+/QkyDF+eIeb6s5xdBnCLGz5nNSTpjIrk3uyXTtaRNTFKY7LMJNDyiKQVh4//ONcqvJl3I+em2k0ZJSFR6z8gJAtot7s1+40YVtgHFWDE7K+SMBWGBEl1vMXgEhsdwG/k/InCtTSIBAqa20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=BrkeFO9H; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773405420; x=1773664620;
	bh=drJxjPYYn4yLlsDAZKfAjq7zL4hGx7yjY8uuovq1vFU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BrkeFO9H7INzr4l9XKsWPBDB1E3gsJewTTTY7QHBjXlFPvcviMI5NeSqN64Qt5o7H
	 vBYf7hy6cns9j0+i7qAPC9bX0YJY0UFhATJ8WjhGUE0blW/+l/rym7fR/LZYfgUDrr
	 BtyBwOBjHAinDNOWI7FxDiVQFCvDy7GC5drGphQmC+knTznCOWyVC///+QKZS5fVMK
	 3iVLR+qrUA0yBRyk0Ov1LURpWz7w7eOMfkM5Zsg5BehDs1p2ln6Sijq0UUoOPYBz8j
	 YSvYo+8bT8XibJ2JbWmgVchQt71nJQIE1UXqn65eeuTBgfJpEuKlU9/KNsmV+kmreQ
	 mGiq7UVmLAqpQ==
Date: Fri, 13 Mar 2026 12:36:54 +0000
To: bjorn.andersson@oss.qualcomm.com
From: Tj <tj.iam.tj@proton.me>
Cc: gregkh@linuxfoundation.org, krzk@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, srini@kernel.org, stable@vger.kernel.org, vkoul@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
Message-ID: <2e06ae01-6af9-4de7-be27-e439dc365d9b@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 2ff8e9f9e5ed6e8baa6e202986b4159e1e43e813
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97478-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[proton.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:dkim,proton.me:mid,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,171c0000:email]
X-Rspamd-Queue-Id: 41E0928323B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following up on the registration problems on recommendation of Konrad=20
Dybcio.

I previously reported a hang during driver registration due to lock=20
contention. Konrad pointed me to this thread. Earlier, I had fixed the=20
issue myself and whilst doing it saw that order of registration is=20
important - ctrl must be last otherwise it causes:

qcom,slim-ngd-ctrl 171c0000.slim-ngd: Failed to create device link=20
(0x180) with supplier 34000000.pinctrl for=20
/soc@0/slim-ngd@171c0000/slim@1/codec@1,0

so I'd be surprised if Patch 1 works (not had chance to test the patch=20
series as yet).

With my local patch the result is:

qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master capability
qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Registered

---
 =C2=A0 =C2=A0 slimbus: ngd: fix lock hang on probe

 =C2=A0 =C2=A0 Module contains two platform_drivers. The initial probe call=
s
 =C2=A0 =C2=A0 platform_register_driver() with the second struct platform_d=
river.

 =C2=A0 =C2=A0 This caused a hung task due to mutex lock in __driver_attach=
():

 =C2=A0 =C2=A0 INFO: task swapper/0:1 blocked for more than 1232 seconds.
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Not tainted 7.0.0.-=
rc2-sdm845 #89
 =C2=A0 =C2=A0 task:swapper/0=C2=A0 =C2=A0 state:D pid:1 tgid:1 ppid:0 task=
_flags:0x0140=20
flags:0x00000010
 =C2=A0 =C2=A0 Call trace:
 =C2=A0 =C2=A0 __switch_to_0x104/0x1c8 (T)
 =C2=A0 =C2=A0 __schedule+0x438/0x1168
 =C2=A0 =C2=A0 schedule+0x3c/0x120
 =C2=A0 =C2=A0 schedule_preempt_disabled+0x2c/0x50
 =C2=A0 =C2=A0 __mutex_lock.constprop.0+0x3d0/0x938
 =C2=A0 =C2=A0 __mutex_lock_slowpath+0x1c/0x30
 =C2=A0 =C2=A0 __driver_attach+0x38/0x280
 =C2=A0 =C2=A0 bus_for_each_dev+0x80/0xc8
 =C2=A0 =C2=A0 driver_attach+0x2c/0x40
 =C2=A0 =C2=A0 bus_add_driver+0x128/0x258
 =C2=A0 =C2=A0 driver_register+0x68/0x138
 =C2=A0 =C2=A0 __platform_driver_register+0x2c/0x40
 =C2=A0 =C2=A0 qcom_slim_ngd_ctrl_probe+0x1f4/0x400
 =C2=A0 =C2=A0 platform_probe+0x64/0xa8
 =C2=A0 =C2=A0 really_probe+0xc8/0x3f0
 =C2=A0 =C2=A0 __driver_probe_device+0x88/0x190
 =C2=A0 =C2=A0 driver_probe_device+0x44/0x120
 =C2=A0 =C2=A0 __driver_attach+0x138/0x280
 =C2=A0 =C2=A0 bus_for_each_dev+0x80/0xc8
 =C2=A0 =C2=A0 driver_attach+0x2c/0x40
 =C2=A0 =C2=A0 bus_add_driver+0x128/0x258
 =C2=A0 =C2=A0 driver_register+0x68/0x138
 =C2=A0 =C2=A0 __platform_driver_register+0x2c/0x40
 =C2=A0 =C2=A0 qcom_slim_ngd_ctrl_driver_init+0x24/0x38
 =C2=A0 =C2=A0 do_one_initcall+0x60/0x450
 =C2=A0 =C2=A0 kernel_init_freeable+0x23c/0x630
 =C2=A0 =C2=A0 kernel_init+0x2c/0x1f8
 =C2=A0 =C2=A0 ret_from_fork+0x10/0x20
 =C2=A0 =C2=A0 INFO: task swapper/0:1 is blocked on a mutex likely owned by=
 task
 =C2=A0 =C2=A0 swapper/0:1.

 =C2=A0 =C2=A0 Showing all locks held in the system:
 =C2=A0 =C2=A0 2 locks held by swapper/0/1:
 =C2=A0 =C2=A0 =C2=A0#0: ffff000080ff80f8 (&dev->mutex){....}-{4:4}, at:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__driver_attach+0x19c/0x2c0
 =C2=A0 =C2=A0 =C2=A0#1: ffff000080ff80f8 (&dev->mutex){....}-{4:4}, at:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__driver_attach+0x38/0x2c0
 =C2=A0 =C2=A0 1 lock held by khungtaskd/73:
 =C2=A0 =C2=A0 =C2=A0#0: ffffbc5dfc38f1d8 (rcu_read_lock){....}-{1:3}, at:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug_show_all_locks+0x18/0x1f0

 =C2=A0 =C2=A0 After this fix:

 =C2=A0 =C2=A0 qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master =
capability
 =C2=A0 =C2=A0 qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Regist=
ered

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c=20
b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d2..abdd4ad57f2d2 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1664,7 +1664,6 @@ static int qcom_slim_ngd_ctrl_probe(struct=20
platform_device *pdev)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_pdr_looku=
p;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }

-=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_driver_register(&qcom_slim_ngd_driver)=
;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return of_qcom_slim_ngd_register(dev, ctrl);

 =C2=A0err_pdr_alloc:
@@ -1754,6 +1753,23 @@ static struct platform_driver=20
qcom_slim_ngd_driver =3D {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
 =C2=A0};

-module_platform_driver(qcom_slim_ngd_ctrl_driver);
+static struct platform_driver * const qcom_slim_ngd_drivers[] =3D {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Order here is important; ctrl last */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&qcom_slim_ngd_driver,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&qcom_slim_ngd_ctrl_driver,
+};
+
+static int __init qcom_slim_ngd_init(void)
+{
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_register_drivers(qcom_slim_ngd_=
drivers,=20
ARRAY_SIZE(qcom_slim_ngd_drivers));
+}
+module_init(qcom_slim_ngd_init);
+
+static void __exit qcom_slim_ngd_exit(void)
+{
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_unregister_drivers(qcom_slim_ng=
d_drivers,=20
ARRAY_SIZE(qcom_slim_ngd_drivers));
+}
+module_exit(qcom_slim_ngd_exit);
+
 =C2=A0MODULE_LICENSE("GPL v2");
 =C2=A0MODULE_DESCRIPTION("Qualcomm SLIMBus NGD controller");



