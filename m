Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FC59767F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfHUJy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:54:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40750 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfHUJy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:54:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5811860E57; Wed, 21 Aug 2019 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381294;
        bh=+m6PesI85VHRiyOvLz4vKiz1s9xONy9t4Unf/P+i/es=;
        h=From:To:Cc:Subject:Date:From;
        b=Mzqj6gwE1WbRejVhIVuj5i7SJhGI6N1V6BudengeY1TE31EEg+H1VnkmQDuYEjPcL
         Rqo6Fj+BIIp3YabcGLggGPr8QyXuBaEbBiZalxbiRoTKUAsFXB3s+v7EtRVbwC/Se+
         FuhfFkxk8NdxUKfjtpC3EIR25bnnOHZjVcE1onP8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C56FE602CA;
        Wed, 21 Aug 2019 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381293;
        bh=+m6PesI85VHRiyOvLz4vKiz1s9xONy9t4Unf/P+i/es=;
        h=From:To:Cc:Subject:Date:From;
        b=kAt1JtlHa+gG1FNGE+721h2rMCY5fpLc+2XB6L1yxIQpF+KXGT4drsjiD7ThrYZ2r
         YkIqSMYGIbkVaRVf14j6LJcTnOKW4b4waMzwpNSL+p7jgJXVLr736Bs/ml8mbnE2Q5
         XkgnFLNB3ret93y939U+3lE9uweqTr0d6fvNgfyY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C56FE602CA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/4] Add PDC Global and AOSS reset support
Date:   Wed, 21 Aug 2019 15:24:38 +0530
Message-Id: <20190821095442.24495-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds PDC Global and AOSS reset support on SC7180 SoCs.

Sibi Sankar (4):
  dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
  reset: qcom: aoss: Add support for SC7180 SoCs
  dt-bindings: reset: pdc: Add PDC Global binding for SC7180 SoCs
  reset: qcom: pdc: Add support for SC7180 SoCs

 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt | 3 ++-
 drivers/reset/reset-qcom-aoss.c                             | 1 +
 drivers/reset/reset-qcom-pdc.c                              | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

