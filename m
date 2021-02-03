Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982CB30D5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 10:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbhBCJJk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 04:09:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:46984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233222AbhBCJH3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 04:07:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AF9664E36;
        Wed,  3 Feb 2021 09:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612343208;
        bh=cfXwA5vl+xRuEQ7jto4OYIHNb7RwjaGVIgBR90aVD5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j27MRuHrFC3WmDJ8mJJU5+/F2g6VCEDrTEcon21wZVNNlP9R+QNrcYM51/cjLAfs+
         Lune3W+vbY0rdHalwdVP+ps3bknb44+7kMzz22NrBnpAjBAZlvsU0xA87J0gTsfpLO
         KbVUCS+J+Cpm/CfxithtHXt+9piD62q6UyG2vgq4=
Date:   Wed, 3 Feb 2021 10:06:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <YBpnpj+0KHM1Q8l8@kroah.com>
References: <20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru>
 <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
 <YBnZ8O+zI/dzrjDQ@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBnZ8O+zI/dzrjDQ@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 02, 2021 at 05:02:08PM -0600, Bjorn Andersson wrote:
> On Sat 05 Dec 09:56 CST 2020, Serge Semin wrote:
> 
> > In accordance with the USB HCD/DRD schema all the USB controllers are
> > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > existing DT-nodes will be renamed in a subsequent patch let's first make
> > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > deprecated naming so not to fail on the legacy DTS-files passed to the
> > newer kernels.
> > 
> 
> Felipe, will you merge this, so that I can merge the dts patch depending
> on this into the Qualcomm DT tree?

Patches this old are long-gone out of our queues.  If it needs to be
applied to a linux-usb tree, please resend.

thanks,

greg k-h
