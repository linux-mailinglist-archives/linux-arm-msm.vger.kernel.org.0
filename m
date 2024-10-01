Return-Path: <linux-arm-msm+bounces-32836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835898B49D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309C61F21B74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 06:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1139F1BC072;
	Tue,  1 Oct 2024 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhOmqNeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A11BBBC4;
	Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764924; cv=none; b=uMVY4Li9s1QKoVvuF86G3dWw1ubRVOMlFXhHrKoOxopXwZMirAtqdyehuKdRChm5vxzFHQF8YQMZAakpgqCw3EQzf6RtKBz7wWA2mLjB3mIz15H42q21OLi36fubjdM8tu2wDNYzLseYVxCQ+rHgTzNpD0GONnDAYby/KZ3AIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764924; c=relaxed/simple;
	bh=RFBfeiQ3kImiTf9iCh1nA3uLTEXECoQ/rL+Pil+RxJ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gBDqYbo59ixlfYp5ERy1nOigG4I9Fvl5EkvGOgSPD91OxTT8HeKKX+iW8FYwh+lgg17wfa7w38XfwIdVGJ/TYWcjjNhkkTfHd2EVMp9If+yxj6w3luj2fQ6q3ZttI27JDQFboGLqbKVPKZCELbGPoqgjVK/3iMhGlXe4+AA1K9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhOmqNeG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B1B0C4CEC6;
	Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727764924;
	bh=RFBfeiQ3kImiTf9iCh1nA3uLTEXECoQ/rL+Pil+RxJ4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KhOmqNeGbIgspQXtvwN5PzW3TXgAKYmIvJjuiO1q7FF0QH1Z54WFynZjWWYedttCM
	 sh23yol9tc2T+NienYPUTr4/CuvdnUn7OXhLkC2g9ykIm/ez6jHAAd51uVl/5fNGjO
	 nBTN9YpRKWLS9G6hPl8XQPTWWdyiJ8xROB9cnQkjqdGbF01JRMmW+vgeBe+kWrDOep
	 DxulkHZZMPG/hO4PKcIOo/S+viS1MK+ul01GBa7NMjhPCM/Xk+syE+tvUI9X8SVYWL
	 6YLuRZa4FaVpmKJvaqJ8u6s5WjAS4TyWfasNPa3wdvoam8+INGmHSJ0HoZxUG632mJ
	 OeyGGkvM6wt3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D417CEB2E8;
	Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
From: Mahadevan via B4 Relay <devnull+quic_mahap.quicinc.com@kernel.org>
Subject: [PATCH v3 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Tue, 01 Oct 2024 12:11:35 +0530
Message-Id: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+Z+2YC/03Myw6CMBCF4Vchs7ZkpgUEV76HMaSOg50FFwsSE
 8K7W125O19y8m8wS1SZ4ZRtEGXVWcchwR0y4OCHhxi9J4NFW2Dj0Ex+4bC6lkyFyDemsmikhvS
 fonT6/rUu1+Qujr1ZQhT/V7AVEZI75tYiUlkbMs+Xctv74Kfzd+rAOY897PsH/jV1np0AAAA=
X-Change-ID: 20240930-patchv3_1-600cbc1549e8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727764922; l=2620;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=RFBfeiQ3kImiTf9iCh1nA3uLTEXECoQ/rL+Pil+RxJ4=;
 b=fKnZ5k6CWZ0PFBIPrYz4dqhEIPGH3wp8wZeAzyc0OGoAcdqef6TraNEIwSEfmKZwkFpmqMHzs
 MZnQg9eND9eA7Bvp+uMIHt3HyFMvYwGE+Vz7VullWX2aU/kiEqTfgtx
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Endpoint-Received: by B4 Relay for quic_mahap@quicinc.com/20241001 with
 auth_id=236
X-Original-From: Mahadevan <quic_mahap@quicinc.com>
Reply-To: quic_mahap@quicinc.com

This series introduces support to enable the Mobile Display Subsystem (MDSS)
and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

---
In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
depends on the clock enablement change:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

---

[v3]
-Edited copyright for catalog changes. [Dmitry]
-Fix dt_binding_check tool errors(update reg address as address-cells and
 size-cells of root node one and maintain the same for child nodes of mdss,
 added additionalProperties in schema).
 [Rob, Bjorn, Krzysztof]
-Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
 path in devicetree. [Dmitry]
-Update commit subject and message for DT change. [Dmitry]
-Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)

[v2]
- Updated cover letter subject and message. [Dmitry]
- Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
- Update bindings by fixing dt_binding_check tool errors (update includes in example),
  adding proper spacing and indentation in the binding example, droping unused labels,
  droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
- Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
- add reg_bus_bw in msm_mdss_data. [Dmitry]
- Fix indentation in the devicetree. [Dmitry]

--
2.34.1

---
Mahadevan (5):
      dt-bindings: display/msm: Document MDSS on SA8775P
      dt-bindings: display/msm: Document the DPU for SA8775P
      drm/msm: mdss: Add SA8775P support
      drm/msm/dpu: Add SA8775P support
      arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU

 .../bindings/display/msm/qcom,sa8775p-dpu.yaml     | 122 ++++++
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 8 files changed, 951 insertions(+)
---
base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
change-id: 20240930-patchv3_1-600cbc1549e8

Best regards,
-- 
Mahadevan <quic_mahap@quicinc.com>



