Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D8E39E171
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 18:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhFGQHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 12:07:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15522 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230220AbhFGQHA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 12:07:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623081909; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Cc: To:
 From: Date: Sender; bh=Hu7hZRn9/CiOlHP4zv466pCsqGDUOMHQFg60eY5w1oY=; b=LxuCGtkbfVNWbrjzt51qnOIkjRbMZGC+xkJntsspT2OHhErNiPRgNaIyWtJa6WCr70LR7ZzZ
 VwsltPiBeoPf2DMTYMtLo+fckQ/xCQx/D6wUdpVR46IFNbqOzR/QIoXkWJ5mGI+i7aVI81Ob
 LeAehlOvxrZ2zdGhPdWPIs9G+VU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60be439c265e7370f70a8780 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 16:04:44
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05A7BC43460; Mon,  7 Jun 2021 16:04:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BEB5AC433D3;
        Mon,  7 Jun 2021 16:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BEB5AC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Mon, 7 Jun 2021 09:04:38 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>, balbi@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
Message-ID: <20210607160438.GA2975@jackp-linux.qualcomm.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLoUiO8tpRpmvcyU@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Wesley,

On Fri, Jun 04, 2021 at 01:54:48PM +0200, Greg KH wrote:
> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
> > Changes in V9:
> >  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
> >    add the property by default from the kernel.
> 
> This patch series has one build failure and one warning added:
> 
> drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
>   653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>       |                                             |
>       |                                             u32 {aka unsigned int}
> In file included from drivers/usb/dwc3/debug.h:14,
>                  from drivers/usb/dwc3/gadget.c:25:
> drivers/usb/dwc3/core.h:1493:45: note: expected ‘struct dwc3 *’ but argument is of type ‘u32’ {aka ‘unsigned int’}
>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>       |                                ~~~~~~~~~~~~~^~~

I'm guessing you were previously using the DWC3_MDWIDTH macro which
operated on the 'hwparams0' reg value directly, but probably had to
switch it to the dwc3_mdwidth() inline function that Thinh had replaced
it with recently. Forgot to compile-test I bet? :)

> drivers/usb/dwc3/dwc3-qcom.c: In function ‘dwc3_qcom_of_register_core’:
> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of function ‘of_add_property’; did you mean ‘of_get_property’? [-Werror=implicit-function-declaration]
>   660 |                 ret = of_add_property(dwc3_np, prop);
>       |                       ^~~~~~~~~~~~~~~
>       |                       of_get_property

Scratched my head on this one a bit, since 'of_add_property' is clearly
declared in <linux/of.h> which dwc3-qcom.c directly includes. Then I
looked closer and saw the declaration only in case of #ifdef CONFIG_OF
and noticed it doesn't have a corresponding no-op static inline
definition in the case of !CONFIG_OF. Again I'm guessing here that Greg
must have built on a non-OF config.  We should probably include a patch
that adds the stub.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
