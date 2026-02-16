Return-Path: <linux-arm-msm+bounces-93017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FyIFGeqk2lE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:38:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FB14818C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1974C30137A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1552BE65F;
	Mon, 16 Feb 2026 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="aJqt4bdh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B15C2773E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285092; cv=none; b=EMVfkQ5SDJo08X0DvkbGIKy6ZLGqFchKZ/OnMU3WagGPpG6kF1C0JY8INoj/yrOzfGcCNqFwPOEm9DzOm4Q1HSY1xU/197aMDDXJGqCNaGP3CZKX7O5z3hRH2NmAng98hMd8ZhkL5wAOnIlItnRiC2vN8H35ZDqmO1zQw8CNW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285092; c=relaxed/simple;
	bh=Mw5K5QADh+7LE6DqXjqFWFNs/csR7Jd3+CYWDEyGOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHunFhEcITbCxch8WBxsduHJDHZDZuY57+QnBeNcWLiASBLjgg4j6TKHKGa9joxstKtjg+2iTJNGVKpyzHbOUpiwCSWRwwPOx4zSQLhdTvLORHOFQVwYi7a5vTjqis2ulvtWEEwpdU0vjgczIhL/Tvg6PMHqIUuMVala1yYZtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=aJqt4bdh; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJ5Jj5HBJFB5fWYT/WNdd+bAwmIY3J0yf3LkgRcOblI=;
	b=aJqt4bdhpSGIIJEnJ9c9qwkBu52uyTykkIn0MG/0T7m3GYjnm7C0cU9FYfJvhWNdUIYZlB
	ZirnyNOT1zQ5McC+wy0I9Bhyc1cEjD8xwLFouQ+FFNbQZS62MIRVjPCuhW2BLZ8irKejhn
	AUQNW2kGFYXTAA/V4BGNmxAb8G6h8N1j3UWWVAk+5vCL1woE28ojPDz0zMOXfdGToynYcl
	uA13khxv3+nVNIP6PNwF1HCkHiPgZhcs5BrgzbjEJ5qKJjPjYtOF3N5WD5LU+B+ccDvIjq
	9GCKPzs4KsKaDXNlRV7UKD2JTqcYojUIz0dCwfK1Bv8bzqquK72HXsnooxzd2g==
From: Val Packett <val@packett.cool>
To: 
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] SM6115/SM6125 MDSS core reset
Date: Mon, 16 Feb 2026 20:25:18 -0300
Message-ID: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93017-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 666FB14818C
X-Rspamd-Action: no action

Hi,

this series is like [1] but for these two SoCs.

Yeah: same person, different SoCs, same cause, different symptoms :)
On the SC7180 WoA device with DP out, it was causing faults+artifacts
due to EFI framebuffer scanout not stopping when Linux takes over. 
This time, the reset was necessary for MIPI DSI display to work *at all*
on the sm6115-motorola-guamp (Moto G9 Play) phone (DTS coming very soon!)

With the state left by the bootloader, the display would stay gray. DCS
setup commands would go through fine, some `dsi_err_worker: status=4`
errors would be logged after setup a few times (not continuously) but
the display would not start working. With the reset, it works fine!

Since the SM6125 is closely related, I've done the same for it as well.
The QCM2290 already does have the reset.

[1]: https://lore.kernel.org/all/20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com/

Thanks,
~val

Val Packett (6):
  dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
  dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
  clk: qcom: dispcc-sm6115: Add missing MDSS resets
  clk: qcom: dispcc-sm6125: Add missing MDSS resets
  arm64: dts: qcom: sm6115: Add missing MDSS core reset
  arm64: dts: qcom: sm6125: Add missing MDSS core reset

 arch/arm64/boot/dts/qcom/sm6115.dtsi           | 2 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi           | 3 +++
 drivers/clk/qcom/dispcc-sm6115.c               | 7 +++++++
 drivers/clk/qcom/dispcc-sm6125.c               | 7 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
 include/dt-bindings/clock/qcom,sm6115-dispcc.h | 7 +++++--
 6 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.52.0


