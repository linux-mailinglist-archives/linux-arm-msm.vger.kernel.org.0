Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F202445B974
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 12:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241446AbhKXLu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 06:50:59 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:17574 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241376AbhKXLu4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 06:50:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637754467; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=sel6FYlXjz7lpG1vwn6XFSDBdi9veY/tw5eYYl8zy8E=; b=tCXdsng8gYlzhVSbgJG6PO2wBEwabdpXvXo5rB+aHYzpclTIQearXDEUHyS0hnIwwIfPmZQD
 WWeZ9c1+XHChw46pOzSNjLQ2RiwHBrkrhpgGLzcHLYLkVZF8uYOxScy3u617NL+f5pN5d6rq
 NugEdM5rTVX0WN3liyVyVIo/BNc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 619e26625daaeec7977619a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 11:47:46
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78519C43617; Wed, 24 Nov 2021 11:47:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39824C4338F;
        Wed, 24 Nov 2021 11:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 39824C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <87e79b0f-cc4c-e838-7e97-1bd837118ef0@codeaurora.org>
Date:   Wed, 24 Nov 2021 17:17:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document qcom,sc7280-crd
 board
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, kgodara@codeaurora.org
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
 <1637650813-16654-2-git-send-email-rnayak@codeaurora.org>
 <YZ0AZQDB6VPUAt8s@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
In-Reply-To: <YZ0AZQDB6VPUAt8s@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/23/2021 8:23 PM, Matthias Kaehlcke wrote:
> On Tue, Nov 23, 2021 at 12:30:10PM +0530, Rajendra Nayak wrote:
>> Document the qcom,sc7280-crd board based off sc7280 SoC,
>> The board is also known as hoglin in the Chrome OS builds,
>> and given there would be multiple (at least one more) rev
>> of this board document the google,hoglin-rev0 compatible as well.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index c8808e0..2abfd28 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -203,6 +203,8 @@ properties:
>>             - enum:
>>                 - qcom,sc7280-idp
>>                 - qcom,sc7280-idp2
>> +              - qcom,sc7280-crd
>> +              - google,hoglin-rev0
> 
> I think we also want the generic 'google,hoglin' compatible string, analogous to
> for example 'google,lazor' and 'google,lazor-revN'. For lazor there are no
> explicit compatible entries for rev3 and above, there were no DT relevant
> hardware changes for rev > 3, hence the 'google,lazor' compatible string is
> used, without the need to modify the DT for each new HW revision.
> 
> Also on my CRD the bootloader thinks it is running on a rev4:
> 
>    Compat preference: google,hoglin-rev4 google,hoglin
> 
> The board still boots thanks to the 'google,hoglin' entry in my device tree,
> but it seems you need to add more revN entries, or start with rev4 if you
> don't really care about supporting older revisions. In the later case you
> coul only have 'google,hoglin' for now, and add 'rev4' when you add support
> for the next revision (supposing it has DT relevant hardware changes). The
> sc7180-trogdor boards can serve as an example on how to deal with board
> revisions.

Sure, i think i will perhaps go with just the google,hoglin compatible
for now and add revs as and when needed, the fact that these boards have
a few initial revs not used at all seem to make it really confusing

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
