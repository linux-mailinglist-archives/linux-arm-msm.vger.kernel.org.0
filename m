Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE979D8E33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 12:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389407AbfJPKnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 06:43:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36050 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389345AbfJPKnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 06:43:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7630160540; Wed, 16 Oct 2019 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571222588;
        bh=Gnx0VU9W9M2MKA7f69n4Pw5dV4fGPZ3KgNoNOQDCD8s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QGoMybTg6SSF1woDJvQLNmzZLLWK/T77+4ZJ3251sxIIyTnZBAvJcC8fXOA0uY1C3
         sttPgwqIUWLbkqsTMCvt3B+ZZ04mhVqVZulCo8Q4x/m9vXth/71Ipg9OQPqCZTzWGG
         7A04pNk5chTOjLDw4p70tdG5aeSgKlrUq/TFDoSg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.104] (unknown [183.83.146.112])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 218BF602C8;
        Wed, 16 Oct 2019 10:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571222588;
        bh=Gnx0VU9W9M2MKA7f69n4Pw5dV4fGPZ3KgNoNOQDCD8s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QGoMybTg6SSF1woDJvQLNmzZLLWK/T77+4ZJ3251sxIIyTnZBAvJcC8fXOA0uY1C3
         sttPgwqIUWLbkqsTMCvt3B+ZZ04mhVqVZulCo8Q4x/m9vXth/71Ipg9OQPqCZTzWGG
         7A04pNk5chTOjLDw4p70tdG5aeSgKlrUq/TFDoSg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 218BF602C8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Add minimal dts/dtsi files for
 SC7180 soc
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191015103358.17550-1-rnayak@codeaurora.org>
 <20191015103358.17550-2-rnayak@codeaurora.org>
 <20191016052535.GC2654@vkoul-mobl>
 <89225569-1cd3-ae0e-94ed-bbb2b3dd8e9c@codeaurora.org>
 <20191016082432.GL2654@vkoul-mobl>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <79b24548-dc69-b09d-55d2-6a370446abdf@codeaurora.org>
Date:   Wed, 16 Oct 2019 16:13:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016082432.GL2654@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>>>> +		xo_board: xo-board {
>>>> +			compatible = "fixed-clock";
>>>> +			clock-frequency = <38400000>;
>>>> +			clock-output-names = "xo_board";
>>>> +			#clock-cells = <0>;
>>>> +		};
>>>> +
>>>> +		sleep_clk: sleep-clk {
>>>> +			compatible = "fixed-clock";
>>>> +			clock-frequency = <32764>;
>>>> +			clock-output-names = "sleep_clk";
>>>> +			#clock-cells = <0>;
>>>> +		};
>>>> +
>>>> +		bi_tcxo: bi_tcxo {
>>>
>>> why is this a clock defined here? Isnt this gcc clock?
>>
>> This is a RPMH-controlled clock and not from GCC. It is the parent clock for
>> GCC RCGs/PLLs.
> 
> Yes right!
> 
>> Once the RPMH clock support is added these would be removed.
> 
> Wont it make sense to keep this bit not upstream and then remove that
> part when you have rpmh support available. Reduces the churn upstream!
> 
> The parent can be xo_board till then!
> 

The xo_board is 38.4MHz and bi_tcxo (xo/2), which needs to be updated 
anyways :).

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
