Return-Path: <linux-arm-msm+bounces-90686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ov9DjiMeGmqqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:58:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2A923A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CC113016C92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEEF336EC0;
	Tue, 27 Jan 2026 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rG/0sAbR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68223382D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507865; cv=none; b=YOdPf9B3tE2KtZ6TyNexS0B8Z/2i0yKD+fYtntbyMHj7ZSDDPfFX2yEEfXc+rYPW75qqO67gfoxX8pP0lqY+q06zqbN7IL7BGrK1A2pz8oxJ5135Q0XzOBt/Zembq9ZxJh01FlbO0BXj8Cf7zA1zI2xURXNRjK6OP/Sn5YG9Slg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507865; c=relaxed/simple;
	bh=1Ho0XG7dS+YggQv/oK2R0s/FYzjIvQaih1Dhu9EIl4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YeFrlwclFQe74BFto3igg3Lmd42UHp3p/dHQuNy586yKsGDCrXpLgVxyAdyURRQAibya2X0vOzopYGOIgOUC1HAz3c6thsxRyp+lOK9d6jlYgq4d9sB1mwRa/JyLquWlFzosCqqmbin3X6f65wSESItmCCznk00zazXFlQFkGMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rG/0sAbR; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso55160155e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507862; x=1770112662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2e0LebsihOgK1n8wthh7i3DWNd7QqTelv44kSjU7JJE=;
        b=rG/0sAbR8B6CvOpWrh/ZdIMnfrKv6AU+3ggyZNk+A5ehS4g5E3hz4zdxCZsJpRzMFd
         8iDT8f5u83qjoxzyC8IkIcLIhraI3O9K/X7IiI8FUPRnfoK+A11Rx/q4bMZ83nj/DTBN
         EzHwZjtNf5s83ZTnX3nBPq/is4AbzJZTtNGp6dYnk8CAVOCgm1W1JhRHHkSpWQaRxkYZ
         PdFXPl6YhxTMgfZ4xhjV+ckD4KI1kVNImfNoPsplzB8Cyx0jmvTPp4lZ4HbBvlhDI/qq
         1Ve8pdSfEUtnfFNx8HTLRQtgtTk/u8fYPE0SALTV+jNKjM8pw+ani2dBadFQR/7IROLx
         S/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507862; x=1770112662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2e0LebsihOgK1n8wthh7i3DWNd7QqTelv44kSjU7JJE=;
        b=oTDFGzUnPto17bQusyX9rDG+o0AhyeT3nXe9dlLt4U4s10pIlUU3JBR9wM2K1pkPwC
         4u4Q6mM1RzeB8mdGXon2PPcXGYd0JUpCiB9HfOZlst4QVb3d8mp+TK6oBfPih+/bly09
         6YlyQd3O2aLAG/iimup8JoDW1zc1cDSI+OTFzRytDkiK7LTC+Ui3gsIWSEk3V3iQ5SwR
         Z6MuIoxxQnYY9Q0OYYo2Xf+GxB9ndVpcZVyr7AydJ4zme13ugupcgvyIGjwrnbcY5TBi
         KFmXCeX1ZxaUhDCpgyVwpxcv6LTN3jaFjNuEe28vKupbDXk5jKMMtmOemFGi5KZxCzOT
         7RBg==
X-Forwarded-Encrypted: i=1; AJvYcCU4NzeL9nbhIWLRwZJ0ihmfZNTnQKxUTkTiSoJbUCIc+yd5GogfOB77baPBQCT+0UD3xz/NUobq70xZnTW2@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkji+c4cXEQ2xbjxaspBpWb0i+YbOiNZK0qw7SnMv3zAejBev
	2HC4mi+iR7GUiuXQxyGw4ETsrEfgxNrEpA4BWkMCiIeaDuzSQz9nv+cXVtAs8cA3p1Y=
X-Gm-Gg: AZuq6aLiTUuOXMyIkSPD3AGlaXZqguRTeukxkDKZOeB6wsW5K41ZBG7DWQ4G71Wt0oj
	84G55rbFovVqUdlYLBeiXTrV/ZL9pplL/lBZKmmv/jPDRdLyqt4mRq8DX3sxyFedywI8v/wBJk4
	Nn6DIuNoHHZeYx/fYeebklmTQs0/7+kA3KU2ezMgLuKDma2ZH+tzNfySBalPMGonhhX1fa7KELX
	60v2o98E605qCXXkbdk91bSHXY/RSViX33ZnEgdzHNlnkmhgYNJaVI4L/3hj9ClZTE4EuOJBGro
	dKNSgOgz4g6J4cI9NyYMUigJ6637q2IINthuXNnjZlljJhxFQhzypnjadC9iUq2Tlnx9o3rzVc6
	NewlXZvYr5OpKLPRz/r7W+ZUF1jeYY6Cr3PXrZ7y+aGG7UM4s7IrVbfY9rKUuHL2Nv8pGKHdvpM
	BKU2MpuL2+xetNgc9KmnJl1oBEGgdnQm4=
X-Received: by 2002:a05:600c:350b:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-48069c0de5cmr14612455e9.9.1769507861972;
        Tue, 27 Jan 2026 01:57:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Add support for the Ayaneo Pocket
 S2
Date: Tue, 27 Jan 2026 10:57:27 +0100
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeMeGkC/5WNQQ6CMBAAv0J6dk1bLKme/IfhUMoWNmpLuoRIC
 H+38gOPM4eZTTBmQha3ahMZF2JKsYA+VcKPLg4I1BcWWupGKq1gThN54LdtjAS3uogJpuSfOAN
 r6BwjSOPri8XQ26YXJTRlDPQ5Jo+28Eg8p7wez0X97F/5RYGErqvD1QTlpTX3F0WX0znlQbT7v
 n8B1huUUdUAAAA=
X-Change-ID: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1Ho0XG7dS+YggQv/oK2R0s/FYzjIvQaih1Dhu9EIl4g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwRROCpb0TMHeAc6TMUdXNXB9/fuPUVBZL9uXyU
 2FlCoHWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEQAKCRB33NvayMhJ0aEaEA
 CFi7NkRxXRZmDOfjdMNhmQFgH9m9TO18dvcYR4Szl4XAM66hsfrAr2BzHliKhGsuZGVQCn21OEacn1
 2psYd7D5fe821xwIpunC1uX3v5BxWozwN1D1h+ZMYLTyRLiOfWeboymDJvSvpQb7bivUNVwQKG5O4y
 maY86FceNdv8JJwC8sx96Bzf2R4r2aPtUJwFU/ua8IYGbGtUAOc8L2DuQhM6RPz1wRNcXiggPUzhyP
 jwaPYUsqvJeCW5+PXLUSHu2yYQKbxVt8d1RC+rzY+a+u7Ur5H9B23XHwGHUl6MnC//pDNtHoPeri3v
 X8F6MS2V/EudvIBqHZeTU4OOlEzEDtHXrMqR2+ZkK1DL/is/kkSFX48e5gJkKEL6J5BFR0gXGC1dE0
 Pkas7nXik4ArNrYr4EsYR1odk5y/a1Ix68QBRSA3M3hn+O9OgTZtveQyM1LuIHx86NiAKVNnrJnkFf
 7ZonrJyjqpd1ei/d+t/ELDeQrNxydxQi0jLuga8L2ZNm03YgRkSeL1/rukXbQ8Iior/wdS0YB2WN+W
 iGHVYXymMyCW1c2ZtKs97b2qGEc1EpoAllwjD2LwdJfFvDLdlsc+mfBbyKANuVDVHRTypu9Af2UY5Y
 X6N+TMHRPHf7v8/JbJ+3SlI3zqCz80sBujApWp0WGIJCilnZgrDhN6eVHVQg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90686-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,linaro.org,oss.qualcomm.com,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ayaneo.com:url,linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 9BC2A923A2
X-Rspamd-Action: no action

The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
Bluetooth, gaming buttons, SDCard, 2K display and USB-C
connector.

Product Page [1].

The Initial linux port was done by KancyJoe (Sunflower2333)
at [2].

[1] https://www.ayaneo.com/goods/9344082149621
[2] https://github.com/sunflower2333/linux/tree/master

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add proper regulators for the USB controller, with bindings & power ctrl
- Add proper regulators for FAN
- Dropped support for headset over USB-C, audio is connected to a jack port
- Cleaned up Audio routing and fixed the DP endpoint index
- Added i2c clk frequencies
- Renamed fan node and used interrupts-extended
- Dropped the usb-c self-powered
- Reordered nodes alphabetically
- Renamed pcieport1 to pcie1_port0
- Link to v1: https://patch.msgid.link/20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org

---
KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Neil Armstrong (6):
      dt-bindings: usb: document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
      pci: pwrctrl: add PCI pwrctrl driver for the UPD720201/UPD720202 USB 3.0 xHCI Host Controller
      arm64: defconfig: enable pci-pwrctrl-upd720201 as module
      dt-binding: vendor-prefixes: document the Ayaneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2
      arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../bindings/usb/renesas,upd720201-pci.yaml        |   55 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1559 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   47 +-
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pci/pwrctrl/Kconfig                        |   10 +
 drivers/pci/pwrctrl/Makefile                       |    2 +
 drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c        |   88 ++
 10 files changed, 1743 insertions(+), 23 deletions(-)
---
base-commit: cd31ece0d7a4f2fb2266d6d6abd4d33f45e93dac
change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


