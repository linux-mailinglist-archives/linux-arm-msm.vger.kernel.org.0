Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F493F6F04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 07:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbhHYFxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 01:53:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232420AbhHYFxe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 01:53:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74B8E61165;
        Wed, 25 Aug 2021 05:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629870769;
        bh=ifMd2rV7xzfwYhRjkhwSnMRDSIPtFHCO32Um4nDAlOY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=u2TGGRp4bi13aPxqx6YVth6OUdmMkEe8EDAAzvDc1KMGpMvBay1bi7WVSVOkGUDcG
         XANk3gHIfOkheZfnZ9II43cDMcvq+d+lE0/hJwyjST++rdq7vsnUaXmZpHJl2EqBp4
         wJNoPCtYU9qhSsKEQ/I1VonMF1OdBDIRvpqSls4JWtAp3Nezv6+dA2ouhxgKwHxa01
         TxzK/fNB7bdlssxLo3BzM934ItRX1Sl001xXUop5PLaKqXO2TFmAgFD/90ZlpTtGwj
         MlMw8OaHgSVs1f+2dpHtToq0r+eIdUgxtrMfVP4zMCWsrPVnkHkQqsqkIiOCsg+Eph
         E/7bLzHizFvZw==
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YSWCnsZDdp57KBqB@ripper>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd
 to dwc3-qcom
Date:   Wed, 25 Aug 2021 08:51:55 +0300
In-reply-to: <YSWCnsZDdp57KBqB@ripper>
Message-ID: <87zgt65avm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:
>
>> On 21-07-07 14:03:19, Bjorn Andersson wrote:
>> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
>> > 
>> > Allow me to reorder your two questions:
>> > 
>> > > And why using a notifier need to concern core's deferral probe?
>> > 
>> > The problem at hand calls for the core for somehow invoking
>> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
>> > 
>> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
>> > this (and stash the pointer). And this can't be done until dwc3-core
>> > actually exist, which it won't until dwc3_probe() has completed
>> > successfully (or in particular allocated struct dwc).
>> 
>> Maybe you misunderstood the notifier I meant previous, my pointer was
>> calling glue layer API directly.
>> 
>> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
>> allocated successfully, you could call glue layer notifier at function
>> dwc3_usb_role_switch_set directly.
>> Some references of my idea [1] [2]
>> 
>> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
>> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
>> 
>
> Hi Peter, I took a proper look at this again, hoping to find a way to
> pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> changes.

I would rather keep the strict separation between glue and core.

-- 
balbi
