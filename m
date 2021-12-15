Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9265C4761D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhLOThO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:13 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78221C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:13 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m6so33364231lfu.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyN1QFTYxus6CtZdT4TXfm5qe7VIn3bbcNMCUmCv5EE=;
        b=EyGsgub4+PtL6Cm4CtZS92x7De4WBYE/a0ZsYPVc1iQXbLzIAQXnyPD93tHpIqQkc7
         BnqGifyLJzBSWICqy/eNhzEmn636XektGDioJzB6M30DDDzuZEwk0AQWtpZrA3oW92+W
         RSPaCco//74KCdqYDyUVml6ehghNUAd6K8oX6uoCmKHoCTSGQhtS014dHkpSNEC7f8/5
         vxOk0LfkCQ/bxLU4V46BPmBNDhdNlSu+Msa3qX5LBAmHGZcfy2R0cbgL7TA1xyGDz8PL
         R3zLG18QsRA3dbdRyE+f9IncypxyFtSsizBY2QOzG7Xs6ntrInxiOXObkqZ4kSrAtW7C
         90PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyN1QFTYxus6CtZdT4TXfm5qe7VIn3bbcNMCUmCv5EE=;
        b=h9aSQ9Jq2woTV5o+A1ICvm85Tnr6NMx5lNW6IP+E1E1bBhY6/uoHFjtpbWhaBFOz7S
         EkhpmLCqmNr6KfmNW4CgMsJ5ZJnzNuhAt0wEmFBFZiUv2RftXxfXKqBDWu46kjw2mL5l
         zfl6mOM3ToLr7q0jCTjFd4aZ2oEvCWCKXmVNlhyYcnrAuS0Cd0pDZCf+ZYI0XtqEAqRv
         VWMGqhJCUUQO42PdH4V6dUuhHfNalML1TfCOy77xvO6RrPR5K+PgZLBzOvfWP4XtfxIU
         oXD9VO5JjRhwfqUDrzmdxwsoihFTBoaTUwbIrRFaFlFeYpqS/nfAEpNdqx3zgGy9Jv3h
         /NCA==
X-Gm-Message-State: AOAM533UOMRUo35jlm03hOAzSUQMHcJK0wBkQRqePfBMFaIH0CbsmzGR
        bOzQw9G3TZgIChklLFTfeWXe+g==
X-Google-Smtp-Source: ABdhPJz9hQz1nen9UoLp9bx9AI0Iqgw/Ddpc7uGqzAamVXfERqRfGRUWjAjTVAxkCzHq9SfeEDAcNQ==
X-Received: by 2002:a05:6512:3b11:: with SMTP id f17mr11441325lfv.374.1639597031627;
        Wed, 15 Dec 2021 11:37:11 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 00/16] clk: qcom: another round of clock drivers cleanup
Date:   Wed, 15 Dec 2021 22:36:48 +0300
Message-Id: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Another bunch of updates for Qualcomm clock controller driver, removing
unused enum values, test clock, using parent_data, parent_hws and
ARRAY_SIZE.

Changes since v2:
 - fix typo in first patch
 - reorder and rework camcc-sdm845 patches, so that ARRAY_SIZE comes
   first
 - add patch converting gcc-msm8996 to use cxo/xo_board instead of still
   depending on legacy xo clock

Changes since v1:
 - convert two parent_names in gpucc-sdm660
 - split camcc-sc7180 patch into logical chunks
 - split camcc-sdm845 patch into logical chinks
 - reorder gcc-msm8996 patches to put ARRAY_SIZE in front of the rest of
   patches

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-clocks-bulk-2

for you to fetch changes up to 4d27f5d0dcf5ee52a7282f942d4b824b3fead091:

  clk: qcom: gcc-msm8996: start getting rid of xo clk (2021-12-15 22:28:16 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (16):
      clk: qcom: gpucc-sdm660: fix two clocks with parent_names
      clk: qcom: gpucc-sdm660: get rid of the test clock
      clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
      clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sc7180: get rid of the test clock
      clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
      clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sdm845: get rid of the test clock
      clk: qcom: camcc-sdm845: move clock parent tables down
      clk: qcom: camcc-sdm845: convert to parent_hws/_data
      clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
      clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8996: drop unsupported clock sources
      clk: qcom: gcc-msm8996: move clock parent tables down
      clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-msm8996: start getting rid of xo clk

 drivers/clk/qcom/camcc-sc7180.c   | 221 ++++-----
 drivers/clk/qcom/camcc-sdm845.c   | 323 +++++++------
 drivers/clk/qcom/gcc-msm8996.c    | 971 +++++++++++++++++++++++---------------
 drivers/clk/qcom/gpucc-sdm660.c   |  21 +-
 drivers/clk/qcom/videocc-sc7180.c |   8 +-
 5 files changed, 874 insertions(+), 670 deletions(-)


