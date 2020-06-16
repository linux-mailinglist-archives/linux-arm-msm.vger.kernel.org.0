Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38BB1FB1B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 15:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgFPNI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 09:08:26 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25005 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728596AbgFPNIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 09:08:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592312903; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7mR9zhmqvMVQR1lHebGTjVpWrCEe0+8oz+tu8osL53w=;
 b=kWAzbCrcjYIkS6XmA/B7SoIIK4+tGDQb2AuuPkFiewkpXXuJS9Zv0iLJ1G693CgGw7mAcE1o
 Rm0Tv0YWnqZQuBZeBiLWP8j8Z5gj8uWFUzK0OUjS/W0+gs+aCisXV1JE1XsZh7MClgl40GPq
 TExQszk8qbr3JV0S4EfjReuluHc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ee8c4295866879c767a51f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 13:07:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B379BC43387; Tue, 16 Jun 2020 13:07:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ppvk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EE61C433C8;
        Tue, 16 Jun 2020 13:07:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Jun 2020 18:37:53 +0530
From:   ppvk@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org,
        rnayak@codeaurora.org, sibis@codeaurora.org, matthias@chromium.org
Subject: Re: [PATCH V4 1/2] mmc: sdhci-msm: Add interconnect bandwidth scaling
 support
In-Reply-To: <20200615231207.GX4525@google.com>
References: <1591691846-7578-1-git-send-email-ppvk@codeaurora.org>
 <1591691846-7578-2-git-send-email-ppvk@codeaurora.org>
 <20200615231207.GX4525@google.com>
Message-ID: <3681c3e2a49b5c8b832d277873b6fa49@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Thanks!

On 2020-06-16 04:42, Matthias Kaehlcke wrote:
> On Tue, Jun 09, 2020 at 02:07:25PM +0530, Pradeep P V K wrote:
>> Interconnect bandwidth scaling support is now added as a
>> part of OPP. So, make sure interconnect driver is ready
>> before handling interconnect scaling.
>> 
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Do you plan to send also patches that add the necessary DT entries?
> I'm particularly interested in SC7180.

Yes, we will send the DT entries soon.
