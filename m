Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961731A4CFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 02:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDKAuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 20:50:23 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55251 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726757AbgDKAuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 20:50:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586566222; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SB4GqjxTYxSwE2Jrbaeh5PW7vM2AAVJ1/jWY1f7zthg=; b=fW5dQ1tM4zQweMCaSiVZukKRSlxwQ1jZCqQh4PiGgn8knFWyClFABLTQrFtLw2YngXsc3t1i
 vk4UTagTP9C4Jfy4hBH8naHOTo+m6fSOjjNfgs4sV6DLk1YmfHmclaRFRmWgF2184wxiCMex
 jJZyKVxktNSHGBSEO4ZH03BhliY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e911444.7f050544c3b0-smtp-out-n05;
 Sat, 11 Apr 2020 00:50:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7B13BC432C2; Sat, 11 Apr 2020 00:50:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.2.190] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22BA1C433CB;
        Sat, 11 Apr 2020 00:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22BA1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8150: Add USB and PHY device
 nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Jack Pham <jackp@codeaurora.org>
References: <1586298267-4722-1-git-send-email-wcheng@codeaurora.org>
 <1586298267-4722-3-git-send-email-wcheng@codeaurora.org>
 <20200407233848.GN20625@builder.lan>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <b54f9190-78c9-5b6a-932c-ad2b7b4444f3@codeaurora.org>
Date:   Fri, 10 Apr 2020 17:50:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407233848.GN20625@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/7/2020 4:38 PM, Bjorn Andersson wrote:
> On Tue 07 Apr 15:24 PDT 2020, Wesley Cheng wrote:
> 
>> From: Jack Pham <jackp@codeaurora.org>
>>
>> Add device nodes for the USB3 controller, QMP SS PHY and
>> SNPS HS PHY.
>>
> 
> Thanks for the respin Wesley, and thanks for testing Vinod. Just spotted
> one little details below.
> 
>> Signed-off-by: Jack Pham <jackp@codeaurora.org>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Tested-by: Vinod Koul <vinod.koul@linaro.org>
>> ---
> 
> Please make a habit of documenting what changed since the previous
> version here, below the ---.
> 
>>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 21 ++++++++
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 92 +++++++++++++++++++++++++++++++++
>>  2 files changed, 113 insertions(+)
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> [..]
>> +		usb_1_hsphy: phy@88e2000 {
>> +			compatible = "qcom,usb-snps-hs-7nm-phy",
>> +							"qcom,sm8150-usb-hs-phy";
> [..]
>> +		usb_1: usb@a6f8800 {
>> +			compatible = "qcom,sdm845-dwc3", "qcom,dwc3";
> 
> The first cell here should be qcom,sm8150-dwc3. The Linux driver will
> "fall through" and match on the less specific "qcom,dwc3", but if we in
> the future realize that we have sm8150 specific behavior/quirks we can
> make the driver match on the more specific one to implement this.
> 
> And similarly the order of the compatibles in &usb_1_hsphy should be
> reversed as well.
> 
> Regards,
> Bjorn
> 

Hi Bjorn,

Thanks for the input.  Will do that and re-submit v4.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
