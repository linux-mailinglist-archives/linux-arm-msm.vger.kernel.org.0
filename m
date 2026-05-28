Return-Path: <linux-arm-msm+bounces-110130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B4hnE1NIGGpSiggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E93395F3092
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83D6E3046B9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E84B29B799;
	Thu, 28 May 2026 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+fSYxCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31C282F25;
	Thu, 28 May 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976229; cv=none; b=p4ReepU26JN+Ps5jmrBdp8wmULN1jM7iuZY4rxYjSigOr9DeS4UkHTaDxkcWr4ylJQiAUBg3YJlWeJ1dsuodggibggc995tTgrPtDzMT9ukj+5tJjLF+gQb8W3Icr3Z1h7zevhOBagzWypTCG8WxRj5jtv1YV2aKP778mg5hLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976229; c=relaxed/simple;
	bh=weaZdaCnIvQQO2iWtnJYG90sWonh1QB5GfDUnoFtzT4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UDjjEUUpcoPyFh7nwSEW2m1RYCLl6CQb/Co2sT0BhEYswg28TCzOPusZaNVQWSfvalI6TKHsoJBmUyKV9Ypq+V0elMEcQ4LusBBBb1ZERzYGTbm3pG3pP+q5dm7ySWHE7LFPNG9JXvZLGCbl4VfWGO09zq2o+YTRGw73V6IndPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+fSYxCy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DB41F00A3C;
	Thu, 28 May 2026 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779976226;
	bh=qpQbVznKBuxkvfvnF3ZtK/OpN/xy5/tFgCckXzQ+K+Y=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=D+fSYxCy6hT8b2xJbtko7ISFnD/+pCxWvZPioGSF7Olg7AHPHvNwX4JBkFjITE76h
	 oB1kMyjpjzlG+OJ0laAHpFIzaHK9skvzkBKdFNfy74wzAHzLKhsiJkLJRwRz8UO0z9
	 8SaP8G/5awhGBzDi5GoOqpe1w6xNihU10a3/OAtcEiwQ/3L/olQ9Vx0PNbUSTso6qs
	 pykRezpflmWSWHrYyPypzUYoNT3zCVrNsg7crvDNKl/h2j2ulP/BE7ufIM5ZUlgUkE
	 1W+1b5Ar61Xy+izFoYrIZvQj9b/4uTuRJEw+zownu9nNo+NyJzX5ZkCpD1hmMwep3K
	 XNgSlHPZdB2mg==
Message-ID: <97ae0e55-ca17-42d7-a013-a3c3bd686bdf@kernel.org>
Date: Thu, 28 May 2026 14:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH 3/3] soc: qcom: apr: Process RX messages using per-service
 work items
To: Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260514155051.2593354-4-srinivas.kandagatla@oss.qualcomm.com>
 <ag-GpRMF3KQ8I1YN@baldur>
Content-Language: en-US
In-Reply-To: <ag-GpRMF3KQ8I1YN@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E93395F3092
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 11:28 PM, Bjorn Andersson wrote:
> On Thu, May 14, 2026 at 03:50:51PM +0000, Srinivas Kandagatla wrote:
>> The APR transport currently serializes all incoming packets through a
>> single work item and a global RX queue. If one service callback blocks
>> or takes a long time to complete, packet processing for all other
>> services is delayed.
>>
> 
> Can you please elaborate on why that's bad? Also, can you confirm that

We started to notice that some of the commands are timing out mainly
commands that are sent while streaming is in progress, example, graph
stop/start. The underlying reason for this timeout is that there are
read/write acks that are in the queue.

And other potential issue could be when we have both playback and
capture or multiple streaming in progress, we do not want to delay dsp
events to particular stream because other stream events are in queue.

Events for each stream or service are independent of each other, I will
be really surprised if there is a inter dependency of this.


> there are no issues downstream of this with the packets now potentially
> being handled out-of-order?
When you mean downstream, you mean adsp or downstream kernel?

> 
> Regards,
> Bjorn
> 
>> Move RX buffering and work items from the packet router to each
>> individual service. Incoming packets are queued on a per-service list
>> and processed by that service's work item, allowing unrelated services
>> to make progress independently while preserving message ordering within
>> each service.
>>
>> Since queued packets may outlive service removal, add a reference count
>> to keep the service object alive until all queued packets have been
>> processed, and reject new packets once the service begins shutting down.
>>
>> Switch the shared APR workqueue to an unbound reclaim workqueue so that
>> multiple services can process packets in parallel.
>>
>> This also addresses the random CMD timeouts seen with audio commands
>> that are sent to DSP which timeout on the response as they are waiting in
>> the queue for other commands to finish.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/apr.c       | 265 +++++++++++++++++++++++------------
>>  include/linux/soc/qcom/apr.h |   6 +
>>  2 files changed, 185 insertions(+), 86 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
>> index 68b357462438..f25219b48cdc 100644
>> --- a/drivers/soc/qcom/apr.c
>> +++ b/drivers/soc/qcom/apr.c
>> @@ -28,14 +28,11 @@ struct packet_router {
>>  	struct rpmsg_endpoint *ch;
>>  	struct device *dev;
>>  	spinlock_t svcs_lock;
>> -	spinlock_t rx_lock;
>>  	struct idr svcs_idr;
>>  	int dest_domain_id;
>>  	int type;
>>  	struct pdr_handle *pdr;
>>  	struct workqueue_struct *rxwq;
>> -	struct work_struct rx_work;
>> -	struct list_head rx_list;
>>  };
>>  
>>  struct apr_rx_buf {
>> @@ -74,54 +71,58 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt)
>>  }
>>  EXPORT_SYMBOL_GPL(apr_send_pkt);
>>  
>> -void gpr_free_port(gpr_port_t *port)
>> +static void apr_svc_release(struct kref *ref)
>>  {
>> -	struct packet_router *gpr = port->pr;
>> -	unsigned long flags;
>> +	struct pkt_router_svc *svc;
>>  
>> -	spin_lock_irqsave(&gpr->svcs_lock, flags);
>> -	idr_remove(&gpr->svcs_idr, port->id);
>> -	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
>> +	svc = container_of(ref, struct pkt_router_svc, refcount);
>>  
>> -	kfree(port);
>> +	if (svc->dynamic_svc)
>> +		kfree(svc);
>>  }
>> -EXPORT_SYMBOL_GPL(gpr_free_port);
>>  
>> -gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
>> -				gpr_port_cb cb,	void *priv)
>> +static void apr_svc_get(struct pkt_router_svc *svc)
>>  {
>> -	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
>> -	gpr_port_t *port;
>> -	struct pkt_router_svc *svc;
>> -	int id;
>> +	kref_get(&svc->refcount);
>> +}
>>  
>> -	port = kzalloc_obj(*port);
>> -	if (!port)
>> -		return ERR_PTR(-ENOMEM);
>> +static void apr_svc_put(struct pkt_router_svc *svc)
>> +{
>> +	kref_put(&svc->refcount, apr_svc_release);
>> +}
>>  
>> -	svc = port;
>> -	svc->callback = cb;
>> -	svc->pr = pr;
>> -	svc->priv = priv;
>> -	svc->dev = dev;
>> -	spin_lock_init(&svc->lock);
>> +static void apr_svc_purge_rx(struct pkt_router_svc *svc)
>> +{
>> +	struct apr_rx_buf *abuf, *tmp;
>> +	unsigned long flags;
>>  
>> -	spin_lock(&pr->svcs_lock);
>> -	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
>> -			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
>> -	if (id < 0) {
>> -		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
>> -		kfree(port);
>> -		spin_unlock(&pr->svcs_lock);
>> -		return ERR_PTR(id);
>> +	spin_lock_irqsave(&svc->lock, flags);
>> +	list_for_each_entry_safe(abuf, tmp, &svc->rx_list, node) {
>> +		list_del(&abuf->node);
>> +		kfree(abuf);
>> +		apr_svc_put(svc);
>>  	}
>> +	spin_unlock_irqrestore(&svc->lock, flags);
>> +}
>>  
>> -	svc->id = id;
>> -	spin_unlock(&pr->svcs_lock);
>> +void gpr_free_port(gpr_port_t *port)
>> +{
>> +	struct packet_router *gpr = port->pr;
>> +	unsigned long flags;
>>  
>> -	return port;
>> +	spin_lock_irqsave(&port->lock, flags);
>> +	port->dying = true;
>> +	spin_unlock_irqrestore(&port->lock, flags);
>> +
>> +	spin_lock_irqsave(&gpr->svcs_lock, flags);
>> +	idr_remove(&gpr->svcs_idr, port->id);
>> +	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
>> +
>> +	cancel_work_sync(&port->rx_work);
>> +	apr_svc_purge_rx(port);
>> +	apr_svc_put(port);
>>  }
>> -EXPORT_SYMBOL_GPL(gpr_alloc_port);
>> +EXPORT_SYMBOL_GPL(gpr_free_port);
>>  
>>  static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
>>  {
>> @@ -155,15 +156,53 @@ static void apr_dev_release(struct device *dev)
>>  {
>>  	struct apr_device *adev = to_apr_device(dev);
>>  
>> +	cancel_work_sync(&adev->svc.rx_work);
>> +	apr_svc_purge_rx(&adev->svc);
>> +	apr_svc_put(&adev->svc);
>>  	kfree(adev);
>>  }
>>  
>> +static struct pkt_router_svc *apr_find_svc(struct packet_router *apr, void *buf)
>> +{
>> +	struct pkt_router_svc *svc;
>> +	unsigned long flags;
>> +	uint32_t svc_id;
>> +	struct apr_hdr *ahdr;
>> +	struct gpr_hdr *ghdr;
>> +
>> +	switch (apr->type) {
>> +	case PR_TYPE_APR:
>> +		ahdr = buf;
>> +		svc_id = ahdr->dest_svc;
>> +		break;
>> +	case PR_TYPE_GPR:
>> +		ghdr = buf;
>> +		svc_id = ghdr->dest_port;
>> +		break;
>> +	default:
>> +		dev_err(apr->dev, "Invalid Packet Router\n");
>> +		return NULL;
>> +	}
>> +
>> +	spin_lock_irqsave(&apr->svcs_lock, flags);
>> +	svc = idr_find(&apr->svcs_idr, svc_id);
>> +	if (svc)
>> +		apr_svc_get(svc);
>> +	spin_unlock_irqrestore(&apr->svcs_lock, flags);
>> +
>> +	if (!svc)
>> +		dev_err(apr->dev, "APR: service is not registered (%d)\n", svc_id);
>> +
>> +	return svc;
>> +}
>> +
>>  static int apr_callback(struct rpmsg_device *rpdev, void *buf,
>>  				  int len, void *priv, u32 addr)
>>  {
>>  	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
>>  	struct apr_rx_buf *abuf;
>>  	unsigned long flags;
>> +	struct pkt_router_svc *svc;
>>  
>>  	switch (apr->type) {
>>  	case PR_TYPE_APR:
>> @@ -189,24 +228,35 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
>>  	abuf->len = len;
>>  	memcpy(abuf->buf, buf, len);
>>  
>> -	spin_lock_irqsave(&apr->rx_lock, flags);
>> -	list_add_tail(&abuf->node, &apr->rx_list);
>> -	spin_unlock_irqrestore(&apr->rx_lock, flags);
>> +	svc = apr_find_svc(apr, buf);
>> +	if (!svc) {
>> +		kfree(abuf);
>> +		return 0;
>> +	}
>> +
>> +	spin_lock_irqsave(&svc->lock, flags);
>> +	if (svc->dying) {
>> +		spin_unlock_irqrestore(&svc->lock, flags);
>> +		kfree(abuf);
>> +		apr_svc_put(svc);
>> +		return 0;
>> +	}
>> +
>> +	list_add_tail(&abuf->node, &svc->rx_list);
>> +	spin_unlock_irqrestore(&svc->lock, flags);
>>  
>> -	queue_work(apr->rxwq, &apr->rx_work);
>> +	queue_work(apr->rxwq, &svc->rx_work);
>>  
>>  	return 0;
>>  }
>>  
>> -static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf)
>> +static int apr_do_rx_callback(struct pkt_router_svc *svc, struct apr_rx_buf *abuf)
>>  {
>> -	uint16_t hdr_size, msg_type, ver, svc_id;
>> -	struct pkt_router_svc *svc;
>> -	struct apr_device *adev;
>> +	uint16_t hdr_size, msg_type, ver;
>> +	struct apr_device *adev = NULL;
>>  	struct apr_driver *adrv = NULL;
>>  	struct apr_resp_pkt resp;
>>  	struct apr_hdr *hdr;
>> -	unsigned long flags;
>>  	void *buf = abuf->buf;
>>  	int len = abuf->len;
>>  
>> @@ -217,18 +267,18 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
>>  
>>  	hdr_size = APR_HDR_FIELD_SIZE_BYTES(hdr->hdr_field);
>>  	if (hdr_size < APR_HDR_SIZE) {
>> -		dev_err(apr->dev, "APR: Wrong hdr size:%d\n", hdr_size);
>> +		dev_err(svc->dev, "APR: Wrong hdr size:%d\n", hdr_size);
>>  		return -EINVAL;
>>  	}
>>  
>>  	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
>> -		dev_err(apr->dev, "APR: Wrong packet size\n");
>> +		dev_err(svc->dev, "APR: Wrong packet size\n");
>>  		return -EINVAL;
>>  	}
>>  
>>  	msg_type = APR_HDR_FIELD_MT(hdr->hdr_field);
>>  	if (msg_type >= APR_MSG_TYPE_MAX) {
>> -		dev_err(apr->dev, "APR: Wrong message type: %d\n", msg_type);
>> +		dev_err(svc->dev, "APR: Wrong message type: %d\n", msg_type);
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -236,22 +286,17 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
>>  			hdr->dest_domain >= APR_DOMAIN_MAX ||
>>  			hdr->src_svc >= APR_SVC_MAX ||
>>  			hdr->dest_svc >= APR_SVC_MAX) {
>> -		dev_err(apr->dev, "APR: Wrong APR header\n");
>> +		dev_err(svc->dev, "APR: Wrong APR header\n");
>>  		return -EINVAL;
>>  	}
>>  
>> -	svc_id = hdr->dest_svc;
>> -	spin_lock_irqsave(&apr->svcs_lock, flags);
>> -	svc = idr_find(&apr->svcs_idr, svc_id);
>>  	if (svc && svc->dev->driver) {
>>  		adev = svc_to_apr_device(svc);
>>  		adrv = to_apr_driver(adev->dev.driver);
>>  	}
>> -	spin_unlock_irqrestore(&apr->svcs_lock, flags);
>>  
>>  	if (!adrv || !adev) {
>> -		dev_err(apr->dev, "APR: service is not registered (%d)\n",
>> -			svc_id);
>> +		dev_err(svc->dev, "APR: service device not found\n");
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -270,13 +315,11 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
>>  	return 0;
>>  }
>>  
>> -static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf)
>> +static int gpr_do_rx_callback(struct pkt_router_svc *svc, struct apr_rx_buf *abuf)
>>  {
>>  	uint16_t hdr_size, ver;
>> -	struct pkt_router_svc *svc = NULL;
>>  	struct gpr_resp_pkt resp;
>>  	struct gpr_hdr *hdr;
>> -	unsigned long flags;
>>  	void *buf = abuf->buf;
>>  	int len = abuf->len;
>>  
>> @@ -287,12 +330,12 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
>>  
>>  	hdr_size = hdr->hdr_size;
>>  	if (hdr_size < GPR_PKT_HEADER_WORD_SIZE) {
>> -		dev_err(gpr->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
>> +		dev_err(svc->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
>>  		return -EINVAL;
>>  	}
>>  
>>  	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
>> -		dev_err(gpr->dev, "GPR: Wrong packet size\n");
>> +		dev_err(svc->dev, "GPR: Wrong packet size\n");
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -306,49 +349,91 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
>>  	if (resp.payload_size > 0)
>>  		resp.payload = buf + (hdr_size *  4);
>>  
>> -
>> -	spin_lock_irqsave(&gpr->svcs_lock, flags);
>> -	svc = idr_find(&gpr->svcs_idr, hdr->dest_port);
>> -	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
>> -
>> -	if (!svc) {
>> -		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
>> -			hdr->dest_port);
>> -		return -EINVAL;
>> -	}
>> -
>>  	if (svc->callback)
>>  		svc->callback(&resp, svc->priv, 0);
>>  
>>  	return 0;
>>  }
>>  
>> -static void apr_rxwq(struct work_struct *work)
>> +static void apr_service_rxwq(struct work_struct *work)
>>  {
>> -	struct packet_router *apr = container_of(work, struct packet_router, rx_work);
>> +	struct pkt_router_svc *svc = container_of(work, struct pkt_router_svc, rx_work);
>> +	struct packet_router *apr = svc->pr;
>>  	struct apr_rx_buf *abuf, *b;
>>  	unsigned long flags;
>>  
>> -	if (!list_empty(&apr->rx_list)) {
>> -		list_for_each_entry_safe(abuf, b, &apr->rx_list, node) {
>> +	for (;;) {
>> +		LIST_HEAD(local);
>> +
>> +		spin_lock_irqsave(&svc->lock, flags);
>> +		if (list_empty(&svc->rx_list)) {
>> +			spin_unlock_irqrestore(&svc->lock, flags);
>> +			break;
>> +		}
>> +
>> +		list_splice_init(&svc->rx_list, &local);
>> +		spin_unlock_irqrestore(&svc->lock, flags);
>> +
>> +		list_for_each_entry_safe(abuf, b, &local, node) {
>>  			switch (apr->type) {
>>  			case PR_TYPE_APR:
>> -				apr_do_rx_callback(apr, abuf);
>> +				apr_do_rx_callback(svc, abuf);
>>  				break;
>>  			case PR_TYPE_GPR:
>> -				gpr_do_rx_callback(apr, abuf);
>> +				gpr_do_rx_callback(svc, abuf);
>>  				break;
>>  			default:
>>  				break;
>>  			}
>> -			spin_lock_irqsave(&apr->rx_lock, flags);
>> +			apr_svc_put(svc);
>>  			list_del(&abuf->node);
>> -			spin_unlock_irqrestore(&apr->rx_lock, flags);
>>  			kfree(abuf);
>>  		}
>>  	}
>>  }
>>  
>> +gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
>> +				gpr_port_cb cb,	void *priv)
>> +{
>> +	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
>> +	gpr_port_t *port;
>> +	struct pkt_router_svc *svc;
>> +	int id;
>> +
>> +	port = kzalloc_obj(*port);
>> +	if (!port)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	svc = port;
>> +	svc->callback = cb;
>> +	svc->pr = pr;
>> +	svc->priv = priv;
>> +	svc->dying = false;
>> +	svc->dynamic_svc = true;
>> +	svc->dev = dev;
>> +	spin_lock_init(&svc->lock);
>> +
>> +	INIT_WORK(&svc->rx_work, apr_service_rxwq);
>> +	INIT_LIST_HEAD(&svc->rx_list);
>> +	kref_init(&svc->refcount);
>> +
>> +	spin_lock(&pr->svcs_lock);
>> +	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
>> +			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
>> +	if (id < 0) {
>> +		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
>> +		kfree(port);
>> +		spin_unlock(&pr->svcs_lock);
>> +		return ERR_PTR(id);
>> +	}
>> +
>> +	svc->id = id;
>> +	spin_unlock(&pr->svcs_lock);
>> +
>> +	return port;
>> +}
>> +EXPORT_SYMBOL_GPL(gpr_alloc_port);
>> +
>>  static int apr_device_match(struct device *dev, const struct device_driver *drv)
>>  {
>>  	struct apr_device *adev = to_apr_device(dev);
>> @@ -390,6 +475,11 @@ static void apr_device_remove(struct device *dev)
>>  	struct apr_device *adev = to_apr_device(dev);
>>  	struct apr_driver *adrv = to_apr_driver(dev->driver);
>>  	struct packet_router *apr = dev_get_drvdata(adev->dev.parent);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&adev->svc.lock, flags);
>> +	adev->svc.dying = true;
>> +	spin_unlock_irqrestore(&adev->svc.lock, flags);
>>  
>>  	if (adrv->remove)
>>  		adrv->remove(adev);
>> @@ -437,9 +527,15 @@ static int apr_add_device(struct device *dev, struct device_node *np,
>>  	svc->id = svc_id;
>>  	svc->pr = apr;
>>  	svc->priv = adev;
>> +	svc->dying = false;
>>  	svc->dev = dev;
>> +	svc->dynamic_svc = false;
>>  	spin_lock_init(&svc->lock);
>>  
>> +	INIT_WORK(&svc->rx_work, apr_service_rxwq);
>> +	INIT_LIST_HEAD(&svc->rx_list);
>> +	kref_init(&svc->refcount);
>> +
>>  	adev->domain_id = domain_id;
>>  
>>  	if (np)
>> @@ -488,7 +584,6 @@ static int apr_add_device(struct device *dev, struct device_node *np,
>>  		dev_err(dev, "device_register failed: %d\n", ret);
>>  		put_device(&adev->dev);
>>  	}
>> -
>>  out:
>>  	return ret;
>>  }
>> @@ -629,12 +724,12 @@ static int apr_probe(struct rpmsg_device *rpdev)
>>  	dev_set_drvdata(dev, apr);
>>  	apr->ch = rpdev->ept;
>>  	apr->dev = dev;
>> -	apr->rxwq = create_singlethread_workqueue("qcom_apr_rx");
>> +
>> +	apr->rxwq = alloc_workqueue("qcom_apr_rx", WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
>>  	if (!apr->rxwq) {
>>  		dev_err(apr->dev, "Failed to start Rx WQ\n");
>>  		return -ENOMEM;
>>  	}
>> -	INIT_WORK(&apr->rx_work, apr_rxwq);
>>  
>>  	apr->pdr = pdr_handle_alloc(apr_pd_status, apr);
>>  	if (IS_ERR(apr->pdr)) {
>> @@ -643,8 +738,6 @@ static int apr_probe(struct rpmsg_device *rpdev)
>>  		goto destroy_wq;
>>  	}
>>  
>> -	INIT_LIST_HEAD(&apr->rx_list);
>> -	spin_lock_init(&apr->rx_lock);
>>  	spin_lock_init(&apr->svcs_lock);
>>  	idr_init(&apr->svcs_idr);
>>  
>> diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
>> index 58fa1df96347..f5bc55c3d025 100644
>> --- a/include/linux/soc/qcom/apr.h
>> +++ b/include/linux/soc/qcom/apr.h
>> @@ -3,6 +3,7 @@
>>  #ifndef __QCOM_APR_H_
>>  #define __QCOM_APR_H_
>>  
>> +#include <linux/kref.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/device.h>
>>  #include <linux/mod_devicetable.h>
>> @@ -129,6 +130,11 @@ struct pkt_router_svc {
>>  	gpr_port_cb callback;
>>  	struct packet_router *pr;
>>  	spinlock_t lock;
>> +	struct work_struct rx_work;
>> +	struct list_head rx_list;
>> +	struct kref refcount;
>> +	bool dying;
>> +	bool dynamic_svc;
>>  	int id;
>>  	void *priv;
>>  };
>> -- 
>> 2.47.3
>>


