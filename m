Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6956621D61E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 14:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgGMMmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 08:42:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59385 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729695AbgGMMmC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 08:42:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594644121; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=n+H8qsu8A2eN0qoFysCP3JyT/AZw34OjCJZOpkdVaGM=; b=PqPBJu/P/Maj9wVxtWV0Lg5F+v0caQaBZO9MIasKv/XSHU6ddX3PVMdhbnbpvv9FY2Q/ZQyY
 93SJ47SiJdOKH+7YqBOD5aF5zoa2t49tRrhgW2/EllhqcYaAViGZBaa0vfx2u5pdiirc7MYU
 5eLz47MIHDH+LVKBXn1fkyG88z8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f0c5696ee6926bb4fff0fa1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 12:41:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3E27C433AD; Mon, 13 Jul 2020 12:41:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BEC02C433C8;
        Mon, 13 Jul 2020 12:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BEC02C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca, robdclark@gmail.com
Subject: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Date:   Mon, 13 Jul 2020 18:11:40 +0530
Message-Id: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for GPU DDR bandwidth scaling and is based on the
bindings from Georgi [1]. This is mostly a rebase of Sharat's patches [2] on the
tip of msm-next branch.

Changes from v4:
- Squashed a patch to another one to fix Jonathan's comment
- Add back the pm_runtime_get_if_in_use() check

Changes from v3:
- Rebased on top of Jonathan's patch which adds support for changing gpu freq
through hfi on newer targets
- As suggested by Rob, left the icc_path intact for pre-a6xx GPUs

[1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/
[2] https://patchwork.freedesktop.org/series/75291/

Sharat Masetty (6):
  dt-bindings: drm/msm/gpu: Document gpu opp table
  drm: msm: a6xx: send opp instead of a frequency
  drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
  arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
  arm64: dts: qcom: sc7180: Add interconnects property for GPU
  arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

 .../devicetree/bindings/display/msm/gpu.txt        |  28 ++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 108 ++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   3 +-
 7 files changed, 112 insertions(+), 50 deletions(-)

-- 
2.7.4

