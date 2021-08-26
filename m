Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45A83F881A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 14:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242539AbhHZMyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 08:54:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44741 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbhHZMye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 08:54:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629982427; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4JpIOEcTqyndFXJ+D3XocfZatN3nWBJFjCV5nhSZ53w=;
 b=ijrlqYJnnEVLJV9isw8JaOFIU03Ork1onDABMZrRYtPSYpY9xO4n2gKwXGHxKEZPMsEqvUhY
 Y+jIC65pSsSO3Cz2PzY8M15KG1IpyxIFraSzI0sHoBdSxhTRigli4igPhLqEvar77pEPryIx
 t1Yppqps55KovEOlaY+/my/eskA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61278ec140d2129ac15e7fb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 12:53:21
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74B39C4338F; Thu, 26 Aug 2021 12:53:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7882AC43460;
        Thu, 26 Aug 2021 12:53:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Aug 2021 18:23:19 +0530
From:   rajpat@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V5 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <CAD=FV=Vb2_K7QDvdMkjPLYqbVNQMa9e=3_PqREAHYMMVX-9QVQ@mail.gmail.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-4-git-send-email-rajpat@codeaurora.org>
 <CAD=FV=Vb2_K7QDvdMkjPLYqbVNQMa9e=3_PqREAHYMMVX-9QVQ@mail.gmail.com>
Message-ID: <949de2152616b0c70011060303380acf@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-19 05:34, Doug Anderson wrote:
> Hi,
> 
> On Thu, Aug 12, 2021 at 12:42 AM Rajesh Patil <rajpat@codeaurora.org> 
> wrote:
>> 
>> @@ -542,8 +561,305 @@
>>                         #address-cells = <2>;
>>                         #size-cells = <2>;
>>                         ranges;
>> +                       iommus = <&apps_smmu 0x123 0x0>;
>>                         status = "disabled";
>> 
>> +                       i2c0: i2c@980000 {
> 
> Not a full review of your patch (I think Matthias has already looked
> in a bunch of detail), but can I also request that you add i2c and spi
> aliases in your next spin (I think you have to spin this anyway,
> right?) Add these under the "aliases" mode before the mmc ones (to
> keep sort order good):
> 

ok I will add them.

Thanks
Rajesh

> i2c0 = &i2c0;
> i2c1 = &i2c1;
> i2c2 = &i2c2;
> i2c3 = &i2c3;
> i2c4 = &i2c4;
> i2c5 = &i2c5;
> i2c6 = &i2c6;
> i2c7 = &i2c7;
> i2c8 = &i2c8;
> i2c9 = &i2c9;
> i2c10 = &i2c10;
> i2c11 = &i2c11;
> i2c12 = &i2c12;
> i2c13 = &i2c13;
> i2c14 = &i2c14;
> i2c15 = &i2c15;
> 
> ...and these after:
> 
> spi0 = &spi0;
> spi1 = &spi1;
> spi2 = &spi2;
> spi3 = &spi3;
> spi4 = &spi4;
> spi5 = &spi5;
> spi6 = &spi6;
> spi7 = &spi7;
> spi8 = &spi8;
> spi9 = &spi9;
> spi10 = &spi10;
> spi11 = &spi11;
> spi12 = &spi12;
> spi13 = &spi13;
> spi14 = &spi14;
> spi15 = &spi15;
> 
> The "Quad SPI" doesn't get an alias, but that's OK. It doesn't have a
> well-defined number in the manual and it's fine to have it be
> auto-assigned. It's really just confusing when there's something with
> a well-defined number in the manual and it's a _different_ one in the
> logs. ;-)
> 
> -Doug
