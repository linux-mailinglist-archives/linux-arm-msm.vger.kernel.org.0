Return-Path: <linux-arm-msm+bounces-102000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPpsF5EW1GncqwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 22:24:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB413A7241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 22:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAC9D3047BCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 20:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0922F5A36;
	Mon,  6 Apr 2026 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTfgXb0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF32D5923;
	Mon,  6 Apr 2026 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506749; cv=none; b=JjBPkF7RgphhVDVZ7Atfe1GX04Tnbb5thaEG4hghXEMK+mFrM1QOIiXUIkDOFURJIw238eSJB050lj8oXlvx7FYGCLnhnX4/+se22NOwH+qnZPg7bDon05sdQ6tfQeaXOL+6p9+gWVwzkUQCtRe7kvDEYHSozkbOtmdW5ZzLZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506749; c=relaxed/simple;
	bh=0Q3tXh/N/mW8ffhClmjJ/eV4MLTTy6YVNm70ooWEQ50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u0wKe1UlO6ZmNki0hd+SO3BfmY4lhCguhUSHtx/xiYHuJPDbhAuFhL4rVKY6DtbGOdu+VvCV6IxOyhHorP8fNTtCLD28EzBmRCCNG06IL+8kqyXSeCX+4BEObT/wGHQKFick/2S8E6MpJiIdka6T8wR40LY1ChCv6ypGDNudzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTfgXb0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26934C4CEF7;
	Mon,  6 Apr 2026 20:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775506749;
	bh=0Q3tXh/N/mW8ffhClmjJ/eV4MLTTy6YVNm70ooWEQ50=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gTfgXb0L8FTWWe0vVFg4X+tszuE5ZD1TT4UDEihKw+MbvOn8oFu3H9gAS9nRJ38Qu
	 /ZSnlOSsgp3oiEKiPOscB6Pioxpj23ncQOQkA/boX4q0ZO5+3wd/uy5W43vmiwsDsU
	 FESSJqnXsZIQJdq5+twWkhy1DjKV7RNE4psCQH/nlMdP0x3i1dz5xa2dWswoYmrfUZ
	 X7XIRJxiKYgaYYLYHFUDX1eAVHcNTwGpRWygiTGEsHPbSoEGX4HYON4Hl58c3gefAV
	 fVh8GKQFtk/G75TDYVINMjKcg8uMjkTEh/CDreB5FYtXx6Z86kIn3m3aHfjvGN4Tqz
	 tcDN+CP8+mgxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108A7FB5160;
	Mon,  6 Apr 2026 20:19:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 06 Apr 2026 22:18:25 +0200
Subject: [PATCH v2] arm64: dts: qcom: sdm845-oneplus: Enable known blocks
 and add placeholders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
X-B4-Tracking: v=1; b=H4sIABAV1GkC/1XMywrCMBCF4VcpszaSjLmoK99DugjJaAZKW5JSq
 qXvbqwrl/+B861QKDMVuDYrZJq58NDXwEMDIfn+SYJjbUCJRik8ibHzgdLQRcpFuGgN4cXqs9d
 QL2OmBy87d29rJy7TkF+7Pqvv+oNQ2X9oVkKJ6KLRGqUkF2688HQMb2i3bfsA/AJQMaYAAAA=
X-Change-ID: 20251123-placeholders-7d65e29648a4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=AVzwMsW29OzyZogD7/oC7WV7gAZxzBH+SW2iQDHGVNU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1BU7glHYvyVib5voHAAb05fXLjKUjKvkSXEBO
 JhQ91xt4hOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadQVOwAKCRBgAj/E00kg
 cucJD/9M5lIqwyWqQrriy8WD8qm4T3QiE/Vd0fCadR4Rmi1RR6p/Q6n+MLu+XWpbHyYGJdTcHon
 xEGMR6wMAf7f2EgbNZdJIlaXHTQXDd8qMuW1VYd5U8NwQG9RgBb3nmmRtYkdD9rUomWXkpVoetV
 MCOIG5oHo4133DR6cxXXA5f4Z0jr+XeQzxgI92UHxR+KHMB8lbeiHr+JuJRDdJMfM2Vk/n3h0/u
 XxnulhAVr7zCb5/+BtaDgsnRPJpO9mhP28rCBPSiFWEu7vnPSszOY8XfRf1r8UpT0z/DVj79qLS
 HL6NarB2BgqqsljBtrLQ1sVU8jaJWG3ihEvA5lftgf/21fcc737tyCkTSb3z79TdQ9iaKRRF3SH
 Gx0JXHWuanre5TvR8sz5bDAjTeGibhCxGoMEztvcRLH2TGUbPWRttXm97rx/eYBB1LcnlgmP0wU
 8G5F7RYEiiEEAnTrtazGSLABsAsE96+mvosm4+GMnr4ckOjseSdUHB2dgQYUdvegeLK8pyKUOVw
 tPT5hJlQpBZbKCaImiJ7zaUM7vBOCf7iaJZjPn4pl9l6VdsKiLgI9e5ZF3Zo2yx40xEnw7ODlWX
 gfo3TkW3gO0u5/cp6jyRVgCUMoX81StLTCmvhxnRo1NejUg13SsFbld7u/TPDDeCp7HmSoPbRE+
 0dxTez1sv0XbJiQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102000-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDB413A7241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

We know these devices are present; most of them are supported by
downstream and are close to the mainline kernels.

This adds placeholders for:
 - front camera (imx371)
 - rear cameras (imx519, imx376k)
 - actuators

This is very handy when rebasing the integration tree with
support for multiple different blocks at the same time.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Dropped NFC placeholder, as the series for NFC support has been sent
  upstream.
- Link to v1: https://lore.kernel.org/r/20251216-placeholders-v1-1-d7d544200e7c@ixit.cz
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 6b7378cf4d493..719d98240a21d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -442,6 +442,26 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	/* front sony,imx371 @10 */
+
+	/* rear sony,imx519 @1a */
+
+	/* rear onnn,lc898217xc @72 */
+};
+
+&cci_i2c1 {
+	/* sa,sa3103 @0d */
+
+	/* rear sony,imx376k @10 */
+
+	/* onnn,lc898217xc @74 */
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/cdsp.mbn";
 

---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20251123-placeholders-7d65e29648a4

Best regards,
-- 
David Heidelberg <david@ixit.cz>



