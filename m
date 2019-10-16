Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999DDD8A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391313AbfJPHxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:53:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48024 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfJPHxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:53:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B1BEE60ACF; Wed, 16 Oct 2019 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571212380;
        bh=B4BR77eewIz3s7+EglpvEI0AcW8SYIvXdSFzpWYfH3M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BjhPAYIIJFIgONI+muMr76SqIo8g2aX9X3qXv0KNg/DVzy5E2PRrNS/GRAT7Jrist
         Q8SIwfZUyfQLFHI3m2Awy5op9rPKA6pdYJA3JNZzwCWRWmOiDgXJjwAOt4Iv3CXROK
         yn5uH8uGaRger5WSWAeMckGbvPhyOq0bUel9oCME=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 943A060ACF;
        Wed, 16 Oct 2019 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571212380;
        bh=B4BR77eewIz3s7+EglpvEI0AcW8SYIvXdSFzpWYfH3M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BjhPAYIIJFIgONI+muMr76SqIo8g2aX9X3qXv0KNg/DVzy5E2PRrNS/GRAT7Jrist
         Q8SIwfZUyfQLFHI3m2Awy5op9rPKA6pdYJA3JNZzwCWRWmOiDgXJjwAOt4Iv3CXROK
         yn5uH8uGaRger5WSWAeMckGbvPhyOq0bUel9oCME=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 943A060ACF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Add minimal dts/dtsi files for
 SC7180 soc
To:     Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191015103358.17550-1-rnayak@codeaurora.org>
 <20191015103358.17550-2-rnayak@codeaurora.org>
 <20191016052535.GC2654@vkoul-mobl>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <89225569-1cd3-ae0e-94ed-bbb2b3dd8e9c@codeaurora.org>
Date:   Wed, 16 Oct 2019 13:22:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016052535.GC2654@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 10/16/2019 10:55 AM, Vinod Koul wrote:
> On 15-10-19, 16:03, Rajendra Nayak wrote:
> 
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +
>> +	clocks {
> 
> Can we have these sorted alphabetically please
> 
>> +		xo_board: xo-board {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			clock-output-names = "xo_board";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32764>;
>> +			clock-output-names = "sleep_clk";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bi_tcxo: bi_tcxo {
> 
> why is this a clock defined here? Isnt this gcc clock?
> 

This is a RPMH-controlled clock and not from GCC. It is the parent clock 
for GCC RCGs/PLLs.

Once the RPMH clock support is added these would be removed.


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
