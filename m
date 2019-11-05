Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04265EF36C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 03:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbfKEC3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 21:29:19 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33618 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbfKEC3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 21:29:18 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F273860D7C; Tue,  5 Nov 2019 02:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572920958;
        bh=Yz5Pb8QULVWB/wXiv94o8i3LmKowXMZZDYSjNSX+YYE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KMrEoYr7M6bHTfQlUE95lDjwsoTzyLiP5R3gkcrVa1m4egtX/F0oemWDJVsxvY/hK
         55B4UwnHgdG6cI8cHTOsd44mnaHy47UJRf3X79lQF5/H8POiJjFl5Q9ll4Go7gM45g
         oO+gY50kDBXYlaUr4EkVgjxco1XG90Y7bWA9rWXg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id D7C0A60A50;
        Tue,  5 Nov 2019 02:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572920956;
        bh=Yz5Pb8QULVWB/wXiv94o8i3LmKowXMZZDYSjNSX+YYE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nOZWF/RoEvUPPAGGW4QIZHLAQSS4OIBQOQLn7EYM2wnXbIbZKtcSskHUMqdzsXoQA
         yydh3m/fcShh8F6O9tE18yXu/3en+U+vhsoNEvU+v8+h1q0yMoaY/pIBhTIcHGR+bw
         ICPY3t+Qoie730Vb298af7ROBz0NB3l1zniDWxUw=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Nov 2019 07:59:16 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     bjorn.andersson@linaro.org, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
In-Reply-To: <20191104162339.GD24909@willie-the-truck>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
 <20191101163136.GC3603@willie-the-truck>
 <af7e9a14ae7512665f0cae32e08c8b06@codeaurora.org>
 <20191101172508.GB3983@willie-the-truck>
 <119d4bcf5989d1aa0686fd674c6a3370@codeaurora.org>
 <20191104051925.GC5299@hector.lan> <20191104151506.GB24909@willie-the-truck>
 <20191104162339.GD24909@willie-the-truck>
Message-ID: <8d20a6af33b80191d44db97b757d0dfa@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-04 21:53, Will Deacon wrote:
> On Mon, Nov 04, 2019 at 03:15:06PM +0000, Will Deacon wrote:
>> On Sun, Nov 03, 2019 at 11:19:25PM -0600, Andy Gross wrote:
>> > On Fri, Nov 01, 2019 at 11:01:59PM +0530, Sai Prakash Ranjan wrote:
>> > > >>> What's the plan for getting this merged? I'm not happy taking the
>> > > >>> firmware
>> > > >>> bits without Andy's ack, but I also think the SMMU changes should go via
>> > > >>> the IOMMU tree to avoid conflicts.
>> > > >>>
>> > > >>> Andy?
>> > > >>>
>> > > >>
>> > > >>Bjorn maintains QCOM stuff now if I am not wrong and he has already
>> > > >>reviewed
>> > > >>the firmware bits. So I'm hoping you could take all these through IOMMU
>> > > >>tree.
>> > > >
>> > > >Oh, I didn't realise that. Is there a MAINTAINERS update someplace? If I
>> > > >run:
>> > > >
>> > > >$ ./scripts/get_maintainer.pl -f drivers/firmware/qcom_scm-64.c
>> > > >
>> > > >in linux-next, I get:
>> > > >
>> > > >Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
>> > > >linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
>> > > >linux-kernel@vger.kernel.org (open list)
>> > > >
>> > >
>> > > It hasn't been updated yet then. I will leave it to Bjorn or Andy to comment
>> > > on this.
>> >
>> > The rumors of my demise have been greatly exaggerated.  All kidding aside, I
>> > ack'ed both.  Bjorn will indeed be coming on as a co-maintener at some point.
>> > He has already done a lot of yeomans work in helping me out the past 3 months.
>> 
>> Cheers Andy, and I'm pleased to hear that you're still with us! I've 
>> queued
>> this lot for 5.5 and I'll send to Joerg this week.
> 
> Bah, in doing so I spotted that the existing code doesn't handle error 
> codes
> properly because 'a0' is unsigned. I'll queue the patch below at the 
> start
> of the series.
> 
> Will
> 
> --->8
> 
> From a9a1047f08de0eff249fb65e2d5d6f6f8b2a87f0 Mon Sep 17 00:00:00 2001
> From: Will Deacon <will@kernel.org>
> Date: Mon, 4 Nov 2019 15:58:15 +0000
> Subject: [PATCH] firmware: qcom: scm: Ensure 'a0' status code is 
> treated as
>  signed
> 
> The 'a0' member of 'struct arm_smccc_res' is declared as 'unsigned 
> long',
> however the Qualcomm SCM firmware interface driver expects to receive
> negative error codes via this field, so ensure that it's cast to 'long'
> before comparing to see if it is less than 0.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/firmware/qcom_scm-64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom_scm-64.c 
> b/drivers/firmware/qcom_scm-64.c
> index 91d5ad7cf58b..25e0f60c759a 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -150,7 +150,7 @@ static int qcom_scm_call(struct device *dev, u32
> svc_id, u32 cmd_id,
>  		kfree(args_virt);
>  	}
> 
> -	if (res->a0 < 0)
> +	if ((long)res->a0 < 0)
>  		return qcom_scm_remap_error(res->a0);
> 
>  	return 0;

Fixes: 6b1751a86ce2 ("firmware: qcom: scm: Add support for ARM64 SoCs") 
?

FWIW, Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
