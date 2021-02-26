Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82917325E9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 09:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhBZIFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 03:05:17 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:64521 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230146AbhBZIFP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 03:05:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614326696; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fbNvhhKzdpXJJ0I5AN1rDrugUmvG1VlpDxjACOCxKlM=;
 b=ccb06bMr++hF8t1Ck8GrjAnUKzxJRcFoIImis9A1LeLfNhiNobYRaIVBVZzxFuwKWn8EbmzC
 8lbHQbrnu3ne+04EdAdwMSIokb0H6LIYKbfFcNwchO5nnAZ38B6A50qJksg7SHGoY+byHamc
 srz6GIkV4vzW0mg+4F/v+pyVQEU=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6038ab8d7ea222fbf5083147 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 08:04:29
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B69EAC433CA; Fri, 26 Feb 2021 08:04:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 057AAC433ED;
        Fri, 26 Feb 2021 08:04:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 13:34:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Add device tree node for
 LLCC
In-Reply-To: <161428185152.1254594.1426736986245389798@swboyd.mtv.corp.google.com>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <c4b7ae4dd009f563e6786f4a41f09efa38636fb6.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <161428185152.1254594.1426736986245389798@swboyd.mtv.corp.google.com>
Message-ID: <a35e6dcba758be4af3d111fe92cfbcd6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-26 01:07, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2021-02-25 01:30:19)
>> Add a DT node for Last level cache (aka. system cache)
>> controller which provides control over the last level
>> cache present on SC7280 SoC.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Should add system-cache-controller to the devicetree spec. Or just use
> cache-controller for the node name.

This was as per discussion in [1][2] where dt-schema throws an error
since it expects cache-level to be associated with cache-controller.

[1] 
https://lore.kernel.org/lkml/5dcd8588.1c69fb81.2528a.3460@mx.google.com/
[2] 
https://lore.kernel.org/lkml/cover.1573814758.git.saiprakash.ranjan@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
