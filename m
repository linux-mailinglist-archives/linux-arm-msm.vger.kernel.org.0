Return-Path: <linux-arm-msm+bounces-57609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82181AB3AC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C7C87ADEE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 14:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B0227B87;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP0dEBs6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE978F43;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060626; cv=none; b=LP35k1/QncIHnEM3A7KZOyTWcZgEMAj3KTc73gJSeyn9pFZbNEdtrDg8g7YGYyaaMTp0H0nMszAtf6PkSo8UK9Bq29D0084+daRf2yGp35tcj35FAw33kRCu9IZNaznrFKcaVM4DrnSkYGc1Jb2jnTZyGzeHi2pbC6oPE4P3bNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060626; c=relaxed/simple;
	bh=FRmP3zLT6FTZhFpt8JSH7YRQTJkpK8mvEacJW0127co=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rffPrb95RdyMygTYsr0L6WNvWG1hwgZ107nI9sJ2uIo7Rxrq2in9Q7DvncJ+XjboE3/LihCeQIY9I+273u8CrJhcDGZJh6F3TXvOCi73yLatj3CwZchO7ndz5OBCuzoxRXfgCzIWwfo8JD+8qjipR/Z+XIEfV3X6lAZoFK3R1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP0dEBs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75CB4C4CEE7;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747060626;
	bh=FRmP3zLT6FTZhFpt8JSH7YRQTJkpK8mvEacJW0127co=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mP0dEBs6qFA9a+KZSBxENAaimfFs3+9hVL3Oe9WB8/cdPrwNEFAPzh75OT/hwtraG
	 kZ6YZO964rxPpVBOx3sH03ZW1eDcB5ZFQHr9mzOC50G0igfkJCQPcScaoRUt+yShjP
	 PPH1k5tn+KhTePpmKrYr6IPjkfQ0dDEKfGEpIq5WuX0ywmS4Cfcs4gblLVx0CVXC18
	 7xcAk9Mkp17aP6m9gbxJR4LAKlC6sa6YWXuDcrubLj/xDGWMUcCw2ubdNMP6gR5qYr
	 Ijzym7gl1l9Al0b85PrFO3aM45qZlLhWaBea3/JFZAwb71ssKghG74ZM9NK3V5AC5Q
	 xTFsjlMCDxEuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61418C3ABCB;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH 0/2] Add the download mode support for IPQ5018
Date: Mon, 12 May 2025 18:36:45 +0400
Message-Id: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0HImgC/x3MQQqAIBBA0avIrBN0UqiuEi3KppqNlQNRSHdPW
 r7F/xmEEpNApzIkulh4jwW2UhC2Ma6keS4GNOiNt6j5OL2xjZZHwh61pdq1ZCZEt0CJjkQL3/+
 wH973A+Wa8HtgAAAA
X-Change-ID: 20250512-ipq5018-syscon-1e349e0b224f
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747060624; l=688;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=FRmP3zLT6FTZhFpt8JSH7YRQTJkpK8mvEacJW0127co=;
 b=7mdpqeObKkJaAt9nkPLr/duLkUQjbUXO55r4rKC7MnLxbjeWHV1sQU4E9i12e1UULN0MHRg0i
 Ht4fIDzdmiIBy3ryICDE+BXcqBh5cdreqpysu2HP3zaJBgXU1l5bAhR
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

Enable support for download mode to collect the RAM dumps in case of
system crashes, to perform post mortem analysis.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
George Moussalem (2):
      dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018
      arm64: dts: qcom: ipq5018: enable the download mode support

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                | 6 ++++++
 2 files changed, 7 insertions(+)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250512-ipq5018-syscon-1e349e0b224f

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



