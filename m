Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6646DA70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238278AbhLHR6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhLHR6G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:06 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA65C0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:33 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id n12so7183709lfe.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMPx53MpG/QJWLIiHMQJ+ymiXYsC5a5Eqmeg0LsvpXA=;
        b=m5+wQnypJMqXL5EATTQSxAi7xEX1jfrtqA7KmS8eqVkx+9yGJiNNKHb/nzXhl4az9x
         P+hptZEH7CVhKhSv+tXvCMTufULONooYcckERnLgF9yH1Jao4NYGvhcdH6DvE9YQKL8Y
         ctfy2K1CrD+Qnmc/+MwYadsYWxp1WRUZYyPsL9UfrR1uA1LWFUN1DjHYED9n1O214imA
         WDSVkDNvLO50iiSqrvZC+hGyIATtnnVNJ84BRnMTqKRh63XDrYTcZIPPui2mET9c7FtF
         94ZRrlYQGUqtY13WwZluiBeEgztaqSBUT9PyWOd8QrN4OI0leoJ9tr/O3930itD9rjX0
         Snkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMPx53MpG/QJWLIiHMQJ+ymiXYsC5a5Eqmeg0LsvpXA=;
        b=YTbTIfaSB3x4j+Aa0eOnYLQqy+wmQDX3kLOQmbbW8l9lozGvqfPHFgHfohqKVkmpBu
         xGDWRNl+uFMiQFmpBVuwp+PQXD1Fvx4bJq1MZ7dpocVRR/a2apGkFp5kjznpy63md1LH
         0iMF+v1uiE7zCxfH94pkoervY6nxHo/sC05FNNuFs5EZAsyzCpMFyotoV/LwMJu1rIU0
         Kjo/afF7P6t9zOUDCeH9gF8KMYMjr+iQFOijHxszwFA6dIuznIBlUX3pZYneyLpGrpAr
         r0J4iF+R4/LN5xR96+mktkLMmcWBgc9KQjydK3kyqRv5FeMGmTFa7B2sM9jYycQ36fMj
         EBxg==
X-Gm-Message-State: AOAM531iQkENf1JRlSXDm54ZFUpyiTKFtKlontvFSYnh0pZBDaurZMwZ
        cpmCwiW7eurWbnjGJKjXMKPzRg==
X-Google-Smtp-Source: ABdhPJysd8gsVWoEpdVQfTDHTZ/t/+1vpfgNi0qwo804bO74N4nYmwnzn+MVeyblJMuKrz6hWFgzuw==
X-Received: by 2002:a05:6512:1382:: with SMTP id p2mr872412lfa.403.1638986072198;
        Wed, 08 Dec 2021 09:54:32 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 00/11] clk: qcom: another round of clock drivers cleanup
Date:   Wed,  8 Dec 2021 20:54:19 +0300
Message-Id: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Another bunch of updates for Qualcomm clock controller driver, removing
unused enum values, test clock, using parent_data, parent_hws and
ARRAY_SIZE.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-clocks-bulk-2

for you to fetch changes up to 7589a5b1bf85ad364815b238586d90e1d446f8d8:

  clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents (2021-12-08 20:52:09 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (11):
      clk: qcom: gpucc-sdm660: get rid of the test clock
      clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
      clk: qcom: camcc-sc7180: get rid of the test clock
      clk: qcom: camcc-sdm845: get rid of the test clock
      clk: qcom: camcc-sdm845: convert to parent data
      clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
      clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
      clk: qcom: gcc-msm8996: drop unsupported clock sources
      clk: qcom: gcc-msm8996: move clock parent tables down
      clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents

 drivers/clk/qcom/camcc-sc7180.c   | 221 ++++-----
 drivers/clk/qcom/camcc-sdm845.c   | 323 +++++++------
 drivers/clk/qcom/gcc-msm8996.c    | 971 +++++++++++++++++++++++---------------
 drivers/clk/qcom/gpucc-sdm660.c   |  13 +-
 drivers/clk/qcom/videocc-sc7180.c |   8 +-
 5 files changed, 870 insertions(+), 666 deletions(-)


