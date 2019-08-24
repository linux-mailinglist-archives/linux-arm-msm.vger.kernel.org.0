Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71CD09BE7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2019 17:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfHXPYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Aug 2019 11:24:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50752 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfHXPYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Aug 2019 11:24:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3B954608BA; Sat, 24 Aug 2019 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566660263;
        bh=pXOJr5ShE7iOEk7J667xinG+FyP4FlLtYOC8UYtWXC8=;
        h=From:To:Cc:Subject:Date:From;
        b=ioWfTaurykMpXg/Mz6duvVFgQn3eXjhIbnPbsej9cgdTIO3Xf29eff+nz5IYZ6tvu
         mWe94R5nAWpFMYgGvsR+aV8KuIlUMG5mvQwxz7yOavYU2iJJ21mRsNutkMvahvS1cp
         bDSuxVZAznf3C7rXXl1AeBmlhdiNAdgJQ8QxZ5PM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A49D3608BA;
        Sat, 24 Aug 2019 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566660262;
        bh=pXOJr5ShE7iOEk7J667xinG+FyP4FlLtYOC8UYtWXC8=;
        h=From:To:Cc:Subject:Date:From;
        b=FdfYKerqtvJ6a7zVBCQ0e6vFIOOEfCtjj+yXSfEBoziIc1r3HBKE2B6zi0CF3KKif
         bCS9qbvNbMHgzo09aWMFCRyHQ3PEdJhIgiaFH8/OewlwgznXMqHbnHFO+yx2DrmxCN
         GUQD8r13GZz9NkU3OWnomiIXZrrW+AMNtjvaWpDQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A49D3608BA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [RESEND PATCH v2 0/2] Add PDC Global and AOSS reset support
Date:   Sat, 24 Aug 2019 20:54:09 +0530
Message-Id: <20190824152411.21757-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds PDC Global and AOSS reset support on SC7180 SoCs.

v2:
 * Addressed Philipp's review comments

Sibi Sankar (2):
  dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
  dt-bindings: reset: pdc: Add PDC Global binding for SC7180 SoCs

 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

