Return-Path: <linux-arm-msm+bounces-39187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F279D956F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 558EFB28D95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548221C4A24;
	Tue, 26 Nov 2024 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8+b3FQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563201BFE0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732616579; cv=none; b=nVLJsLS+B0gm9VG27LHeEaC41YpWr8rThFWBqmRCg3fPHNyHshmfzcJXgGWMMlG3aCIn9Dsnz1h0kBSkvagzvUkiNgME4sEKOZVurUQ0ApKfgzieBDl+uN3UeVu4EqDPkFZ9Tgzxgwtx0xvzZDhdS/sOed6KqxgNqw2w6WT2ciU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732616579; c=relaxed/simple;
	bh=1/Q61X77d+wJnDnxSzR1szzWu1q7VOUzcUHJ7AVCSHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DtC3FID/0oPMj+XAsAYBU7YuTb8V0trfNyK8TS1A07YQ7Rw6m7dVDHzkCbehzR83G3dpSi+6wYcHGBMHSXllUSVnBirZbeLU4VJ8TDqLVKLj00OoGedGeC7e54T/+7ZHRAHmONoeNN47y/kq2+4wSO/igZr5VJVHaM9USOoWLOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8+b3FQc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so50045095e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 02:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732616576; x=1733221376; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0xLkYt2qRmhHcxTp08v9mIoJ8dCMB1v2JskS0o4438=;
        b=a8+b3FQc03Ual1vUYqZp53I6txKAUHCZLRzy4JUhmGaxSarMa0KkYzSXVLBFyAHdV8
         8QdC6x1svRO/5uLyQdJnzqKOFNT88js7G6ej0LsdXYOMCG8jYbQFklc9P2YlfDjZGOSh
         QL4D2pzwxh1eQHSG0nwgohQk4xP8pynVY9wZWzKeJEp2d8VNQucIv7eH8zOcnitYr25/
         tooE2ddUniyf5CljY1ijQatdPuaoHM0wfO2Z30gkl2DiCaORbL9MQ43dKyDDXvKLNbqd
         O2JjsIrkQQvRMDln9w/5a0dz7QqdJjxu8xrJ+tA9kuZGBEeUowieVPaxVS212lH9mLPN
         QZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616576; x=1733221376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0xLkYt2qRmhHcxTp08v9mIoJ8dCMB1v2JskS0o4438=;
        b=TJvRVvBsKqntxDyEcxwvYe6mgOIU0qRyCf4m13dvr3dWPVK3SiZQn+nyA8Vr9Gr07d
         uvBG3gxMdqLbWxU/Eblml8VybC/vt8OinKJZGf0w8uvDdrDYCyTZynpsbYblOOLaFsfs
         m8MheWqm6prYgsleA6C73sEBHu6yq0EQeLckGYza6tZWlK8ouydDuez6YECh7d/kxNcR
         qdwNdY4wJSpw7FyH3Dncrc6iFwhxMuNgdhMIj6etDiNuY+/44BX2ZeJ+psaySF1TuaGG
         NzGFZWDAVC092Zy+nSM7O2ikAmILZ1m0+cenq4UUik9Jksh3KO5et9d3oZObntLHdkqV
         QXRg==
X-Gm-Message-State: AOJu0YzWfwn3+9KN2AnceGNGLTR+cwzMmbBDXyUK2aaRZGlwoaJl8+qz
	jJS5N8lf9hPDpS9qR4pEKa+4ktjKlTbwIvYGX1nvRknFyu7yqSjuWObTQBGPXNg=
X-Gm-Gg: ASbGncvKRGOZ8/4merIXv1TStdZ+njB3NWOZDMQi9pnSr1L1a+Y0i3mEYYrPGFTTQ9R
	kGm4MSvYCgPUkYTLTGFekT8eg1ScJPwk8pUVJ7p42ipinlZY9Qu7n3tHa5Vzi+WGqgcYBVt/Zrh
	h54U6dQ49iCcrpEuUHhb+zm/7T8MWQVr1aqyXwbXWIDCFnPon5rtYnycbgysMyAE6nMnxy8yBPY
	npSU3JdWsEaAYFoU0pO9TbS8M5P0on0GAuFmBaLGeP0nOvIeGqCdBMsdUo5ilTNf6ZkXZI=
X-Google-Smtp-Source: AGHT+IHEmm5r+ZACNObMId0YdkCRExn4aSTNKuXwdL5JuzF4jUF9M5xtk4DUMu5W/U1bD4v2974C7Q==
X-Received: by 2002:a05:600c:3b91:b0:434:a29d:6c71 with SMTP id 5b1f17b1804b1-434a29d6d6bmr37700835e9.27.1732616575739;
        Tue, 26 Nov 2024 02:22:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1046sm228378075e9.4.2024.11.26.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 02:22:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] PCI: qcom-sm8[56]50: document and add 'global'
 interrupt
Date: Tue, 26 Nov 2024 11:22:48 +0100
Message-Id: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHihRWcC/x3MQQ5AMBAAwK/Inm2iG0p8RRyoxSZotSKSxt81j
 nOZCIG9cIA2i+D5liD2SFB5BmYdjoVRpmSggkqlSONlnRgMe/NUBTojjMtmx2FD8SfWiiZdN2N
 FpCEVzvMsz993/ft+VptvZm4AAAA=
X-Change-ID: 20241126-topic-sm8x50-pcie-global-irq-712d678b5226
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1/Q61X77d+wJnDnxSzR1szzWu1q7VOUzcUHJ7AVCSHs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnRaF9Li69UPAhTjUCO90AsqcZajhzFAsAYvJ/Qtaj
 L4YUEVaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0WhfQAKCRB33NvayMhJ0a5mEA
 DQxIFxszCHIR66PIquhim8mW52Dc00Hwhwck0ElHJFzg3yTZBTClFgly2fq2QwDr8LIanA34qXR7xb
 1CK1kMoWSuJfAqg5kY+YaKBFrEKMiUb6PsjoLSUt/jRRV81wN2+hqSO8QRzTsGKblS2sFMy5vFnVyy
 vTE8n20//6Q4txgXNubnlEdRnWG7Tn3BhtHTugkaLEZ19gpl7DXiamMR+YafbngHL+mxd6B6D+yiBP
 X+4aX45qMvEKjvQpgEIC0DWgbhOQCmDcRVasqX6vjsJ0WHnZQ9RBb8LheC7aJ0phJHh1ZzNe0IhDRv
 3pCYjazWOu7JKI1xSGz7TRvtIxRHG5l5rXXBSo88dPqqiOP+C0y49oI10jrVxK0EgnC5dji2Iqab86
 XPfF/isbTlXibM8YuPUkydkBcFHoHSSZOjuxq3D1erbJUBdRbdhmgEEMPCE7KYNoLWlWKPNRrQLlgo
 EdL5FeQtpvu0rEkOHZ3jy8xeBP/yHsoJ4h1wUG8zNjX6qj5oirNthznB4NfPolm6w0cYBlQ2O2cqIl
 6YqzA+uCzf2Sve+h4sejJiuh6+f/OwfGqlFBQ9pKz911RCIqNpTBFRlIOu+nGWOC4u0EDc9fyesz1I
 JMLwigtevzn/WNL1Qr4FVyxqH6WcbHuP8gGafllu0QiJmGGArXMKgPN75EsQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], document the global irq for the PCIe RC and
add the interrupt for the SM8550 & SM8650 PCIe RC nodes.

Tested on SM8550-QRD, SM8650-QRD and SM8650-HDK.

[1] https://lore.kernel.org/all/20240731-pci-qcom-hotplug-v3-0-a1426afdee3b@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: PCI: qcom,pcie-sm8550: document 'global' interrupt
      arm64: dts: qcom: sm8550: Add 'global' interrupt to the PCIe RC nodes
      arm64: dts: qcom: sm8650: Add 'global' interrupt to the PCIe RC nodes

 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml |  9 ++++++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sm8650.dtsi                        | 12 ++++++++----
 3 files changed, 22 insertions(+), 11 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241126-topic-sm8x50-pcie-global-irq-712d678b5226

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


