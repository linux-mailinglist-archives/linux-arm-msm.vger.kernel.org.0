Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B616F002E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 15:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389590AbfKEOpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 09:45:21 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45032 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389096AbfKEOpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 09:45:21 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2C2216160A; Tue,  5 Nov 2019 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572965120;
        bh=cFPlxNSMY1K9+A3LYb2LGLWYFwQfD7aAy8BX2vuRuqM=;
        h=From:To:Cc:Subject:Date:From;
        b=J0w0FIHCKDvOgJR9MyLTc2TKcGAanAZaQ8+cGTfGsnX4GgU8e2MlMYsCDmB1JaAL4
         fGEMJ06oA2h5VtuPNPnHCMAV2X25lE012zg7A+0ejg/4WZEGJKii6HzG8l/zcJhZ99
         Yv1rqoiR37yzY6kj7FsA/dNZBvV5oTbDVKU4OpCg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2864C61603;
        Tue,  5 Nov 2019 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572965119;
        bh=cFPlxNSMY1K9+A3LYb2LGLWYFwQfD7aAy8BX2vuRuqM=;
        h=From:To:Cc:Subject:Date:From;
        b=KzuZISi6AGnf90xULWtm9wSXcy1ZrM1zQrZdivCdSOLeSJXCycGLBGpPb7iX9DbyK
         9nS8y0EXYQ5ZsVVvJ1X3DFSnuvez/UU+gcdKWQLa9oegLXP4ZE7uJbzEmjNsHaUT+4
         eJXxnxIVIDjvVyqWG5Dw9DCIdclF3YeAzk8YL6IY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2864C61603
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org
Subject: [PATCH v1 0/2] Enable Bluetooth functionality for WCN3991
Date:   Tue,  5 Nov 2019 20:15:06 +0530
Message-Id: <20191105144508.22989-1-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches enables Bluetooth functinalties for new Qualcomm
Bluetooth chip wnc3991. As this is latest chip with new features,
along with some common features to old chip "qcom,qcawcn3991-bt".
Major difference between old BT SoC's with WCN3991 is WCN3991 
will not send any VSE for the VSC instead is sends the data on CC
packet.

Balakrishna Godavarthi (2):
  Bluetooth: btqca: Rename ROME specific variables to generic variables
  Bluetooth: hci_qca: Add support for Qualcomm Bluetooth SoC WCN3991

 drivers/bluetooth/btqca.c   | 92 ++++++++++++++++++++++++++-----------
 drivers/bluetooth/btqca.h   | 32 +++++++------
 drivers/bluetooth/hci_qca.c | 16 ++++++-
 3 files changed, 97 insertions(+), 43 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

