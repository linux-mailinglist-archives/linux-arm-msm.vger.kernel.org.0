Return-Path: <linux-arm-msm+bounces-7751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D403835F73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29F14B2689A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5093A8C5;
	Mon, 22 Jan 2024 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HYdOk9Wf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E043A1DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918930; cv=none; b=XymMR9JNTmJYCMn4g2D/t7Rmt52rTRqO4yIRtjMwr2gWDRi08/IT5wZuzZryxzxJTsLb6ws2161xlByNHa1urFX3pfuewPEqU/CRBm5NOOwswQWnP+WPax6rN0hFzQzmjzMogsSgl+S/M22ahlL0Tft968AEazfkTOs1+5wqRuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918930; c=relaxed/simple;
	bh=lIUkRttEekWpxAjFmsZgcf73IMsJZGjVAfLGW8ifIeg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wj7cYtpAGSHdbITEtjZqJ3tI9/iEsmFuSYVn+J/hJMtqWQtGl0MnP/8m56/D6OLCfXm4ZXbK0YyUp9mNICnDvb+WZU2AL4GlZRbb8xvQvFwP41sqoikjV478PaCsBlnKTjmJXRrCu+bhrjhii8NLTDS+fIOH5M64WOjv6b5U8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HYdOk9Wf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so38944505e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918926; x=1706523726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf1BoFdqtUASlu+bDRkAxrtXf+RijsyUfpG8EnvAHFE=;
        b=HYdOk9WfhYK7mFVGtFF/S7bNGZXgv5Zw9USmG6so8T9zGjw/Bu0ty9IN3c3HizSzZT
         NXWv+4bWI9TuQHJcnfT4wH4Yez2zdk7BIOOLYZk2DTXrV73b6F+U/7FNydVjWvnN+DJG
         5gmsMWKddahvQWS1Mq0xfqt2YOu/UsXCJRf05Q9138Y4LrQ/njaCAh/Vn6HU1kJIXb0R
         u7xBzjTxrekYmc6O16Pa0nziBg4liPsbzYF292UgwOvgxNqfMAZhb2ORt9W8p/5UFXdX
         i8oS/FGe2EjwhmQrF8bmsB8I4PeEt5cIoGn5ueCzUvTiUolAqZcSgekxU5dzae/6RWdp
         +44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918926; x=1706523726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf1BoFdqtUASlu+bDRkAxrtXf+RijsyUfpG8EnvAHFE=;
        b=Gr+prLyqNbl6BKCcxJP8XGPgxTMZMktgj7fblHic4wwyyQXMerwItd20IocY6SoZQn
         x7xhryJKAQApcJcQTtvBmKIrFLwFGA8lWXrScahilcaP+ln8D0qr7Llr3NuOAZeQvY9w
         5usnZkVrUgnFulHu30BingXD1JMqMqSAwhNz3RJedMD5CgyFnIdSxSF51LGVPey3lvFp
         Y+DE87xPsKlc/Fi2CP5KMfyBxaOtujwtwp8MIrp4C0F03ETVhFUHXcDuvHUbHuh7kDlc
         aKhLZ+2pZgLA6utZxOFTU6sexV4Zu6bJPAUyqB0sViAdySm/JiJA5Qj8+q5XRH8A3aZ+
         2EIA==
X-Gm-Message-State: AOJu0Yw080Xo1zcKtpUlPcNs9suko0xb1bj918fU/gi6oee9v2jhpT7D
	K07Pw019nEoOHQaW/0DzJhxKVaHbHx/UgG3KgbF7RhBo1h8ufEFHEFT+fk8A1Wk=
X-Google-Smtp-Source: AGHT+IEdNK6nO0KwNdSrht0sUYc/g9kz76RCgf//L7woN5+hF39GrB6vClpm0hmQ1N0RwLSfUG6vZQ==
X-Received: by 2002:a05:600c:5492:b0:40e:710d:7c1c with SMTP id iv18-20020a05600c549200b0040e710d7c1cmr2079899wmb.32.1705918925540;
        Mon, 22 Jan 2024 02:22:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:04 -0800 (PST)
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v6 00/12] arm64: qcom: add and enable SHM Bridge support
Date: Mon, 22 Jan 2024 11:21:45 +0100
Message-Id: <20240122102157.22761-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Resending after the merge window. I dropped the first patch which was a
fix and was picked up last release cycle.

We've established the need for using separate secured memory pools for
SCM and QSEECOM as well as the upcoming scminvoke driver.

It's also become clear that in order to be future-proof, the new
allocator must be an abstraction layer of a higher level as the SHM
Bridge will not be the only memory protection mechanism that we'll see
upstream. Hence the rename to TrustZone Memory rather than SCM Memory
allocator.

Also to that end: the new allocator is its own module now and provides a
Kconfig choice menu for selecting the mode of operation (currently
default and SHM Bridge).

Tested on sm8550 and sa8775p with the Inline Crypto Engine and
remoteproc.

v5 -> v6:
Fixed two issues reported by autobuilders:
- add a fix for memory leaks in the qseecom driver as the first patch for
  easier backporting to the v6.6.y branch
- explicitly cast the bus address stored in a variable of type dma_addr_t
  to phys_addr_t expected by the genpool API

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

 MAINTAINERS                                   |   8 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/firmware/qcom/Kconfig                 |  30 ++
 drivers/firmware/qcom/Makefile                |   1 +
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 281 +++++---------
 drivers/firmware/qcom/qcom_scm-smc.c          |  30 +-
 drivers/firmware/qcom/qcom_scm.c              | 179 +++++----
 drivers/firmware/qcom/qcom_scm.h              |   6 +
 drivers/firmware/qcom/qcom_tzmem.c            | 365 ++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h            |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
 include/linux/firmware/qcom/qcom_scm.h        |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  28 ++
 13 files changed, 684 insertions(+), 268 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

-- 
2.40.1


