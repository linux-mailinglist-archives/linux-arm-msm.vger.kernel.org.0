Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8033E265B3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgIKINw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:13:52 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:54636
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgIKINt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812028;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=wosZsh3d7QEkj+Gl49goOxsZWiqmEsfanOW26xfQVNY=;
        b=O+1UhL1i0WwfdCk9VkTGIEKFTyFSREOtAdxGvoFBumRmFAcB5AtKcEs3kbc9s0y0
        SPz+8BY1MZz57UmblmFKjvexp7WT8v/cw5liwagLGb5CS+u+OflvmONtpXqDlZbrwW5
        3tfr/RS7SQqfofz8GRb+dLzmCZ7to5P4Y/l7QVEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812028;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=wosZsh3d7QEkj+Gl49goOxsZWiqmEsfanOW26xfQVNY=;
        b=mJN/XrI0N64gEqmahogBq/2OtpPO/EDoSBJPPD0d+UpdBGkJv1ty0i9DmkZ7qRRu
        obwogjoEuOCZUtdePU7laG6bcVmsAycNWakGaDL1egzHNdcsRCRnXv+JMl3VttkNPiM
        IK4DW+qOtlbrtkB3d+ZZjgsAmp+vEzY+JCwmIqBw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9287EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1]: Add const qualifier to MHI config information 
Date:   Fri, 11 Sep 2020 08:13:48 +0000
Message-ID: <010101747c3a48b6-357caff4-e345-4b26-8891-be191298fee4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2020.09.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch is adding const qualifier to the mhi controller config
information passed to mhi_register_controller which is exported
API. Currently ath11k MHI controller driver depends on this change
to pass MHI config information.

Hemant Kumar (1):
  bus: mhi: core: Add const qualifier to MHI config information

 drivers/bus/mhi/core/init.c | 12 ++++++------
 include/linux/mhi.h         |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

