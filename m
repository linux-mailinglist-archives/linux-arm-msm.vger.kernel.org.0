Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7DD356480
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 08:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243760AbhDGGty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 02:49:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61681 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231460AbhDGGty (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 02:49:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617778185; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=cd0Gp1x20P9Mw7cYRb83ofQFGuIztt4U9uVPCHpyoCk=; b=YHUecfniazlBvnwrzBOEOlyQs/QPtwj0MzBLDVnthE9EwhadDUxR5yyRsRDDAMhiihGROepq
 gRsK3Dcg/LmBMnrol//3EPlw0PthLLhVmg7RzeG4pOdD/7A5FCzGT+tzKkc24ARHmxnZioFr
 qAGwhyGbZ6SK8rIgddi7qSFhUPA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 606d5608c06dd10a2dfe2040 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 06:49:44
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D875EC43461; Wed,  7 Apr 2021 06:49:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.50.17.75] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E459CC43461;
        Wed,  7 Apr 2021 06:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E459CC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/2] nvmem: qfprom: Add support for fuse blowing on sc7280
To:     Doug Anderson <dianders@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>
References: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
 <1616651056-11844-2-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=VT6xUmUK7Kss8cpF1wjw9tLx67wJMtiV6yTDaVYXXrqA@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <758bab6a-834c-a83d-dada-813679202df8@codeaurora.org>
Date:   Wed, 7 Apr 2021 12:19:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VT6xUmUK7Kss8cpF1wjw9tLx67wJMtiV6yTDaVYXXrqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/31/2021 2:49 AM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 24, 2021 at 10:45 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> @@ -111,6 +113,15 @@ static const struct qfprom_soc_compatible_data sc7180_qfprom = {
>>          .nkeepout = ARRAY_SIZE(sc7180_qfprom_keepout)
>>   };
>>
>> +static const struct nvmem_keepout sc7280_qfprom_keepout[] = {
>> +       {.start = 0x128, .end = 0x148},
>> +       {.start = 0x238, .end = 0x248}
>> +};
>> +
>> +static const struct qfprom_soc_compatible_data sc7280_qfprom = {
>> +       .keepout = sc7280_qfprom_keepout,
>> +       .nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
>> +};
>>   /**
> 
> nit: blank line between structure and comment?
> 
> 
>> @@ -187,9 +199,9 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>>           * a rail shared do don't specify a max--regulator constraints
>>           * will handle.
>>           */
>> -       ret = regulator_set_voltage(priv->vcc, 1800000, INT_MAX);
>> +       ret = regulator_set_voltage(priv->vcc, qfprom_blow_uV, INT_MAX);
>>          if (ret) {
>> -               dev_err(priv->dev, "Failed to set 1.8 voltage\n");
>> +               dev_err(priv->dev, "Failed to set %duV\n", qfprom_blow_uV);
> 
> nit: the comment above this block (not in the unified diff)
> specifically calls out 1.8V. It'd be nice if you updated the comment
> since it's no longer fixed at 1.8V.
> 
> 
>> @@ -379,6 +399,8 @@ static int qfprom_probe(struct platform_device *pdev)
>>
>>                  if (major_version == 7 && minor_version == 8)
>>                          priv->soc_data = &qfprom_7_8_data;
>> +               if (major_version == 7 && minor_version == 15)
>> +                       priv->soc_data = &qfprom_7_15_data;
> 
> nit: "else if" instead of "if"?
> 
> 
> I guess I'm a little late since I think this already got applied, but
> all the above are nits. Maybe you could send a follow-up patch to
> address them?

Thanks Doug for the review, yes, I'll send a follow-up patch since
Srini already has these pulled in.
  

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
