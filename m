Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FFD3A9173
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 07:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhFPF5R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 01:57:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:52490 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhFPF5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 01:57:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623822908; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pkBRrjdhwtfR2yNrj1LgdeYFeUlML6zfOlqdJn69wEA=;
 b=Nit/WpARr9aTtYadWRxqqSG8Y8PjJljHyDczt+9aGzQ8shtUHgD9+gCy9PoQU0KVBmf9mcn+
 tAVSeCvsdBrlM3hM0pbN8+LrzubcEJghJqnfEPz6QxHEf3zWompA2JPouyuvsB32y00QvuSL
 WrcD/gr7zU8SmBqy+OkqIuS0Gzg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60c9922ab6ccaab753b3470b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Jun 2021 05:54:50
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4275CC4338A; Wed, 16 Jun 2021 05:54:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCA56C433D3;
        Wed, 16 Jun 2021 05:54:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Jun 2021 11:24:48 +0530
From:   sbhanu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <YMlBBeT1VK5snsM7@builder.lan>
References: <1623252028-20467-1-git-send-email-sbhanu@codeaurora.org>
 <YMLbsZUojmYjM/j0@builder.lan>
 <64166450ddc927d10ad4b37dadf218b6@codeaurora.org>
 <0ce40daf1f8146f47b1877fb2c83cd95@codeaurora.org>
 <YMlBBeT1VK5snsM7@builder.lan>
Message-ID: <147a76286d85b3fc3e7b3060604b262b@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-16 05:38, Bjorn Andersson wrote:
> On Tue 15 Jun 03:56 CDT 2021, sbhanu@codeaurora.org wrote:
> 
>> On 2021-06-14 17:00, sbhanu@codeaurora.org wrote:
>> > On 2021-06-11 09:12, Bjorn Andersson wrote:
>> > > On Wed 09 Jun 10:20 CDT 2021, Shaik Sajida Bhanu wrote:
> [..]
>> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> [..]
>> > > > +		sdhc_1: sdhci@7c4000 {
> [..]
>> > > > +			sdhc1_opp_table: sdhc1-opp-table {
>> > >
>> > > No need for "sdhc1-" in the node name.
>> > ok
>> Hi,
>> 
>> For Sd card also we have opp-table info so if we remove "sdhc1-" here 
>> and
>> "sdhc2-" in Sd crad opp table we may have dublicate nodes so,
>> it is better to keep sdhc1 and sdhc2 in node numbers right.
>> 
> 
> Are you saying that /soc/sdhci@7c4000/opp-table needs to have a unique
> name to not collide with /soc/sdhci@8804000/opp-table?
> 
> Regards,
> Bjorn

yes

Thanks,
Sajida
