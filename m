Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B504C1100CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 16:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfLCPGK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 10:06:10 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:59142
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbfLCPGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 10:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575385569;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=HdBA3U6/eIISRmvCxk1G8NAyQEuTQY3aLr9PX/rQf1A=;
        b=AojmDO+sJriEWCt3EdCly41wXcu95HY9EK8ICHnAcVIrM/agM2nDc3D3mfm94Jxs
        hYyuNr2wQWqwFAaaz/dwP7W/2Jp5xCBWwHplWBVm3OEFpSte2t2TCndJBc4mmbVLp3y
        hhG1Ikaz+m9BYGxXi8ptQaddllaZ+ONQ0GdgKyPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575385569;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=HdBA3U6/eIISRmvCxk1G8NAyQEuTQY3aLr9PX/rQf1A=;
        b=IyRbFxpo+xHY0zw0CyGMsLHK8RxtswbSJOCbICbK5/EuXKj036Dt8Uy0iuFYI60c
        Np2wlJCJBtthclBLvTbymbdq/RiOidXOJC27GprGQMOkzIF/BBH0Ew/CyvtqIGW3jQo
        3/Ku9IEXzEBR+MIma8HD0MlGsIxTJQfkLxzKQi3c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C6B6C447A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 1/5] drm: msm: Add 618 gpu to the adreno gpu list
Date:   Tue, 3 Dec 2019 15:06:09 +0000
Message-ID: <0101016ecc4c17d1-5eda8109-e9f6-4742-b979-e7b83a56127c-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds Adreno 618 entry and its associated properties
to the gpulist entries.

Change-Id: Ie14ba09f32513ba6a6c882fda0d98ee1742b46d5
Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 0888e0d..e728ea5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -152,6 +152,17 @@
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
 	}, {
+		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
+		.revn = 618,
+		.name = "A618",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
 		.name = "A630",
-- 
1.9.1

