Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431B8432D52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbhJSFlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:41:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18853 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhJSFlX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:41:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634621951; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=FvSG1JjoiOkVx48jhYdHGI+1T4oq9+2kuA3u8qL+q48=; b=E66nN8h0GnJdXi/NawjEyGRSS1Q4bIZk+VP2MCT4dxxFXtPkyQ3skjEnT9HHNxw+CHnarm4x
 JjfMbEBrHZTcYgmt7F7VDMpPLgiQwtNFSgAagk6ptepzuelYDzciU8MfNp4eknxg2BC+iM/s
 WhHDbsGnkSC2jgh/ALeAhHrntN4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 616e59ed14914866fa5ba48a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 05:38:53
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F3FBC43618; Tue, 19 Oct 2021 05:38:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 759EEC43460;
        Tue, 19 Oct 2021 05:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 759EEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Mon, 18 Oct 2021 22:38:48 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Message-ID: <20211019053848.GC16586@jackp-linux.qualcomm.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
 <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
 <20211015005101.GA16586@jackp-linux.qualcomm.com>
 <9ecf98e9-0700-3a38-d056-5479f5188f4c@synopsys.com>
 <20211018072856.GB16586@jackp-linux.qualcomm.com>
 <205c4af2-37dd-6dbf-12ab-5111fadab530@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <205c4af2-37dd-6dbf-12ab-5111fadab530@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 19, 2021 at 02:38:30AM +0000, Thinh Nguyen wrote:
> Jack Pham wrote:
> > On Fri, Oct 15, 2021 at 10:20:48PM +0000, Thinh Nguyen wrote:
> >> TX endpoints should have non-zero GTXFIFOSIZ. Using the register as a
> >> flag to check whether it's been resized is not ok. Also, what happened
> >> after resizing the txfifo? Do you restore its previous default value?
> > 
> > The choice to use the resizing algorithm is a fixed setting determined
> > by device property.  So if it is enabled for a particular platform
> > instance, it means we don't intend to use any of the default values.
> > All the registers will get cleared to 0 upon every Set Configuration so
> > that each EP enable call thereafter will be starting from a clean slate.
> 
> Some fields of GTXFIFOSIZ may not get cleared. Depends on the controller
> version, we introduce different fields (as the case for DWC32 and
> DWC31). So this may not apply for all the time. I just noticed that the
> entire GTXFIFOSIZ was written with 0. Please only write to the specific
> fields with proper macros.

Hmm, I thought Wesley's original change already takes care to do that:

void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
{
...
	/* Clear existing TXFIFO for all IN eps except ep0 */
	for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
             num += 2) {
		dep = dwc->eps[num];
		/* Don't change TXFRAMNUM on usb31 version */
		size = DWC3_IP_IS(DWC3) ? 0 :
			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
                		DWC31_GTXFIFOSIZ_TXFRAMNUM;

		dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
		dep->flags &= ~DWC3_EP_TXFIFO_RESIZED;
	}
	dwc->num_ep_resized = 0;
}

Just before the write, the read is masked with the TXFRAMNUM bit in case
of !DWC3, i.e. DWC31 or DWC32.  The rest would be 0'ed out.  Sorry if my
previous reply implied the entire register was written as 0.

> > I can go ahead with V2 of this patch using this flag to be more clear.
> > 
> 
> I think using a flag is clearer also.

Thanks, and appreciate the reviewed-by you already replied with for v2!

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
