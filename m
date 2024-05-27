Return-Path: <linux-arm-msm+bounces-20606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C058D0092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0265A1F242EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC7E15EFDC;
	Mon, 27 May 2024 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pH4FkCfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65315EFD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814607; cv=none; b=GZzfpTDq9h6rYHacWakOwjgne2yHQuk0PUykKL3yuOpEdIv3jvMmGZOQpGF3hfCJTU233UExdoWOpMawmpD1G5JDcD3csBwhCwoHkmBzspdViW2QqWZX9UyDDP8yHupAxEkxlONwjASrkdASBK8bvbE/34JkkPh4hMtnB/jRkDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814607; c=relaxed/simple;
	bh=CA8042YIpnyj2ZXHYRDm1I27BUIfcazEW/6sonPev8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G2IFc5tgjc2N226mObktKdCe8DfKrA7ibyw4IAoIX2RDBOPOAT0umjFBfKLL92Uwj97MgE27YsC9scEWyQeIyzu4/Ty7sy90m26Tl0cB5bJH60g58AXD8kfO9b7juUUbzZdLHGV5Viuxqc8nrEGh8P0aPBoNEaL+RZYMY4LWoeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pH4FkCfT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42108739ed8so33631815e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814605; x=1717419405; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GD82MM1VVjohnjRvbeZeJlkCdboh2s6SKcgpo4ScdJw=;
        b=pH4FkCfTEz8EeN0nO71PcsbQeZ+EzsIbNQCc33Kw4HKGos89/ylC3cIddIqSpQoIYR
         xCgIp+fJdNrndjbPSHN+K2pZLzD8YhR4db3rgp10QhVMvviBGJ9aLJuhpcNdjzmHk2PX
         LEsGWZHPh9owsRvWLFx/3mmmvW3auT7bJFHRkez5Pvfe5grCHCxzr55D4sbY46hmEH/R
         4WqnuznBBQYKpM0kTxlRt14Z1qozlWYT5doLR/HhKLbF8pVbQKAQopDzauMvyF2dGl0F
         V8/jxhLbLGL7kcirAkTzMRfmsS5CyJtpe08TjjolYkPtH3xbEmdUqfTQD/nvuEm04rlQ
         H7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814605; x=1717419405;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GD82MM1VVjohnjRvbeZeJlkCdboh2s6SKcgpo4ScdJw=;
        b=LVhW3G5V5gnDKn2/iv3xPtOrUtswj6troI9oI1oaaqAA8AR2O/WMNDalbyzgru5O4E
         urlm9URSPpYG4W6Qk8jP6CPWcWqlFasTxc8j5XTc449V3v/NYfXe20zZ8HcTKJ4GwYCj
         zOfhA09p98gCXyp7tZj4KTzd9pWO+sQAXAMWjSTui7go4GAZ/Hi1alaiUr1BP6fPIkPs
         e2mob2maooyWahzYBLjjaClas+o5LMWuhU0KgKL5mJm3921WLyFdZC3AakNCbYOwzT3w
         k+nTxZSkx7r+SSn0kXUabBHN+yC6Aglb3mdNxwq2VVoHbgbCmmEtmfW8JjfgmF0bDQOw
         J+mQ==
X-Gm-Message-State: AOJu0YzUbLdq4jfGK5Vbv+UBo7KdlDQD1nnsvC1gdSFdnhghJvoQPXKD
	on9WqTk2LK2y/meo0ip6j14mdkXVXjLKjRFsDA3kPvvgEcByMzH9BowOV8F5EQo=
X-Google-Smtp-Source: AGHT+IE5ugbBF1IRGuSLkrpLGi0B589uc1IvGTg3DvM/wSrGwWTLZuoK7IkX4Cupa1ZlCdYCe3k0VQ==
X-Received: by 2002:a05:600c:5354:b0:420:f8:23d6 with SMTP id 5b1f17b1804b1-42108aa7589mr94703665e9.36.1716814604660;
        Mon, 27 May 2024 05:56:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v10 00/15] firmware: qcom: implement support for and enable
 SHM bridge
Date: Mon, 27 May 2024 14:54:50 +0200
Message-Id: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqCVGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDA10FJSSM
 xLz0lN1M1OAAkpGBkYmBqZG5rrFGbm6SUWZKUCZVCMTS5O05OQkgyRTJaCGgqLUtMwKsGnRsbW
 1AHRGr/9dAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6070;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CA8042YIpnyj2ZXHYRDm1I27BUIfcazEW/6sonPev8Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMEs510EWY0AP7N7UDVpxO2Si8KYg3b7HUsk
 D/JPsAZSw2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDBAAKCRARpy6gFHHX
 citoD/9Zd1+dMd+FnsjX5/jY0RWRlqxdoaDVqQWUwTdCnDssRbXefCUcB7LYJo9UXENpfuqwqJE
 ljZtDmSe+n4bp9RGKTJl0eLLKlDld4q430oe83vF2z0848OwCXGg9l/60Z0J5T8fBHizikYDrAO
 Sr2MaUUC5VS8ZqO/bKh5rMUtEQWgGcDNxIevAm2qBdlLCTbS3fMWP5TvmGPW34/ofkLgPK/P52C
 6u9t2TOSceD6+Q5OvtBtev64l4X7MF2fNSklCKeeTXm2Xj5fRN9/ibIaczulaNW+DEtZGlyriU/
 cF/PIHb6Z7j0c96czpKjtmgiIc6Tnwc3zi4JzVvxI6+QnP5W+ImEtnm3kXSv3TP+ML/9YBON1iB
 9R3S/yHktXXgURFUwmFCEGHYledlk4onvVyRLF73BbNA0EifW7YVxuzAgtbZKFgB8yc6DdN22DZ
 kTUy8RGeTDEwFPs/H2KOmXQvwXRMklWMrG8v0zvrJgPp09Hpd0HXOZ6qckhCugr7elPGPAOxlKW
 UQcs3DWwiquvPeN6fpJEzW0bfZM5cGSBr7sKHX0NOY6tgrXw6lsIaIYggnMFri8eyQD/2B8GoU5
 7Bb+YDN2nFAvDaWjEdKv+1gsbjheGWOq27MI6e/oLSkUQaTUIscbc5+MddJFA9GjRrenA3OBfbH
 dtX8F7ipq8BTXQA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

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

Tested on db410c, RB5, sm8550-qrd, sa8775p-ride (verified the memory is
allocated from the dedicated pool) and lenovo X13s. I also tested on
sc8180x with SHM bridge disabled to make sure we can still use this SoC
with generic allocator.

v9 -> v10:
- add support for dedicated TZ FFI memory carveout and enable it for
  sa8775p
- add a blacklist of SoC known to not support SHM bridge correctly
  (currently only sc8180x)

v8 -> v9:
- split the qseecom driver rework into two parts: first convert it to using
  the __free() helper and then make it switch to tzmem
- use QCOM_SCM_PERM_RW instead of (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ)
- add the TZMEM MAINTAINERS entry in correct alphabetical order
- add a missing break; in a switch case in the tzmem module

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

---
Bartosz Golaszewski (15):
      dt-bindings: firmware: qcom,scm: add memory-region for sa8775p
      firmware: qcom: add a dedicated TrustZone buffer allocator
      firmware: qcom: scm: enable the TZ mem allocator
      firmware: qcom: scm: smc: switch to using the SCM allocator
      firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
      firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
      firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
      firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
      firmware: qcom: qseecom: convert to using the TZ allocator
      firmware: qcom: scm: add support for SHM bridge operations
      firmware: qcom: tzmem: enable SHM Bridge support
      firmware: qcom: scm: add support for SHM bridge memory carveout
      firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
      arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
      arm64: dts: qcom: sa8775p: add a dedicated memory carveout for TZ

 .../devicetree/bindings/firmware/qcom,scm.yaml     |  15 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/qcom/Kconfig                      |  31 ++
 drivers/firmware/qcom/Makefile                     |   1 +
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    | 256 +++++------
 drivers/firmware/qcom/qcom_scm-smc.c               |  30 +-
 drivers/firmware/qcom/qcom_scm.c                   | 175 ++++++--
 drivers/firmware/qcom/qcom_scm.h                   |   6 +
 drivers/firmware/qcom/qcom_tzmem.c                 | 466 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h                 |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h         |   8 +-
 include/linux/firmware/qcom/qcom_scm.h             |  14 +-
 include/linux/firmware/qcom/qcom_tzmem.h           |  56 +++
 15 files changed, 854 insertions(+), 233 deletions(-)
---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240527-shm-bridge-e2494fccb0b5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


