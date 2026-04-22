Return-Path: <linux-arm-msm+bounces-104144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBLkHOrr6Gl4RgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:40:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF644803C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D180301F3CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564F535F610;
	Wed, 22 Apr 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I3yOT2OL";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="biNAIwn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB162344D8D;
	Wed, 22 Apr 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872405; cv=none; b=b9Ls+Yxl57q/bN5rYTMoJg10dAUraZ1ep2PNkceMRacchtCFtlUpxhXvRo/3I5e9c1hlRSwg24DPzv4utGgjiEhuHE69jyGZ6DfKeQIqs02CsZd/esP2u4h41uwK63RhAHhMitQJ6JtzkMTjdi5Z3kO+aDTJdcIeVYXzASaD+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872405; c=relaxed/simple;
	bh=9gKX/dxI9ejY9BMuk8Ox87ROhVh5y5LW1BVlzPuBiPw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bQBQ1CL5vDAJaYOQTVeFSigR7vzIXSGkqQEuvm8fo0qnZaYivOIdIA06l90Eo9ITCE/bYzi4AMENvp7iROZkvwbi51yL7A0uNJKRvRmn+RGz7bF5PcRWZpmYYAvPXCL3kePdMmjVkEGRsoLV9rmSo0r8MxoYhvxEmeBWkBbNmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I3yOT2OL; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=biNAIwn8; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776872383; bh=g1I41/BTPjfqTjdk61quZaP
	DHnhg6PF1mphfQR/IMDM=; b=I3yOT2OLrAUfOPNJXRzZ89ThFpleORtC498dMyxuXkV8CmSSMV
	l+F898JBDtDSEZveU0lUW2hnGzD7eOReQmtKQsh1wNf6goyqo42r94IkGOL7HQ7nOnImXU1O933
	GOu0KDzdFBGtG0Z11ZlEAZ21k+n0YaJjAI42OStJBY0+ndhiZCaYyslI1DPPL3QqUdDR4SdWxBY
	b/6ctYJnZhOu/Jfuy98q/FaJt55wIxCRlEJBdGI6Wj7J/4qxK6HIUdgvQRbqmpj4Gtxib/qPf6q
	1iuw2vYMuKlwWDxnnBEJOnlP2M/OrDi7l92jgAUVdM2ZxXsK9D6tlHJaWGIQRJ7TZ5A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776872383; bh=g1I41/BTPjfqTjdk61quZaP
	DHnhg6PF1mphfQR/IMDM=; b=biNAIwn80l/2GtaRzxUGO6/ojs21D21cTNcwD3MztiCCWKWcNg
	LDh4vn0Q0TQnwlUtMlF5ouvdN7uCpr/1c0BQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v3 0/4] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Wed, 22 Apr 2026 18:39:19 +0300
Message-Id: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfr6GkC/5WOQQ6CMBBFr0K6dkwptIgr72FclLbgGCnYQaIx3
 N1WNyZudDPJ+/l5fx6MXEBHbJs9WHAzEg4+QrHKmDlq3zlAG5kJLhQvcwkXM/RAtleKg7E0gk6
 n1TSF0YCdCFq8geVGV6oQvJSaRdcYXIxfO/vDm+nanJyZkjw1jkjTEO6vR+Y89f7dnHPgwIumr
 GQjainLXa/Rn9Gj79ZD6FgansWHWvBf1SKqW2Uq3RRms6n1l3pZlicEzNgLTAEAAA==
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776872382; l=2132;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=9gKX/dxI9ejY9BMuk8Ox87ROhVh5y5LW1BVlzPuBiPw=;
 b=q9LhPPBEmz+pEVfKg/Pu1Eas/KEb2iy7YlmqlNrLl5fCHCK/0aw/rM1l23qTtunaDumVkZ+S9
 0RUdlUfQE10AQfwvK1btMOxDTxSTAwiYxGeUT2pWX1CUGt7a7hMtWIA
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104144-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,msgid.link:url]
X-Rspamd-Queue-Id: 51EF644803C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces fixes that make FastRPC on SDM660 work properly.
Currently only the calculator_example test passes on both ADSP and 
CDSP [1].
Also assign adsp_mem region to the ADSP's FastRPC node.

[1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
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

---
Nickolay Goppen (4):
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node

 arch/arm64/boot/dts/qcom/sdm630.dtsi | 28 +++++++++++++++++-----------
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
 2 files changed, 35 insertions(+), 29 deletions(-)
---
base-commit: 6e0a8c0fe0818b244c6de3a449b3a7107808a459
change-id: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>


