Return-Path: <linux-arm-msm+bounces-110708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPrGLWhlHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:08:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C82628649
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E169C30182BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D75C2DF13B;
	Tue,  2 Jun 2026 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="caYxTpV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D502DA759;
	Tue,  2 Jun 2026 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376920; cv=none; b=ObLFBm8IZAaYkHmlg49v2fJSihoop+RhfQUGTqU3SHLjyVXhfU+f0YvwFSzOf2iLoyggBLusQVgI5xdReqUXJLbG+MQS05yqvq0br6Q5I1uFNIF6UKAX4x/PQQtRc9G2gWjUp+9FK1P23UqjKeOZeLMaP7Yu/pcOJ848ZEFJMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376920; c=relaxed/simple;
	bh=dEOhIrRMnyFZIwlnwNmZ5kA2GpyClFZaTBmg5oqa5e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJNsdTjgRZLIuhMTyM2MgUEGgCR48QYiMa0IFqn5DJx8+lSNpOnWLB564/SJRBUnQVVZ10WQq6kDmtsm9Pxt+qV3OJlsKkbDdnTfUPbkTQfVzRPhbz8OamDuLUkST9yhSWcIvPzJ+/pC4sekXE5K/3tu8a2DQEhK9l9QTt7FLMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=caYxTpV+; arc=none smtp.client-ip=136.144.136.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gTzPR0rByzQvv78;
	Tue,  2 Jun 2026 07:08:27 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission12.mail.transip.nl (Postfix) with ESMTPA id 4gTzPP5NvKz3SJ37B;
	Tue,  2 Jun 2026 07:08:25 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: Re: [PATCH 0/3] clk: qcom: add MSM8x60 Multimedia Clock Controller (MMCC) driver
Date: Tue,  2 Jun 2026 07:08:25 +0200
Message-ID: <20260602050825.435234-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602043623.285901-1-github.com@herrie.org>
References: <20260602043623.285901-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780376906; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=fkQ9YqvGijsXHbWSRZTlgpg9CxR7HoIaq41CJo61Z0g=;
 b=caYxTpV+hFgPXTkpK5hJNtXv/rmKPQN5ZD6MJ4PpwsJIrGWhaYmm5PxxFMl9HGv9z6utlQ
 k0LAc1UKQiivW+g5+AeLVGv+H/DOmATbj3jp59ixj5S0HlZGLzWTpXi28rqIHMjXc8SjF+
 XhvW9jX/uj1jcSMGvcuvfjSOcTDjcOVF5QgP3Ru44k7SX4RjMLMdoNr7iHWZ+tg+ZXqNKO
 3Tz9LQaqAJJ3z7cl9rfUlkfSFl88+33VQwRKVVVE65ILizFH9prSv7Ee85NouIyAQA+Hl2
 IZIY0ukl7UQfpZdpkQW3Q7PufKXxKf68GpVU0RMtJUb9wAp09AFbDhsix1UtFA==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 57C82628649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Two things I need to flag against this v1 before further review:

1. Missed prerequisite (build break on a clean tree).

   mmcc-msm8660.c references LEGACY_FOOTSWITCH (4 GDSCs: ROT, IJPEG,
   VFE, VPE) and RPM_ALWAYS_ON (GFX3D), both of which are not in
   mainline gdsc.{c,h} today. I was supposed to send the GDSC
   framework groundwork series first; I sent mmcc by mistake before
   it. The prereq is incoming on linux-clk in a separate thread:

       Subject: [PATCH 0/2] clk: qcom: gdsc: groundwork for
                MSM8x60 power domains

   v2 of this MMCC series will declare the dependency explicitly in
   the cover letter and will not be sent before the gdsc series has
   review traction.

2. mmcc_msm8660_unhalt_fabric_ports() silent-fail bug.

   The function returns silently on every "RPM supplier not ready"
   path (no qcom,rpm-msm8660 node, of_find_device_by_node() returns
   NULL, device_link_add() fails, dev_get_drvdata() returns NULL).
   probe() ignores it. The "downstream clients will be enabled on
   demand" comment is wrong: mainline GDSC does not re-issue the
   unhalt on power-domain enable, so a system where qcom_rpm has
   not yet bound when mmcc probes ends up with the MMSS AXI fabric
   permanently halted. First MMSS DMA (MDP / CAMSS / GFX / JPEG /
   VPE / HDCODEC) silently freezes.

   v2 will:
     - change unhalt_fabric_ports() to return int,
     - return -EPROBE_DEFER on every "supplier not ready" path,
     - return -ENODEV via dev_err_probe() when the DT node is
       absent entirely,
     - propagate the result through probe() so the driver core
       retries when qcom_rpm finally binds.

   The patch is in my local tree and on-device validated; I will
   roll it into v2 once initial review feedback on the rest of the
   series has had a chance to settle (and once the gdsc prereq is
   on-list).

Apologies for the noise. v2 is coming, just not immediately.

Thanks,
Herman

