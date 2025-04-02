Return-Path: <linux-arm-msm+bounces-53009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76752A78A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272DE163067
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E6623535D;
	Wed,  2 Apr 2025 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heOj9+zP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F039DA92E;
	Wed,  2 Apr 2025 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583612; cv=none; b=B673SARHgAfb6SiN4izqv8aXdLXx5pOOgdJlmfhQflYYxT/YN2fj7MOXqbtZxs5MAsTfvRhpOXAXVFtRpnygO8oGztsNwovNFjySFKM0vyGIltURcX5OevYi7vjj2MNv8xg1RLjUyQkwKIg/FNePlEVsDKQ32/4e6KlwKH6c958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583612; c=relaxed/simple;
	bh=/+vBNaDSH5QTXi0/YsM1pDRIhvd7YRy6SEJTLAcU+QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNUDc0CX1oJCqSDUuiYLzKVjqR0Ui6tHgyaxo2AzviEXK3o69a1u3++HQFOzCLPfIc2eHcgm63EEVfrcXaunzu6L1pUtNlRnRoW3cFlGbIuShmVH/MSyEl70duN1Hfky3sFn6sa0UIxK21uW9ytYfSOKu8XK7SBrBsZjNDC2flI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heOj9+zP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac41514a734so1080357966b.2;
        Wed, 02 Apr 2025 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743583609; x=1744188409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ejPc7vz1NzfqJTdEL/ppgbTd/32+OfWNGIwtSm2VDk=;
        b=heOj9+zP5eJ21foYaTrCDa2bEMJpY1gLGQXLfyVjOdU6jBVYNJ6+JxVSIckqqIX2Jc
         9S+lFsD1iBYzWmBZmHlGXgZAn0dvVIxPU3CCAgoQsN7+uNRo4QHW9xA7iBEx0jNSXTM4
         VnLwAz3p+zRkGz1lAuXiWZFjsOdFxs2Jwh8/+ynYfonP4zcICFgh8WvDM8B9TNHzhlia
         9Uy1vsY+9myRxMrcHDwnQrphtgWrqMI5OvJtSWX6x2NjzHAuZPKU7kRqHMKfZXRUFYt7
         Ic4AvaVJyjSJ+H0ojnux+U7qMoVJ7eRt+FXls+OJkSEma7TEh0QiWPM2jh3Eq3bIEWRP
         nlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583609; x=1744188409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ejPc7vz1NzfqJTdEL/ppgbTd/32+OfWNGIwtSm2VDk=;
        b=eWpALEEjcTVUwLt+0VpXE7wOhkwPorSDncnf++S8BzKkfeMAaKylOL4TbDLC9OjDpU
         qZp02mWjNf0IFnZLGGVbtgtj5QIO4fodeLyDPrWpnPrKy/ZEya6uvDWty1+35XDAmNut
         K4E/JwAVA9EujHDgs3UGGeTAoe7vOX/td7PvauMuFv2Id9UNvaLiufBaWjTYI2bCKSfc
         Ps8TZtgZ9MZJeRVDUN7ukx/e4loED+tJTLMSXRBlvF7spPKHcO1jkUPaE/ZdFSnlj2ml
         nz8FZGNfrNAjl4I0nAHZAWaKPtiBmnqDbjjxhYrVXuxMNYKuv1x8MDhrfvszwMsIXX+e
         vu7g==
X-Forwarded-Encrypted: i=1; AJvYcCVYvzqN4RfzZElhJszvunpyPT4MU6RykeuZzCbTXMyW9zxuNnk032C9Ea/3psbH+ysTYPhn6SpJkucp@vger.kernel.org, AJvYcCWMPOQmC1dCNifu1f6oainQvv7OQtsUfcgLWj5xW8qSsWr0OwLSCS0sPmb4mpEN8DXcE9pJdLYxyVdYGy4N@vger.kernel.org, AJvYcCXhdonnxsQzKZBpb47tlmCQGIc/er+/cf8H3OpelemLsdNVII+unriPYkdFO+mSDqVb/V95Ho4wJXJ5jGYuCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVThoMIRtp+HdhcAU7S4Yz02VfWp/8Fmtv3cy6fRn75W4hcbN
	9Z1Fz16YDZPrPf5dkJp3mhbfo2vvNuSIFrTsj2Q4+3GmzK9R0KatmY0WZHw=
X-Gm-Gg: ASbGncuMENLOwJeq2tZLvaGoWP/f4mpVbxCxD4tOS3RVONzOl2ZKRPdYq8M8m42kRbg
	f4Xw6iSOQ8RvMiBBaLO8E+Qegk9qZY4uOTaCAdl5Cxeji3OsRFp4wuIbBXQCM8+IOrbmAFtM3ux
	IsKujCmoURWc2ezF7BYKHNaAbsiusmRpqcQhNwWUZo9X+aCUusHxQdnGSsiUqDQRWYqwFbhzSnS
	kmflTvJx0WEciPhwNfXzEe6B6nScpBmOIib0FkRA9eTppGn0Pvs6a8Ya2M9+HeHlRP1/Lvf+7DO
	CAjG3egpoyX0tNodYYFFzFm59nV2u6BU48IUa1t3BphXgKxGU3vaoYr73uTA
X-Google-Smtp-Source: AGHT+IHNzSuTERE8ExbuGAfV3s0sg1/oLsjMnzYXwkmJD4dnlgvcmsIDdRwLbR8GdbUyMXT/NUU6zw==
X-Received: by 2002:a17:907:d90:b0:ac2:49de:3969 with SMTP id a640c23a62f3a-ac7a197287cmr102633666b.47.1743583608653;
        Wed, 02 Apr 2025 01:46:48 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aae40sm8162760a12.7.2025.04.02.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:46:48 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 0/3] X1E Asus Zenbook A14 support
Date: Wed,  2 Apr 2025 10:44:01 +0200
Message-ID: <20250402084646.10098-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for the mentioned laptop.

Particular device exists in two model numbers:
* UX3407QA: X1P-42-100 or X1-26-100 (as tested)
* UX3407RA: X1E-78-100

Mostly similar to other X1-based laptops. Notable differences are:
* Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
  and Qualcomm FastConnect 7800 on UX3407RA
* USB Type-C retimers are Parade PS8833, appear to behave identical
  to Parade PS8830
* gpio90 is TZ protected

When comparing device firmware between UX3407QA, UX3407RA, it seems
that only ADSP firmware is different, CDSP and GPU firmware appears to
be the same. (At least assuming the GPU firmware name in both cases is
`qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
also makes it easier for distros to automatically extract firmware from
Windows and place all blobs for the model under the same path. If/When
firmware blobs make it to linux-firmware, same blobs can be easily
symlinked between `qcom/x1e80100` and `qcom/x1p42100`.

NVMe SSD depends on [1]. USB Type-A over USB MP controller  depends on
[2], or equivalent proposed solution.

Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
additionally required both newer firmware and patches to `board-2.bin`.
I added a short how-to [3], as it is not exactly trivial.

ACPI dumps can be found on aarch64-laptops' github [4]. HWids on
dtbloader's github [5].

[1] https://lore.kernel.org/linux-arm-msm/20250319094544.3980357-1-quic_wenbyao@quicinc.com/
[2] https://lore.kernel.org/all/20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com/
[3] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
[4] https://github.com/aarch64-laptops/build/pull/134/files
[5] https://github.com/TravMurav/dtbloader/pull/4/files

Changes to v1:
* Drop PS8833 variant, fallback to PS8830 as they behave the same
* Drop wrong pcie6a_phy compatible revert
* Drop redundant comments, fix order of properties in the device-tree
* Fix device name bindings, express in model names instead of the soc
* Fix GPU firmware name for UX3407QA
* Fix model string, enclose variant in parenthesis
* Added missing new lines before 'status = "okay";'
* Updated cover letter to reflect some of the above changes
* Left SPI10 disabled as it is unknown how/what for to use it as of now
Link to v1: https://lore.kernel.org/all/20250331215720.19692-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (3):
  dt-bindings: arm: qcom: Add Asus Zenbook A14
  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
  arm64: dts: qcom: Add support for X1-based Asus Zenbook A14

 .../devicetree/bindings/arm/qcom.yaml         |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi  | 1258 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   45 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |   48 +
 drivers/firmware/qcom/qcom_scm.c              |    2 +
 6 files changed, 1357 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

-- 
2.45.2


