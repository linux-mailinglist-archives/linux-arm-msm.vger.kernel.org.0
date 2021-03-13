Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445B1339BCF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 05:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbhCMEmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 23:42:02 -0500
Received: from z11.mailgun.us ([104.130.96.11]:23560 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232802AbhCMEld (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 23:41:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615610493; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JkdTNgdamw++aL3tSNR4nhc7QhgaKM6pDACDWc2KaLg=; b=ZKOEFI+ULu0TQNW905Kr5O+Y9YUHwYMxoucUyIOtqcVlDehFRKfX3AOs61PvBY1hyzxS5YP5
 e/ZCIwmuINHrEaBbT+LC4oacte5ujEPuBlwmOeyxdNadLInF5QFwAtlL0tY+rMTGDKjGgeen
 cxI+n0n3SylUBj22zoQ8NWjilpU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 604c427a1de5dd7b998301e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 13 Mar 2021 04:41:30
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DE6CC43461; Sat, 13 Mar 2021 04:41:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.154.253])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FFB0C433CA;
        Sat, 13 Mar 2021 04:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FFB0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for I2S driver
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <20210312160622.24165-1-srivasam@codeaurora.org>
 <20210312160622.24165-2-srivasam@codeaurora.org>
 <CAD=FV=UmLh+RBucrcW=Y3HgD-E4g9vAEK-G4Aj0enszETwBciA@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <ecb24bcb-aa63-2865-15d9-7dc2849d4915@codeaurora.org>
Date:   Sat, 13 Mar 2021 10:11:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UmLh+RBucrcW=Y3HgD-E4g9vAEK-G4Aj0enszETwBciA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thanks for your time and inputs!!!

On 3/13/2021 2:58 AM, Doug Anderson wrote:
> Hi,
>
> On Fri, Mar 12, 2021 at 8:06 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> +               dai-link@0 {
>> +                       link-name = "MultiMedia0";
>> +                       reg = <MI2S_PRIMARY>;
>> +                       cpu {
>> +                               sound-dai = <&lpass_cpu MI2S_PRIMARY>;
>> +                       };
>> +
>> +                       multimedia0_codec: codec {
>> +                               sound-dai = <&alc5682 MI2S_PRIMARY>;
> Please change "MI2S_PRIMARY" to "0". "MI2S_PRIMARY" is a numbering
> system for "lpass_cpu" not for "alc5682". I'm not aware of symbolic
> names for the alc5682's DAIs.
>
>  From digging through the code and testing, it appears that for alc5682:
> 0 - aif1
> 1 - aif2
>
> Thus you could be a little more documenting by doing:
>
> sound-dai = <&alc5682 0 /*aif1*/>;
>
> -Doug
Okay, I will change accordingly.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

