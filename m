Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FEC23B9E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 13:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730356AbgHDLrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 07:47:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57473 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730318AbgHDLrh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 07:47:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596541656; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=gtTTTs1E4Cy8zjVhQvmggBXMIFlxH/jwKrpw2hfMmdw=; b=skQzjJUjXpy5etxc6hJ/yVQROwYhtMl9Sf3YNuJBWbI/iatzz7u3hKeP2w3MSVc8GBN6TMaJ
 ml8whCRirMeDYgtcWFhv+M+u3R/T7qE99ey/8bkqsBam5qnydumpklWQIcPVuXPhZ1GdFKrv
 aE3WVZDExcXHbuLzLmyAw3IHCuI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f294abd90893260dd735d20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 11:47:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB064C43395; Tue,  4 Aug 2020 11:47:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6AA2C433CA;
        Tue,  4 Aug 2020 11:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6AA2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/3] Add support for assigned-performance-states
Date:   Tue,  4 Aug 2020 17:16:53 +0530
Message-Id: <1596541616-27688-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devics within power-domains with performance states do not
support DVFS, but still need to vote on a default/static state
while they are active. Add support for a new device tree property
which the clients can use to specify this and add support in
kernel to parse this value and vote.

Rajendra Nayak (3):
  dt-bindings: power: Introduce 'assigned-performance-states' property
  PM / Domains: Add support for 'assigned-performance-states'
  arm64: dts: sc7180: Add assigned-performance-states for i2c

 .../devicetree/bindings/power/power-domain.yaml    | 47 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 24 +++++++++++
 drivers/base/power/domain.c                        | 27 +++++++++++++
 include/linux/pm_domain.h                          |  1 +
 4 files changed, 99 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

