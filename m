Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14493E4CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 21:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbhHITQ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 15:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbhHITQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 15:16:28 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3C0C061798
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 12:16:07 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id g6so9568068qvj.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 12:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eNbXDUTDq2s+IaNPv/bGr5+o3NzigRzKhkvSyNsXN88=;
        b=zZQPvJUNvjfkbD+0j59Ay36EtKRba9d/7e1T3pbuBzJksLb46H1gcjWWVQ3JVhcwfb
         ZQopmiE3aK1C8xme5PRrrW0HvQC7Ps+8JhK8LoEP+io9kR1AyQxjTNwHP7AmFzf+gpN7
         M362d3zSAxYXoVreM6mKyTADldvuG58E/gaA3E3YYjdR7/P35nL/Hy1RbxQRNBqHFOrx
         I1FLsmXvBQaZPRkdVNTAOn3huJoiCmrEzqcaL7wpf6h523pWon2pj2As/JsSPJ0ZNZnd
         dR5jD5x5+GxwsqCHU9S5tuByklaS/zZ0j/jAAJsYFvuI6HVO0SmeTM7Oocj0sUTMYG0N
         Cjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eNbXDUTDq2s+IaNPv/bGr5+o3NzigRzKhkvSyNsXN88=;
        b=X82K92JoKTvU1zJ7R03zUo0X2XuOwqkzRxxgatuoIxqE5ylsRX4nSb84ajA+9omGDX
         qFlAb+/7SvzVq8scuYwGuXvOoTrq+XR/tQeAv2Yd5Fq0Rrx1GYD/PLi1QG/golFKfx13
         YzjFmB9EexbeVl2o7GuqqkOd/NXZ4BD6rDp/VjwBI3p6GJNCk7+zXBKo56+CWuvB23Dq
         bNxKguymgWw6nGB6kKMRbYAESgSos1MJcaLSPfTvOYPYSNeckzOV38nVKsdP3rnEy+2A
         C/8ESB1onqkgwaPijAQV8vZ9unAZVAOJAWPDgGySadCccmT1gP0o02To+q+us+7vVpkb
         k+Jw==
X-Gm-Message-State: AOAM531nyQRhC6bD2SRjyCkVE6MX5AWn0G5Qo+aqgbjhA5ygvNl3xo0q
        mRFWj6epsKhKUTt1VLqLElUWNexdBQse1A==
X-Google-Smtp-Source: ABdhPJxOihykJpeRPEDZTzRcVEV2Wuq24+nqfDn5c/qMKXFJNx0xbZGL2prEG0JGiv7yz9JcoA6chA==
X-Received: by 2002:a05:6214:570:: with SMTP id cj16mr4212867qvb.41.1628536566949;
        Mon, 09 Aug 2021 12:16:06 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id n14sm7303398qti.47.2021.08.09.12.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 12:16:06 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     steev@kali.org, tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [Patch v5 0/6] Introduce LMh driver for Qualcomm SoCs
Date:   Mon,  9 Aug 2021 15:15:58 -0400
Message-Id: <20210809191605.3742979-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Limits Management Hardware(LMh) is a hardware infrastructure on some
Qualcomm SoCs that can enforce temperature and current limits as programmed
by software for certain IPs like CPU. On many newer SoCs LMh is configured
by firmware/TZ and no programming is needed from the kernel side. But on
certain SoCs like sdm845 the firmware does not do a complete programming of
the h/w block. On such SoCs kernel software has to explicitly set up the
temperature limits and turn on various monitoring and enforcing algorithms
on the hardware.

Introduce support for enabling and programming various limit settings and
monitoring capabilities of Limits Management Hardware(LMh) associated with
cpu clusters. Also introduce support in cpufreq hardware driver to monitor
the interrupt associated with cpu frequency throttling so that this
information can be conveyed to the schdeuler via thermal pressure
interface.

With this patch series following cpu performance improvement(30-70%) is
observed on sdm845. The reasoning here is that without LMh being programmed
properly from the kernel, the default settings were enabling thermal
mitigation for CPUs at too low a temperature (around 70-75 degree C).  This
in turn meant that many a time CPUs were never actually allowed to hit the
maximum possible/required frequencies.

UnixBench whets and dhry (./Run whets dhry)
System Benchmarks Index Score

                Without LMh Support             With LMh Support
1 copy test     1353.7                          1773.2

8 copy tests    4473.6                          7402.3

Sysbench cpu
sysbench cpu --threads=8 --time=60 --cpu-max-prime=100000 run

                Without LMh Support             With LMh Support
Events per
second                  355                             614

Avg Latency(ms)         21.84                           13.02

v4->v5:
	- Rebased to v5.14-rc5.

v3->v4:
        - Rebased to v5.14-rc2.

v2->v3:
        - Included patch adding dt binding documentation for LMh nodes.
        - Rebased to v5.13

Thara Gopinath (6):
  firmware: qcom_scm: Introduce SCM calls to access LMh
  thermal: qcom: Add support for LMh driver
  cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support
  arm64: dts: qcom: sdm45: Add support for LMh node
  arm64: dts: qcom: sdm845: Remove cpufreq cooling devices for CPU
    thermal zones
  dt-bindings: thermal: Add dt binding for QCOM LMh

 .../devicetree/bindings/thermal/qcom-lmh.yaml |  82 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 162 ++----------
 drivers/cpufreq/qcom-cpufreq-hw.c             | 147 +++++++++++
 drivers/firmware/qcom_scm.c                   |  58 +++++
 drivers/firmware/qcom_scm.h                   |   4 +
 drivers/thermal/qcom/Kconfig                  |  10 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/lmh.c                    | 232 ++++++++++++++++++
 include/linux/qcom_scm.h                      |  14 ++
 9 files changed, 574 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
 create mode 100644 drivers/thermal/qcom/lmh.c

-- 
2.25.1

