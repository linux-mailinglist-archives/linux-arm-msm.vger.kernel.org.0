Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E31269170
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 18:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgINQYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 12:24:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:42890 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726065AbgINQTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 12:19:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600100356; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6kP6V+U+oC1wCvvEWglojf58K6rS+SRnVM0PaaQN5Kk=;
 b=BwmN2MaL8A1nRF8fRoII7j1rwy+sx/kYQ/5efm0TvycerBKqwyuQGJP8/8ILeb7qgV3b8Pz4
 94qqz/WCWDJCrj34hIRdW7aGbOOzuUYt4WBHR7W4UA8J60seFeSeohD7cpIv9POVMLonMWAA
 +obeAqr552u3VZUgWpY93n1SXRE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f5f97febe06707b34d18e4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 16:19:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3A41C433C8; Mon, 14 Sep 2020 16:19:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E83AC433CA;
        Mon, 14 Sep 2020 16:19:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 14 Sep 2020 09:19:09 -0700
From:   nguyenb@codeaurora.org
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
In-Reply-To: <BY5PR04MB670510941B91C0D394A23A68FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
 <BY5PR04MB670510941B91C0D394A23A68FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
Message-ID: <aaed1cfb1cdee8cd6e45191814af5763@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-13 02:35, Avri Altman wrote:
>> 
>> 
>> UFS's specifications supports a range of Vcc operating
>> voltage levels. Add documentation for the UFS's Vcc voltage
>> levels setting.
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> index 415ccdd..7257b32 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> @@ -23,6 +23,8 @@ Optional properties:
>>                            with "phys" attribute, provides phandle to 
>> UFS PHY node
>>  - vdd-hba-supply        : phandle to UFS host controller supply 
>> regulator node
>>  - vcc-supply            : phandle to VCC supply regulator node
>> +- vcc-voltage-level     : specifies voltage levels for VCC supply.
> For ufs3.1+ devices
Thanks for the comments, Avri.
I am not clear what this comment means. Could you please clarify?
> 
>> +                          Should be specified in pairs (min, max), 
>> units uV.
>>  - vccq-supply           : phandle to VCCQ supply regulator node
>>  - vccq2-supply          : phandle to VCCQ2 supply regulator node
>>  - vcc-supply-1p8        : For embedded UFS devices, valid VCC range 
>> is 1.7-1.95V
>> --
> Why are you removing all other docs?
> They are still relevant for non ufs3.1 devices.
I did not remove anything. You may be confused by the "-" used as 
listing in the original document.
