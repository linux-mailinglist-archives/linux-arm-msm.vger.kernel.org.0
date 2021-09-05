Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE85400FBD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Sep 2021 15:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238012AbhIENAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Sep 2021 09:00:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32833 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237457AbhIENAl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Sep 2021 09:00:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630846778; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hIUtYY59EHfEe8/8qqNtSNUFLZ2sr/yusMAk9RqM6lI=; b=Iu4+cTKCFU8EuekBNu3pGbRH2DMN2rGzc4PPj89KrUP8Bq/mE+lHERwmpd4jIMQ8tLE4SFCW
 8ze47Fu3GYPfqfUF2E9Z9/hp4KfVjygFBFGO+EiyMdRTf4LzTMlntlhq7yOxPEzQRmrMybOM
 neMxSilu4vVNxz5nyHZyov5jHfw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6134bf3a1567234b8c646801 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 05 Sep 2021 12:59:38
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 538FDC43460; Sun,  5 Sep 2021 12:59:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.130] (unknown [49.36.87.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7FE0C4360C;
        Sun,  5 Sep 2021 12:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C7FE0C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: sc7180: Enable SoC sleep stats
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
References: <1621596371-26482-1-git-send-email-mkshah@codeaurora.org>
 <1621596371-26482-4-git-send-email-mkshah@codeaurora.org>
 <CAE-0n53ySKwDwzRYFYjnQnqVAujVrkik2U-PeCuS61xQU-hbWA@mail.gmail.com>
 <YLUjbwFSJOSWS0IV@builder.lan>
 <CAE-0n53hdd1tEmYwTL0CNi=S6CUxRhWnkJz-KoTj2UnedNKXmg@mail.gmail.com>
 <YLhCGC/qgP6ESNl7@yoga>
 <CAE-0n511_GHcyPDSeDaf5QSqVQqyHOqxJCGaSWNr=x9uotegLg@mail.gmail.com>
 <YLxEPkQdKKYNDHqv@builder.lan>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <f80b2317-c234-0439-b6ae-dffb040f22be@codeaurora.org>
Date:   Sun, 5 Sep 2021 18:29:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YLxEPkQdKKYNDHqv@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 6/6/2021 9:12 AM, Bjorn Andersson wrote:
> Yes, "ram" sounds like a better node name for both the qmp and
> sleep-stats region - in the RPMH case.

Updated to use "aop_msgram" in v9.  I think saying only "ram" may 
further confuse with DDR.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

