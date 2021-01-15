Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F442F81B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 18:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbhAORKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 12:10:10 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:31662 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbhAORKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 12:10:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610730584; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=aiKLgWl9D/qmUkm2ChFG0sCHujSYfskh5yLKLQlSwFY=; b=BxNG5Eblw+QVD6RK3FDLr2kvqhWsJf4X5qnOLhoQEWZomVI5jPKAwK1vSEEO5IFODnCmwohC
 //o/bBLDTMlOTlHEj3QDpxRuWciNBQn1/hNz526MN60bQ4w/+cbEZcUQYiCndyJHem8TMnDk
 iaalwzYUNQgzEDP+rtlvntkgiIA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6001cc37859d74370ddbd08e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 17:09:11
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4965FC43468; Fri, 15 Jan 2021 17:09:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 590D7C43464;
        Fri, 15 Jan 2021 17:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 590D7C43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 15 Jan 2021 09:09:06 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
Message-ID: <20210115170906.GB5063@jackp-linux.qualcomm.com>
References: <20210115104047.3460-1-jackp@codeaurora.org>
 <20210115104047.3460-2-jackp@codeaurora.org>
 <2c5481fe-f5be-5d6a-f62f-c93d04b9210e@somainline.org>
 <20210115124736.GF2771@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115124736.GF2771@vkoul-mobl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On Fri, Jan 15, 2021 at 06:17:36PM +0530, Vinod Koul wrote:
> On 15-01-21, 12:54, Konrad Dybcio wrote:
> > I might be wrong but it looks as if you forgot to add a compatible
> > for the "sm8350_usb3_uniphy_cfg" configuration.

I believe Konrad was referring to the driver in which I had neglected to
add the compatible to the qcom_qmp_phy_of_match_table. My mistake.

> It seems to be documented in patch 2, ideally we should have the
> bindings patches first and this as patch 3...

Ok. I think driver change would be patch 2 rather, with the bindings in
patch 1? Patch 3 and 4 are dt-bindings updates to the SNPS Femto PHY and
DWC3 QCOM docs respectively.

Will send v2, thanks.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
