Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBDA67394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 18:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfGLQtf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 12:49:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50146 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfGLQte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 12:49:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2763B60A4E; Fri, 12 Jul 2019 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562950174;
        bh=b1svF/gTguro1nK1BVoRt1d04OC7/a9WZZ0GYcXlh8Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oHQbmGmHLU25x9yoH6gar5agOqbHYYwLbTBTI7AnUFQ539bfMmqzyvxMQ9X5JSY1f
         XcEudci5ZxW5guTKNvJo0dX9Yy2LtzCIOMpqpmacIxekLYt6l2qHCeAGTLZGtszkek
         90vAhuwQbyUgp6TlnpCO3rblvYOYYTXSCUSDPNag=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 33FC960213;
        Fri, 12 Jul 2019 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562950173;
        bh=b1svF/gTguro1nK1BVoRt1d04OC7/a9WZZ0GYcXlh8Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z26V7meMV9wSWGr9zlpTxsWeTq+y5Z9D7WaIEAdBJkpsc7uQntNv+ZZNhYirWM+lS
         5ya4cgcn3AFDmiWO2TBF2ZIl58c0kAHecFjXowk2W7RJT7fm4lmJqQNP9c7M7IALtg
         ws8Dk7oOQzCd68ZquBweSEHPNux2Hzq67xFtFk/E=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 12 Jul 2019 22:19:33 +0530
From:   saiprakash.ranjan@codeaurora.org
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     gregkh@linuxfoundation.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        david.brown@linaro.org, mark.rutland@arm.com,
        rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr, devicetree-owner@vger.kernel.org
Subject: Re: [PATCHv8 1/5] arm64: dts: qcom: sdm845: Add Coresight support
In-Reply-To: <06c1a087-53f7-4841-1ae3-07ccbed22a72@arm.com>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <52550ed9bbc10dca860eb1700aef5c97f644327b.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <06c1a087-53f7-4841-1ae3-07ccbed22a72@arm.com>
Message-ID: <8b82793e7b693dbb922ef4fdbffdb76f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2019-07-12 22:14, Suzuki K Poulose wrote:
> Hi Sai,
> 
> On 12/07/2019 15:16, Sai Prakash Ranjan wrote:
>> Add coresight components found on Qualcomm SDM845 SoC.
> 
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 451 
>> +++++++++++++++++++++++++++
>>   1 file changed, 451 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi 
>> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 4babff5f19b5..5d7e3f8e0f91 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -1815,6 +1815,457 @@
>>   			clock-names = "xo";
>>   		};
>>   +		stm@6002000 {
>> +			compatible = "arm,coresight-stm", "arm,primecell";
>> +			reg = <0 0x06002000 0 0x1000>,
>> +			      <0 0x16280000 0 0x180000>;
>> +			reg-names = "stm-base", "stm-stimulus-base";
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
> 
> 
> Which tree is this based on ? I can't see aoss_qmp anywhere under 
> dts/qcom
> on 5.2-rc7.
> 

It's based on linux-next.

Thanks,
Sai
