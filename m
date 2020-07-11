Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86E921C247
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 06:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgGKEoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 00:44:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30059 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726903AbgGKEoa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 00:44:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594442669; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/We79d7IRFCX6NpF/d6AI0I7gjDSb15un20bxx8zAJE=;
 b=ui6p1lxfKkukMGZxXJPCKX3eQQSZEyTPvFgMuRJ6YFlGh0W3HbQzem2K8GFNYsDM5qrk7ldN
 Pe0maLQ5lQj5S1JEjshPyuHEnz24zLlxN794qqqx/o4Q1m9toZACOVK+x7iBCnW28nC6vx5F
 fLqPSwHsbdvew1yP0tRytzPD3C4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f0943aa8e36ecda307d8f7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 11 Jul 2020 04:44:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6ADEEC433C6; Sat, 11 Jul 2020 04:44:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1F49C433C8;
        Sat, 11 Jul 2020 04:44:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 11 Jul 2020 10:14:25 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     'Doug Anderson' <dianders@chromium.org>,
        "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>, 'Evan Green' <evgreen@chromium.org>,
        'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'linux-arm-msm' <linux-arm-msm@vger.kernel.org>,
        'LKML' <linux-kernel@vger.kernel.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add missing properties for Wifi
 node
In-Reply-To: <007701d65734$90039c80$b00ad580$@codeaurora.org>
References: <1594286253-32244-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=XQy17ZuKdJXPH20uGTrEtPrDacDXAg+rTA96HBm6hVVw@mail.gmail.com>
 <007701d65734$90039c80$b00ad580$@codeaurora.org>
Message-ID: <ddf402ee75c44616ce3be5cc1968dd03@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-11 09:07, Rakesh Pillai wrote:
>> -----Original Message-----
>> From: Doug Anderson <dianders@chromium.org>
>> Sent: Friday, July 10, 2020 1:36 AM
>> To: Rakesh Pillai <pillair@codeaurora.org>
>> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
>> <devicetree@vger.kernel.org>; Evan Green <evgreen@chromium.org>;
>> Andy Gross <agross@kernel.org>; Bjorn Andersson
>> <bjorn.andersson@linaro.org>; Rob Herring <robh+dt@kernel.org>; linux-
>> arm-msm <linux-arm-msm@vger.kernel.org>; LKML <linux-
>> kernel@vger.kernel.org>; Sibi Sankar <sibis@codeaurora.org>
>> Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add missing properties 
>> for
>> Wifi node
>> 
>> Hi,
>> 
>> On Thu, Jul 9, 2020 at 2:18 AM Rakesh Pillai <pillair@codeaurora.org> 
>> wrote:
>> >
>> > The wlan firmware memory is statically mapped in
>> > the Trusted Firmware, hence the wlan driver does
>> > not need to map/unmap this region dynamically.
>> >
>> > Hence add the property to indicate the wlan driver
>> > to not map/unamp the firmware memory region
>> > dynamically.
>> >
>> > Also add the chain1 voltage supply for wlan.
>> >
>> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> > ---
>> > This patch is created on top of the change by
>> > Douglas Anderson.
>> > https://lkml.org/lkml/2020/6/25/817
>> >
>> > Also the dt-bindings for the chain1 voltage supply
>> > is added by the below patch series:
>> > https://patchwork.kernel.org/project/linux-wireless/list/?series=309137
>> > ---
>> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> > index 472f7f4..4c64bc1 100644
>> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> > @@ -391,10 +391,12 @@
>> >
>> >  &wifi {
>> >         status = "okay";
>> > +       qcom,msa-fixed-perm;

Should we include ^^ property
in the base dts? Since I don't
foresee any platform skipping
qcom,msa-fixed-perm property.

>> 
>> At one point in time I thought +Sibi said that this wouldn't be needed
>> once the firmware was fixed.  ...afterwards you said that it was
>> needed for SSR (subsystem reset).  Would be good to get confirmation
>> from Sibi that this matches his understanding.

Yes all of ^^ happened and yes
we now need qcom,msa-fixed-perm
since the wlan_fw_mem permission
assignment in now handled in ATF.

> 
> Hi Doug,
> 
> This is now needed as the firmware memory mapping was moved to Trusted 
> firmware.
> This region is now statically mapped to avoid access from driver.
> 
>> 
>> 
>> >         vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
>> >         vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
>> >         vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
>> >         vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
>> > +       vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
>> >         wifi-firmware {
>> >                 iommus = <&apps_smmu 0xc2 0x1>;
>> >         };
>> 
>> Other than the one question this looks good to me.
>> 
>> -Doug

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
