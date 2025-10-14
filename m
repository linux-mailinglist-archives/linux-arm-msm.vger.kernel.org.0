Return-Path: <linux-arm-msm+bounces-77132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC7BD87D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39D8F4F6BC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF6C2EB5B0;
	Tue, 14 Oct 2025 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VePCMTQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB622EA746;
	Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434948; cv=none; b=f23bHmsgC6XJ2npO2l9nZU2Pe3PQpMHMDcWCSsEgQBrIJ1FTFJ0gDrxmKAkrJ/dQR8Qco3Jt2bu4TKFHDtwBH0f/uTeMKnnWkRp8LG3XClXdr514/GMwQXi9CXClW1/IgbA0IVSm46sxTrKAhl+ouYaegCE+e2Ax+5rl11uqils=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434948; c=relaxed/simple;
	bh=/Gr1HOypuaP7bHUbs4AJMAplf1XetGJO7uuSZqoK1n8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ouPLxbD2pHIdF7EyL6FNtWnxyLmJsWUjfmPL+7oOo2K0TryQuif5sg2dhsC3sn6Gj8xiWdCbyqr+MBFXooUU3E/df9S9EN0GeK3xa8wCjACcVa+NZU4K3WuXBTplyO1lw2rOQo41a2ZH8gB/yvxJBPAMFda6y0o6mNacqDPGbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VePCMTQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78001C4CEE7;
	Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760434947;
	bh=/Gr1HOypuaP7bHUbs4AJMAplf1XetGJO7uuSZqoK1n8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VePCMTQHQzWQhy4+ZiNO7tQkw/0jGNMKMkWM991QTCb5U70d1p2yhYXClAcgZmG1S
	 RELzbHD1jYQhxdGcmOxsEwUapG+yHjFquwR3j4x+FRtU5K/m8TfmfAF6aFmK2GEQ+O
	 R37nhv9dYC8TCGExWHE9LO7BLnbp2A0bz1T+ydBkHJSiWktsSTq6ZXcMQVk+qcDi2j
	 Qr/cpGMBFrs7YMMM+2WXkmILix8HkXr+OiQ5/96gZFZOP+qUKeJPs8E544XmdW/1El
	 7MsgcpmirC9IrnyaDb1cERSkKneuoEE6QJjq7mWtyzK+kcplAVbZ5DLZioNHxat28z
	 rCyLaFqqPlxpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F59CCD187;
	Tue, 14 Oct 2025 09:42:27 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/3] Add DisplayPort support to QCS615 devicetree
Date: Tue, 14 Oct 2025 17:42:09 +0800
Message-Id: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUa7mgC/5XQwWrDMAwG4FcJPk/FdhOnLWP0PUYPjq2shiROL
 TeslL77lJSNDTrYTubXQZ9/XQVhCkhiV1xFwilQiAMH/VQId7TDG0LwnIWWulJSlWC9Bx9o7Ox
 ljCkDncflzRFOjoyqwPMahzkhAjprvdG1la0VvHJM2Ib3hXs9cD4GyjFdFn1S83SGSqWV/B80K
 ZAgdbsp7Va7smz2p3NwYXArF3txuN3thDylkO8fED0S2aXhrnieC8qtXH93v8w2pk+U55ljD9O
 GyXpbKycrr7TR+0i0Op1tx2Q/uy9z5QeIMndkBBeHnGLXYfpBUc+ShGkNCrw3EpvG8/Hxz4I2v
 57vYZWaq3hXobfWGaebx1BjCWGehLwrKt3Y2qw1H9zzgW8fdcqOeUoCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760434945; l=3054;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=/Gr1HOypuaP7bHUbs4AJMAplf1XetGJO7uuSZqoK1n8=;
 b=gwQREpPH6oPRGuFJyAotQ4FMnOfcb7rlgLTOfL6ic8K9UVIf8Cudu+8OYPJW3miQIXXhlK+7h
 LEf55W1wdoEC+erdvElZjjdQNMH70pS7v5tau+N3ZnHazLyx71Ml0X5
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
Changes in v2:

- Update register padding and ordering [Dmitry]
- Rebase the series on the latest driver
- Link to v1:
  https://lore.kernel.org/all/20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com/

---
Xiangxu Yin (3):
      dt-bindings: display/msm: Add SM6150 DisplayPort controller
      arm64: dts: qcom: Add DisplayPort and QMP USB3DP PHY for SM6150
      arm64: dts: qcom: Enable DisplayPort on QCS615 Ride platform

 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |  11 +++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  31 ++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 110 ++++++++++++++++++++-
 3 files changed, 150 insertions(+), 2 deletions(-)
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



