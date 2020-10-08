Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56441287464
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 14:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729769AbgJHMlA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 08:41:00 -0400
Received: from z5.mailgun.us ([104.130.96.5]:47202 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729824AbgJHMlA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 08:41:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602160859; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UBq1nLfOz0Y/Jx0LLpd2aSOItc2aaa9JEiVD8J9BqqY=; b=q5iXtExV2ArKvuvJ76yMQIaMvqbMO8DOBE0nqK0v/G/u+U430EMNWBh2WRiSq3lX6Nb+GdBl
 SKEvEZttZXKbOuPSMbcycxBVKNhV0egNNw1ZDV9+662vcrMFDxIhmliJsQPBsGnu/Hiu7nlr
 ugSMnQHlYX8LvvABzf9NB3LRMTg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f7f08db57b88ccb56627f1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 12:40:59
 GMT
Sender: jprakash=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0CB94C43382; Thu,  8 Oct 2020 12:40:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jprakash-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jprakash)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24124C433CB;
        Thu,  8 Oct 2020 12:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24124C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jprakash@codeaurora.org
From:   Jishnu Prakash <jprakash@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Jonathan.Cameron@huawei.com,
        amit.kucheria@verdurent.com, kgunda@codeaurora.org,
        aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Jishnu Prakash <jprakash@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: pm6150x: add ADC_TM definitions
Date:   Thu,  8 Oct 2020 18:10:24 +0530
Message-Id: <1602160825-10414-1-git-send-email-jprakash@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch is meant to add ADC_TM definitions on PM6150 and PM6150l,
for a customer variant of SC7180. It is dependent on the following
patch series by Dmitry Baryshkov:
"qcom: pm8150: add support for thermal monitoring".
This change was tested along with the driver changes in the patch series
and verified to work on SC7180.

Jishnu Prakash (1):
  arm64: dts: qcom: pm6150x: add ADC_TM definitions

 arch/arm64/boot/dts/qcom/pm6150.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pm6150l.dtsi | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

