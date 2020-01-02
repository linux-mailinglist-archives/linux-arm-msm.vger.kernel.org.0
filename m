Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A769D12EAEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 21:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgABUpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 15:45:20 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39263 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgABUpU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 15:45:20 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so15299598plp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 12:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x8QkG4SdFkSgEYfSb7GaqP99wYtYdPzolhab2BOnIpE=;
        b=A2qNSC7IXjOEgdBiWwVv86G5ZXe3JwWAwkn+V0Jdgh3j0YtyJo05Z3zSa+GnK0y2/q
         jYV3jVHWvGSWrJ0D881Pl0syy3z+UVRkEc7IimElWUtQhf592kCmj15LCdmXMiJQw5VT
         NF0IbHa3Fca8h0G1YIe5Z9jp7TQCzvwKyP+4zGbBjdvT5xjCHl9GY3daZQoU2fhiIgB9
         9l0II7DcwQBveUrJ4A6Ha6oC7N2ji2+CfklPz0mcKCuYk8oXlUWejPuAXsN3gN+TbwlE
         kivQ8Eolbedy+CcpdGNsImA6s25gX7F8fKaxCeHzHoo3iwANpNxyEODqbdtFuXzIqCY/
         dWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x8QkG4SdFkSgEYfSb7GaqP99wYtYdPzolhab2BOnIpE=;
        b=a6tdKokiHIGMxSxIrOXJbNGu2KAYFUdbl0S9Whfm1+NDuQyVpHtkZ/Kf74NaqyfmJz
         rH0ZX/+fCCk58dPEKUAjW/GKl5MMvqiP2R0bEaEJ/d7+aA1GUH7TJ4lq+dZ07o+Z9bEu
         x3asAZ6rghUX+fNhh3MaKd6Efh+o2assQkyWi/GnLyUhBbBwpNGAqt41Ft8WDH3Sioze
         VUYEU7ODc0j1ClLrr1Uy/11npHJ6xV23Sz9/os5V2Ux3i7Uf3Z2nI8QXzg5JvrdKvpKZ
         f2J68BSYTM6qKFv5vm33Vfrw3VgvIQW/SXRdeR1A9JGwdR/oWIXhYiRlRM6KrWb6bs+T
         NaBg==
X-Gm-Message-State: APjAAAWo8HhuNL5RHtBVg1ECgBFfN2VGfco1f/vgYQK6lrAHqL5tZQ+d
        u9bwXVrh6dj5cpyuOjTn3x3ozQ==
X-Google-Smtp-Source: APXvYqwbTOCZtcj+2l8BtMHXecMX/UIggMzx29jYjJHRMZzxwOvsEpw4lSPUYuTS4Zpj3z1VR+o7Jg==
X-Received: by 2002:a17:902:788e:: with SMTP id q14mr86822023pll.305.1577997919400;
        Thu, 02 Jan 2020 12:45:19 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e19sm12210518pjr.10.2020.01.02.12.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 12:45:18 -0800 (PST)
Date:   Thu, 2 Jan 2020 12:45:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20200102204516.GG988120@minitux>
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230050008.8143-2-sibis@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 29 Dec 21:00 PST 2019, Sibi Sankar wrote:
[..]
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
[..]
> +static int servreg_locator_new_server(struct qmi_handle *qmi,
> +				      struct qmi_service *svc)
> +{
> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> +					      servloc_client);
> +	struct pdr_service *pds, *tmp;
> +
> +	/* Create a Local client port for QMI communication */
> +	pdr->servloc_addr.sq_family = AF_QIPCRTR;
> +	pdr->servloc_addr.sq_node = svc->node;
> +	pdr->servloc_addr.sq_port = svc->port;
> +
> +	mutex_lock(&pdr->locator_lock);
> +	pdr->locator_available = true;
> +	mutex_unlock(&pdr->locator_lock);
> +
> +	/* Service pending lookup requests */
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {

No need to make this _safe, as you're not modifying the list in the
loop.

> +		if (pds->need_servreg_lookup)
> +			schedule_work(&pdr->servloc_work);
> +	}
> +	mutex_unlock(&pdr->list_lock);
> +
> +	return 0;
> +}
[..]
> +static void pdr_servreg_link_create(struct pdr_handle *pdr,
> +				    struct pdr_service *pds)
> +{
> +	struct pdr_service *pds_iter, *tmp;
> +	bool link_exists = false;
> +
> +	/* Check if a QMI link to SERVREG instance already exists */
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
> +		if (pds_iter->instance == pds->instance &&

Flip this condition around and continue if it's not a match, to save
indentation and to split the two expressions into two distinct checks.

> +		    strcmp(pds_iter->service_path, pds->service_path)) {

Isn't this just saying:
	if (pds_iter == pds)
		continue;

With the purpose of link_exists to be !empty(set(lookups) - pds) ? 

But if I read pdr_add_lookup() correctly it's possible that a client
could call pdr_add_lookup() more than once before pdr_servloc_work() is
scheduled, in which case "set(lookup) - pds" isn't empty and as such you
won't add the lookup?

> +			link_exists = true;
> +			pds->service_connected = pds_iter->service_connected;
> +			if (pds_iter->service_connected)
> +				pds->need_servreg_register = true;
> +			else
> +				pds->need_servreg_remove = true;
> +			queue_work(pdr->servreg_wq, &pdr->servreg_work);
> +			break;
> +		}
> +	}
[..]
> +static void pdr_servloc_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      servloc_work);
> +	struct pdr_service *pds, *tmp;
> +	int ret;
> +
> +	/* Bail out early if PD Mapper is not up */
> +	mutex_lock(&pdr->locator_lock);
> +	if (!pdr->locator_available) {
> +		mutex_unlock(&pdr->locator_lock);
> +		pr_warn("PDR: SERVICE LOCATOR service not available\n");
> +		return;
> +	}
> +	mutex_unlock(&pdr->locator_lock);
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {

As written right now you don't need _safe here, because in the only case
you're modifying the list you end up exiting the loop.

> +		if (!pds->need_servreg_lookup)
> +			continue;
> +
> +		pds->need_servreg_lookup = false;
> +		mutex_unlock(&pdr->list_lock);

You should probably just hold on to list_lock over this entire loop.

> +
> +		ret = pdr_locate_service(pdr, pds);
> +		if (ret < 0) {
> +			if (ret == -ENXIO)
> +				pds->state = SERVREG_LOCATOR_UNKNOWN_SERVICE;
> +			else if (ret == -EAGAIN)
> +				pds->state = SERVREG_LOCATOR_DB_UPDATED;

Isn't this something that we should recover from?

> +			else
> +				pds->state = SERVREG_LOCATOR_ERR;
> +
> +			pr_err("PDR: service lookup for %s failed: %d\n",
> +			       pds->service_name, ret);
> +
> +			/* Remove from lookup list */
> +			mutex_lock(&pdr->list_lock);
> +			list_del(&pds->node);

What should I do in my driver when this happens?

> +			mutex_unlock(&pdr->list_lock);
> +
> +			/* Notify Lookup failed */
> +			mutex_lock(&pdr->status_lock);
> +			pdr->status(pdr, pds);
> +			mutex_unlock(&pdr->status_lock);
> +			kfree(pds);
> +		} else {
> +			pdr_servreg_link_create(pdr, pds);
> +		}
> +
> +		return;

There might be more pds entries with need_servreg_lookup in the list,
shouldn't we allow this to continue?

This would though imply that you should hold onto the list_lock over the
entire loop, which I think looks fine.

> +	}
> +	mutex_unlock(&pdr->list_lock);
> +}
> +
> +/**
> + * pdr_add_lookup() - register a tracking request for a PD
> + * @pdr:		PDR client handle
> + * @service_name:	service name of the tracking request
> + * @service_path:	service path of the tracking request
> + *
> + * Registering a pdr lookup allows for tracking the life cycle of the PD.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int pdr_add_lookup(struct pdr_handle *pdr, const char *service_name,
> +		   const char *service_path)
> +{
> +	struct pdr_service *pds, *pds_iter, *tmp;
> +	int ret;
> +
> +	if (!service_name || strlen(service_name) > SERVREG_NAME_LENGTH ||
> +	    !service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
> +		return -EINVAL;
> +
> +	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
> +	if (!pds)
> +		return -ENOMEM;
> +
> +	pds->service = SERVREG_NOTIFIER_SERVICE;
> +	strcpy(pds->service_name, service_name);
> +	strcpy(pds->service_path, service_path);
> +	pds->need_servreg_lookup = true;
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {

No _safe

> +		if (!strcmp(pds_iter->service_path, service_path)) {
> +			mutex_unlock(&pdr->list_lock);
> +			ret = -EALREADY;
> +			goto err;
> +		}
> +	}
> +
> +	list_add(&pds->node, &pdr->lookups);
> +	mutex_unlock(&pdr->list_lock);
> +
> +	schedule_work(&pdr->servloc_work);
> +
> +	return 0;
> +err:
> +	kfree(pds);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(pdr_add_lookup);
> +
> +/**
> + * pdr_restart_pd() - restart PD
> + * @pdr:		PDR client handle
> + * @service_path:	service path of restart request
> + *
> + * Restarts the PD tracked by the PDR client handle for a given service path.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int pdr_restart_pd(struct pdr_handle *pdr, const char *service_path)
> +{
> +	struct servreg_restart_pd_req req;
> +	struct servreg_restart_pd_resp resp;
> +	struct pdr_service *pds = NULL, *pds_iter, *tmp;
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	if (!service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
> +		return -EINVAL;
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
> +		if (!pds_iter->service_connected)
> +			continue;
> +
> +		if (!strcmp(pds_iter->service_path, service_path)) {
> +			pds = pds_iter;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&pdr->list_lock);
> +
> +	if (!pds)

Given that you may only call pdr_restart_pd() on something created by
first calling pdr_add_lookup(), how about returning the struct
pdr_service from pdr_add_lookup() instead and then have the client pass
that as an argument to this function.

Most clients doesn't care about pdr_restart_pd() so they would only have
to IS_ERR(pdr_add_lookup()) anyways, and the ones that care can carry
the returned pointer.


Note that the struct pdr_service doesn't have to be defined in a way
that it's possible to dereference by clients.

> +		return -EINVAL;
> +
> +	/* Prepare req message */
> +	strcpy(req.service_path, pds->service_path);
> +
> +	ret = qmi_txn_init(&pdr->servreg_client, &txn,
> +			   servreg_restart_pd_resp_ei,
> +			   &resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
> +			       &txn, SERVREG_RESTART_PD_REQ,
> +			       SERVREG_RESTART_PD_REQ_MAX_LEN,
> +			       servreg_restart_pd_req_ei, &req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, 5 * HZ);
> +	if (ret < 0) {
> +		pr_err("PDR: %s PD restart txn wait failed: %d\n",
> +		       pds->service_path, ret);
> +		return ret;
> +	}
> +
> +	/* Check response if PDR is disabled */
> +	if (resp.resp.result == QMI_RESULT_FAILURE_V01 &&
> +	    resp.resp.error == QMI_ERR_DISABLED_V01) {
> +		pr_err("PDR: %s PD restart is disabled: 0x%x\n",
> +		       pds->service_path, resp.resp.error);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Check the response for other error case*/
> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> +		pr_err("PDR: %s request for PD restart failed: 0x%x\n",
> +		       pds->service_path, resp.resp.error);
> +		return -EREMOTEIO;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(pdr_restart_pd);
[..]
> +/**
> + * struct pdr_service - context to track lookups/restarts
> + * @service_name:		name of the service running on the PD
> + * @service_path:		service path of the PD
> + * @service_data_valid:		indicates if service_data field has valid data
> + * @service_data:		service data provided by servreg_locator service
> + * @need_servreg_lookup:	state flag for tracking servreg lookup requests
> + * @need_servreg_register:	state flag for tracking pending servreg register
> + * @need_servreg_remove:	state flag for tracking pending servreg remove
> + * @service_connected:		current state of servreg_notifier qmi service
> + * @state:			current state of PD
> + * @service:			servreg_notifer service type
> + * @instance:			instance id of the @service
> + * @priv:			handle for client's use
> + * @node:			list_head for house keeping
> + */
> +struct pdr_service {

This is primarily internal bookkeeping, how about not exposing it to the
clients? This would imply that status() would have to be called with
pdr_service->priv and pdr_service->state as arguments instead.

> +	char service_name[SERVREG_NAME_LENGTH + 1];
> +	char service_path[SERVREG_NAME_LENGTH + 1];
> +
> +	u8 service_data_valid;
> +	u32 service_data;
> +
> +	bool need_servreg_lookup;
> +	bool need_servreg_register;
> +	bool need_servreg_remove;
> +	bool service_connected;
> +	int state;
> +
> +	unsigned int instance;
> +	unsigned int service;
> +
> +	void *priv;
> +	struct list_head node;
> +};
> +
[..]
> +	void (*status)(struct pdr_handle *pdr, struct pdr_service *pds);
> +};

Regards,
Bjorn
