Return-Path: <linux-arm-msm+bounces-31618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2C976E8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 18:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6ADE1F2468A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 16:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6251448DC;
	Thu, 12 Sep 2024 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="AMJpXWq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180158AC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726157896; cv=none; b=BlHpLYO63OZI4oCutgeQtxBCA9osmgyG6IsxpwkKdaeCiiv3Gf1yopyRKFm4xCcPpugiVn6s0gSK5lcoLkgcWD9GR9F+qeNU0ggNRxanh5yHQlM4PWqpYuNdKNZPPvIiyG5TOq6A03bhuoxfcerr6imJ1Vao9rg29nc+jCeszHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726157896; c=relaxed/simple;
	bh=fj1lkCVfDe5e7dKEkwdMnxbYBtwPsQCxAhuEtgr7HWs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZeJBsSO6gN8HtT1ecAFV7JRfTLMBQq4gGytto12hNEZ4VYbly8/tUIRsvxSKRWGlZ0LuigDPs6OuffVDIk4v/bxUpKMf1284duJ4/JzjuuTJ0XSRXuS8zdMRXFTmSj3CFk4E5Dv2ujdsJFrt2Qr1Po8PEMWGofO9FIRND2E3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=AMJpXWq7; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CDEVj3007810
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM202306; bh=fj1lkCVfDe5e7dKEkwdMn
	xbYBtwPsQCxAhuEtgr7HWs=; b=AMJpXWq7yOcdL4npnmoXZ8vkRAyedevwRrElR
	aTlDF2Av2vD1XtN94s8wH9fS4E/0cx6NHJfIn3Uu895G0D9+wI98TAfmUqYsFlez
	PFJ7YrhiKhIikbbWBlNWO8ZyydY0WnHf7m2k/bBHF/CUvye4XJ3uM85oIfeASmKF
	HdI1sr2554wFsBdsZH5uiBgVvduImWPs3mpvVe0to5HVVm+PvFO7AuJN0dxm2qUe
	5tPMwrC+4QrnmeXTQfEIrrNQA0sYh29xwAzd1Z1Ree5lRcSrc4eZ9LzGjgENRyuR
	qumyHas2gN5lLp3cdjGDTOjnhNebRm6U5mP634qvvfjCaJO2A==
Received: from iadlppfpol2.lenovo.com ([104.232.228.81])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 41h4khuy53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 16:18:12 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (unknown [10.62.177.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol2.lenovo.com (Postfix) with ESMTPS id 4X4N0345nfzYkjdK
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 16:18:11 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.49.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4X4N036wSnz2VZ19
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 16:18:11 +0000 (UTC)
Date: Thu, 12 Sep 2024 11:18:10 -0500
From: Maxwell Bland <mbland@motorola.com>
To: linux-arm-msm@vger.kernel.org
Subject: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <34wibre45ntwhswsbulhj3gv2e2vrztb3rm6dnmnup2uaq4c6d@hjeugb7t75g4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MxwxiW_nUupJtAoILnHXGAKJGZmtXfDT
X-Proofpoint-ORIG-GUID: MxwxiW_nUupJtAoILnHXGAKJGZmtXfDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120120

(
Resending via neomutt as plaintext since I think mlmmj may be filtering,
please keep in mind this was originally intended for android kernel team
and the set of CC's on replies should be:

"Andrew Wheeler" <awheeler@motorola.com>;
"Sammy Que" <quebs2@motorola.com>;
Neill Kapron <nkapron@google.com>;
Todd Kjos <tkjos@google.com>;
Viktor Martensson <vmartensson@google.com>;
Andy Lutomirski <luto@amacapital.net>;
keescook@chromium.org <keescook@chromium.org>;
Will Drewry <wad@chromium.org>;
Andy Gross <agross@kernel.org>;
Bjorn Andersson <andersson@kernel.org>;
Konrad Dybcio <konrad.dybcio@somainline.org>;
kernel-team <kernel-team@android.com>
)

Apologies if this is a "duplicate".

Am sending to msm-kernel since this list should also be somewhat aware
and may have engineer with knowledge on generated seccomp sandbox code.
Thanks! (-:

Hi Kernel Team,

+ Kees, Andy, and Will since their input may be valuable.

It has been a while! (~9 months to be exact). This January, I sent out a sm=
all
message on BPF code loading ("unprivileged BPF considered harmful" or somet=
hing
like that). In it, I noted new BPF programs are compiled all the time and
thrown into the kernel. At the time, I did not know these programs were just
compiled seccomp filter policies, loaded in as new BPF programs continuously
through the libminijail interface as well as direct syscall. As of two days
ago, I now know this (and now you do too, if not already).

OK, yes, syscall filtering is very important, but this is creating a catch-=
22
issue. For one, see step (4) under "Exploitation overview" for
https://www.qualys.com/2021/07/20/cve-2021-33909/sequoia-local-privilege-es=
calation-linux.txt.
Second, this minor lack of caching is adding load time to more than 90
binaries/services on the standard QCOM baseline=E2=80=94I'll admit, it is p=
robably
negligible in the grand scheme of things (a quick approximation puts the da=
ta
operated on around 0.1188 MB). But most importantly, third, without some de=
gree
of provenance, I have no way of telling if someone has injected malicious c=
ode
into the kernel, and unfortunately even knowing the correct bytes is still
"iffy", as in order to prevent JIT spray attacks, each of these filters is
offset by some random number of uint32_t's, making every 4-byte shift of the
filter a "valid" codepage to be loaded at runtime.

You might be thinking, "but wait, bionic's libc only defines a couple of
restricted policies, primary and secondary for system and user apps
respectively." I know! For the most part, apps fall into either what I pres=
ume
is the default app/system policies, but there are lots of QCOM binaries and
other magic programs (dolby dax) that are sending up these programs as well.
I'm seeing more than 20 different programs for around a minute's worth of
runtime. One example is attached at the end.

So, the proposal: a "CONFIG_SECCOMMP_STATIC_POLICY" for seccomp. This
would change the Android kernel's generic SYS_seccomp call, which takes in a
filter with an array of BPF instructions, to instead reference an ID which
corresponds to a fixed file on /sys/bpf/seccomp or something like that. The
sandboxing behavior of these apps should be known at compile-time, even if
there are multiple "permission set types" that may need to be dispatched. U=
ser
apps should always have a single, fixed policy. This way it is possible to =
say
for every code page loaded into the kernel where it came from and what it
should look like.

Unfortunately, I do not know Motorola has enough "weight" to convince QCOM =
to
do the right foundational thing here, or to "define" the seccomp APIs for
Android, so it would be good to have Google's buy in, know if there are pla=
ns
to fix this issue, or some discussion of how to best fix the problem? If
anything, a contact at QCOM that might be able to actually hunt down and
document valid bytes for these policies?

The end goal is simple: when we see a code page is allocated in the kernel,=
 we
can be sure that (1) it isn't malicious and (2) has not been modified in
transit. I'm fine putting code where my mouth is, but right now that code
would involve having to fingerprint the signatures loaded by Qualcomm
components every time a new one is released, or pinging Google with a huge
patch changing how seccomp works with no idea of what requirements QCOM may
have on seccomp policy generation.

Thoughts? Is this doable, and if not, why? I'd also love help with the code=
 and
adapting existing minijail code to use a new, more integrity-preserving
interface. If I am mistaken and it is possible to grab out valid BPF policy
code at compile time, please let me know how!

Regards,
Maxwell Bland

Standard filter, (from, for example, com.google.android.gms)
"ac00000000000000ac77000000000000bf160000000000006160040000000000b4020000b7=
0000c01d20020000000000b4000000000000009500000000000000616000000000000055000=
200cb000000b40000000000ff7f95000000000000005500020019000000b40000000000ff7f=
950000000000000055000200ce000000b40000000000ff7f950000000000000055000200c60=
00000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f950000=
000000000055000100de00000005007b000000000055000200d7000000b40000000000ff7f9=
50000000000000055000200d8000000b40000000000ff7f950000000000000055000100e200=
000005008f000000000055000200a7000000b40000000000ff7f95000000000000005500020=
038000000b40000000000ff7f95000000000000005500020062000000b40000000000ff7f95=
000000000000005500020039000000b40000000000ff7f9500000000000000550002003f000=
000b40000000000ff7f95000000000000005500020040000000b40000000000ff7f95000000=
000000005500020050000000b40000000000ff7f9500000000000000550002004e000000b40=
000000000ff7f9500000000000000550002002c000000b40000000000ff7f95000000000000=
005500020043000000b40000000000ff7f9500000000000000550002001d000000b40000000=
000ff7f95000000000000005500020030000000b40000000000ff7f95000000000000005500=
020071000000b40000000000ff7f950000000000000055000200ae000000b40000000000ff7=
f950000000000000055000200a3000000b40000000000ff7f95000000000000005500020086=
000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f95000=
0000000000055000200e9000000b40000000000ff7f9500000000000000550002003e000000=
b40000000000ff7f95000000000000005500020087000000b40000000000ff7f95000000000=
000005500020019000000b40000000000ff7f9500000000000000550002005c000000b40000=
000000ff7f95000000000000005500020016010000b40000000000ff7f95000000000000005=
5000200dc000000b40000000000ff7f95000000000000005500020060000000b40000000000=
ff7f950000000000000055000200dd000000b40000000000ff7f95000000000000005500020=
078000000b40000000000ff7f9500000000000000550002005e000000b40000000000ff7f95=
00000000000000550002008b000000b40000000000ff7f95000000000000005500020080000=
000b40000000000ff7f950000000000000055000200cb000000b40000000000ff7f95000000=
0000000055000100c600000005004c0000000000550002005d000000b40000000000ff7f950=
000000000000055000200ac000000b40000000000ff7f950000000000000055000200840000=
00b40000000000ff7f9500000000000000550002008c000000b40000000000ff7f950000000=
0000000550002003d000000b40000000000ff7f95000000000000005500020017000000b400=
00000000ff7f9500000000000000b4000000000003009500000000000000050000000000000=
06160200000000000630afcff000000006160240000000000630af8ff000000004500030000=
00000061a0fcff0000000045000100040000000500010000000000050001000000000005000=
e000000000005000000000000006160200000000000630afcff000000006160240000000000=
630af8ff00000000450003000000000061a0fcff00000000450001000200000005000100000=
00000050001000000000005000300000000000500000000000000b400000000000300950000=
00000000000500000000000000b40000000000ff7f950000000000000005000000000000006=
160200000000000630afcff000000006160240000000000630af8ff00000000450003000000=
000061a0fcff0000000045000100040000000500010000000000050001000000000005000e0=
00000000005000000000000006160200000000000630afcff00000000616024000000000063=
0af8ff00000000450003000000000061a0fcff0000000045000100020000000500010000000=
000050001000000000005000300000000000500000000000000b40000000000030095000000=
000000000500000000000000b40000000000ff7f95000000000000000500000000000000616=
0100000000000630afcff000000006160140000000000630af8ff0000000055000200000000=
0061a0fcff00000000150001000100000005000100000000000500030000000000050000000=
0000000b40000000000030095000000000000000500000000000000b40000000000ff7f9500=
000000000000",
Unknown filter (from QCOM's /vendor/bin/qesdk-secmanager)
 "ac00000000000000ac77000000000000bf160000000000006160040000000000b4020000b=
70000c01d20020000000000b400000000000000950000000000000061600000000000005500=
0200cb000000b40000000000ff7f95000000000000005500020019000000b40000000000ff7=
f950000000000000055000200ce000000b40000000000ff7f950000000000000055000200c6=
000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f95000=
0000000000055000100de00000005007e000000000055000100e20000000500980000000000=
55000200d7000000b40000000000ff7f950000000000000055000200a7000000b4000000000=
0ff7f95000000000000005500020062000000b40000000000ff7f9500000000000000550002=
001d000000b40000000000ff7f95000000000000005500020038000000b40000000000ff7f9=
500000000000000550002003f000000b40000000000ff7f9500000000000000550002003900=
0000b40000000000ff7f95000000000000005500020050000000b40000000000ff7f9500000=
000000000550002004e000000b40000000000ff7f9500000000000000550002004f000000b4=
0000000000ff7f950000000000000055000200d8000000b40000000000ff7f9500000000000=
0005500020043000000b40000000000ff7f9500000000000000550002002c000000b4000000=
0000ff7f95000000000000005500020087000000b40000000000ff7f9500000000000000550=
0020086000000b40000000000ff7f95000000000000005500020030000000b40000000000ff=
7f950000000000000055000200ae000000b40000000000ff7f9500000000000000550002001=
6010000b40000000000ff7f95000000000000005500020019000000b40000000000ff7f9500=
0000000000005500020042000000b40000000000ff7f950000000000000055000200dc00000=
0b40000000000ff7f9500000000000000550002005e000000b40000000000ff7f9500000000=
000000550002007b000000b40000000000ff7f9500000000000000550002005d000000b4000=
0000000ff7f950000000000000055000200ac000000b40000000000ff7f9500000000000000=
5500020084000000b40000000000ff7f950000000000000055000200a3000000b4000000000=
0ff7f95000000000000005500020080000000b40000000000ff7f9500000000000000550002=
0078000000b40000000000ff7f950000000000000055000200dd000000b40000000000ff7f9=
50000000000000055000100c600000005005800000000005500020060000000b40000000000=
ff7f9500000000000000550002008b000000b40000000000ff7f95000000000000005500020=
0cb000000b40000000000ff7f95000000000000005500020071000000b40000000000ff7f95=
000000000000005500020040000000b40000000000ff7f9500000000000000550002003b000=
000b40000000000ff7f950000000000000055000200e9000000b40000000000ff7f95000000=
0000000055000200b2000000b40000000000ff7f9500000000000000550002008c000000b40=
000000000ff7f950000000000000055000200d8000000b40000000000ff7f95000000000000=
00b400000000000300950000000000000005000000000000006160200000000000630afcff0=
00000006160240000000000630af8ff00000000450003000000000061a0fcff000000004500=
0100040000000500010000000000050001000000000005000e0000000000050000000000000=
06160200000000000630afcff000000006160240000000000630af8ff000000004500030000=
00000061a0fcff0000000045000100020000000500010000000000050001000000000005000=
300000000000500000000000000b40000000000030095000000000000000500000000000000=
b40000000000ff7f950000000000000005000000000000006160200000000000630afcff000=
000006160240000000000630af8ff00000000450003000000000061a0fcff00000000450001=
00040000000500010000000000050001000000000005000e000000000005000000000000006=
160200000000000630afcff000000006160240000000000630af8ff00000000450003000000=
000061a0fcff000000004500010002000000050001000000000005000100000000000500030=
0000000000500000000000000b40000000000030095000000000000000500000000000000b4=
0000000000ff7f950000000000000005000000000000006160100000000000630afcff00000=
0006160140000000000630af8ff00000000550002000000000061a0fcff0000000015000100=
01000000050001000000000005000300000000000500000000000000b400000000000300950=
00000000000000500000000000000b40000000000ff7f9500000000000000",

List of services loading seccomp filters pulled from one run of the phone:
com.google.android.deskclock
/vendor/bin/qesdk-secmanager
media.hwcodec/vendor.qti.media.c2@1.0-service
media.audio.qc.codec.qti.media.c2audio@1.0-service
/vendor/bin/vendor.qti.qspmhal-service
/vendor/bin/qsap_sensors
media.extractoraextractor
/system_ext/bin/perfservice
/vendor/bin/wfdhdcphalservice
/vendor/bin/wifidisplayhalservice
/vendor/bin/qsap_dcfd
/vendor/bin/qms
/vendor/bin/qsap_location
/vendor/bin/qsap_qapeservice
/vendor/bin/wfdvndservice
media.swcodecoid.media.swcodec/bin/mediaswcodec
/vendor/bin/hw/qcrilNrd
qsap_qms_13qms16
qsap_qms_24qms17
/vendor/bin/ATFWD-daemon
/vendor/bin/hw/sxrservice
/vendor/bin/hw/qcrilNrd-c2
system_server
/vendor/bin/qmi_motext_hook1013170
/vendor/bin/qmi_motext_hook1013171
/vendor/bin/ims_rtp_daemon
com.android.systemui
webview_zygote
com.dolby.daxservice
vendor.qti.qesdk.sysservice
org.codeaurora.ims
com.android.se
com.android.phone
com.qti.qcc
com.google.android.ext.services
com.google.android.gms
com.google.android.euicc
com.google.android.googlequicksearchbox:interactor
com.google.android.apps.messaging:rcs
com.android.nfc
com.qualcomm.qti.workloadclassifier
com.qualcomm.location
com.google.android.gms.unstable
com.thundercomm.ar.core
com.android.vending:background
com.android.vending:quick_launch
com.android.dynsystem
com.android.managedprovisioning
com.android.shell

