Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474693F7ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 18:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhHYQom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 12:44:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:29539 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhHYQom (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 12:44:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204762260"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; 
   d="scan'208";a="204762260"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 09:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; 
   d="scan'208";a="598127309"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 Aug 2021 09:43:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 25 Aug 2021 19:43:45 +0300
Date:   Wed, 25 Aug 2021 19:43:45 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSZzQXzrry+DFU6X@kuha.fi.intel.com>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSZned9v1+ajzVx0@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 25, 2021 at 08:53:29AM -0700, Bjorn Andersson wrote:
> On Wed 25 Aug 01:18 PDT 2021, Bryan O'Donoghue wrote:
> 
> > On 25/08/2021 06:51, Felipe Balbi wrote:
> > > > Hi Peter, I took a proper look at this again, hoping to find a way to
> > > > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> > > > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> > > > changes.
> > > I would rather keep the strict separation between glue and core.
> > 
> > # 1 __dwc3_set_mode
> > Felipe wants to keep a strict separation between core and glue
> > 
> > # notifier
> > Requires the core probe() to complete before the glue probe to work
> > reliably. This then would lead us to remaking the dwc3-qcom::probe() to
> > facilitate probe deferral.
> > 
> > We can be sure bugs would be introduced in this process.
> > 
> > AFAIK Felipe is not opposed to this, Bjorn likes it

Notifiers were proposed for the USB role switches already some time
ago [1], and I don't think anybody was against them, but in the end I
don't think there were any users for those notifier, so they were
never added.

If something needs to only react to the role changes like I think in
this case, then I would just add those notifiers to the USB role
switches.

[1] https://lore.kernel.org/linux-usb/20191002231617.3670-3-john.stultz@linaro.org/

> Using a notifier or just a direct callback from core to the glue is an
> implementation detail, but as you say we need a way for the glue to
> register this before the core is fully probed.

There was an idea to add bind and unbind callbacks to the software
nodes (callbacks that would be called when a device is bind to the
node) at one point in order to solve this kind of problems.

In this case it would work so that you would supply a software node
for the role switch in your glue driver (that part is not a problem),
and then if the bind of that software node is called, you know the
role switch was registered, and you can acquire the handle to it
safely and start listening notifications from it.

But I don't know if that's a very sophisticated solution.

thanks,

-- 
heikki
