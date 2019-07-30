Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26047A643
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 12:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729766AbfG3KuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 06:50:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59830 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729654AbfG3KuO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 06:50:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3BF34602AE; Tue, 30 Jul 2019 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564483813;
        bh=+38mSgtNrHMOEj2u+X8QzEM2e+ZEFZCoBdmlqto1Vo4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XM26NBcTqaldIgG3hSOe769SIfH2RgNHY2IhVylrQlHp0coA5d0L3tBO/ndivPYSv
         hs7Sahg6r+eCjsrXyiZwlEGZeyqO+nhWDkmQN1MCPTr1CeuRDRJFqd5qRlN8zxOAF/
         75VkcAbMi+BWZsKtFAAPjHwvjm3cv7KMYCpSySnc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 140CA602AE;
        Tue, 30 Jul 2019 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564483812;
        bh=+38mSgtNrHMOEj2u+X8QzEM2e+ZEFZCoBdmlqto1Vo4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LPtChlWo9Nsg3dBjNg0AHiAdNWM9epRApgvWSfcYSjbe7mKaOtneTLK/2pHH3lrBZ
         1b4Od9bA8kPv0skxHC10CkLGQdYOlMGWGZ31h9wUSla7w1Puq9CKWVGe2pEfixSLFC
         HmkudXP/O0BTxuL5Kp/HniVimA/TduJ+JVOUfzms=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 140CA602AE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 2/3] clk: qcom: rcg2: Add support for hardware control
 mode
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
 <1557339895-21952-3-git-send-email-tdas@codeaurora.org>
 <20190715225219.B684820665@mail.kernel.org>
 <916e2fb3-98b9-c4e3-50e0-3581a41609d6@codeaurora.org>
 <20190716231845.832F82064B@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <2bb31636-e7de-50e6-b4fb-826b6e7e7c04@codeaurora.org>
Date:   Tue, 30 Jul 2019 16:20:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716231845.832F82064B@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

On 7/17/2019 4:48 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-07-15 21:19:02)
>> Hello Stephen,
>>
>> Thanks for your review.
>>
>> On 7/16/2019 4:22 AM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2019-05-08 11:24:54)
>>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>>>> index 57dbac9..5bb6d45 100644
>>>> --- a/drivers/clk/qcom/clk-rcg2.c
>>>> +++ b/drivers/clk/qcom/clk-rcg2.c
>>>> @@ -289,6 +289,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
>>>>           cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>>>>           if (rcg->mnd_width && f->n && (f->m != f->n))
>>>>                   cfg |= CFG_MODE_DUAL_EDGE;
>>>> +       if (rcg->flags & HW_CLK_CTRL_MODE)
>>>> +               cfg |= CFG_HW_CLK_CTRL_MASK;
>>>> +
>>>
>>> Above this we have commit bdc3bbdd40ba ("clk: qcom: Clear hardware clock
>>> control bit of RCG") that clears this bit. Is it possible to always set
>>> this bit and then have an override flag used in sdm845 that says to
>>> _not_ set this bit? Presumably on earlier platforms writing the bit is a
>>> no-op so it's safe to write the bit on those platforms.
>>>
>>> This way, if it's going to be the default we can avoid setting the flag
>>> and only set the flag on older platforms where it shouldn't be done for
>>> some reason.
>>>
>>
>> Not all the subsystem clock controllers might have this hardware control
>> bit set from design. Thus we want to set them based on the flag.
> 
> Yes but what's the percentage of clks that are going to set this flag
> vs. not set this flag? If that is low right now then it's fine but if it
> eventually becomes the standard mechanism it will be easier to opt-out
> of the feature if necessary instead of opt-in.
> 

Currently all the RCGs in GCC need to clear the bit and few RCGs from
the other CCs(DISPCC/VIDEOCC) where the bit is not set from HW requires 
this bit to be set. Thus we want to use this flag mechanism to have the 
flexibility to set.

Once it is a standard we could cleanup to remove this.



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
