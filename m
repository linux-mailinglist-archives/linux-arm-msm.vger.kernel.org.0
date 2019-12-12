Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D00811C644
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 08:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfLLHRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 02:17:44 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:48570
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728037AbfLLHRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 02:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576135062;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=ZJ1S6LRZla4L8y4Lgwt+L4o2jWgEBNDEfdjk2PoX/HA=;
        b=CNq1y/+VezeLgM3UZQa1MB5Xcd+RTE4JSYAgIeeF1x3HvQP6JolyTv1/2eZRCGHS
        Q2CD2XeGKpVpiF4wek0QvMwKdT9sOlz1JpjF7tSmBsIpxmGAhd9G7oY+e1Es0wVgnly
        HQ+ocFkw7hKsbSwhYcE5DC3GowMcez9Jmz1zk9o8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576135062;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=ZJ1S6LRZla4L8y4Lgwt+L4o2jWgEBNDEfdjk2PoX/HA=;
        b=GY11PqqmyqiAPN8L19c1H6fnIJIkumN0tFXOxd9aoDElBhJjDk6ZHBCjhajfccKl
        Zabi439cR+sU3UFDld8zQoqxv/zHPRsgMuZWYR0eD9p1sDbO3KF08GD/dpAhBCIBrAq
        dwetrEXG0+Gm9dIpwhmgUdM65VoGlVgjtOTFubIQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Dec 2019 07:17:42 +0000
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
        Amit Kucheria <amit.kucheria@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
In-Reply-To: <CAD=FV=UtHebABCpJo1QUc6C2v2iZq2rFL+pTMx=EHBL+7d=jTQ@mail.gmail.com>
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
 <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
 <CAD=FV=UtHebABCpJo1QUc6C2v2iZq2rFL+pTMx=EHBL+7d=jTQ@mail.gmail.com>
Message-ID: <0101016ef8f874fd-124cabf9-f93f-4ba1-a04e-e102f0de4d9f-000000@us-west-2.amazonses.com>
X-Sender: rkambl@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.12.12-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-12 01:03, Doug Anderson wrote:
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
>> +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
>> +                               <0 0x0c222000 0 0x1ff>; /* SROT */
>> +                       #qcom,sensors = <15>;
>> +                       interrupts = <GIC_SPI 506 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "uplow";
> 
> Can you also send a patch to match Amit's ("arm64: dts: sdm845:
> thermal: Add critical interrupt support") [1].  If I'm reading things
> correctly it should be 508 for tsens0 and 509 for tsens1 just like on
> sdm845.
> 
> [1]
> https://lore.kernel.org/r/c536e9cdb448bbad3441f6580fa57f1f921fb580.1573499020.git.amit.kucheria@linaro.org

yes, i will send the patch for critical interrupt support.
> 
> 
> Thanks!
> 
> -Rajeshwari
