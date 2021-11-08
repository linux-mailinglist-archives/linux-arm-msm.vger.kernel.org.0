Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0AF447B33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 08:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhKHHip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 02:38:45 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:17434 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhKHHio (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 02:38:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636356961; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=l9kiI4uHR2rmwPsreo+RrcGqVZDlNXEReTYLuPyDcGk=; b=YGHtNS6ONlMZO0TobcuVFC7OV9gMaX/MizjSM+YxUK1shFABDiAvAnnBTQZggRk3gkcGxxs3
 knt4yKZpBIGjwSZvRI60oaE5Q6PbIkLoRhK/o16StzrLtjEJkh1+nNvtKS0UvD5vBBff0cKU
 giGyNJsPl1UjitJnffwwIfh3uaQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6188d35613b75473b272f5dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 07:35:50
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60685C43617; Mon,  8 Nov 2021 07:35:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 564D5C4338F;
        Mon,  8 Nov 2021 07:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 564D5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        "Gross, Andy" <agross@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Patrick Lai <plai@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
 <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
 <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <b1f2280a-b349-6862-c6e1-f74a5584c9bc@codeaurora.org>
Date:   Mon, 8 Nov 2021 13:05:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/6/2021 7:00 AM, Rob Herring wrote:
Thanks for Your time Rob!!!
> On Tue, Nov 2, 2021 at 5:57 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>>
>> On 10/30/2021 12:37 AM, Stephen Boyd wrote:
>> Thanks for Your time Stephen!!!
>>> Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
>>>> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>>> new file mode 100644
>>>> index 0000000..3a781c8
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>>> @@ -0,0 +1,170 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Google SC7280-Herobrine ASoC sound card driver
>>>> +
>>>> +maintainers:
>>>> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> +  - Judy Hsiao <judyhsiao@chromium.org>
>>>> +
>>>> +description:
>>>> +  This binding describes the SC7280 sound card which uses LPASS for audio.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - google,sc7280-herobrine
>>>> +
>>>> +  audio-routing:
>>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>>> +    description:
>>>> +      A list of the connections between audio components. Each entry is a
>>>> +      pair of strings, the first being the connection's sink, the second
>>>> +      being the connection's source.
>>>> +
>>>> +  model:
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    description: User specified audio sound card name
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +patternProperties:
>>>> +  "^dai-link@[0-9a-f]$":
>>>> +    description:
>>>> +      Each subnode represents a dai link. Subnodes of each dai links would be
>>>> +      cpu/codec dais.
>>>> +
>>>> +    type: object
>>>> +
>>>> +    properties:
>>>> +      link-name:
>>>> +        description: Indicates dai-link name and PCM stream name.
>>>> +        $ref: /schemas/types.yaml#/definitions/string
>>>> +        maxItems: 1
>>>> +
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description: dai link address.
>>>> +
>>>> +      cpu:
>>>> +        description: Holds subnode which indicates cpu dai.
>>>> +        type: object
>>>> +        properties:
>>>> +          sound-dai: true
>>> Is sound-dai required? And additionalProperties is false? I think we
>>> need that yet again.
>> Okay. Will mark additionalPropertiesas true.
> 'additiionalProperties: true' is almost never right. It's generally
> only correct for schemas that are incomplete collections of
> properties.
>
> Rob

As per Stephen Suggestion. thought it's a solution.

The sound-dai required here, and same is fallowed in SC7180 machine 
driver bindings.

Could You please suggest better approach on this?


-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

