Return-Path: <linux-arm-msm+bounces-110438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AZzDL+0G2pXFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39C6145E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 750CC3044579
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A22830C37C;
	Sun, 31 May 2026 04:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="rsOGEs7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABC2F8E93;
	Sun, 31 May 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200567; cv=none; b=c299hDrfGFch/Ji0wLyeKj00cuMo309jifTC9Mf0enNgnJjHejzhKAoLWZdIobp2+xGsqSuWPnyWvEeqmylUBwr7FD0oF23VtOVCfTTnvgEQWnjrnMYfRFM55WSmfVqscD79I8rotD6elmueFNsodypbbiWUgmOHcDgrtzgCYW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200567; c=relaxed/simple;
	bh=BWj2pViGtvI1piW9aB6/LHKSQnWiWiTeJCCJsCaRFXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqsunJZNeSjbFeRfnUDRhMtFzc5dig80y+Hevf5uwwKIUaOd24ng5iQJ5FPXfnb78bbDWEKif6yimzxc50Lhzomx3dPqnzEYGFGPp9ozfsxRF0FNunagrpxO6wOMIWSMOG9T5Y9fs7IC474ba59uTl49Q5q6TAG9+o1DapLXgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=rsOGEs7G; arc=none smtp.client-ip=136.144.136.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4gSkB665N0zrJ7T;
	Sun, 31 May 2026 06:09:18 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission4.mail.transip.nl (Postfix) with ESMTPA id 4gSkB54tTrz3R3nyb;
	Sun, 31 May 2026 06:09:16 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Amit Kucheria <amitk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	van Hazendonk <github.com@herrie.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH v2 0/3] thermal: qcom: add PM8901 PMIC temperature-alarm driver
Date: Sun, 31 May 2026 06:09:13 +0200
Message-ID: <cover.1780197411.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200558; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=+SyikEMIVA8xJyMKrrK6i1BzcUDkPTpbt93nBPr/Dbg=;
 b=rsOGEs7GGneDzB3zWp882m5elURRFNReZc9GzDSd44i6XZAbqb+r1559UpH+vklqy9hDl8
 rnHEnprEoRn2Ez1lS/+vT2reMPn351H8WaMAwkNA3u83cOH/QN7PuR6fodBfKHmrKnj3UQ
 DMGolPfSIHKECVEny12hMWuVm8U2pruDwQ3BFyNFECSZM4Uv2HeFh19FoG3e9orWIkZL2e
 PI8fdsZbDvRIDoUjd3RCEkUgwbL506msCAdYKtI0D338lwHs4IYBU7QHOnn3oBlrIflwcq
 /Hnuzvzj2FLffFu7iCEWUdkuhRj2xsMC2XkRxuzyLYuXd7WHSyTNQfFBylRbXw==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110438-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,arm.com,quicinc.com,gmail.com,herrie.org,intel.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CD39C6145E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Self-review (with Sashiko AI assist) caught issues in v1 before
maintainer review reached them; re-rolling promptly. v1:

  https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/

v2 changes:

  - NEW patch 1/3: extend the qcom,pm8xxx parent schema with a
    `temp-alarm@[0-9a-f]+$` patternProperty so the new sub-node
    validates as a recognised child of the PMIC. Without this, any
    board DT instantiating the temp-alarm sub-node fails
    dt_binding_check (CI bot caught this on v1).

  - patch 2/3: thermal binding YAML rewritten:
      * add `allOf: $ref: /schemas/thermal/thermal-sensor.yaml#`;
      * rewrite the example so the parent qcom,pm8901 node itself
        satisfies its own schema (reg, address-cells, interrupts,
        interrupt-controller) - addresses the CI bot's `'interrupts'
        is a required property` complaint on the embedded pmic node;
      * reword the commit message; v1 incorrectly said the binding
        describes the "GIC interrupt" and "parent PMIC reference"
        (the interrupts are actually PMIC-internal, and the parent
        relationship is the standard DT parent-child hierarchy).

  - patch 3/3: driver fixes:
      * defer the SW-override switch (which disables PMIC HW
        auto-shutdown) to the very end of probe and install a devm
        action that restores HW auto-shutdown on unbind, so the part
        is never left without any thermal protection if an earlier
        probe step fails;
      * fix the first-read temperature comment: the formula computes
        the lower bound of the current stage, not the midpoint;
      * snapshot chip->stage/thresh/temp under chip->lock before
        printing the boot banner so the values are consistent now
        that the ISR is live;
      * drop the explicit ->remove(), the new devm restore action
        replaces it.

dt_binding_check passes on both the parent qcom,pm8xxx and the new
qcom,pm8901-temp-alarm. Driver passes checkpatch with zero warnings
or errors.

Thanks,
Herman

Herman van Hazendonk (3):
  dt-bindings: mfd: qcom-pm8xxx: allow temp-alarm subnode
  dt-bindings: thermal: qcom: add pm8901-temp-alarm
  thermal: qcom: add PM8901 PMIC temperature-alarm driver

 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  |   4 +
 .../thermal/qcom,pm8901-temp-alarm.yaml       |  90 ++++
 drivers/thermal/qcom/Kconfig                  |  12 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-pm8901-tm.c         | 408 ++++++++++++++++++
 5 files changed, 515 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
 create mode 100644 drivers/thermal/qcom/qcom-pm8901-tm.c

-- 
2.43.0


