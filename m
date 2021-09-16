Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AB940D293
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 06:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhIPEdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 00:33:39 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27524 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhIPEdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 00:33:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631766739; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EE9lOacJtzvDM9XaYOOMkcLX+XxN2Z5vNgDB2YTbdIA=;
 b=ZJB8qI8XWv4jwwuEG9qiUaw9iaVZmR6tAIY1rEcBHFIpzXngsUr9BR+h6eeSvcLnqegk3kMy
 +lrmUXQdPCbmPRNg4yykjlTLHDx2+PnbvOsGFq6YA5hOlsGyMUcTyiB4Tlq9MbBFky9IE4pp
 Z+08FLlSWvNTUOqHqB0vv0wZVdY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6142c8a8d914b051822b6dcf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 04:31:36
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 01364C43616; Thu, 16 Sep 2021 04:31:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F503C4338F;
        Thu, 16 Sep 2021 04:31:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Sep 2021 10:01:34 +0530
From:   rajpat@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V7 1/7] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <CAD=FV=XjjNx5UzgiKvONw+n0waGqgF+g7Qf4su9dvPQRS7uCrw@mail.gmail.com>
References: <1630643340-10373-1-git-send-email-rajpat@codeaurora.org>
 <1630643340-10373-2-git-send-email-rajpat@codeaurora.org>
 <CAD=FV=XjjNx5UzgiKvONw+n0waGqgF+g7Qf4su9dvPQRS7uCrw@mail.gmail.com>
Message-ID: <188e0a1f45336cc56ac2abb98d53dbde@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-03 21:58, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 2, 2021 at 9:29 PM Rajesh Patil <rajpat@codeaurora.org> 
> wrote:
>> 
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -415,6 +415,25 @@
>>                 method = "smc";
>>         };
>> 
>> +       qspi_opp_table: qspi-opp-table {
>> +               compatible = "operating-points-v2";
>> +
>> +               opp-75000000 {
>> +                       opp-hz = /bits/ 64 <75000000>;
>> +                       required-opps = <&rpmhpd_opp_low_svs>;
>> +               };
>> +
>> +               opp-150000000 {
>> +                       opp-hz = /bits/ 64 <150000000>;
>> +                       required-opps = <&rpmhpd_opp_svs>;
>> +               };
>> +
> 
> Any chance you could add a 200 MHz OPP point? It seems plausible that
> we might want to run the Quad SPI bus at 50 MHz and this OPP needs to
> be 4x that, so 200 MHz. ...or does it magically handle that case by
> one of the other OPPs?

Okay

> 
>> +               opp-300000000 {
>> +                       opp-hz = /bits/ 64 <300000000>;
>> +                       required-opps = <&rpmhpd_opp_nom>;
>> +               };
>> +       };
>> +
>>         soc: soc@0 {
>>                 #address-cells = <2>;
>>                 #size-cells = <2>;
>> @@ -1318,6 +1337,23 @@
>>                         };
>>                 };
>> 
>> +               qspi: spi@88dc000 {
>> +                       compatible = "qcom,qspi-v1";
> 
> The above compatible should be:
> 
> compatible = "qcom,sdm7280-qspi", "qcom,qspi-v1";
> 
> ...and you should fix the devicetree bindings to handle that. You
> should also fix sc7180.
> 
> Technically the "qcom,sdm7280-qspi" isn't really needed to make
> anything work today but having it is encouraged so that if we need to
> deal with a quirk in the future we can easily do it. Also note that
> your current dts will cause a bindings error because the current
> bindings _require_ you to have two compatible strings.

Okay
