Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E3332C1AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389500AbhCCVic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:38:32 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14288 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbhCCL3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 06:29:14 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 03 Mar 2021 03:10:22 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 03 Mar 2021 03:10:20 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Mar 2021 16:39:58 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id A255321308; Wed,  3 Mar 2021 16:39:56 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v7 0/2] Add encoder ctrls for long term reference
Date:   Wed,  3 Mar 2021 16:39:45 +0530
Message-Id: <1614769787-26922-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series add the encoder controls for long term reference (LTR)
and support for the same in venus driver.

Dikshita Agarwal (2):
  media: v4l2-ctrl: add controls for long term reference.
  venus: venc: Add support for Long Term Reference (LTR) controls

Changes since v6:
- removed references of Request API from documentation.
- addressed other comments.

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 17 ++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 49 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 14 +++++++
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 4 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.7.4

