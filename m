Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1861ED600
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 20:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgFCSUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 14:20:35 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41976 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbgFCSUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 14:20:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591208430; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w6HeEmRM3pXLn2ekFS+/1eTGwOSBEOg/dSAacEoqx8k=;
 b=hG9HsTAdyubcLP1rbqbPUk8cSIIFwP77KJifyxJN8WZ2FqQWgVbgxtZh6MSDfoRVM6A+ZqrS
 Db0OHLt7EgO8RZ+YT3/xlTY/WUe1hfYhSu9CVPYTxgYSCBh/FplPFgXUpaGQ/xyalmfXjFPV
 zkPAJEk5kxMnaqAUhrbWClvht0E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ed7e9e82738686126fb37da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 18:20:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3DF9C43391; Wed,  3 Jun 2020 18:20:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35F91C433C6;
        Wed,  3 Jun 2020 18:20:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 23:50:23 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: qcom: Add graphics clock controller driver for
 SM8250
In-Reply-To: <20200603180943.GX11847@yoga>
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-9-jonathan@marek.ca>
 <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
 <20200529011127.GJ279327@builder.lan>
 <dbcb5c24f8888d6b0cfc63a80e310319@codeaurora.org>
 <20200603180943.GX11847@yoga>
Message-ID: <7b2620cf98dc915307d2a29f05eca454@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-06-03 23:39, Bjorn Andersson wrote:
> On Thu 28 May 23:56 PDT 2020, Sai Prakash Ranjan wrote:
> 
>> Hi Bjorn,
>> 
>> On 2020-05-29 06:41, Bjorn Andersson wrote:
>> > On Mon 25 May 02:47 PDT 2020, Sai Prakash Ranjan wrote:
>> >
>> > > Hi Jonathan,
>> > >
>> > > On 2020-05-25 02:36, Jonathan Marek wrote:
>> > > > Add support for the graphics clock controller found on SM8250
>> > > > based devices. This would allow graphics drivers to probe and
>> > > > control their clocks.
>> > > >
>> > > > This is copied from the downstream kernel, adapted for upstream.
>> > > > For example, GDSCs have been added.
>> > > >
>> > > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> > >
>> > > Since this is taken from downstream, maintain the original author's
>> > > signed-off and add yourself as the co-developer if you have done
>> > > any modifications. Same applies to all other patches.
>> > >
>> >
>> > I disagree with this.
>> >
>> > As expressed in the commit message, this patch is based on the
>> > downstream driver, not the individual patch.  As such, the _patch_ is
>> > prepared by Jonathan and by his Signed-off-by certifies the origin of
>> > the contribution per section 11.a or 11.b of submitting-patches.rst.
>> >
>> 
>> I lost at the downstream driver vs the individual patch here. So the
>> downstream driver is also an individual patch right or did I get
>> something completely wrong.
>> 
> 
> The downstream driver is the result of a series of patches, by various
> people, whom all use their Signed-off-by to denote that what they add 
> is
> conforming to the given license and that they have permission to
> contribute to the project.
> 
>> So if someone prepares a patch and includes a commit description
>> saying it is taken from downstream, does it mean he is the author
>> of that patch?
> 
> No, but I think the wording here is wrong. The patch is not taken from
> downstream, it's based on downstream code.
> 
>> Shouldn't the author be included in  "From: Author"
>> and his signed-off appear first before the submitter's(also a 
>> contributor)
>> signed-off?
> 
> It should, in the case that what is contributed is the forwarding of a
> patch found somewhere.
> 
> But as I said before, Jonathan does through his S-o-b state that his
> patch is based on previous work that is covered under appropriate open
> source license and that he has the right under that license to
> contribute said work.
> 
> As such, his patch is meeting the requirements.
> 
> 
> The other part is how to give credit to authors of the original work,
> Jonathan does that by stating that it's based on work in the downstream
> kernel - which is quite typical to how it's done.
> 
>> Or is it because these clock data is auto generated and it
>> doesnt really matter?
>> 
> 
> No. The author and s-o-b relates to license compliance, as such the
> person who committed the auto generated work will sign off that the
> content is license compliant and he/she is allowed to contribute it to
> the project.
> 

Thanks for these nice explanations.

Regards,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
