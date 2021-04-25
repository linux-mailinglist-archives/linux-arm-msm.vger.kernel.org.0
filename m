Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5105436A540
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Apr 2021 09:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhDYHJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Apr 2021 03:09:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61582 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229724AbhDYHJU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Apr 2021 03:09:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619334521; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=niPyJpAZpR71QDB+qwRPU8SYtCcTw1VHp+nM0K9chAQ=; b=ieMoCnL2sz07aEDkdGHzBJ3XpmZWVOwe9Q8pmm409vAiRURoXXBAH5vYSoE8PepgTfgrZ9Eq
 mZGbhb7nsKikpqlQYOOK4LA+XVhVNw2aELq2TVx12SXPsjRWHiEj/j61GDM7S5616gUkiJxu
 r+30bnooMC0OsJnXOSQwBElUR+Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 608515782cc44d3aea6e458a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 25 Apr 2021 07:08:40
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4D2FC433D3; Sun, 25 Apr 2021 07:08:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFF6CC433D3;
        Sun, 25 Apr 2021 07:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFF6CC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3] Add support for duty-cycle for RCG
Date:   Sun, 25 Apr 2021 12:38:21 +0530
Message-Id: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The root clock generators with MND divider has the capability to support
change in duty-cycle by updating the 'D'. Add the clock ops which would
check all the boundary conditions and enable setting the desired duty-cycle
as per the consumer.

[v3]
  * Implement clockops for get_duty_cycle.
  * Return -EINVAL for Non-MND or HID RCGs.

Taniya Das (1):
  clk: qcom: clk-rcg2: Add support for duty-cycle for RCG

 drivers/clk/qcom/clk-rcg2.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

