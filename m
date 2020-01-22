Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD4A145F8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 00:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgAVX6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 18:58:17 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:37868 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726004AbgAVX6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 18:58:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579737496; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OH8pQcd+TxVTrS6N0gsCUveKud21QjiYBYSAEiMRoEM=;
 b=pxSOx/Py9jc/OezHund367lWa7cbdyQL2wFco55I1gJ2fW2DAzWFL5xl/fpiJO+o/zkYbKOc
 joUl+QENhyyX8GtIP+oV5anEEVpwlwpVaWGrMWJKrWXHKO4eQfsDPXQ1FiUGNY6JI7kst+r8
 2XEFB1+Fx/pqE/eb7OahdkmUJb4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e28e198.7fdff35e6228-smtp-out-n03;
 Wed, 22 Jan 2020 23:58:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEECDC433A2; Wed, 22 Jan 2020 23:58:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F33BC43383;
        Wed, 22 Jan 2020 23:58:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Jan 2020 15:58:15 -0800
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
In-Reply-To: <20200122230849.GC3261042@ripper>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
 <60c10082ba90fbba0f056df8575d205f@codeaurora.org>
 <20200122230849.GC3261042@ripper>
Message-ID: <2ffeff6b57e6bb4567f00c09e5b82131@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-22 15:08, Bjorn Andersson wrote:
> On Wed 22 Jan 14:56 PST 2020, rishabhb@codeaurora.org wrote:
>> On 2019-12-26 21:32, Bjorn Andersson wrote:
>> > diff --git a/drivers/remoteproc/qcom_pil_info.c
> [..]
>> > +static int pil_reloc_probe(struct platform_device *pdev)
>> > +{
>> > +	struct pil_reloc *reloc;
>> > +
>> > +	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
>> > +	if (!reloc)
>> > +		return -ENOMEM;
>> > +
>> > +	reloc->dev = &pdev->dev;
>> > +	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
>> If there are multiple entries like "pil-reloc" in the imem node
>> mapping the entire imem multiple times may not work. Is there a way
>> we can somehow just iomap the required region for pil?
> 
> With the entire imem being represented as a syscon this will be
> ioremapped once and all callers of syscon_node_to_regmap() (or one of
> the other syscon getters) will get a regmap back that reference this 
> one
> mapping.
> 
> So doing it this way allow us to "map" sections of imem that is smaller
> than PAGE_SIZE.
> 
> 
> That said, it means that all imem users/clients should access imem
> through this syscon regmap.
> 
> Regards,
> Bjorn
Yes, the clients are spread around in different drivers currently.
So accessing same regmap is not possible.
