Return-Path: <linux-arm-msm+bounces-119071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zhkCKzNpVmo65AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:52:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DE757196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=RyYhrUuY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119071-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119071-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8E763036284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A184D98F8;
	Tue, 14 Jul 2026 16:51:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776D4D98E0;
	Tue, 14 Jul 2026 16:51:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047919; cv=none; b=HHxjUTlnLNJEoB/haNdOtCtSLCaFfsxvPe8xz1kCk4W2qnMf24wiDHUkuHuba4MU6My9/KL8bA7BxFkdEcU2vU/hxlyTvPDwM8D/PEAwuIh73zGn7p+NxA4m6n/vU2I95gcFOyhNuiU6LNDT5UHgbdt8BTq689Y7B/1kj/IRF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047919; c=relaxed/simple;
	bh=g89D7a4XpoHeRm3Z+DDM6ulsaVeCNUY/pAXw/B1rrIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYZJMTbHf0iEOi4ujsU2PZ/yGGXML83xD/FwMOadgGOxI7FfK7fY5hkF4kTXTVKikAPtkFjT1q1I6wKzUmh6avVy3QNn8scrdVfjNzqaql67375t+Et1IKfNkk/aOuPoiUFCvJHoldDQwWBtgK94gZvqMIFAX+ietK73ixtajEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RyYhrUuY; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784047914;
	bh=g89D7a4XpoHeRm3Z+DDM6ulsaVeCNUY/pAXw/B1rrIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RyYhrUuY0VRYIxcc9jWksSkw7dIf0uM/QpFUvw4D6iOEoFlbFIW2ghfJRleLK/WNQ
	 rey2x6MFE92RNNXOIwhwvX6xLLST98AEg4K+nKvLxlguxYiWa22Mt2e548F4Dtwvr/
	 0PbWPM6Nq0WBZlQHJvhrSADefcIap0eArXNpynw4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 14 Jul 2026 18:51:48 +0200
Subject: [PATCH 1/3] x86/mce: Use __DEVICE_ATTR() macro to initialize
 dev_ext_attribute
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-sysfs-const-attr-dev_ext_attr-v1-1-6b2c0435d621@weissschuh.net>
References: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
In-Reply-To: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
 Yushan Wang <wangyushan12@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784047913; l=1433;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=g89D7a4XpoHeRm3Z+DDM6ulsaVeCNUY/pAXw/B1rrIk=;
 b=al6DQcUFY/kmhepddTJ9a3tiSk4uB2AABkAFZK53JWe7hXFh8iP5oigjsKCNTsx5CGLx1aAPi
 S+roPX/wX0VCQ+JQgOIpHnCiy71QTSy4QX9NJBT275qiNhAXHQF7RQx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tony.luck@intel.com,m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:will@kernel.org,m:mark.rutland@arm.com,m:jic23@kernel.org,m:wangyushan12@huawei.com,m:shaojijie@huawei.com,m:khuong@os.amperecomputing.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linux-edac@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-perf-users@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:driver-core@lists.linux.dev,m:linux@weissschuh.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[intel.com,alien8.de,kernel.org,redhat.com,linux.intel.com,zytor.com,arm.com,huawei.com,os.amperecomputing.com,linux.ibm.com,ellerman.id.au,gmail.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119071-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 797DE757196

The upcoming constification of the device_show_int() and
device_show_bool() signatures requires the users to handle the
transition automatically.

Switch to the __DEVICE_ATTR() macro which can do this.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/x86/kernel/cpu/mce/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 9bba1e2f03af..7fc9aa9e2ec9 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2621,17 +2621,17 @@ static DEVICE_BOOL_ATTR(dont_log_ce, 0644, mca_cfg.dont_log_ce);
 static DEVICE_BOOL_ATTR(print_all, 0644, mca_cfg.print_all);
 
 static struct dev_ext_attribute dev_attr_check_interval = {
-	__ATTR(check_interval, 0644, device_show_int, store_int_with_restart),
+	__DEVICE_ATTR(check_interval, 0644, device_show_int, store_int_with_restart),
 	&check_interval
 };
 
 static struct dev_ext_attribute dev_attr_ignore_ce = {
-	__ATTR(ignore_ce, 0644, device_show_bool, set_ignore_ce),
+	__DEVICE_ATTR(ignore_ce, 0644, device_show_bool, set_ignore_ce),
 	&mca_cfg.ignore_ce
 };
 
 static struct dev_ext_attribute dev_attr_cmci_disabled = {
-	__ATTR(cmci_disabled, 0644, device_show_bool, set_cmci_disabled),
+	__DEVICE_ATTR(cmci_disabled, 0644, device_show_bool, set_cmci_disabled),
 	&mca_cfg.cmci_disabled
 };
 

-- 
2.55.0


