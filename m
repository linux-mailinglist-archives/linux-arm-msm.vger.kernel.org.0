Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96DE331EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 06:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCIF7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 00:59:16 -0500
Received: from z11.mailgun.us ([104.130.96.11]:19951 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhCIF6m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 00:58:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615269522; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZDHdQUH+34cU9rMw7gN8SAsOk5mQYKwTN0PH1vJ4DCE=;
 b=MFSkfq19BWb0yw/wF+mZ03Rh3aGLToP/Tov3POdQNpCbCAkV6hFuFgsa9bL4SamPjkzgRL0g
 ocz1flLrqczJck9Vwwx3H5mfloi+3ZZdaWBV1IF7xH87nH5mnN44d0gt05i4gzhx6x67wX66
 FwKns5jpvrAn+lZhSr4M4Xxdynw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60470e7e64e0747df9545493 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 05:58:22
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1679CC43462; Tue,  9 Mar 2021 05:58:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C78BC433CA;
        Tue,  9 Mar 2021 05:58:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Mar 2021 11:28:21 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: Add AOSS QMP node
In-Reply-To: <5cf5692ef7d348ec361081d0341f1254@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <463a45f2c3e4a91430c006fa1637c7f4f124185e.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <161428210272.1254594.16034240343090747878@swboyd.mtv.corp.google.com>
 <dc3be32a3f8197d3138fe1ef6c24316a@codeaurora.org>
 <161436520297.1254594.4348845199981053890@swboyd.mtv.corp.google.com>
 <5cf5692ef7d348ec361081d0341f1254@codeaurora.org>
Message-ID: <d19fbcc91b4ef045014b225e7fdf9780@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-27 19:26, Sai Prakash Ranjan wrote:
> On 2021-02-27 00:16, Stephen Boyd wrote:
>> Quoting Sai Prakash Ranjan (2021-02-25 23:51:00)
>>> On 2021-02-26 01:11, Stephen Boyd wrote:
>>> > Quoting Sai Prakash Ranjan (2021-02-25 01:30:24)
>>> >> Add a DT node for the AOSS QMP on SC7280 SoC.
>>> >>
>>> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> >> ---
>>> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 14 ++++++++++++++
>>> >>  1 file changed, 14 insertions(+)
>>> >>
>>> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> >> index 65c1e0f2fb56..cbd567ccc04e 100644
>>> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> >> @@ -9,6 +9,7 @@
>>> >>  #include <dt-bindings/clock/qcom,rpmh.h>
>>> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> >>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>> >> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>>> >>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>> >>
>>> >>  / {
>>> >> @@ -368,6 +369,19 @@ pdc: interrupt-controller@b220000 {
>>> >>                         interrupt-controller;
>>> >>                 };
>>> >>
>>> >> +               aoss_qmp: qmp@c300000 {
>>> >
>>> > power-domain-controller@c300000? power-controller@c300000?
>>> >
>>> 
>>> Its an AOSS message RAM and all other SM* SoCs have as qmp@
>>> and the dt binding as well, I see only SM8150 with power-controller,
>>> that should probably be fixed?
>> 
>> Node name should be generic while still being meaningful. Nobody knows
>> what qmp is, but power-controller makes sense. Can you fix this and 
>> the
>> others to be power-controller?
>> 

we probably would be changing them back
to qmp or something more generic soon
since the consensus was qmp wasn't a
power-controller. So not sure if its
worth the effort here.

> 
> Ok makes sense, I will post changing others as well and see if we get
> any comments there.
> 
> Thanks,
> Sai

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
