Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5801241AF2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240641AbhI1Mn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:43:57 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56160 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240488AbhI1Mnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:43:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632832936; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bfvExRyMFxw1e6AjAzU9jgJ8KWmezb7Nm5djdW68m8w=;
 b=InuM9IgItyRu7SUc3pOQURipWguInyyKsCMsOnMHYhASXsALjdEUDSEyH6aSxi6UU22mO6py
 nC6IXMpdyzi+ICgJpy28/SpszH1GAEDuRFUq2DZZecDbBCeTZiS421P3GHcfXzgCSdbngryQ
 9PXTulM7QAP3ykeheL8jsnYq8zE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61530da61abbf21d34cb3ace (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:42:14
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13BE9C4360D; Tue, 28 Sep 2021 12:42:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6EF74C4338F;
        Tue, 28 Sep 2021 12:42:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 18:12:13 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7280: Add pm8008 regulators
 support for sc7280-idp
In-Reply-To: <CAE-0n53rto=_+9qtc0RL0tkDwBkd9HJL26TQV-m6Q8myiNSCVA@mail.gmail.com>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-5-git-send-email-skakit@codeaurora.org>
 <CAE-0n53rto=_+9qtc0RL0tkDwBkd9HJL26TQV-m6Q8myiNSCVA@mail.gmail.com>
Message-ID: <61eabd793256583c930c487b9a21c60b@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 01:07, Stephen Boyd wrote:
> Quoting Satya Priya (2021-09-17 03:45:38)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 52638e2..3b3af49 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -207,6 +207,97 @@
>>         };
>>  };
>> 
>> +&i2c1 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       status = "okay";
>> +
>> +       pm8008_chip: pm8008@8 {
>> +               compatible = "qcom,pm8008";
>> +               reg = <0x8>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pm8008_active>;
>> +       };
>> +
>> +       pm8008_ldo: pm8008@9 {
> [...]
>> +
>> +                       pm8008_l7: regulator@4600 {
>> +                               reg = <0x4600>;
>> +                               regulator-name = "pm8008_l7";
>> +                               regulator-min-microvolt = <3000000>;
>> +                               regulator-max-microvolt = <3544000>;
>> +                               qcom,min-dropout-voltage = <96000>;
> 
> Is this headroom? Is it actually configurable or is it merely a 
> property
> of the hardware? If it's the latter then it should be in the driver and
> not in the DTS.
> 

Yes this is a headroom and its configurable.

>> +                       };
>> +               };
>> +       };
>> +};
>> +
>>  &qfprom {
>>         vcc-supply = <&vreg_l1c_1p8>;
>>  };
>> @@ -313,6 +404,18 @@
>> 
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> 
>> +&pm8350c_gpios {
>> +       pm8008_reset {
> 
> Is this a pinctrl node?
> 

No.

>> +               pm8008_active: pm8008_active {
> 
> Please use dashes in node names wherever an underscore goes.
> 

Okay.

>> +                       pins = "gpio4";
>> +                       function = "normal";
>> +                       bias-disable;
>> +                       output-high;
>> +                       power-source = <0>;
>> +               };
>> +       };
>> +};
