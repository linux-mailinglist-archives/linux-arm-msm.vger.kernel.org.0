Return-Path: <linux-arm-msm+bounces-108867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO4eBP7wDWrA4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:35:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A997B5940F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803CD372711C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A023D47D3;
	Wed, 20 May 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfeDeNt+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA98C37A4BA;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=tzwv7IPvdEayZP+ZEMYBHAC+V4pVTSm9hhqeNHHqub07gsSUYDsyP8WNohxAARrCVD86SCN/ytbstrhnichAhQC9PbNsAuYEvqem15awvgGyFKQNhcKV4+CWBTPJlpfnCrnXcCXUCDMw0+V4sc8qCiNzZ50GKWcw1CbQy9RKvgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=Mu9cAq/bK2HeYMImJlap8nXy6uvMFEKZPyKWOMasao4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoLbHa+V0wvC85Cma9ghSClNU71M+IZg/uvDPnjbngQuc0K2g1kFYm909q0V8RQE3rv6MnkdhW4Tz/P2ZpejvIVkz7hPhDZPwDcl/wsV66/icPHgtqOPbBZUfLvoKgYF5hNICVOIDKoG1gND7ErUU+hqegmPLkfHW2Tf7PE6Glo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfeDeNt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D6F1C2BCF6;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=Mu9cAq/bK2HeYMImJlap8nXy6uvMFEKZPyKWOMasao4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dfeDeNt+x4sgDIbwsODNMrUukL9VYJOD7OSkZU225gb0lmTd1f20xN3ers3UuwnnG
	 hf4L7WaLJalGZjpa7SXxOvD9IVtZUY8TesWl20G2HOapKI3a5Ud/b/SFYNHpwPWtJs
	 hgZWhb0s7lutPkFmeW5WEFXZYPJ3RdmxbNKIMs8kzo6uRmV4I4utaQf8D4eCusA7lF
	 JGIMCOVfpYWqgRT4HOY8K0/0cufs/er0TJBK5inlDaov7jFlFaSL/hmx5lg4G+MAsn
	 LyaXnh4+vOAwefuYCu8CWprv1yIE0cetRxl5n1Zo+w+MGBTTOHXg0O+1OjiwE4jqEz
	 4EYhsldpgKy7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840BECD5BA4;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:15 +0200
Subject: [PATCH 11/11] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate
 DMIC supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-11-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1355;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=zKav9HnHTj8DgP+Z9y+E814drSGNPU5bW2do5oedD5A=;
 b=jd63XVNVGo/QGrpVcEm+/DDF4Q/3SVr5c2azDz7Dhq8sS+H+BzUrp5rqDGwTydj26e1IU4R6W
 aMgOb7aIf4zD9WFH9SSEPHvEOAEo9UHNfDMJOBHTLhsuIHiZdo0YfNQ
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.87 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.53)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108867-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com,linaro.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: A997B5940F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Align with the reference implementation from the ThinkPad X13s.

The audio-routing setup specifies two power supplies for each DMIC,
but only one of them can be active at the same time.

Drop the redundant routes to the pull-up "VA MIC BIASn" supplies as
done in commit a2e617f4e698 ("arm64: dts: qcom: sc8280xp-x13s: Drop
duplicate DMIC supplies").

There is no functional difference except that we skip briefly switching
to pull-up mode when shutting down the microphone.

Cc: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index ae0a054f2f9d90c9341766528d6be0b9561a530f..f938e68c69ea9276ca89d75b659dbea6a7a832f7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -793,9 +793,6 @@ &sound {
 			"VA DMIC0", "MIC BIAS1",
 			"VA DMIC1", "MIC BIAS1",
 			"VA DMIC2", "MIC BIAS3",
-			"VA DMIC0", "VA MIC BIAS1",
-			"VA DMIC1", "VA MIC BIAS1",
-			"VA DMIC2", "VA MIC BIAS3",
 			"TX SWR_ADC1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {

-- 
2.47.3



