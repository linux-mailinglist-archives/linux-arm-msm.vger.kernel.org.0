Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A5C15A139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 07:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgBLGXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 01:23:32 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:61611 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728085AbgBLGXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 01:23:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581488612; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+MeToIl2UVuSzBxG95x4EhHM10yDLWzdMfdITlc4I5M=;
 b=sBHFiUbRflwVLY9WfiA05vJhgWgoJlPgwY4Q+PIyaKLbQFyCT+8pKgt2LrtyGuSyhx1/1rAz
 ISYAZW1aQzByk/YQD1k9D0QDM68t6NS9xK2skrvnh4z2zK9ic858wDyYeSBRnGMJugVF0zT2
 i1tlx/He40f68zSq89Bmu3OagbY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4399e3.7fc9851bf618-smtp-out-n02;
 Wed, 12 Feb 2020 06:23:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 803D0C433A2; Wed, 12 Feb 2020 06:23:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA43CC43383;
        Wed, 12 Feb 2020 06:23:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Feb 2020 11:53:29 +0530
From:   bgodavar@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, hemantg@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com, gubbaven@codeaurora.org
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7180: Add node for bluetooth soc
 wcn3990
In-Reply-To: <20200211173323.GE18972@google.com>
References: <20200211121612.29075-1-bgodavar@codeaurora.org>
 <20200211173323.GE18972@google.com>
Message-ID: <bacac82fbdfcc920e5982c5e1c629549@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,


On 2020-02-11 23:03, Matthias Kaehlcke wrote:
> On Tue, Feb 11, 2020 at 05:46:12PM +0530, Balakrishna Godavarthi wrote:
> 
>> subject: arm64: dts: qcom: sc7180: Add node for bluetooth soc wcn3990
> 
> Preferably say in the subjct that the node is added for the IDP board.
> 
[Bala]: will update

>> Add node for bluetooth soc wcn3990.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 388f50ad4fde..19f82ddc1f09 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -19,6 +19,7 @@
>>  	aliases {
>>  		hsuart0 = &uart3;
>>  		serial0 = &uart8;
>> +		bluetooth0 = &bluetooth;
>>  	};
>> 
>>  	chosen {
>> @@ -256,6 +257,16 @@
>> 
>>  &uart3 {
>>  	status = "okay";
> 
> nit: add a blank line
> 

[Bala]: will update

>> +	bluetooth: wcn3990-bt {
>> +		compatible = "qcom,wcn3990-bt";
>> +		vddio-supply = <&vreg_l10a_1p8>;
>> +		vddxo-supply = <&vreg_l1c_1p8>;
>> +		vddrf-supply = <&vreg_l2c_1p3>;
>> +		vddch0-supply = <&vreg_l10c_3p3>;
>> +		max-speed = <3200000>;
>> +		clocks = <&rpmhcc RPMH_RF_CLK2>;
>> +		status = "okay";
> 
> status is not needed here AFAIK.
[Bala]: true, will update
