Return-Path: <linux-arm-msm+bounces-56246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38ADAA4A15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388B21692E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598C3238171;
	Wed, 30 Apr 2025 11:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hv4fKZhq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222161DF25A;
	Wed, 30 Apr 2025 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012886; cv=none; b=pua68pJ4SBGG2xFqK/33XqVQ9hHI0h7pPzuP/9pbAW+YU8rBufJQgb5ANRjdMYyvDTquEUV3QLnVt5YytJz3Ow6hyXpxQFR8BIPHDTp2NppjCnFw+D9yCEbWMG+o7H/7ZRytOuqrXqix1EaCiL1WxrgYCSDpKm1jqiX8xmOcCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012886; c=relaxed/simple;
	bh=thygaK3pVYF1AA8SpbOU7FFVyeehmbRoHJuzSWDtj8A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NAaAZe3l2oGxpTXQUk6TGRGJPFN1E0+sG4fQHIv1LSeVySfuZdmrvXCJG4L/dbXbVNDId+urn7v+9hzbIOx4rPmQjLmKlyQZ4tpCKinI+3Eti5R2512+3JKVtLIOREq+SZ6YvUlt+86lvPPdqaWxWX695oHSqPyVDyUgo6P9Bq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hv4fKZhq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC41C4CEE9;
	Wed, 30 Apr 2025 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746012885;
	bh=thygaK3pVYF1AA8SpbOU7FFVyeehmbRoHJuzSWDtj8A=;
	h=From:Subject:Date:To:Cc:From;
	b=hv4fKZhqGQ1mh+Oukbbbh+F0umD8+OLwjvrEWaJUKkAtLiB9qf7ZZt2zSwjNW5ahW
	 X4tbfLhds2sAouOjEuZnaJKNRh5hgcPsdSD3/ETFcagtvupek1zN7jPMEbOYt6hA21
	 +qE9Rzq6LRERRnWNRu64YHfAG4Lqzx/INX0/Q2GUAskX8NZcRH45emu5cXbpmibTz9
	 eHmg9w5D+tRZHYjEbojxKMf3WcEMJfeXfOpXvfrcCp/DIpUBBYfa2JvY1bDULJl8El
	 h7P3mIm5Ayc0yaZhp0SDoGmjXnesUVUkHFFpFNX7vfldYVU8TPIucdQy1buKYBmDVj
	 6pl2oGMt7LciA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH v6 0/5] Add SMEM-based speedbin matching
Date: Wed, 30 Apr 2025 13:34:34 +0200
Message-Id: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoKEmgC/x3MwQqEIBQF0F+Jt05oJI36lSFE61ZvkYkvhoHo3
 5OWZ3MuEmSG0FBdlPFj4SMW2LqiafNxheK5mHSjTdNqo84j8aRkx+4kAXPg6DIkcVThYzvfm84
 bG6gEKWPh/5t/x/t+ALbVWnVsAAAA
X-Change-ID: 20250425-topic-smem_speedbin_respin-b167a957a56b
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746012880; l=3145;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=thygaK3pVYF1AA8SpbOU7FFVyeehmbRoHJuzSWDtj8A=;
 b=nCspHcXspEJwJYb529OHgIkm/Xfw1wF2PgNLZZcmClcEcg5fG8xcyuZeY8kvWzpc9Tvt7aTxg
 PCdcRzdEBrdCtqvNrMyb+5toDZIQ9TD/JA7+x8r8TKHP6mJiPOPf4kh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
but instead rely on a set of combinations of "feature code" (FC) and
"product code" (PC) identifiers to match the bins. This series adds
support for that.

I suppose a qcom/for-soc immutable branch would be in order if we want
to land this in the upcoming cycle.

FWIW I preferred the fuses myself..

---
Changes in v6:
- Rebase
- Some cosmetic changes in comments
- Better explain the backwards compatibility issues stemming from
  incomplete platform descriptions
- Hopefully fix all the remaining edge cases..
- Link to v5: https://lore.kernel.org/linux-arm-msm/20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org/

Changes in v5:
- Rebase
- Fix some unhandled cases (Elliot)
- Fix unused variable warning
- Touch up some comments
- Link to v4: https://lore.kernel.org/r/20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org

Changes in v4:
- Drop applied qcom patches
- Make the fuse/speedbin fields u16 again (as Pcode is unused)
- Add comments explaining why there's only speedbin0 for 8550
- Fix some checkpatch fluff (code style)
- Rebase on next-20240625

Changes in v3:
- Wrap the argument usage in new preprocessor macros in braces (Bjorn)
- Make the SOCINFO_FC_INT_MAX define inclusive, adjust .h and .c (Bjorn)
- Pick up rbs
- Rebase on next-20240605
- Drop the already-applied ("Avoid a nullptr dereference when speedbin
  setting fails")

Changes in v2:
- Separate moving existing and adding new defines
- Fix kerneldoc copypasta
- Remove some wrong comments and defines
- Remove assumed "max" values for PCs and external FCs
- Improve some commit messages
- Return -EOPNOTSUPP instead of -EINVAL when calling p/fcode getters
  on socinfo older than v16
- Drop pcode getters and evaluation (doesn't matter for Adreno on
  non-proto SoCs)
- Rework the speedbin logic to be hopefully saner
- Link to v1: https://lore.kernel.org/r/20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Konrad Dybcio (5):
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      drm/msm/adreno: Define A530 speed bins explicitly
      drm/msm/adreno: Redo the speedbin assignment
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

 arch/arm64/boot/dts/qcom/sm8550.dtsi       |  21 +++++-
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |   6 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  34 ---------
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |   8 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  54 ---------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 107 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   6 +-
 8 files changed, 141 insertions(+), 97 deletions(-)
---
base-commit: 07e7f436c1caa294bd689004077c553957915afd
change-id: 20250425-topic-smem_speedbin_respin-b167a957a56b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


