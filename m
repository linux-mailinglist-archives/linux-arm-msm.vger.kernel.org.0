Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6DB213637
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 10:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgGCISy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 04:18:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63416 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgGCISy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 04:18:54 -0400
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jul 2020 04:18:48 EDT
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2020 01:12:49 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2020 01:12:47 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Jul 2020 13:42:21 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id CB56721691; Fri,  3 Jul 2020 13:42:19 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [v6 0/4] Add non PAS wcss Q6 support for QCS404
Date:   Fri,  3 Jul 2020 13:42:15 +0530
Message-Id: <1593763939-19096-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   9 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 596 +++++++++++++++++++--
 2 files changed, 563 insertions(+), 42 deletions(-)

-- 
2.7.4

