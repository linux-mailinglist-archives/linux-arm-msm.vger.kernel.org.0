Return-Path: <linux-arm-msm+bounces-93402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK5kG2UVl2kRugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:51:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D015F3DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A4323053CEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6015E33D51F;
	Thu, 19 Feb 2026 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff9EKVUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74F207A38;
	Thu, 19 Feb 2026 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509032; cv=none; b=ifemhMYTg7ARo9UV3o6TjwmpgBqca7fn1cScLsNzXAaXwkokF53CYX9xlfJqkn919erMKis07rTeSTiBkBk5xKDTLZlf2c6tmbIxeugIcs6k2+NnCq1WffTmSiPxwheXNpIHoVIWSHb6W//meD+uYPRjaQA8tWD0pzMzLAkbVGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509032; c=relaxed/simple;
	bh=2dYSFWHyj4X3N9lIZ8cPMHQHezOGMsV6I5UBAIu+Dd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qc11z7XMjtgcSZpezhXYf5QTMGd2qd83Yfb/fbQa4VaV9Ht85SAou7wknakSKMqPjFrUG2t9jdCSg+KHwcKunVOyTECwcAD8xzGZ9CPzEd2PcqZ/3/jCYisxXd7BTBr5BQHuXXHJgkrxdki0wx2pY+o7YbTScY+0qyxoM0QPleM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff9EKVUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742D5C4AF0B;
	Thu, 19 Feb 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771509032;
	bh=2dYSFWHyj4X3N9lIZ8cPMHQHezOGMsV6I5UBAIu+Dd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ff9EKVUGJ412kQbYNMxBwMHvQSSrNEB0j+bMZhmaDjZYmOi+TjDu3dq7pn9jBPBWK
	 iyvPGTzznaycGH7T+HEKUiM8q30pabovuZqbQ5J7qaqQQR4xEf6z+EnwkHhqBKKSP6
	 X+alVISZ6HBm16T5Uxq9nzJsjpaRY66mDu2Lsw3roZSxtqfG+U+kgxOnzfRRyKsSal
	 yo0GCulrQJeuTs5MsuuPSR+edGGVjWLpkkpuxnVBg9+BUIRuDnitNRwdDpS9QKzvC4
	 p98qkcN8EVqq6x48IC1C/spWvEBeFcUQcNVD44QsP96UfyCly48vakk6qchquQnYUC
	 tSt13FweG1v5g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Feb 2026 14:49:49 +0100
Subject: [PATCH net-next v4 2/3] dt-bindings: net: qcom,ipa: Add sram
 property for describing IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-topic-ipa_imem-v4-2-189d91dbee84@oss.qualcomm.com>
References: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
In-Reply-To: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771509014; l=1543;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=FtJRSrboOafEtcZXaNS6FW/2KBBL5SVhQOA5zYIeMBE=;
 b=SeF4Ead3naO7drthQ0YG0Dickjyktb6zI+uSraXuHCiJBTFU1AMxuRCXKhMY3TR0p04Iswl9k
 Y7vaiEkOTjwBCdiQvxqbUhfHJAyfp4r+XXgRgSflXGQKkyDaj1iBB87
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93402-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email,linaro.org:email,riscstar.com:email]
X-Rspamd-Queue-Id: 050D015F3DC
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The IPA driver currently grabs a slice of IMEM through hardcoded
addresses. Not only is that ugly and against the principles of DT,
but it also creates a situation where two distinct platforms
implementing the same version of IPA would need to be hardcoded
together and matched at runtime.

Instead, do the sane thing and accept a handle to said region directly.

Don't make it required on purpose, as it's not there on ancient
implementations (currently unsupported) and we're not yet done with
filling the data across al DTs.

Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index c7f5f2ef7452..4237e74041ef 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -165,6 +165,13 @@ properties:
       initializing IPA hardware.  Optional, and only used when
       Trust Zone performs early initialization.
 
+  sram:
+    maxItems: 1
+    description:
+      A reference to an additional region residing in IMEM (special
+      on-chip SRAM), which is accessed by the IPA firmware and needs
+      to be IOMMU-mapped from the OS.
+
 required:
   - compatible
   - iommus

-- 
2.53.0


