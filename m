Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D312E24F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Dec 2020 07:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgLXGyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Dec 2020 01:54:36 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:20476 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgLXGyg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Dec 2020 01:54:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608792851; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uDV1GPLdnE+d0a8jpe/jYUimmGmb/cEcwCOtuwMtCeo=;
 b=RID3nJ61hl/8Cd+2ADEpAiU/F4n3/eeCXwC7OMfpRAGHyeqZ0OBORBC6a26B7NSlxQsmRz05
 n4CfCfa9QY6v5LLayKtNQlKbvoY3/fSXQGlaXFmYvG8EAKLXZXgRXZYciW0ZCpOiXsR2vZzL
 2/RBdfGJ4xVAStJtBoPmk+qCHUA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fe43af97bc801dc4f1cf0ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Dec 2020 06:53:44
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2629FC43462; Thu, 24 Dec 2020 06:53:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68F04C433C6;
        Thu, 24 Dec 2020 06:53:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Dec 2020 12:23:43 +0530
From:   kgunda@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh@kernel.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
In-Reply-To: <20201221085055.GC4825@dell>
References: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org>
 <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
 <20201221085055.GC4825@dell>
Message-ID: <0281ad230dca093d42776cc64f56d3f9@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-21 14:20, Lee Jones wrote:
> On Fri, 18 Dec 2020, Kiran Gunda wrote:
> 
>> Convert the bindings from .txt to .yaml format.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 
>> -------------
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 127 
>> +++++++++++++++++++++
>>  2 files changed, 127 insertions(+), 80 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
> What are the other patches that I was not cc'ed on?
> 
> Generally it's a bad idea to send only some patches of a set to some
> maintainers.  Best for everyone to have full visibility.
> 
I ran the get_maintainer.pl script. Not sure how it is missed. Anyways
I will add you in the next post.

> Also looks like you're missing a cover-letter [PATCH 0/4] which adds
> to the opaqueness/confusion.
I have introduced the cover letter from V3 series. That's why the 
earlier
notes are missing from cover letter. Let me add them in next series.
