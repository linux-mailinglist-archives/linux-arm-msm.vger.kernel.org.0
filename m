Return-Path: <linux-arm-msm+bounces-28205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E575094C81A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 03:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC73286515
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 01:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF718F6B;
	Fri,  9 Aug 2024 01:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Spfv4JHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D56A8801;
	Fri,  9 Aug 2024 01:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167807; cv=none; b=VaDpZmSl2FscBWFvKFbameBE+7YPQejAvDxGutFxYXzotflL5Ym5uRbJopbW7fw2OlTzE7kl2WVoLJgDEfp9rmBPpPZRVbbmnLgl3UM93V1Q8o8b6nRXZf1p+GjT+W6EOGfpsMCS/LyeYVSUaqcTue9+G0nfriWq3lwZm/PDjbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167807; c=relaxed/simple;
	bh=K/5f88Am9z6FZMxNzjwlV1oo2W3lkvEmTWBR0JGnnBU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EAgcQAJIHltDL4sCUoP8yN/KXgv55B2J1FGTW3VKWVJemO02eo5oz8zstN3qIFtJFJPAtp2EE+OqSmznrnNcNWbXbRpBMohLhUWe4T+eDR/dPdwnXTBbnIQPDOd7t2o3Dy1hzYBDAlDk5Xdz/SZQ11Qx+e1nv5ehkKvSxklqagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Spfv4JHT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FEBC32782;
	Fri,  9 Aug 2024 01:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167807;
	bh=K/5f88Am9z6FZMxNzjwlV1oo2W3lkvEmTWBR0JGnnBU=;
	h=From:Subject:Date:To:Cc:From;
	b=Spfv4JHTODCwijQ0JOwqbh89/6yUXwm+Z3ffddPSRURUng9MXoEkzrtQ6XoEdatVl
	 v+vz11SFPEZemqPPyDTuokZ/dHkpBDwrJJ454vQ+jAUgryNBvh7gVwJhunYJec7e2M
	 rGFlNWAlRjm5Dljy+mFYtNRNLy8hBQmn5S8BVhVO68wPD/DZclkLCj9CylINIZjygk
	 u9Q0QleFlPBV/gBcVdk7wt5TXTy9pneQ/at4Nxityyj9hfN9vRTohadMbttt4EVSSV
	 k4HcKKxHFhwYF3jzIzOTYq/xs/f/dCKNEcI9OgJ+okCzW78vXE9+Zc8rtWh0sc5rOg
	 gwd22xoAUWnhw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] X1E Surface Laptop 7 support
Date: Fri, 09 Aug 2024 03:43:19 +0200
Message-Id: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADd0tWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNL3ZL8gsxk3eIcc92UJOPU1DSDxJREsxQloPqCotS0zAqwWdGxtbU
 AaZ9jY1sAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723167803; l=1175;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=K/5f88Am9z6FZMxNzjwlV1oo2W3lkvEmTWBR0JGnnBU=;
 b=AZdlvxPWG8Gld7VMj9wu6GdJcWhjhAzfio406P4hIqccNR+DtnithNYDOsBgGgrZXU78QytUM
 mPyqI0yvOoNDinqHiaQuenUHpYBsEfKoZ1urCONaQCUbN4WNCk08FeK
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series brings support for X Elite-based Surface Laptop 7 devices.

See patch 4 for a more detailed status explanation

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
Konrad Dybcio (4):
      dt-bindings: arm: qcom: Add Surface Laptop 7 devices
      firmware: qcom: scm: Allow QSEECOM on Surface Laptop 7 models
      arm64: dts: qcom: x1e80100: Add UART2
      arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 818 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus13.dts |  13 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus15.dts |  13 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |   8 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  52 ++
 drivers/firmware/qcom/qcom_scm.c                   |   2 +
 8 files changed, 910 insertions(+)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240809-topic-sl7-db3eef0ada6d

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


