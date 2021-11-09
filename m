Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A9244A48C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 03:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbhKIC2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 21:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhKIC2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 21:28:53 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4328C061570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 18:26:08 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id r80so6697952pgr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 18:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q2XXtoLJL00suV9nfAUEcGT4qZnNfnnIEyDWr+YV8w4=;
        b=xfChmhnwRfWXYIb8SdijH7DpY1iPLgrmKu4oTqF8k/lmajZxwzxHZ34rHA/+ASiWE1
         LhNzzQIcAMViGlhKi8O+tw9zVPSolI4VyuXB9ZoJQ7yO3s8ayOlIZEpoLCUqApa9930S
         lnYcxkZcNZWV8ah/Qx9sxYo65ytsIaKqK6Jegk26pNkGsQslPdTvmuUbverWtKTYvnmy
         S5NqrxsnOOqGIs2Hrl3ikBt2kQsxDQesNn0Swa0y69LBW+0r9/tvQRa4ZkrxgqEpHx/G
         odxRMKLl04bQQwOiHI8xAi9845Ul+GLQdpK2d9Erkqg+Mkk6V98BMo8Rik8iEMzy6vSK
         3Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q2XXtoLJL00suV9nfAUEcGT4qZnNfnnIEyDWr+YV8w4=;
        b=KYUhlkw08qTIDpOnRy7vK3I644Co46YM+73Qqp1UBtuRQon21hGkCrRlfoz/aodXbl
         ciw3I+C81necYPIJEqitpW7E+kf3fjRaPA+6vQDo+B266NyYZGcnej7SiexFIeP7c8yT
         vsO0SgA53yOWZ1jLOsqBHDfIDNWQSblRFox0l81Vfq/MzSww6YOg57lmW4w55PG/50A0
         ydHr1qG0Z91Wl1Vw+icoSAyRXKOQI574UbSAvVuGN+MkaKyeyFI/sN1gXU/cyEHlX3oo
         KNvbX9lPI+vKADCmhhGCciIwPiiCmmfA3c6GE+NETGXofw6Nh8s9vQYaM6kY7SsSJeXD
         bMow==
X-Gm-Message-State: AOAM533vg4UdjJ6ZDVIbL0c5pG0EIruMl9493n9WYrf5v09T+CrF+CAI
        Bnz5eqFKyG35nvcbV0D5VoqKLQ==
X-Google-Smtp-Source: ABdhPJxNrOgRZxk1kFYUbbDWZbNMjuMIgU76QUqpRw+t2ghhx3bkHXXLY7hb/02cr3EXaXM2ASmIVA==
X-Received: by 2002:aa7:8019:0:b0:44d:d761:6f79 with SMTP id j25-20020aa78019000000b0044dd7616f79mr4395020pfi.3.1636424768218;
        Mon, 08 Nov 2021 18:26:08 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id om8sm589619pjb.12.2021.11.08.18.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 18:26:07 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Date:   Tue,  9 Nov 2021 10:25:55 +0800
Message-Id: <20211109022558.14529-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the enable state of smd-rpm clocks are not properly reported
back to framework due to missing .is_enabled and .is_prepared hooks.
This causes a couple of issues.

- All those unused clocks are not voted for off, because framework has
  no knowledge that they are unused.  It becomes a problem for vlow
  power mode support, as we do not have every single RPM clock claimed
  and voted for off by client devices, and rely on clock framework to
  disable those unused RPM clocks.

- The clk_summary in debugfs doesn't show a correct enable state for
  RPM clocks.


Shawn Guo (3):
  clk: qcom: smd-rpm: Mark clock enabled in clk_smd_rpm_handoff()
  clk: qcom: smd-rpm: Add .is_enabled hook
  clk: qcom: smd-rpm: Add .is_prepared hook

 drivers/clk/qcom/clk-smd-rpm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.17.1

