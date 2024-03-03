Return-Path: <linux-arm-msm+bounces-13168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BAE86F59D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69242B2139D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5877767C44;
	Sun,  3 Mar 2024 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zMQQtaek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB5667A1D
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478087; cv=none; b=Q285NtqjxwYomzj89M+5d/T8FhS4+FK4DhL6z+jDmbvnUxddVHLUGvwNo5OWODzgwk2XDK071CrqsBJF2ogp+yEW2yuioxs/pNsl6QKK+eZ3NR7BVkNSVPDhsY7OgDaizFZ8PMjhgTKARiQqiCMt5QFdsdEpUpjhMcOqFj3SPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478087; c=relaxed/simple;
	bh=vGQbrMfFdPpFdFs7Qu5IAQBhUT25rDD/52ZctcPWzms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EyOBkO0aUxZryHzwCy+MH9B0EAN3fKdljkj+U7LuUe1sZewM8acCLdJu5RaHj3OxN0i2y/uc4gkvjof1DQ31eYjl9xjuxgz5ghcJLhAx0ln2ytI/a37ZrYjfYL9uibWrqxFZ6tju9Sedzg5O1lO6Tvg3URcHJ4IjocB/nZbriLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zMQQtaek; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513382f40e9so1513845e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478083; x=1710082883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYW9KQXf8V+PKlETqcpcfZNaabV0OKD9pMan6c/GyBU=;
        b=zMQQtaekv2V4zW9mHtku1BBIsG3PxaZIBbr0PivXNz988jdn62kO5OwLR5xdlc/acR
         hq2i7P4fCKJ/KkM+nwZPG0/cV9TyRuQAJGVFXxDijqAQcWER/m9Kz+RklVC/dvsWmnMT
         52uG9Zj9rXVLukvoLVWT2gZ7oHVoT+8EP0eT+9qYpOpYxWv+CD50PBztBd4C5WqtpSns
         CAcmjinVRRpXNTRfX7VtPN5vVe+DiOBVdNSQHcCYZYWmZDlVZ6hXo0cZSbyKFqHUJHZD
         rMfDyXywzMexxIJwDU/3t+RSLxLkAULtlOwqs26Y5BNyA+ERUKYx22LIBONJ2dH7C5yN
         //3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478083; x=1710082883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYW9KQXf8V+PKlETqcpcfZNaabV0OKD9pMan6c/GyBU=;
        b=ZhuOjGOPOiYO4deM3j+7mkVirQtXUd5WKNHJvt78cUVjrzgrTnRnyunZ97yU8oBFRS
         U8AmGtaehvvYnmCorckh1/8oba5EkmWINod5YVJGeWzEKXHI6ZmfFf7s9BIZvUGZKyqh
         L+u3s7FaPCJBDymmt45o6urP3CDEFRBSw66MP1nx7mEdQHBlu4TThUBAUlWW+zrAn5Ou
         +b3L+SxhxKCVMrBzhWVnghaB2q6kZ3n1fHFy7uU9vK5eFG7DKd7EEDwJCiE7hZAkorDH
         jg0rPg0gjYh3YOkMZ8KGceXRfCJqmxRWgkgZqrbZt+BQ3rdqpitQk/6LYsNer4MjnOML
         /duA==
X-Gm-Message-State: AOJu0YyVzgOUitz5bxFAfPiBbn23JndA6Y50g+N6dtizmYLVxoxcd2ui
	L+2LOqZ0HX23syx6WZYaKP15NGc/XtI5ACf/PQE+QUeCD2mzo5S5BZ7/HxMVO5c=
X-Google-Smtp-Source: AGHT+IHhlDO5fo+sXyanwUyWP/ORnjid3vFDepYJHD6/jLbt27UMTibRuvZGPXLcCuOowXifDEMHsg==
X-Received: by 2002:a05:6512:3714:b0:513:13a4:95e4 with SMTP id z20-20020a056512371400b0051313a495e4mr3786910lfr.36.1709478083134;
        Sun, 03 Mar 2024 07:01:23 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:22 -0800 (PST)
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
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v8 00/12] firmware: qcom: implement support for and enable SHM bridge
Date: Sun,  3 Mar 2024 16:01:03 +0100
Message-Id: <20240303150115.133633-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

SCM calls that take memory buffers as arguments require that they be
page-aligned, physically continuous and non-cachable. The same
requirements apply to the buffer used to pass additional arguments to SCM
calls that take more than 4.

To that end drivers typically use dma_alloc_coherent() to allocate memory
of suitable format which is slow and inefficient space-wise.

SHM Bridge is a safety mechanism that - once enabled - will only allow
passing buffers to the TrustZone that have been explicitly marked as
shared. It improves the overall system safety with SCM calls and is
required by the upcoming scminvoke functionality.

The end goal of this series is to enable SHM bridge support for those
architectures that support it but to that end we first need to unify the
way memory for SCM calls is allocated. This in itself is beneficial as
the current approach of using dma_alloc_coherent() in most places is quite
slow.

First let's add a new TZ Memory allocator that allows users to create
dynamic memory pools of format suitable for sharing with the TrustZone.
Make it ready for implementing multiple build-time modes.

Convert all relevant drivers to using it. Add separate pools for SCM core
and for qseecom.

Finally add support for SHM bridge and make it the default mode of
operation with the generic allocator as fallback for the platforms that
don't support SHM bridge.

Tested on db410c, RB5, sm8550-qrd. Previous iteration tested also on
sa8775p-ride and lenovo X13s (please do retest on those platforms if you
can).

v7 -> v8:
- make the pool size dynamic and add different policies for pool growth
- improve commit messages and the cover letter: describe what the SHM
  bridge is and why do we need it and the new allocator, explain why it's
  useful to merge these changes already, independently from scminvoke
- improve kerneldoc format
- improve the comment on the PIL SCM calls
- fix license tags, drop "or-later" for GPL v2
- add lockdep and sleeping asserts
- minor tweaks and improvements

v6 -> v7:
- fix a Kconfig issue: TZMEM must select GENERIC_ALLOCATOR

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
 drivers/firmware/qcom/Kconfig                 |  31 ++
 drivers/firmware/qcom/Makefile                |   1 +
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 288 +++++------
 drivers/firmware/qcom/qcom_scm-smc.c          |  30 +-
 drivers/firmware/qcom/qcom_scm.c              | 182 ++++---
 drivers/firmware/qcom/qcom_scm.h              |   6 +
 drivers/firmware/qcom/qcom_tzmem.c            | 455 ++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h            |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
 include/linux/firmware/qcom/qcom_scm.h        |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  56 +++
 13 files changed, 816 insertions(+), 265 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

-- 
2.40.1


