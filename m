Return-Path: <linux-arm-msm+bounces-106049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9hNsD2a1+mk1SAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 05:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AFE4D5E21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 05:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F1E5301545F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 03:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C039D2D8376;
	Wed,  6 May 2026 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="c5TUUfvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B75926B2CE;
	Wed,  6 May 2026 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037775; cv=none; b=AweMTaOce88yc6EJwO4F8AxAp6POG/Yw4Oq3p4ochTAyJ3IG+okz5qKanYVtVPugseAjLcu4u5RWJarVPMGCFv1k+iLpmpoJCfDorwZ12W9vkX7FYxvQbll1XxhaiKWE2q0Dp8KYdGJbzMFjmMlr7lOskhch8mxl/o8rq9VR7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037775; c=relaxed/simple;
	bh=xEL5X3IZ57dh0eb77WJAth7tHSF+GkeapUEPn2eP7Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhV0F2uF7VELx5uKYeNKWHkJt5Uvf1KqoqNBXgMeejLA5a8yxBXa0hG0l4JBb/hsngWbO0g+V91QtgVHPvylGP9FizgyOvRN3ViCjsUZb+resmFdhH7iW4ioSl4W+pnU1xZ6O7pn2JU+WJcirKAAi2boZtm+6nzSbWba+pg0jqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=c5TUUfvr; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778037771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VxBnGaW6GmFsh6ws8vX6h0ilXdjZ9ivbVBafazBpfV0=;
	b=c5TUUfvrpAvlqo+T6SMi+4YGXJcqUklxGhn3XwfefrTWohZGK6S3cethYhU1DYsdj3C4Gs
	VAS+cSQa6d4IBhRxj+sDSm+RTu0Ey4j+DEo+vwav5fVW5guJYBtDezJxkoUO7myGZaVmWU
	0qUCk6mSN2eo3kUHoU/6ebUVobxKknRzEDhyfUXr+hzX/W+rAdfuylPbrn38fHNSXmT5o+
	enyM25b6Y+cMAdGuQA8IoZfeETDZaphthgIcvH/dfTIYeFWELldVjaqYWKcDSjbsKVAz2d
	nVkmZko612XGhZj9w7LXsdK5YyloHuPpNrQ3qlz8EzjVMDxov+FCECt62adf2w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND] arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins
Date: Wed,  6 May 2026 00:19:26 -0300
Message-ID: <20260506032218.405131-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 81AFE4D5E21
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106049-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[packett.cool:s=key1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[packett.cool,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-0.011];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,packett.cool:email,packett.cool:dkim,packett.cool:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Spam: Yes

i2c20 is used by the battmgr service on the ADSP to communicate with the
SBS interface of the battery. Initializing it from Linux would break the
battmgr functionality when booted in EL2. Mark those pins as reserved.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---

Pinnnng..

Previously sent as https://lore.kernel.org/all/20260312005731.12488-2-val@packett.cool/

OK technically that was a 2-patch series that also included the PCIe root port
thing that's now being handled collectively for all devices where it was missing:
https://lore.kernel.org/all/20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com/
and because of that I'm only sending this, but still

---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 7d56d05254f6..3b491369767e 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -982,12 +982,6 @@ &i2c8 {
 	status = "okay";
 };
 
-&i2c20 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-};
-
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
@@ -1313,6 +1307,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */
 
 	cam_rgb_default: cam-rgb-default-state {
-- 
2.53.0


