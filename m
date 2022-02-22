Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE834BF258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 08:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbiBVHDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 02:03:48 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbiBVHDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 02:03:47 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2384D111DD1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 23:03:23 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id ci24-20020a17090afc9800b001bc3071f921so1463497pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 23:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k22nQ+5l32+0KCOFzN+ckiNqLiyZfk5xD9lBCarBIVw=;
        b=dKO3WsZTKTO0oOs9bIYneg0c9r0x03J/xXk/thIOoGwyvBxO5GhRkLvKLhj4I+U25k
         XFTmrowAMgVkgi0DIeS/Ibsl1EwoZSEw+FNmjc/KX0rQLCSjVVMypX42qcEnl4a6KGGa
         OGqg9pLz5MODnATkjh1dgtjYk7hyreF69/2itXn3PVGWlvZKKrxb4WhHM5a9H3bieePl
         ccSwMrNycbvaZ6avy+xfZguQhpDOXgf77CfKSMk0ycFVCiQQErHAdb6LdmWV0UFXT0qM
         jpsnlCK9pAQ7EVCEJIv7xYMEUG2m611XgqBTFCXDE6gAZScTgbSnj/g0bCoyVVPGQZKv
         mmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k22nQ+5l32+0KCOFzN+ckiNqLiyZfk5xD9lBCarBIVw=;
        b=SuIcnJnf9KT7kmVXPQn9rkfg2r5mAi+Vo4KRZqY3HQg+ABB4eDMYSCfflBlYaYaWkF
         L0MgaUS7QnLSKFl9YEskuueAIDd/LwfYyobDt/iu5jUumq/u+gXbE8r5209T6KmH1tVh
         u1f+UeGVmLqwpb9LA1ukabAPRneePYb90h1U+9x5iejlsrjmbmrHx+ZBOIG9IZhdwKkN
         jl4xcjiwAvKxTZlchTNDzVJrhLtrQrD1wiR+0o5gEO3rCPdDVrDFyfE3LTCYxtiQ+mY8
         ROPkbBu6y6LqsyAGinUz9kY/e3IDs53/0qhfszjFW6BiNbjI4tb21sQpwerOHcbQQH5R
         4JtQ==
X-Gm-Message-State: AOAM532KIyHUuSUkCOl0VtDOnr5qncIttS9/9VpVnCwjpLZnSpjMHX9v
        tzbFlqPgGemQhP8SES8/XEdu
X-Google-Smtp-Source: ABdhPJy7/psO5wxTN0D7lIAQo485hkGSjgCavz8S8ufkE8CcXGSZIK3H7bBXdsvO0q33WUeR0F4Otw==
X-Received: by 2002:a17:902:9348:b0:14f:c715:2a94 with SMTP id g8-20020a170902934800b0014fc7152a94mr6019782plp.66.1645513402581;
        Mon, 21 Feb 2022 23:03:22 -0800 (PST)
Received: from thinkpad ([117.217.186.202])
        by smtp.gmail.com with ESMTPSA id s48sm14373311pfw.111.2022.02.21.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 23:03:22 -0800 (PST)
Date:   Tue, 22 Feb 2022 12:33:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
        quic_cang@quicinc.com, quic_skananth@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/25] bus: mhi: ep: Add support for managing MHI
 state machine
Message-ID: <20220222070315.GB5029@thinkpad>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-15-manivannan.sadhasivam@linaro.org>
 <6f31cea5-865d-c2b9-5887-f053d1e2001a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f31cea5-865d-c2b9-5887-f053d1e2001a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 15, 2022 at 04:39:24PM -0600, Alex Elder wrote:
> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
> > Add support for managing the MHI state machine by controlling the state
> > transitions. Only the following MHI state transitions are supported:
> > 
> > 1. Ready state
> > 2. M0 state
> > 3. M3 state
> > 4. SYS_ERR state
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Minor suggestions here.		-Alex
> 
> > ---
> >   drivers/bus/mhi/ep/Makefile   |   2 +-
> >   drivers/bus/mhi/ep/internal.h |  11 +++
> >   drivers/bus/mhi/ep/main.c     |  51 ++++++++++-
> >   drivers/bus/mhi/ep/sm.c       | 168 ++++++++++++++++++++++++++++++++++
> >   include/linux/mhi_ep.h        |   6 ++
> >   5 files changed, 236 insertions(+), 2 deletions(-)
> >   create mode 100644 drivers/bus/mhi/ep/sm.c
> > 
> > diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
> > index 7ba0e04801eb..aad85f180b70 100644
> > --- a/drivers/bus/mhi/ep/Makefile
> > +++ b/drivers/bus/mhi/ep/Makefile
> > @@ -1,2 +1,2 @@
> >   obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
> > -mhi_ep-y := main.o mmio.o ring.o
> > +mhi_ep-y := main.o mmio.o ring.o sm.o
> > diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> > index fd63f79c6aec..e4e8f06c2898 100644
> > --- a/drivers/bus/mhi/ep/internal.h
> > +++ b/drivers/bus/mhi/ep/internal.h
> > @@ -173,6 +173,11 @@ struct mhi_ep_event {
> >   	struct mhi_ep_ring ring;
> >   };
> > +struct mhi_ep_state_transition {
> > +	struct list_head node;
> > +	enum mhi_state state;
> > +};
> > +
> >   struct mhi_ep_chan {
> >   	char *name;
> >   	struct mhi_ep_device *mhi_dev;
> > @@ -230,5 +235,11 @@ void mhi_ep_mmio_update_ner(struct mhi_ep_cntrl *mhi_cntrl);
> >   /* MHI EP core functions */
> >   int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state);
> >   int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ep_execenv exec_env);
> > +bool mhi_ep_check_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state cur_mhi_state,
> > +			    enum mhi_state mhi_state);
> > +int mhi_ep_set_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state mhi_state);
> > +int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
> > +int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
> > +int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
> >   #endif
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > index 61f066c6286b..ccb3c2795041 100644
> > --- a/drivers/bus/mhi/ep/main.c
> > +++ b/drivers/bus/mhi/ep/main.c
> > @@ -185,6 +185,43 @@ static void mhi_ep_ring_worker(struct work_struct *work)
> >   	}
> >   }
> > +static void mhi_ep_state_worker(struct work_struct *work)
> > +{
> > +	struct mhi_ep_cntrl *mhi_cntrl = container_of(work, struct mhi_ep_cntrl, state_work);
> > +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > +	struct mhi_ep_state_transition *itr, *tmp;
> > +	unsigned long flags;
> > +	LIST_HEAD(head);
> > +	int ret;
> > +
> > +	spin_lock_irqsave(&mhi_cntrl->list_lock, flags);
> > +	list_splice_tail_init(&mhi_cntrl->st_transition_list, &head);
> > +	spin_unlock_irqrestore(&mhi_cntrl->list_lock, flags);
> > +
> > +	list_for_each_entry_safe(itr, tmp, &head, node) {
> > +		list_del(&itr->node);
> > +		dev_dbg(dev, "Handling MHI state transition to %s\n",
> > +			 mhi_state_str(itr->state));
> > +
> > +		switch (itr->state) {
> > +		case MHI_STATE_M0:
> > +			ret = mhi_ep_set_m0_state(mhi_cntrl);
> > +			if (ret)
> > +				dev_err(dev, "Failed to transition to M0 state\n");
> > +			break;
> > +		case MHI_STATE_M3:
> > +			ret = mhi_ep_set_m3_state(mhi_cntrl);
> > +			if (ret)
> > +				dev_err(dev, "Failed to transition to M3 state\n");
> > +			break;
> > +		default:
> > +			dev_err(dev, "Invalid MHI state transition: %d\n", itr->state);
> > +			break;
> > +		}
> > +		kfree(itr);
> > +	}
> > +}
> > +
> >   static void mhi_ep_release_device(struct device *dev)
> >   {
> >   	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
> > @@ -386,6 +423,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
> >   	}
> >   	INIT_WORK(&mhi_cntrl->ring_work, mhi_ep_ring_worker);
> > +	INIT_WORK(&mhi_cntrl->state_work, mhi_ep_state_worker);
> >   	mhi_cntrl->ring_wq = alloc_workqueue("mhi_ep_ring_wq", 0, 0);
> >   	if (!mhi_cntrl->ring_wq) {
> > @@ -393,8 +431,16 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
> >   		goto err_free_cmd;
> >   	}
> > +	mhi_cntrl->state_wq = alloc_workqueue("mhi_ep_state_wq", 0, 0);
> 
> Maybe it's not a big deal, but do we really need several separate
> work queues?  Would one suffice?  Could a system workqueue be used
> in some cases (such as state changes)?

Good question. The reason to have 2 separate workqueue was to avoid running the
two work items parallely during bringup. But the code has changed a lot afterwards,
so this could go into the other workqueue.

Thanks,
Mani
