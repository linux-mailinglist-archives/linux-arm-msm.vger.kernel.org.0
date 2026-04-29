Return-Path: <linux-arm-msm+bounces-105165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPj8IrfQ8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:34:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D935491FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DCCB30DCEF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6089F3C3C1A;
	Wed, 29 Apr 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SJqp01h7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5Q/MWX61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9A3C060B;
	Wed, 29 Apr 2026 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455031; cv=none; b=T5J+0G32OWz1lQitxU2g5rRY+DAElnj/B5p/2V6OMgb6RnAqZhFk/ywcwz5tH4JFGBGBSSUq03SpnN4pZSYJgzw5tGXWTfM9f1p+gAsyyttI50yEf4ZyBPenJsDmtJdS3CKApB9dl/+flWPqF2yX+wBpqkPTLqo3vey7jc+F4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455031; c=relaxed/simple;
	bh=xRErcKPQnoGFO/OuoFMb+jcfuLMIcQU35H8D5CzakEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZhE3trlgs3ClMzSXZt2nRtIN+iaLu4MsKbCpf4p12xdKbUhpn5lKTeSNEmyn6NDTMyi2qBZnQphA0HjFMzYxai0MUg0p7M61gWuXtQpM79VMmQp6TWxwuokF4tpjPTIKoyLS5AcqEk2MWDh2ac1CKlPYhxiqg7lssH2b53ZDv18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SJqp01h7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5Q/MWX61; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1777455012; bh=us61U4dauSW9BvRwTbffQGU
	gfbtB4S9QeDn8Q3GvZ5o=; b=SJqp01h7TUzWixGXVpL5hGL/hY0JblECHjPFnwAZY8ez+oybL0
	H0CrTmJLC0M6E/b//oXj640Yfg/3jOMhKRlGGGrwShUpHvChxcLVqNiPc+2Uc1W8i0H8ASSr/DO
	8gviWdUvvxMeFjxVy2A0RFhhaOG2jSWr5Eclqkz7mlXqd4JyALDysw4bctFFHL/6A6A4XnaHmzn
	JHskj2z1L3Apzghgoh2KpaMX/Nic5/BrUWz7+ndVcJu2fXLuSdzg3UTnniYhQkMzE95KZ7gw54y
	LbZcTqIa5YaZGcWSQIAuUr0VdOlOnWh427P5njcg/z4eOvyCrQItR3XUJngQwfBtAMQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1777455012; bh=us61U4dauSW9BvRwTbffQGU
	gfbtB4S9QeDn8Q3GvZ5o=; b=5Q/MWX61o9jo8ydrVV0IN3yE7hwVw6UgO8uZQqGRqsW2gX61u/
	e89VSTDUf0obBfNeLk+RGG4YuFB2FmkFi7CQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v5 0/5] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Wed, 29 Apr 2026 12:30:07 +0300
Message-Id: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/P8WkC/5XOTU7DMBAF4KtUXjPIGY/tlhX3QF34L6kRcYKdR
 qAqd8cpm0h0ETYjvdHoe3NjJeQYCns53FgOcyxxSDXIpwNzF5O6ANHXzJCj4tRI+HRDD8X3SnF
 wvoxg1tGaMuXRgZ8KtPELPHdGK4GcpGHVGnOo63vP2/k3l6t9D25a8fXiEss05O/7I3Oz3v23c
 26AAxeWtLR4kpJeexPTR0wxdc9D7thaPOOGRr6Xxkq3ymljhTseT+YhLbY07qVFpVGTNUI30lv
 +kKYtTXtpqnQIEqVWpEjjH3pZlh8OW59+AgIAAA==
X-Change-ID: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455011; l=2735;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=xRErcKPQnoGFO/OuoFMb+jcfuLMIcQU35H8D5CzakEU=;
 b=32wlkg4Ws+nxg3L7pBLlSHJfbeoee7TP3jbl6LDNSC5SvsidYfCMs0yIjs4oJjiDYW2i7VPbt
 sjNLEje8XYQCPA0GMgdsK1kgGiCG4jW9cKSycZjwqP9xaNPXBEaBhV5
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: 0D935491FC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105165-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series introduces fixes that make FastRPC on SDM660 work properly.
Currently only the calculator_example test passes on both ADSP and 
CDSP [1].
Also assign adsp_mem region to the ADSP's FastRPC node.

[1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v5:
- Changed alloc-ranges of adsp_mem (Konrad Dybcio)
- Reordered patches
- Link to v4: https://patch.msgid.link/20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org

Changes in v4:
- Added CP_ADSP_SHARED VMID to dt-bindings (Ekansh Gupta and Konrad Dybcio)
- Added Fixes tags
- Link to v3: https://patch.msgid.link/20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org

Changes in v3:
- Brought back patch that changed adsp_mem to reusable (Ekansh Gupta)
- Changed adsp_mem to dynamic allocation (Ekansh Gupta)
- Fixed alignment of the vmids property of adsp
- Link to v2: https://patch.msgid.link/20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org

Changes in v2:
- Dropped patch that changed adsp_mem to reusable
- Added vmids to fastrpc subnode of adsp (Ekansh Gupta)
- Link to v1: https://patch.msgid.link/20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>

---
Nickolay Goppen (5):
      dt-bindings: firmware: qcom: scm: add CP_ADSP_SHARED VMID
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node

 arch/arm64/boot/dts/qcom/sdm630.dtsi    | 28 +++++++++++++++----------
 arch/arm64/boot/dts/qcom/sdm660.dtsi    | 36 ++++++++++++++++-----------------
 include/dt-bindings/firmware/qcom,scm.h |  1 +
 3 files changed, 36 insertions(+), 29 deletions(-)
---
base-commit: 5a154741a8271f2db906ed4c33a55a1c83e84da1
change-id: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>


