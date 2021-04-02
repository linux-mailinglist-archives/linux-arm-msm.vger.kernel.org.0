Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8FE35255E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbhDBCVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbhDBCVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67279C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u4so4268647ljo.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L925LIwX/AEyuqnRbSRg5dcDMuoq/xRmNPVHzWMF0Yc=;
        b=NsriI1TT2YsTF0Z9rxrUGCPsIHq+cuxPYpd0NSHqqPJI2IcBXhAX4g/uFEBop/W5xK
         mN/HKiTH4QJr564Jrv0Xy4zyoxjE0QwGWAaJ6myML3aikVjDqY4lM5YtfhpB+dYeRG8C
         gv31lY8ZFhcCvRCHfURkHSXTMtcR2j1ZAHjQa2czJAOvRMyfIs6GdE19wmISsCvUJEwh
         l5fWFXOvOGb0OlY0+i2JIs/Q3SvtQlRg0OA7aDmH3F9aF2WSzCKmYXvSCfostoZfpWwf
         N1wp/k9Ow25A1ATX+14XYJ5JnrmpH8ugVqW7giIH0WP6lrtwux+Z8Fj33lkEuog7Hb+B
         C+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L925LIwX/AEyuqnRbSRg5dcDMuoq/xRmNPVHzWMF0Yc=;
        b=Mz2CTgpBANSLoiJop15NVWaN3PNnoPuGHy6b1ITpUzqgQoZcvCb95ZeDNen8LCWuPm
         6gH+TvLu/m9ZhjLuqzX1G4L7vI8PeTW8LK85qal/p95twwfj1b2f8Ey/D3nuYAxnOAYB
         H/SJ+aJGIdi7R7D3TAB0Ej41Xi0eWvpRBMYNcZMSKircq0o7RrVEV7YukDtxjaN41mCJ
         QWAgyt5urAk7kMmsINMccPUhPVuRJVUAkx3JFnDcrFaTtQAtaAKjICLSaRg57H3yOdRm
         m5EwiH8YvuVYLrJ/j2sln3JD2JQ+a9mSwTluElWjMN6QM++WWXRUbtmOPp9ghzx1FfvJ
         LsPw==
X-Gm-Message-State: AOAM532SUDixgi7kcQrvedWm7ELCfYWSGX7qie0iUTZ4JO1BBbGmZd3l
        Q9pLamZOUGOilvikB3wNKkSSoQ==
X-Google-Smtp-Source: ABdhPJyjS7IA5ZX7+ZwTZMBZG1bjjbO1CAJI7xfVUgMCc7jbUZ9nASs17OoBShUA5ruz5hOdFFTM4A==
X-Received: by 2002:a2e:9143:: with SMTP id q3mr7158320ljg.378.1617330070773;
        Thu, 01 Apr 2021 19:21:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 00/16] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Fri,  2 Apr 2021 05:20:52 +0300
Message-Id: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

Changes since v1:
 - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
   and videocc-sm8150 drivers
 - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
   requested by Taniya Das.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git qcom-clk-cleanup

for you to fetch changes up to abb5f4ee34095483b5cc16d6b2f6eb683e69a78e:

  clk: qcom: videocc-sdm845: get rid of the test clock (2021-04-02 05:03:06 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (16):
      clk: qcom: dispcc-sc7180: drop unused enum entries
      clk: qcom: dispcc-sm8250: drop unused enum entries
      clk: qcom: gcc-sm8250: drop unused enum entries
      clk: qcom: gpucc-sc7180: drop unused enum entries
      clk: qcom: gpucc-sdm845: drop unused enum entries
      clk: qcom: gpucc-sm8150: drop unused enum entries
      clk: qcom: gpucc-sm8250: drop unused enum entries
      clk: qcom: videocc-sc7180: drop unused enum entries
      clk: qcom: videocc-sm8150: drop unused enum entries
      clk: qcom: videocc-sm8250: drop unused enum entries
      clk: qcom: dispcc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: convert to parent data
      clk: qcom: videocc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: get rid of the test clock
      clk: qcom: dispcc-sdm845: get rid of the test clock
      clk: qcom: videocc-sdm845: get rid of the test clock

 drivers/clk/qcom/dispcc-sc7180.c  |   2 -
 drivers/clk/qcom/dispcc-sdm845.c  | 217 ++++++++++++++++++--------------------
 drivers/clk/qcom/dispcc-sm8250.c  |   8 --
 drivers/clk/qcom/gcc-sm8250.c     |   1 -
 drivers/clk/qcom/gpucc-sc7180.c   |   3 -
 drivers/clk/qcom/gpucc-sdm845.c   |  45 ++++----
 drivers/clk/qcom/gpucc-sm8150.c   |   1 -
 drivers/clk/qcom/gpucc-sm8250.c   |   1 -
 drivers/clk/qcom/videocc-sc7180.c |   4 -
 drivers/clk/qcom/videocc-sdm845.c |  51 +++++----
 drivers/clk/qcom/videocc-sm8150.c |   4 -
 drivers/clk/qcom/videocc-sm8250.c |   2 -
 12 files changed, 150 insertions(+), 189 deletions(-)


