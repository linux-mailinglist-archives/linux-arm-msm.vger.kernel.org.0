Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412CA2943EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 22:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgJTUbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 16:31:36 -0400
Received: from z5.mailgun.us ([104.130.96.5]:62783 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729700AbgJTUbf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 16:31:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603225895; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=nPdQtAcetVPn/AzI0CYvXfG1JS+4MG9ZEa1ajIhuL6k=; b=lkyD0joec86VYhYjBGucHRskTkkRsBTOeT21X3a5cR2OQhFe/qfnCaMMtU/lCEn0WZ4YWQT5
 F4hjJWwJytItqbdy2rX33pv1bndnDkXhkMD4FHn6ZZvTlhJZ0RRptI+BsU/R10k5C2Vphkol
 I/LoRxIl3eK924L5PnmatHBWe8g=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f8f48c50764f13b00e96360 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 20:29:57
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A26CEC433F1; Tue, 20 Oct 2020 20:29:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CDC9C433C9;
        Tue, 20 Oct 2020 20:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9CDC9C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        bbhatt@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH] bus: mhi: core: fix potential operator-precedence with BHI macros
Date:   Tue, 20 Oct 2020 14:29:45 -0600
Message-Id: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The BHI_MSMHWID and BHI_OEMPKHASH macros take a value 'n' which is
a BHI register index. If 'n' is an expression rather than a simple
value, there can be an operator precedence issue which can result
in the incorrect calculation of the register offset. Adding
parentheses around the macro parameter can prevent such issues.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 7989269..78e4e84 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -153,8 +153,8 @@ extern struct bus_type mhi_bus_type;
 #define BHI_SERIALNU (0x40)
 #define BHI_SBLANTIROLLVER (0x44)
 #define BHI_NUMSEG (0x48)
-#define BHI_MSMHWID(n) (0x4C + (0x4 * n))
-#define BHI_OEMPKHASH(n) (0x64 + (0x4 * n))
+#define BHI_MSMHWID(n) (0x4C + (0x4 * (n)))
+#define BHI_OEMPKHASH(n) (0x64 + (0x4 * (n)))
 #define BHI_RSVD5 (0xC4)
 #define BHI_STATUS_MASK (0xC0000000)
 #define BHI_STATUS_SHIFT (30)
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

