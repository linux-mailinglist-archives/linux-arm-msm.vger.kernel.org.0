Return-Path: <linux-arm-msm+bounces-59224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A2AC238A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 15:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A66A44542
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 13:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C9828F937;
	Fri, 23 May 2025 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSdkdaAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4128F520;
	Fri, 23 May 2025 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006179; cv=none; b=ewVdxBB0k9mRFnuQPxYy2BabmdgEaUr+ub3IGakJRKdLs4A7CZb7ORmD8J5r3963lYtDBnyH2/cEOGJpxybFZRqlM12c25oLYkpititgpUmCsp7KCoXS0m+xBR3Ds+2STUrLDscSwSGbNiJp6dxAnPImio2gxO7zIjMj5laOiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006179; c=relaxed/simple;
	bh=nv3ji6GhM3232GWbKU0OV+YBbB2uBzaazpJM0DI4Vbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=guV0xvC1KGxlpx27OCzyAJHO/Jmgb4WRM7QVY+4H46XAsjvnJKelEb2G3QWEI4pUz9tY2fIy0ISkXcdEdXSQAWwbuAU59znXjv78LXBuOlg8EIumyMdSSgQJ6N20jzvo3rUzySrSC9OxQ9Rt6Ha+Uz8E1lf8/D9zYJJZ9HDhKtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSdkdaAd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so95889225e9.1;
        Fri, 23 May 2025 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748006176; x=1748610976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utqnLfDssfwdK24IQm7Ksa5DHrbNYTlQ4HwsK42xQtY=;
        b=XSdkdaAdXUMv+QQsDxO6zRNoA1iA6Wye/59zlLKVewjEvaz4P3IiOsBHTmWjqLu0H5
         q75lbvDM5VNCpYagfSEVA7ezl1fSco+QAmF7IyPgLMaLLnDMgRRkIiIOIfw20BWyqi7z
         4hVTDR3KaPQSnSy9ZJRhDEND/Ttls1bFw6//U/XYh8Jyq0IoZcysjA74VMHg8OANzsBE
         4mxV35et4Z9tirpB+zEm+hAiJDtMzCtuSv7k8zx2YC1QS7ojnV/z2AKfnnVra5wVcFlp
         i2IUim2rklTOZTyJCetu7km7kfxy48mkVJJhzeu/4dlO+6Xp3I81W0OTvREIz/ZqA1Vl
         j/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748006176; x=1748610976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utqnLfDssfwdK24IQm7Ksa5DHrbNYTlQ4HwsK42xQtY=;
        b=k7Eng1xenBnerZD2JyU1o67CTjrPKTAhhNmt1oqVWkNYmZbD/xhKLG1JFoYm/JLvOY
         pAvIOhhfXesjW2ndePRl8QgfjpYG2ZQCA6X12PC+ZPpVFdvD2R2bE6CHG/N8GVwqqldw
         rAMvdHM5KtW6/+qUS1MGLJ2SAQ+p/nktJ959BaITqRpd/l0/0MXNMIPkWt164Lhkkz6n
         Y5zFSgNNnBlwuHLcCAkZzqCYRj2hZoxqFt/zOmtsQ14ld2gRVy1alG66KFwYXlPKXNKi
         /JTGfMURgjTUqk4IObITtae1EqMw5j49rY0RFuHpU11PtF5wTD3H0tkyc5H9ZzfZ5hGG
         xHqg==
X-Forwarded-Encrypted: i=1; AJvYcCVMojW7yZ9S+IOJ7vSnqJIz/v+JHaxAFRU6kmlKRTqzcqONznV7viJGpbAsMmwniYM+90+lADdn+JrktCntLw==@vger.kernel.org, AJvYcCXYwZrwfizVGsEzTWhGudlXKZKQxpC2yO3a2T+U8d7V16Vf4LebYqoC0DoKAXXv8IeVN0Jy6iU7SaNj@vger.kernel.org, AJvYcCXq+vRNhw/rcX4EqD1t34o00mvf8qByzRmJgdS7pX7ZbyFl2vmGr+LGWyfSkI7MsTf3Otsy+ko5SRduRxoK@vger.kernel.org
X-Gm-Message-State: AOJu0YzKzGmpHk+UhZWPl8kbKlA8OSrLatw9wSsOyn9d4/uj8QbueDZA
	5jehLtymN2OErwUo2uYfTTpW5Z3PU7ODKeHQ1Pzcqpta7MQq0tEXk8k=
X-Gm-Gg: ASbGncs/Em71Bfg8hyZ8w5DPuMJF+mPLhqx6rOGCGMl+PmQ7Gu4lIPY5MRAhRXOPMfH
	u5ztXXmJx+VIFjKYsVHaL3hVANf8Lr4PQNLhmqtaf7N8mKtDnOmIRuZTzufb1G1Uv6mCfLlb9qF
	UhZq0puA7Q1NPxOVSIrEOy3Sal/qJU+AMWenf5LrcejazNPFOR+aDSWoPW27RxoZT6mBrl4Ffcm
	0fzO3xtztd7DgakJ30s1SjZS84A1b1IW14f3zkpY3FIqpR0MiywUN8p/eaPXQ2Wsz+AvLYCWpra
	YKwxgzJVJlWL1m3kOS6uDEFve3aSgB23jpX4otQTGqePDYskMdDQR3WLl+MYZOhVc6I6PNmA/jx
	zxqzwHbBE2rJyCuKv
X-Google-Smtp-Source: AGHT+IG4Az0AhnIzEpthrhva2c1DnQOSAYmSSilx7Ymuwyx3a5QJ/0FhgSunYo0+APRzSkeyCqp34g==
X-Received: by 2002:a05:600d:19:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-442fd6313f4mr214830665e9.18.1748006175519;
        Fri, 23 May 2025 06:16:15 -0700 (PDT)
Received: from alex-x1.. (mob-194-230-148-12.cgn.sunrise.net. [194.230.148.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85a8f8sm189177055e9.0.2025.05.23.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:16:15 -0700 (PDT)
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
Subject: [PATCH v5 0/1] X1E Asus Zenbook A14 support
Date: Fri, 23 May 2025 15:15:07 +0200
Message-ID: <20250523131605.6624-1-alex.vinarskis@gmail.com>
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
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1306 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   33 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  137 ++
 4 files changed, 1480 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

-- 
2.45.2


