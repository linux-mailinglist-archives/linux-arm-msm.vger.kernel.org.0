Return-Path: <linux-arm-msm+bounces-102395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAksCTAT12kSKwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:47:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9383C5AC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 462213096CFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 02:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5E736CDF8;
	Thu,  9 Apr 2026 02:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="U3kNLGRX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05C6367F4F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702549; cv=none; b=mkCLn5IdwpfoZ2/2k+KaTW3TwBRkzqFLUBT2P4GNIEnT+MgLP4LI1c7hWrWGbW1J1xsHa5uHYbrMJk0vtntDPVN3Tsj9YB1JIKO3cQjdbiTWnUmUey8fya4l640I08K/L/18AbaA0OLhv4RO5qRb8jWIrv48ATfmvu9ux3lyEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702549; c=relaxed/simple;
	bh=fOcr/7mBz1Sen5Zu/vhR6WZBAfKDprmnT8KTucqA5Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhwmJRki+atRwcc2/wXwaT4s1ssxpIUuYdFFWZIk6cd1qCysNp/kIU0X2BDrbhjkpmSHWk5D4Ao8DYQp9xZjoToj9A/A1/q1+cE/+V502Xmc4tIcCbqtI0+cejr/fPvPlZ+PyvAIm8ikaz5ntFNyI03WkNiX9d0W0gQCPLSjE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=U3kNLGRX; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775702545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oiArMNH1scHIHb4vGHz83I/PRfi65XhkSgmiVQjhohE=;
	b=U3kNLGRX34eiaEI2XOfPqsWHWhh7UXcuLHTAq+RWnQ2noyjLzEGqDagShK9/ZBAiM6YLrQ
	wivBL8YPIjNIk/gvEygFTl/xNXr5ahrSH5K+7vDX4fqaZe37gf03LFcQ9QeVS2sNh5Bc5J
	aO2++TGAyo2ARloLggatdHeO64BeFMCUgt7wRXlXkhE9dtn9e4MV4utY4qnYJTbELsi3SL
	Nt+fP7rpVyaQ4iM+lo+2DGaJtsJCldeufx9isg1+coyK3NUMgtoxlAGWCLvz0LDYiKmVoH
	KWVcuh3b4bxGAYczqfY9QkshziR8F4sjpw80cnokDJaCY5G3mQdIiW3auSvRVw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 08 Apr 2026 19:41:15 -0700
Subject: [PATCH 4/4] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
In-Reply-To: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775702528; l=743;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=fOcr/7mBz1Sen5Zu/vhR6WZBAfKDprmnT8KTucqA5Rw=;
 b=ZqGfUBv92qnTjnsx3KsufSh1RpTYO5j8Xi9mVtt+7PvCxM41zKVPJELiMbhksxyu9zCFaPrBz
 dSVQqQxDwhRBNRb6SWiecY0fe2J34QZ013bei/cUSdDAPlRnqQ7/9jh
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102395-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: 7C9383C5AC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The WCN3990 firmware for judyln does not respond to the request for
host capabilities. Add the devicetree quirk to skip this request.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 86cf4eb44084..e0c3566761bf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -694,5 +694,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
+	qcom,snoc-host-cap-skip-quirk;
+
 	status = "okay";
 };

-- 
2.53.0


