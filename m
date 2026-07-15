Return-Path: <linux-arm-msm+bounces-119151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nlkvH20lV2qgFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:15:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A575AE2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:15:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=fHniI8Zs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E004B3007F7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896B53B5837;
	Wed, 15 Jul 2026 06:15:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96AD384CFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:15:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096102; cv=none; b=Pu5ieuX9UwwoqTQ/xOiUnheIKAvnXycEjKkNDSE1AgsObxDE012UnNrYBvL6qYrVmoXRbq0w70mvsy8zrmDDzaKQ7pyBWmkM7HnSlDKb0ImGx25vANhxSWhfHNiEsYD0HQxsL1pEGnzKLnTFGRIVvnHGqaH/SJq8fAbwWDUKnng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096102; c=relaxed/simple;
	bh=qhTyoMVjedUBGZceAqeuDQwxprvZNjet/N6M8tyyrGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ds9ITaTIW8cdAxo0ghFaGjwTa2TSjmI0tzI9qgH1my8xuPqU79MAPfJ8hnU8DFwX7fb3iFQiQY5PA0BN6SVYut6xwpXp48qaDOnazICOvZssb0nYYh2PnUGgL55OUZaThkikBmAF53g/kbJhrnlLiTYSYMYBD+EuHJIT4Ko1yi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fHniI8Zs; arc=none smtp.client-ip=210.118.77.12
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260715061458euoutp02a48d5dbc52911a8b234f16591d8965f5~CYfMIPisw1551615516euoutp02E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:14:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260715061458euoutp02a48d5dbc52911a8b234f16591d8965f5~CYfMIPisw1551615516euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784096098;
	bh=7304j2XvTwBXN54PMh9V1wm+HcrsKtzERr5yCS06/CI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=fHniI8Zs83X2XNLivGU3X1EzbyfNeAOoMyBYw+E3YoT75L0H+X3ScmgNM1aSY1nrr
	 xbsYncJbswB+GIsHGN+5uDOxKYAY+lzRgusj1ZlNOjO0Uhz6SCrTCq0sYwFPuTgGg3
	 zrGyMnIpBH9Ue1nYC/HpNuu4tdlTRi3fa22aUmHs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260715061458eucas1p2443aeb1b50cdd717dba5ad8446bee092~CYfL4mRv_1213012130eucas1p2d;
	Wed, 15 Jul 2026 06:14:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260715061457eusmtip2e052870f01911c48786ede8aa20dda2f~CYfK4nRe52433324333eusmtip2F;
	Wed, 15 Jul 2026 06:14:57 +0000 (GMT)
Message-ID: <b434e198-2778-4dd6-8896-f7f54bc9b8e2@samsung.com>
Date: Wed, 15 Jul 2026 08:14:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>, Ulf Hansson
	<ulf.hansson@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e83dffd9-e54f-45a8-b997-e84b5beead71@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260715061458eucas1p2443aeb1b50cdd717dba5ad8446bee092
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55
X-EPHeader: CA
X-CMS-RootMailID: 20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
	<CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
	<20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
	<dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
	<CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
	<e83dffd9-e54f-45a8-b997-e84b5beead71@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:ulf.hansson@oss.qualcomm.com,m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-119151-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:from_mime,samsung.com:mid,samsung.com:email,samsung.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D30A575AE2F

On 14.07.2026 15:29, Maulik Shah (mkshah) wrote:
> On 7/14/2026 6:34 PM, Ulf Hansson wrote:
>> On Thu, Jul 9, 2026 at 1:41 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
> [...]
>
>> Without detailed HW expertise (still learning about the UnoQ), it
>> looks to me that the HW may have been modelled upside down.
>>
>> The power-domain-cpu-cluster should probably *not* be the consumer of
>> the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
>> example.
> Agree, There is a series [1] sent out to fix modeling similar to how rpmh-rsc works.
>
> [1] https://lore.kernel.org/lkml/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/
Indeed that series fixes the modelling issue, but it doesn't change much
from the spinlock vs. raw_spinlock perspective. There is still the
'invalid wait context' issue there, because mbox API cannot be properly
called from cpu_pm_notifier (which use raw_notifier internally):

=============================
[ BUG: Invalid wait context ]
7.2.0-rc3-next-20260714+ #16842 Not tainted
-----------------------------
swapper/3/0 is trying to lock:
ffff0000008ac408 (&chan->lock){....}-{3:3}, at: mbox_send_message+0x3c/0x15c
other info that might help us debug this:
context-{5:5}
locks held by swapper/3/0: 1, last CPU#3:
 #0: ffffd99263a61228 (cpu_pm_notifier.lock){....}-{2:2}, at: cpu_pm_enter+0x28/0x78
stack backtrace:
CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 7.2.0-rc3-next-20260714+ #16842 PREEMPT
Hardware name: Arduino UnoQ (DT)
Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x8c/0xcc
 dump_stack+0x18/0x24
 __lock_acquire+0x928/0x1f90
 lock_acquire+0x2b8/0x3ec
 _raw_spin_lock_irqsave+0x60/0x88
 mbox_send_message+0x3c/0x15c
 handle_rpm_notification+0x58/0x114
 mpm_cpu_pm_callback+0x9c/0xdc
 notifier_call_chain+0xa0/0x234
 raw_notifier_call_chain_robust+0x48/0xa8
 cpu_pm_enter+0x40/0x78
 __psci_enter_domain_idle_state.isra.0+0x48/0x470
 psci_enter_domain_idle_state+0x18/0x24
 cpuidle_enter_state+0xbc/0x428
 cpuidle_enter+0x38/0x50
 do_idle+0x158/0x324
 cpu_startup_entry+0x38/0x3c
 secondary_start_kernel+0x138/0x158
 __secondary_switched+0xc0/0xc4

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


