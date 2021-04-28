Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6982836D712
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 14:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhD1MO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 08:14:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55455 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229645AbhD1MO4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 08:14:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619612051; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=itp3bO0rSXlRMnGotgyM/EUgRDm0AtM7sGQbojFcAGA=;
 b=M45fa1E1fjj9EXL0nisDeaHlRs93TKNiMs9gWoU/bmRF+IW+RkdAZ6bAL6RRP794HqFq+aTF
 2QgIOiRFTF2og+xC1rh+DlMz594os+hS800XgAX50GAomiiXK2whsCpE3b1rR2rLTVE5MStG
 ffkDZDSQbQkxpruB+dH4ZbvbiMA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6089517c74f773a664ac27ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 12:13:48
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BED7DC43460; Wed, 28 Apr 2021 12:13:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6ED9FC433F1;
        Wed, 28 Apr 2021 12:13:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 17:43:46 +0530
From:   dikshita@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     andy.gross@linaro.org, vgarodia@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org
Subject: Re: [PATCH] dt-bindings: media: venus: Add sc7280 dt schema
In-Reply-To: <1619471083.458228.4086059.nullmailer@robh.at.kernel.org>
References: <1619432515-9060-1-git-send-email-dikshita@codeaurora.org>
 <1619471083.458228.4086059.nullmailer@robh.at.kernel.org>
Message-ID: <d41482571e1ec6326d3f3ad665f18c81@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,
Thanks for your comment.

Actually, this change depends on 
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=473809
which adds the file dt-bindings/clock/qcom,videocc-sc7280.h (v2 5/6)
Missed adding the dependency in commit text.

Thanks,
Dikshita

On 2021-04-27 02:34, Rob Herring wrote:
> On Mon, 26 Apr 2021 15:51:55 +0530, Dikshita Agarwal wrote:
>> Add a schema description for the venus video encoder/decoder on the 
>> sc7280.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  .../bindings/media/qcom,sc7280-venus.yaml          | 158 
>> +++++++++++++++++++++
>>  1 file changed, 158 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dts:19:18:
> fatal error: dt-bindings/clock/qcom,videocc-sc7280.h: No such file or
> directory
>    19 |         #include <dt-bindings/clock/qcom,videocc-sc7280.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:377:
> Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dt.yaml]
> Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1414: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1470241
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
