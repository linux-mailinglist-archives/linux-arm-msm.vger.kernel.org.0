Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8766A102FD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 00:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfKSXRq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 18:17:46 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43441 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfKSXRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 18:17:46 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so12806344plm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 15:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NLNro2aJsK1LUFCNoxW5rybmY5DjiWvjZucyhp99xyI=;
        b=fRUIAN1YyBz7e73JLtZkAsuUDLENde/5E/uXR9SB1H4O3kU7zX5itMeaqIyKFJSwUB
         UyFD4RIdT3wiyzAKfQAY3YhZ4oG06rtH4bH9gQinMkEx/5xJ4y/VrD++rGKYceQqrc8c
         gexXjtKMqEiQ50swWxq6u5kvhFOwjx6zzeFU+1mwqMM/z5lwQZRB5pDGw76VY7tQRxu+
         CtLjMT7qnta6E24MY65B3C4eM5zjTFazFJK8axF9+76YE6kkVCxBs2Y/CZS2gNsakxIi
         ffHMHdcvllp6yYnQTDa6VBv3XkDk6C44ujFPezP3ZLttvPh1yXyVOPVVl9nWiNhkEy7A
         QX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NLNro2aJsK1LUFCNoxW5rybmY5DjiWvjZucyhp99xyI=;
        b=udv5kJE0BU/7VWrhRThh806fQptGsCbYI649wnTvOHEPXYQeGSiugjzZ38mfiRSM27
         rEPOWaAI6eWLbiWj5yJAzvT2/muO/+pHpIuYQwu3nEgIFRUKwktPS2jf8VTPFph8GirA
         RtuCUdxU1LafXPgIPGe1x0TATrjdppQfPY0m7w521ZVxNykrSSqvCHev8mUDPbz9OAjW
         REbfUg0vxOtjGVWBkR/MNxnS8m9Xz1c0ohD31Qy7wDQ3wkNagZNXd/cyhv9iHP9mLP27
         1V0Vnyox79B6hMHpob4D9tqDsoRmRnF/LCSmepI4kZJN/+9Vw03L5v4lDc2ZP6TUxr9i
         4n5g==
X-Gm-Message-State: APjAAAU4kGmc5k+JEY8eBixkpJzeTEW6a0bXDVBQc02wFBuwFatAIOTe
        R6gUgw4BrcD2fpk7dgQ+SvfsNQ==
X-Google-Smtp-Source: APXvYqyHr5KuTlMN2TairITHMhhhj+EOhIBslGVt5Xtnwg7XVWSi24joLT1jz9hxBU09Svl2DcM5CQ==
X-Received: by 2002:a17:902:d708:: with SMTP id w8mr129181ply.280.1574205463469;
        Tue, 19 Nov 2019 15:17:43 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g11sm4614217pjv.8.2019.11.19.15.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:17:42 -0800 (PST)
Date:   Tue, 19 Nov 2019 15:17:40 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sibis@codeaurora.org
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20191119231740.GJ18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9be5e-1d6bbe06-4bab-434d-9040-ebfa3918b213-000000@us-west-2.amazonses.com>
 <20191119064026.GE18024@yoga>
 <0101016e832bd54d-453473ee-c0fa-44f5-a873-55b97dff4a9a-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e832bd54d-453473ee-c0fa-44f5-a873-55b97dff4a9a-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Nov 02:18 PST 2019, sibis@codeaurora.org wrote:

> Hey Bjorn,
> Thanks for taking the time to
> review the series :)
> 
> On 2019-11-19 12:10, Bjorn Andersson wrote:
> > On Mon 18 Nov 06:27 PST 2019, Sibi Sankar wrote:
> > > diff --git a/drivers/soc/qcom/pdr_interface.c
> > > b/drivers/soc/qcom/pdr_interface.c
> > [..]
> > > +static void pdr_indack_work(struct work_struct *work)
> > > +{
> > > +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> > > +					      indack_work);
> > > +	struct pdr_list_node *ind, *tmp;
> > > +	struct pdr_service *pds;
> > > +
> > > +	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
> > > +		pds = ind->pds;
> > > +		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
> > 
> > So when we et a ind_cb with the new status, we need to send an ack
> > request, which will result in a response, just to confirm that we got
> > the event?
> > 
> > Seems like we should fix the qmi code to make it possible to send a
> > request from the indication handler and then we could simply ignore the
> 
> yeah maybe having a provision to send custom requests back on
> indication would be the way to go. Not all indication need to be
> services with requests.
> 

Let's put this on the todo list.

> > response. Or do we need to not pdr->status() until we get the response
> > for some reason?
> 
> adsp waits on the ack response for a fixed duration and seems to throw
> a fatal err is the ack is not serviced. Hence holding back pd->status
> till we service the ack here.
> 

You mean to ensure that someone sleeping in pd->status() doesn't delay
that until its too late?

[..]
> > > +int pdr_handle_init(struct pdr_handle *pdr,
> > > +		    int (*status)(struct pdr_handle *pdr,
> > > +				  struct pdr_service *pds))
> > > +{
> > [..]
> > > +	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
> > > +	if (!pdr->servreg_wq)
> > > +		return -ENOMEM;
> > > +
> > > +	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq",
> > > WQ_HIGHPRI);
> > 
> > The two workqueues means that we should be able to call pdr->status()
> > rom two concurrent contexts, I don't think our clients will expect that.
> > 
> 
> would creating another ordered wq to relay all the pd->status make
> sense?
> 

I would prefer less work queues ;) But I presume you split out the
indack_wq in order to improve the likelihood of meeting the latency
requirements of the remote side.

Perhaps just wrap the status() calls with a status-mutex and then remove
that by reworking the QMI interface to allow us to remove the indack
work?

Regards,
Bjorn
