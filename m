Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69C7A12F84A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 13:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbgACMgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 07:36:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:29396 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727521AbgACMgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 07:36:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578054967; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kiPKLl25CMkgbt1UJF6pIm0BUIao7Fhc3M9zQRP/hqI=;
 b=c+qHPohYIjuW0qlUPVlrGrAD9A9L4aKMgjqKTNO9R0Xvt9PJopJI5+20V5L8tpHHg0aCHSv4
 Njf3t678lnnBduho14Ph0Df3FoR+kEwmBljZBcuIoxvs5uTRLwuVrtltYcaZ7qMfFIj4LYXs
 eD/v4YuRbetCEtvVCK2vfTXgC04=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0f3536.7f772b4abe30-smtp-out-n01;
 Fri, 03 Jan 2020 12:36:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5FECCC447A3; Fri,  3 Jan 2020 12:36:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2310C4479C;
        Fri,  3 Jan 2020 12:36:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 03 Jan 2020 18:06:04 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
In-Reply-To: <20200102204516.GG988120@minitux>
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-2-sibis@codeaurora.org>
 <20200102204516.GG988120@minitux>
Message-ID: <96e7283245821e67c543a02b3c3c0f3f@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

Thanks for taking time to review
the series.

On 2020-01-03 02:15, Bjorn Andersson wrote:
> On Sun 29 Dec 21:00 PST 2019, Sibi Sankar wrote:
> [..]
>> diff --git a/drivers/soc/qcom/pdr_interface.c 
>> b/drivers/soc/qcom/pdr_interface.c
> [..]
>> +static int servreg_locator_new_server(struct qmi_handle *qmi,
>> +				      struct qmi_service *svc)
>> +{
>> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
>> +					      servloc_client);
>> +	struct pdr_service *pds, *tmp;
>> +
>> +	/* Create a Local client port for QMI communication */
>> +	pdr->servloc_addr.sq_family = AF_QIPCRTR;
>> +	pdr->servloc_addr.sq_node = svc->node;
>> +	pdr->servloc_addr.sq_port = svc->port;
>> +
>> +	mutex_lock(&pdr->locator_lock);
>> +	pdr->locator_available = true;
>> +	mutex_unlock(&pdr->locator_lock);
>> +
>> +	/* Service pending lookup requests */
>> +	mutex_lock(&pdr->list_lock);
>> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
> 
> No need to make this _safe, as you're not modifying the list in the
> loop.

sure I'll do that

> 
>> +		if (pds->need_servreg_lookup)
>> +			schedule_work(&pdr->servloc_work);
>> +	}
>> +	mutex_unlock(&pdr->list_lock);
>> +
>> +	return 0;
>> +}
> [..]
>> +static void pdr_servreg_link_create(struct pdr_handle *pdr,
>> +				    struct pdr_service *pds)
>> +{
>> +	struct pdr_service *pds_iter, *tmp;
>> +	bool link_exists = false;
>> +
>> +	/* Check if a QMI link to SERVREG instance already exists */
>> +	mutex_lock(&pdr->list_lock);
>> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
>> +		if (pds_iter->instance == pds->instance &&
> 
> Flip this condition around and continue if it's not a match, to save
> indentation and to split the two expressions into two distinct checks.

sure I'll do that

> 
>> +		    strcmp(pds_iter->service_path, pds->service_path)) {
> 
> Isn't this just saying:
> 	if (pds_iter == pds)
> 		continue;
> 
> With the purpose of link_exists to be !empty(set(lookups) - pds) ?

More like:
!empty(set(lookups_with_same_instance) - pds)

servreg_link_create was added to re-use
an existing qmi_lookup i.e deal with
PDs running on the same remote processor.
This can be identified by looking for
a lookup with the same instance value
but with a different service path. We
still need to register the service_path
with the servreg service once its up.

> 
> But if I read pdr_add_lookup() correctly it's possible that a client
> could call pdr_add_lookup() more than once before pdr_servloc_work() is
> scheduled, in which case "set(lookup) - pds" isn't empty and as such 
> you
> won't add the lookup?

holding the lock over entire servloc_work
should handle that scenario? That way we
can ensure qmi_lookup is called atleast
once.

> 
>> +			link_exists = true;
>> +			pds->service_connected = pds_iter->service_connected;
>> +			if (pds_iter->service_connected)
>> +				pds->need_servreg_register = true;
>> +			else
>> +				pds->need_servreg_remove = true;
>> +			queue_work(pdr->servreg_wq, &pdr->servreg_work);
>> +			break;
>> +		}
>> +	}
> [..]
>> +static void pdr_servloc_work(struct work_struct *work)
>> +{
>> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
>> +					      servloc_work);
>> +	struct pdr_service *pds, *tmp;
>> +	int ret;
>> +
>> +	/* Bail out early if PD Mapper is not up */
>> +	mutex_lock(&pdr->locator_lock);
>> +	if (!pdr->locator_available) {
>> +		mutex_unlock(&pdr->locator_lock);
>> +		pr_warn("PDR: SERVICE LOCATOR service not available\n");
>> +		return;
>> +	}
>> +	mutex_unlock(&pdr->locator_lock);
>> +
>> +	mutex_lock(&pdr->list_lock);
>> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
> 
> As written right now you don't need _safe here, because in the only 
> case
> you're modifying the list you end up exiting the loop.

sure

> 
>> +		if (!pds->need_servreg_lookup)
>> +			continue;
>> +
>> +		pds->need_servreg_lookup = false;
>> +		mutex_unlock(&pdr->list_lock);
> 
> You should probably just hold on to list_lock over this entire loop.
> 
>> +
>> +		ret = pdr_locate_service(pdr, pds);
>> +		if (ret < 0) {
>> +			if (ret == -ENXIO)
>> +				pds->state = SERVREG_LOCATOR_UNKNOWN_SERVICE;
>> +			else if (ret == -EAGAIN)
>> +				pds->state = SERVREG_LOCATOR_DB_UPDATED;
> 
> Isn't this something that we should recover from?

yes its a case where the json
referenced by pd-mapper has been
updated mid lookup. Calling lookup
again should ideally fix this but
we'll have to decide on the max
number of retries. I guess I can
simulate such a scenario with
a custom json file and pd-mapper
changes.

> 
>> +			else
>> +				pds->state = SERVREG_LOCATOR_ERR;
>> +
>> +			pr_err("PDR: service lookup for %s failed: %d\n",
>> +			       pds->service_name, ret);
>> +
>> +			/* Remove from lookup list */
>> +			mutex_lock(&pdr->list_lock);
>> +			list_del(&pds->node);
> 
> What should I do in my driver when this happens?

db_updated -> retry should fix
               this error

unknown_service -> lookup not found.

^^ With the way pd-mapper is implemented
its not really recoverable until pd-mapper
is restarted with different args.

locator_err -> not really recoverable

> 
>> +			mutex_unlock(&pdr->list_lock);
>> +
>> +			/* Notify Lookup failed */
>> +			mutex_lock(&pdr->status_lock);
>> +			pdr->status(pdr, pds);
>> +			mutex_unlock(&pdr->status_lock);
>> +			kfree(pds);
>> +		} else {
>> +			pdr_servreg_link_create(pdr, pds);
>> +		}
>> +
>> +		return;
> 
> There might be more pds entries with need_servreg_lookup in the list,
> shouldn't we allow this to continue?

but we've already scheduled a
number of workers to deal with
this.

> 
> This would though imply that you should hold onto the list_lock over 
> the
> entire loop, which I think looks fine.

sure

> 
>> +	}
>> +	mutex_unlock(&pdr->list_lock);
>> +}
>> +
>> +/**
>> + * pdr_add_lookup() - register a tracking request for a PD
>> + * @pdr:		PDR client handle
>> + * @service_name:	service name of the tracking request
>> + * @service_path:	service path of the tracking request
>> + *
>> + * Registering a pdr lookup allows for tracking the life cycle of the 
>> PD.
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +int pdr_add_lookup(struct pdr_handle *pdr, const char *service_name,
>> +		   const char *service_path)
>> +{
>> +	struct pdr_service *pds, *pds_iter, *tmp;
>> +	int ret;
>> +
>> +	if (!service_name || strlen(service_name) > SERVREG_NAME_LENGTH ||
>> +	    !service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
>> +		return -EINVAL;
>> +
>> +	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
>> +	if (!pds)
>> +		return -ENOMEM;
>> +
>> +	pds->service = SERVREG_NOTIFIER_SERVICE;
>> +	strcpy(pds->service_name, service_name);
>> +	strcpy(pds->service_path, service_path);
>> +	pds->need_servreg_lookup = true;
>> +
>> +	mutex_lock(&pdr->list_lock);
>> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
> 
> No _safe

Thanks will update

> 
>> +		if (!strcmp(pds_iter->service_path, service_path)) {
>> +			mutex_unlock(&pdr->list_lock);
>> +			ret = -EALREADY;
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	list_add(&pds->node, &pdr->lookups);
>> +	mutex_unlock(&pdr->list_lock);
>> +
>> +	schedule_work(&pdr->servloc_work);
>> +
>> +	return 0;
>> +err:
>> +	kfree(pds);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(pdr_add_lookup);
>> +
>> +/**
>> + * pdr_restart_pd() - restart PD
>> + * @pdr:		PDR client handle
>> + * @service_path:	service path of restart request
>> + *
>> + * Restarts the PD tracked by the PDR client handle for a given 
>> service path.
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +int pdr_restart_pd(struct pdr_handle *pdr, const char *service_path)
>> +{
>> +	struct servreg_restart_pd_req req;
>> +	struct servreg_restart_pd_resp resp;
>> +	struct pdr_service *pds = NULL, *pds_iter, *tmp;
>> +	struct qmi_txn txn;
>> +	int ret;
>> +
>> +	if (!service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&pdr->list_lock);
>> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
>> +		if (!pds_iter->service_connected)
>> +			continue;
>> +
>> +		if (!strcmp(pds_iter->service_path, service_path)) {
>> +			pds = pds_iter;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&pdr->list_lock);
>> +
>> +	if (!pds)
> 
> Given that you may only call pdr_restart_pd() on something created by
> first calling pdr_add_lookup(), how about returning the struct
> pdr_service from pdr_add_lookup() instead and then have the client pass
> that as an argument to this function.
> 
> Most clients doesn't care about pdr_restart_pd() so they would only 
> have
> to IS_ERR(pdr_add_lookup()) anyways, and the ones that care can carry
> the returned pointer.
> 
> 
> Note that the struct pdr_service doesn't have to be defined in a way
> that it's possible to dereference by clients.

sure will update the design in the
next re-spin.

> 
>> +		return -EINVAL;
>> +
>> +	/* Prepare req message */
>> +	strcpy(req.service_path, pds->service_path);
>> +
>> +	ret = qmi_txn_init(&pdr->servreg_client, &txn,
>> +			   servreg_restart_pd_resp_ei,
>> +			   &resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
>> +			       &txn, SERVREG_RESTART_PD_REQ,
>> +			       SERVREG_RESTART_PD_REQ_MAX_LEN,
>> +			       servreg_restart_pd_req_ei, &req);
>> +	if (ret < 0) {
>> +		qmi_txn_cancel(&txn);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_txn_wait(&txn, 5 * HZ);
>> +	if (ret < 0) {
>> +		pr_err("PDR: %s PD restart txn wait failed: %d\n",
>> +		       pds->service_path, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Check response if PDR is disabled */
>> +	if (resp.resp.result == QMI_RESULT_FAILURE_V01 &&
>> +	    resp.resp.error == QMI_ERR_DISABLED_V01) {
>> +		pr_err("PDR: %s PD restart is disabled: 0x%x\n",
>> +		       pds->service_path, resp.resp.error);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	/* Check the response for other error case*/
>> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
>> +		pr_err("PDR: %s request for PD restart failed: 0x%x\n",
>> +		       pds->service_path, resp.resp.error);
>> +		return -EREMOTEIO;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(pdr_restart_pd);
> [..]
>> +/**
>> + * struct pdr_service - context to track lookups/restarts
>> + * @service_name:		name of the service running on the PD
>> + * @service_path:		service path of the PD
>> + * @service_data_valid:		indicates if service_data field has valid 
>> data
>> + * @service_data:		service data provided by servreg_locator service
>> + * @need_servreg_lookup:	state flag for tracking servreg lookup 
>> requests
>> + * @need_servreg_register:	state flag for tracking pending servreg 
>> register
>> + * @need_servreg_remove:	state flag for tracking pending servreg 
>> remove
>> + * @service_connected:		current state of servreg_notifier qmi service
>> + * @state:			current state of PD
>> + * @service:			servreg_notifer service type
>> + * @instance:			instance id of the @service
>> + * @priv:			handle for client's use
>> + * @node:			list_head for house keeping
>> + */
>> +struct pdr_service {
> 
> This is primarily internal bookkeeping, how about not exposing it to 
> the
> clients? This would imply that status() would have to be called with
> pdr_service->priv and pdr_service->state as arguments instead.

sure will update the design in the
next re-spin.

> 
>> +	char service_name[SERVREG_NAME_LENGTH + 1];
>> +	char service_path[SERVREG_NAME_LENGTH + 1];
>> +
>> +	u8 service_data_valid;
>> +	u32 service_data;
>> +
>> +	bool need_servreg_lookup;
>> +	bool need_servreg_register;
>> +	bool need_servreg_remove;
>> +	bool service_connected;
>> +	int state;
>> +
>> +	unsigned int instance;
>> +	unsigned int service;
>> +
>> +	void *priv;
>> +	struct list_head node;
>> +};
>> +
> [..]
>> +	void (*status)(struct pdr_handle *pdr, struct pdr_service *pds);
>> +};
> 
> Regards,
> Bjorn

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
