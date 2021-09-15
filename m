Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F5940BE65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 05:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbhIODpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 23:45:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57015 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236207AbhIODpf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 23:45:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631677457; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=un4+OahdUMsVUVi8/7ow3BxZ9Gz3YZpgJT4xqgBMLNA=; b=XU+ejRf0DJ4QXbS6cUd8laDfu1y2FdPDuy30zYhrTaH0VfC+elBeLQAYtRsrjfKcf4hk5McE
 xh6u38UgadfReU/a7mnq5Rd9ZPEmwwXAj4sYIJmF2OlaoOymkP0rXSZfpt44GQoy7UCi1NZB
 W+lYODZUoDVbkXad/2V5hkM6Dtc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61416c10c1b30e2f02721a63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Sep 2021 03:44:16
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D2168C4361A; Wed, 15 Sep 2021 03:44:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.165.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09F8EC4338F;
        Wed, 15 Sep 2021 03:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 09F8EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Gross, Andy" <agross@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        judyhsiao@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Stephen Boyd <swboyd@chromium.org>,
        Patrick Lai <plai@codeaurora.org>
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
 <1631190773.288819.200339.nullmailer@robh.at.kernel.org>
 <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
 <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <d98087ad-31d9-c378-9718-08ac7df20c90@codeaurora.org>
Date:   Wed, 15 Sep 2021 09:14:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/14/2021 6:23 PM, Rob Herring wrote:
> On Mon, Sep 13, 2021 at 3:20 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> Thanks for info Rob!!!.
> Don't top-post on maillists.
Okay. Will take care from Next time.
>
>> This error is due to missing dependency
>> patch.(https://patchwork.kernel.org/project/alsa-devel/list/?series=543829)
>>
>> Could You Please check with the above patch applied?
> No. How is a script supposed to handle that?
>
> Where have you noted the dependency in the patch? Without that, I
> assume you just didn't run 'make dt_binding_check' and the maintainer
> doesn't know to check that the dependency is applied.
>
> Rob
Included dependency list in cover letter. Will include in this patch 
next time.
>>
>> On 9/9/2021 6:02 PM, Rob Herring wrote:
>>> On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
>>>> Add devicetree bindings documentation file for sc7280 sound card
>>>> registration.
>>>>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>    .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
>>>>    1 file changed, 169 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>> make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> make: *** [Makefile:1438: dt_binding_check] Error 2
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/patch/1525980
>>>
>>> This check can fail if there are any dependencies. The base for a patch
>>> series is generally the most recent rc1.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit.
>>>
>> --
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

