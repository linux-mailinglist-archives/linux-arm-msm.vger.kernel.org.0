Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A804C404499
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 06:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350500AbhIIErg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 00:47:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63864 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350443AbhIIErc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 00:47:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631162784; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2aiD8EVkn8rCQHehlY7lNToGb+2zc8QVGnMllSyftjI=;
 b=liElcdV2t+vhKp2ufosuZnJymzB2RUuskWZTZmyE0tL9TZDQkQdUlhN9kF4lAIfwv0woavJn
 aMwDZesIqMoBOFMOQ+/cvBdBIrUSO3TcQyY5qClDZMioe5hkpOeobRPl9JIIpKLbh1c8x1nf
 ZDUbun+3Sf3oaWeqqjSaZFZX2Aw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6139918ce34848cb6aa98c84 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 04:46:04
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0F32C4360D; Thu,  9 Sep 2021 04:46:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2171CC4338F;
        Thu,  9 Sep 2021 04:46:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Sep 2021 10:16:04 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, dianders@chromium.org
Subject: Re: [PATCH V7 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <YTJOU/oVWSdxD1uz@google.com>
References: <1630643340-10373-1-git-send-email-rajpat@codeaurora.org>
 <1630643340-10373-4-git-send-email-rajpat@codeaurora.org>
 <YTJOU/oVWSdxD1uz@google.com>
Message-ID: <bfdccfc2e4362218fc8099dfe566bc1d@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-03 22:03, Matthias Kaehlcke wrote:
> On Fri, Sep 03, 2021 at 09:58:56AM +0530, Rajesh Patil wrote:
>> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> 
>> Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 684 
>> ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 682 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 7ec9871..5c6a1d7 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> 
>> ...
>> 
>> +			qup_spi0_data_clk: qup-spi0-data-clk {
>> +				pins = "gpio0", "gpio1", "gpio2";
>> +				function = "qup00";
>> +			};
>> +
>> +			qup_spi0_cs: qup-spi0-cs {
>> +				pins = "gpio3";
>> +				function = "qup00";
>> +			};
> 
> 
> I think we still want this for all SPI ports, which existed in previous
> versions:
> 
> 			qup_spi0_cs_gpio: qup-spi0-cs-gpio {
> 				pins = "gpio3";
> 				function = "gpio";
> 			};
> 
> It just shouldn't be selected together with 'qup_spiN_cs'.
> 
> Maybe a follow up patch would be good enough, so:
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>


ok.shall we add qup_spiN_cs_gpio for all spi ports
