Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDEE36ACE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 09:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhDZH1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 03:27:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25815 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhDZH1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 03:27:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619422025; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BC2MMd53B//K++4/ykJz6cgdkp+Imiep2wNxZdBiFMQ=;
 b=oTwfrGYCqtiJJGANWtIjRoXZwsxCo+ZO8FRa/vrBiwQUJGuxhsWNRoYfpSCBrQ7MDHQqv3MX
 BxU6A8KkOpjwXT39e/OYgW9trgTzm/GuZYHYwey5ege7BHYysKaseT3rFi7zmccKDAB2ikC5
 EnO8A6sXMuJJ3aXr5KjTju8QIl4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60866b3b853c0a2c465ed848 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 07:26:51
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 657D4C4338A; Mon, 26 Apr 2021 07:26:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 487C3C433D3;
        Mon, 26 Apr 2021 07:26:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Apr 2021 12:56:48 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Jassi Brar <jaswinder.singh@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2] dt-bindings: mailbox: qcom-ipcc: Add compatible for
 SC7280
In-Reply-To: <20210324182436.GA3378168@robh.at.kernel.org>
References: <20210315184410.21063-1-saiprakash.ranjan@codeaurora.org>
 <20210324182436.GA3378168@robh.at.kernel.org>
Message-ID: <c10499263a557d65c868dc7305d445f4@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jassi,

On 2021-03-24 23:54, Rob Herring wrote:
> On Tue, 16 Mar 2021 00:14:10 +0530, Sai Prakash Ranjan wrote:
>> Add IPCC compatible for SC7280 SoC.
>> 
>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Cc: Jassi Brar <jaswinder.singh@linaro.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Could you please pick this up?

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
