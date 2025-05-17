Return-Path: <linux-arm-msm+bounces-58264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B5ABAB58
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CE61189EC97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CAF2046B3;
	Sat, 17 May 2025 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTySJME/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8303C26;
	Sat, 17 May 2025 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502880; cv=none; b=pvM2wz5ErzRZoYltRS5pHeYDmoRysqT2rxh2lBTwA6oUJ5Q+u0bwdyZ163doCl7An61MC/rIJKdCFkJ1SlCUIU4WaRgHWxFNrma2gAhqnsmeQf1Ll+P8/CjRJrZkQ6GXCLP46jdWPPcSnFC99Bc6rxRuf/QPOG24riqdX8shka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502880; c=relaxed/simple;
	bh=3cwlAz1n3DgeW+YHIRySrPEbnsGKpM7GSJmdaotyDA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VV/lniFiUwkeeys8JPvUFNLxHEAHVEBwgLzvmS04j7dYR4eYotrSV8TuKMqZ/yuwJN85j/PasPayBBYc/TH5YRo6AM+mTBnxqQjPeXOrqoSpd4fvYPKFiHdHLTJQC981nLr+lJ8mHlfLkWxnktGJzhaGhQO/5DmZdthXz8zhS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTySJME/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3DEC4CEE3;
	Sat, 17 May 2025 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747502879;
	bh=3cwlAz1n3DgeW+YHIRySrPEbnsGKpM7GSJmdaotyDA4=;
	h=From:Subject:Date:To:Cc:From;
	b=tTySJME/GmwaWonCwqhf3KFAgbwyn+Ev+CIDF9v6udq59Yzu4Pzd/R6KZPJ4CiA3r
	 H5LkPs9mVN5ARCd8dgnVlHHFNBcvc/BSOl4sjF8CgNw5iSuJDvEOi2gxkcQV1NSt0R
	 sARez1iFqpicsKaYyfl6F+L/XagBGfkOWhCpg6EWM3GBSAcPjMVfvR94zOvwVjSGXl
	 J5dfawwyQ+yVGMKBZrYraOIj0ZXIEtGekqDnsUlgpHz3MAnANrl3FxkRaq80+DPa0q
	 od6sFiQt+ICNyA8WZ/cUV9CZcyTQBwlS9z4po5u0fiyasvPwEY3WXlmuE+47EIdCXD
	 hV+QAbXHA3QJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/5] SC8280XP SLPI
Date: Sat, 17 May 2025 19:27:49 +0200
Message-Id: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXHKGgC/2WNwQqDMBBEf0X23MgaDWpP/Y8iJSSxLqhJs1Zax
 H9vKvTUy8AbmDcbsIvkGM7ZBtGtxOTnBPKUgRn0fHeCbGKQKBUqlGLxgYxoZIM3HgMJWyhprLZ
 NW/aQViG6nl6H8dolHogXH9/HwVp825+r/HOthUDRVoi6VKqu+vrimfPHU4/GT1OeArp93z9as
 7CmtQAAAA==
X-Change-ID: 20250502-topic-8280_slpi-d152cdad893f
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747502874; l=1236;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3cwlAz1n3DgeW+YHIRySrPEbnsGKpM7GSJmdaotyDA4=;
 b=ukS6M9i3NtSXIMTgjVRGCAG9K3dys+UdIuhBOzv3iXEQz4tJNH5HTHRU8JFHPpwrfbyrB3ueb
 URBmrjI6RHEBr1q8B+Q2v87Ytlu+K4hqUAmHGqqkjI6NOc4s7HQiOUy
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

SC8280XP features a SLPI, much like its distant relative, SM8350.

This series adds the bindings and dt node for it (also cleaning up the
DTSI in meantime)

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Added FastRPC nodes
- Added the X13s/CRD patches
- Link to v1: https://lore.kernel.org/r/20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com

---
Dmitry Baryshkov (1):
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP

Konrad Dybcio (4):
      dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
      arm64: dts: qcom: sc8280xp: Fix node order
      arm64: dts: qcom: sc8280xp: Add SLPI
      arm64: dts: qcom: sc8280xp-crd: Enable SLPI

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  54 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   6 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 645 ++++++++++++---------
 4 files changed, 414 insertions(+), 297 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250502-topic-8280_slpi-d152cdad893f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


