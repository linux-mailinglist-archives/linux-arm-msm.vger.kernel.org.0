Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF9C3F6F06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 07:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238030AbhHYFyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 01:54:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232420AbhHYFy0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 01:54:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9130661212;
        Wed, 25 Aug 2021 05:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629870821;
        bh=OuVdKfR/MOuYBuzNycEWQRB8+cfvT8D53yuzUluBSe0=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=lWfGGAtXommJm8HbFE7PK3rWnM2Ku1enbbQBZExVftmvW7IhIE6tr/zNYRuBci8a0
         pTAudCS2VqAdfDTwNCoEyN73YqFS2GQfQPHpcSkdLMRHMOO3Jsu43pJAnPW6uqA6SM
         mBgbiONurHm0CQ7/dkaj2UfhtoP80hRDF9mAXCe82rdbPCW5w4J9P8u1S6cEp9HZbB
         VHvGXDMnnIhj0lukvuGZ/6f1mGoNgxtwknJ3d2U0+euK31ZQac/B+any40wHaWfBn2
         A/8un0oTT1Z555PAO9tZRKi1rViVHR0SSWy0qFexWt10xBLWpPAUodoLvahpgSMBp8
         Y4GTib4ywAPwg==
References: <20210824201433.11385-1-ftoth@exalondelft.nl>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <ftoth@exalondelft.nl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 1/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
Date:   Wed, 25 Aug 2021 08:53:23 +0300
In-reply-to: <20210824201433.11385-1-ftoth@exalondelft.nl>
Message-ID: <87v93u5au9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Ferry Toth <ftoth@exalondelft.nl> writes:

> This reverts commit e89bb4288378b85c82212b60dc98ecda6b3d3a70.
>
> The commit is part of a series with commit
> 24f779dac8f3efb9629adc0e486914d93dc45517 causing a BUG on dwc3
> hardware, at least on Intel Merrifield platform when configured
> through configfs:
> BUG: kernel NULL pointer dereference, address: 0000000000000008
> ...
> RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
> ...
> Call Trace:
>  dwc3_remove_requests.constprop.0+0x12f/0x170
>  __dwc3_gadget_ep_disable+0x7a/0x160
>  dwc3_gadget_ep_disable+0x3d/0xd0
>  usb_ep_disable+0x1c/0x70
>  u_audio_stop_capture+0x79/0x120 [u_audio]
>  afunc_set_alt+0x73/0x80 [usb_f_uac2]
>  composite_setup+0x224/0x1b90 [libcomposite]
>
> Pavel's suggestion to add
> `echo "adaptive" > functions/uac2.usb0/c_sync` to the configfs script
> resolves the issue.
> Thinh suggests "the crash is probably because of f_uac2 prematurely
> freeing feedback request before its completion. usb_ep_dequeue() is
> asynchronous. dwc2() may treat it as a synchronous call so you didn't
> get a crash."
>
> Revert as this is a regression and the kernel shouldn't crash depending
> on configuration parameters.
>
> Reported-by: Ferry Toth <fntoth@gmail.com>

this should be Signed-off-by ;-)

-- 
balbi
