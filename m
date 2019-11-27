Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1BCF10A947
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 05:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfK0EGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Nov 2019 23:06:51 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:57010
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726525AbfK0EGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Nov 2019 23:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574827610;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=5ARwXEreVexfeHJvosDOjQ5dg3IjsVVnM3f/Nqmw6W0=;
        b=JCmQk2Z6dcatoaCXep4HC6AfnatpEIN49DnbxJHgxzw2GjQDkdHKdSm27WhVVOGV
        gzmXDtZZyRs8DIiemflHgONuIiKw63So+zAxixOoMBtl7u1XXdnKL16zhZT/NqD1Bkt
        VWaL93ZDp7BODCzUaAtNEqjv1l+WUjclvX44qYng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574827609;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=5ARwXEreVexfeHJvosDOjQ5dg3IjsVVnM3f/Nqmw6W0=;
        b=SDjJ1wxlm3fUlda1VoPEHzxNZTVBWKkrKLTYlqsZj5nbKYfXmitca2y1xFWTlnTV
        TDLsAXNBEMtm9NXdDYweOOqnQpUJ6CaTkEkTynTPWBjbmZYB6GqXuRHjZ+6hsb4xLLm
        MLXG2dzjp94r47aQooYygyvmywe9KtzaND7wOJ9A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57FA4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: Add YAML schemas for the QCOM
 GPUCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
 <1573812304-24074-4-git-send-email-tdas@codeaurora.org>
 <CAOCk7NqfHe6jRPmw6o650fyd6EyVfFObHhJ9=21ipuAqJo6oGA@mail.gmail.com>
 <20191126181154.275EA20727@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <0101016eab0a4e76-b8eb44c5-d076-46b9-a156-b80dc650ca31-000000@us-west-2.amazonses.com>
Date:   Wed, 27 Nov 2019 04:06:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126181154.275EA20727@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.27-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/26/2019 11:41 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-11-15 07:11:01)
>> On Fri, Nov 15, 2019 at 3:07 AM Taniya Das <tdas@codeaurora.org> wrote:
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>>> new file mode 100644
>>> index 0000000..c2d6243
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>>> @@ -0,0 +1,69 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Graphics Clock & Reset Controller Binding
>>> +
>>> +maintainers:
>>> +  - Taniya Das <tdas@codeaurora.org>
>>> +
>>> +description: |
>>> +  Qualcomm grpahics clock control module which supports the clocks, resets and
>>> +  power domains.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,msm8998-gpucc
>>> +      - qcom,sdm845-gpucc
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: GPLL0 source from GCC
>>
>> This is not an accurate conversion.  GPLL0 was not valid for 845, and
>> is required for 8998.
> 
> Thanks for checking Jeff.
> 
> It looks like on 845 there are two gpll0 clocks going to gpucc. From
> gpu_cc_parent_map_0:
> 
> 	"gcc_gpu_gpll0_clk_src",
> 	"gcc_gpu_gpll0_div_clk_src",
> 

There are branches of GPLL0 which would be connected to most external 
CCs. It is upto to the external CCs to either use them to source a 
frequency or not.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
