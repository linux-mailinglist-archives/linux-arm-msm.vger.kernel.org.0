Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32571C934F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 17:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgEGPBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 11:01:15 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44973 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728223AbgEGPBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 11:01:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588863671; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AFhcDY80LnoZO27lj6FbOhp6YvSPD5A1HvjLsjxeVEQ=; b=l0YCAUw2HsItt9PZm8IOlTBCWCKlBdCznh1lnTX6QtLlDt9zSMsEB2f827bC0YmuROkcYHXT
 FTs7BP0C3hwXRQJXMQyEtSCOz3AMCq9enV8JtMagI6NzsIlkBO3bNchwXdGzN8mgr3krs7UP
 rF1aRX+chCnm/Vdm+IP8u8uBNRo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb42299.7fc67079e570-smtp-out-n05;
 Thu, 07 May 2020 15:00:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D6D7C3855D; Thu,  7 May 2020 15:00:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [27.59.217.80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A08CEC00449;
        Thu,  7 May 2020 15:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A08CEC00449
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 2/3] dt-bindings: geni-se: Add interconnect binding for
 GENI QUP
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, c_skakit@codeaurora.org, mka@chromium.org
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
 <1584095350-841-3-git-send-email-akashast@codeaurora.org>
 <20200313220638.GA30287@bogus>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <0aef42fe-6ae9-4d77-c0bb-363c8869df69@codeaurora.org>
Date:   Thu, 7 May 2020 20:30:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200313220638.GA30287@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

>>   
>> +      interconnects:
>> +         minItems: 2
>> +         maxItems: 3
>> +
>> +      interconnect-names:
>> +         items:
>> +           - const: qup-core
>> +           - const: qup-config
>> +           - const: qup-memory
> Don't you need 'minItems: 2' here?

Yeah I need minItems: 2 here, thanks for reviewing.

regards,

Akash

>
> Rob

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
