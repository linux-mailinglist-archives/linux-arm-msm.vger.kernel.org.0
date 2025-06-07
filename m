Return-Path: <linux-arm-msm+bounces-60528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7BAD0F3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E781316BFFA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EFA1F17E8;
	Sat,  7 Jun 2025 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQwevuSF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4429833E4;
	Sat,  7 Jun 2025 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749326557; cv=none; b=hyIZ6Pvmpvqbb+tscnGvLoOkUOpQ8VAk+fdo2iR+LyOWr/l1dac4ROJxjXHPgTa5d/yMf17SRUH/ur4Mr0s9k8JyOwBRtK8EqztawQ59I0SHt0QsDaINg9yFnabHhD9QVZN5UkFN08EKn8zy3inp8YZXj4xc1aNRuHvs2lH1vOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749326557; c=relaxed/simple;
	bh=45IkxLY84acUi2xvKH4yTrUekkMuxR8JE3z0fS0G6i8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqsFQtFRZOloB0iSeVYzAojcrFC2m4NBRNJL/Uxd8PEbVyf400onoSIoiWNdoUkdJ7putBEvCdzSvGlXZt2A4OYxt5ToK4UEp0JvWxPfrRQ8T7JIfXCCud4xo0ChIwJSZEPR2VBtBdv4IYv9KN0mhH+wMr/ysY9T666fi7jJKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQwevuSF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45024721cbdso27090355e9.2;
        Sat, 07 Jun 2025 13:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749326553; x=1749931353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBD3eotPjwrgUqbXpI0KLI7o4xM/jcNMRd/gL9XXQLU=;
        b=UQwevuSFHMJzmh+p4Pw6nq+Up35tTEqOSBs5260fgPAE5QvW+TW7izPf86rBnvbC1X
         6gNStXHt1T2ZPfC7J1l3gd34Y2YOYfMdXB3SdccKljdpvoJ1aXu6nCPeswjP8wY3qomS
         EJKnro8HsC/UZLVbvsrd4rKR+2le6AA2IR69V+P0qyBxOdSamx3m+ydfGpnAWyZO745+
         eUfQnfhJMHmyO9SjtNoiYYkOj3Ud46ad/yS5nVIMcKreiXwgJIFe98jVbCCB8nzhS98v
         nkPD3mHm9J1UIl9ha377xjwZ4boFUEOyBBxLHVNR+pwxWKnquCN18pBy7tQKXOifw2ll
         QWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749326553; x=1749931353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBD3eotPjwrgUqbXpI0KLI7o4xM/jcNMRd/gL9XXQLU=;
        b=Suf6R25ciwF8Rg+UgHn0ZR+ttpa0G0Q4KXpATUMrQJolwgSJZFA0Rr65X3dKVLp2kF
         xXmUjulBC1gBxGSGBcuWsFdVxu7K5wKHJjf8yWXcKFQ3kaq8RNjQbKpZ+9ysUIHW+J0y
         s7Zmlj4qLWNUeNzNopW4Um6+w05ECKNwYiiDDJRSUZuPDsC1XfhQ6AwSAastbM77rU6V
         By8Yk4hQzDQVcGVHqXWp6qLwOQAOKkdJEPwTCpburBC5glOaF+jhTBL2Lc5ehNC2rf3e
         vhCM9hehajoiW64/sdqCTjopDga40VXfwqx+7zQEcCFCWFfFJPsBjMhL+YuJQm8B85l6
         Wh1g==
X-Forwarded-Encrypted: i=1; AJvYcCUw5dX7C+/5jGfhLKlqCInpckOL2ca1jV08RFsUHKWMZQedsiVqUvvEByl5uZt+cFVQImc/GRfpWjsYQb3RRA==@vger.kernel.org, AJvYcCV1qqcy+c01d9vmBGb97oDYHmf5sP1SvHO/xvbgqcGYcqL4i9qezs3cUuasyAdPhNXCZyShnyDbqdKMXgPa@vger.kernel.org, AJvYcCV6TOLMd1IRgMBa/VBpMc5sLHwIlLdyYTq0CRfPhoKoAQOSaCATWOJA3FU6djBjhg/7+J3+fr0LHCYf@vger.kernel.org
X-Gm-Message-State: AOJu0YysvST6xSPIIRWTh8VgbCPJEM9ujbjHIg4K72xIoPDzYZ6REqsb
	xqZa7Mrb0yQtV/RX1kfmUEjY8UdoaQM4BM7B4ZqnmeAdvEzYMjtwIiY=
X-Gm-Gg: ASbGncuIuAD670Yad3D84iYxEiUEj6rcoyzYS2PthbOArVpx0fNRGw7rAwcrS9VmSC6
	sQbrZEhEwEhJMBqAFnlHel/1fvADziwOngwQkqQgh4l7wNS2V78MAt6TAvyga6N6cBJLhgjGiqC
	scOwNTrDm4KfVKbQWPSWWlbyRbLK8qGXngkL2kv9JcB75KAhtUbjEebEk/CgKvkOvUSnuvJUS/F
	XxRvaS8qq2KM8EWuZcYN9VD4/D+AWkN29kABoozpZjWyFGIDKr1zOto2R4ZpKwH02lgCTRM7Dfq
	vwI/o8D6qHPq5Hv37FlOtzjYzWljUOv0bkr4SLOmlwLJXmJlhJGbvSDA
X-Google-Smtp-Source: AGHT+IEjZF9FpPsUPXizDUTAPey8c4w2Ob+iYnB7hdn8L6cFcML2+/fv5aNECVDht2zrCxGOQl3iDg==
X-Received: by 2002:a05:6000:2484:b0:3a3:7115:5e7a with SMTP id ffacd0b85a97d-3a531cafadcmr6088832f8f.42.1749326553150;
        Sat, 07 Jun 2025 13:02:33 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6905sm65762595e9.8.2025.06.07.13.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:02:32 -0700 (PDT)
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
Subject: [PATCH v5 0/4] X1E Asus Zenbook A14 support
Date: Sat,  7 Jun 2025 22:00:44 +0200
Message-ID: <20250607200229.30538-1-alex.vinarskis@gmail.com>
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


