Return-Path: <linux-arm-msm+bounces-97445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JzaJX38s2nWeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:01:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E0282981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5A513016B88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5313F2DA755;
	Fri, 13 Mar 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ipunXlra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F941DDC28;
	Fri, 13 Mar 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403259; cv=none; b=LUA0LHItt8isUJFfp25WA/si/sO2YdTwl+004jBUQWYO2CX13kwbIrsb2yVCI1bZxUd79TD0fqxnOO6Fgn2GMIIqdt02K7hcGkCwUQSd/lV8rAe/i2CdtVjc5GHkeORhddOZmI8peCFaTcr1L62HmulKEThrwHGboqI/4Tnprio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403259; c=relaxed/simple;
	bh=W2mUS43aORt1zRKA6gfMdflGbFTTwsVtdNzIwhRGRKs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/aM88Cg5tcehataiqqfdpczp7/s9NfpUL0k19w4eK25x8jrTspyXyReLYYy96pmlYCM8iqnvKworci1DoJclJrNwMaO1vNQVQ9oZXzPVJofLRDg6BV5n87LgXihfCdX5sYVd1w+qiGW5DPbfqQZTEtUorTdb22GABS8UGGmQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ipunXlra; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773403246; x=1773662446;
	bh=W2mUS43aORt1zRKA6gfMdflGbFTTwsVtdNzIwhRGRKs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ipunXlrao4PR8yT0aaoVrpCk+pJ/DJEiphXOav6ulTK+0KtY6S1moAKigzjugnFOV
	 pc04dezk2rHMyq7OBugdK/lbiTImD/23uTEmqvtOfgsQBJYWfQQ61I5swQ5nOp6ifk
	 hKCGUbZrhSaVXgUihwFlGQMUgoLZQSCRHJ3ApXNW8QRUnCI2bkwH4MDzU6smlFDRrV
	 5PmJGa4nsDGsV0vzYsDFeMwpC1ZHWOZXLLeavf/+PExfzBIPN+p0wtL6/HW3dAhTUd
	 +33KIc+rufygp5gZg/CkyIlZRw3Mr76mmJI1wtxQ+9oarH8BWzNu2SB46tWioL5PsO
	 ZPUjm/YT74x/w==
Date: Fri, 13 Mar 2026 12:00:40 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: qcom_slim_ngd_ctrl_probe: blocked on a mutex
Message-ID: <539a5f37-e06f-44be-abda-3afa69397711@proton.me>
In-Reply-To: <7672009d-7b14-4df2-b057-1ca5ef4fe79e@oss.qualcomm.com>
References: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me> <7672009d-7b14-4df2-b057-1ca5ef4fe79e@oss.qualcomm.com>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: cbe9177e93d266503985d71be99283f383f94317
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[proton.me:+];
	TAGGED_FROM(0.00)[bounces-97445-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,proton.me:dkim,proton.me:mid]
X-Rspamd-Queue-Id: 5E1E0282981
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 09:54, Konrad Dybcio wrote:
> On 3/12/26 1:14 AM, Tj wrote:
>> Currently working on sdm850 device (Samsung Galaxy Book2 W737) and
>> seeing kernel hang early and never recover when probing qcom-ngd-ctrl
>> platform driver.=C2=A0 Only able to capture a photo of the stack traces =
as a
>> result; I'll try to transcribe the important parts here. My diagnosis
>> suggests that the module is calling __platform_driver_register() twice
>> and may be the cause of the hang.
> https://lore.kernel.org/all/20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.q=
ualcomm.com/
>
> should be able to help with some of that

Thank-you. This morning I'd just resolved the platform_driver_register=20
issue myself so now seeing

qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master capability
qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Registered

However the order of registration of the two drivers is important; ctrl=20
should be last, so I'm surprised that Patch 1 works.

My local fix is:

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



