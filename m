Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0A432F185
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 18:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhCERkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 12:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhCERjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 12:39:48 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87478C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 09:39:48 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id z5so1773371plg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 09:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0U/5k+q/HJ1YlYlyAATLdvdzgFw3Kh+iX+qoDNdFdc8=;
        b=AYGddGvVV9JNaZ72VmtfGsuOKbRA/FCZWvlh7Z3BV10+vNHMqUrtA9h2RhaLtW3+80
         GFTs756gi65p5PmZDecnyP8D9yJu1lz1sk7Os77rlIfpZUi60RAPHUEEsTWbuyn+5F7b
         8S8rioR5X3rcx0s3pFQDnD/9CJd9fPg1CIsKSfMbLhljqfsa25USxt1V10bemt1Y3oyR
         RSU2KDzfEtiNYNgpjbL3zz1HzMywgh8p4CQBVvNM6Zxx5bNIyDFG5hD7V1HKFcxx6MyA
         c5ald3CQqVEsuXGJyBSuhlrVlxwoHX4Tiwn5hiKnbNc0xRLcI99GatlWWvxQX9W47e3r
         bF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0U/5k+q/HJ1YlYlyAATLdvdzgFw3Kh+iX+qoDNdFdc8=;
        b=ROZFzdh6w7ITPdSlzxv7ds1CjGsU3uKJYnXe2aUUFrcVyhKMNR88V6UAQdvynWDerA
         KaqFyYPqKO3Wo3vb9iaHX7Y1pBlhq+sghHlGioS0W3WbWfls4PvAvzqu0iF23PSbxbsy
         EgOmU7Qxwnb23dI7GeELTRG0BkYlNjdKl2VhXnBOqH9WSlc7MeDa2YQXVeXrtQ2toCuw
         1SOjNCBfhWdkob42cLD451M9nP4dTo7kxVHN0D9H7cgibsFLU4Hmv1Dem2XTEijMIzlt
         petSGk+1c+Kz9+pPAeQQndj1HHbDcmwSxY/qVEBawhsYYFim2/i0XdiOm7ad+M7qZWFi
         XyMQ==
X-Gm-Message-State: AOAM533GCx/AmETOyHRpkmTGRQgm6MVhp3JoRY8msbStcCS4lD0hLdSZ
        9ZGXPaXfaeJyjazg6NnwfD2+bA==
X-Google-Smtp-Source: ABdhPJzQuiVScsJZfLsQeeYPIMvlqkVTgipz2lTEd++UI4HjY8Nuw1xrqt+7oZEme9eA+6nAx101bg==
X-Received: by 2002:a17:90a:540c:: with SMTP id z12mr11003937pjh.163.1614965987931;
        Fri, 05 Mar 2021 09:39:47 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d6sm2681398pjs.38.2021.03.05.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 09:39:47 -0800 (PST)
Date:   Fri, 5 Mar 2021 10:39:45 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 15/16] rpmsg: char: no dynamic endpoint management for
 the default one
Message-ID: <20210305173945.GB3885132@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
 <20210304184034.GA3854911@xps15>
 <d5a451e1-3dac-f665-aabd-bd72afc88b75@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a451e1-3dac-f665-aabd-bd72afc88b75@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 12:09:37PM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 3/4/21 7:40 PM, Mathieu Poirier wrote:
> > There has to be a capital letter at the start of the title:
> > 
> > rpmsg: char: No dynamic endpoint management for the default one
> > 
> > Please fix for all the patches.
> 
> Ok, I will update the subjects with capital letter in my next revision.
> 
> Just for my information, is it a new rule? kernel documentation [1] gives a
> canonical subject and an example without capital letter.

I don't think it is a rule but in the past few years the trend has been to
use a capital letter.  I was convinced the documentation had a capital letter
but you have proven that it doesn't so you can ignore this part if you wish.

> 
> [1]
> https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#the-canonical-patch-format
> 
> > 
> > On Fri, Feb 19, 2021 at 12:15:00PM +0100, Arnaud Pouliquen wrote:
> >> Do not dynamically manage the default endpoint. The ept address must
> >> not change.
> >> This update is needed to manage the RPMSG_CREATE_DEV_IOCTL. In this
> >> case a default endpoint is used and it's address must not change or
> >> been reused by another service.
> > 
> > The above is very difficult to understand.  I am not sure about introducing
> > RPMSG_CREATE_DEV_IOCTL in this patchset.  More on that in an upcoming comment.
> 
> The purpose of this revision was mainly to provide a view of what we could do to
> provide a more generic control interface.
> 
> To simplify the review I can remove the RPMSG_CREATE_DEV_IOCTL management and
> send it as a next step, in a separate patchset.

Yes, it would make this patchset quite simple.

> 
> > 
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
> >>  1 file changed, 21 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index c98b0e69679b..8d3f9d6c20ad 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -114,14 +114,23 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >>  	struct rpmsg_endpoint *ept;
> >>  	struct rpmsg_device *rpdev = eptdev->rpdev;
> >>  	struct device *dev = &eptdev->dev;
> >> +	u32 addr = eptdev->chinfo.src;
> >>  
> >>  	get_device(dev);
> >>  
> >> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> >> -	if (!ept) {
> >> -		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> >> -		put_device(dev);
> >> -		return -EINVAL;
> >> +	/*
> >> +	 * The RPMsg device can has been created by a ns announcement. In this
> >> +	 * case a default endpoint has been created. Reuse it to avoid to manage
> >> +	 * a new address on each open close.
> >> +	 */
> > 
> > Here too it is very difficult to understand because the comment
> > doesn't not describe what the code does.  The code creates an enpoint if it
> > has not been created, which means /dev/rpmsgX was created from the ioctl. 
> 
> Right, not enough explicit
> 
> Thanks,
> Arnaud
> 
> > 
> >> +	ept = rpdev->ept;
> >> +	if (!ept || addr != ept->addr) {
> >> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> >> +		if (!ept) {
> >> +			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> >> +			put_device(dev);
> >> +			return -EINVAL;
> >> +		}
> >>  	}
> >>  
> >>  	eptdev->ept = ept;
> >> @@ -133,12 +142,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >>  static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> >>  {
> >>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> >> +	struct rpmsg_device *rpdev = eptdev->rpdev;
> >>  	struct device *dev = &eptdev->dev;
> >>  
> >> -	/* Close the endpoint, if it's not already destroyed by the parent */
> >> +	/*
> >> +	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
> >> +	 * default one.
> >> +	 */
> >>  	mutex_lock(&eptdev->ept_lock);
> >>  	if (eptdev->ept) {
> >> -		rpmsg_destroy_ept(eptdev->ept);
> >> +		if (eptdev->ept != rpdev->ept)
> >> +			rpmsg_destroy_ept(eptdev->ept);
> >>  		eptdev->ept = NULL;
> >>  	}
> >>  	mutex_unlock(&eptdev->ept_lock);
> >> -- 
> >> 2.17.1
> >>
