Return-Path: <linux-arm-msm+bounces-22938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191F90BCE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 23:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EDBB282C00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E7719885D;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aft9fpdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58916FF50;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718659398; cv=none; b=M8QlQ3vtP3cgc4hOUNpKKmQ5wWF3zXJCA9iXlzC4zYsJWAUfHzxRs9psg+tbsaz3oYLzCRxr3BYLbwYQqxZ52SBTrMxqM8M7KaDla7JQOz553bu1kuuX/e6GOxZvLdkEOSPQb9Cfv51hqaF1BHNaKbkEH1+Q0G8By259+gP0GmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718659398; c=relaxed/simple;
	bh=gxguENUktsJsPjFaq8UcvbJuvvei3DvrYMOWcTOkAw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UOChd8tKzDUKEfiLghEOylJzqRCqelkaEZWjIl+tfAgXeB64BDsURdytJjPyexekeBNn4W8rpRKtH/SUEiEir1WtovP45mv/ovQAehS0nYwld+vNVvQ1V1oCs6BFJhSGAq8wT/gb6v7TfQ6YVio7Y4dcD1m8KPVKsWBX7HBxcEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aft9fpdR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3DBFC2BD10;
	Mon, 17 Jun 2024 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718659398;
	bh=gxguENUktsJsPjFaq8UcvbJuvvei3DvrYMOWcTOkAw8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Aft9fpdRjUUcdNvrMdcmExDGcNn1bRiup2HAjUZSDGAmdohhdiEeF0nL1VruNB7vO
	 6K4dUC6hS+kDuQKsr2YrwqUn3Dd5HyKN5Pt+05ZANEE75WiOVLVHDl9NlNGwdAHepW
	 nLamvo2CPXubKOngSvAsi/WReoayK1NfM4BS7ASrOPN1hkPL2P0RFkM//zk7j07bAp
	 jQ6ocCVhzRNpEnmcE9H0dt8oYYKEPSmOoa0sA1GMDl2TYMvM3ZDuw59SBbr4g/d2n/
	 zJSC9lcCpsjcmbq+tTnTfmxGkPCjfJXTtzvdBrDK2gzZLAYuU2YTlLFDe4icM7VvdC
	 hgj3a3y+/fPHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4EDC27C79;
	Mon, 17 Jun 2024 21:23:17 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v2 0/3] ARM: dts: qcom: msm8926-motorola-peregrine: Update
 device tree of Motorola Moto G 4G (2013)
Date: Mon, 17 Jun 2024 23:22:26 +0200
Message-Id: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABKpcGYC/23MwQ6CMBCE4Vche7aGbWhjPPkehkMtI91LaVogK
 uHdrZw9/pPJt1FBFhS6NhtlrFJkijX0qSEfXByhZKhNutVda9mqhIwxS4Sy8AbaPtjAU/2njKe
 8Duve1w5S5im/D3rl3/pPWVmxupiBOwd2zO7mksyf4sMZC/X7vn8ByCK5NKQAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718659400; l=871;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=gxguENUktsJsPjFaq8UcvbJuvvei3DvrYMOWcTOkAw8=;
 b=r9wdA5EbSuCzt6TOOpC+UdYY6D094zXNEqld0DfTqtYhkVbD0sevSl4Hl0VgRDEAYR2x1ki9J
 WXXD2LOhk/0DrTFcYwBUXMERrD+u6y4Q/KyNz2gG9n1Vym5RCVRJBv9
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

Add accelerometer, magnetometer, regulator and temperature sensor alert
interrupt and update framebuffer supplies.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v2:
- Split commit into three commits
- Link to v1: https://lore.kernel.org/r/20240616-peregrine-v1-1-85d14ae1a11a@apitzsch.eu

---
André Apitzsch (3):
      ARM: dts: qcom: msm8926-motorola-peregrine: Add accelerometer, magnetometer, regulator
      ARM: dts: qcom: msm8926-motorola-peregrine: Update temperature sensor
      ARM: dts: qcom: msm8926-motorola-peregrine: Add framebuffer supplies

 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)
---
base-commit: c71189547381bb5f176c6b22a9edc3414f1837b9
change-id: 20240616-peregrine-6ec5e26b15ec

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



