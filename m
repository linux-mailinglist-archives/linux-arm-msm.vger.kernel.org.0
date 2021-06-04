Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8869739B880
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 13:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFDL4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 07:56:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229682AbhFDL4g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 07:56:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3751561418;
        Fri,  4 Jun 2021 11:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622807690;
        bh=wZZG/mGZCjQQr4cb050WrblT+FLO7Xb59hw5tKouVLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G4CIy+pqEcWSE8N1ou8T1exRmZ2BhmHAs5z1o5iTrbZso2KcXVcJnKtaxrVZeb9Ai
         AJYgJuj7XI7Zp0rUtT4oxLV3QBHNqimHQYnNeUUHmMRcLkJyo8mJEYodpTFODqI2Wj
         kiyUQV19SLATSESTWjh+tZIdmFuKfs5DejDBMNnE=
Date:   Fri, 4 Jun 2021 13:54:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
Message-ID: <YLoUiO8tpRpmvcyU@kroah.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
> Changes in V9:
>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
>    add the property by default from the kernel.

This patch series has one build failure and one warning added:

drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
  653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
      |                                ~~~~~~~~~~~~~^~~~~~~~~~
      |                                             |
      |                                             u32 {aka unsigned int}
In file included from drivers/usb/dwc3/debug.h:14,
                 from drivers/usb/dwc3/gadget.c:25:
drivers/usb/dwc3/core.h:1493:45: note: expected ‘struct dwc3 *’ but argument is of type ‘u32’ {aka ‘unsigned int’}
 1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
      |                                ~~~~~~~~~~~~~^~~


drivers/usb/dwc3/dwc3-qcom.c: In function ‘dwc3_qcom_of_register_core’:
drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of function ‘of_add_property’; did you mean ‘of_get_property’? [-Werror=implicit-function-declaration]
  660 |                 ret = of_add_property(dwc3_np, prop);
      |                       ^~~~~~~~~~~~~~~
      |                       of_get_property


How did you test these?

thanks,

greg k-h
