Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D072A499D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgKCP3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgKCP3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:13 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F45C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:11 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id g12so18979005wrp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cinjSse47w4OyBjCwL2P/oafcagxHnLlboUEJDujNWw=;
        b=cX7YnHDv9m5+T7PbYX1ejAYBuULrQQ+M0omEMTQnojpGH8v/C5HKpdzGwPJOa5ab2J
         hWvr65vepL8wyiP+0aMOixJkRcMW5S6eaXcMWPrYmd/7G58lnJBRA7mZOEsNleDYa0yr
         SKIlBUDn2JHHV9/9oFL2tnLHsBG8k26M+lqdFa2vY0c/HN4q7AYGC48aRoGa/vyC4lH/
         my/WLOeYp1lwX1+QNh/x7yP9dEPhbwuo7fSZHgNeLSf8FfpoUnTAFo5BL3I2Y+E4p++O
         Hbne+HYaqgTlebyKrpkPS6jDswYcHoysUa1ZTvtvRAVDOBwaryaj9SVgIWvC0yOjixW6
         hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cinjSse47w4OyBjCwL2P/oafcagxHnLlboUEJDujNWw=;
        b=lMIynj4pGxqssHRff857qQTK/zTNJrwVDIZU3AdSEVRILWAX2gLQAeLxIPi+QvHv1p
         lO/i1SnZ8AF332eecrGcsiBmq0NKzKkQiP0GEmy1J103Cd1y2Ftt2sKNyDfYzLVHNaNL
         j/jV8oGFm1aMQ99/Q9CpzNfxxOp8d9/X9ixtWHhiNMaZObUV40RgsKDsWb3RPN1NXor1
         7Vz0OAHYHX3mVzbMU6/rYPrPlXfUlMN4UJXfKUmJsjIkdCKLioyoAox0mYf5mKXR4S75
         fJUy/jL1F7czT9V5rshoOk9jfE15UUlTQEo0w4JjiPmUsZIjGSJ9ta2jsjsbQh2bm9D1
         D9UA==
X-Gm-Message-State: AOAM531l8AHKhXzCM1wcE9MPRjgawoDSxo20YNPZ0A5DlPiKMl4FDcAr
        GB+wRmuZ1/12iMYEh7Drs/48ugh9nENLBRs9
X-Google-Smtp-Source: ABdhPJyzlV0HXdTidCRBprYLkp0uWjD8RuYpiqDZS7BW//F1Q+dvuU4dB6/3Ff6PqbhKnABb0CWqEw==
X-Received: by 2002:adf:c803:: with SMTP id d3mr11847040wrh.108.1604417350540;
        Tue, 03 Nov 2020 07:29:10 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:09 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        act <dmalek@jlc.net>, Andy Gross <agross@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Ben Dooks <ben@simtec.co.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cyril Chemparathy <cyril@ti.com>,
        Dan Malek <dan@embeddedalley.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Doug Anderson <dianders@chromium.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Sandeep Nair <sandeep_n@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Scott Wood <scottwood@freescale.com>,
        "Software, Inc" <source@mvista.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vitaly Bordug <vbordug@ru.mvista.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH 00/25] Rid W=1 warnings in SoC
Date:   Tue,  3 Nov 2020 15:28:13 +0000
Message-Id: <20201103152838.1290217-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (25):
  soc: bcm: brcmstb: pm: pm-arm: Provide prototype for
    brcmstb_pm_s3_finish()
  soc: qcom: qcom_aoss: Remove set but unused variable 'tlen'
  soc: qcom: qcom_aoss: Add missing description for 'cooling_devs'
  soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
  soc: rockchip: io-domain: Remove incorrect and incomplete comment
    header
  soc: ti: knav_qmss_queue: Remove set but unchecked variable 'ret'
  soc: ti: knav_qmss_queue: Fix a whole host of function documentation
    issues
  soc: ti: knav_dma: Fix a kernel function doc formatting issue
  soc: ti: pm33xx: Remove set but unused variable 'ret'
  soc: ti: wkup_m3_ipc: Document 'm3_ipc' parameter throughout
  soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
  soc: qcom: qcom-geni-se: Fix misnamed function parameter 'rx_rfr'
  soc: tegra: fuse: speedo-tegra124: Remove some set but unused
    variables
  soc: samsung: s3c-pm-check: Fix incorrectly named variable 'val'
  soc: qcom: rpmh: Fix possible doc-rot in rpmh_write()'s header
  soc: qcom: smem: Fix formatting and missing documentation issues
  soc: qcom: smsm: Fix some kernel-doc formatting and naming problems
  soc: qcom: wcnss_ctrl: Demote non-conformant struct header and fix
    function headers
  soc: qcom: smp2p: Remove unused struct attribute provide another
  soc: qcom: llcc-qcom: Fix expected kernel-doc formatting
  soc: qcom: rpmhpd: Provide some missing struct member descriptions
  soc: qcom: kryo-l2-accessors: Fix misnaming of 'val'
  soc: ti: k3-ringacc: Provide documentation for 'k3_ring's 'state'
  soc: tegra: fuse: speedo-tegra210: Remove a group of set but unused
    variables
  soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'

 drivers/soc/bcm/brcmstb/pm/pm-arm.c      |  2 +
 drivers/soc/fsl/dpio/qbman-portal.c      | 18 +++++--
 drivers/soc/fsl/qbman/qman.c             |  8 +--
 drivers/soc/fsl/qe/qe_common.c           |  2 +-
 drivers/soc/qcom/kryo-l2-accessors.c     |  2 +-
 drivers/soc/qcom/llcc-qcom.c             |  2 +-
 drivers/soc/qcom/qcom-geni-se.c          |  5 +-
 drivers/soc/qcom/qcom_aoss.c             |  4 +-
 drivers/soc/qcom/rpmh.c                  |  2 +-
 drivers/soc/qcom/rpmhpd.c                |  3 ++
 drivers/soc/qcom/smem.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                 |  3 +-
 drivers/soc/qcom/smsm.c                  |  4 +-
 drivers/soc/qcom/wcnss_ctrl.c            |  8 +--
 drivers/soc/rockchip/io-domain.c         |  3 --
 drivers/soc/samsung/s3c-pm-check.c       |  2 +-
 drivers/soc/tegra/fuse/speedo-tegra124.c |  7 ++-
 drivers/soc/tegra/fuse/speedo-tegra210.c |  8 +--
 drivers/soc/ti/k3-ringacc.c              |  1 +
 drivers/soc/ti/knav_dma.c                |  2 +-
 drivers/soc/ti/knav_qmss_queue.c         | 62 ++++++++++++------------
 drivers/soc/ti/pm33xx.c                  |  4 +-
 drivers/soc/ti/wkup_m3_ipc.c             |  8 ++-
 23 files changed, 86 insertions(+), 77 deletions(-)

Cc: act <dmalek@jlc.net>
Cc: Andy Gross <agross@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Cyril Chemparathy <cyril@ti.com>
Cc: Dan Malek <dan@embeddedalley.com>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Roy Pledge <Roy.Pledge@nxp.com>
Cc: Sandeep Nair <sandeep_n@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Scott Wood <scottwood@freescale.com>
Cc: "Software, Inc" <source@mvista.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vitaly Bordug <vbordug@ru.mvista.com>
Cc: YueHaibing <yuehaibing@huawei.com>

-- 
2.25.1

