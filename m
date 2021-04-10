Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946E435AA2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 04:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDJCFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 22:05:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27404 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233917AbhDJCFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 22:05:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618020301; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vIpN0z3OajGsZfLgFQHJkTIPCP2RqS/y9IbsSFfvLiA=; b=NcLgQYD4rokuw4Cn++AC1KBbFRj4OAruXkb13Wj3dHW/eF48dVVvRs0evuwki1gZVfEvxIty
 TQRp+t6k+IIzFk5IFGwQMvv7yQGqV35JOL9cqRuOyQqoaSwRO2WP7lEhvvlmfwJ+WBNyXDNN
 +XXw//1gzaeWrwfrXCImJuGByF8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 607107c42cc44d3aeaea6909 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Apr 2021 02:04:52
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDF5DC433CA; Sat, 10 Apr 2021 02:04:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48612C433C6;
        Sat, 10 Apr 2021 02:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48612C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/2] Add device nodes for SC7280 SoCs
Date:   Sat, 10 Apr 2021 07:34:38 +0530
Message-Id: <1618020280-5470-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device node for cpufreq HW and clock controllers of GPU, DISP, VIDEO, LPASS.
The clock controller nodes are dependent on the following

VIDEO/DISP/GPU: https://lkml.org/lkml/2021/3/16/1624
LPASS: https://lkml.org/lkml/2021/4/9/812

Taniya Das (2):
  arm64: dts: qcom: sc7280: Add cpufreq hw node
  arm64: dts: qcom: sc7280: Add clock controller nodes

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

