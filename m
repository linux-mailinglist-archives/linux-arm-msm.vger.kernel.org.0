Return-Path: <linux-arm-msm+bounces-110430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIvkL7q1G2pVFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:14:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE261467B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 252353034BE9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A282F9C37;
	Sun, 31 May 2026 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="L9MogA63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE01118FC97;
	Sun, 31 May 2026 04:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200552; cv=none; b=fSr/r6GT5XBzQtKrKi/VyFqkJwu3BbDAURxLj70F8s97rczVx/ngTRdhbjDnmXH9BR+RjTjCbco4N45P5sVpsb0WvG76BNllcET9T2uhT/QmyUXsNVQU103P7rQBqHRZUJIl0ecBRqt8vklpKZeho/FKsFoQLFD3QGl1pKSIruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200552; c=relaxed/simple;
	bh=xoUwn38H9GawF5YvrH36v0ZDTvRmkLCfKCp5ksGopes=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNzQX+2zGVSpPFqYGyAVcRQDcCqL1v6Wj8KIcoNCgUnlsATNrx7peWwsvDe6XaXHCx8reLJsgmqvQMh4k99YJVtk2LgFjoGSysWhkMCuAlhH15OfFyx98Js7G105p47h+LKz9YmIsj7BSZGxamueDg89hEvEMwczfp02uZq17GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=L9MogA63; arc=none smtp.client-ip=149.210.149.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gSk9q3lFDzYdtc;
	Sun, 31 May 2026 06:09:03 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gSk9p50Jvz1g92mY;
	Sun, 31 May 2026 06:09:02 +0200 (CEST)
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
Subject: [PATCH v2 0/3] clk: qcom: add MSM8x60 LPASS Clock Controller
Date: Sun, 31 May 2026 06:08:59 +0200
Message-ID: <cover.1780197511.git.github.com@herrie.org>
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
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200542; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=sem2EJz+GUEFSEJmBaAWhgsqjpE7SXQxYB+1kJ/qnGs=;
 b=L9MogA63x3NkYZMLrRYv9dNu0y1sfNsbg2lsTv2geV5xc94e9U1kyVncD6epHia2uxar1/
 yfYNktGvcVDSP7K/ispzx+qKdJJvD0wdS2InqIaXEYamXapmdmpy+ORn9iDqiYR6fhOt4q
 4svgl707pEKw7i3riUrkTiK2QROoC0KzbylQX5bUutP7YWLlVDu/LTnVzUyODxj9fe1UdA
 XaS+ZrBQlat0AV5WCrNxtJm/LeFaooq9WWh3wSPBmfcL/9d4YPUJvHAGK+xXVOK/UZa0+N
 p9kGG9+tTsU+3hdJcp0WRzOKd6yCoXKVmN+wh4FiKMSXH4C5ra/OyB83RJenOg==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110430-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 29AE261467B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Self-review (with Sashiko AI assist) caught five issues in v1 before
maintainer review reached them. v1:

  https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/

v2 changes:

  - NEW patch 1/3: extend Documentation/devicetree/bindings/clock/
    qcom,lcc.yaml with the three MSM8x60 family compatibles
    (qcom,lcc-msm8260, qcom,lcc-msm8660, qcom,lcc-apq8060) and add
    them to the existing apq8064/msm8960 conditional block. Without
    this, board DTs using the new compatibles fail dt_binding_check.

  - patch 2/3: dt-bindings clock-ID header for lcc-msm8660,
    unchanged from v1.

  - patch 3/3: LCC driver. Five fixes folded in:

      * CLK_AIF_OSR_DIV macro: divider width was 8, which made the
        bit-divider field span bits 10 through 17 on the _ns
        register. On MSM8x60 BIT(15) (BIT_DIV branch enable) and
        BIT(17) (OSR branch enable) sit inside that range, so any
        clk_regmap_div read-modify-write would clobber both branch
        gates. Width 4 (bits 10 through 13) matches the standalone
        mi2s div clock and the legacy downstream Samsung MSM8660 /
        webOS clock-8x60.c register layout. Added a block comment
        documenting the verified bit assignments and the rationale
        for the width change.

      * Match table: add qcom,lcc-msm8260 alongside the existing
        qcom,lcc-msm8660 and qcom,lcc-apq8060. MSM8x60 covers all
        three variants.

      * clk_tbl_pcm_393: add the 27 MHz PXO fallback entry that
        clk_tbl_pcm_540 already carries, so the 393 plan can also
        fall back to the board PXO source.

      * lcc_msm8660_probe(): check the return value of regmap_read()
        on PLL4 L. v1 ignored it, so a regmap failure would have
        left val as uninitialised stack memory and steered the rest
        of probe down a random branch. Use dev_err_probe() on
        failure.

      * lcc_msm8660_probe(): assign the freq_tbl pointers on the
        static clk_rcg structs unconditionally on both PLL4 plans
        instead of mutating-on-540 / leaving-mutated-on-393. The
        driver is effectively singleton today, but explicit
        assignment also restores the defaults if the driver is ever
        rebound on a system whose PLL4 has been reprogrammed.

Thanks,
Herman

Herman van Hazendonk (3):
  dt-bindings: clock: qcom,lcc: add MSM8x60 family compatibles
  dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs
  clk: qcom: add MSM8x60 LCC (LPASS) driver

 .../devicetree/bindings/clock/qcom,lcc.yaml   |   6 +
 drivers/clk/qcom/Kconfig                      |   9 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lcc-msm8660.c                | 551 ++++++++++++++++++
 include/dt-bindings/clock/qcom,lcc-msm8660.h  |  48 ++
 5 files changed, 615 insertions(+)
 create mode 100644 drivers/clk/qcom/lcc-msm8660.c
 create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

-- 
2.43.0


