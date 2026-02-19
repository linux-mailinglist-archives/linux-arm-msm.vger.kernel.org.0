Return-Path: <linux-arm-msm+bounces-93400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AyT8CCMVl2kRugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:50:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745215F395
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32EFC3014525
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3B2494F0;
	Thu, 19 Feb 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp8evlUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73730207A38;
	Thu, 19 Feb 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509021; cv=none; b=ovdHhR6L+eMm/yGJ6DKkhOdNmK87BNEn9TpPPFSZVSd7B6G6dWzV4kc90h3YCpjAuvlC3W9NBRNt1eDzoDkQCabFgrrWRR32GkWUwkTrdCxdM05W7OZqyvv7WiH3zXKIx50CEEox6OQx6Pu1Q8L0/m2NzxbPFonkNVyBcYk9RzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509021; c=relaxed/simple;
	bh=bDG5HJATJlSE2M/uMl1Kc0L6vOb6S35ga6tbRrUuGeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bi5G4kLja3r+ailKkcrJ+l18+4Q8/8BNC/oY+u36L7nj72KXpLAsvs5j/pJd+ckx9zkP3iDY7ouzGRHSA63rF/r/wFuruyXW2KCrLcjWfFCeonBYLl9sQc5/8G2qGFgzg4PrMsABQypcHwC6507I9mrXmq5hB7OgnLuVP3jAD60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp8evlUM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE0CC4CEF7;
	Thu, 19 Feb 2026 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771509021;
	bh=bDG5HJATJlSE2M/uMl1Kc0L6vOb6S35ga6tbRrUuGeI=;
	h=From:Subject:Date:To:Cc:From;
	b=Tp8evlUMWQQSQh/RUchyMWCQbPQKsaMPkGnTyuSvUhOWO9H/fGjB+rYD1u8fUKaAz
	 JnnPLm3sDMV4jf6xKDx3RAW1fror/OhfxmNWNs/9Bpnoe0E+a0GiemfUWEA+olxnxE
	 mWsG1zB4LBj/XzRT2hf94I7yrO5iDCC/Se9J3kRUH7ohdEmT2AN79So2szW1Iv6zMY
	 7EwqbNPzWmtiWvH8xs6EOrwkSd7uSSVMVhw2U9j8GwcU9FTK9U/iOxcAtBNXe08aFI
	 D5VJ80oEq9jnrcDV38ShljJPcuYn5Y5xFMmOthVzi9diCbTTtK7XzHpRtLFSNhHrmI
	 nuTrT019OyFxw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [net-next PATCH v4 0/3] Grab IPA IMEM slice through DT
Date: Thu, 19 Feb 2026 14:49:47 +0100
Message-Id: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQrCMBCF4atI1kaa1KTRlfcQkTQztQPG1ESLI
 r27sSAItZuBf+B9L5YwEia2XbxYxJ4ShUuO9XLBXGsvJ+QEuZkspCqULPktdOQ4dfZIHj0HbLR
 2zhqDiuVRF7GhxwjuD7lbSrcQn6Pfi893luoFL3itQJVaboSrml1IaXW927ML3q/yYR+xl79KN
 VFkVjQIa2EjarMWM0r5VXQhxVQpswIaDIKAptbVH2UYhjd+v/pbPwEAAA==
X-Change-ID: 20250523-topic-ipa_imem-def66cca88e5
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771509014; l=1932;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bDG5HJATJlSE2M/uMl1Kc0L6vOb6S35ga6tbRrUuGeI=;
 b=UqMGpWifDKjhndgjCJBJ+mTlKrehsRK94O+e6wWG5s6WFzL8p4xZueeWlVorSy+soW8/s/wyE
 LpWJTozvpBrBpEU4hH1lNZKlyFxu1zJ0XlkXGUBlFDx5yld/a9pLeKG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93400-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 6745215F395
X-Rspamd-Action: no action

This adds the necessary driver change to migrate over from
hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
unfortunately keeping them in there for backwards compatibility.

The DT changes will be submitted in a separate series, this one is OK
to merge independently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v4:
- Fix a memmap() leak
- Adjust comment style, take Alex's suggestion about very explicit
  DEPRECATION notices
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com

Changes in v3:
- Pick up tags, rebase (effectively a NOP)
- Add actual binding constraints for modem-tables, drop Alex's r-b
- Better describe the purpose of this region, as much as I can anyway
- Link to v2: https://lore.kernel.org/r/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com

Changes in v2:
- Actually pass the retrieved data to the target function
- Re-wrap comments to match net/ style
- Mention next-next in the mail subjects
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com

---
Konrad Dybcio (3):
      dt-bindings: sram: qcom,imem: Allow modem-tables subnode
      dt-bindings: net: qcom,ipa: Add sram property for describing IMEM slice
      net: ipa: Grab IMEM slice base/size from DTS

 .../devicetree/bindings/net/qcom,ipa.yaml          |  7 +++++++
 .../devicetree/bindings/sram/qcom,imem.yaml        | 14 ++++++++++++++
 drivers/net/ipa/ipa_data.h                         |  9 +++++++--
 drivers/net/ipa/ipa_mem.c                          | 22 +++++++++++++++++++++-
 4 files changed, 49 insertions(+), 3 deletions(-)
---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20250523-topic-ipa_imem-def66cca88e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


