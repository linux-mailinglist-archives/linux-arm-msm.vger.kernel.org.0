Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB9C536876
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 23:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbiE0V3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 17:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiE0V3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 17:29:40 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DA22BB2A
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 14:29:38 -0700 (PDT)
Received: from localhost.localdomain (abxh119.neoplus.adsl.tpnet.pl [83.9.1.119])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id A584420542;
        Fri, 27 May 2022 23:29:35 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH 0/6] Fix and extend Qualcomm IOMMU support
Date:   Fri, 27 May 2022 23:28:55 +0200
Message-Id: <20220527212901.29268-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to Qualcomm's software solutions, genius or otherwise, the IOMMUs on
pre-msm8998-and-sdm630 SoCs are flawed beyond reason, and conviniently
it is all due to an (almost in all cases) irreplaceable hypervisor and TZ
stack. As end users and developers, we have no choice but to adapt to that
and follow whatever the IOMMUs expect.

This series fixes and improves the existing support (adjusts the code flow
to make sure things are written in correct order and adds a way to
properly (i.e. in compliance with the firmware's expectations) reset the
IOMMUs) and extends it with features for the SoCs that came near the end
of an era of what we call "qcom_iommu" upstream, namely 8952 family
(8917, 8937, 8952, 8956/76, 8953 and possibly more) (Aarch64 pagetables
and secured QCIOMMUv2/QCIOMMU_500 ctxs)
and at the same time builds another milestone in getting msm8974/94 IOMMU
support that has been in the works for something like 7 years, and never
got upstreamed in the end (we'll get it one day, eventually...).

The dt-bindings are NOT converted to YAML as a part of this series, that
will come in a later patchset.


AngeloGioacchino Del Regno (6):
  iommu/qcom: Use the asid read from device-tree if specified
  iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
  iommu/qcom: Properly reset the IOMMU context
  iommu/qcom: Add support for AArch64 IOMMU pagetables
  iommu/qcom: Index contexts by asid number to allow asid 0
  iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 137 ++++++++++++++----
 2 files changed, 114 insertions(+), 28 deletions(-)

-- 
2.36.1

