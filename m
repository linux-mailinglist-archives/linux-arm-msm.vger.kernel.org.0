Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090AA1100C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 16:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfLCPGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 10:06:07 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:37772
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbfLCPGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 10:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575385566;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=REa2Wa+tZ8FM7aOChhcPh7CiUHkIY9nJS/XdLBVzv/0=;
        b=dZ+iys5bBMhQezyHvCMh+c/hh8SM0LSrcF3wSAgmxCP/q9R8xiawXdVqgVT1s0ST
        z/IPL5Dj/orJU6PTzzGbyh0ABeYrpI8rTcmYyIrUzeOa4Awn7gD1tRQwizPCPhFVT+6
        K7OGD4WOXPWF6oN1Zd9KltkxAYHLL1d2+Ycnj6oE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575385566;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=REa2Wa+tZ8FM7aOChhcPh7CiUHkIY9nJS/XdLBVzv/0=;
        b=QS7ZEcLvt4YTyDz1yrRQs2Vhnk3EpTCDleB8w4FP0Qg70uTW/OdRl8PiVziGAHfd
        TjHllFzijdfuHtGCcuaymG9DhI+f2LRzU98TNl0fYK2zBKeQXRWjfYvP9mGg4ZbTkE6
        KlP1H5EJUSTrIJmHCeyY1QK9sYYaIhp7TY362OLQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9865C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 0/5] Add support for A618 GPU
Date:   Tue, 3 Dec 2019 15:06:06 +0000
Message-ID: <0101016ecc4c0b94-962516a2-9f30-4201-b2c1-7866be5ea402-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.12.03-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series and support to enable A618 GPU revision. Please review.

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

