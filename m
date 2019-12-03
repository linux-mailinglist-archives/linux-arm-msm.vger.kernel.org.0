Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4B11100F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 16:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfLCPQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 10:16:03 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:50512
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbfLCPQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 10:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386162;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=hpHeJVb7EJbjQPotxf9qoETKMkrBAc2t8j9KkouUgoc=;
        b=fFwRtQ20PFB/9tagifmONaYH+Jbihh90OvuedZ9FP0pvhoKOt/g5zbvAgO3EKgmD
        4KzyZrvC+5hiyNDy40UtHX6cDUzbZRhNmxZ/gaiXw7YivBZ1aYzt4DsIWvKQyeg9tji
        1UAvKQXpph8jXL9KT6iWGXi0s/O7EXn2cGgL0mmo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386162;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=hpHeJVb7EJbjQPotxf9qoETKMkrBAc2t8j9KkouUgoc=;
        b=FZZNAIrvn9gDkQ/r4MsXVPOKQclPkW5Iu+XI1dshFx6H8Lmzosd1CsC8iPeJV2pu
        puk54uswB+S5tuAShkQwTWVSzdR1SJG1GdBHxf+CPawIUGtNhnFmOAOgEkt4McWOyNH
        8tAwlphwCadJiDBYNAzYiwoWIuJ50IyaItOXq6tE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25712C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 0/5] Add support for A618 GPU
Date:   Tue, 3 Dec 2019 15:16:02 +0000
Message-ID: <0101016ecc552532-38e7d3f1-d18f-4216-9364-e4cea63b5625-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.12.03-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for A618 GPU. Please review.

Sharat Masetty (5):
  drm: msm: Add 618 gpu to the adreno gpu list
  drm: msm: a6xx: Add support for A618
  drm: msm: a6xx: Dump GBIF registers, debugbus in gpu state
  drm: msm: a6xx: fix debug bus register configuration
  arm: dts: sc7180: Add A618 gpu dt blob

 arch/arm64/boot/dts/qcom/sc7180.dtsi        | 116 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h       |  52 ++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  24 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  70 +++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   9 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  76 ++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h |  16 +++-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  11 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  12 ++-
 9 files changed, 348 insertions(+), 38 deletions(-)

--
1.9.1

