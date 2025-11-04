Return-Path: <linux-arm-msm+bounces-80296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1BC3111A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDA7E421062
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06702E092D;
	Tue,  4 Nov 2025 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNOArWOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014E1F1513
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260695; cv=none; b=vF9Rmiz5BSgRQk7ByNv79fSSudNG8AxeYHd0Bc5I+emC+HgbJyieM9/HLskyhS08gt4oMsokPST1hEyFn7p/cqEFwL4sJuhK14uswq64yeVIzwV7GctvFI2Ai9yA/ikIhV4KjyEqWmndOMWIn2eOpLpJ2HMXp9ge1r3ALyAh1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260695; c=relaxed/simple;
	bh=P0P09KrMQw7iDL1Zgyz7Mj/ducQCpx8Q4fKXzYK04mE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H0KHDPxIFRS0sgLtPgiup6/lDxRNjW/lZB/fXwHvxtVKSIyfge/z/DMhvzQWion2bocJfthvGfYu7FILW6FIy4dNJPrOIatM71ZmQBxeXnWTXw/UEVdH/ZY7L8FovJpxu1adqzvkuwImMDFAlsrfRHsVJ8rFNwQ4uAcjZJh4ELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNOArWOE; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f67ba775aso6822575b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762260693; x=1762865493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEiQIKJ+ye8rmj662E4uTeZxFBcM5WtKqV1kS9+TQCY=;
        b=eNOArWOEsY+6rvu6ik7GQ5VpxizTdXOLVWDx9XJNubYhE6m60kvQb14qbRgVEs0gHi
         Ky9LV34b89G/5pj6c4H8h6NQsAnO3gJEfyQiZCx+T6ZCBqmiOLHjiDTe+IWE5lRCW/v4
         +l0a5j2KXn2QiZGPWLPhGucHxIzopTKtwDTHNS42VMU8XoQvSShaosqPwQ5yVnEOC45n
         ij57WNJ7rvwcm2RKIxPx+w6EgMxJREzf1OW7ZNvE7TM27jXEBnHxeLxYbS9apzE3NHFK
         tbAYB98S4z7zbxQQ+Ih4Wu/+L+mFeCS4/ihV8WHsl+TI/01TCdKhx1tSpq5Y6/f4n3z2
         vwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260693; x=1762865493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEiQIKJ+ye8rmj662E4uTeZxFBcM5WtKqV1kS9+TQCY=;
        b=F4HNXpgYh3rvYPvGsW28cRB7/Wu4DXthTD9RM8JFMFje1bJ8YmBAIVO5tsFvujqQMe
         ycLEEQKi3z68KDi1a0LSkP1HYdAkdCjxUMHPA6ybjKkrzkDs3gIXlE8ohLJ/imQgAWhL
         lJIOn+Ut71r/RnxdQxV3107/SbPqru4vdfAb1PAA9QNrbj68lMfD0y7CNEbGrqW2nrUg
         79D7IgkkEvMdwRb1XeAFmKOV6QFYjvtZe9QMVLjoYJz00THa3l04qwbflIPmbs+mCamo
         4DDx0K9HklxG4iV4Rd+vce5S1+jf0Pp0UOGoxuNGSEINwIo+pgiJhTW0VUd89HdFRySA
         Y6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqxgVnfDpCwHtOW+l7rAM9u5svhQNiP6CJPwcuiFxQmiW1qqrTLWzjrblp1/Ds5CTw2nCHZ/HDUQnRvebl@vger.kernel.org
X-Gm-Message-State: AOJu0YymoU401Oe5VPN5WW3IMlEs3GFcH9RD3lpWxFJkQTB+Ms+Wdzpo
	Zg9qnWCO6Zh9wTV+8oZ5irTHQS5xo8uMaTIDg/OsZYPjfsNeOw1sgu5cUYLxdg==
X-Gm-Gg: ASbGncvsjt0hi/RcsQJN3ezuwiJmI11/B4c4RuEWrP90hJFK4hQV3HjSWj66caz7aIQ
	kvD4LgaeTiRmMa1WvfQq+eVNbWy/Rha1WYbcVlsX8qZI/mHx8z4iSdOmVYThve3MG7Urxg6/wvr
	Nu6rWeX/ueF8ItHCGwPjYRw+5z8JSqXbOb8if+1t2ZSAQN0khQMh/dB1B6gzsGtZn2i7KO0fSCG
	kRgOnMMGCVBVUQYrbeau6iZXgKQTbVd/tfKRPBX8y5IbPmxKbqxdkFsiKdykFPCelXkHFXUGSr2
	9IqNpXQmV82HyusgD5RnAElJgLBMUvaBrJ1wBvGpplDwMFq17oJ5zoP6LJllraDPp4/an1EMEg5
	WTZp6AzXpKY1J6AMAmZTdEpnXDC94f0bGrfvU6TpLJDHQpGZyyBp43ClsQ8VyUzNZjw5TjGWFDv
	+RVvnxKb6i4asK5zdawR5ag+l4QQ==
X-Google-Smtp-Source: AGHT+IGANTE1PAot3QI3qrV6KnKmOlu6RAZN/pN1lxmSwTfpebaHhBK2S3CD8RB0Tducwg7ma+w5hA==
X-Received: by 2002:a05:6a20:49af:b0:34e:959d:e153 with SMTP id adf61e73a8af0-34e959debe9mr2135074637.15.1762260693540;
        Tue, 04 Nov 2025 04:51:33 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a80459sm2338616a12.15.2025.11.04.04.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:51:33 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v5 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC support 
Date: Tue,  4 Nov 2025 18:21:24 +0530
Message-Id: <20251104125126.1006400-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the second patch adds the corresponding DTS
files for the platform.

Note:
USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected the switching cannot be handled from SW.
Hence from SW Host-only mode is supported on Linux boot up.

Changes in v5:
 - Updated commit message. (suggested by Krzysztof)
 - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
   Krzysztof)
 - Introduced talos-evk-cb.dtsi, which has common carrier board
   interfaces.
 - No functional change in bindings file.

Changes in v4:
 - Updated product name to full form per Krzysztof’s feedback in
   dt-binding comment.
 - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
 - Add DP connector node and MDSS DisplayPort controller.
 - Added USB note in the cover letter for maintainers' awareness.

Changes in v3:
 - Addressed comments from Dmitry regarding USB1 `dr_mode` and 
   added a DTS comment.
 - No functional change in bindings file.

Changes in v2:
 - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
 - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
 - Fixed subject and commit message to use imperative mood.

Thanks,
Sudarshan

Sudarshan Shetty (2):
  dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
  arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi    |  56 +++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 442 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts        |  87 ++++
 5 files changed, 587 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


