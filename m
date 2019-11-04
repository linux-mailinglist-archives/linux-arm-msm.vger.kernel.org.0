Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37600ED8CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfKDGEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:04:02 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38140 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:04:02 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 37EB960DCE; Mon,  4 Nov 2019 06:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847441;
        bh=pGTv1c4NOBFZSZjsl3GamDDncblUzkOWwBTPPKbZhAY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NkykMieci6YcTwqZuht53lhuNE541nGSUhfScMriq/E6azAa+NKok2DyK2ubWbNu5
         7rq8z5hVS99KmBHyeizhLWY0d8AXpYoypnIh4xgsgFxQIR+h4RafoPqZgDRPbety3Y
         JshjQnJfk93PVPWwmZai5c+kzdRrZNfJZrvWJbqI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A7E560DB2;
        Mon,  4 Nov 2019 06:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847440;
        bh=pGTv1c4NOBFZSZjsl3GamDDncblUzkOWwBTPPKbZhAY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KV3LxhECIFn6nXXpISfDCIufQyc6YUuhTxzE2+PfbGZYxoluxk7y9zErLq5lr7PYF
         0Xv4gZYK999QskZqey0mJz5DwMIdgB8cu9ARY23KOPgyX6d8hoe+a1B5UgIONUj5X9
         B9/ToHJ9p9RKh5bd6V6JDY4FjvJENPG4RetrMpg0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A7E560DB2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 01/11] dt-bindings: qcom: Add SC7180 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Vinod Koul <vkoul@kernel.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-2-rnayak@codeaurora.org> <20191025195039.GA21665@bogus>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <d9006004-39a0-54c6-63ad-882a7a059389@codeaurora.org>
Date:   Mon, 4 Nov 2019 11:33:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025195039.GA21665@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/26/2019 1:20 AM, Rob Herring wrote:
> On Wed, Oct 23, 2019 at 02:32:09PM +0530, Rajendra Nayak wrote:
>> Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
>> Also add a new board type 'idp'
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index e39d8f02e33c..0a60ea051541 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -36,6 +36,7 @@ description: |
>>     	mdm9615
>>     	ipq8074
>>     	sdm845
>> +  	sc7180
> 
> Where's the schema?

sorry, missed it, will add when I repost.

> 
>>   
>>     The 'board' element must be one of the following strings:
>>   
>> @@ -46,6 +47,7 @@ description: |
>>     	sbc
>>     	hk01
>>     	qrd
>> +  	idp
>>   
>>     The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
>>     where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
