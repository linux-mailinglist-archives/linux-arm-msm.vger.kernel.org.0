Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9798611C633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 08:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfLLHMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 02:12:25 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:48844
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728037AbfLLHMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 02:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576134744;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=kuEHwgeZ7jH79Hf/NBh0IOJRffXknsvIjmqh5d4grpE=;
        b=QCARYNCBezn6I1/GQaJzwCmf4L0nSOdQSEUkha8CwUvB7Absu9CdBOHIjm4K0Szm
        f/2OGGF1fnreHAR7aPp1qo0jAA2bM0l7Ic/31hRZw6Dh3DyH3PRa8BBu0NllwLAbKDG
        6jJt+5R1Qa///tXTeVQPhbNxbdx+Tmw3J3ogy7kQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576134744;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=kuEHwgeZ7jH79Hf/NBh0IOJRffXknsvIjmqh5d4grpE=;
        b=YtVEyq3SELgVXYfQVb/hMTCcPOoHir6ERHnEqkbIBy2iHi13C1XDPr11PWPOoD9A
        DUZ+yug0JgCttF0ox/fHBOhAqiow8LuyFpNXmw1rhD+3ZAoGVVK2FjeUzchHm3zRMv/
        pZ0uwO5uMv70gGV+h1xZO0Ry8TvS4SJs1HlIIGFM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Dec 2019 07:12:24 +0000
From:   rkambl@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
In-Reply-To: <CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com>
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
 <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
 <CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com>
Message-ID: <0101016ef8f397bf-8cf26b45-311c-437a-920a-bd5c58ae0c9f-000000@us-west-2.amazonses.com>
X-Sender: rkambl@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.12.12-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-12 00:31, Doug Anderson wrote:
> Hi,
> 
> On Thu, Nov 28, 2019 at 1:55 AM Rajeshwari <rkambl@codeaurora.org> 
> wrote:
>> 
>> Add TSENS node and user thermal zone for TSENS sensors in SC7180.
>> 
>> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 527 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 666e9b9..6656ffc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -911,6 +911,26 @@
>>                         status = "disabled";
>>                 };
>> 
>> +               tsens0: thermal-sensor@c263000 {
>> +                       compatible = 
>> "qcom,sc7180-tsens","qcom,tsens-v2";
> 
> Can you please send a patch listing this configuration in
> "Documentation/devicetree/bindings/thermal/qcom-tsens.yaml"?  You
> shouldn't need to re-send the dts since it looks like it's already
> landed, but it's good to get the bindings happy.

Sure, i will send the patch, adding this configuration in 
qcom-tsens.yaml.
> 
> Thanks!
> 
> -Rajeshwari
