Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37BD1857EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 02:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgCOBtu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Mar 2020 21:49:50 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13505 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726882AbgCOBtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Mar 2020 21:49:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584236989; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VXbg0PkR8DzxPJz/MiykCW0CnZd/L0YGnzp2Lz0Y0eE=; b=SChe60AvBUtzNigcRe8JmMEL0DPvIHBsyM8nG/yiRXmVyHyFUFl3cQNznxDy4976b1CBnJU9
 pc8NQIQgNW4QGScuPfuz+nzdrhYhD9i8IhHQftKdG/Gl7vv8e4SYLJvkAy9o5edU0hXVCYey
 CYvePUitE9Kr+ldK3vFwfzCdcgY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6d268b.7fb83f309a40-smtp-out-n01;
 Sat, 14 Mar 2020 18:46:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6AE8FC432C2; Sat, 14 Mar 2020 18:46:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.82.137.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1366FC433CB;
        Sat, 14 Mar 2020 18:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1366FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
 <1582540703-6328-4-git-send-email-tdas@codeaurora.org>
 <20200224184201.GA6030@bogus>
 <eec22330-2bf4-f4f5-3d28-6b69aa71f992@codeaurora.org>
 <CAL_JsqKRr3aOpcbPOtkArxnnJOBd-XaUGRVesR_CnA11pFHYXQ@mail.gmail.com>
 <158267707817.177367.4165827948994155128@swboyd.mtv.corp.google.com>
 <CAL_JsqJiB08vtDKP18Xzdzan-2TFVxJJ-rFgvXsqVHKB5-L18g@mail.gmail.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <888d1371-2eea-1cf2-5633-715fb047bbbb@codeaurora.org>
Date:   Sun, 15 Mar 2020 00:16:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJiB08vtDKP18Xzdzan-2TFVxJJ-rFgvXsqVHKB5-L18g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I have combined all the bindings in the same patch to avoid any YAML 
dependency.

On 2/26/2020 7:40 PM, Rob Herring wrote:
> On Tue, Feb 25, 2020 at 6:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
>>
>> Quoting Rob Herring (2020-02-25 05:58:19)
>>> On Mon, Feb 24, 2020 at 11:49 PM Taniya Das <tdas@codeaurora.org> wrote:
>>>>
>>>> Hi Rob,
>>>>
>>>> On 2/25/2020 12:12 AM, Rob Herring wrote:
>>>>
>>>>>
>>>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>>>
>>>>> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
>>>>> Error: Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 syntax error
>>>>> FATAL ERROR: Unable to parse input tree
>>>>> scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' failed
>>>>> make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] Error 1
>>>>> Makefile:1263: recipe for target 'dt_binding_check' failed
>>>>> make: *** [dt_binding_check] Error 2
>>>>>
>>>>> See https://patchwork.ozlabs.org/patch/1242999
>>>>> Please check and re-submit.
>>>>>
>>>>
>>>> The error shows syntax error at line 21, below is the example.dts from
>>>> my tree and would compile for me as I have the dependency of the include
>>>> file when I compile.
>>>
>>> The header should be part of this patch if possible.
>>>
>>
>> Are patches tested in isolation instead of in series? I see this define
>> in the first patch in this series so it seems like automated checkers
>> should be able to apply the patches in series and see if they still
>> work, unless that is broken somehow.
> 
> The series should be applied, but it's all very fragile. It's going to
> stay that way until someone else writes and maintains the applying
> patches to git logic.
> 
> In any case, the header is part of the binding (being an ABI) not the
> driver, so it belongs in the binding patch.
> 
> 
> However, in this case, the problem was pointed out in v4 to be a typo
> in GCC_MSS_MFAB_AXIS_CLK.
> 
> Rob
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
