Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55903A7B54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 12:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhFOKCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 06:02:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36535 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230502AbhFOKCw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 06:02:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623751248; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yEtEJbG7Tsld/ZdtEB4tMGLswtoHTcN3VZl3xMrng/8=;
 b=DC2sOboilk1VV26lt4UDaS4VUAp6hA7md20c9iYZfP8zwrtQzvKHIFwGUa8HXWDvpKBVtm8O
 tgxqviWhtJT3vOeKKckvLti+4bNvyYH2JZgNejAQvsSHvVVBPV+Z8oBBlgzYpnIXm82KJS93
 Ih56PVNPZ3kOtMFl9cKQqdnuX88=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c87a2ae27c0cc77ff5cd96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 10:00:10
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B693EC433F1; Tue, 15 Jun 2021 10:00:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8478DC433D3;
        Tue, 15 Jun 2021 10:00:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Jun 2021 15:30:07 +0530
From:   sbhanu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7180: Added xo clock for eMMC and
 Sd card
In-Reply-To: <YMeEPg7EPC5E/MfW@builder.lan>
References: <1623309107-27833-1-git-send-email-sbhanu@codeaurora.org>
 <YMLm96edhIYOJF+E@builder.lan>
 <1230be3c7f350b1f33110df2a9744e15@codeaurora.org>
 <YMeEPg7EPC5E/MfW@builder.lan>
Message-ID: <f24b5538fb28595ab1d9353a6a8e429d@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-14 22:00, Bjorn Andersson wrote:
> On Mon 14 Jun 06:55 CDT 2021, sbhanu@codeaurora.org wrote:
> 
>> On 2021-06-11 10:00, Bjorn Andersson wrote:
>> > On Thu 10 Jun 02:11 CDT 2021, Shaik Sajida Bhanu wrote:
>> >
>> > > Added xo clock for eMMC and Sd card.
>> >
>> > Was about to push out my branch of patches, but before I do. Can you
>> > please describe WHY this is needed?
>> >
>> > Regards,
>> > Bjorn
>> 
>> We are making use of this clock in dll register value calculation,
>> The default PoR value is also same as calculated value for
>> HS200/HS400/SDR104 modes.
>> But just not to rely on default register values we need this entry.
>> 
> 
> That is the perfect thing to include in a commit message!
> 
> I rewrote yours and applied the change, but please next time do 
> describe
> the "why" of your change.
> 
> Regards,
> Bjorn
Sure
> 
>> >
>> > >
>> > > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>> > > ---
>> > >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++----
>> > >  1 file changed, 6 insertions(+), 4 deletions(-)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> > > b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> > > index 295844e..5bb6bd4 100644
>> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> > > @@ -701,8 +701,9 @@
>> > >  			interrupt-names = "hc_irq", "pwr_irq";
>> > >
>> > >  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>> > > -					<&gcc GCC_SDCC1_AHB_CLK>;
>> > > -			clock-names = "core", "iface";
>> > > +					<&gcc GCC_SDCC1_AHB_CLK>,
>> > > +					<&rpmhcc RPMH_CXO_CLK>;
>> > > +			clock-names = "core", "iface","xo";
>> > >  			interconnects = <&aggre1_noc MASTER_EMMC 0 &mc_virt SLAVE_EBI1 0>,
>> > >  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_EMMC_CFG 0>;
>> > >  			interconnect-names = "sdhc-ddr","cpu-sdhc";
>> > > @@ -2666,8 +2667,9 @@
>> > >  			interrupt-names = "hc_irq", "pwr_irq";
>> > >
>> > >  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>> > > -					<&gcc GCC_SDCC2_AHB_CLK>;
>> > > -			clock-names = "core", "iface";
>> > > +					<&gcc GCC_SDCC2_AHB_CLK>,
>> > > +					<&rpmhcc RPMH_CXO_CLK>;
>> > > +			clock-names = "core", "iface", "xo";
>> > >
>> > >  			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1
>> > > 0>,
>> > >  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
>> > > --
>> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
>> > > member
>> > > of Code Aurora Forum, hosted by The Linux Foundation
>> > >
