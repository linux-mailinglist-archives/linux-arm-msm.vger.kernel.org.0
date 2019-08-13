Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 126A28BC18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 16:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbfHMOxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 10:53:48 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42315 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729495AbfHMOxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 10:53:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id s19so14288463lfb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2019 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ebrdQpGbryAbE+PVSjTFqlvSSqkSS1ZgUmlnEvCria0=;
        b=ePZ0JHbra+U1kuq1bS8PxUS1CRnF7QVaKlFGUIrgNjPDCu4+CCfrMg478Kb1CtUJH5
         vwdSrpBbXu81gGSt/pIg2vEHaMMOkhg+qpcLnEPCeBtgzNkT5Sw77IW4fkugaERdtQ6k
         gBW79xeVntMdVPqPn+LET9tGnch6A4FieJNKmotqtgIaWkiqCiktVaIjlgkJbLXo3Am1
         UeuWkhbrgOeNuAdaSume6zhNLlQ5n3/wgIU52bR+GtcKp6Bi40tqRsggtqc1+JbrP/gn
         O0bBpACubGme787uuCgKQbTv0V7zSZcmi1+d2rw/QseVTywbyZcdZFKF9mEVvWQK+zHU
         eGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ebrdQpGbryAbE+PVSjTFqlvSSqkSS1ZgUmlnEvCria0=;
        b=uABvMLdV2VW9v1u7RLBo3OGCK+AdCUqFhjsdXYGdZ4EzIVp0jf2KklWFScniUG/B9i
         ENwlbJCTglGfVaohW6uMduOhLf8cgkIPOtBu/Worp1ajf5Lgsxc3YMm1XqXrpq2snCmX
         8YbLp7/FiEAokGELOjOIV6eg6IFj3O+9LctyQrnyO8TtASqcvPPohJ+a/x8+LvfsAAvY
         V76y/eT/t9B88PJhw4P2iaPYaKQVsAJ4b22JZW/Gn5L8cDecIMDXNJZZRoTANrYslQXN
         jv513St+Wd86qlDcbkAE4d5rVPUrR+/F4Z2ydv8beJN10hmYxB0JOdsC5siecdmHVEqj
         j+pg==
X-Gm-Message-State: APjAAAW81qCgdpOTW3wxng4ccE0xtAUyuAh51dgAoRnDObA7kprPok7x
        E1xnamdPAKmceN1kjENEPSsevw==
X-Google-Smtp-Source: APXvYqxGmBjxCMEseACgPnI5Cfymrnnc2nKAKmnZdzJtjplWsZFE5p5T7yf6fHNJ8shzOl5yl71onA==
X-Received: by 2002:ac2:550c:: with SMTP id j12mr18293687lfk.171.1565708026123;
        Tue, 13 Aug 2019 07:53:46 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id r68sm19628100lff.52.2019.08.13.07.53.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 13 Aug 2019 07:53:45 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org, evgreen@chromium.org
Cc:     daidavid1@codeaurora.org, vincent.guittot@linaro.org,
        bjorn.andersson@linaro.org, amit.kucheria@linaro.org,
        dianders@chromium.org, seansw@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH v4 0/3] interconnect: Add path tagging support
Date:   Tue, 13 Aug 2019 17:53:38 +0300
Message-Id: <20190813145341.28530-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs that have multiple coexisting CPUs and DSPs, may have shared
interconnect buses between them. In such cases, each CPU/DSP may have
different bandwidth needs, depending on whether it is active or sleeping.
This means that we have to keep different bandwidth configurations for
the CPU (active/sleep). In such systems, usually there is a way to
communicate and synchronize this information with some firmware or pass
it to another processor responsible for monitoring and switching the
interconnect configurations based on the state of each CPU/DSP.

The above problem can be solved by introducing the path tagging concept,
that allows consumers to optionally attach a tag to each path they use.
This tag is used to differentiate between the aggregated bandwidth values
for each state. The tag is generic and how it's handled is up to the
platform specific interconnect provider drivers.

v4:
- Picked Reviewed-by tags (Thanks Evan!)
- Addressed comments on patch 3.

v3: https://lore.kernel.org/lkml/20190809121325.8138-1-georgi.djakov@linaro.org/
- New patch to add a pre_aggregate() callback.

v2: https://lore.kernel.org/lkml/20190618091724.28232-1-georgi.djakov@linaro.org/
- Store tag with the request. (Evan)
- Reorganize the code to save bandwidth values into buckets and use the
  tag as a bitfield. (Evan)
- Clear the aggregated values after icc_set().

v1: https://lore.kernel.org/lkml/20190208172152.1807-1-georgi.djakov@linaro.org/


David Dai (1):
  interconnect: qcom: Add tagging and wake/sleep support for sdm845

Georgi Djakov (2):
  interconnect: Add support for path tags
  interconnect: Add pre_aggregate() callback

 drivers/interconnect/core.c           |  27 ++++-
 drivers/interconnect/qcom/sdm845.c    | 141 ++++++++++++++++++++------
 include/linux/interconnect-provider.h |   7 +-
 include/linux/interconnect.h          |   5 +
 4 files changed, 145 insertions(+), 35 deletions(-)

