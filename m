Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AB9275EB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 19:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgIWRcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 13:32:51 -0400
Received: from z5.mailgun.us ([104.130.96.5]:35544 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgIWRcv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 13:32:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600882369; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PMQvhc3S43GmMJPO1rxQAeBHojk6m57SWyw8NlxGfhM=;
 b=cdG5Pflwc4yHB7om7cH76NvxkTTzpteY4vlOGRtQlUIOd22Fo3j6Lu7eWoBmmp9QrCCm8Yha
 6Wf1eUPqcq2fBSoTvXdGeZ5LQ56UeHlFkZ75komzRi2esPoIEIK3+HfABw4Vxn02w8YO6CTY
 tRYE5hCefWgFLR83UwSU08UfOzQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f6b86bee9f95282bcaa9768 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 17:32:46
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5289C433FF; Wed, 23 Sep 2020 17:32:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA5E7C433CA;
        Wed, 23 Sep 2020 17:32:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Sep 2020 10:32:44 -0700
From:   nguyenb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        SCSI <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
In-Reply-To: <20200922003606.GA40811@yoga>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
 <20200914183505.GA357@bogus>
 <d332e61cea4fef237507f1404efa724a@codeaurora.org>
 <CAL_Jsq+YV-GjAhVVHtgNz6xFR=bEgSwWKY+QGixRQJ5Ov75pag@mail.gmail.com>
 <e489cee219d48e9f5e48dc30518f445b@codeaurora.org>
 <20200922003606.GA40811@yoga>
Message-ID: <685e36852bf944cf440e819d8b51c95c@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-21 17:36, Bjorn Andersson wrote:
> On Mon 21 Sep 19:22 CDT 2020, nguyenb@codeaurora.org wrote:
> 
>> On 2020-09-18 12:01, Rob Herring wrote:
>> > On Tue, Sep 15, 2020 at 2:10 AM <nguyenb@codeaurora.org> wrote:
>> > >
>> > > On 2020-09-14 11:35, Rob Herring wrote:
>> > > > On Mon, Aug 31, 2020 at 11:00:47PM -0700, Bao D. Nguyen wrote:
>> > > >> UFS's specifications supports a range of Vcc operating
>> > > >> voltage levels. Add documentation for the UFS's Vcc voltage
>> > > >> levels setting.
>> > > >>
>> > > >> Signed-off-by: Can Guo <cang@codeaurora.org>
>> > > >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> > > >> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> > > >> ---
>> > > >>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>> > > >>  1 file changed, 2 insertions(+)
>> > > >>
>> > > >> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > >> b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > >> index 415ccdd..7257b32 100644
>> > > >> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > >> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > >> @@ -23,6 +23,8 @@ Optional properties:
>> > > >>                            with "phys" attribute, provides phandle to
>> > > >> UFS PHY node
>> > > >>  - vdd-hba-supply        : phandle to UFS host controller supply
>> > > >> regulator node
>> > > >>  - vcc-supply            : phandle to VCC supply regulator node
>> > > >> +- vcc-voltage-level     : specifies voltage levels for VCC supply.
>> > > >> +                          Should be specified in pairs (min, max),
>> > > >> units uV.
>> > > >
>> > > > The expectation is the regulator pointed to by 'vcc-supply' has the
>> > > > voltage constraints. Those constraints are supposed to be the board
>> > > > constraints, not the regulator operating design constraints. If that
>> > > > doesn't work for your case, then it should be addressed in a common way
>> > > > for the regulator binding.
>> > > The UFS regulator has a min_uV and max_uV limits. Currently, the min
>> > > and
>> > > max are hardcoded
>> > > to UFS2.1 Spec allowed values of 2.7V and 3.6V respectively.
>> > > With this change, I am trying to fix a couple issues:
>> > > 1. The 2.7V min value only applies to UFS2.1 devices. with UFS3.0+
>> > > devices, the VCC min should be 2.4V.
>> > > Hardcoding the min_uV to 2.7V does not work for UFS3.0+ devices.
>> >
>> > Don't you know the device version attached and can adjust the voltage
>> > based on that? Or you have to set the voltage first?
>> Yes it is one of the solutions. Once detect the UFS device is version 
>> 3.0+,
>> you can lower
>> the voltage to 2.5V from the hardcoded value used by the driver. 
>> However, to
>> change the
>> Vcc voltage, the host needs to follow a sequence to ensure safe 
>> operations
>> after Vcc change
>> (device has to be in sleep mode, Vcc needs to go down to 0 then up to 
>> 2.5V.)
>> Also same sequence is repeated for every host initialization which is
>> inconvenient.
>> 
> 
> It sounds like you're suggesting that we detect the UFS device using
> some voltage, then depending on version we might lower it to 2.5V.
Yes, that is one possible solution.

> I'm afraid I don't see any of this either documented or implemented in
> these patches.
I was responding to a comment about detecting the device version and 
change the voltage
based on the detection. It is not implemented in this patch. Maybe I 
should stop
discussing another possible solution, even though related to the topic, 
it is not
implemented in this patch.

> 
> What is this initial detection voltage and how to you configure it?
The initial voltage would be 2.9V and is lowered to 2.5V if UFS3.0+ 
device is detected.
We would call the regulator_set_voltage() to set to a specific voltage 
level.

Regards,
Bao

> 
> Regards,
> Bjorn
> 
>> >
>> > > 2. Allow users to select a different Vcc voltage within the allowed
>> > > range.
>> > > Using the min value, the UFS device is operating at marginal Vcc
>> > > voltage.
>> > > In addition the PMIC and the board designs may add some variables
>> > > especially at extreme
>> > > temperatures. We observe stability issues when using the min Vcc
>> > > voltage.
>> >
>> > Again, we have standard regulator properties for this already that you
>> > can tune per board.
>> Thank you for the suggestion.
>> 
>> >
>> > Rob
