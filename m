Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F813FE6AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 02:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244138AbhIBA3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 20:29:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15809 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243810AbhIBA3M (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 20:29:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630542495; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=BpMsY1jdJn9vV9BVN++XtWtWBzsDBD0Qi5rln/LVvzA=; b=QmBaMsvtklFod84APo8YQJqvsqYT/Z98ayHIjzxMMYmiipglexQR3bWlg6fRz+dRHRtAQnNI
 QI92VMO3sM7u8rCJ55atM79tltcOrmJsKw4IN1OThjjVczF5OnJYX2+mnBlCe+TffLbr/gCx
 56Udt7vIP+EpE+kL0XYN7OS7RaU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61301a9e6fc2cf7ad93bf463 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 00:28:14
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 203B4C4361B; Thu,  2 Sep 2021 00:28:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FF4AC43460;
        Thu,  2 Sep 2021 00:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7FF4AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Wed, 1 Sep 2021 17:28:04 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Message-ID: <20210902002804.GA3500@jackp-linux.qualcomm.com>
References: <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com>
 <874kchvcq0.fsf@kernel.org>
 <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com>
 <8735raj766.fsf@kernel.org>
 <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <60e57455-3768-ab1c-efad-b6a64e592b36@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60e57455-3768-ab1c-efad-b6a64e592b36@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thinh,

On Sat, Aug 21, 2021 at 02:57:07AM +0000, Thinh Nguyen wrote:
> I took a look at 24f779dac8f3 ("usb: gadget: f_uac2/u_audio: add
> feedback endpoint support") that Ferry reported the issue from
> bisection. I see at least a couple problems in the new UAC2 changes.
> 
> 1) usb_ep_dequeue() is asynchronous. Don't free requests before the
> controller driver give them back.
> 
> 2) Did you test with SuperSpeed? I don't see companion descriptor.

We caught this too when testing f_uac2 in SuperSpeed mode.  I can
prepare a patch.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
