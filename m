Return-Path: <linux-arm-msm+bounces-26807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CE938F50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48F72281BCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8BF16D9BD;
	Mon, 22 Jul 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="5bbPpUJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330F16A399;
	Mon, 22 Jul 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721652452; cv=none; b=NxC5AKp1bEqfe/vSL1tO6k3cKLxbXiIF4WNe6sUqOHJEPykTb+M9XANPXxVA0jKOzhFHbMqH3U7pDrL6Lvrpm05Sqo7rMlWaidViEGIxsDiHdfvG9ZRqYLnMaUawExZ0EONNQSheZ5NNnEt42bnSBlhBRMKmhh9/vM1LICvfamI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721652452; c=relaxed/simple;
	bh=TUZwbFWk1ZjONV2XNrh9on6bhdzhyU/JUB+yWkTPIc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=It5eQVAN/KZYJEN5fRMamncnsTCXYZ6eEWEeB9oE4kbTp03hnYG8b1hSzPH0prLYKv7SxYcHXbiLkmuMNDmWeXm0bk+juBunkh/dcgleQYg8IjO2Dc3U8+4GrJbWWa/GCcLVbNbzAeR6g7E7BkeWGZzmQhPCcuIJtSnGAApGTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=5bbPpUJw; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 658C5401C4;
	Mon, 22 Jul 2024 17:47:19 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721652440; bh=TUZwbFWk1ZjONV2XNrh9on6bhdzhyU/JUB+yWkTPIc8=;
	h=From:Subject:Date:To:Cc:From;
	b=5bbPpUJw/jXzWGj3b3DQkgl4e3kDKNGn7iKlHDy5FNlDU5NKX1GmCB4K29BWcCrux
	 Y/rmkPvWqWZ0i9Oe0x0nvhfGfWj4+oKS8CEmQ7Nr4TfJsABc8+buV84thnvMguy5gR
	 /WbQ7Ht3D+DNYLdLUFK82o/FPntz6v1NVqt5HlpnMcRKNikzNiTKSXYAz3rvz2Hf+w
	 N2lA3nZzcQdkNiU2DOkbwUp+HSdE//xxZjOtHG9Wq5/98v4MEb8d2nrBiYsaBTb/CF
	 goG+T6Rh5TDcsLCXrsArhuPgcIH0MOG8PJmg//0UOnj+xHlq5BMFP6Uc1J+qn+5hfG
	 VucjJ60MAJ/Dg==
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v2 0/3] Introduce msm8916/39 based Lenovo devices
Date: Mon, 22 Jul 2024 17:47:11 +0500
Message-Id: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM9UnmYC/3WNQQ6CMBBFr0Jm7ZhpgwKuuIdhAWWAWVBMWyuGc
 HcriUuX7yX//Q08O2EPt2wDx1G8LDaBPmVgptaOjNInBk06p0IRzn4uq3XFl9gxsJlQrARkKqi
 6sO40G0jbh+NB1qN7bxJP4sPi3sdNVF/7K+o/xaiQ8JoPeduqsqCur4OL9uye0Oz7/gGM1qeMu
 AAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, Anton Bambura <jenneron@postmarketos.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=TUZwbFWk1ZjONV2XNrh9on6bhdzhyU/JUB+yWkTPIc8=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmnlTTAlCiB/ZhKDbQjhvbfF+bA34AFkC04w3h6
 UoCmGO7TtOJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZp5U0wAKCRBDHOzuKBm/
 dVzxD/oDCq5loxGW8xvLAQxsfBOVHeJOmtrx0QvGkjChOh07eJzmjBwJarGwUxRgt0VHJ8fLl85
 v05b/qR1JhVq5/YmedVH4druxllm3H/VhAkwTZ+Y1zquiUWu9C4HSdOwtLDM6vWZkbFQSlArJST
 r4Zs42WgHfvq01Kx1QeZkBVZKrAJqpmmvK6tl9420a9tqJUVeIncgoA1toAzCQwJXQeogHcMBpa
 k8emMDWZUeKWACPTGsHSRE+nyvuGCnhpoAeeLwNkaj2GFC8bMA+LIYiOIzPaE6OrY/Ifnu5GW0z
 ki7f8KaRdSsFZh/98SzIIJeNw0KUt7fmZj8ddjhCmySCr53qi6LPIjL6gEW3hZTfWBJ88ZB/WD5
 VW2p2Gphin39M0qVlmlJkCozLBparUlaYhJ3t662QymEZY8KlmWa1tSCwEFvzpaJMmWQ8mN3ezr
 ijhRj2U/kFrZQ/wpfeCryBbOt+mT7LCNOu+8+k18fFjVDzPWTCP+6YuXFTXt4vNLtHP/mgE/KJY
 5cQ/h3McO4HkDw0ZroxWF4JeAyPkZBmKgvHm4VStZgywjZE3/KebvtOkOXQoMJLx/sskPceFmyo
 ShOaPem0aqiS4wguD2x8NiC7yxf4E+ji3oXpNP1SkfSMLEeLM38qbJbgJNz/vI11UI0MKj3uQXM
 kwJntRrJunIbneg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Continuing the work of upstreaming the various msm8916 devices from the
backlog, this series introduces few 8916 and 8939 Lenovo/Wingtech
devices (where Wingtech is the ODM for these designs).

Included devices are:

- Lenovo A6000 (Wingtech WT86518)
- Lenovo A6010 (Wingtech WT86528)
- Lenovo Vibe K5 (Wingtech WT82918)
- Lenovo Vibe K5 (HD) (Wingtech WT82918hd)

Note that "HD" variant of K5 is based on msm8929 which is a lower bin
of msm8939 SoC. A simple dtsi is added for this soc along with the new
devices.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Changes in v2:
- Reorder pinctrl properties (Konrad)
- Convert msm8929.dtsi to be more in line with other soc dtsi (Krzysztof, Dmitry)
- Link to v1: https://lore.kernel.org/r/20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru

---
Adam Słaboń (1):
      arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices

Anton Bambura (1):
      arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010

Nikita Travkin (1):
      dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  89 ++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 160 +++++++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 215 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi       | 162 +++++++++++++
 .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
 arch/arm64/boot/dts/qcom/msm8929.dtsi              |   7 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  17 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 252 +++++++++++++++++++++
 .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  17 ++
 11 files changed, 950 insertions(+)
---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240710-msm89xx-wingtech-init-e07095e2b2ec

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


