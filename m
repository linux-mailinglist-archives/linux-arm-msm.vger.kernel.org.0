Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA42640F0E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 06:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244501AbhIQEMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 00:12:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13580 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244658AbhIQEJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 00:09:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631851698; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YRrg8XUL8FJqo8KoauQn9l5TvQY7Cfbt6ieu0fU9ExE=;
 b=EbS4i28DwMaAfnh+x2oZ67HsOMNKkmPD2lMb5NSVxu0GfE+6/A4HEOOPP3IWuDpWkRvLRtkD
 5blJMM54XPaMCZIcZhqjFjHWXIcXCPwYMsWAFifEx/JfQ45drH+9uN1gRGE/OMFrJAvDgFUI
 HEV6389VwCmaBzId8n7XOtSgn60=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 614414acb585cc7d2468e1da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 04:08:12
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5FBA1C4361A; Fri, 17 Sep 2021 04:08:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85DDBC4360C;
        Fri, 17 Sep 2021 04:08:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Sep 2021 09:38:11 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V5 2/2] arm64: dts: sc7280: Add volume up support for
 sc7280-idp
In-Reply-To: <CAE-0n53i4pU==W-dc=md_x+0Tqbd1gtwkPBFode+rtupSFi0WQ@mail.gmail.com>
References: <1631798498-10864-1-git-send-email-skakit@codeaurora.org>
 <1631798498-10864-3-git-send-email-skakit@codeaurora.org>
 <CAE-0n53i4pU==W-dc=md_x+0Tqbd1gtwkPBFode+rtupSFi0WQ@mail.gmail.com>
Message-ID: <baa5c4b4dd19e0a24d28b8bff559b868@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-17 00:32, Stephen Boyd wrote:
> Quoting Satya Priya (2021-09-16 06:21:38)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 371a2a9..cbbb0ee 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -12,6 +12,26 @@
>>  #include "pm8350c.dtsi"
>>  #include "pmk8350.dtsi"
>> 
>> +/ {
>> +       gpio-keys {
>> +               compatible = "gpio-keys";
>> +               label = "gpio-keys";
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&key_vol_up_default>;
>> +
>> +               volume-up {
>> +                       label = "volume_up";
>> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
>> +                       linux,input-type = <1>;
>> +                       linux,code = <KEY_VOLUMEUP>;
> 
> Is there an include for this define? Looks like
> <dt-bindings/input/input.h> should be added as well? Did you try
> compiling?
> 

Yeah, it needs <dt-bindings/input/linux-event-codes.h> to be included. 
This header was included in pmk8350.dtsi which is added in this file.

>> +                       gpio-key,wakeup;
>> +                       debounce-interval = <15>;
>> +                       linux,can-disable;
>> +               };
>> +       };
>> +};
>> +
>>  &apps_rsc {
>>         pm7325-regulators {
>>                 compatible = "qcom,pm7325-rpmh-regulators";
>> @@ -284,6 +304,17 @@
>> 
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> 
>> +&pm7325_gpios {
>> +       key_vol_up_default: key-vol-up-default {
>> +               pins = "gpio6";
>> +               function = "normal";
>> +               input-enable;
>> +               bias-pull-up;
>> +               power-source = <0>;
>> +               qcom,drive-strength = <3>;
>> +       };
>> +};
>> +
>>  &qup_uart5_default {
>>         tx {
>>                 pins = "gpio46";
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
