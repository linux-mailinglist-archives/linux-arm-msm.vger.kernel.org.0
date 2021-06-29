Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD54D3B790A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbhF2UFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:05:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51423 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbhF2UFO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:05:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624996967; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=6Dl4pm55MpgtMvrfkDkpke79tJx6kRqDei3JfU0wPLE=; b=wGEekuqlkezI/dykG8Uf4pbsr4TY1Gv2q69abj7zCMvrRZrA+Bu35AxtVn7s7z6hizv4HYyJ
 BgnElaH+kw9xgIjG1/W9vROH4bImtroznP2v33xEmspRMScMSoacB/ej2GRJlVbOIcjMGHNQ
 9AI8wMfVKcXw9gNH9C6QMjrhUYE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60db7c5aad0600eede79f880 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Jun 2021 20:02:34
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B710BC43217; Tue, 29 Jun 2021 20:02:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A0C0C433F1;
        Tue, 29 Jun 2021 20:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A0C0C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 29 Jun 2021 13:02:28 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and
 register role switch
Message-ID: <20210629200228.GE25299@jackp-linux.qualcomm.com>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
 <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 08:23:46PM +0100, Bryan O'Donoghue wrote:
> On 29/06/2021 16:48, Bjorn Andersson wrote:
> > What's wrong with the switch that dwc3_setup_role_switch() sets up?
> > 
> > That's what I've been using in my UCSI hacking on Snapdragon 888 and it
> > seems to work...

Bjorn are you exercising dual-role or just host mode?

> A good question, which as soon as you asked it made me completely doubt if
> I'd tested the tree without the patch applied.
> 
> I reverted both on my working tree and indeed it breaks role-switch
> detection.
> 
> In TCPM the connector is a child node of TCPM
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?h=usb-next-5.13.rcx-rb5-tcpm
> line 1396
> 
> We use a remote endpoint inside of TCPM to hook up into &usb_1 line 1303
> 
> Not entirely sure what the graph tree looks like in your USCI case but I
> guess the connector is a child node of the controller ?
> 
> But I think your question is why bother with the role-switch in dwc3-qcom
> 
> dwc3_qcom_vbus_override_enable(){} is switching bits that probably ought to
> be in the PHY but for whatever reason ended up being buried in the qcom-dwc3
> wrapper.

This. When switching dwc3 into peripheral mode we also need
dwc3_qcom_vbus_override_enable() to write those registers to manually
drive the UTMI VBUS valid signal high to the controller since our SoCs
are never physically wired to the connector's VBUS. These registers
(QSCRATCH_{HS,SS}_PHY_CTRL) however don't belong to the PHYs but are
part of our dwc3 wrapper's IO map and hence dwc3-qcom is the only
appropriate place to handle them since dwc3-qcom has over the years
paired with several different PHYs depending on SoC.

Wesley's approach in $SUBJECT was to designate dwc3-qcom itself as a
usb-role-switch-able device so that in the DT the connector graph
endpoints would wire to the dwc3-qcom device itself instead of its dwc3
core child. The idea would be for dwc3-qcom would intercept the
role_switch_set call from TCPM/UCSI, call the vbus_override_enable() and
then pass on the notification to the child to let dwc3/drd.c handle the
rest.

IIRC there had been an alternate proposal to keep the role switch
connection only at the dwc3 core but in order to handle the vbus
override business an additional notification would have needed to be
done either from the usb_role_switch class driver or as an "upcall" from
dwc3 core -> glue. (found it, it was by you Bryan [1])

[1] https://lore.kernel.org/linux-usb/20200311191501.8165-7-bryan.odonoghue@linaro.org/

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
