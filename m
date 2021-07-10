Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE503C34C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 16:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhGJOEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 10:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhGJOEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 10:04:22 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C27C0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 07:01:35 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 11so9368824ljv.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AyNbyI7pzC6UK7axF6cRmMmWcnYS9nhsCm52zT1gz64=;
        b=P4oBlLXkXqLAa858geb+PpQ/9ZqmAzrF+deTIyCsjW7Vuc3xYM0nZ2qUPpApEIsDsl
         OFxvcNANv5TI9mRzCIRV9kBf63pwb5z1srdjZ+AAo+SibCtU/wPRLrZ0d9atPLfSG4Jt
         vgn2vBVH7UceAlowQokTeSlKDeJJh5rLvgg16o65W0navu25Jvhw/zbyAPNYxCCBQuhJ
         n0PkbeuBr0MPg3YVY9/NKGUZo/HY6DzLYUqrOAUPqLL3vwIg5csRS9zWHZKDOAqGmnBf
         qxJcz74GcO5W8WnJlt50+v4dUGQ6xtxLU+dMgGYPJqclJwRKM01Qm86EebdayzZf9VFe
         2PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AyNbyI7pzC6UK7axF6cRmMmWcnYS9nhsCm52zT1gz64=;
        b=VAWfH5iTAfIFXYQRzAtZ05Be5CzxFa3KbnQ0Af2yBBSVXzuQ55XlYqtWH/ZXg/3zRk
         NOP+W5Mx5LnX/5Vc/sCgUBEX8MWAyV+uWqlmSns6z0mhn4A21MOaSwKB3JeNVsNmN0hi
         toIy6cgWT/GwzABOZC4li4iZ84t6q3QwAiZdcb1miSC1NdBXXFxDpf83YURVV1gxMHWm
         diFWxgF/rzS0eLr3omTymU6/0r425oTxJ9WOZqlnJQuA3anPreYMItRuflMoRhwHJfg5
         aIhD8wSPAWlnnfVyqRzeIK9k3OSm3eKMb73BH7hPaYunQ5wWF5ijU3QBvnbzA6SGubxo
         5x1Q==
X-Gm-Message-State: AOAM530+MSANUdYgM5fVt1wsZjdm27c5vfpxdMw1+5mubWSSMYa+FfNz
        5a0OwWorr80AxkI2h36Us5TWSw==
X-Google-Smtp-Source: ABdhPJzTzZmQTIReZvAjyWoI2EGDK7EGsjL2VbQoQqw8689TBqZtfWxJSkpRygTPwLkRDnjhLorE5Q==
X-Received: by 2002:a2e:86c8:: with SMTP id n8mr3115089ljj.251.1625925694264;
        Sat, 10 Jul 2021 07:01:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o17sm716111lfr.253.2021.07.10.07.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 07:01:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/2] clk: qcom: move pm_clk handling to common code
Date:   Sat, 10 Jul 2021 17:01:28 +0300
Message-Id: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several Qualcomm clock controller drivers use pm_clk functionality.
Instead of having common code in all the drivers, move the pm_clk
handling to the qcom_cc_map/qcom_cc_probe.

Note, this was compile tested only.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      clk: qcom: use common code for qcom_cc_probe_by_index
      clk: qcom: move pm_clk functionality into common code

 drivers/clk/qcom/camcc-sc7180.c       |  44 ++---------
 drivers/clk/qcom/common.c             | 134 ++++++++++++++++++++++++++++------
 drivers/clk/qcom/common.h             |   6 ++
 drivers/clk/qcom/lpasscorecc-sc7180.c |  56 +++-----------
 drivers/clk/qcom/mss-sc7180.c         |  40 ++--------
 drivers/clk/qcom/q6sstop-qcs404.c     |  36 ++-------
 drivers/clk/qcom/turingcc-qcs404.c    |  34 ++-------
 7 files changed, 152 insertions(+), 198 deletions(-)


