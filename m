Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0486D9A52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 21:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394418AbfJPThb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 15:37:31 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34988 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394365AbfJPThb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 15:37:31 -0400
Received: by mail-qt1-f196.google.com with SMTP id m15so37943874qtq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mJHOakKVvshLG3Rzud38KEbOaNx+SThGCVNUUHA+c8k=;
        b=w5G4rO6cnoFzj2kF84Hr/GZtHT1Zve5j9WyjVpVK9JFX1mk/AvbZfE6glsJsrQ2bHZ
         d5BOsKSptJU5C1rkmoLn0qoBb/KDjamoVhNZQGaVK8YXrI5KcY4G4SHD3Y4lnNwXm4zd
         NmfTkknFJgHcYV9nVtUW8GTl+JrglpLjDPrfw5xC5bCBkIMICrkq32IqMFGPeZ+Rzc7t
         VZrraGhKRx+Z7vFexQpkgnUDhj+9WXA2uS/1/4J+kd1U2cQhs9M1HOwkxln44HNgMUiW
         GJ/mMZoochmYSU5FNxeRWPETGriXjfl6QqyVWhLFx8gwcRWSDYZb6/Wn+LJrVuDrsRtW
         /v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mJHOakKVvshLG3Rzud38KEbOaNx+SThGCVNUUHA+c8k=;
        b=aRMPifea1kxz8iQZ6FbED1ffHsao+5HXseHXQHTA2B2/3CVoBaWqrxLdyzry6oJJhD
         kcWtm2pSdcsCaE6d283RgLJ4gEh/FYO+zos3vaEY2sNk1RqYLT+KL4gluLWnoQRw/ZV2
         Bx/mxbyxKSZW9gWIBrwLsKi+KX03xs/6WLWTv/Nf51YeNHtio4NxbpgDQ7tJHDP17TE8
         0o58xexHIvIZ3/9BmBYC3y0nww0/hZvf6aC1NRLVgL6ZyL4897divOEIiCK+dUfz17Zy
         3ZxSY9o9vKPbRV58ZTSPU7VAd6X2zroC2/ZxdL52yYVPOwpSNxzy4/i+UWGQ97r936Wa
         zPDA==
X-Gm-Message-State: APjAAAX/RTg1X7AuZrPcD95Y/5E1Bpbi73Ja3GXHRRXr/XaoHi9zU8K0
        83yheE+CLU6oZXaNEb2iqF2vWA==
X-Google-Smtp-Source: APXvYqxksfg5j666p6bPfX8pfqyE2zz9v/AOGwzl9RkscOjeUr/PexA0qh0wHbZrIjzQkfl9oeTToQ==
X-Received: by 2002:a0c:c10d:: with SMTP id f13mr44317850qvh.88.1571254648443;
        Wed, 16 Oct 2019 12:37:28 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id 54sm16246030qts.75.2019.10.16.12.37.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 16 Oct 2019 12:37:27 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7]Introduce Power domain based warming device driver
Date:   Wed, 16 Oct 2019 15:37:14 -0400
Message-Id: <1571254641-13626-1-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Certain resources modeled as a generic power domain in linux kernel
can be used to warm up the SoC (mx power domain on sdm845)
if the temperature falls below certain threshold. These power domains
can be considered as thermal warming devices.
(opposite of thermal cooling devices).

In kernel, these warming devices can be modeled as a
thermal cooling device. Since linux kernel today has
no instance of a resource modeled as a power domain acting as a
thermal warming device, a generic power domain based thermal warming device
driver that can be used pan-Socs is the approach taken in this
patch series. Since thermal warming devices can be thought of as the
mirror opposite of thermal cooling devices, this patch series re-uses
thermal cooling device framework. To use these power domains as warming
devices require further tweaks in the thermal framework which are out of
scope of this patch series. These tweaks have been posted as a separate
series[1].

The first patch in this series extends the genpd framework to export out
the performance states of a power domain so that when a power
domain is modeled as a cooling device, the number of possible states and
current state of the cooling device can be retrieved from the genpd
framework.

The second patch implements the newly added genpd callback for Qualcomm
RPMH power domain driver which hosts the mx power domain.

The third patch introduces late init ops for thermal cooling device that
is called after the cooling device is created and registered but before
binding it to a thermal zone for specific initializations.

The fourth patch introduces the generic power domain warming device driver.

The fifth patch extends Qualcomm RPMh power controller driver to register
mx power domain as a thermal warming device in the kernel.

The sixth patch describes the dt binding extensions for mx power domain to
be a thermal warming device.

The seventh patch introduces the DT entreis for sdm845 to register mx power
domain as a thermal warming device.

v1->v2:
        - Rename the patch series from
        "qcom: Model RPMH power domains as thermal cooling devices" to
        "Introduce Power domain based thermal warming devices" as it is
        more appropriate.
        - Introduce a new patch(patch 3) describing the dt-bindings for
	generic power domain warming device.
        - Patch specific changes mentioned in respective patches.

v2->v3:
	- Changed power domain warming device from a virtual device node
	entry in DT to being a subnode of power domain controller binding
	following Rob's review comments.
	- Implemented Ulf's review comments.
	- The changes above introduced two new patches (patch 3 and 4)

1. https://lkml.org/lkml/2019/9/18/1180
Thara Gopinath (7):
  PM/Domains: Add support for retrieving genpd performance states
    information
  soc: qcom: rpmhpd: Introduce function to retrieve power domain
    performance state count
  thermal: core: Add late init hook to cooling device ops
  thermal: Add generic power domain warming device driver.
  soc: qcom: Extend RPMh power controller driver to register warming
    devices.
  dt-bindings: soc: qcom: Extend RPMh power controller binding to
    describe thermal warming device
  arm64: dts: qcom: Add mx power domain as thermal warming device.

 .../devicetree/bindings/power/qcom,rpmpd.txt       |  10 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   5 +
 drivers/base/power/domain.c                        |  37 ++++++
 drivers/soc/qcom/rpmhpd.c                          |  30 ++++-
 drivers/thermal/Kconfig                            |  10 ++
 drivers/thermal/Makefile                           |   2 +
 drivers/thermal/pwr_domain_warming.c               | 136 +++++++++++++++++++++
 drivers/thermal/thermal_core.c                     |  13 ++
 include/linux/pm_domain.h                          |  13 ++
 include/linux/pwr_domain_warming.h                 |  31 +++++
 include/linux/thermal.h                            |   1 +
 11 files changed, 287 insertions(+), 1 deletion(-)
 create mode 100644 drivers/thermal/pwr_domain_warming.c
 create mode 100644 include/linux/pwr_domain_warming.h

-- 
2.1.4

