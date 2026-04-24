Return-Path: <linux-arm-msm+bounces-104438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLi8LmpR62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:18:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B90945D9A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15E173003EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547833A6B93;
	Fri, 24 Apr 2026 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="L+7aa9hK";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HyDBtfgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CFB3A640A;
	Fri, 24 Apr 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029201; cv=none; b=l1EiXsYW8SFs0tINL5te9WhyNvEmNf32wQhRiXJLaaGkhJw/ENhggMF10U5j8QbZhFZczpIe+c/XeREL1040onwY6fDDPYibDwemR8xmswkeFt9I/4/1TDnBwP3NcDGkXev4hSD/AAcfXclDoJ6s7z3fghlUcCok9z6JhZSBBH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029201; c=relaxed/simple;
	bh=fPRMXotKAqjG5CuiVi3+iqsK+z75gCcEd1refg3DKoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K9CoPlvrr1sgVRg5bm+x9wn2pNNJzq826K3tQHBntZ9DDdly+yxLYlFw5ZfKzefWrtVLTY8zUnSZOEnmdxUZ1ygGbxs9TBzxY/JVw1ZQOZYgcNCjN/4uechYPsyxyi9xCpHXFxjnt+G5Dj4STGZaDJN0BT+9/FO9M7R4xbRt8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=L+7aa9hK; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HyDBtfgB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1777029186; bh=nJofsZEGH77Zf1eEi8XoBF/
	dWVQqmtMQ85+X9ZmCxNE=; b=L+7aa9hK1IWVioWqO53AQH4Bu9p72RXlRfOj4YXZoJjc+Br1Ad
	ljEhesA95TfL6syIHN3LWAEdZFP8ifn/JZLuwWZ6sfyTVU7YUxzt/dfQsPkC7ZxiTgAUEUSKkq4
	JucWEcUS9ifXD2VUy0qmFSb4mTItvCh4PkI3amtLsXwy8klvqmM6yj5mDJlCYtbJqWU14mEGkA1
	4WwgCGczq5IOQTDAJ0qtPhe8j97KCJwIfKNnQjJfamWF2Gc8TqAou8BlPHPbLkOada5tnz8nBkS
	Bh4twkP96CoOhPKu8P0Fi5Zs1wfjmMiETRejYsVOo2DlT6SO3sS3S90Bx+xCFcdDQXw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1777029186; bh=nJofsZEGH77Zf1eEi8XoBF/
	dWVQqmtMQ85+X9ZmCxNE=; b=HyDBtfgB1aiK+jHTW/KRQ5/qC07REfPxp03dBg8l8I03wnXgs2
	cuIkNm+BncwOio193I2eJ7IQ7agw8dX9/3Aw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Fri, 24 Apr 2026 14:13:02 +0300
Message-Id: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5Q62kC/5XOy07DMBAF0F+pvGaQ42fbFf+Buhg/kg4iTrBDV
 FTl37HLphIsymakOxqdO1dWYqZY2HF3ZTmuVGhKNainHfNnTEMECjUzwYXhqtPw4acRShiN4eB
 DmQHb6LEsefYQlgI9XSBwj9ZIwZVGVq05x7q+9byefnL5dG/RLw1vF2cqy5S/bo+sXbv7b+faA
 QcunbLaiYPW6mVESu+UKA3PUx5YK17FHS34o7SodG+8RSf9fn/AP2l5T4tHaVlpYZVDaTsdHP9
 Fb9v2DX3WA3GnAQAA
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777029186; l=2524;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=fPRMXotKAqjG5CuiVi3+iqsK+z75gCcEd1refg3DKoE=;
 b=UNQX7MNP9bg4ineC0n5yTL4P54CvP868TTgx1NcEsyXTKbXvHMO6CBxDGB//+Hu14dRcGTP0G
 zOjYPAQPNbsBgXOsFgo1wH6LPQOaGJvgy7qtVZfkpgwRuca4jJpfmuF
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: 3B90945D9A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-104438-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]

This series introduces fixes that make FastRPC on SDM660 work properly.
Currently only the calculator_example test passes on both ADSP and 
CDSP [1].
Also assign adsp_mem region to the ADSP's FastRPC node.

[1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
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
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      dt-bindings: firmware: qcom: scm: add CP_ADSP_SHARED VMID
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


