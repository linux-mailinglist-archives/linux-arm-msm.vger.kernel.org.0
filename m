Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA5C3F6F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 07:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238125AbhHYFzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 01:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:37952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232420AbhHYFzD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 01:55:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1385561212;
        Wed, 25 Aug 2021 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629870858;
        bh=wmjL9w2ZoY8OxCDTzWQ4QOrHwwaiCYA1Pt2DOMduG0Y=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=aBBn6u7pGddSuvxDOJohavpgZxxIfIgfS7LFniKKR2eo7+4vZB4hZdceKOFODgjyX
         EcmfvBm87lNoAC9am4HGFbkLT6QJUOtxdMc5ma5QDF1cLMj1Kvr/h+FJW7mwHJGaZU
         mHI8mttyOUW9dJ6MD6CY1UYrap44XfNPlb+ioFa5bU4FkagrBNhrug6oGEO1Fm4ZrZ
         UUGNAG/jhvUsX3fHRJ2M8TFzZiShfF6o1U/N5CwXcP295sqatlteAeh6bgiWkOSOmd
         UCylXBd1ZvmNIYzziGDR5F3Y0uFszgfkC9JiysP/NcOMePEUExsTvFrdK75Mcb3EjR
         yp6ee5usIXkXA==
References: <20210824201433.11385-1-ftoth@exalondelft.nl>
 <20210824201433.11385-2-ftoth@exalondelft.nl>
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
Subject: Re: [PATCH v1 2/3] Revert "usb: gadget: f_uac2: add adaptive sync
 support for capture"
Date:   Wed, 25 Aug 2021 08:53:57 +0300
In-reply-to: <20210824201433.11385-2-ftoth@exalondelft.nl>
Message-ID: <87r1ei5at8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Ferry Toth <ftoth@exalondelft.nl> writes:

> This reverts commit 40c73b30546e759bedcec607fedc2d4be954508f.
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

Signed-off-by?

-- 
balbi
