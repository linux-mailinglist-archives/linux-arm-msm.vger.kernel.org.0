Return-Path: <linux-arm-msm+bounces-89642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF52D3A7B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60BD93093539
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92193358DE;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPjKY12B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9C31E106;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823934; cv=none; b=oIl3kt0ZVcE8E0Hr/iWB+cJ4GFECCgJNUnIj0DwuT2XxwEmR97ecx0bFlS+gMkSgLYmxHz4k54WocZuPE3pKdBhqACkjPSpGZ/kntH7KVMI583KXGew7BO33E/LwEpUzs0HV9KZf7Wn43eqwXQ8WuNdtDkZlmvWJm56BD1fv16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823934; c=relaxed/simple;
	bh=HBg6SibUs1urS8KtNtxZyU66tOskoFp3/RfnmX6QDIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bHC55bdY9g0O6u/goifvEZcof6pPA8xNV/M8n1y256BdR8ZT2oi1+/35cxO2qMdWubf+DkSCAjGpj1BItU8e/W3MPFe/OufxyGNWt6V2v1iC74IZKRAFFdrH3txTMd/i5sFl9vqrT9tprgSAI205GLn+EWXhm9Z/de4Ho0pd2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPjKY12B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9566C116C6;
	Mon, 19 Jan 2026 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768823933;
	bh=HBg6SibUs1urS8KtNtxZyU66tOskoFp3/RfnmX6QDIU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uPjKY12BDYWaw8abaHwZYk4dt8xFujzyvcAOwQMglFBcjJsb4h8tsdG37IJb8dnyn
	 7FfbZnx/RtSv8I0w510iyilvtRpJAmBCmBDVk5Nh7I9b5lClTxtXCLdHxyhLsc6wUG
	 IxTSJc0vj0NB2puYGrhnD6RR2UUN8PVRdmgySwJ6kjJcmX7e/fmKeFgL2Ur15Cb6eU
	 gE9GVQFOmoCYz74UWxktp/WNzy1GfU/xdPVH/sAceHA2kK4dyB9VlSs4hKfMlDs7RU
	 6yeRMoc8RF7Q7Nn9qFOQAzwYABha0jo3+3oA46RqhQaOoGdMCiGSrNtOylwtBuYjni
	 WVf4GNfDRkjEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF400CCF2E0;
	Mon, 19 Jan 2026 11:58:53 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Subject: [PATCH 0/2] Enable uart and bluetooth for Xperia devices
Date: Mon, 19 Jan 2026 12:58:51 +0100
Message-Id: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHscbmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3cTsxJLi0uxM3dLEohJdkxRzA1NzCzOTpERzJaCegqLUtMwKsHn
 RsbW1ABTPxgNfAAAA
X-Change-ID: 20251217-akatsuki-uart-4d7057864ba7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768823932; l=690;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=HBg6SibUs1urS8KtNtxZyU66tOskoFp3/RfnmX6QDIU=;
 b=Ejt1k5CivNj7Up8XdDKPDpQGKTc6/tLJZt5xAICmDn5470akPSg7HE5f7KO/OLqTy36FOaLC0
 D1WMiVGr21SCiFBSfLTw1S/Omi8TqTbJN3sV98lhdKhgi8S7CgB8ikU
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com

This fixes the uart instances defined in the dts so the serial
console will now work if uart is attached to Rx pin on the uSD pinout.
Also now enables bluetooth.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Petr Hodina (2):
      arm64: dts: qcom: sdm845-sony-xperia-tama: Correct uart instances
      arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth

 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi      | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251217-akatsuki-uart-4d7057864ba7

Best regards,
-- 
Petr Hodina <petr.hodina@protonmail.com>



