Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABDA229E45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 19:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgGVRSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 13:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgGVRSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 13:18:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD04AC0619E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 10:18:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k5so1743035pjg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XkCVT67Q+SPzBsEk4h3ILnIPkGXz4DwqhPvgqB9tq+0=;
        b=QlMT0U4665J5+P8GNwpg3KIlHcY3aKSWsfXs1djreAHq7v8WkU27R5JOKOaTJA/dHv
         n2sqw4sIE3TxVYqB9re7o9zBcY2YOnei3I8urszedpJWEGzmB5Crv4vrPwu9H3wS89tq
         6gDXGXGF2Q4rRJoLJ/o/Py3dzLvEgV2wmLMZx03K2DfL34iv3GKUnKcdCyZSm2VrIaLz
         ekcDt/qvuYpPASfGezJY7hpVbfuv8IUqwt9rGUcAQtQeoIH7t8YGcI92tdxHC296+N+w
         GtoYTU31bmCrJJUUpA38og8S8LegSWSbtEZ31O+c9g7h2Pdu005MaslgYqotcqh0+8Qb
         00Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XkCVT67Q+SPzBsEk4h3ILnIPkGXz4DwqhPvgqB9tq+0=;
        b=DSpAK2kbJackPtXpkREzMz7r4nlgrc/R9jCvpPW7w1beKyKikAOoR6MUnFUAeeB02M
         fGvrWO/r5Y5MVUzjZJyMJGL2bdxv98dBEc4QpkNjR8wXOiZ0Fz7Bc5UTDslLwZblX8hm
         LwDPpGHycqsW3O5LWqXSRsIB3bNkkLoZjFFA4dai9DDHqYeeSU2u98wAyZLB0q2xvsb9
         6O3Z7QsHUC0r6ieZwcjYq/7+57GmyHcFUuRb7pQjwq3OOTF/Y/8hhKoI+fSS9Mgjehk2
         0rPHlzbg71wNJl+qBgErwhGfl67ZahqFNjhXj3P+tfMoh71UQ+WguxfNp2bT0LSKAqdo
         RTRw==
X-Gm-Message-State: AOAM531dUY8mvJ33bXxJTsrMQWdosxRvGsXi/DIz6ygnM6HgXHs7833E
        c2GBDeYYAwAlyBDx1A8AZFe8Xg==
X-Google-Smtp-Source: ABdhPJzy5kzWpviUI52hjekKooZxZURC3zAmgafHaB2btpHJCFhc1IbT/lu2yZIjl7rPNAp1/Z1PzQ==
X-Received: by 2002:a17:90a:2069:: with SMTP id n96mr397740pjc.213.1595438324114;
        Wed, 22 Jul 2020 10:18:44 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 4sm170769pgk.68.2020.07.22.10.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:18:43 -0700 (PDT)
Date:   Wed, 22 Jul 2020 11:18:41 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, agross@kernel.org,
        ohad@wizery.com, corbet@lwn.net, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200722171841.GA1268891@xps15>
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
 <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
 <20200715201839.GA3204081@xps15>
 <20200715215149.GA3267350@xps15>
 <81d7514c-727e-b4dc-e4ac-74a25966ccaf@codeaurora.org>
 <20200721205635.GM2922385@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721205635.GM2922385@builder.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 21, 2020 at 01:56:35PM -0700, Bjorn Andersson wrote:
> On Tue 21 Jul 12:16 PDT 2020, Siddharth Gupta wrote:
> > On 7/15/2020 2:51 PM, Mathieu Poirier wrote:
> > > On Wed, Jul 15, 2020 at 02:18:39PM -0600, Mathieu Poirier wrote:
> > > > On Tue, Jul 07, 2020 at 12:07:49PM -0700, Siddharth Gupta wrote:
> [..]
> > > > > diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> [..]
> > > > > +int rproc_char_device_add(struct rproc *rproc)
> > > > > +{
> > > > > +	int ret;
> > > > > +	dev_t cdevt;
> > > > > +
> > > > > +	cdev_init(&rproc->char_dev, &rproc_fops);
> > > > > +	rproc->char_dev.owner = THIS_MODULE;
> > > > > +
> > > > > +	cdevt = MKDEV(rproc_major, rproc->index);
> > > > > +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> > > Trying this patchset on my side gave me the following splat[1].  After finding
> > > the root case I can't understand how you haven't see it on your side when you
> > > tested the feature.
> > > 
> > > [1]. https://pastebin.com/aYTUUCdQ
> 
> Mathieu, I've looked at this back and forth. Afaict this implies that
> rproc_major is still 0. Could it be that either alloc_chrdev_region()
> failed or somehow has yet to be called when you hit this point?

That is exacly what I thought when I first stumbled on this but instrumenting
the code showed otherwise.

After function rproc_init_cdev() has been called @rproc_major contains the
dynamically allocated major number in the upper 12 bits and the base minor
number in the lower 20 bits.

In rproc_char_device_add() we find this line:

        cdevt = MKDEV(rproc_major, rproc->index);

Macro MKDEV() builds a device number by shifting @rproc_major by 20 bits to the
left and OR'ing that with @rproc->index.  But the device's major number is
already occupying the upper 12bits, so shifthing another 20 bits to the left
makes the major portion of the device number '0'.  That is causing cdev_add() to
complain bitterly.

The right way to do this is:

        cdevt = MKDEV(MAJOR(rproc_major), rproc->index);

Once I found the problem I thought about 32/64 bit issues.  Since Siddharth is
using a 64bit application processor shifting another 20 bits would still have
yielded a non-zero value.  But that can't be since dev_t is a u32 in
linux/types.h.

As such I can't see how it is possible to not hit that problem on a 64bit
platform.

> 
> > Hey Mathieu,
> > 
> > We aren't able to reproduce the error that you are seeing, the splat is
> > coming
> > from the check for whiteout device[1] - which shouldn't happen because of
> > the
> > find_dynamic_major call[2], right?
> > 
> > We are successfully seeing all our character device files and able to
> > successfully boot remoteprocs. From what I read and understood about
> > whiteout
> > devices they will be hidden in the fs.
> > 
> > Could you provide more details about your configuration and testing?
> > 
> > [1]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486
> > <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123>
> > [2]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123
> > 
> > <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486>
> > > > > +	if (ret < 0)
> > > > > +		goto out;
> > > > > +
> > > > > +	rproc->dev.devt = cdevt;
> > > > > +out:
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +void rproc_char_device_remove(struct rproc *rproc)
> > > > > +{
> > > > > +	__unregister_chrdev(rproc_major, rproc->index, 1, "remoteproc");
> > > > > +}
> > > > > +
> > > > > +void __init rproc_init_cdev(void)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
> > > > > +	if (ret < 0)
> > > > > +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> > > > > +}
> > > > > +
> > > > > +void __exit rproc_exit_cdev(void)
> > > > > +{
> > > > > +	unregister_chrdev_region(MKDEV(rproc_major, 0), NUM_RPROC_DEVICES);
> > > > Please go back to the comment I made on this during my last review and respin.
> > > After digging in the code while debugging the above problem, I don't see how
> > > unregistering the chrdev region the way it is done here would have worked.
> > Since this is compiled statically and not built as a module, we will never
> > exercise the code path, so I will remove it in the next patchset.
> > 
> 
> You're right Siddharth, since we changed CONFIG_REMOTEPROC to bool it's no longer
> possible to hit remoteproc_exit(), so you can omit this function
> entirely. (And we should clean up the rest of that as well)
> 
> [..]
> > > > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> [..]
> > > > > @@ -488,6 +489,8 @@ struct rproc_dump_segment {
> > > > >    * @auto_boot: flag to indicate if remote processor should be auto-started
> > > > >    * @dump_segments: list of segments in the firmware
> > > > >    * @nb_vdev: number of vdev currently handled by rproc
> > > > > + * @char_dev: character device of the rproc
> > > > > + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> > > > >    */
> > > > >   struct rproc {
> > > > >   	struct list_head node;
> > > > > @@ -523,6 +526,8 @@ struct rproc {
> > > > >   	int nb_vdev;
> > > > >   	u8 elf_class;
> > > > >   	u16 elf_machine;
> > > > > +	struct cdev char_dev;
> 
> As stated privately, I assumed based on this name that this is a struct
> device related to that character device. So please rename this cdev to
> save me from doing this mistake again.
> 
> Thanks,
> Bjorn
