Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7091EE4CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 14:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgFDMxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 08:53:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25814 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728055AbgFDMxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 08:53:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591275183; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UilGVd2ttjxQPEcdx/6oswso/Q+mDT7PvsGJQ1Zjvlo=;
 b=mwLZKPh7uW4D+xRdDKf/YmqSGS+79+1uRxr9QrbcuIq5SCflv78Ufaxnw6s8kcx/1IDcWCQ8
 cvePKEINvHxxk0dJB6YPcdLnTFdrjPKD4OMhZbuIUe1rhMRuOqSgYxb+JyuCs0JYTbTnDK8Z
 95dmTkN7t9a9RE/CBKyh+yAVw/4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ed8eea744a25e005204157b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 12:52:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 649FAC43395; Thu,  4 Jun 2020 12:52:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE466C433C6;
        Thu,  4 Jun 2020 12:52:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Jun 2020 18:22:53 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: add watchdog device
In-Reply-To: <20200604122259.GG16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
 <1a23cf8a6386e8b78c52199bdcde9b5e@codeaurora.org>
 <20200604113544.GF16719@Mani-XPS-13-9360>
 <f1cb759c2a70981ba8903dc1141349fe@codeaurora.org>
 <20200604122259.GG16719@Mani-XPS-13-9360>
Message-ID: <47f338033abbf1470963d0a9e77d4449@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-04 17:52, Manivannan Sadhasivam wrote:
> On Thu, Jun 04, 2020 at 05:21:46PM +0530, Sai Prakash Ranjan wrote:
>> On 2020-06-04 17:05, Manivannan Sadhasivam wrote:
>> > On Thu, Jun 04, 2020 at 04:37:01PM +0530, Sai Prakash Ranjan wrote:
>> > > On 2020-06-04 06:13, Dmitry Baryshkov wrote:
>> > > > Add on-SoC watchdog device node.
>> > > >
>> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > > > ---
>> > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
>> > > >  1 file changed, 6 insertions(+)
>> > > >
>> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> > > > b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> > > > index 972d8e04c8a2..f1641c6fe203 100644
>> > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> > > > @@ -1662,6 +1662,12 @@ config {
>> > > >  			};
>> > > >  		};
>> > > >
>> > > > +		watchdog@17c10000 {
>> > > > +			compatible = "qcom,apss-wdt-sm8250", "qcom,kpss-wdt";
>> > >
>> > > Need to add this compatible to bindings.
>> > >
>> >
>> > I did look into this but the binding says,
>> > "compatible : shall contain only one of the following"
>> >
>> > So clearly the fallback is not going to work and there is no need to add
>> > a
>> > dedicated compatible in the driver. The binding is not in the YAML
>> > format to
>> > be validated but still... Other option is to convert the binding to YAML
>> > and
>> > make the compatibles listed as 'enum' and 'const' elements
>> > appropriately.
>> >
>> 
>> I already converted the bindings to YAML and added the missing 
>> compatibles
>> for
>> other SoCs[1] .
> 
> Ah, okay. I didn't find it in linux-next. Anyway, for adding
> "qcom,apss-wdt-sm8250" compatible, we need to group the compatibles 
> wisely
> using 'enum' and 'const'.
> 

Yes.

>> I thought it was already merged since Rob has already
>> reviewed
>> them, but seems like it was missed. Bjorn, can you please take it?
>> 
> 
> Perhaps for v5.9...
> 

Sure, no problem.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
