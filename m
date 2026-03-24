Return-Path: <linux-arm-msm+bounces-99503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMjOHbzzwWmPYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:15:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E517730105E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91E0F30A2BE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020F63803F5;
	Tue, 24 Mar 2026 02:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="nTl6i4/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020A37EFE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318070; cv=none; b=rLpotrmujrHzsBA2EDfMcMPC0RzO+foVWw5AVoVG1H4h+006blHCsAR0jTgfXv5Eg5bvOs7gqMQX+MwRNG8VqIuwBymax9+5xnN90t4S6Vp6EO6oCaXXn0wAeasGIkfJcHqotUQQOlmIthsVbNxLJsaflRVEXgToKZrH/wsmOvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318070; c=relaxed/simple;
	bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOLR/ktNuro3JDvzubnGEw4xCi4WHd2152pMVjylkQbDP5G1P7pDnfNkTO7Cfpb4TTUSkMEWULjblOG0zNtIxIiNCPAKqBPZYn2uOEDQG/fZYWfXkE9qeDig5JE9geQ5FV959OGUbyeXAJT3MJKgRo9zNBP7JvRmqCYCSLcuE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=nTl6i4/C; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHq+H6MH4LbASJLjMcjCQqRRO4xEm/zZrOQ3FUn7dvc=;
	b=nTl6i4/CzEDqO4S08SPO7fruV6VKSHfaRofFzvio/3XPplsFZR0p+VYDWWkXovguheH7V6
	PcQCLovk6udEDfcTuIJO28T5EKc2jm4Qlf5YHLfCW16gqVxQii+WfqaEDRVQk9C4nUYYHe
	hy4jszrIlp/OZiH9M6qfqLoYOgUNPYVNaorcqsMV6AkrYfCEPhEmaxCXN0T7hA1fWPWKb5
	HBeddbVnG6UGP2m80buDXY3qUece0rp7OwsKJHvY+zjsBjfTRtRInhhY/or2onp2zSn3Co
	rM4Kr7MB1BLuamFfWdZStS13h/oS1Hz//Yms7pay23jemZvmSb8f+UtyQtbtXg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:32 -0700
Subject: [PATCH v6 02/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=563;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
 b=5N1Q50wJ7bNWmZyC8eXo8k+88v00vaQvHzvSvv4kehGKjBj89+D8Ws6q7nfa9iMgs9zyY/tcP
 BoTeoS3zzDcCRQupqALtRxxwktr7iiWo9dkvC8TA/XSDfgPKvLXvCeZ
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
	TAGGED_FROM(0.00)[bounces-99503-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E517730105E
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


