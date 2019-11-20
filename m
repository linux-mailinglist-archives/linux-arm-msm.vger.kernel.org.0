Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A458B1039BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbfKTMMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:12:55 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:43094
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729273AbfKTMMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574251974;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Mggx8pMu+6u7yoU5KugFafl4WYsd00aKUrPW0rMk5eQ=;
        b=ali0RbgwfEO/ZA4sv9rX/aL0X++Hw6ZWs9pIel/kS8foRlEW7RWmQ4vaYpbrFZTV
        npKtPjPdR2oX+Wgk+a6ne5Mw4FkbMqGFisumgRJ8bQ5NjHNJELlOTnN4ix/Fm5kEfjn
        qzs6slzwAZPnwlnXJMD6yz3hWFggGoQFd67uT0v8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574251974;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Mggx8pMu+6u7yoU5KugFafl4WYsd00aKUrPW0rMk5eQ=;
        b=XEOD+GSwzMefz1l75Gi+43RwFVx2u6q0wqaLyuUMCJsuuCpQ/08JKqN4Mn+qd3M4
        XvfvISKAiRt87ULL0pPiBAcMo4nUdgf3uTO7rTWehwkM/OsxeO9J5t2p/s4eb2u0fRe
        X1F6DHn7m6nb4Bm7rZVUiPuSszlk4VqEB0l9Fvy0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 12:12:54 +0000
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
In-Reply-To: <20191119231740.GJ18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9be5e-1d6bbe06-4bab-434d-9040-ebfa3918b213-000000@us-west-2.amazonses.com>
 <20191119064026.GE18024@yoga>
 <0101016e832bd54d-453473ee-c0fa-44f5-a873-55b97dff4a9a-000000@us-west-2.amazonses.com>
 <20191119231740.GJ18024@yoga>
Message-ID: <0101016e88bacc9e-26ddd827-c0ff-497b-b327-d14dc8832d20-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.20-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-20 04:47, Bjorn Andersson wrote:
> On Tue 19 Nov 02:18 PST 2019, sibis@codeaurora.org wrote:
> 
>> Hey Bjorn,
>> Thanks for taking the time to
>> review the series :)
>> 
>> On 2019-11-19 12:10, Bjorn Andersson wrote:
>> > On Mon 18 Nov 06:27 PST 2019, Sibi Sankar wrote:
>> > > diff --git a/drivers/soc/qcom/pdr_interface.c
>> > > b/drivers/soc/qcom/pdr_interface.c
>> > [..]
>> > > +static void pdr_indack_work(struct work_struct *work)
>> > > +{
>> > > +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
>> > > +					      indack_work);
>> > > +	struct pdr_list_node *ind, *tmp;
>> > > +	struct pdr_service *pds;
>> > > +
>> > > +	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
>> > > +		pds = ind->pds;
>> > > +		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
>> >
>> > So when we et a ind_cb with the new status, we need to send an ack
>> > request, which will result in a response, just to confirm that we got
>> > the event?
>> >
>> > Seems like we should fix the qmi code to make it possible to send a
>> > request from the indication handler and then we could simply ignore the
>> 
>> yeah maybe having a provision to send custom requests back on
>> indication would be the way to go. Not all indication need to be
>> services with requests.
>> 
> 
> Let's put this on the todo list.
> 
>> > response. Or do we need to not pdr->status() until we get the response
>> > for some reason?
>> 
>> adsp waits on the ack response for a fixed duration and seems to throw
>> a fatal err is the ack is not serviced. Hence holding back pd->status
>> till we service the ack here.
>> 
> 
> You mean to ensure that someone sleeping in pd->status() doesn't delay
> that until its too late?

yes

> 
> [..]
>> > > +int pdr_handle_init(struct pdr_handle *pdr,
>> > > +		    int (*status)(struct pdr_handle *pdr,
>> > > +				  struct pdr_service *pds))
>> > > +{
>> > [..]
>> > > +	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
>> > > +	if (!pdr->servreg_wq)
>> > > +		return -ENOMEM;
>> > > +
>> > > +	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq",
>> > > WQ_HIGHPRI);
>> >
>> > The two workqueues means that we should be able to call pdr->status()
>> > rom two concurrent contexts, I don't think our clients will expect that.
>> >
>> 
>> would creating another ordered wq to relay all the pd->status make
>> sense?
>> 
> 
> I would prefer less work queues ;) But I presume you split out the
> indack_wq in order to improve the likelihood of meeting the latency
> requirements of the remote side.
> 
> Perhaps just wrap the status() calls with a status-mutex and then 
> remove
> that by reworking the QMI interface to allow us to remove the indack
> work?

okay will fix it in the next
re-spin.

> 
> Regards,
> Bjorn

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
