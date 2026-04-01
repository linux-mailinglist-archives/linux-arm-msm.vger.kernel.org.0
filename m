Return-Path: <linux-arm-msm+bounces-101204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHRLF5KQzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC43745A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43AD8312958C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C088037E315;
	Wed,  1 Apr 2026 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="FPTvV8U3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDF3815E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013367; cv=none; b=fO+oTt0gYHcB9lQsYr9TRpkwMV2yhLINtKtcnBw+WXTt8y65MicX+7C2rxt1jSGxAUX/vz4dLQfqObJn0XeQKv8PcGZb/MvFEbcyjnNbSsRdMoCg3qJi7xe8l2CZKAekaBapQPzvbxzDWkITCnNgl/4yDIvrcbvQ9x5KRj52J/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013367; c=relaxed/simple;
	bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=desL7N41jZatm80fFznt8zlw/RVCRURgUkm+PUySglFryo3r4dFXNnHcQEE3tGH0me+dwjbd9An7/GV7H00uXG+I+t7zwQy+FQz9hjU/y/51p9la2vOFCCQ8BwTGxVRKyeC4toKTmNEEwhMHsFIImpjFWQxx5GjvZHdJDne3fFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=FPTvV8U3; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHq+H6MH4LbASJLjMcjCQqRRO4xEm/zZrOQ3FUn7dvc=;
	b=FPTvV8U3ZpZqVWYC/EkB2lOdLB06vtcxh26JBy8difrWCKL5h/PskH7B3kbiCoXqona2qN
	NiZkPSl6x+p7lSjM4L2ivsCptauUxeuaDuQCJty8iXR7ijdcUiqTUtO39vLMMJsBr46CB8
	HNx39/9agY18vFG4Xu/7KnXBTtWxvlBNq9WAAH2SwtbMcjUvSErQyIPF9RFA4j8vD1LMfq
	NSA12vsKcA3LCrvXZbSWVf4M3bSttT5hNHWwlZCITKLaqhTQelsr517zM6OQReMDqG/QYv
	5ynR2svZtJm5L7YfM/+SQ8KgPfXEOrxx5Q9t91Tb4Huw9GqiZnoPLk7vZnBaDA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:09 -0700
Subject: [PATCH v7 04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-4-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=563;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
 b=uBy5ltySP2XM1yUk3ThlsD1xsWmu3483jkdn4380d8QWgW4W5vSluT+Rc6qiqhjOHCWPLVMpo
 upqu3rku3NzAbV6VRm58JIItr2keN+WdFen6kbyeMoMm26Oj76iUjaq
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101204-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: B4FC43745A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm video en/de-coder

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 93ed8f240461..87ac41ec2e46 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -580,3 +580,7 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};

-- 
2.53.0


