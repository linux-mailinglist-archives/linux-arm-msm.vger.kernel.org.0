Return-Path: <linux-arm-msm+bounces-39623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4D9DEB9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72BA5B2195F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 17:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD8E155391;
	Fri, 29 Nov 2024 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzPI9xO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0C130AC8;
	Fri, 29 Nov 2024 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900837; cv=none; b=OELbNlV3zJ/lItZjgKOLqp2Lw4KuuDz7aBEuWJlCZ5fLpd745iNWKsQrx3lPt+7tsu8NGuMH4yuT+XHL7W++4zkTAE9OwQO4Dxxs7zqTAjVk9E7TIP67WxRAkNgoQQ1BGfWmbQrvAT25QjLOWB41NyFVO8LAy6qvDlSiigG4jlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900837; c=relaxed/simple;
	bh=kYuRtT+4WGlW2IEnMjQNUf5HU3odE6MCnttpX+YQGm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aE2Pj2KcDdmkoWp4YYoin3T7QNeqcqcr6OKHJUe+UyJvDLeqXUmpkU+62dGVidX2le8lZb2C7avIGBnHtNBYmKdf5jNQyTWAXQ6mkK4WDoHNmTIHmnl6u2Ldwdrv5U73cF4FCgj20JrcBDsw11fwt3LvwFkzEMZbrYMJq9BGcjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzPI9xO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C5AC4CECF;
	Fri, 29 Nov 2024 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732900837;
	bh=kYuRtT+4WGlW2IEnMjQNUf5HU3odE6MCnttpX+YQGm8=;
	h=From:Subject:Date:To:Cc:From;
	b=mzPI9xO/SBAk2XbttlcndSmtC64Ja880gOkWEODociuaPd0GuJxSq8W6M5NrLJQGv
	 qoAxLPs22Y1nTYY6MYUHZ3XN1+sCCzRgWTVtx7qpEb4Kt+0fSiZ2juO3JerAbaIDQ0
	 sQJwnBUR+zkwFHsoXpsca4Ja/7On1rPXxCdNbceDTXKhRM3WHyPqbFFvfcrujB4+/O
	 EAVz/F9BHuBaCjPouDGtgzoDw4zq0f03DXnGO1ZfV5dflYmaja6X1mAWhVbrKNBGtB
	 yTASIGV30wVXOXMuBasENvMw5j2xDtUzPfdociE+r166RWvgCWjPagQsoT/WpsSjaL
	 4c2N9dBEbpNrQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/3] More Surface Laptop 7 features
Date: Fri, 29 Nov 2024 18:20:24 +0100
Message-Id: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANj3SWcC/3WNwQqDMBBEf0X23IhZJdae+h9FSoxrXVBjs1Zax
 H9v6r2XgTcwbzYQCkwCl2SDQCsL+ykCnhJwvZ0epLiNDJhhoTWiWvzMTslQ3juyCypXVm2Oham
 sKSCu5kAdvw/jrY7csyw+fI6DVf/a/65Vq0zlORltGjqXVXP1IunzZQfnxzGNAfW+719m7hset
 QAAAA==
X-Change-ID: 20241122-topic-sl7_feat2-c79d32469a64
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732900833; l=1031;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kYuRtT+4WGlW2IEnMjQNUf5HU3odE6MCnttpX+YQGm8=;
 b=LKINKGzpZMRNTtWOQWj2h7bPV0BwhH+K8UxWiAwKUFu3vYBiwvaPs/FEtqLysmXIOlVmJjRFJ
 BjPh0+InnnyAnRthPPZle9BLuJaFfERdyBYklhVcBd16aLEGk9F+upZ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series does the necessary plumbing for audio (alsa ucm & topology
coming very soon), dual PS8830s and the PCIe3-mounted SD card reader.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- pick up RBs
- sort some nodes properly
- drop PCIe port power supplies, they are on at boot and will be
  described in DT after a suitable binding is created later
- Link to v1: https://lore.kernel.org/r/20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com

---
Konrad Dybcio (3):
      arm64: dts: qcom: x1e80100-romulus: Configure audio
      arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 / SDCard reader
      arm64: dts: qcom: x1e80100-romulus: Set up PS8830s

 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 511 ++++++++++++++++++++-
 1 file changed, 505 insertions(+), 6 deletions(-)
---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241122-topic-sl7_feat2-c79d32469a64

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


