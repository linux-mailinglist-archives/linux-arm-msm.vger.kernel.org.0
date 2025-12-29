Return-Path: <linux-arm-msm+bounces-86885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D54CE8297
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 996D83000E99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB8E2DC338;
	Mon, 29 Dec 2025 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaUDKhY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8FE214813;
	Mon, 29 Dec 2025 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767041269; cv=none; b=SzvffDTEv6xceh6YXMllgLoFDaU0qK9J4qUiH6yyLtOoar9DvYnzs2epQCZZm9s82MibnXYyi1qMzr5qkuwYh0/gcYZ5weGWuyqs8F8sq/172T/DhAGTHqmuq2bJM5ssmck7mzSGoMZUio516eOL4KcFFhRRo3MsUVWO7TryPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767041269; c=relaxed/simple;
	bh=cZ1YMjEQdtWm1h+Qj/+oWufM5Kr5tCMOqx9g54cvDbY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aWsryigF3N1mBSLh4Dn5Wg7FhHhT56RmTs30i4X4mgjbk5BzcB74bO5KtnwnOaXL8w9GGaLMujadiaOMzcpkfXVxw22uBZEDZqWJ3XSCie1q/zOcTnm+TcFv3rOQUll94cziJGAHJFyvEseeFamTUvbMzILGAiBdpPXxkFecQfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaUDKhY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6529C4CEF7;
	Mon, 29 Dec 2025 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767041267;
	bh=cZ1YMjEQdtWm1h+Qj/+oWufM5Kr5tCMOqx9g54cvDbY=;
	h=From:Subject:Date:To:Cc:From;
	b=WaUDKhY+qdY9x+/OLvwRyFr0hW/B2lP7hhNOtCnux5d0vFF25f5zSz/0WsS+/TGYS
	 H4S8KHv6BbTQngvUmUijGuleInueak2Pt5XOGf4NcMUv9pkdLuFt4s+qsvo5UVju6b
	 s+jXZqYrFi3ELY+aZOtqfhPJYMAnqUoYwqzuJKRaicSpdqIbYiKVGQ1Cl0iKOrQqZL
	 Wnu/GlSVXAM2tcRLpBjfGm1gPYlz2pgq/570cFwW01Jhl5rm47quRQbES4IW1KYNcw
	 3oLMIVMMzcvGjUCgXiYMATOqep7Vch0ib2t22CAVVt+YD/GLjgW3uE+u62EwaRZZTM
	 2pridrhK2TAWA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH 0/3] Add missing CX_MEM/DBGC GPU regions for
 SM6115/QCM2290
Date: Mon, 29 Dec 2025 21:47:38 +0100
Message-Id: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOroUmkC/x3MQQqAIBBA0avErBN0wLKuEiGlk82mRCuC6O5Jy
 7f4/4FMiSlDXz2Q6OLM+1ag6grcOm2BBPtiQIlaIXbi2CM70SilbaG0IZ7Wz8GJtjOIDeKsjYe
 Sx0QL3/96GN/3AzVpBylqAAAA
X-Change-ID: 20251229-topic-6115_2290_gpu_dbgc-79822622b58d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767041261; l=861;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cZ1YMjEQdtWm1h+Qj/+oWufM5Kr5tCMOqx9g54cvDbY=;
 b=sOYNqtWr/LOe1ZrHy6LYfEhDMAbaCDc9C1+BkopyGK45Ous2LLAYszjqQfoBvkO7HQFXGxzUB
 ueAmn3t1YZwAG9v6/FnsUzLe5F35mZFpyd4mkNs+hX4T/sWHz8A0lsV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

These regions were previously left undescribed, fix that.

Compile-tested only, the driver shouldn't break though.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/702
      arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
 arch/arm64/boot/dts/qcom/agatti.dtsi                   | 8 ++++++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi                   | 8 ++++++--
 3 files changed, 12 insertions(+), 10 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-topic-6115_2290_gpu_dbgc-79822622b58d

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


