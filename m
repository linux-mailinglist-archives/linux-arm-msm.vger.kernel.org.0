Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D7C219CDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 12:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGIKCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 06:02:37 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:36297 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726848AbgGIKCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 06:02:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594288954; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=Vcf4pT1GA5PBOflu7PbMdZ+iJ9F8+ASAMkKs46dXbG8=; b=u7K9Qq+VGKScQ2LNSNKScV59O0mr/EzDlu4YOvx94BvAFy2TP2c1u7VZtK+nCPVRF1vif8Tp
 iLRrXYIllEF6bs/++w1b5AmRRoUBHHci5D0T2Put0kNjzUTjxKtTMs+JNUTl0P4YNn24OrcW
 xushOqLp+3CBKc2ZUmzGePfyKeQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f06eaf2c746eb6f00f30ef3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 10:01:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 511BFC433CB; Thu,  9 Jul 2020 10:01:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.129] (unknown [183.83.142.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50F85C433C8;
        Thu,  9 Jul 2020 10:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50F85C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
Date:   Thu, 9 Jul 2020 15:31:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>
>
> On 08/07/2020 06:08, Rohit kumar wrote:
>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>
>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> index 32c2cdb..04e34cc 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power 
>> Audio SubSystem (LPASS).
>>     Required properties:
>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>> +              "qcom,lpass-cpu-sc7180"
>>   - clocks        : Must contain an entry for each entry in clock-names.
>>   - clock-names        : A list which must include the following 
>> entries:
>>                   * "ahbix-clk"
>
> Can you also list the clocks that are mandatory for this SoC.
>
> --srini
>
Will it be fine if I update it in patch 8 only where we have moved to 
yaml format?

Thanks,

Rohit

>
>>
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

