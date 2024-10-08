Return-Path: <linux-arm-msm+bounces-33517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A12994548
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB1FF1F23F87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 10:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E5A199E98;
	Tue,  8 Oct 2024 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tpq6IVS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743A192D7A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383159; cv=none; b=T2+9fRsECp95toPyBWm607cIdJwIk7PH9onEGOmg6YqkfkMGzN3D99v34B0kUg/k9cnlhwdcOKwwhHT1rtxKfLuMKctc9z6lBvOQOutLun8RqsXfzS8O5uZ4PvuXzCEap/Wo+4RAkLLvYtKRjQOP/BQMtaVRYjRgtiM5lnVOcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383159; c=relaxed/simple;
	bh=cEOnqj5/taNdqs7wqZHJLE/H1nb6Cudd8JQkaXdwQeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMMvUgFe8WWqQtuHAR5QY6SY2gbJ5NtmALJaUd9Ydvujy9EwBYn3VcWQQ5/biyJ6vOW+deRbRwnV6cx5KBoxtJ1KlFnjpKwKdCwGy7EVsx6oWvFG5S3rqhp8chVIGomhKj72hCgouLcHo67/G6IEX/NsA3U7RtL93EZrNKn3RV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tpq6IVS0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso48623715e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 03:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728383156; x=1728987956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EI/4C1YBupkU8pa4hZnKaHzVnRWuBc+sLm07dr7BR90=;
        b=tpq6IVS0wIhafuOrNCF4p2NvI73pEyzZ46uQpy/r1QTW7qfutv6s0EVP+6ZvGUBP4+
         NuJBuYrDxoNO9AnZhXMsmyPB9CqMLUzcGjvIIsrucOp1uDSZqiLiop2Cq8Ot05+BK8WQ
         TDGnK4oa/T93fPw75778XANCmwr4l1U7U/2NpoLHcQToe/8udcXa4OnIyJmQwKCtSCmG
         Zv3PgXuWtO9rkSeHAlcL+ogEFB18tALTo+B4gubTwH4Zclb6o5r6lP9erKE6eExfHhju
         0w7PQaqF/Y9qaD/slI9jYhx4smOQc0bVJiIfI877qIqFSLMBHMIpa/sN0Vq2nVt5mu97
         MLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728383156; x=1728987956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EI/4C1YBupkU8pa4hZnKaHzVnRWuBc+sLm07dr7BR90=;
        b=gBIYRgEOIdCZDxmSLMSjzj74mdzCHUGILHLgzHEhAHM6Jxe7UXUMgx4YNOmySuVu+9
         C4h/8YOQ1oh3Dcw5MHrEpX5SaPpUvC8/y+BMM8h1KCrYZv6L/SpOj9cUCRq6o1D5CAcg
         A7vndAvqk1JStfRhFB/2yp68lqfElI7cPgUjAqjHWvebkb/XZiWXFOw/CZWiZ1lXVCxQ
         CN7Wod7su/+kBGgv9HyVSzlNycuiFyZhhV+WIitUJkUTCK3EDEzkphxjtM9ekUwthE6+
         JDvNUK3abO5MQyKFDuLYyk5UmRfxsdWpjyQdfyvSpyKyF9kSA1rYjwhIr1hJEKMSpddX
         UJIg==
X-Gm-Message-State: AOJu0YxhqSDYG9h9rJJkaTRcHaD5PKQxI35F4Fv/im7HFsVtFr2eNFrD
	MQMXP2DJZuTtMXkW0px+7a5SW/Hp+0vxMZQf7srydxY1D4MHbeklVHRGX/nwgsM=
X-Google-Smtp-Source: AGHT+IFY6KPUaMK+qzf2Zm9ZWecXwxFv6eiu5QHuPmZPBeE7Q/AAZ0VjrtO0RZyy9X4qOeKZ00jCsw==
X-Received: by 2002:a05:600c:1d2a:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-42f85ab645bmr118620325e9.14.1728383155751;
        Tue, 08 Oct 2024 03:25:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691b505sm7766800f8f.43.2024.10.08.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 03:25:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: sc8280xp: enable WLAN and Bluetooth
Date: Tue,  8 Oct 2024 12:25:41 +0200
Message-ID: <20241008102545.40003-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This correctly models the WLAN and Bluetooth modules on two boards using
the sc8280xp SoC. For the sc8280xp-crd we add the PMU, wifi and bluetooth
nodes with the correctly modelled wiring between them. For the X13s, we
rework existing nodes so that they align with the new DT bindings
contract.

v4 -> v5:
- put vreg_s10b under the "B" PMIC on the CRD instead of modeling it as a
  fixed regulator
- order pinctrl nodes alphabetically
- restore the drive-strength property for all pins to what bootfw sets it to
- disable bias on wlan-en pin on the CRD
- remove stray newline
- add the swctrl pins to the PMU node

v3 -> v4:
- bind bluetooth pins on X13s in patch 3/3
- only drop the regulator-always-on properties for vreg_s11b and vreg_s12b
  and fold this change into patch 3/3

v2 -> v3:
- move adding the bt-enable-gpios to the PMU on the CRD to patch 2/4
- add a patch removing the regulator-always-on property from regulators
  on X13s that no longer need it

v1 -> v2:
- fix commit message in patch 1/3
- drop drive-strength from the wlan enable pin function
- drop the calibration variant property from the wifi node of the CRD

Bartosz Golaszewski (3):
  arm64: dts: qcom: sc8280xp-crd: model the PMU of the on-board wcn6855
  arm64: dts: qcom: sc8280xp-crd: enable bluetooth
  arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 167 ++++++++++++++++++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 101 +++++++++--
 2 files changed, 254 insertions(+), 14 deletions(-)

-- 
2.30.2


