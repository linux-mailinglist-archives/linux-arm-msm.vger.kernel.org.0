Return-Path: <linux-arm-msm+bounces-38911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61A9D68C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 12:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A1C1B2195E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 11:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33037192B82;
	Sat, 23 Nov 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oviE+CVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05794188907;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359975; cv=none; b=itZgMy/0uraqnIqD2uXtG9SAS5j5Yjo6R1a224GZiPW4FPlMMgpmSpW2mAQpJbMcasCD0mDdlJMBha2TXVGNnOb2jfemmYFPylBd6pP8dIpogs3sgYjnVcr1+QRWxGJCrg/7lFVoLMXtSgWxfFZEmjyLT217xR3MV+GO5kE5pZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359975; c=relaxed/simple;
	bh=k3s+kIa0CozrUauq1AcjHwaHwwjQ2E8jG+8stGujCCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o8+fkd61Ata67DoUu56iMtx2DwCeTDQUpZy4rtPsfFtDgGKheFZTcV+UdRWGKT8U1vsE1T4xB4vw/SSr6cy7Lw2bxJJZmtpMiT+rOCxY6iB7vAznT/TeUmNmLceCBgDaWO0809m9WpJQcVKl5SKtq9oCEhXUFXj6c2E4+yC32/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oviE+CVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B647C4CECD;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732359974;
	bh=k3s+kIa0CozrUauq1AcjHwaHwwjQ2E8jG+8stGujCCA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oviE+CVpuTZXtf5OLx/Jc0YlFoqL1kFGvep4KnFkcqPZVjYiimaYq/AqXMLZIWvll
	 lWwLEw7Gc2ecp7Se9bW2uuiiWbYGsBZ1UfMH7WFUwmOadkxQmz9PRowPvpObETm8uZ
	 59hI6ogX5+sQCOrnNgMM7CDw2IbdWZuJ43Svkt2uZCGISMbjtMY3OTnOSni593E3e4
	 yYk/87ljuD5CIudQWmUXfiK5Rz7TMVYkYPDP93Si2KhYIIlSUQUzeervJSGO2tIwQp
	 hZyy9IyX0NIabyoUMc1Liy48nqsk3NgLNseKjQWL0uAaH+BhJROd6+qYphfmRa5v9V
	 kaGB0T1WhisAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70140E6ADF5;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH 0/4] Asus vivobook s15 improvements
Date: Sat, 23 Nov 2024 12:05:50 +0100
Message-Id: <20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA63QWcC/x3MywqAIBBA0V+JWSeovahfiQixsQZ6OhSF9O9Jy
 7O4NwCjJ2RokgAeL2La1giVJmAns44oaIgGLXWulCqF4ZP7w25LPxDvs3mExcK5StdZlkuI3e7
 R0f0/2+59Pxu0/GpjAAAA
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732359972; l=801;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=k3s+kIa0CozrUauq1AcjHwaHwwjQ2E8jG+8stGujCCA=;
 b=z1bfmanqY+F+p3ytY2hnlRngqnTu7lFNHbAn7lzUqGHYP7BtJcw8ub8fLIDszw/fvWfCho3e1
 FBXlSkGgSnTDom3LJS3emaPssGL7hj1bpn5QqFd+GTa2XJbiTp16ZqD
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Adds a lid switch
3. Adds bluetooth

---
Maud Spierings (4):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../bindings/display/panel/samsung,atna33xc20.yaml |  2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 59 +++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)
---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



