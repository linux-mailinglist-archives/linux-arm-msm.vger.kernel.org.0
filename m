Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5EACEE64B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 18:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfKDRlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 12:41:35 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46726 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbfKDRlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 12:41:35 -0500
Received: by mail-pg1-f194.google.com with SMTP id f19so11760787pgn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 09:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lPIDgQKTrSezXBvWSPccLapRG8yo6gcHIljKbjtAJu0=;
        b=CUu1FmB3LjsCLSEP705SvIqj35uHr2X5ys8TEcTirMe4Xm0h+XWqfzbWLbA/hhtDBw
         eBlTxyj2xuSt7s0M3YUzkirkkX9V7uBiKPkWbfNsrubIH3WrdU/9DABtq8wDPUrFQXkG
         7ibo3Z1mBB3nyR9Q4tDPS0IrWjhg5zGf+d0yp+PbZyYuez8PqSX81RKDIMG4OY6FkQ0/
         ml3xQhwX4iBRmcnHBGtOrWcysVepLJo7C8TxzAl3LFclFOH9MxW3uoDksButKbroYTKP
         DO6Mo6b1c/qIjgpNcBQx7oTHpiAiZXJf6ppiFLI8Bm25SiQMVIEKLEQE+58JBZg+pY2/
         YEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lPIDgQKTrSezXBvWSPccLapRG8yo6gcHIljKbjtAJu0=;
        b=Ng1eTHPFhfi91LCUQsvT1/FRN93gfTEZzWtJAeAM58rzDPBN1uz4QnBsq3YUXdx4qn
         /U467Hzwk0cjeGnQbRl21JdkHl9+JF7tChT9e3PzI058HRZTrr60pWehPBxssqvGXxig
         kWg6xjG/hp7NFQ4WPYTCkMQEG1lYszIS8SHG6Cp7BfG9P49+yjh/CzLH0QZVThwA5BoE
         5TTCzwr9VqvuA4tzoKxIE/RZV+Dp+jMFQq1PnZBf1q24ZWVvo4zaxQKTegcKvVizlJ41
         KKUi045qTm6acfwYvXf/W69lx94jcPDIYZMnQn0ZI27JU92mb+YTCcQ87VuRSVD8lYdi
         Qr0A==
X-Gm-Message-State: APjAAAWCWVd/f0yQtCQzCDf06RpQ6Ff1mOggHn2VSqCG5hrMGQOuS+e5
        SftBfWsCtkeq40gzvmVA9SLT2w==
X-Google-Smtp-Source: APXvYqzzZ+dkZOr3JoygRmb96xE/xUJESRhqGzvY+WG7dsAngzbq/NLr5tF1PTBC6l38feevSQDYnQ==
X-Received: by 2002:a63:b62:: with SMTP id a34mr11473288pgl.123.1572889293842;
        Mon, 04 Nov 2019 09:41:33 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v14sm11345300pfm.51.2019.11.04.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:41:33 -0800 (PST)
Date:   Mon, 4 Nov 2019 09:41:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
Message-ID: <20191104174130.GA586@tuxbook-pro>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
 <20191101163136.GC3603@willie-the-truck>
 <af7e9a14ae7512665f0cae32e08c8b06@codeaurora.org>
 <20191101172508.GB3983@willie-the-truck>
 <119d4bcf5989d1aa0686fd674c6a3370@codeaurora.org>
 <20191104051925.GC5299@hector.lan>
 <20191104151506.GB24909@willie-the-truck>
 <20191104162339.GD24909@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104162339.GD24909@willie-the-truck>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Nov 08:23 PST 2019, Will Deacon wrote:

> On Mon, Nov 04, 2019 at 03:15:06PM +0000, Will Deacon wrote:
> > On Sun, Nov 03, 2019 at 11:19:25PM -0600, Andy Gross wrote:
> > > On Fri, Nov 01, 2019 at 11:01:59PM +0530, Sai Prakash Ranjan wrote:
> > > > >>> What's the plan for getting this merged? I'm not happy taking the
> > > > >>> firmware
> > > > >>> bits without Andy's ack, but I also think the SMMU changes should go via
> > > > >>> the IOMMU tree to avoid conflicts.
> > > > >>>
> > > > >>> Andy?
> > > > >>>
> > > > >>
> > > > >>Bjorn maintains QCOM stuff now if I am not wrong and he has already
> > > > >>reviewed
> > > > >>the firmware bits. So I'm hoping you could take all these through IOMMU
> > > > >>tree.
> > > > >
> > > > >Oh, I didn't realise that. Is there a MAINTAINERS update someplace? If I
> > > > >run:
> > > > >
> > > > >$ ./scripts/get_maintainer.pl -f drivers/firmware/qcom_scm-64.c
> > > > >
> > > > >in linux-next, I get:
> > > > >
> > > > >Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> > > > >linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
> > > > >linux-kernel@vger.kernel.org (open list)
> > > > >
> > > > 
> > > > It hasn't been updated yet then. I will leave it to Bjorn or Andy to comment
> > > > on this.
> > > 
> > > The rumors of my demise have been greatly exaggerated.  All kidding aside, I
> > > ack'ed both.  Bjorn will indeed be coming on as a co-maintener at some point.
> > > He has already done a lot of yeomans work in helping me out the past 3 months.
> > 
> > Cheers Andy, and I'm pleased to hear that you're still with us! I've queued
> > this lot for 5.5 and I'll send to Joerg this week.
> 
> Bah, in doing so I spotted that the existing code doesn't handle error codes
> properly because 'a0' is unsigned. I'll queue the patch below at the start
> of the series.
> 

Thanks, I've hit this a few times but missed this and assumed it was a
firmware issue...

In case you haven't published your branch:
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Will
> 
> --->8
> 
> From a9a1047f08de0eff249fb65e2d5d6f6f8b2a87f0 Mon Sep 17 00:00:00 2001
> From: Will Deacon <will@kernel.org>
> Date: Mon, 4 Nov 2019 15:58:15 +0000
> Subject: [PATCH] firmware: qcom: scm: Ensure 'a0' status code is treated as
>  signed
> 
> The 'a0' member of 'struct arm_smccc_res' is declared as 'unsigned long',
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
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index 91d5ad7cf58b..25e0f60c759a 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -150,7 +150,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
>  		kfree(args_virt);
>  	}
>  
> -	if (res->a0 < 0)
> +	if ((long)res->a0 < 0)
>  		return qcom_scm_remap_error(res->a0);
>  
>  	return 0;
> -- 
> 2.24.0.rc1.363.gb1bccd3e3d-goog
> 
