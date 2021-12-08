Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7660846CF26
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 09:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244901AbhLHIiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 03:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244956AbhLHIiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 03:38:13 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4B5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 00:34:28 -0800 (PST)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 93FA73F3F6;
        Wed,  8 Dec 2021 09:34:24 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alex Elder <elder@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] firmware: qcom: scm: Add IOMMU pool size and
Date:   Wed,  8 Dec 2021 09:34:20 +0100
Message-Id: <20211208083423.22037-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches clean up a leftover duplicate assignment following the
initializer that already set the same values; followed by introducing
two extra SCM calls that allow setting the maximum IOMMU pool size and
changing the pagetable addressing mode to AArch32 LPAE or AArch64
(per-context).

AngeloGioacchino Del Regno (2):
  firmware: qcom: scm: Add function to set the maximum IOMMU pool size
  firmware: qcom: scm: Add function to set IOMMU pagetable addressing

Marijn Suijten (1):
  firmware: qcom: scm: Remove reassignment to desc following initializer

 drivers/firmware/qcom_scm.c | 37 +++++++++++++++++++++++++++++++------
 drivers/firmware/qcom_scm.h |  2 ++
 include/linux/qcom_scm.h    |  2 ++
 3 files changed, 35 insertions(+), 6 deletions(-)


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
--
2.34.1

