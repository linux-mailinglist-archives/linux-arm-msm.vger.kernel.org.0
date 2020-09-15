Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B8F26B074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 00:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgIOWLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 18:11:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45779 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727711AbgIOQr2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 12:47:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600188446; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yEHNYIgoLCIfyK1Nj7VW1RZeG1P4bPnr1BXOU5FeJZ8=;
 b=YBlu85+T1imHDCPyoDVk+Yl+W626qiEuBFbmvUkpi0FqTcj1CuwdO35j0uRDlIOvlj8Ye3Pj
 TWh4nR3MkqfQIM4B7QgiagCbiNpVO/jSI3kiA+3Su9z7DTR7RFi5Pka68v5CC59H95hDzTWb
 Wi+mHUyGWKEwKhKUyuS0fsac8rk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f60f01eba408b30ce29c230 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 16:47:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A026C43385; Tue, 15 Sep 2020 16:47:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 973EFC433F0;
        Tue, 15 Sep 2020 16:47:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Sep 2020 09:47:24 -0700
From:   nguyenb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
In-Reply-To: <20200915134335.GE670377@yoga>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
 <20200915044154.GB670377@yoga>
 <748d238a3d9e53834a498c6f37f9f3c9@codeaurora.org>
 <20200915134335.GE670377@yoga>
Message-ID: <e39516da0d94a4046edbcfb48b665f82@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-15 06:43, Bjorn Andersson wrote:
> On Tue 15 Sep 03:14 CDT 2020, nguyenb@codeaurora.org wrote:
> 
>> On 2020-09-14 21:41, Bjorn Andersson wrote:
>> > On Tue 01 Sep 01:00 CDT 2020, Bao D. Nguyen wrote:
>> >
>> > > UFS's specifications supports a range of Vcc operating
>> > > voltage levels. Add documentation for the UFS's Vcc voltage
>> > > levels setting.
>> > >
>> > > Signed-off-by: Can Guo <cang@codeaurora.org>
>> > > Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> > > ---
>> > >  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>> > >  1 file changed, 2 insertions(+)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > index 415ccdd..7257b32 100644
>> > > --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> > > @@ -23,6 +23,8 @@ Optional properties:
>> > >                            with "phys" attribute, provides phandle
>> > > to UFS PHY node
>> > >  - vdd-hba-supply        : phandle to UFS host controller supply
>> > > regulator node
>> > >  - vcc-supply            : phandle to VCC supply regulator node
>> > > +- vcc-voltage-level     : specifies voltage levels for VCC supply.
>> > > +                          Should be specified in pairs (min, max),
>> > > units uV.
>> >
>> > What exactly are these pairs representing?
>> The pair is the min and max Vcc voltage request to the PMIC chip.
>> As a result, the regulator output voltage would only be in this range.
>> 
> 
> If you have static min/max voltage constraints for a device on a
> particular board the right way to handle this is to adjust the board's
> regulator-min-microvolt and regulator-max-microvolt accordingly - and
> not call regulator_set_voltage() from the river at all.
> 
> In other words, you shouldn't add this new property to describe
> something already described in the node vcc-supply points to.
> 
> Regards,
> Bjorn
Thank you all for your comments. The current driver hardcoding 2.7V Vcc 
min voltage
does not work for UFS3.0+ devices according to the UFS device JEDEC 
spec. However, we will
try to address it in a different way.

Regards,
Bao

> 
>> >
>> > Is this supposed to be 3 pairs of (min,max) for vcc, vcc and vccq2 to be
>> > passed into a regulator_set_voltage() for each regulator?
>> Yes, that's right. I should include the other power supplies in this 
>> change
>> as well.
>> >
>> > Or are these some sort of "operating points" for the vcc-supply?
>> >
>> > Regards,
>> > Bjorn
>> >
>> > >  - vccq-supply           : phandle to VCCQ supply regulator node
>> > >  - vccq2-supply          : phandle to VCCQ2 supply regulator node
>> > >  - vcc-supply-1p8        : For embedded UFS devices, valid VCC range
>> > > is 1.7-1.95V
>> > > --
>> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> > > Forum,
>> > > a Linux Foundation Collaborative Project
>> > >
