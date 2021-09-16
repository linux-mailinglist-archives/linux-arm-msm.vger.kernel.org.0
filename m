Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D55E40E607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 19:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348711AbhIPRRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 13:17:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50294 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347119AbhIPQ5e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 12:57:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631811372; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+Rtf3C3Z6ExesKi7hltrjEC6h7pGf2RnSc52V8Lzifo=; b=arCPuX/fELOetWAMJxsqrfw/qgDbMRWDXE+hzEuGfSmfeANwf2YquUbb9Spaa9db2jTuVL8l
 EamckUGbJ9Fx6Amq4Rr+Le4aAyUNTkZIy6mhDYfGjH1WSXZKSAUutZlN3gp3DEvVQnVWtOwY
 Wp+s6IHGHopqItgCsUyuE5qNG+U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6143772bec62f57c9ac8a724 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:56:11
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB291C359E6; Thu, 16 Sep 2021 16:56:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D14C1C4162C;
        Thu, 16 Sep 2021 16:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D14C1C4162C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v3 0/3] Add support for sc7280 WPSS PIL loading
Date:   Thu, 16 Sep 2021 22:25:50 +0530
Message-Id: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PIL loading of WPSS co-processor for SC7280 SOCs.

Changes from v2:
- Add support to vote for multiple power domain
- Fix dt-bindings error
- Vote for load_state

Rakesh Pillai (3):
  dt-bindings: remoteproc: qcom: adsp: Convert binding to YAML
  dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
  remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS

 .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 --------
 .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 351 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_adsp.c                | 141 ++++++++-
 3 files changed, 489 insertions(+), 143 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml

-- 
2.7.4

