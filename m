Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B2A18F508
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbgCWMwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:60412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727326AbgCWMwV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:52:21 -0400
Received: from localhost (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B322D2072E;
        Mon, 23 Mar 2020 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584967940;
        bh=DY88PuCHaTN9NSRxAloLDWETeF3AT38ZTE7EJ/TduhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pn7W7+/9n/QoCr2K/PZCRilbr4813vNBelF93mu4/AEv+W/1vwN0Mo2GCZkrD274f
         pxIwC1bXfRuRtFJrcfk7seOqMGRQmgyZCaUCZrO+bLzbAT87eH0/UHH6bvLoeHl+We
         K/Zgg0H8LdGdSTI42kLHlLGEP+pUOwkJSAqcUY5s=
Date:   Mon, 23 Mar 2020 18:22:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        tiwai@suse.de, broonie@kernel.org, gregkh@linuxfoundation.org,
        jank@cadence.com, slawomir.blauciak@intel.com,
        Bard liao <yung-chuan.liao@linux.intel.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Hui Wang <hui.wang@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
Message-ID: <20200323125215.GO72691@vkoul-mobl>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
 <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-03-20, 17:01, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2020 16:29, Pierre-Louis Bossart wrote:
> > Add new device as a child of the platform device, following the
> > following hierarchy:
> > 
> > platform_device
> >      sdw_master_device
> >          sdw_slave0
> 
> Why can't we just remove the platform device layer here and add
> sdw_master_device directly?

In the case platform_device is the OF device your controller gets probed
on.

My thinking on this is that drivers should not be directly creating
sdw_master_device but it should be done by core as this device is for
core to use and handle. Ideally I would love that sdw_master_device is
created/handled by core, preferably this be handled as part of
sdw_add_bus_master().

But Pierre is trying to solve the limitation of the devices given by
ACPI and trying to add sdw_master_driver to handle that. I am not
convinced that we should do that.

-- 
~Vinod
