Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BFB3B97D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 22:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhGAVAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 17:00:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15936 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232637AbhGAVAO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 17:00:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625173063; h=Content-Transfer-Encoding: Mime-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: From: Subject:
 Message-ID: Sender; bh=U6I92nSRiKPg6VazvfQ87l6D9zB3vfhPGWW3XdsItyk=; b=wYb4o1AKkevw+rGJifz9hm45sbbVckCYSiiF98aSpGG727Hkypa0OWHEp5cibpTRg/0jnXxP
 6hJF+01VGwFI2E7YfB+dtmEn+TLbhEOtrjfSZq2Imyes81lHYB0fANkk5gf3AiTIEtg/EnzB
 RH4gIDC+6uRcZWCz8Pt8d8sz14k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60de2c307b2963a2828b4ea6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Jul 2021 20:57:20
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 283C5C43217; Thu,  1 Jul 2021 20:57:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hemantk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BD33C433D3;
        Thu,  1 Jul 2021 20:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2BD33C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Message-ID: <1625173034.10055.22.camel@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: core: Use mhi_soc_reset() API instead of
 register write
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 01 Jul 2021 13:57:14 -0700
In-Reply-To: <1625169338-32026-1-git-send-email-bbhatt@codeaurora.org>
References: <1625169338-32026-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2021-07-01 at 12:55 -0700, Bhaumik Bhatt wrote:
> Currently, register writes are used when ramdump collection in
> panic path occurs. Replace that with new mhi_soc_reset() API such
> that a controller defined reset() function is exercised if one is
> present and the regular SOC reset is done if it is not.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

