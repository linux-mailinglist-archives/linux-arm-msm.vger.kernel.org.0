Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1D63B8BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 03:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238306AbhGABO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 21:14:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38073 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238291AbhGABO6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 21:14:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625101949; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Q7PapGSaWPR00xB20bhIktvihaeRm2Mmc6GEc+phKIQ=; b=miqsua3fPjRtoQazJDA3Dpl33Rrq6UFLKUIS0AaCTNx+RVgdo63pBFfE3s+GqBDKT5J2/FuH
 iiqzg8jm5852wCx742sEkmDzfCMvblwG0V2X5W7k7MaB28W+toghKCkxfzWnmcdJIIKkGw55
 beChwmh4bzoLUuCtQotspqFlkCY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60dd167b2a2a9a97618c4b9c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Jul 2021 01:12:27
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85AC4C4338A; Thu,  1 Jul 2021 01:12:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91D90C433F1;
        Thu,  1 Jul 2021 01:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91D90C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 30 Jun 2021 18:12:24 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and
 register role switch
Message-ID: <20210701011153.GF25299@jackp-linux.qualcomm.com>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
 <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com>
 <YNuC0Njwr4B1Q1xZ@yoga>
 <0f112cf5-1f71-f189-5a3a-2ff4dbcaa8e8@linaro.org>
 <d8902c0d-ae51-644d-f33b-19f452308097@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8902c0d-ae51-644d-f33b-19f452308097@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 03:21:46AM +0100, Bryan O'Donoghue wrote:
> On 29/06/2021 22:57, Bryan O'Donoghue wrote:
> > On 29/06/2021 21:30, Bjorn Andersson wrote:
> > > I liked this, and it worked when I tested it, but iirc it suffered from
> > > the problem that the core's probe may or may not have finished
> > > successfully at the time that of_platform_populate() returns.
> > > 
> > > But fixing this problem would save us quite a bit of headache.
> > 
> > OK.
> > 
> > I will take a look at resurrecting the old patches either fixing the
> > probe order - or perhaps using something like Wesley's role-switch to
> > have dwc3 core optionally trigger dwc3-qcom
> > 
> > Binding tcpm into &usb_1_dwc3 instead of &usb_1
> > 
> > ---
> > bod
> 
> So here's a potential way forward. Not technically breaking my "no patches
> at 3am rule"
> 
> Basically we can fix the probe order problem if we have dwc3 drd call into
> dwc3-qcom.
> 
> In order to make that not be a problem for all non qcom platforms - use a
> function with weak binding in drd - which a wrapper - in this case the qcom
> wrapper can over ride..

I'm afraid I'm not too familiar with weak symbols. Would that still work
if dwc3 & dwc3-qcom are built as modules? Also is it supported with
Clang/LLVM?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
