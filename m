Return-Path: <linux-arm-msm+bounces-77268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22CBDC10D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09A98188A404
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 01:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC47303C8D;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doR6YQP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840711F4191;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760493282; cv=none; b=Sse1UIUG8tAJ+AhonAP9T/59b/lrbvmfBYk1hhOQTqq7gE7a/wMPR2YWjAa3/q6d58b63m341GRuWsLyQbzqrw4i7CDwUNq/FQtMqG14KrmJwnYpjn2WERHy0cokHy7wNULsz+O+ZnjioUUt4aE/eOHffeA91ks1S1ZheSlnATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760493282; c=relaxed/simple;
	bh=+vEmGWQQrDRoUOjcjCvVy31byqjOMqF0O0P7SdUqhAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OsykGJzDDCaKD297kqnvDvBLvS8t+SpBS+yfVNa7I0EC94tuxtgEETmvZBV5Z0VzL64rzMxYfTXscVEGqgAt4yAU/vr+8jF52ZUcZxjg5E3/54Q2NusolS9t4pNU17gdKE5rEw9TRfJgu1KIBrsJAr0xILOFJGoTKme8QN6iW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doR6YQP0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECB52C4CEE7;
	Wed, 15 Oct 2025 01:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760493282;
	bh=+vEmGWQQrDRoUOjcjCvVy31byqjOMqF0O0P7SdUqhAk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=doR6YQP0p3imKKSDU5voYElw78pLSUFVYz6eJEaRUVDuAzXXexX7gpLL9WMi9vBaE
	 uIxYTGsi3MjvSiWrIGN9MrP9kPI/b/lU3Qg/6C2mqu+K3szCXRDQxI41t5UdB7YqCc
	 ZmUVvJhVQW8HGojGjg3HfcRF6zPsGBFi2Yul9WGNAZNY6xhZqLb+A1ZUympa8VHPR/
	 A80VLGK0mG11eTUlAPAFuTevABFEQAluOy4+qequfBtQ4pbiEzlUOFoAH4Q1vS2z2t
	 fqUyCFW6EurkLJaLqpayjxUh514xWiRBXHiBRKfFq8E37oRLNC88kmBaSpZYdDw/6d
	 06/4kXxzi3ejw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6183CCD192;
	Wed, 15 Oct 2025 01:54:41 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Subject: [PATCH v4 0/3] Add DisplayPort support to QCS615 devicetree
Date: Wed, 15 Oct 2025 09:53:17 +0800
Message-Id: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJH+7mgC/6XSy27DIBAF0F+xWJcIMMZxVFX5j6oLDOMGKTYOE
 KtRlH/v4Ch9qK7Ux8qaWdyjufhMIgQHkWyKMwkwuej8gIO8K4jZ6eEZqLM4E8FExRmXVFtLrYv
 jXp9GHxKNx3H+Jk8PJipeUYsxBlIAoGC0tkrUmnWaYOQYoHMvM/f4hPPOxeTDadYnnrcZklxw9
 jto4pRRJrq11I0wUrbbw9EZN5iV8T3J1CRu8X+4YxIYzwVrbFdLKznb+hhXh6PeY3z/bpT/MUo
 0agmmUa1ecykXjMu1wwB4XXTpWiTpIUY9v9SmuM84a1j5EX+DOx9uMu4Tjj2d1tltam5YZblQ4
 ov7kJ9uAeHqiozU+CEFv99D+ETFHiWWL+PUWsWgbS0WAz8WhPq2w8VTajzFmgqs1kYZ0S5DrY5
 A88alTVGJVteqFPjjWCz48gpjMVG+EgMAAA==
X-Change-ID: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760493277; l=3567;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=+vEmGWQQrDRoUOjcjCvVy31byqjOMqF0O0P7SdUqhAk=;
 b=jOYFbhrT/z9IZpDENYQXg8bRTDadKw2rUZZxpgbvZExuThvBXCrliX+pV01mFt4TjG35cadzf
 z8UQ2XTu3ElD4s8PqMOQW4xv8f+2dMamNIRb66aUlTmt0VV83eBrslD
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

This series enables DisplayPort functionality on QCS615 platforms.
It introduces the required bindings, updates SM6150 dtsi for DP controller
and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with 
connector and link configuration.

Depends-on:
https://lore.kernel.org/all/20250903-add-display-support-for-qcs615-platform-v8-1-7971c05d1262@oss.qualcomm.com/
https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v4:
- Update commit message to reflect data-lanes changes.
- Link to v3: https://lore.kernel.org/r/20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com

Changes in v3:
- Move data-lanes from board DTS to SoC DTS [Dmitry]
- Add missing assigned-clock PIXEL1_CLK_SRC [Dmitry]
- Update subject prefix to qcom: qcs615-ride: for DTS patch [Konrad]
- Link to v2: https://lore.kernel.org/r/20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com

Changes in v2:
- Update register padding and ordering [Dmitry]
- Rebase the series on the latest driver
- Link to v1: https://lore.kernel.org/all/20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com/

---
Xiangxu Yin (3):
      dt-bindings: display/msm: Add SM6150 DisplayPort controller
      arm64: dts: qcom: Add DisplayPort and QMP USB3DP PHY for SM6150
      arm64: dts: qcom: qcs615-ride: Enable DisplayPort

 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |  11 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  30 ++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 113 ++++++++++++++++++++-
 3 files changed, 152 insertions(+), 2 deletions(-)
---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
prerequisite-message-id: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
prerequisite-patch-id: 58be7053007469980bd7cc9fe315b66bbe021c31
prerequisite-patch-id: 3c2120117f72c64f69beff32c0239fbc7f808f36
prerequisite-message-id: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
prerequisite-patch-id: eb07ea58347e77ee18fb6dade040affb0ab68954
prerequisite-message-id: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
prerequisite-patch-id: 8c6c905df7ee55a92a4e52362c8fa7cd9742de04
prerequisite-patch-id: 0dba0fafd032bbd6cd117175f61efd1e56ae9228
prerequisite-patch-id: d954b18774cfc0cfdb23de09aab3c56cefb8e1ea
prerequisite-patch-id: 13f2d2efbcee6337001b5f8519a6da9a41d05276
prerequisite-patch-id: 3a7144645ede23ccc7d54420e5a32e5bfa3bb776
prerequisite-patch-id: b3ea55e92953c1526eaf7c5c21d939a5f8502711
prerequisite-patch-id: 977189ef7cecbe7237175a8ef611fffb814193b0
prerequisite-patch-id: 3a12c1b4f00eb1d074e51d586f2dae3a44de0613
prerequisite-patch-id: 7f80e93057c1fd088ac6b4b0652cdfe2ea221cd5
prerequisite-patch-id: 8b29d292717782982e4450a509f4428fe6e895f2
prerequisite-patch-id: 621c3ba6bcf5b5782a5264faed72fdadfd47c630
prerequisite-patch-id: 9c63f2c5bb39527e3031b2d168e3c9419441e8df
prerequisite-patch-id: 364f6a7d8f4e1bc79a8f236b8d5a2425ffd225fe
prerequisite-patch-id: eb09ea48625b5c0d39ffb37babe7d8c32a4b3122

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>



