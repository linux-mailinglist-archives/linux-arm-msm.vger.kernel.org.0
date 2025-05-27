Return-Path: <linux-arm-msm+bounces-59529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A81AC4D44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E72FF7AB281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46A7258CF6;
	Tue, 27 May 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThpUArp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6B1D90DF;
	Tue, 27 May 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345216; cv=none; b=JFJpDyinu52dL0UV8NN1s3iIJRuUsPI9LrUxZDfU8HQooFtt0RuMj5finVWqPQLIMhWWHL8x53SpH9zH/NtN1Q/8GboRG4YTNRdPoY+KEh72CX0ZOaSs8Q+wU1Tqcmw7AMPcIac7JENzfBv7TaliFqdaqDA2akPXwctkU87/cVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345216; c=relaxed/simple;
	bh=2KpYEmamx/I9j9PlojgCvsZMpP5T/inQoOXe2bcXrmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uHj4Cvzeu3np9kUXigfAm/a5TC2S46ORQnPoccOp91cCdbdxoEA6PaVR65QIHDcz2PDnte90MPGRrM3ADiGcxoyx6m/crFkEA35RM0T9rtfNJ4oJxJwGcrO0+w8do8LibqGwD8+JDhWPnAAzgyVJapmB2+5EJpAl8KfZYewZkVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThpUArp+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5738C4CEF3;
	Tue, 27 May 2025 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748345215;
	bh=2KpYEmamx/I9j9PlojgCvsZMpP5T/inQoOXe2bcXrmw=;
	h=From:Subject:Date:To:Cc:From;
	b=ThpUArp+46Di00Yo84iAx0Hj5yL9CW5/L22pa44Kaa5B8Ly9PatPcuWZvZiinHHeU
	 cUS6v5kWULgxzkwMKt+fxErJlY4imnOdD+B+ef/kU9b4aqdmbkC+4tpDaHseYNO/qU
	 oXWi4+ltLTe5Ptv4v5OfYaw+pFXpzOiNWMWXm99Gt7twcY7wJrmlXNEnNWkGzlbbhj
	 HdtvwwjbWPFaGN4PEdE3zQ1w8+7zfzv/t/nVOk3ULDtpWBMMPZy2d95FshsXk121mW
	 dQeLC0c091iE6s1YYC2vUHl0NRgZLOIgh5/mCSKwbxfp1udJcs0b87Z8lVz+Tlp7Oq
	 pKuS4TFNqa38A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [net-next PATCH v2 0/3] Grab IPA IMEM slice through DT
Date: Tue, 27 May 2025 13:26:40 +0200
Message-Id: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHChNWgC/3WMQQ6CMBBFr0JmbUkpKaIr7mGIqe0gk1haO0g0h
 Ltb2bv5yfvJeyswJkKGc7FCwoWYwpRBHQqwo5nuKMhlBiWVllrVYg6RrKBoruTRC4dD01hr2hY
 1ZCkmHOi9By995pF4Dumz95fq9/5NLZWQ4qadrht1quxx6AJz+XyZhw3el3mg37btC0gcePizA
 AAA
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
 Alex Elder <elder@riscstar.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748345210; l=1361;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2KpYEmamx/I9j9PlojgCvsZMpP5T/inQoOXe2bcXrmw=;
 b=ADlSLa2NYN65cBFpf3Qksz58t8CDgKYOr9rkGp4ZXkcZIM9guW3opbzotlQbnh9QDYIAX+H5L
 BFBw7cwTvZ6Bt2OdLnYMiqsRbFLl9tQ1LPu4uDLqUnVcRhyxIj1fi8V
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This adds the necessary driver change to migrate over from
hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
unfortunately keeping them in there for backwards compatibility.

The DT changes will be submitted in a separate series, this one is OK
to merge independently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Actually pass the retrieved data to the target function
- Re-wrap comments to match net/ style
- Mention next-next in the mail subjects
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com

---
Konrad Dybcio (3):
      dt-bindings: sram: qcom,imem: Allow modem-tables
      dt-bindings: net: qcom,ipa: Add sram property for describing IMEM slice
      net: ipa: Grab IMEM slice base/size from DTS

 Documentation/devicetree/bindings/net/qcom,ipa.yaml |  7 +++++++
 .../devicetree/bindings/sram/qcom,imem.yaml         |  3 +++
 drivers/net/ipa/ipa_data.h                          |  4 ++++
 drivers/net/ipa/ipa_mem.c                           | 21 ++++++++++++++++++++-
 4 files changed, 34 insertions(+), 1 deletion(-)
---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250523-topic-ipa_imem-def66cca88e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


