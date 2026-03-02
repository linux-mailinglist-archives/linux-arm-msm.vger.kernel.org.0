Return-Path: <linux-arm-msm+bounces-94998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAbyIy64pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:17:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F931DC94C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF4C730BC5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020D241C313;
	Mon,  2 Mar 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtxN9HcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F441C2FF;
	Mon,  2 Mar 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467133; cv=none; b=SeMeovEaNp8Q8Qjgr1D1zKgH9BGJZudKQlSFI7tBPj/swmEh9GuzRbrL2lqnr07eV1uX8AuxzGCHfjksfzXgcAW/vV3tZnYMGISP5i3f3R0DAdVoGt/7YDHDXWf6eyn0/kFnfZshIrlid8CbppoRtHZoHSu+hjeldGEeYPgMvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467133; c=relaxed/simple;
	bh=CVsVLJ0lG89+Ce/49Z5pL//iOq94eX4uwdF6saC//L0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n+LmnnrLYyYc9Z3ge3VgaMvetsVqU6jpCQYwU1C0zftATkcjHbaNPiADXGNmh52XMwb2mB5ZebOH1dK3bju2hsNlEXsFeFF5guXdCC3bXs8LKTLwXJ5x61d5D+gJaQxSZGd23JTwc0t0Afz/AipKx/NOVe+9ZRcwMFvXJd06cBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtxN9HcX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098C2C19423;
	Mon,  2 Mar 2026 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772467133;
	bh=CVsVLJ0lG89+Ce/49Z5pL//iOq94eX4uwdF6saC//L0=;
	h=From:Subject:Date:To:Cc:From;
	b=JtxN9HcX6OQFog6/9Cr81sQ7SD+kN8up0GWpZVecvX0DYePcPG+8Sx9oPs5e+cCHj
	 o93nz4U5I/MccR1ILa+xh1+/NryfzfS/Q67zcnF4QUTMtWKJM016ao31cBClReoxxn
	 evBUVv259acdjgQSfNpR1Lgld0i14MuEkYNdBNDjfIh6sSDOe1XAuhKuTStz/7ZlAn
	 LBeOiv1a6BRv2tHPmkocV2YikpRUUAzTz49xU7mkEV37cZvqxVVTi86NRzKEMP0cN1
	 Z4DjuSXhU0NNRHstMVpEiiF6i9ACkB5ICFglIJua1nZGSJD3ams6+xtQlK1K8zHqTQ
	 cwYL+jUgzpjww==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [net-next PATCH v6 0/3] Grab IPA IMEM slice through DT
Date: Mon, 02 Mar 2026 16:58:42 +0100
Message-Id: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XO22rDMAyA4Vcpvp6L5VPsXu09xhiOLa+Gpc7iL
 myUvPvUwiCQ5UbwC/ShG2s4FWzsdLixCefSSr1Q2KcDi+dweUdeEjWTQhphpOLXOpbIyxjeyoA
 DT5itjTE4h4bR0ThhLt8P8OWV+lzatU4/D3+G+3aXmoEL3ptklJUeYpefa2vHz6/wEeswHGmwu
 zjLtdJtFEmKTRBC8tA7DTuK+lOskLBVFCnJJocJUu5tt6PoteI3iiYFnKdPUo/o9I5iVorUG8W
 QIsD0WXgEqfAfZVmWX+wE6H7LAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772467127; l=2374;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CVsVLJ0lG89+Ce/49Z5pL//iOq94eX4uwdF6saC//L0=;
 b=1S1j3re7MVXMVJ8BFrKpTU4bCbAYvPhVlu9nFDQ/4shoT3MgfArSDY92ZifJT4KLsvouCWiiC
 rWs85oEWT/JBsEshQPgFu2KAAe8FnDptA/iIcJvD7cNrVvnXL95VTCa
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: D2F931DC94C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94998-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

This adds the necessary driver change to migrate over from
hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
unfortunately keeping them in there for backwards compatibility.

The DT changes will be submitted in a separate series, this one is OK
to merge independently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v6:
- Refrain from corrupting the resource representing IPA pdev's
  "ipa-shared" reg region
- Rebase on next-20260227 (NOP)
- Link to v5: https://lore.kernel.org/r/20260224-topic-ipa_imem-v5-0-015bf09e123e@oss.qualcomm.com

Changes in v5:
- Rebase on next-20260223 (NOP)
- Resend after the merge window formally closed..
- Link to v4: https://lore.kernel.org/r/20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com

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
 .../devicetree/bindings/sram/qcom,imem.yaml        | 14 +++++++++++++
 drivers/net/ipa/ipa_data.h                         |  9 ++++++--
 drivers/net/ipa/ipa_mem.c                          | 24 +++++++++++++++++++++-
 4 files changed, 51 insertions(+), 3 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20250523-topic-ipa_imem-def66cca88e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


