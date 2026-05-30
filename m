Return-Path: <linux-arm-msm+bounces-110380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKAVO2vtGmpl9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:00:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF860D160
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D80B7300A4F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807D82D877B;
	Sat, 30 May 2026 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="hKT9bd0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929B28852E;
	Sat, 30 May 2026 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149608; cv=none; b=oTe/lUEenxFKOmU1OIv622BGvLKqE84phH14JEyWfV1/+ZwuJM8JsOAhv6CpBPMPmj79dlxXpOnqAcsv6/sXvPg/0we5AT1kymssq+DK9vPKUpALa3wH8qcMaWNFtjEYYX2GzJvtWr4KXj916bya4kdz3wc+edKIy75TcN2yz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149608; c=relaxed/simple;
	bh=SfntRBquUTLwHkwcATy4frzMHYwEPsXqjXMqldvcvZw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=F92op7njxVSWRfPu6skypxPYZq2Ob6oXWFAp07wxl5xeEa4RcFFwUFDzBBTs3rwZ1XQat01rvuvmioMz4GdT3tT47t7x6gjPD1EEy9avWUOXi2q04XUMqTntTjXTgZxcOuEQNL/Jrr5BMceEABSrnYbhhdzrzo0ii5Trx15fwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=hKT9bd0M; arc=none smtp.client-ip=136.144.136.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gSML76lxPzkQNZb;
	Sat, 30 May 2026 15:59:59 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission5.mail.transip.nl (Postfix) with ESMTPA id 4gSML72n5wz2pRDjH;
	Sat, 30 May 2026 15:59:59 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/2] clk: qcom: add MSM8x60 LPASS Clock Controller
Date: Sat, 30 May 2026 15:59:56 +0200
Message-ID: <cover.1780148149.git.github.com@herrie.org>
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
 s=transip-a; d=herrie.org; t=1780149599; h=from:subject:to:date:
 mime-version; bh=bDNJtYIKqAXGfVDLt8vxmYCmjiMIq2LFxwX7WsDZzXU=;
 b=hKT9bd0MKxa0qZ1iD7XVWXn1qDd+XVQrYX13yM6niO1wgxBVGsDq6IUOdTH7Sou8qyHmbp
 TzTAmKbWaoRnnFQ3HL82nhvsQ8eqP/DrDi3x3t4Ye8SJZ6+QJHaVbKR8qcROMooNXLQd4H
 q1gg+/oRiDVOxTnTdDakDkQea//v2j2MF7IpU9XH0sXabI5311HDz7qw6nJichhKn5NcK1
 STjPbhz9FjnN+aTX7UxLlN8FmvYeH8TfOY7djb6ZYLQexfRRBYNZY9a0njZUVLo82H5GGj
 VuE3dCRM1K2wgjxDeWPPJ/DJig5mVTQiG1P1BJJDpLg8k5/ZRsPFwZ9SdHjRQw==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110380-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 65DF860D160
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series adds the LPASS (Low Power Audio SubSystem) Clock Controller
driver for the MSM8x60 family of SoCs (MSM8260/MSM8660/APQ8060) - the
Scorpion-class generation that preceded MSM8960's Krait CPUs.

The register layout, parent muxing and divider topology of the LPASS
PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
driver is simpler than parameterising lcc-msm8960.c. Both drivers can
coexist (different Kconfig, match table and compatible).

Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP needs
functional MI2S / SLIMBus / PCM clocks before audio playback or capture
works.

The new binding header is dual-licensed (GPL-2.0-only OR BSD-2-Clause)
per current qcom-binding convention.

Companion to the MSM8x60 MMCC series.

Thanks,
Herman

Herman van Hazendonk (2):
  dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs
  clk: qcom: add MSM8x60 LCC (LPASS) driver

 drivers/clk/qcom/Kconfig                     |   9 +
 drivers/clk/qcom/Makefile                    |   1 +
 drivers/clk/qcom/lcc-msm8660.c               | 517 +++++++++++++++++++
 include/dt-bindings/clock/qcom,lcc-msm8660.h |  48 ++
 4 files changed, 575 insertions(+)
 create mode 100644 drivers/clk/qcom/lcc-msm8660.c
 create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

-- 
2.43.0


