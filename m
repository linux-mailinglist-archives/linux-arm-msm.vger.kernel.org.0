Return-Path: <linux-arm-msm+bounces-111247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7wDtDSCqIWprKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:38:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D26641EAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:38:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=TRx3Isv3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111247-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111247-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCCCB3327F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202A6481FC0;
	Thu,  4 Jun 2026 16:24:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDA247CC85;
	Thu,  4 Jun 2026 16:24:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590246; cv=none; b=X8DyMfqZUOzbSEjlL4Bzoe1S1tufk+44Z6Tkg4/ejTGvYroJQe88ES3FK6+g3y5v1xUUV5o4vcsEdlzO3/ACE6iuXYYPtjVuyjweb4Ey8y+3e8m1UWCQGgK7J1XdQfXuulDHAWTP60VL+Um0sr8pjnUBXyc3JmcIG3J4JuC/vEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590246; c=relaxed/simple;
	bh=SBvnHb6iD4K9e0nTAI5eCm/DuFBRKdrcxce09SGUZm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0KNUGG2dMCmesxmezSy7xaSdwHjemfSYKNejPJze9e1xHakyu+0WqY9kPYte7uAP8Z+8FFv8RpdSLwP+7yRWOfIpfzOWms6pGWoJSgpAD1gOnIYw59svVm1vygw/0PkRKJ8OqlfsEy/T4agn2LYZwvBJWIC1Ei+JoU7wBPrBOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=TRx3Isv3; arc=none smtp.client-ip=149.210.149.72
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gWVHs2kffzRhrs;
	Thu,  4 Jun 2026 18:23:53 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission5.mail.transip.nl (Postfix) with ESMTPA id 4gWVHr5k7nz2pRDjq;
	Thu,  4 Jun 2026 18:23:52 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	andersson@kernel.org,
	lumag@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH v2 0/1] phy: qcom: usb-hs: program MSM8x60 vendor ULPI registers on power-on
Date: Thu,  4 Jun 2026 18:23:51 +0200
Message-ID: <20260604162352.569269-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780590233; h=from:subject:to:cc:date:
 mime-version; bh=eWosNrIPffNzXLxJBdRQpwyNybJCVtLFhI//Otd5F6M=;
 b=TRx3Isv3qAJjZTdyGOLjEwnBzecALBA/VD8CJgiqPVbEGk/OwnIgOH0ANlZ33IoEVeV/vH
 bAe15NFaGJ00JkPnNQHboEyWiCq3ZXJD51n3iQQtImGK9kQPySnYSG9Sk8YKM6Tj2vn3/K
 zivwLgnrDNbPA28IJT1DyZjVNkONBH8GIo2SdBEdlOADVkR4zr11CB++esYplJGVDuZBIX
 Z6aHhApkRbxFG21AO1mzDhxJL6+79wfqNlr1kPQjqyrOArWb/nyHfcFC2xQXKaPK/5qXFP
 TYqtyeo1rS40AtaeEh6P9xSFF0X/DsySC9zKtCpZf+OInusE2GDhqyfDlVJDQQ==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-111247-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:lumag@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[herrie.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:from_mime,herrie.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D26641EAA

v2:
 - Drop the new "qcom,vendor-init-seq" DT property entirely, per
   Dmitry's review.  The values being passed in were
   platform-specific (identical across every MSM8x60 SoC) plus one
   board-specific value, not per-device.  Move all of it into the
   driver.
 - Drop the corresponding dt-bindings patch (the binding gains
   nothing in v2).
 - Hardcode the values in the driver behind a runtime flag that
   only matches "qcom,usb-hs-phy-msm8660":
     * reg 0x32 [5:4] = 11b  - pre-emphasis 20% (platform-wide
       across every MSM8x60 reference board / HP TouchPad / HTC)
     * reg 0x36 bits 1,2 set - CDR auto-reset + SE1 gating
       disabled (also platform-wide)
     * reg 0x32 [3:0]   = 5  - HS driver slope.  This is the only
       board-specific value; HP TouchPad webOS kernel uses 5, HTC
       MSM8660 ports historically used 1.  Since the TouchPad is
       the only in-tree MSM8x60 consumer, the value is hardcoded
       with a comment noting that a per-compatible override will
       be needed when a second board lands.

 - Comment in the driver also calls out that HTC vendor kernels
   additionally write 0x0C to reg 0x31.  The HP TouchPad webOS
   kernel never touched that register and USB is stable without
   it, so those bits are omitted until documentation surfaces.

 - The companion DTS patch flipping the TouchPad PHY compatible
   from "qcom,usb-hs-phy-apq8064" (a different SoC) to
   "qcom,usb-hs-phy-msm8660" will be sent separately to the ARM
   DTS tree as that's where it belongs.

On-device validation (HP TouchPad / APQ8060):
  - Booted with v2 + the DTS compatible fix.  PHY driver bound,
    msm_hsusb HS link came up at high-speed, BC 1.2 charger
    detection passed, UDC configured cleanly.
  - 200 MB scp device->host + 200 MB scp host->device, with a
    concurrent ping flood running in parallel:
      - both transfers 19.1-19.3 s   (~10.5 MB/s, the CPU+stack
        ceiling for USB-net on a 1.5 GHz Scorpion)
      - md5 round-trip identical both ways (zero corruption in
        ~400 MB of HS traffic)
      - ping flood: 60/60 received, 0% loss
      - usb0 counters: 0 errors, 0 dropped, 0 carrier losses,
        0 collisions across 151k packets / 220 MB
      - dmesg line count unchanged (no link resets, no PHY/USB
        warnings emitted during stress)

The on-device test doesn't measure the analog effect of the
pre-emphasis / driver slope settings (that needs an oscilloscope
on D+/D-), but it does confirm the writes don't regress an
already-stable HS link.

Herman van Hazendonk (1):
  phy: qcom: usb-hs: program MSM8x60 vendor ULPI registers on power-on

 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)


base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
-- 
2.43.0


