Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B443ABEBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 00:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhFQWWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:22:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23247 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhFQWWb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:22:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623968423; h=Content-Transfer-Encoding: Mime-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: From: Subject:
 Message-ID: Sender; bh=lfg9G+z1oyuoX9i4YW1GyqxNjd/ALOc/mwtXcsjJNIE=; b=WgLwCK7kBmKNT6ONi31SeRqLNfrGXDD0c5pCb9ndyYgkvddDLycIijnqKTCw/Df89xYGzQhK
 VAbfcZsKVDnuJl1W8r7TtdAqrRVtCxjpz7i+mQZP/6YVeO2Z0Nxw/U6JsczkQ4vgDZBurtBk
 GJYksXA1TAn+v7XIzlKcldibVSY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60cbca9eed59bf69ccd11498 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 22:20:14
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58679C4338A; Thu, 17 Jun 2021 22:20:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hemantk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E540C433F1;
        Thu, 17 Jun 2021 22:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E540C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Message-ID: <1623968407.10055.6.camel@codeaurora.org>
Subject: Re: [PATCH v1 4/4] bus: mhi: core: Enable support for event ring
 priorities
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, loic.poulain@linaro.org
Date:   Thu, 17 Jun 2021 15:20:07 -0700
In-Reply-To: <1623965435-30224-5-git-send-email-bbhatt@codeaurora.org>
References: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
         <1623965435-30224-5-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2021-06-17 at 14:30 -0700, Bhaumik Bhatt wrote:
> Priority set in the event ring configuration by the controllers
> has been unused by the MHI host driver until now. Enable usage of
> those priorities set with the introduction of the enums for
> default or high priority tasklet scheduling options.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

