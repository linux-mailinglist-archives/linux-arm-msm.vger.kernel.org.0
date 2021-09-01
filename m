Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5225F3FD42F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 09:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242425AbhIAHIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 03:08:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62047 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242414AbhIAHIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 03:08:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630480029; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=L22obe0p898qJXX0hILjMKUiF4qgcHKEEeB63dfBMRY=;
 b=P0UrGUdwm3hTDsNqu/jMkQUJJjjhjtfZ7gBFeLWhJdFRZzVWICExRwwcFtj/IWmLY06KXfdO
 u7IuGWF3ZkYRMQtp6LDw6TAPh6c5rRrtVIGUgacU5n9xNGURhkwdRPQrPUqWK0k8zpPeheIl
 gN3N7qzv9U7lgn6a35YSwV3P0/Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 612f26924d644b7d1c412266 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Sep 2021 07:06:58
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 912D8C4360C; Wed,  1 Sep 2021 07:06:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4F5CC4338F;
        Wed,  1 Sep 2021 07:06:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 01 Sep 2021 12:36:57 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, dianders@chromium.org
Subject: Re: [PATCH V5 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <YSfwxuX22Ix4fqX2@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-4-git-send-email-rajpat@codeaurora.org>
 <YRUsr6x9vqvaBB9i@google.com>
 <114d7419b0a85fcacf775cc34f279f0e@codeaurora.org>
 <YSfwxuX22Ix4fqX2@google.com>
Message-ID: <c34a664d9f88d29013ed31e398729640@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-27 01:21, Matthias Kaehlcke wrote:
> On Thu, Aug 26, 2021 at 06:37:02PM +0530, rajpat@codeaurora.org wrote:
>> On 2021-08-12 19:44, Matthias Kaehlcke wrote:
>> > On Thu, Aug 12, 2021 at 01:11:14PM +0530, Rajesh Patil wrote:
>> > > From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> > >
>> > > Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
>> > >
>> > > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> > > ---
>> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 720
>> > > +++++++++++++++++++++++++++++++++++
>> > >  1 file changed, 720 insertions(+)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > index f8dd5ff..e461395 100644
>> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > >
>> > > ...
>> > >
>> > > +			spi0: spi@980000 {
>> > > +				compatible = "qcom,geni-spi";
>> > > +				reg = <0 0x00980000 0 0x4000>;
>> > > +				clock-names = "se";
>> > > +				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
>> > > +				pinctrl-names = "default";
>> > > +				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>,
>> > > <&qup_spi0_cs_gpio>;
>> >
>> > What is the story behind 'qup_spiN_cs' and 'qup_spiN_cs_gpio'? Both
>> > configure
>> > the CS pin with a different function:
>> >
>> 
>> As per discussion here [1], we have split like this.
>> 
>> [1] https://lore.kernel.org/patchwork/patch/1393353/#1591826
> 
> IIUC that's only about having separate configs for each pin, instead of
> groups like 'qup-spi0-default'. What you are doing above with 
> 'qup_spi0_cs'
> and 'qup_spi0_cs_gpio' is to configure the same pin (GPIO 3) both as 
> SPI
> chip select and as GPIO. Which one is it?
> 
> I imagine we want to have both pinctrl definitions to allow a board to
> configure the pin either as SPI CS or GPIO. However it should be only 
> one
> of the two at a time, and the SoC .dtsi should provide a reasonable
> default, which probably is SPI CS.
> 

I agree. Will remove it in next version.

> Maybe I'm missing something, if so please provide details on why it is
> necessary to have this config.
