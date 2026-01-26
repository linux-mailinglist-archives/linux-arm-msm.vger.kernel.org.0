Return-Path: <linux-arm-msm+bounces-90596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHn6DmeYd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:37:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7578AC29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BABC33008CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E990343D6D;
	Mon, 26 Jan 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NxXPhOHZ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XMM6BeNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAA25771;
	Mon, 26 Jan 2026 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445455; cv=none; b=MxZLA8EJ14v66akqI0uwdhXpa1OJ3WOheZWWNyeamWwhESakT472FGTC6XJs1WggVmU3Lg5cjHJT6k0XHoA2OYSRmeYJPmUlELsIQgxePaU+5vDm6rodIOn0m5fq/DSZd/dnyyZeAjiVacDMJdv/uBHaG0KqZruZQrdLow+5f5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445455; c=relaxed/simple;
	bh=ySb6W1s9Iun/YNYUuLfpuw6uLnmoIhza8hHZ6K+xtIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXbHA2srKSqXDQs3lnrYzNOHA2fprGkKaDjbhfzrSmsOgh26edG+lKVD6EmYBXcDqDE9cNSrpXxIA7OQXQ8KD29Wvl1uHTmvCeTyEXeFEL+5+NBhkLqxtb/d6XSkFe/MrGZidCT1kOfVInr3oawRjCmWWEFtlRMX/8zBPn8X51o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NxXPhOHZ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XMM6BeNg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445297; bh=FQiishxT+zjWLz9tWTv65mV
	EcIRx3eRLePMisMeHCmY=; b=NxXPhOHZ7pIl5MIjxmg600TumwRUjah7ZgS8QUghK+8VOe2dmx
	hQ48erapMLFDj/nN0CF1tJVlAk4+djbEWMm23CpxAhKnCab6+ev9iAdSEghBNnY4Hp9hLQ5hTJm
	nLh4R6898idN9kLr+9pwwJ3UKtDC016U6Cv5LHPCeAm+95Ry/rHN50lSytpa8Qk9iwC7N9bs6T+
	oLkqhUfLs+VGKchYz34Ypo3lZanWcdskbQ5EPhFek0vsu0HmfiT+vM06pviy1ClCiZnmUMHwL+3
	q75PwSqLlCfQZBgtL9uUFJGA6DKop51xOuY/yK/rLfbWf5j1rq7wwp8qDDRiywIEpng==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445297; bh=FQiishxT+zjWLz9tWTv65mV
	EcIRx3eRLePMisMeHCmY=; b=XMM6BeNgUNwohbn+kvYdBiOj3vZmITsx9fhztzxivSPniTDQwW
	TvVO2/01O68e3jzkuie2pno2x9z5Dfbaf0Aw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 26 Jan 2026 17:34:55 +0100
Subject: [PATCH v3 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix
 reserved gpio ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-xiaomi-willow-v3-5-aad7b106c311@mainlining.org>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
In-Reply-To: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=952;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ySb6W1s9Iun/YNYUuLfpuw6uLnmoIhza8hHZ6K+xtIs=;
 b=lGDUq+eQihH803VFtKD+nMJfWP6OTjidaXAOexGCbGlz1lJUc4bxgdIBunhhhD9D9m8HKNB2w
 U37Xl3SjBA5AuK+TFz5iUoNZlSxfCDldYhQjsVq0lvTmhbzKcUgIHHT
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.22 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.88)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90596-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 6A7578AC29
X-Rspamd-Action: no action

The device was crashing on boot because the reserved gpio ranges
was wrongly defined. Correct the ranges for avoid pinctrl crashing.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Tested-by: Biswapriyo Nath <nathbappai@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index caeb7c74873d..c5616a083f71 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -293,7 +293,7 @@ &sdhc_2 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <22 2>, <28 6>;
+	gpio-reserved-ranges = <0 4>, <30 4>;
 };
 
 &usb3 {

-- 
2.52.0


