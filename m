Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED96229EE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 20:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbgGVSDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 14:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgGVSDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 14:03:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A592C0619DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 11:03:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so1717275pgq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yWcfktADb3uPJbFkIiNC/fq9uZOsRANKyg7Yhrbd3tg=;
        b=XMpS/yfUE5QvKTqgqHXr498QBJt1LtXUBTlBwABMTYg0Endz9kTZGsNVoItzCCJ8JZ
         kBCM5saOtYxBLzG65jr1vE+X4/UzMu73f/A1NH+keySUjedHG6c6BI2LlBufsNrhATxN
         bVH3baDqsU8Nh8OwoeDBGNIQ54aggROKqB9px+29u7Cy+lea4Oy56Z/axz1FhQ42Fgvq
         +7ca24D4Qcfr83XGHgalFULZ9om5Fbfwf3QHAIAJB1cGJtn2M8oicM3DTaYflPkkDvWA
         ClceWQu4Ql4Ons+Ct9bcqc602uKrNDtogEo0tlJaIvxjU9ZCUCDBz6Fkpmw0a+exYJUm
         FN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yWcfktADb3uPJbFkIiNC/fq9uZOsRANKyg7Yhrbd3tg=;
        b=AW7rUtyUI/zI5Kb9UvwHKI2dOcZAz2GhS1oKaVaI8hzvibFSQsRqlxMQ+LuO+STDTz
         wAqAEQ18an3OOsUpx4TctQRUjYtS54c7A7UrO8r8IVnuDTNPj+TAOiTtycupfHXUXX8K
         XUdzLG6u0Dl9Jx0tiX27X3dAU7aJ1y45AzENRnT/INzXXdJOb0vlrXPyn58X+Hj3NMGC
         WLhFaWHcZnOOM7fiuOZKUG+t5xxVQpL00JeKpzzqEBVd535v9N1USqK2zKE5tTI9ESRn
         noNXYMb9RydrJ49nB2AKhltQkhv9YFc8kZbnzTnJB+Q9qB7ikIySywBGc0joSIM+8VXN
         TQlg==
X-Gm-Message-State: AOAM532X9BTezJLRy3VP/f3+EIAaO044jf6/0eKVdujLEtfkcmODwjvZ
        Xa7keUxxIGQGA7Jw06ieLbmmkw==
X-Google-Smtp-Source: ABdhPJw4CCh/JqUryfanhVXNO34PrKWEi7bBLUJ8EKXba3fX0MsU9Wcj2adh+VkHowSyvD3Dk78D3Q==
X-Received: by 2002:a63:c509:: with SMTP id f9mr920841pgd.144.1595441012822;
        Wed, 22 Jul 2020 11:03:32 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w9sm341994pja.39.2020.07.22.11.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 11:03:32 -0700 (PDT)
Date:   Wed, 22 Jul 2020 11:01:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, agross@kernel.org,
        ohad@wizery.com, corbet@lwn.net, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200722180139.GA3700915@builder.lan>
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
 <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
 <20200715201839.GA3204081@xps15>
 <20200715215149.GA3267350@xps15>
 <81d7514c-727e-b4dc-e4ac-74a25966ccaf@codeaurora.org>
 <20200721205635.GM2922385@builder.lan>
 <20200722171841.GA1268891@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722171841.GA1268891@xps15>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jul 10:18 PDT 2020, Mathieu Poirier wrote:

> On Tue, Jul 21, 2020 at 01:56:35PM -0700, Bjorn Andersson wrote:
> > On Tue 21 Jul 12:16 PDT 2020, Siddharth Gupta wrote:
> > > On 7/15/2020 2:51 PM, Mathieu Poirier wrote:
> > > > On Wed, Jul 15, 2020 at 02:18:39PM -0600, Mathieu Poirier wrote:
> > > > > On Tue, Jul 07, 2020 at 12:07:49PM -0700, Siddharth Gupta wrote:
> > [..]
> > > > > > diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> > [..]
> > > > > > +int rproc_char_device_add(struct rproc *rproc)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +	dev_t cdevt;
> > > > > > +
> > > > > > +	cdev_init(&rproc->char_dev, &rproc_fops);
> > > > > > +	rproc->char_dev.owner = THIS_MODULE;
> > > > > > +
> > > > > > +	cdevt = MKDEV(rproc_major, rproc->index);
> > > > > > +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> > > > Trying this patchset on my side gave me the following splat[1].  After finding
> > > > the root case I can't understand how you haven't see it on your side when you
> > > > tested the feature.
> > > > 
> > > > [1]. https://pastebin.com/aYTUUCdQ
> > 
> > Mathieu, I've looked at this back and forth. Afaict this implies that
> > rproc_major is still 0. Could it be that either alloc_chrdev_region()
> > failed or somehow has yet to be called when you hit this point?
> 
> That is exacly what I thought when I first stumbled on this but instrumenting
> the code showed otherwise.
> 
> After function rproc_init_cdev() has been called @rproc_major contains the
> dynamically allocated major number in the upper 12 bits and the base minor
> number in the lower 20 bits.
> 

Ahh, alloc_chrdev_region() actually returns the dev_t, not the major.
Too bad that we all name this variable "major" to maximize the
confusion.

> In rproc_char_device_add() we find this line:
> 
>         cdevt = MKDEV(rproc_major, rproc->index);
> 
> Macro MKDEV() builds a device number by shifting @rproc_major by 20 bits to the
> left and OR'ing that with @rproc->index.  But the device's major number is
> already occupying the upper 12bits, so shifthing another 20 bits to the left
> makes the major portion of the device number '0'.  That is causing cdev_add() to
> complain bitterly.
> 
> The right way to do this is:
> 
>         cdevt = MKDEV(MAJOR(rproc_major), rproc->index);
> 

Agreed (and let's continue naming it rproc_major, in line with all other
drivers - now I know better).

Thanks,
Bjorn

> Once I found the problem I thought about 32/64 bit issues.  Since Siddharth is
> using a 64bit application processor shifting another 20 bits would still have
> yielded a non-zero value.  But that can't be since dev_t is a u32 in
> linux/types.h.
> 
> As such I can't see how it is possible to not hit that problem on a 64bit
> platform.
> 
> > 
> > > Hey Mathieu,
> > > 
> > > We aren't able to reproduce the error that you are seeing, the splat is
> > > coming
> > > from the check for whiteout device[1] - which shouldn't happen because of
> > > the
> > > find_dynamic_major call[2], right?
> > > 
> > > We are successfully seeing all our character device files and able to
> > > successfully boot remoteprocs. From what I read and understood about
> > > whiteout
> > > devices they will be hidden in the fs.
> > > 
> > > Could you provide more details about your configuration and testing?
> > > 
> > > [1]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486
> > > <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123>
> > > [2]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123
> > > 
> > > <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486>
> > > > > > +	if (ret < 0)
> > > > > > +		goto out;
> > > > > > +
> > > > > > +	rproc->dev.devt = cdevt;
> > > > > > +out:
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +
> > > > > > +void rproc_char_device_remove(struct rproc *rproc)
> > > > > > +{
> > > > > > +	__unregister_chrdev(rproc_major, rproc->index, 1, "remoteproc");
> > > > > > +}
> > > > > > +
> > > > > > +void __init rproc_init_cdev(void)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
> > > > > > +	if (ret < 0)
> > > > > > +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> > > > > > +}
> > > > > > +
> > > > > > +void __exit rproc_exit_cdev(void)
> > > > > > +{
> > > > > > +	unregister_chrdev_region(MKDEV(rproc_major, 0), NUM_RPROC_DEVICES);
> > > > > Please go back to the comment I made on this during my last review and respin.
> > > > After digging in the code while debugging the above problem, I don't see how
> > > > unregistering the chrdev region the way it is done here would have worked.
> > > Since this is compiled statically and not built as a module, we will never
> > > exercise the code path, so I will remove it in the next patchset.
> > > 
> > 
> > You're right Siddharth, since we changed CONFIG_REMOTEPROC to bool it's no longer
> > possible to hit remoteproc_exit(), so you can omit this function
> > entirely. (And we should clean up the rest of that as well)
> > 
> > [..]
> > > > > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > [..]
> > > > > > @@ -488,6 +489,8 @@ struct rproc_dump_segment {
> > > > > >    * @auto_boot: flag to indicate if remote processor should be auto-started
> > > > > >    * @dump_segments: list of segments in the firmware
> > > > > >    * @nb_vdev: number of vdev currently handled by rproc
> > > > > > + * @char_dev: character device of the rproc
> > > > > > + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> > > > > >    */
> > > > > >   struct rproc {
> > > > > >   	struct list_head node;
> > > > > > @@ -523,6 +526,8 @@ struct rproc {
> > > > > >   	int nb_vdev;
> > > > > >   	u8 elf_class;
> > > > > >   	u16 elf_machine;
> > > > > > +	struct cdev char_dev;
> > 
> > As stated privately, I assumed based on this name that this is a struct
> > device related to that character device. So please rename this cdev to
> > save me from doing this mistake again.
> > 
> > Thanks,
> > Bjorn
