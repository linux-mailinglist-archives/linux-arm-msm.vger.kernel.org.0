Return-Path: <linux-arm-msm+bounces-1942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE407F8A7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 13:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50A35B21105
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 12:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178E0EAE4;
	Sat, 25 Nov 2023 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="UkzJHV65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D883B10F0;
	Sat, 25 Nov 2023 04:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
	t=1700913953; bh=zKpVtX7Z5H9TZTsQOclY81dc6bXE/cpnlMLFfUR5Xww=;
	h=From:Subject:Date:To:Cc;
	b=UkzJHV65Jci8IOmF/dHv0v4Fn9igrezDyUVbJ/0zsLZ27rH2WgiRJwUOYot+4KRjD
	 IdwFfboMBpfESNcwpUUKSBU1QTimTxszBFgNbvEFDSGYk1Oau823UwLgHAMvjMGBPh
	 zqqIivIxZasutTXoG5L+e9KYTAOVf9pKbFVM2fTY=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v3 0/3] Add support for HTC One Mini 2 smartphone
Date: Sat, 25 Nov 2023 13:05:32 +0100
Message-Id: <20231125-htc-memul-v3-0-e8f4c5839e23@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAzjYWUC/3WNOw6DMBAFr4Jcx9HuGjBOlXtEKfiYYClAZAPiI
 +4eg1K4STmrnXkbc9oa7dgt2pjVk3Gm7zyIS8TKJu9empvKMyMggQDEm6HkrW7HN5cx5VmCsqK
 4YP7/Y3Vt5rP1eHpujBt6u5zpCY/rr4IYVCbkwJUshUKoM8jVfRXdMF7nZT2i/wyZ6kRmUqCCM
 jCO3YmCLYpDk7yZKSQVQ5HWKgnNfd+/Dbf2Kg4BAAA=
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@z3ntu.xyz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=zKpVtX7Z5H9TZTsQOclY81dc6bXE/cpnlMLFfUR5Xww=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlYeMSs+NRmunaLtyaZdFlB/P8KODemXW4chf4i
 ke2cYTRtwuJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWHjEgAKCRBy2EO4nU3X
 VkynEACweUGIoqYRAfsVcS6/bY2w1l4UBb7goLfylbIdLe4Zfbdui2o2BHz0rxMOlFuhqgOEq5s
 wxadr7DwZcZ3m7SpB9pWSDEyc73CgYLdelZkJLLAiiZ45UEAbta/txgpVu96IUJQH3vxp9HPaBd
 NgVjo4YNAvrd4cjwysCO6sOO9Q37usbLg7Gr3GveJPHGE4N7CX3OqE14okfe15ho+l4o+14jLn4
 cVKe/yG/wF5rPW5Eko06fF65WJJ8a1i6hwRdLS3msN9HVfOcdvfVChq54Pl3jiBxOjnNSvHIzIy
 ffoV9GrUZtEP8a1J2zi/vOJkZYyM4eKvstFAemM7owY5bKKljpoCxMN29cD59KiAqi+sw1l73+D
 Y0ah3YTNzKVod1epi+uU1IPx5/2OSV66f5Lgj7OkeMV6VV3tpR/N3YApVFyocMHgHh5Hvp1D8wc
 OMuNDxNkNGVwzRBp0pEkCEVA1WgXCBBDdqE+zGxWiQdLEzwxdFhohYA77fd8DEuWLl9Sxal1Iuv
 Abxs+QnUxaWO9KZ1zYOkePg6ntYpH7A3BX+Gu1ROF1uxdBw71NX2HR0i0u79urrWTlFKybJBOMb
 Q5GkK1eqdBVCxnLteit51rjwAIHDZAs0bewlw6srbWwSJTgYpvzOQS7PjWYBg/1TX1xl1UwIf0K
 8U4NBCDErC5HDwQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add support for this smartphone from HTC which is based on the MSM8926
SoC and codenamed "memul".

Depends on, runtime-only, bootloader enables watchdog so we need to pet
it to stay alive:
https://lore.kernel.org/linux-arm-msm/20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz/T/

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v3:
- Add regulator-allow-set-load for sdhc_2 vqmmc-supply (Konrad)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20231024-htc-memul-v2-0-8912940b6f95@z3ntu.xyz

Changes in v2:
- Pick up tags
- Add spaces around regulator nodes
- Set firmware-name for adsp
- Expand reserved memory regions to cover everything somehow reserved
  downstream, leave no gaps. Seems to finally fix also nbd randomly
  failing
- Remove internal storage since somehow it has killed itself on my
  device since last time, maybe by my random memory testing writing some
  not-so-great commands to it. So let's be safe and remove it.
- Link to v1: https://lore.kernel.org/r/20231011-htc-memul-v1-0-76e57873190c@z3ntu.xyz

---
Luca Weiss (3):
      dt-bindings: vendor-prefixes: document HTC Corporation
      dt-bindings: arm: qcom: Add HTC One Mini 2
      ARM: dts: qcom: Add support for HTC One Mini 2

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  | 370 +++++++++++++++++++++
 4 files changed, 374 insertions(+)
---
base-commit: 15bb585707ae9c4e3acd42a81d8eac9f1e9e50cc
change-id: 20231002-htc-memul-742a8517d24b

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


