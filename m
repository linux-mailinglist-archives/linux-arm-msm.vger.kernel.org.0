Return-Path: <linux-arm-msm+bounces-101696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJWFLNvxz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:59:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544F396B5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80EA2305ACAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B42A3CD8CD;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+a3LlXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D16A31691A;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235335; cv=none; b=OO19xijSZX09Gstg+J+7LEVlk2AKk05/u/as8NMXBDJjfQZrDsXbam1ykGtqRyvA/Lo3rihRSIt7RB30eX//DSCs43aaxylK+AycbZDZbnLlm53scft2XNWDqOn4lDopth41B8LeHFPW8P4bLGhuhXNT5zrsnrlCEOGkZKo0Jnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235335; c=relaxed/simple;
	bh=/tzQuZ/U/5XUWUWrTbV+stwVTQRPCnc9ujggvi8xkgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEG9x835B33Fvt8L4jvapxVlj7zIo688oHmvBMFXMC+kBsLVOt+TItFDvCIEH/cj7yLc9Umrpz2cqrUNs1uYkVSnQfSnK3mBzRM/VTdYDd6cAjbCBeH5ICIAi3fyKBVZi1aIG3sh/2St7MxDy0K14gyuORxzPrk01x+c0DgzjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+a3LlXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DB97C2BCB2;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235335;
	bh=/tzQuZ/U/5XUWUWrTbV+stwVTQRPCnc9ujggvi8xkgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p+a3LlXW+FQvX97pw8oCJmlWc+nyHoFdWNzJfJCUYt4vOUwPVRZ17Xzxceax9fX2q
	 9bxinSAa9KWrUperEcZOcin7FHk7shErm3y1MF3UQMuD+OWYsPvSOh1IE9DTBb6JOR
	 2yp4mvnvJAgkrrSa7OInEX1UJgxEi7psSsYk2TOjH91RZLDPBeStVmgL36XdyZ9+T8
	 MWQGbn753ubTDJg6zah9aHQF0vBxry/1gbabuZgqwb3PRhlf2PWXfYsFPaTkAkXU8U
	 8o77eF7YjgnlpoC6gvAoumM6Ebu/P7Ov4cwAG0Io0VG7Pz3f06901uosshjCKSXIl2
	 Tg1H5meUg4cag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227CCE85385;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 18:55:34 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Fix
 compatible strings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-beryllium-compat-string-v1-2-0a6b9cb55a20@ixit.cz>
References: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
In-Reply-To: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Jens Reidel <adrian@travitia.xyz>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MZ+eRzNq9NMrcA+OAcR5yU63SqPRgMpiRYCCd8HwqP8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/EFpP7IbtRoFPW4edA+U04N6Pc6pM0G+LVN7
 C3zBYwhtZiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/xBQAKCRBgAj/E00kg
 cibnD/90wPlkMiUxRKz4ioLPT7dxEjWGGLbcRHmehrjszOfYOWW+qBJer0xSYC3ZsCBjjU6SKM1
 rvZYC3o7ABd2McxVfIHRU3ie2+oHtftxK4vwhAsE6fwysdObacccajWqFgbsjMgarB+oqK1mdRi
 F7xwDJg52n84DzAA7qSvCWpHyK7jhq5YGH36e5Nqf8UFYZQ/RLDOCIfAsfxrL+KktCwvSU22IuV
 oUqpzWXJmMqH7X4/GdBUyUdXNcbkgQKwHLHN7P46/f6jZgslBbOSx94h0dyqStV/7GdxC4yWteU
 Lrw9ydsB5ZQUzpdVt/ciFWqFrlZrmpvgRs1dumBxSOeEPtaX6K39gsapqKCyHM8auhdfNPb/EOh
 Hsg+me4KMM0WpW2aEMnfzuKUC5ryJnESYqyZ1HAL0HeCyHUgslwYMekJNaF6nRMXyizP7p7oWlg
 HL4Awf0pKgRN7Ye2FqgSdTB91evclizQLvIc9MiFF9iWs1/Yf7M1qK2Bv0aFICj0a841RUBmosu
 YPGayHt1jJxTBpuoSLiFRHkmIqP6CH/1uk4gAVsbssAJAfSWQL3l/MV0ujbjj54yyohEcNSD61b
 5RQPgZWxCcpFozH22PrmjX5uksh2zfAqYRk6AUjOIiyxCHMI/SmXN737PyYGl6GMTiJM7KdcMch
 TTwWS/sdui65m7w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101696-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,vger.kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 2544F396B5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jens Reidel <adrian@travitia.xyz>

The most specific strings should come first (panel variant included),
then the more generic ones (device and SoC).

This is necessary for hexagonrpcd to guess the HexagonFS path for the
device. It tries all of the compatible entries, but if none for
xiaomi,beryllium existed it wouldn't be able to guess it.

Fixes: bcf429831ecb ("arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce Xiaomi Poco F1 EBBG variant")
Fixes: dd6459a0890a ("arm64: dts: qcom: split beryllium dts into common dtsi and tianma dts")
Signed-off-by: Jens Reidel <adrian@travitia.xyz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
index 2d6f0e382a6cb..d157622f84d13 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Xiaomi Pocophone F1 (EBBG)";
-	compatible = "xiaomi,beryllium-ebbg", "qcom,sdm845";
+	compatible = "xiaomi,beryllium-ebbg", "xiaomi,beryllium", "qcom,sdm845";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index b58964cde8342..71816a9f33b48 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Xiaomi Pocophone F1 (Tianma)";
-	compatible = "xiaomi,beryllium", "qcom,sdm845";
+	compatible = "xiaomi,beryllium-tianma", "xiaomi,beryllium", "qcom,sdm845";
 };
 
 &display_panel {

-- 
2.53.0



