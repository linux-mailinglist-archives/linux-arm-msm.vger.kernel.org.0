Return-Path: <linux-arm-msm+bounces-94635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNHQBC5jo2myBQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:50:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3071C94A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3928E31A101E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16E73009D4;
	Sat, 28 Feb 2026 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WwsxoxIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C83A2FBDE0
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 20:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311647; cv=none; b=SsjggndK47Scst6pUFp5KMWb19gBdjq5H2Up/lmeIea7dhqq6GWZBsRAQGqMCZcmh5R4wCGxLlydKLc04s9Wfmjl7cLwH7PthSG3S5Ui8CLzxO3b4cswCGQspzOVNgxJUoT60OvTYiIwr5kTPa+P7iYtrSJDKgqOxzRYZm/x7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311647; c=relaxed/simple;
	bh=wpilwaKapWp43wsjfCFYHhbY0oyQXChRrcmHY3NSCQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N43lFlM2zEwJk4kbaS2dEDH+XNpy4xmSB7c6qSSlUJTYxF3zIVWvD4KCJGUtVKEp299ElTPVwa1qJATs4/LHIKjvtlQXTr44Tn7TejekZqBolvQIeRcK8pTUlIv3QjRo27kfq/x0RlcBFA9S3F8YtRHlK0MTXRlgsRS/v2e98XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WwsxoxIG; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JY8ah5sntkqwYsnjRryTUayuLGKdO7gmIkWN0EIBh8Q=;
	b=WwsxoxIGhM4p6ubmxG95hoOAI1yTdJ49aE2SpnU7ZKX21oAS0H5KAgbS+qCvxef4z/iA1R
	513TQ7qSVX5Rrch06cm0vP84t41yIMNTsZ+aCsTe7zzdJVAkgl3L5nIUk4RrkyEFAjlYPc
	uTDev8DLe7Qen9D2XauFK2sHlAYZBmbpDKckGe3FWL3SLcmPIAuvRiGyC/whRRSysKGJUD
	NmTq9GIl4PdzBTyt2REJawNtNm8+rJ+izDYrUy/oPdP0qNKy2hqNDr1O+dDkSGWaXRMl6x
	jiC8Yh3XBmsbgLB/jsLxZOmAcmbftSiAqYp7LsA7eAvlmxVtcpwOR4m2TGLQ8A==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] SM6115/SM6125 MDSS core reset
Date: Sat, 28 Feb 2026 17:41:26 -0300
Message-ID: <20260228204638.11705-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94635-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-0.749];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 6B3071C94A2
X-Rspamd-Action: no action

v2: Collect R-b/T-b, expand commit messages to describe the issue everywhere
v1: https://lore.kernel.org/all/20260216233600.13098-2-val@packett.cool/

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


