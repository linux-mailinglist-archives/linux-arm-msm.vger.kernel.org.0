Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2433DC801
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 21:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhGaTup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 15:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhGaTup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 15:50:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6013CC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jul 2021 12:50:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z2so25475795lft.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jul 2021 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khLLzZRJdRr4Ab5JfhBto0Hu6+RMcOzJeZhEm4aW+G0=;
        b=K39cH77coIx/ZonRf/tMpTR9gnQHXDPbnfbKyU/4vS1X3agEz7SNR6PAVKv9ls+yY0
         OoZ41jc82rZFcex0Ip6J42Y744MHnII69DtWFSgdg5P5Njg/wd6pr7tS7ybr78P/DnzV
         W6NEbIrIOX4BE2ZvpWhSQ/GJxsd7phpp+sgGVm9ToSEFGFwDv3SnHShI2vZUxYO/cmmu
         XiNaNTTt9FMo4Y2CjVPLKZTuuPmhc1h2r9VgTRORlvDDwt8LQtqO2Xu+UIe+oJFcmi40
         x16WoQN+TMwao/hoghADd5jDgbFEB/TDexZX719U98a6ZtCaXEyWzF2qjEJxjl99ppMD
         O1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khLLzZRJdRr4Ab5JfhBto0Hu6+RMcOzJeZhEm4aW+G0=;
        b=PZCGWGcTXRj+aBk9UNIWX28K47pDqFu6MLHvDlssOKrxT0WfSxi8nd6F94esewgHqD
         2gXkWyXSPtsDFpicFuZBKrau+g0pu+aXK8S9aaHtR5l7gPqrBuI9YUjrKPpQcrbwl1Lb
         aIlK3mfKe55bRhlVmCSlUYfU1QaexAjkCIIvgigt/2Y116ttV5uacNQSgwSDPBnMx3cx
         8Qod726OLaSa44wxdFfRShdoZ1gETgZOZmoGu77iE/W2wgVAEJ+T0oE9q/1gLGuCr7jp
         4w5xv2qUWvMDSCtEjG/1RrzfQFLUNSJn3FjYPFZXKvSoAiS8z0KERyyNjklXVqtYhLsA
         6a8w==
X-Gm-Message-State: AOAM532TfgJ8YHLhxSsHTmLc94n4oSB0ELyP7xA5WLmn1+f5tq37HF0w
        w7VWtQD6Zwg/dfgCRlsvxpXTFQ==
X-Google-Smtp-Source: ABdhPJwd3GePKFUHowoYR9pmOoggIqqKjpqudqiEsxvWlhGWb1QuvWsz5xNAS5wC1Yh+IcFaj4QBjQ==
X-Received: by 2002:a19:c504:: with SMTP id w4mr6683409lfe.192.1627761036719;
        Sat, 31 Jul 2021 12:50:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f3sm469827lfm.76.2021.07.31.12.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 12:50:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] PM: add two devres helpers and use them in qcom cc
Date:   Sat, 31 Jul 2021 22:50:31 +0300
Message-Id: <20210731195034.979084-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most of the drivers using using pm_runtime_enable() or pm_clk_create()
follow the same pattern: call the function in the probe() path and call
correspondingly pm_runtime_disable() or pm_clk_destroy() from the
probe()'s error path and from the remove() function. This common code
pattern has several drawbacks. I.e. driver authors have to ensure that
the disable/destroy call in the error path really corresponds to the
proper error clause. Or that the disable/destroy call is not missed in
the remove() callback.

Add two devres helpers replacing these code patterns with relevant devm
function call, removing the need to call corresponding disable/destroy
functions. As an example modify Qualcomm clock controller code to use
new helpers. In this case we are able to drop error path and remove
functions completely, simplifying the drivers in question.

Changes since v2:
 - Expand commit messages
 - Drop extra clock controller changes not strictly relevant to these
   two helpers

Changes since v1:
 - Add a patch making Qualcomm clock controller drivers actually execute
   these helpers, thus demonstrating their usage and the necessity

----------------------------------------------------------------
Dmitry Baryshkov (3):
      PM: runtime: add devm_pm_runtime_enable helper
      PM: runtime: add devm_pm_clk_create helper
      clk: qcom: use devm_pm_runtime_enable and devm_pm_clk_create

 drivers/base/power/clock_ops.c        | 17 +++++++++++++++++
 drivers/base/power/runtime.c          | 17 +++++++++++++++++
 drivers/clk/qcom/camcc-sc7180.c       | 25 ++++++++++---------------
 drivers/clk/qcom/lpass-gfm-sm8250.c   | 21 +++++++++------------
 drivers/clk/qcom/lpasscorecc-sc7180.c | 18 ++----------------
 drivers/clk/qcom/mss-sc7180.c         | 30 ++++++++----------------------
 drivers/clk/qcom/q6sstop-qcs404.c     | 32 +++++++++-----------------------
 drivers/clk/qcom/turingcc-qcs404.c    | 30 ++++++++----------------------
 include/linux/pm_clock.h              |  5 +++++
 include/linux/pm_runtime.h            |  4 ++++
 10 files changed, 89 insertions(+), 110 deletions(-)


