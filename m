Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5F63ABE7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhFQWAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:00:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:18012 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFQWAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:00:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623967104; h=Content-Transfer-Encoding: Mime-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: From: Subject:
 Message-ID: Sender; bh=DVv2zsWV6ZP4QIxQoGaZ4mcmfKnNXIyvhJizSQuG5PY=; b=qGzfxOLTyR3IppoTV38KVVfngnBcGT3GQYoNld2cLrZNtLtISDn/Lv4xuM3tgQ7Raz6rIdJX
 ylpVgCVHBv1ZPC0NGJpFQWstPKnZeitxHWnZCpeipmsglV3HZ3hSKiPpaAyBoZbQAA9p7tpr
 J0CVFh7j0X9oCC1DlH4V1njAi8U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60cbc573ed59bf69ccbd7b7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 21:58:11
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1823C433D3; Thu, 17 Jun 2021 21:58:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hemantk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B09DDC433F1;
        Thu, 17 Jun 2021 21:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B09DDC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Message-ID: <1623967084.10055.5.camel@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: pci_generic: Apply no-op for wake using
 inband wake support flag
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, loic.poulain@linaro.org
Date:   Thu, 17 Jun 2021 14:58:04 -0700
In-Reply-To: <1623954233-32092-1-git-send-email-bbhatt@codeaurora.org>
References: <1623954233-32092-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2021-06-17 at 11:23 -0700, Bhaumik Bhatt wrote:
> Devices such as SDX24 do not have the provision for inband wake
> doorbell in the form of channel 127. Newer devices such as SDX55
> or SDX65 have it by default. Ensure the functionality is used
> based on this such that device wake stays held when a client
> driver uses mhi_device_get() API or the equivalent debugfs entry.
> 
> Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake
> operations")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
