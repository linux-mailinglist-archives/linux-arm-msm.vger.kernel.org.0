Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9606CB99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 11:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfGRJOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 05:14:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56714 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbfGRJOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 05:14:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6528B611DC; Thu, 18 Jul 2019 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563441253;
        bh=VhDyfrl5HF7LGKh1nzpDD9O11fTQif36TkBw/IKiH5Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OVL3O3jIY5WcsCb/ZP/hpi5L6lTZWXe7BdNfgZalajMwCXDNyBeKYQiDM1uq5pI6K
         iear6cz7SIpDlGprULiWjQXaHVEf9H8/g3eOCYj1UqMxuLA6tA+kv9DghqfxMUrPGx
         sNjjEdbYJ7FyxZiu86XBqs4P1D8lgppftVz1g0ow=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.47] (unknown [157.49.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CC8260E3F;
        Thu, 18 Jul 2019 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563441252;
        bh=VhDyfrl5HF7LGKh1nzpDD9O11fTQif36TkBw/IKiH5Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AQVPQaTiOnZUezDn0KluvVO5TaRPiYrHEJ9e7Y+Tb+9Wod7o7Gsy6ivk8Af2gZN8x
         4fFxU233qf5HYgKxRlsqZTAHNyBUXL9GIOG/DCV8oxn7gACXq2TkWFEntxLMat/5B+
         ZSBTJTvitkcHsFJquUNqv6mmpH4hfX1HqD/uIiII=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7CC8260E3F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv8 2/5] arm64: dts: qcom: msm8998: Add Coresight support
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        gregkh@linuxfoundation.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <4854b0f7-6a81-bc87-3e63-d2b7c68a44f6@codeaurora.org>
Date:   Thu, 18 Jul 2019 14:44:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 7/18/2019 1:58 PM, Suzuki K Poulose wrote:
> Hi Sai,
> 
> 
>          etr@6048000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +            reg = <0x06048000 0x1000>;
>> +
>> +            clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc 
>> RPM_SMD_QDSS_A_CLK>;
>> +            clock-names = "apb_pclk", "atclk";
>> +            arm,scatter-gather;
> 
> Please could you confirm that you have tested the scatter-gather mode 
> with ETR ? Either via perf/sysfs. Please could you share your results ? 
> Unless verified
> this is going to be fatal for the system.
> 
> Similarly for other platforms.
> 

Yes I have tested with scatter-gather mode with ETR on all platforms
which I have posted via sysfs(not perf) before on previous versions of 
this patch series and no issues were found. And I suppose this was
discussed in v2 of this patch series [1].

As said in one of the series initially [1], QCOM msm downstream kernels 
have been using scatter gather mode and we haven't seen any fatal issues.

[1] https://patchwork.kernel.org/patch/10769535/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
