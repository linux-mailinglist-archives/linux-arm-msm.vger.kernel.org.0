Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A30630929F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 09:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbhA3Iuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 03:50:55 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18831 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbhA3Fap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 00:30:45 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 21:20:34 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 21:20:31 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jan 2021 10:49:49 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 5A61F21A02; Sat, 30 Jan 2021 10:49:49 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        govinds@codeaurora.org, sricharan@codeaurora.org,
        gokulsri@codeaurora.org
Subject: [PATCH v9 0/4] Add non PAS wcss Q6 support for QCS404
Date:   Sat, 30 Jan 2021 10:49:45 +0530
Message-Id: <1611983989-10125-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v8:
 Updated patch 3 for the new prototype of qcom_q6v5_request_stop.

Changes since v7:
 Addressed review comments from	Stephen Boyd
 
Changes since v6:
 Removed duplicate structure entry added during rebase in v5

Changes since v5:
 Rebased all the unmerged patches on top of linux-5.8-rc3
 Added dt-binding for qcom,qcs404-wcss-pil
 Removed typo

Changes since v4:
 removed QDSP6SS clock controls and moved to wcss rproc.
 renamed wcsccc to q6sstopcc.
 cleanup/refactoring.

Changes since v3:
 dt binding cleanup.
 Fixed remoteproc recovery.
 Added remoteproc dump support.
 wcsscc cleanup/refactoring.

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.

Govind Singh (4):
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  15 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 593 +++++++++++++++++++--
 2 files changed, 566 insertions(+), 42 deletions(-)

-- 
2.7.4

