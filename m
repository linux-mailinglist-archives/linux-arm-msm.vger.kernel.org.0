Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC2320A630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406893AbgFYTzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:55:00 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49842 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406743AbgFYTzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:55:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593114899; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=PhZyeDiU4gx67xTuq558n6PbKCvNKL0jNS20e961ie0=; b=IDOksNO2vpItVWCVpEmnJz2IaL/YvGNmWH0MNUPt/0rIQKng4Ido/lYgxgKw5Ldr+3Ini6Bu
 W7J839LRRYWK1khfJD/MK6UxxsxBed38GAPNsAH28EB3jh5WT4rHbrcriwxK9Q+jkckENP0q
 JDgROlxYNXSFOBMRXvMct/iMR+Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ef50112c4bb4f886d2369a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:54:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06A54C4339C; Thu, 25 Jun 2020 19:54:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 403FBC433CA;
        Thu, 25 Jun 2020 19:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 403FBC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     kishon@ti.com, vkoul@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v3 0/2] phy: qcom-snps: Add runtime suspend and resume handlers
Date:   Thu, 25 Jun 2020 12:54:42 -0700
Message-Id: <20200625195444.15130-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v3:
 - Fixed strict checkpatch warnings due to alignment
 - Remove debug artifacts from prints
 - Split the set mode callback addition to another patch
 - Removed suspended parameter

Changes in v2:
 - Addressed checkpatch alignment/line length warnings.
 - Removed superfluous init in qcom_snps_hsphy_resume().

Adds a set mode callback and runtime suspend/resume handlers to the
phy-qcom-snps-femto-v2 driver.  The set mode is used to enable certain
power management features in the PHY during suspend/resume.

Wesley Cheng (2):
  phy: qcom-snps: Add runtime suspend and resume handlers
  phy: qcom-snps: Add a set mode callback

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

