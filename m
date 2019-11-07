Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691CBF38CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbfKGTjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:39:41 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38012 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfKGTjl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:39:41 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 56CB260A63; Thu,  7 Nov 2019 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155580;
        bh=s8/45v5G6sYOnvFu3XWNdQAqwNhGFfHSa6sUorRdCyI=;
        h=From:To:Cc:Subject:Date:From;
        b=Tpff5KXpq2Yk9IxoeZOAFF+mQ1JT+Fr3gNDQKEZSW2vYNTLDMF0GpxnOulpkw436t
         Lxw9vMCM5IEM0rXJQg5bhcklGGrF2RPzSu7WwLyti6aUOrqUrhkTAbh6laetzaHL6J
         fJwLeGqcNSqX4fkdOn0MzvK9COMZHLWqWAV3IE6E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cohens-linux.qualcomm.com (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cohens@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2382602DD;
        Thu,  7 Nov 2019 19:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155579;
        bh=s8/45v5G6sYOnvFu3XWNdQAqwNhGFfHSa6sUorRdCyI=;
        h=From:To:Cc:Subject:Date:From;
        b=mazqS+9zaJ+eGp/W0lmFjd9/mm8PFHeQ9VXGpxppH/EHhqx1K5KRAu5rhOXKT35qG
         Dr4R3ckBy+RdIBHB+uB8N0aSFLN1wGBRfAYB7UnduTCFS4salRLpd722lkECUAfTcA
         TL8c6iIT7pMZ+9XuMglvoi5dfDov9Gw/ib9+iWZQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2382602DD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     pdhaval@codeaurora.org, seanpaul@chromium.org, adelva@google.com,
        Steve Cohen <cohens@codeaurora.org>
Subject: [PATCH 0/3] allow DRM drivers to limit creation of blobs
Date:   Thu,  7 Nov 2019 14:39:11 -0500
Message-Id: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fuzzers used in Android compliance testing repeatedly call the
create blob IOCTL which eventually exhausts the system memory.
This series adds a hook which allows drivers to impose their own
limitations on the size and/or number of blobs created.

Steve Cohen (3):
  drm: add driver hook for create blob limitations
  drm/msm: add support for createblob_check driver hook
  drm/msm/dpu: check blob limitations during create blob ioctl

 drivers/gpu/drm/drm_property.c          |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c           | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h           |  1 +
 include/drm/drm_drv.h                   |  9 +++++++++
 5 files changed, 56 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

