Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B8C3B0E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFVUYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFVUYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:24:19 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F37C061574;
        Tue, 22 Jun 2021 13:22:01 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id hz1so395114ejc.1;
        Tue, 22 Jun 2021 13:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M15yn6s2Mcz269EcBxKciBEhAVPDMUBBoYrbvRk9oQw=;
        b=ui7wZzk918DiJ71cWHChLQUQVeB59qo5fD4iA5DrGXkvTjgucK9BkXLclKsY9N0Gkb
         7EWrXENDZHpzWc97w6LY6sNCG+SpmX70nQwcA79krZBsph099hy+bswYFGITjMLs8owI
         NcRzGU+nJoLDN4+upq9Y2gA1QgetTdLYMBa4ideNryRD7wYVfoc8EzWGqg832FnOU9lz
         7IqU0EDBQP2baslI40qR8xsEzaOWQZBHE1hPjMrw7VzajfPA3c0M66vd/FqF8r7qIMMO
         IGI1XEfmoNB/etI4P+SVVw05/lA9dDQgE2TRg8F+f80Ht4S7tBHu96MjNd09tgF+GSNU
         OnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M15yn6s2Mcz269EcBxKciBEhAVPDMUBBoYrbvRk9oQw=;
        b=G2RsMyt9f45TKfA2emeVip/8GXfs4mK4buUY402OopaDoz9uAm1n+G86GNW+PwS7u+
         Sb0VfDZfq3jiv5zGgXLplGkN2mtKizCWwNfl0StdRb1FBIn2096b9HqhxmlANOpyTpiF
         NSyRzsB9pMVWSHSAduHxA4K5lgiKj22PJsGfOkgE2FtVmi6yiAYcOuw2sXeWtCn0Gu6F
         OBqpKbpDXYZoyKGE/v2ptTr65oYEzCM86uMZXRllsMI31AIBkxbgJz9e+WRwKLnUayAZ
         eYRkuFQOr6dCCJxZLVabY2lDSqNN+OtmHPUrhR5azBCq8NJU7KAHaOC5rGGmTbkuek6J
         fE+w==
X-Gm-Message-State: AOAM531/Sdk0rSiYR2DyLmatVqy0H/UF3NZpMUUnXCuMcgPp1GldvKyM
        rlQ5TMQ3r4dkSxXbODOeKgM=
X-Google-Smtp-Source: ABdhPJz9iNKrPzMtewjjPia6Lfys1fuWzcCxald8vUSvDUXtw1/xktxhsBjEjcogyuPPtn6iNwiAQA==
X-Received: by 2002:a17:907:2bc7:: with SMTP id gv7mr5962165ejc.417.1624393320499;
        Tue, 22 Jun 2021 13:22:00 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id p13sm6467883ejr.87.2021.06.22.13.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:22:00 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 0/5] Add rpmcc and rpmpd for SM4250/6115
Date:   Tue, 22 Jun 2021 23:21:51 +0300
Message-Id: <20210622202156.546718-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the RPM clocks and power domains on QCom SM4250 and
SM6115, codename bengal. The rpmcc code is converted from downstream code
(OnePlus repo [1]), and the rpmpd is converted from downstream DT extracted
from OnePlus Nord N100.

The downstream code has additional voter clocks, which let consumers vote and
the driver to select the highest desired clock rate for a given (real) parent
clock [2]. I might port that as well in the near future, let me know if there
is a more elegant solution.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250
[2]: https://source.codeaurora.org/quic/server/kernel/commit/?h=v4.9.137&id=6a4951a8308c5729ae8e502787cb705477c94251

Iskren Chernev (5):
  dt-bindings: soc: qcom: smd-rpm: Add SM4250,6115 compatible
  dt-bindings: clock: qcom: rpmcc: Document SM6115,SM4250 compatible
  clk: qcom: smd: Add support for SM6115 rpm clocks
  dt-bindings: power: rpmpd: Add SM4250,SM6115 to rpmpd binding
  drivers: soc: qcom: rpmpd: Add SM6115 RPM Power Domains

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  2 +
 .../bindings/soc/qcom/qcom,smd-rpm.yaml       |  2 +
 drivers/clk/qcom/clk-smd-rpm.c                | 64 +++++++++++++++++++
 drivers/soc/qcom/rpmpd.c                      | 29 +++++++++
 drivers/soc/qcom/smd-rpm.c                    |  2 +
 include/dt-bindings/clock/qcom,rpmcc.h        | 10 +++
 include/dt-bindings/power/qcom-rpmpd.h        | 20 ++++++
 include/linux/soc/qcom/smd-rpm.h              |  1 +
 9 files changed, 132 insertions(+)


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
-- 
2.31.1

