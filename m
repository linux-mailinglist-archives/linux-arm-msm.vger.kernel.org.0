Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A89387DE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 18:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346743AbhERQym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 12:54:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28834 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhERQyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 12:54:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621356803; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4ouhNzv64W56jIKdgY8HWa/2U7fy4tFAWB86eRu+Cmg=;
 b=ekImbE6+QHN4JD83zOqTmjZ4/M074yMJAPNcGXMFMCDnu51+9lZ8dVy9ZOiyk1aAxxDDBgmh
 lnCCljumv7L4aQ6q57k0umfyEIlW55AGHD2kO1Hao/ma/e1iKIoiQCs/HyNUKoC5ztQHXvKx
 z3CbNaKhZpcdOUWVR8T+WLerHI4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60a3f10167d156359ab8f5ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 May 2021 16:53:21
 GMT
Sender: okukatla=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 89E9EC433D3; Tue, 18 May 2021 16:53:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF16BC433F1;
        Tue, 18 May 2021 16:53:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 May 2021 22:23:19 +0530
From:   okukatla@codeaurora.org
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, Andy Gross <agross@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-arm-msm-owner@vger.kernel.org,
        sibis=codeaurora.org@codeaurora.org
Subject: Re: [1/3] dt-bindings: interconnect: Add EPSS L3 DT binding on SC7280
In-Reply-To: <825aca2d853e5dd577d61396df49f44a@codeaurora.org>
References: <1618556290-28303-1-git-send-email-okukatla@codeaurora.org>
 <1618556290-28303-2-git-send-email-okukatla@codeaurora.org>
 <825aca2d853e5dd577d61396df49f44a@codeaurora.org>
Message-ID: <51ccc3e65a25fe6e278621459a75e191@codeaurora.org>
X-Sender: okukatla@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-30 11:04, Sibi Sankar wrote:
> Hey Odelu,
> Thanks for the patch!
> 
> On 2021-04-16 12:28, Odelu Kukatla wrote:
>> Add Epoch Subsystem (EPSS) L3 interconnect provider binding on SC7280
>> SoCs.
>> 
>> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> index d6a95c3..98223f8 100644
>> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> @@ -18,6 +18,7 @@ properties:
>>    compatible:
>>      enum:
>>        - qcom,sc7180-osm-l3
>> +      - qcom,sc7280-epss-l3
>>        - qcom,sdm845-osm-l3
>>        - qcom,sm8150-osm-l3
>>        - qcom,sm8250-epss-l3
> 
> Based on the driver/dts changes the
> reg property maxItems will no longer
> be just 1.
Thanks Sibi!
I will address this in next revision.
