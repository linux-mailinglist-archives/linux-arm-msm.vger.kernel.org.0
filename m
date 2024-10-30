Return-Path: <linux-arm-msm+bounces-36424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C59B6245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFA41F21714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8237B1E6DEE;
	Wed, 30 Oct 2024 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c40xq9/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BAC1E47C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289066; cv=none; b=od63xuH1xmlNj6rwVt8Vva1eqAt9XEIQ00zgnK0f+Uu6NdZOiW1b6bOcWwICDJhNzNHWi9pew8pvmLwEcJaVtJPBPRTUZpc4uN1FkY6HTES9B3ALlTT1NXmJlpQQW+xT+8+I4P8MDfMczO55CHdjpsMWAF0U26c0gVooXDw85sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289066; c=relaxed/simple;
	bh=xHnbl8g0V4QH/+Ugzu89HnjvhxqRTUgMdyw4DrGod4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DWgZ/gSuFv+NezJd8xs3RYAPhkCsIs0l2YG5mD4tUTJTOfU5+qE7KHCefflLTRi17BgYcMsgiRDIK6IPv7MwhrLRCnVV1v4+p+VxifM7GQGZi5vhFfr6YVNobHUNU+gtneN+6880nWUoc7hbwaPMG92Gdz95n0XqMOjznXwJIM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c40xq9/3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53a007743e7so7533915e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730289061; x=1730893861; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCBgmMfrXbxb3z1IBjMjZjyuJ1oQU80IT7Cfbnn2k3E=;
        b=c40xq9/3uf8T1gmCI8od52aoLc9vW9rlF/oDdvEZ3DWlq3tVRmjnbFdLHosUUjR6JF
         AW6xLYCebDQpO6W/29FyYQJ0vUPmJ4SLzgpN4iX217vpHxW7SQrhLZ64isJmP7pPB0kv
         zwhF47RV52HD2o9XkyJ4hemmgXNYPLCWuNJjzgME9fXbQ9+d2gdaND4vYxfbWiwlaa+b
         Wtvnlxu7S/rvQUJPEpjFTBnvdsO1FqZrjTtwbfE3SjfNlMIEsU+cw/xMyz5f4oVvmtxd
         XwjNaYKkC4sv04AvSxwEsq6zKmuBeVEQ0HPrkmJsjOSDsktS3Rv7R1aOkG+O0pWOiloO
         jzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289061; x=1730893861;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCBgmMfrXbxb3z1IBjMjZjyuJ1oQU80IT7Cfbnn2k3E=;
        b=mCFgDPLRkfSNlLZhT+z+9rZWN6zXj5P6EDOyZHxM3343JgIGD90tQX3AEgE9iWkWs5
         Mzpuig4QnCGnyez0EObypl3EeN70wXlKgiMv6vjbIbqDpcOE+lZ6QC/huuB5gk/cEqsU
         DCImercqyMK06vAw8ylcPJgNGl3o3jru43KaxED2P946lpc7EZe5IXbdtrBYjx/FKBF2
         TwRYMtw5igvrfng1qcrYxgPEke/tOnAlpWH/hRcn5OqB9+UbOYqAaQ/GIOl1FooiKVAq
         tDuakBO+oq/bP8qZSbZEJONj2MKaR2jArVcd79oOjet4+4GbxnHBhOjJgvc8Mw6NRslD
         NNPw==
X-Forwarded-Encrypted: i=1; AJvYcCXwbmgMwzyHMZPgRkt75O1X2yS6iaPmiHneDELbf76rWHL5A90yw/FBZxvCh5EniluJdVdsihs50rqkeLR6@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdwLIEwVncthv197MzktVbnLj0g21MT3UonNuCkckqifFvYGX
	tTUp6LWWEF78styBu+7ieZ5Dr+/IwWPGvvQRlwHsnJzA9L1ffpq+O+WGCJogWNk=
X-Google-Smtp-Source: AGHT+IEU6KPP2CX/jkpICMP6eEpb+vo0AfQxg4mfYxCBgONVrAdzBEavS2CXmXyPMC4epUUfftpaFw==
X-Received: by 2002:a05:6512:318c:b0:536:53e3:fe9d with SMTP id 2adb3069b0e04-53b348d62e0mr7304803e87.18.1730289060910;
        Wed, 30 Oct 2024 04:51:00 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb81a5760sm233049e87.84.2024.10.30.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: add QAR2130P support
Date: Wed, 30 Oct 2024 13:50:53 +0200
Message-Id: <20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0dImcC/42Ty27cMAxFf2XgdRXoZVHyqv9RZCGRVEbo+FHLY
 yQI5t+rSRYJ0BTxkgLOvRTJ+9pVXgvXbji9divvpZZ5aoX+cerwHKcnFoVa3WmprZIaRI2rVkY
 ugjbhPBlm9i6A6RqxrJzL85var8f3euU/1ya6vT9+aDaLfxQj1UVkNDlSb4nJDLvqPjfyFbRVn
 qqQKkUmoKB7+z9KfaLKPI5XYZHBGdmrLNWw62+pBYsglKh14uiBjzgt55cqrHZgTPJSuXDE6Fq
 TkBwQibNT5I4Y4XLNbdqCIEWndKZAcIS7XBBF+5NTDgCa47Cbb6Exzc9C5QyaPKce/RGnaR95F
 H32vaMQUkpwZBbjiAKyT0Z7H9ioQ0MnFKodZ5Y+JkqHFoWXGX/X1l4iCilLyw3r71iKlQW2iyn
 bcIomaCMZs0vtciD3PkBCC9ZGCFKCxJwYou/uATiXus3ry1u6Wgv3BHwZpF0JKcAEMo6MQmN+X
 soU1/lhXp+6x9vt9heH9PkiqAMAAA==
X-Change-ID: 20241027-sar2130p-dt-68d3eee86973
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5655;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xHnbl8g0V4QH/+Ugzu89HnjvhxqRTUgMdyw4DrGod4M=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnIh2hr09Ccx5whJZo+l5B/YKFPavneoR1SXGC/
 K7ivHCMMK2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyIdoQAKCRAU23LtvoBl
 uJe3D/97h/cuywI3zpEes3S7xXzdFZaT+k05Rheh7kmCdwhTpJXBuc+uwVWTLFtk1LmHQtN7f14
 c0FqL5mgI7TaK0GVJTFI8rTeQ/S2+E5YY61KohVct67HAApYZYdSsl3zlIgCmPBXWplQ7qPsAf4
 LxPbXObTo2FngXe0uR7wFggb0TrBtE3xeA4p3BnFenhmG6taW9Bw3WvMECI2OofUw0uTqWPAnwJ
 yL7a1BTzt/j3Ve7rhhXIeepi0hlDtKbu6DjA8vG1uI4G8etWxbdmnVK/vLiiUFEH39waEXIp2Wg
 Og2VOqJye/WLdCv9/TraqSn14zFRYEHsIekiNP+h6g676sKUmvaWHik87Ynuvgp/2UV2iBfDrnB
 eWEmc0H5E4PRQn//plY42LXrKpr2JVe/a9Cbtutw0sfwr3kBoSREdgTFhUWhS9WCbEqBZjP/UR3
 33R6BLrad0Sg6elCfsvx/u5V9ST3gGWxJHNSurkCs0300xkVrFfDmd7196BV/irvsFAy6Mq8dhy
 9VlFYXqkSSxLGaYpPH1NTc1jRY3u4fG9QSJITyyU+bBV4xiHxP6NHMz8FlW5lUOYN2/aLKQ5+OY
 77ROTF2Hi4w9Lj7oRI6C5SfAjZFJ2EC/Qq0zld+yNLUm2QHU76fmfufdrb1KvuJjZiyM2qfHSwt
 AsDqo++D9pNCQgg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add device tree bindings for the QAR2130P also known as Qualcomm
Snapdragon AR2 Gen1 Smart Viewer Development Kit. The device boots,
provides serial console, I2C / SPI interfaces, WiFi (requires external
BDF) and BT (requires external firmware).

Dependencies:
    - https://lore.kernel.org/r/20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org
      (clocks bindings)
    - https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org
      (critical bugfix)

Additional bindings and drivers required for the device to function (on
top of linux-next):
    - https://lore.kernel.org/r/20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org
    - https://lore.kernel.org/r/20241027-sar2130p-tsens-v1-1-8dee27fc02ae@linaro.org
    - https://lore.kernel.org/r/20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-pci-v1-1-5b95e63d9624@linaro.org
    - https://lore.kernel.org/r/20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org
    - https://lore.kernel.org/r/20241018-sar2130p-cpufreq-v1-1-822e00b9a663@linaro.org
    - https://lore.kernel.org/r/20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-mmc-v1-1-c84da16a001e@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added sar2130p to qcom-soc.yaml (Krzysztof)
- Provided the value for USB's hs_phy_irq (Krishna)
- Fixed uart7 node name to be serial@.
- Link to v1: https://lore.kernel.org/r/20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: arm: qcom-soc: extend to support SAR2130P platform
      dt-bindings: arm: qcom: add QAR2130P board
      arm64: dts: qcom: sar2130p: add support for SAR2130P
      arm64: dts: qcom: sar2130p: add QAR2130P board file

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  551 ++++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 3091 ++++++++++++++++++++
 5 files changed, 3653 insertions(+), 2 deletions(-)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241027-sar2130p-dt-68d3eee86973
prerequisite-change-id: 20241027-sar2130p-adsp-fc3fad54ded3:v1
prerequisite-patch-id: a19263ac2521636a3a7b0ed846cf1714326832c7
prerequisite-patch-id: 7401c6f72aa9e510a01774b82586e5941980fbcc
prerequisite-patch-id: 0b132b0936dda8e4c7443b4e7e23ff427dc0d798
prerequisite-change-id: 20241027-sar2130p-tsens-01baed7d9254:v1
prerequisite-patch-id: 20d50df9440a16e1cea78fb674794ebb7dc9e352
prerequisite-change-id: 20241017-sar2130p-iommu-4ce763051f01:v2
prerequisite-patch-id: 22f9d4a5b0c8d50b5a7317375060ff07ebcae4c3
prerequisite-change-id: 20241017-sar2130p-pci-dc0c22bea87e:v1
prerequisite-patch-id: 70ad0a8594e6d224648e0206f9d783fcbb69887d
prerequisite-change-id: 20241017-sar2130p-phys-426733b80169:v2
prerequisite-patch-id: 263dca689cc6e8334d825b19ec9005a44cdc979b
prerequisite-patch-id: fcb8d377116bbcf9f165abba416d25c9be86d930
prerequisite-patch-id: da7fe2737145e858d9572ff51dff3478cf15e1b0
prerequisite-patch-id: 14e7540ecc4d365d2cea78016b2f9ffbac366921
prerequisite-patch-id: 6b2ecc0490d903cee517301c462053d2472e6992
prerequisite-patch-id: 874e118cd420166faa6247754c5f0a3f24de8a1b
prerequisite-change-id: 20241017-sar2130p-usb-0e9ccdef61d6:v1
prerequisite-patch-id: 283d975b372781bc4ab258583c82aa7edaa11edf
prerequisite-change-id: 20241017-sar2130p-cpufreq-d7ba612fd9d7:v1
prerequisite-patch-id: f0e7e53020e954149fc06988a583d4ca9deb7209
prerequisite-change-id: 20241017-sar2130p-llcc-0c2616777cde:v3
prerequisite-patch-id: 6ca6eacd9ceca6d060d23ef95594fb892e51a506
prerequisite-patch-id: dc04e235391820e4ab04c72ac64fd852e73fade5
prerequisite-patch-id: cdb161d351ba3ff4f9e53efaa67eb32b603af435
prerequisite-change-id: 20241017-sar2130p-mbox-1ff72d8eb5c8:v1
prerequisite-patch-id: f3975127d993dadf15bcffb81feb99d213471a22
prerequisite-change-id: 20241017-sar2130p-nvmem-5f856d99bbb7:v2
prerequisite-patch-id: a5520c74bc1a96a952ff6f744ea57636893f6278
prerequisite-patch-id: 7a260ae7850d966e8fecd3ebc5114ac157d23c87
prerequisite-change-id: 20241017-sar2130p-mmc-7f8b32889e31:v1
prerequisite-patch-id: 76b640936b8b98775f8e17f719b98147dbb7be4f
prerequisite-change-id: 20241017-sar2130p-pdc-18d3f08abdbe:v1
prerequisite-patch-id: aa2d8a846ea684d1e127f94e01414ded8b599763
prerequisite-change-id: 20241017-sar2130p-clocks-5fbdd9bf04ee:v5
prerequisite-patch-id: e6927fe4ae24ab139d5fe595b36b9a9182960b70
prerequisite-patch-id: 7cb0ec3c7122856fc33337b9e1e54693a6a7d0fa
prerequisite-patch-id: ec05d49fb2cabbd37a462cee2761bb9509a6aa5d
prerequisite-patch-id: 6c2171274b0615cef421498695bb61b3f1ec44d2
prerequisite-patch-id: 3e7615c0e77e3dbe18267fe556bec7bd5b413c56
prerequisite-patch-id: 8c0359d6075820139b0658ffcf74f8cd91f50875
prerequisite-patch-id: a500c056466cd165fbe3acf824e0b96ee225794e
prerequisite-patch-id: 0abbc5930afb89780a8d833b4fb7cf16865dedcd
prerequisite-patch-id: a8016b8cda7f0f766acd92e6ba8644f45b04f30d
prerequisite-patch-id: ddb641d43225f1165b30bb03b0243fc5bc3e7a96
prerequisite-patch-id: 0e7dbc6cf1359f2611ec19422139f9a95f389f51

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


