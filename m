Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DC83E9D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 06:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbhHLEgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 00:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbhHLEgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 00:36:11 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD15C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 21:35:46 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id f3so5628962plg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 21:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxr+kN6SetTz50b/VYivr0ZuxkSNxFN7jKWgrcYWkys=;
        b=S1St+GitlDcWedfmRSFXGJimehgFJFlFJwttWDdN3zwMXbC6pb4l3lsPKEyWRkGHT4
         hj9LanR1X1hmDGTxbFNTh/HHOKWVEnuDZfgYbxGVXo3MUos0btzQLY1ssDN9j0N7AHhL
         Pu44FndYuRVG9rtcQMyDyV4EmtQs4oqkIkFl+XfKvg6+Vao0c8+3kx8PqON9bX+JdMBl
         aIq7jZYDN4rflT6LH0T9TIARx4Mxgc/yDJfjP//GgTvrgmSqM04S+JVjOmKlX7saeAp5
         5ADWwmehJpMTRJ9Re+vvybV419/uXAoHdupfeo6URKjlLwTxfWFuma6Rv1rECl3+e0gB
         0TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxr+kN6SetTz50b/VYivr0ZuxkSNxFN7jKWgrcYWkys=;
        b=dW8tNkAcoJyasgvTAdeQWlqMB/VdwkhSyJxT9aaKVuZsrDtVUyrmktQTwbS2NtZSGS
         useMZtpwEn9eL2W1yCrmUi3zWvq9D0Tzh8NyC+wuLovjZ3ixfx8I+6WqN32ffITVs7qU
         fnmC75e3ez08Jkhi05zW8kYTR0v15tR4B9Bqg+HrAV4E/XIfjKQxK6cad5xltyDccP3a
         GtTHj2vIas8sFU73v8xv38ycif6t9qwcdgM8Sb/sCNuL0y5Vf1NU+FMRqoQHUxTBXM0D
         GykJb4/yejSnZP8jJAhGk0NtHnQOA75qHGjG8Qwb0fVchx69AVJjD3uiPsYlo1zK1mRt
         ALBA==
X-Gm-Message-State: AOAM532non2FNXHtxXP/2hLyivN+O01rRYtCDrMeWSuz6l4FSV0clVU0
        PXFQ+9Z8Jnn4LaOTo5WskvRqDw==
X-Google-Smtp-Source: ABdhPJydv+lAOJdvjzc80FCXMzAsQnjZgaDpNJlleVqm7BNMfhuu1ZD0GXkUb8D3PJVRnvy/JGxrcQ==
X-Received: by 2002:a63:4423:: with SMTP id r35mr2089732pga.358.1628742945985;
        Wed, 11 Aug 2021 21:35:45 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id z13sm8264118pjd.44.2021.08.11.21.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 21:35:45 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Quentin Perret <qperret@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH V3 0/9] Add callback to register with energy model
Date:   Thu, 12 Aug 2021 10:05:13 +0530
Message-Id: <cover.1628742634.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many cpufreq drivers register with the energy model for each policy and
do exactly the same thing. Follow the footsteps of thermal-cooling, to
get it done from the cpufreq core itself.

Provide a new callback, which will be called, if present, by the cpufreq
core at the right moment (more on that in the code's comment). Also
provide a generic implementation that uses dev_pm_opp_of_register_em().

This also allows us to register with the EM at a later point of time,
compared to ->init(), from where the EM core can access cpufreq policy
directly using cpufreq_cpu_get() type of helpers and perform other work,
like marking few frequencies inefficient, this will be done separately.

This is build/boot tested by the bot for a couple of boards.

https://gitlab.com/vireshk/pmko/-/pipelines/351965580

FWIW, I have queued up the series for linux-next to get more testing, but your
reviews are welcome. Thanks.

V2->V3:
- Drop the auto-register part from all logs, this isn't called auto registration
  anymore.
- Call register_em() only for new policies.
- Update scmi driver to register with EM only when required.
- Add Rby tags.

V1->V2:
- Add a callback instead of flag.
- Register before governor is initialized.
- Update scmi driver as well.
- Don't unregister from the EM core.

--
Viresh

Viresh Kumar (9):
  cpufreq: Add callback to register with energy model
  cpufreq: dt: Use .register_em() to register with energy model
  cpufreq: imx6q: Use .register_em() to register with energy model
  cpufreq: mediatek: Use .register_em() to register with energy model
  cpufreq: omap: Use .register_em() to register with energy model
  cpufreq: qcom-cpufreq-hw: Use .register_em() to register with energy
    model
  cpufreq: scpi: Use .register_em() to register with energy model
  cpufreq: vexpress: Use .register_em() to register with energy model
  cpufreq: scmi: Use .register_em() to register with energy model

 drivers/cpufreq/cpufreq-dt.c           |  3 +-
 drivers/cpufreq/cpufreq.c              | 13 ++++++
 drivers/cpufreq/imx6q-cpufreq.c        |  2 +-
 drivers/cpufreq/mediatek-cpufreq.c     |  3 +-
 drivers/cpufreq/omap-cpufreq.c         |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |  3 +-
 drivers/cpufreq/scmi-cpufreq.c         | 65 +++++++++++++++++---------
 drivers/cpufreq/scpi-cpufreq.c         |  3 +-
 drivers/cpufreq/vexpress-spc-cpufreq.c |  3 +-
 include/linux/cpufreq.h                | 14 ++++++
 10 files changed, 76 insertions(+), 35 deletions(-)

-- 
2.31.1.272.g89b43f80a514

