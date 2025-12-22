Return-Path: <linux-arm-msm+bounces-86259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3284FCD6EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AAFF3004849
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E90F337B8B;
	Mon, 22 Dec 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoN4uyv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF933290B;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430342; cv=none; b=qR2FvXa/VwMEIrUBKT/jKrfZ5ZEAFiivp//M00lPH6L2/oz1b3gPEPDLZyv/9E1eI0ZUN2zivBo+KbYO/nves0L//bIojSCk6ab7aWNqeKBOw/S7pu7n0txTkDB88a4XDr+xkfJzPohbxmG3+t16kfHD6YkNUFu+KIzNbMpPrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430342; c=relaxed/simple;
	bh=XAzRaUtpQSpLF7PqIZuIw0FO0Ql8emL2AC23FHRYVkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MTH+cBVcP/wPl2z4lOnuNoIHUUXnbVmmmI8VSGFNSU6SjRY/Y8Df63fBjarZSWaPS8ZIQirsdlJBuJJLmi49NrhuhPGIdM1ne9nt9VbpwXo8oHDjSJzWsC2B2v+R1UnOAEx4khRP6O4e89SRZMmdDD1hxTVPMrQG9YdNGJfb2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoN4uyv1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94336C4CEF1;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766430341;
	bh=XAzRaUtpQSpLF7PqIZuIw0FO0Ql8emL2AC23FHRYVkE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aoN4uyv16cxq6rEPBwZUQYHxkEDQLGvAwSu6a59NfMyIkig9RLC/cimm41Z5/765I
	 kdY5rPatxNQGEZAls5Ig7VO7yZEmFzUbP76TO+gecesozGo3ttpQ+jPrsJZVDvI3Bt
	 I+NuRijNgHXiJHEwKBDqA6mut461DuY95iHc0xuhHm5afAu+HDKndtvH698zQ6eJEk
	 kG8LeiPgBfb9a/EyWUT1eiW+PN4WooMcJ4QPav58jQjdl3SMgZfoYuaW3nd2+pq2Zn
	 lhWyq9tHr4LrkFLheVw7GR2sw3mXoOGgzNwWASVqvK1h5jUbmB40nLM7kdndeSpLU/
	 9WHLAknOc+RWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8333EE674B9;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] sdm845: Update firmware paths
Date: Mon, 22 Dec 2025 20:05:36 +0100
Message-Id: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICWSWkC/x3MSwqAMAwA0atI1gY0VK1eRVwUTTUgtbT+QLy7x
 eVbzDwQOQhH6LIHAp8SZXMJZZ7BuBg3M8qUDFRQVRIRbo79esQaHV9oL/RmX7DQxqpGaV1PLaT
 UB7Zy/9t+eN8PVDmVZGYAAAA=
X-Change-ID: 20251222-oneplus6-new-fw-path-08af474886d9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XAzRaUtpQSpLF7PqIZuIw0FO0Ql8emL2AC23FHRYVkE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpSZaD/d5ILSKZpSBgn8hdmX66LHDjB8DsyxS6i
 D/XcqLSF9KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUmWgwAKCRBgAj/E00kg
 cr2rD/9f5JFbgw9MRTNdc6sP8huUcSldBiTAte5Ee6T6fZbDdF0qKB99JHGobo+CqFANnLXkxkF
 s/mWvHXv2zBolyI52noFn3L82yNMvEUx77lzuItyCJub/fQScKm4WxBLVsrjxiFa0lsT0zeFEYd
 GT23gilHIqOWrN4tqIn1MDpbSsWBwkTTupV4krIDrur3+dt4K3KN/HggHQDe8OfyxkNXiutMcPD
 y4ku18TUmBB28T2Ji/QpfJNSb4ho3N7IsCnI3taC+7dcEvbeRVAse+d1/zd7IVC39O0q/kMsBts
 oJplE4EzxNo9Yq6KSOPkG+BOtc5EHBirxgeZH0rNy46Z5mKHbFCi0Ed8ov/g7569smpiLqRXwPO
 E5d0aoI40rIZi13HiZM4CSIQgAK8AZ4kSbsB767GPJiuC+myYomp/swI4/MPC6dfBRZtbprEqn0
 8VovEDM3jhCPtOkNiIh5X2kWtvDThIip/Orxv4cyZlUZNkViyEiW4PSxfdaqbZfZW9QrsuG+JYy
 MpULAFt7Am6/mP+lOwSzMTmCpcqXZV/81ouvEwYeecBdM7ykO7UffOj8gSo4f+nkE7NRRuh/NGq
 xhyuEG+JjliATninJ6JpdOVuCl5OCMn2CiLMShzNoEtPGVurZLi3QgFUGEHL+A9m9OWaw+1EWq9
 oOh6msndLaJwSZw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Update the paths for phones, where there are no patches pending which
includes the firmware path update.

I haven't touched the sdm845-mtp and db845c intentionally.

After merging, I'll notify distros and send MR against droid-juicer.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (4):
      arm64: dts: qcom: sdm845-oneplus: Update firmware paths
      arm64: dts: qcom: sdm845-axolotl: Update firmware paths
      arm64: dts: qcom: sdm845-samsung-starqltechn: Update firmware paths
      arm64: dts: qcom: sdm845-xiaomi-polaris: Update firmware paths

 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 ++++++++++++++--------
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 15 ++++++++------
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 22 +++++++++++++--------
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 17 ++++++++++------
 4 files changed, 49 insertions(+), 28 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-oneplus6-new-fw-path-08af474886d9

Best regards,
-- 
David Heidelberg <david@ixit.cz>



