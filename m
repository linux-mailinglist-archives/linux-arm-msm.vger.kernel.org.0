Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33011ED8C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfKDGDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:03:20 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37912 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:03:20 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 98BCF60931; Mon,  4 Nov 2019 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847399;
        bh=6qpLotxB72KIT+flkVzVeUM51hBOy5wrXmPAI/7+OOY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=F3LvIJsL1SNzPUmEBqB23s4Lf1Lm1LziS3wKOtGHNqkFPwVCPKs6bLvj5H2DTOEFK
         E1ejiENwCrsqCN6+qcMT3Nfk3oHrRNNKS9wWwRSR31FJb6Ca8P50LuGxcrCJ5hfOC7
         5rPCx/x+3W90Bh8N8j2B129OpqUZIaJ1I97DEDoY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CE1D360931;
        Mon,  4 Nov 2019 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847398;
        bh=6qpLotxB72KIT+flkVzVeUM51hBOy5wrXmPAI/7+OOY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nyFLK0xcoKMok6XVbxJG567R+nFNWV9oBTj48igpubc4A0LBYaGmWC6hUEsl3qZWF
         +5pvzZ/hwj7v9AAcHsz0j5wc26ygzJND/F9DUeqaQs3GrYDV3tbn+fWxSLzi3GEg4H
         /MWRSZP+ybqkLvA2WGwQIMSryUKlho2a3bq/SN1g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CE1D360931
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <20191025194730.GM20212@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <cb7c4ce2-2ea6-0e71-36a6-7b0a489f06c3@codeaurora.org>
Date:   Mon, 4 Nov 2019 11:33:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025194730.GM20212@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/26/2019 1:17 AM, Matthias Kaehlcke wrote:
> Hi Rajendra/Maulik,
> 
> On Wed, Oct 23, 2019 at 02:32:19PM +0530, Rajendra Nayak wrote:
>> From: Maulik Shah <mkshah@codeaurora.org>
>>
>> Add pdc interrupt controller for sc7180
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>> v3:
>> Used the qcom,sdm845-pdc compatible for pdc node
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index f2981ada578f..07ea393c2b5f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -184,6 +184,16 @@
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		pdc: interrupt-controller@b220000 {
> 
> Aren't the nodes supposed to be ordered by address as for SDM845?
> If so this node should be added after 'qupv3_id_1: geniqup@ac0000',
> not before.

yes, indeed. my sorting seems to have gone wrong. Will fix and repost.
thanks

> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
