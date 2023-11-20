Return-Path: <linux-arm-msm+bounces-1138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E67F1433
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC40281312
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145FF1A5A9;
	Mon, 20 Nov 2023 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nMtzf7Mx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E81131
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:25 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so53232271fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486484; x=1701091284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00OTe4FcAiUSuJtjqtOi8ICWSLOUIpkrYCIRO3OWRN0=;
        b=nMtzf7MxkfPbqkFXNHelq2fV90g4ROA7zUupJLYZgAVEmpaq71JMfmjD8A39LLA72x
         olGIKBzHFzOfs1YzZLX/t9Xb/lq9DadoVTQjkL98QisA0iLmx3VHK+12DMSLKaC/yiOR
         lKpjIxIOdZFSD7npns6LZXnSohNUlg3I6PGPhRXNfeTHpg1QPIKIKMmwCrKT3yKtymgL
         rdB3FG+S24Gp4sxElSZRjexLYQs7XYw3DVkMeGsjCKsO7RVW+SIPESc1OYfgGWH3bP5o
         G0utyyQJ+4EhpuM4UZ3Z3s6xoM16b3XYBVMHXPKvE1s6B2aUReFuiZXP0jLZb1WdVvHf
         6UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486484; x=1701091284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00OTe4FcAiUSuJtjqtOi8ICWSLOUIpkrYCIRO3OWRN0=;
        b=xORboe4tyZy1gJgZ4kDLmPe1ZHbMj3no0EF9PUPN8FokLFZlU0dvKlF0togdIROZGC
         6wJHE9+7d/GyT0c/sDfSGDyxlwSzNoydl7qzxFtkKDBIJTAH0+zhNoemWjk/38kTwOlj
         56WpnW8msS2Dhk+yftGn8yhxgt2+tumqIDX1e/2ad3u75JWAVBACztfCm+IQfQGX70Vj
         jIJ1xWzYLnXFaA7LWxMcmD0fLQd0YX5ThCi4aMnsuKXMzQUGQ7xI7Wl2QYikOEixOYsE
         qJjgaZ3bhXz0hrJEorwFyPSplywGvQRGHM+e1Nq0yrSIXMTB/S14bZzZPEvPP2Mrx4rg
         JjMw==
X-Gm-Message-State: AOJu0YzceliZg+DdGOLOuwrqYCz+bOeXLKmrK8OiBd0Q9MsiAuj43kl0
	vRlHPQVWj34gzkk91oiaXUImiQ==
X-Google-Smtp-Source: AGHT+IFbk5UMJYvcMKicDTBiH72VTcok7g3HdKCzDToh3JFx1Lfx4PdPHkBdtNVRYifLz+n/vU90IA==
X-Received: by 2002:a2e:4952:0:b0:2c5:1674:8d79 with SMTP id b18-20020a2e4952000000b002c516748d79mr4362140ljd.21.1700486483880;
        Mon, 20 Nov 2023 05:21:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v5 00/12] arm64: qcom: add and enable SHM Bridge support
Date: Mon, 20 Nov 2023 14:21:06 +0100
Message-Id: <20231120132118.30473-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Resending for the new release cycle. Dropped patches that were picked up
and collected tags.

---

This is pretty much another full rewrite of the SHM Bridge support
series. After more on- and off-list discussions I think this time it
will be close to the final thing though.

We've established the need for using separate pools for SCM and QSEECOM
as well as the upcoming scminvoke driver.

It's also become clear that in order to be future-proof, the new
allocator must be an abstraction layer of a higher level as the SHM
Bridge will not be the only memory protection mechanism that we'll see
upstream. Hence the rename to TrustZone Memory rather than SCM Memory
allocator.

Also to that end: the new allocator is its own module now and provides a
Kconfig choice menu for selecting the mode of operation (currently
default and SHM Bridge).

Due to a high divergence from v2, I dropped all tags except for
patch 1/15 which didn't change.

Tested on sm8550 and sa8775p with the Inline Crypto Engine and
remoteproc.

v4 -> v5:
- fix the return value from qcom_tzmem_init() if SHM Bridge is not supported
- remove a comment that's no longer useful
- collect tags

v3 -> v4:
- include linux/sizes.h for SZ_X macros
- use dedicated RCU APIs to dereference radix tree slots
- fix kerneldocs
- fix the comment in patch 14/15: it's the hypervisor, not the TrustZone
  that creates the SHM bridge

v2 -> v3:
- restore pool management and use separate pools for different users
- don't use the new allocator in qcom_scm_pas_init_image() as the
  TrustZone will create an SHM bridge for us here
- rewrite the entire series again for most part

v1 -> v2:
- too many changes to list, it's a complete rewrite as explained above

Bartosz Golaszewski (12):
  firmware: qcom: add a dedicated TrustZone buffer allocator
  firmware: qcom: scm: enable the TZ mem allocator
  firmware: qcom: scm: smc: switch to using the SCM allocator
  firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ
    allocator
  firmware: qcom: qseecom: convert to using the TZ allocator
  firmware: qcom: scm: add support for SHM bridge operations
  firmware: qcom: tzmem: enable SHM Bridge support
  firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
  arm64: defconfig: enable SHM Bridge support for the TZ memory
    allocator

 arch/arm64/configs/defconfig                  |   1 +
 drivers/firmware/qcom/Kconfig                 |  30 ++
 drivers/firmware/qcom/Makefile                |   1 +
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 261 +++++--------
 drivers/firmware/qcom/qcom_scm-smc.c          |  30 +-
 drivers/firmware/qcom/qcom_scm.c              | 179 +++++----
 drivers/firmware/qcom/qcom_scm.h              |   6 +
 drivers/firmware/qcom/qcom_tzmem.c            | 365 ++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h            |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
 include/linux/firmware/qcom/qcom_scm.h        |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  28 ++
 12 files changed, 669 insertions(+), 255 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

-- 
2.40.1


