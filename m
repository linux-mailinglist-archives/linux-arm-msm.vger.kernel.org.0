Return-Path: <linux-arm-msm+bounces-65199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACDB072FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDB705672B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FAC2F2C56;
	Wed, 16 Jul 2025 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDuu6Dlp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863A9215F6B;
	Wed, 16 Jul 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660985; cv=none; b=fWJyzsqb2tQA79uGL+Ek4Z25BnHcX8rGBLZmXGEHbvsazHRZWeYw/ZmR+40YRZJ1520u4SuItkhtbqxEOQplU9UR4vYYdccLKXDazgRJ0MBFI4SdkRtodVC1mX+HVWNmXLjhaImcWbmbIUX6rq1EbsWv9qo/Glfd/D2vGcRadPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660985; c=relaxed/simple;
	bh=C8U2EKW6jdsZWIl2RXIYDu1e3lyJ/jnCYupiNbG6rqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g7tNlAfU4kGIJjNay+KXSggxaHviPfJCy591lWXo6JWWnMDT8ZLLrkoTrYloT+tsdUkopMMNm1a7ibAXsOaEL0yOhwCMuNhOr5YmBiFMTohKjndvZMFZTQhHlB4QX/EdK/nSy8gqO2BrPclV1dQW8hitIHXX+F0WzYHeQnAGa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDuu6Dlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41C9C4CEF0;
	Wed, 16 Jul 2025 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660984;
	bh=C8U2EKW6jdsZWIl2RXIYDu1e3lyJ/jnCYupiNbG6rqk=;
	h=From:Subject:Date:To:Cc:From;
	b=CDuu6Dlp/PE2oWBq/n1FeXcxSAfhs3iBAQb/bxYtoGHugL6UzEYQFyq6MPoUszI1w
	 NDLiNlKHiR4KtZXycihHzygL33DZcmAbPGYIrjiy/xfFvCndy7EEgtRGNw1z2RRwLj
	 6aeF38E9jE8/3VaRK4SWp79IO9TOPV6nOC23ipOuBOOl11nP90n03PoSp/zoJl+lai
	 QnRvdgISFdwd5KahOh8LIxwvijMpwGiPmT9iEpSGIoRW7mSboftnEDVGgom7h+hbQp
	 ilVfxTjSmwUfLAxyQB3z21ct0fYixxliTdIRGzpZdoRR0cPTc9Tq3jUN7T8xQzYmX3
	 QeQ2Oo9eB/U1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] Retire SDM845-cheza devboards
Date: Wed, 16 Jul 2025 12:16:06 +0200
Message-Id: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZ7d2gC/4WNQQ6CMBREr0L+2hJaUkBX3MMQQ0uhPxE+trVRC
 Xe3cgE3k7xJ5s0G3jg0Hi7ZBs5E9EhLAnHKQNt+mQzDITGIQsii5pIFWlGziWhYcLLhpq359Ex
 xXTZqHM+lVJC2qzMjvg7vtUts0Qdy7+Mm8l/7zxg546xqVFUPVaFFLVryPn88+7umec5TQLfv+
 xd5MBMhwQAAAA==
X-Change-ID: 20250715-topic-goodnight_cheza-b1c38bff935b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=1733;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=C8U2EKW6jdsZWIl2RXIYDu1e3lyJ/jnCYupiNbG6rqk=;
 b=ABLFgPgQnwfUegih1onsZ2LADJ3O3eAVzR7G4DOPYRlcqMIDaIHQVdmXgY2BBztinW5HV3bn+
 ImJ6f+6E9FdDWr4SzHOgtTao6yWdNQOUVkmokuOamhtHuIlbVo8U86b
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Cheza was a prototype class of boards, based on the 2017 SDM845 SoC,
used for bringing up ChromiumOS on Snapdragon platforms.

Today, almost none are left in existence, and the small amount of
remaining ones don't get any real use.

To ease maintenance burden, remove it from the kernel tree.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Drop the MAINTAINERS entry
  I wasn't sure whether to go with a separate commit, I'm fine with it
  being squashed if that's preferred
- Drop the dt-bindings, as the board practically doesn't exist anymore
- Drop the SMMU bindings entry
- Link to v1: https://lore.kernel.org/r/20250715-topic-goodnight_cheza-v1-1-68b67d60c272@oss.qualcomm.com

---
Konrad Dybcio (4):
      arm64: dts: qcom: Remove sdm845-cheza boards
      dt-bindings: arm: qcom: Remove sdm845-cheza
      dt-bindings: arm-smmu: Remove sdm845-cheza specific entry
      MAINTAINERS: Remove sdm845-cheza device trees

 Documentation/devicetree/bindings/arm/qcom.yaml    |    3 -
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    4 -
 MAINTAINERS                                        |    1 -
 arch/arm64/boot/dts/qcom/Makefile                  |    3 -
 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts       |  238 ----
 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts       |  238 ----
 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts       |  174 ---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         | 1330 --------------------
 8 files changed, 1991 deletions(-)
---
base-commit: 0be23810e32e6d0a17df7c0ebad895ba2c210fc4
change-id: 20250715-topic-goodnight_cheza-b1c38bff935b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


