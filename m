Return-Path: <linux-arm-msm+bounces-104704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOCSBrpJ72lO/wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70061471CD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00AB2306FC1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94553B9DBF;
	Mon, 27 Apr 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bm12jgGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593B3B8BB2;
	Mon, 27 Apr 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289334; cv=none; b=oQ0Qg6fbisYQeWPrfxbrG2wcGt3YKX1Itv8Uz8qlmCjZFCt9Uh4JeRQSyAcyZOAGrlWAk0ijvcJUgKLBUGo7004QBIoiBDdi+T5B/X9Ti1jGlG0UdDwZ3pZOpSzdtAsFHIldC/woqwViKKxnLIshI0bAprh7bAG9saNxb9UAHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289334; c=relaxed/simple;
	bh=qqYiNYscYR+g3VL5uDHvMgMHV/pf8DMOn6VnzrdrXGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ye2ll5Vd/4on5IOqcBiWIiFuW8LV5x2FbPJfX10xKs/el76gPVK3ITpfBRKfebx1GZ2Z1r2aVmH85mVN+QXiUb6qw7qjcQbQFV02VaSZ/BwoE63/1uNkSrqJHFlELgtWkYdGLtXfQq6ZnyDmqF6Wwn+Osd/ZyBBjETR81T5ZBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bm12jgGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E77C19425;
	Mon, 27 Apr 2026 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289334;
	bh=qqYiNYscYR+g3VL5uDHvMgMHV/pf8DMOn6VnzrdrXGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bm12jgGb8Xax59SGFx+LwxQX3jpNu+KJzDxwsrn9PiAhhd4G8F2NGuEU1wnSNKea2
	 dzM5tsQBMutHYaZvXXhTOAPNiuEsid5q0Cb4No6tedvM9V5whuGHSvHqDXEkl1lOU0
	 IwOEczPxcjzi7Kd6nnpLWOgYD/T+Wtke2Yu52e4qFUoNorkBYV3RpNfPCylgMFKheQ
	 uXMW5YadhkRXn8jDbjDdTO67kmFnHchuoaOF1ZB8mZtSFkFZ9Mvb6LpO1sLtpuLtLn
	 e7X8Y6u3T+EXEOU8aTlqzaOe2nc7eDL5Uj9Ofmfc36STt+o5o01whZIOm3Grm/Eqgw
	 jR+3xbFgajgbA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	bsatish@qti.qualcomm.com,
	akhiverm@qti.qualcomm.com,
	nicolas.dechesne@oss.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qrb2210-arduino-imola: Drop modem support
Date: Mon, 27 Apr 2026 16:58:33 +0530
Message-ID: <20260427112833.1160332-2-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427112833.1160332-1-sumit.garg@kernel.org>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 70061471CD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104704-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

QRB2210 has modem fused out as it's only available on the mobile variant
which is QCM2290. So let's disable modem support from Arduino Imola/UNO-Q.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 5266f89feaaf..34f8bef222be 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -343,12 +343,6 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
-&remoteproc_mpss {
-	firmware-name = "qcom/qcm2290/modem.mbn";
-
-	status = "okay";
-};
-
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
-- 
2.51.0


