Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9527D1C612A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 21:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgEETij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 15:38:39 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:51476 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728584AbgEETii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 15:38:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588707518; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5+l4sTupj4Jx3BRxaz5t8PSJeiWtuJYsTLLLRfWD2L4=; b=cqgb5iGgg22rq8cW7hgNJImRXZbnBY5JdD1n4n9GJuKarDw87vqYMrbTCGbdpdPoV5YTeA11
 CNhsb1orO7LLOOYtBDf6Y3XuGCV+uvyvjc6hTvc/sSPVe8S0I4zc8Zy4ekzq9x1+Lb7o8ywg
 /zyanhW+ImOR9lfSbAQQpigjtHI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1c0b9.7f1f2605c228-smtp-out-n04;
 Tue, 05 May 2020 19:38:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F074CC43637; Tue,  5 May 2020 19:38:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.9.159] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43824C433D2;
        Tue,  5 May 2020 19:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43824C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v8 1/5] dt-bindings: phy: Add binding for
 qcom,usb-snps-femto-v2
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, vkoul@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org
References: <1588636467-23409-1-git-send-email-wcheng@codeaurora.org>
 <1588636467-23409-2-git-send-email-wcheng@codeaurora.org>
 <20200505133408.GA24731@bogus>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <d1b6c7f2-69d8-027d-267d-22018484441e@codeaurora.org>
Date:   Tue, 5 May 2020 12:38:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505133408.GA24731@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/5/2020 6:34 AM, Rob Herring wrote:
> On Mon,  4 May 2020 16:54:23 -0700, Wesley Cheng wrote:
>> This binding shows the descriptions and properties for the
>> Synopsis Femto USB PHY V2 used on QCOM platforms.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>> ---
>>  .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 77 ++++++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda-pll-supply' is a required property
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda18-supply' is a required property
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda33-supply' is a required property
> 
> See https://patchwork.ozlabs.org/patch/1283143
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Hi Rob,

I updated the dt-schema version, and I can see the same error.  Will fix
and resubmit.  I also realized that the dt_binding_check doesn't stop if
errors are detected in the example DT checking phase, and that was
probably why I missed this initially.  I'll pass the DT_SCHEMA_FILES
argument to my specific binding next time to help verify my file.
Thanks again!

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
