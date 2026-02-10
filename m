Return-Path: <linux-arm-msm+bounces-92527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PRbFQZwi2lhUQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 18:51:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026011E1D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 18:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70247301081B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 17:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDA838A9CE;
	Tue, 10 Feb 2026 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="C+XgP9Qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEC38A9AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745843; cv=none; b=M+s7Y936/diEbyLoLZH0o+C0CHG8VjnVi4BaYdmEaapSqyoZ/xqkBebMpX6KPSLCafuO8SjWAZMmQaJ7BkcKWdlhpD7zkdXMOB9KDSLpIZ5ik3NrWTMSz8ktzxGFBCGNn/biw8Uvbes1i+53VBtxrjTAPbqEodQE+xqFkj5ZGg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745843; c=relaxed/simple;
	bh=nYvm4UhHwCRyt4ugQfUKjDIo4rNO7pfyXU6Vbo39630=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wxv4KllNUqMpl2vmslRfpm+2AuD42K/WMrVtGIdAxb2UYZJoiuifHHKE7b/x43BCFpiQ+H/OaN2s1NbGnEkWpvZnxdRWeE1EoMO/WC5QkBU7A0bfwk2tRx+HBIuRsn9u9ei/Rr9qNOFg3QZqL5rKoX0u9GHOoP3YV4zNFpmkoQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=C+XgP9Qj; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1770745839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vpwc04aRqjCD/uWOIUUpe7lRfI+Q6uBKuFNge3A6DHc=;
	b=C+XgP9Qjjp22dxqvYSFqQGf85GvZXoMrDZrCAuao3TZb33VzrzJEpdnYpk2I/qZ47AOALv
	e4VXJzf9croDfI6pwIlce3CZVFkAoaUQUfye+1mkY2nNarHNZKbzZ68VKjqInmq7NBdTW0
	6U+0KimQ4OLVodB1ezuTVaQ3l1GfRJ++M9aeef93Yp7fYJ9gh9v129FZ2y4MffGkQVt0HX
	O80jCMjc9QoM0zzIp04nM8L+I2HorxfeQXGq4UTIH3iabkjLGD8e6l+uqXIEoWp1gmI3No
	W162XNOTEvFr58qSVDSq0XgfCKO7jFkYjifpSqvLK9ogEg9B/BF8oAA4YZRb7g==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins
Date: Tue, 10 Feb 2026 14:45:28 -0300
Message-ID: <20260210175001.7691-2-val@packett.cool>
In-Reply-To: <20260210175001.7691-1-val@packett.cool>
References: <20260210175001.7691-1-val@packett.cool>
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
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,packett.cool:mid,packett.cool:dkim,packett.cool:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7026011E1D3
X-Rspamd-Action: no action

i2c20 is used by the battmgr service on the ADSP to communicate with the
SBS interface of the battery. Initializing it from Linux would break the
battmgr functionality when booted in EL2. Mark those pins as reserved.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Val Packett <val@packett.cool>
---
Wow.. I was pulling my hair out trying to figure out why I had the "broken battmgr in EL2"
issue that absolutely no one else had on other laptops, turns out I did it to myself.
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index fcf2845beb3c..255728970c1d 100644
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
@@ -1308,6 +1302,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */
 
 	cam_rgb_default: cam-rgb-default-state {
-- 
2.52.0


