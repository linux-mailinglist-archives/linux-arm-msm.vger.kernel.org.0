Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539DC2C51EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 11:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387757AbgKZKSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 05:18:51 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:23180 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387712AbgKZKSv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 05:18:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606385930; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VKrx5gufXyjy4Nmp0ZKHspcGqjryqi+Bhc7JcUiGBxQ=; b=EFVPbitEGBvCn/INStu2Vy7M4XqdBpVlegbkcJ2ZtPtBTwFSODwoAr2wr2GdZMiRDQMw53p4
 7qZje5nrGWo5geybmnqt9OektQEnGbTNbQHTDSYAnl1yv06pD6go3rTpY0glG2zYB0RONbyd
 Mi4OIy5A5fs+yKLzn4xqB9YLpIM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fbf8104d64ea0b703fcd940 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Nov 2020 10:18:44
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5BA25C43463; Thu, 26 Nov 2020 10:18:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0F3CC43460;
        Thu, 26 Nov 2020 10:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0F3CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tkjos@google.com, dianders@chromium.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 0/3] Add changes to support 'HW solver' mode in rpmh driver
Date:   Thu, 26 Nov 2020 15:48:15 +0530
Message-Id: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RSC controllers may be in 'HW solver' state, where they could be in
autonomous mode executing low power modes for their hardware and as
such are not available for sending active votes.

This series adds changes to support the same in rpmh driver by disallowing
active requests when in solver mode and allowing the drivers to write
cached sleep and wake votes immediately.

Note: The series can land on its own but to avoid conflicts with
other change going in rpmh driver i have based changes on top of [1]
which hopefully can land soon.

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1606379490-4052-1-git-send-email-mkshah@codeaurora.org

Lina Iyer (1):
  drivers: qcom: rpmh: Disallow active requests in solver mode

Maulik Shah (2):
  soc: qcom: rpmh: Add rpmh_write_sleep_and_wake() function
  soc: qcom: rpmh: Conditionally check lockdep_assert_irqs_disabled()

 drivers/soc/qcom/rpmh-internal.h | 10 ++++
 drivers/soc/qcom/rpmh-rsc.c      | 34 ++++++++++++++
 drivers/soc/qcom/rpmh.c          | 98 ++++++++++++++++++++++++++++++++++++++--
 drivers/soc/qcom/trace-rpmh.h    | 20 ++++++++
 include/soc/qcom/rpmh.h          | 10 ++++
 5 files changed, 168 insertions(+), 4 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

