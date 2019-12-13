Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38E0111DD26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 05:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731704AbfLMEbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 23:31:23 -0500
Received: from m228-4.mailgun.net ([159.135.228.4]:29118 "EHLO
        m228-4.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731649AbfLMEbW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 23:31:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576211482; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2dEQvqwynE6D0k73vhsmc99DYPPkKBISeGiPH0xpt3U=;
 b=aF/QkSTL8L1JeSCl/g42mraw7UWGNgNQOIDrjZKlz6GqetJBvl/i5EQspWdVgyaIPqQPmfN+
 5+ESyjeQDykipf6rgQxzV233Gbbtq9s5HgzzVxzukggPnIu3IoXxd2xxCBloNSAKtOooZgrm
 sdpidfxsznFI8ABfSXQu+GVY4pU=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df31412.7fc5e7449ca8-smtp-out-n01;
 Fri, 13 Dec 2019 04:31:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0017C433A2; Fri, 13 Dec 2019 04:31:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FE2DC433CB;
        Fri, 13 Dec 2019 04:31:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Dec 2019 10:01:13 +0530
From:   saiprakash.ranjan@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: Add APSS watchdog node
In-Reply-To: <CAD=FV=X3Akg07hetQOgd0P_wTVWs3QpuCNQ8O6qQ5LK2ZeWSaQ@mail.gmail.com>
References: <cover.1576037078.git.saiprakash.ranjan@codeaurora.org>
 <0101016ef3391ded-57772416-f32d-40e8-acb5-5dd1b6064f73-000000@us-west-2.amazonses.com>
 <CAD=FV=X3Akg07hetQOgd0P_wTVWs3QpuCNQ8O6qQ5LK2ZeWSaQ@mail.gmail.com>
Message-ID: <6453ced1f718bf3a214c404b08f8c35b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 2019-12-12 00:55, Doug Anderson wrote:
> If you haven't already done it (I couldn't find it), can you please
> add this to "Documentation/devicetree/bindings/watchdog/qcom-wdt.txt"?
>  Presumably at the same time it would be good to change the format of
> that file to .yaml.
> 

This was the copy paste mistake from sdm845, I will convert the wdog 
bindings
to yaml and add missing SoC specific compatible for SC7180, SDM845 and 
SM8150.

> 
> Unrelated to sc7180, but it also feels like something is awfully
> screwy here in terms of the various Qualcomm device tree files
> referring to watchdog timers.  It feels wrong, but perhaps you can
> educate me on how it works and I'll see the light.  Specifically:
> 
> 1. It seems like the same node is used for two things on other Qualcomm 
> SoCs
> 
> If I grep the bindings for "qcom,kpss-timer" or "qcom,scss-timer", I
> get two hits:
> 
> Documentation/devicetree/bindings/timer/qcom,msm-timer.txt
> Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> 
> ...and, in fact, there appear to be two drivers claiming compatibility 
> here:
> 
> drivers/clocksource/timer-qcom.c
> drivers/watchdog/qcom-wdt.c
> 
> That seems super odd to me.  Is that really right?  We have two
> drivers probing against the same device tree nodes?  ...and that's OK?
>  If so, why does only one of the bindings list the SoC-specific
> bindings names?
> 

This was before my time, but scratching my head and some internal docs
and git history reveals that watchdog was part of the timer block in
APQ8064, MSM8960. However in IPQ4019, watchdog was standalone and split
from timer block.

Below links gives us some more background:

https://groups.google.com/forum/#!topic/linux.kernel/UnDgqU8QgLU
https://patchwork.kernel.org/patch/5868261/

> 
> 2. The actual nodes look really wonky.  A few examples below:
> 
> 2a) arch/arm/boot/dts/qcom-apq8064.dtsi:
> compatible = "qcom,kpss-timer", "qcom,kpss-wdt-apq8064", 
> "qcom,msm-timer";
> 
> ...why is the SoC-specific compatible string in the middle?  The
> SoC-specific one should be first.

Yes, SoC specific compatible should come first, I guess they just didn't 
care when
it was merged.

> 
> 2b) arch/arm/boot/dts/qcom-ipq4019.dtsi:
> compatible = "qcom,kpss-wdt", "qcom,kpss-wdt-ipq4019";
> 
> ...same question, but in this case there is no "msm-timer" at the end?
> 

IPQ4019 had watchdog as standalone outside of timer block as explained 
above.

> 2c) arch/arm64/boot/dts/qcom/qcs404.dtsi
> compatible = "qcom,kpss-wdt";
> 
> ...no SoC-specific string at all?
> 

Needs a SoC specific compatible, I am going to add this in my coming 
patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
