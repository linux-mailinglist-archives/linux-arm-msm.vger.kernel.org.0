Return-Path: <linux-arm-msm+bounces-61314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81217AD9FC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 22:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5F5173569
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DA01F5838;
	Sat, 14 Jun 2025 20:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmFs70ls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9C1AF4D5;
	Sat, 14 Jun 2025 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749934645; cv=none; b=DJHZEY78hgEZN+w7nEJSSXdfV8aAo1ZwV5aFGIKRCxzEy8RYc937dK89D7sWfqnHNG1FaaX4t8GimrS9rwlpUP91i2IeGg+vinWU3/NopKSMIedKeOI1GYUOzmr5kDAUG2yaJRDS4Z+APqU8HOonD+ER2mr5IWq7nMwz5vzJ84Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749934645; c=relaxed/simple;
	bh=k29xYtFddwfaMb/ffVcmopJbs5fmoRuWuv/KjhfeZIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1zKR3BIyGd/P0Y5GRJZJM5FZ+kxp+mhALHpVfYReZgKBBo3ElEp3VFDogGybBtwHPIscVz8KjkfhZFoPwL4AXuSkQqiQUXSVbB30//gqmizhZbf4o7407/Uw7uFCoA/N+k9QDf0OZkSdRrQUQ5cw2R8HsAP+xVt8KCtWDR5yMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmFs70ls; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso5914030a12.2;
        Sat, 14 Jun 2025 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749934641; x=1750539441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AO+Ym8b0ocHC1VS17jgv9+XUpYovIj0EBke9ZZ+l1b8=;
        b=DmFs70lsZ8rFMvHm6XqSXqKpwfz27IIQAGHjnICVascttOoyr8zNEfAIqKnv0+gMKg
         Irr0jVJpLtvXlX972preY+9kFDtC6xHh2wBTipLwBplTCE7fyk5K8ZlVSQ9ZOtv25nzp
         ysmTiiq+1gO72lbmsLT2WRviLSNy5T5ofdJrzhPkY0rWuKNICA/gOE4LA3jnzxGk+8GT
         rGaaYOGrVzyanJQr3xEL8pR6C+eDhsgKJ6SKeTvEAW9/Mgv4w7BMe3VgtlIjGuElGBa1
         cPhYamBFArwU3hoSFeWXXw+++YZ6tjrGWpUm1w+YBMjSHdRx0DNN5MJ57FtwccxTKL60
         pTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749934641; x=1750539441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AO+Ym8b0ocHC1VS17jgv9+XUpYovIj0EBke9ZZ+l1b8=;
        b=fZClnTOsoAUATaBXTvXtAyQohEDYDsWZucGBZWIEH3myz8drckrWscysF9nQObYV7e
         MaUNrGvNmeixGppkzR36iH3K3bngBSbv4uv6wJF6F410hZagX3/PoN61ueme3ojfTsXq
         IcDCHpap93N5SuYrWPirG9LLko+GeoMa1FX5FXqNiozRNBcdbCPu4hiZXvoDpzxleFs/
         f92uKqAsppMGnVxneqH8P9PehxBRjARBPWZTjve7T/K21uN0eDRua7ovOavJH1I25ASo
         bD+QKkCNBVyU/9MtPcsewwtWG75zPUDYzq6lUKroe2Tx2GVF6LQZ89gU4BiBO1tPJwEK
         5JMg==
X-Forwarded-Encrypted: i=1; AJvYcCUILHD/VpjHeRrFoQQmrFLwbIsSBEtgNo4uvJU+2/alEZLHRoguCSeqaMb3ydWXhHCLcz6b/KRHqzjRr1Aetg==@vger.kernel.org, AJvYcCWogOQPYw/TcM26AVEdQe3u/PxpT51WXlXDEX1JoJNlGcbvwZcamQq+aRepkqTYujFOc5d3Jser8DCbBvra@vger.kernel.org, AJvYcCX2jummsZ50uZ1qbVstZp55zN8nCkljN9Bbv6Rg9ZQbXAi9yMs66BeIgUHQa/rb0Jqg/wO9LKAtg2np@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T+7uPqn/dqHquR0cgo6MTyFoTNNGGoLxnZmucf91LWU1heB2
	pKwvw5SoU80ekVTW49Hl5ncT+7qDVYVQXqwACYkSbti4M0w2LSOyl+k=
X-Gm-Gg: ASbGncvHKDSx0xZNR9oeFjtYRNqG6dsNYqR4deylEVP2vfU3v9++2g1ucGGHRNuKysp
	8Ah/5Sxgxvfciu9c7fYtTbtbSVWtkRzNTcr7gzoqrg9XoSCCXpcLmaR+pV8eK4Q32b5jdHv4AyB
	MXqNlBchL4dfq0rDvIcVhDkBv4dxsWippA97nOpa152VHdhQKsbYG/D3SnoVoUKvQ1pE0K/QMV6
	ac3e9BNixNoyGpJ388D9JZKszQ74fdZ85XSJadu60+F1O6FO5TlWjeEzS8EBVYuIysBH+JswmXz
	vWdJfqgaEfAqhQQZ9ggXScqljOVVYEeM/WCoXvgTODJkVXqFVpXZpnf+qzATjuX0Sg3U
X-Google-Smtp-Source: AGHT+IHJGWe1AgeLatPSl1oxN2yR8yaeVrLjRLRiSP/3QcBkhzp7/yBXxQlvysbllkzZBMVEjJt38w==
X-Received: by 2002:a17:907:1ca0:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-adfad438078mr337926666b.28.1749934640965;
        Sat, 14 Jun 2025 13:57:20 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec89299c2sm361444466b.119.2025.06.14.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 13:57:20 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	maud_spierings@hotmail.com
Subject: [PATCH v7 0/4] X1E Asus Zenbook A14 support
Date: Sat, 14 Jun 2025 22:53:48 +0200
Message-ID: <20250614205718.93166-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As requested, 1/4 was merged to linux-next by USB maintainers.
Resending 4/4 rebased on top of latest linux-next. 2/4, 3/4 already
landed.


With this in mind, and taking into account that this patch was
already reviewed some time ago, any possibility to still add 4/4 to
6.16?

---

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
[6] https://lore.kernel.org/all/20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org/
[7] https://lore.kernel.org/all/20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz/

Changes to v6:
* _Only sending 4/4 as other patches are already applied_
* Rebase 4/4 on `next-20250612`
* Fixed zap_shader to &gpu_zap_shader
Link to v6: https://lore.kernel.org/all/20250607200229.30538-1-alex.vinarskis@gmail.com/

Changes to v5:
* _Only sending 4/4 as other patches are already applied_
* Rebase 4/4 on `next-20250606`
* Moved gpu enable from dtsi to respective dts as per discussion in [7]
Link to v5: https://lore.kernel.org/all/20250523131605.6624-1-alex.vinarskis@gmail.com/

Changes to v4:
* _Only sending 4/4 as other patches are already applied_
* Rebase 4/4 on `for-next` of qcom tree, adjust makefile to generate el2 dtbs
* Picked Konrad's R-by for 4/4
* Droped 'qcom,x1e80100-dp' as per [6]
Link to v4: https://lore.kernel.org/all/20250426130203.37659-1-alex.vinarskis@gmail.com/

Changes to v3:
* Drop redundant comments
* Drop incomplete wcn7850 as it is causing dt errors
* Picked a-by
Link to v3: https://lore.kernel.org/all/20250416232345.5240-1-alex.vinarskis@gmail.com/

Changes to v2:
* Fix/re-add PS8833 as fallback
* Add EC's i2c address
* Add pwrseq for wcn6855, placeholder for wcn7850 until its tested
* Rename x1-zenbook.dtsi to x1-asus-zenbook.dtsi
Link to v2: https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/

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

Aleksandrs Vinarskis (1):
  arm64: dts: qcom: Add support for X1-based Asus Zenbook A14

 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1302 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   37 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  141 ++
 4 files changed, 1484 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

-- 
2.45.2


