Return-Path: <linux-arm-msm+bounces-85489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63646CC75DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA966301C183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B003352951;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKQXNZC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F74338930;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971565; cv=none; b=KeWIs946ALuLdmHcYTkOfeoCmN8VxU+dEncknCruQjmtIPZyVPDcleTNYoR+jbzkgzJDSCFa/q64aQE0EeWYmgEasBpa4NeT34A+uRvIGBJbAdkLL8nhD594rVsFnc4Yqf51pjW8xds7NxPezkUCLjzkJRhB0fK78SOMKuhQSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971565; c=relaxed/simple;
	bh=p1WldwTrpRxChl17GG81aXsQPP0VK+RjvLUrIAeadkI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VH+0QdkyhCGA2G3l88J299pSXFSzh5MRYrf4tm2YxoEf4vvwPq/G5yUeo/nzERLwk9pbh7xNeJbOC0859LEaWegAqiyJ5c5eX6gN7ba/UT7QMZZodNhrRDGHsofsuCDiUhvj7RsNsx5YU6wm0cZ3qsP3MIIZCpbk/6sD0nAgLb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKQXNZC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5739C4CEF5;
	Wed, 17 Dec 2025 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765971564;
	bh=p1WldwTrpRxChl17GG81aXsQPP0VK+RjvLUrIAeadkI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OKQXNZC+8/zAsUSEAs4IDX89qptX90XDb0NUyFW3Ngil7JGlDWLWbOdZ5KhMhRFoj
	 o8HeMHMW5QBMcw7qc9zi7WbjPiaSZTx8ryd/PKc12CTixb7a8r2UD8a+zJGT8Imfvk
	 /o5oTWsL3wOFwn8IqH+Zx1IZ6sRA9ezNQNNrLCIx+GSI8XRbz1vraUMC6Punv3g0HP
	 YP/ohWgOZUr7XkrOD8W9T9I0VXYQ7p3iXUxHOXfZZpCeFBYoD1TbF9CwAYoa6OcOfL
	 rsjg8T7BN/wYaVmIJDSNEGm5ARUgG4dwj/ctpiydpLshH5O3TeC6YFXNqSjp2QTJBV
	 8ncbehnqEO5mQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E07D6408B;
	Wed, 17 Dec 2025 11:39:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] Commonize pinctrl for camera master clock on
 Qualcomm SDM845
Date: Wed, 17 Dec 2025 12:39:22 +0100
Message-Id: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqWQmkC/23MQQ6CMBCF4auQWTumU1oRVt7DsMC2yEQB05IGJ
 b27lbXL/yXv2yA4zy5AU2zgXeTA85RDHgowQzfdHbLNDVJITZJKDHY8K42jeT5QKOplV2vpSoL
 8eHnX87pr1zb3wGGZ/XvHI/3W/04kFEh1dTO1qqwypwuvvBzNB9qU0hetZ2r0pAAAAA==
X-Change-ID: 20251213-sdm845-mclk-041f2a952e31
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=p1WldwTrpRxChl17GG81aXsQPP0VK+RjvLUrIAeadkI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQpZrq8sqGhUVWb/Yjh31dFIK16GVY0rutCj+y
 k6v1XfgPQuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUKWawAKCRBgAj/E00kg
 cj++D/9CpnmSUr7ktdd0/7Rh7A6Db/IizlbNaQ//PCqlQskWX6ZpNASkia5n2IIuI1fP4YRux1A
 0upzKZ5oFl32RIEy5iz3oH9/c5iU3Ucco4imprJ3m36WfSADiDgOqT+cTZryLBu8QVMSxU/V/6i
 D7deIEDUEuchYiuyDxjxWdk2A/0B6+CrLj32VX9XoJLgiU8mJo0eCS/TlRhzacWDIATIFJWKA5J
 1PScJc9To8jxS6q6aal+OCgKIySeRvu2/J9v5pJI/Jx8LYwZd9GuJggWTiZEal16Bh4jJSEbxF4
 rYk6c2eb65+vv1rs/FtZtbFR1pZ/IGE2VFOPBAbgYUtdoiaGI7KGqd3rRDLTqw3+jUZ5v0Ql0GX
 i8G73fQGiuoYg506vREmfP/QPKzshV3Yiq3KfmwwWT6ORmMSALyv6F1Ff3CiEtpG43SntEgpmUH
 kRh41C8Ztk9UJg0NJSptstjY4CGy40pnsFeBYKpn3k9Q/XxT/muawj5dwSsfCh4wNl28kM0a9Gh
 F+l/wZXMh8lurAEji+cMm3gBa4MaXrcqP4gkuw4ajyEcUYUuXm98XOUtlCuzoiffk9EzygTcp8B
 tuaD3aUh7Y9VuKnfWtqdqe51QqJWDQv4i5RALJjXXlfHJfylw5ZEVJMHmNL4H/XcehbJYXCggXj
 c0DvTyMg41lQzPw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Inspired by Richard's patch set for SDM670, I noticed that SDM845
follows the same pattern. This change prepares for enabling
additional cameras.

These pinctrl settings have been verified against the downstream
SDM845 kernel.

Since most of these are not yet used in mainline, testing was done
on sdm845-next using OnePlus 6 cameras with downstream drivers.

Thank you
David

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Added mclk3. (Vladimir)
- Reword commit messages.
- Corrected commit msg name. (Konrad)
- Link to v1: https://lore.kernel.org/r/20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845: Introduce camera master clock pinctrl
      arm64: dts: qcom: sdm845-db845c: Use pad fn instead of defining own

 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 16 -------
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 56 ++++++++++++++++++++++
 3 files changed, 57 insertions(+), 17 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251213-sdm845-mclk-041f2a952e31

Best regards,
-- 
David Heidelberg <david@ixit.cz>



