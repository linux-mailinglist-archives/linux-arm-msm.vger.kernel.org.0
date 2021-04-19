Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B6F363F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 12:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237479AbhDSK1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 06:27:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15119 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232250AbhDSK1n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 06:27:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618828034; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QQFoFEB/H5Z0VqewazdntMyz6iKBDZ1NewhM7KmKF/0=;
 b=dStzJ8rFh9Tn/7ARfZ+bWlNOcl/tyopPHAHo6Ms/YElyzekyH9uXyudmrjNNHkNfC1BQC6GG
 7xZum7HFuyybao5mpcg/gSeob5BXDfZWUe39ZLRq5SbYYb6qqgaYTdYuQvRddv8ieNoRZ7Ad
 9v48ZzBTeh2sXHcYgQsoSF8VyKI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 607d5afafebcffa80f56c3fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 10:27:06
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 762F2C4338A; Mon, 19 Apr 2021 10:27:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A010C433D3;
        Mon, 19 Apr 2021 10:27:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 19 Apr 2021 15:57:05 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, agross@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: reset: pdc: Add PDC Global bindings
In-Reply-To: <161567147973.1478170.8098632597789819554@swboyd.mtv.corp.google.com>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
 <1615269111-25559-5-git-send-email-sibis@codeaurora.org>
 <161567147973.1478170.8098632597789819554@swboyd.mtv.corp.google.com>
Message-ID: <ecec676283b4e57d3767addc8e37d46e@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-14 03:07, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-03-08 21:51:49)
>> Add PDC Global reset controller bindings for SC7280 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml | 4 ++++
>>  include/dt-bindings/reset/qcom,sdm845-pdc.h                  | 2 ++
>>  2 files changed, 6 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml 
>> b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
>> index d7d8cec9419f..831ea8d5d83f 100644
>> --- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
>> +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
>> @@ -21,6 +21,10 @@ properties:
>>            - const: "qcom,sc7180-pdc-global"
>>            - const: "qcom,sdm845-pdc-global"
>> 
>> +      - description: on SC7280 SoCs the following compatibles must be 
>> specified
>> +        items:
>> +          - const: "qcom,sc7280-pdc-global"
> 
> Somehow this one can drop sdm845-pdc-global but aoss-cc can't?

I missed replying to ^^. aoss-cc
reset is identical to that found
on SDM845 SoC but the pdc-reset
differs in the number of resets
and offset within the pdc register
space.

> 
>> +
>>        - description: on SDM845 SoCs the following compatibles must be 
>> specified
>>          items:
>>            - const: "qcom,sdm845-pdc-global"

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
