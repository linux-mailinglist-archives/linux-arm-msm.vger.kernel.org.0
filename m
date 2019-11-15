Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE25AFD3E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 06:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfKOFED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 00:04:03 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:36810 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOFED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 00:04:03 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B52AE6106C; Fri, 15 Nov 2019 05:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573794241;
        bh=w1wAr/Z0FnLpEaQzB+EHW09y0AC/Z1vObdEYrGrIxQQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iiYPQpiWypwMsch2ccEPPlhg+Hw/0yiLyCphNQRFDviwcqqH+gQpYU6dC7QXDwxAx
         WCE1dEYfmmcwLk84mviB0E4Dnt604FaOas4nQ3Dxilg0PgYGqW9hKYDHRpfOb8DlHY
         pySWYtaWYNyDBNIOwtVeDZ1UrFRfgpvJ2RxT5PX4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.25.219] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C99861019;
        Fri, 15 Nov 2019 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573794241;
        bh=w1wAr/Z0FnLpEaQzB+EHW09y0AC/Z1vObdEYrGrIxQQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iiYPQpiWypwMsch2ccEPPlhg+Hw/0yiLyCphNQRFDviwcqqH+gQpYU6dC7QXDwxAx
         WCE1dEYfmmcwLk84mviB0E4Dnt604FaOas4nQ3Dxilg0PgYGqW9hKYDHRpfOb8DlHY
         pySWYtaWYNyDBNIOwtVeDZ1UrFRfgpvJ2RxT5PX4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C99861019
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1573733569-25940-1-git-send-email-sanm@codeaurora.org>
 <1573733569-25940-2-git-send-email-sanm@codeaurora.org>
 <5dcd8471.1c69fb81.aee46.634e@mx.google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <41a8bbbc-2e85-2c8e-dc1b-fe0283c4390d@codeaurora.org>
Date:   Fri, 15 Nov 2019 10:33:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <5dcd8471.1c69fb81.aee46.634e@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/14/2019 10:14 PM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2019-11-14 04:12:49)
>> Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> One minor nit below.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 666e9b9..82f0b3a 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -911,6 +924,98 @@
>>                          status = "disabled";
>>                  };
>>   
>> +               usb_1_hsphy: phy@88e3000 {
>> +                       compatible = "qcom,sc7180-qusb2-phy";
>> +                       reg = <0 0x088e3000 0 0x400>;
>> +                       status = "disabled";
>> +                       #phy-cells = <0>;
>> +                       clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "cfg_ahb","ref";
> Add a space after that comma please.
OK. Will do in next version.
>
>> +                       resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +                       nvmem-cells = <&qusb2p_hstx_trim>;
>> +               };
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

