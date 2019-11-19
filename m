Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1896010197D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 07:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfKSGkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 01:40:33 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39440 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfKSGkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 01:40:33 -0500
Received: by mail-pj1-f65.google.com with SMTP id t103so2286794pjb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 22:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MRQG5nJu7nwqAH42LpwKdzXc/U/hMSOKXLJecc/2fMY=;
        b=SxpI8ZZYKjVOUzSSgkynyPl5H+G65bjneu7wv31XqUb4ZNoKaOFZt78ycsN+rVfATb
         V2PE6tDkSn514B8NrSJsrN6wW4IN8/qwbaG0pVVvMO1ttaTTjJdjIdHbtI60LONuDph6
         lHFPfPQ13OmH+FvxF52lMyh7tFe3n4q/OMJ1K+bLTQvZPAWPlvhmf2UNLa1TjjMoKp1I
         5ybqE6AVttwDYMMI7AX9w3G0nlYrJPu62nWpY+FWjj/V/FoLJ3VjHcWX+Qg87rTjbwPt
         HWL1HYN603WEgKOJ4UIyON+xh5fpONeBOQ8ft2pqwycacVJzVU6aJ7J6SQBVi03OolNS
         5eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MRQG5nJu7nwqAH42LpwKdzXc/U/hMSOKXLJecc/2fMY=;
        b=HXEoTk3dFoFbS4nUpIEJtYmtKPv1OD8+WqQFo/0rnA3iK9Fx7pXY4Ua+v7Ymn7a25m
         bq0ImyVTtLXKxBsnPbqW3Cw8o7ImP5MMEQ0oWqKsWI0OtTH4oCC01zC82dU81jMtPSlu
         WvVtF7IsoPaWhr7ZL3MNrGIsMpdlJWei4++QbHUxOcD+T2Co04WRfA4YQ+iCfZwc3BuQ
         H63Udt5XkabPbetP7Vg3J+QvK9bHXb3RrZ9cimMMZqS3OnB+fbpsHqbAilpfnUUzo6q/
         GgP1uzNsxe6e6ZeA5TDBTr29yEuLqGYjNvHyILeUajD9mP2AjvRu5WlWIPhTjGpC6whO
         DcPQ==
X-Gm-Message-State: APjAAAWWDmdf0M+zFc9IJHjUMerBGSNheq5W9l66CMLuJxzr3vq1n62+
        gwiXq3kY3ZA61KAd1iL2eTD6Fg==
X-Google-Smtp-Source: APXvYqyKvUabBtrBX50z/baZAwlhdtn+pq1nEUc71w/53EXcQX5QRw6ouS2vW6pQHua1wIlhgIpG8Q==
X-Received: by 2002:a17:902:904c:: with SMTP id w12mr33683271plz.144.1574145630199;
        Mon, 18 Nov 2019 22:40:30 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c12sm24163279pfp.178.2019.11.18.22.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 22:40:29 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:40:26 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20191119064026.GE18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9be5e-1d6bbe06-4bab-434d-9040-ebfa3918b213-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7ee9be5e-1d6bbe06-4bab-434d-9040-ebfa3918b213-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 06:27 PST 2019, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
[..]
> +static void pdr_indack_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      indack_work);
> +	struct pdr_list_node *ind, *tmp;
> +	struct pdr_service *pds;
> +
> +	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
> +		pds = ind->pds;
> +		pdr_send_indack_msg(pdr, pds, ind->transaction_id);

So when we et a ind_cb with the new status, we need to send an ack
request, which will result in a response, just to confirm that we got
the event?

Seems like we should fix the qmi code to make it possible to send a
request from the indication handler and then we could simply ignore the
response. Or do we need to not pdr->status() until we get the response
for some reason?


Regardless, I'm fine with scheduling this for now...

> +		pdr->status(pdr, pds);
> +		list_del(&ind->node);
> +		kfree(ind);
> +	}
> +}
> +
> +static void pdr_servreg_ind_cb(struct qmi_handle *qmi,
> +			       struct sockaddr_qrtr *sq,
> +			       struct qmi_txn *txn, const void *data)
> +{
> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> +					      servreg_client);
> +	const struct servreg_state_updated_ind *ind_msg = data;
> +	struct pdr_list_node *ind;
> +	struct pdr_service *pds;
> +
> +	if (!ind_msg || !ind_msg->service_path ||
> +	    strlen(ind_msg->service_path) > (SERVREG_NAME_LENGTH + 1))
> +		return;
> +
> +	list_for_each_entry(pds, &pdr->lookups, node) {
> +		if (!strcmp(pds->service_path, ind_msg->service_path))
> +			goto found;
> +	}
> +	return;
> +
> +found:
> +	pds->state = ind_msg->curr_state;
> +
> +	ind = kzalloc(sizeof(*ind), GFP_KERNEL);
> +	if (!ind)
> +		return;
> +
> +	pr_info("PDR: Indication received from %s, state: 0x%x, trans-id: %d\n",
> +		ind_msg->service_path, ind_msg->curr_state,
> +		ind_msg->transaction_id);
> +
> +	ind->transaction_id = ind_msg->transaction_id;
> +	ind->pds = pds;
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_add_tail(&ind->node, &pdr->indack_list);
> +	mutex_unlock(&pdr->list_lock);
> +
> +	queue_work(pdr->indack_wq, &pdr->indack_work);
> +}
> +
> +static struct qmi_msg_handler qmi_indication_handler[] = {
> +	{
> +		.type = QMI_INDICATION,
> +		.msg_id = SERVREG_STATE_UPDATED_IND_ID,
> +		.ei = servreg_state_updated_ind_ei,
> +		.decoded_size = sizeof(struct servreg_state_updated_ind),
> +		.fn = pdr_servreg_ind_cb,
> +	},
> +	{}
> +};
> +
> +static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
> +			       struct servreg_get_domain_list_resp *resp,
> +			       struct pdr_handle *pdr)
> +{
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	ret = qmi_txn_init(&pdr->servloc_client, &txn,
> +			   servreg_get_domain_list_resp_ei, resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = qmi_send_request(&pdr->servloc_client,
> +			       &pdr->servloc_addr,
> +			       &txn, SERVREG_GET_DOMAIN_LIST_REQ,
> +			       SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN,
> +			       servreg_get_domain_list_req_ei,
> +			       req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, 5 * HZ);
> +	if (ret < 0) {
> +		pr_err("PDR: %s get domain list txn wait failed: %d\n",
> +		       req->service_name, ret);
> +		return ret;
> +	}
> +
> +	/* Check the response */
> +	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
> +		pr_err("PDR: %s get domain list failed: 0x%x\n",
> +		       req->service_name, resp->resp.error);
> +		return -EREMOTEIO;
> +	}
> +
> +	return ret;

ret here will be the number of bytes decoded, but you really only care
about if this was an error or not. So I would suggest that you just
return 0 here.

> +}
> +
> +static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
> +{
> +	struct servreg_get_domain_list_resp *resp = NULL;
> +	struct servreg_get_domain_list_req req;
> +	int db_rev_count = 0, domains_read = 0;
> +	struct servreg_location_entry *entry;
> +	int ret, i;
> +
> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
> +	if (!resp)
> +		return -ENOMEM;
> +
> +	/* Prepare req message */
> +	strcpy(req.service_name, pds->service_name);
> +	req.domain_offset_valid = true;
> +	req.domain_offset = 0;
> +
> +	do {
> +		req.domain_offset = domains_read;
> +		ret = pdr_get_domain_list(&req, resp, pdr);
> +		if (ret < 0)
> +			goto out;
> +
> +		if (!domains_read)
> +			db_rev_count = resp->db_rev_count;
> +
> +		if (db_rev_count != resp->db_rev_count) {
> +			ret = -EAGAIN;
> +			goto out;
> +		}
> +
> +		for (i = domains_read; i < resp->domain_list_len; i++) {
> +			entry = &resp->domain_list[i];
> +
> +			if (strlen(entry->name) > (SERVREG_NAME_LENGTH + 1))

In the event that the incoming string isn't NUL-terminated this will run
off the array.

if (strnlen(entry->name, SERVREG_NAME_LENGTH + 1) == SERVREG_NAME_LENGTH + 1)

or perhaps, relying on sizeof instead of duplicating the knowledge that
it is SERVREG_NAME_LENGTH + 1:

if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))

> +				continue;
> +
> +			if (!strcmp(entry->name, pds->service_path)) {
> +				pds->service_data_valid = entry->service_data_valid;
> +				pds->service_data = entry->service_data;
> +				pds->instance = entry->instance;
> +				goto out;
> +			}
> +		}
> +
> +		/* Update ret to indicate that the service is not yet found */
> +		ret = -EINVAL;
> +
> +		/* Always read total_domains from the response msg */
> +		if (resp->domain_list_len >  resp->total_domains)

Double space after '>'

> +			resp->domain_list_len = resp->total_domains;
> +
> +		domains_read += resp->domain_list_len;
> +	} while (domains_read < resp->total_domains);
> +out:
> +	kfree(resp);
> +	return ret;
> +}
> +
> +static void pdr_servloc_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      servloc_work);
> +	struct pdr_list_node *servloc, *tmp;
> +	struct pdr_service *pds;
> +	int ret;
> +
> +	list_for_each_entry_safe(servloc, tmp, &pdr->servloc_list, node) {
> +		pds = servloc->pds;
> +
> +		/* wait for PD Mapper to come up */
> +		ret = wait_for_completion_timeout(&pdr->locator_available, 10 * HZ);

Afaict this means that we will only look for the locator during the 10
seconds that follows a pdr_add_lookup().

How about changing this so that you bail before the loop if the locator
hasn't showed up yet and schedule this worker when the locator is
registered?

> +		if (!ret) {
> +			pr_err("PDR: SERVICE LOCATOR service wait failed\n");
> +			ret = -ETIMEDOUT;
> +			goto err;
> +		}
> +
> +		ret = pdr_locate_service(pdr, pds);
> +		if (ret < 0) {
> +			pr_err("PDR: service lookup for %s failed: %d\n",
> +			       pds->service_name, ret);
> +			goto err;
> +		}
> +
> +		qmi_add_lookup(&pdr->servreg_client, pds->service, 1,
> +			       pds->instance);
> +err:
> +		list_del(&servloc->node);
> +		kfree(servloc);
> +
> +		/* cleanup pds on error */
> +		if (ret < 0) {
> +			pds->state = SERVREG_LOCATOR_ERR;
> +			pdr->status(pdr, pds);
> +			list_del(&pds->node);
> +			kfree(pds);
> +		}
> +	}
> +}
[..]
> +int pdr_add_lookup(struct pdr_handle *pdr, const char *service_name,
> +		   const char *service_path)
> +{
> +	struct pdr_service *pds, *pds_iter, *tmp;
> +	struct pdr_list_node *servloc;
> +	int ret;
> +
> +	if (!service_name || strlen(service_name) > (SERVREG_NAME_LENGTH + 1) ||
> +	    !service_path || strlen(service_path) > (SERVREG_NAME_LENGTH + 1))

When strlen(x) == SERVREG_NAME_LENGTH + 1 your strcpy below would write
SERVREG_NAME_LENGTH + 2 bytes to service_name and service_path, so drop
the + 1 from the comparisons.

> +		return -EINVAL;
> +
> +	servloc = kzalloc(sizeof(*servloc), GFP_KERNEL);
> +	if (!servloc)
> +		return -ENOMEM;
> +
> +	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
> +	if (!pds) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	pds->service = SERVREG_NOTIFIER_SERVICE;
> +	strcpy(pds->service_name, service_name);
> +	strcpy(pds->service_path, service_path);
[..]
> +int pdr_restart_pd(struct pdr_handle *pdr, const char *service_path)
> +{
> +	struct servreg_restart_pd_req req;
> +	struct servreg_restart_pd_resp resp;
> +	struct pdr_service *pds = NULL, *pds_iter, *tmp;
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	if (!service_path || strlen(service_path) > (SERVREG_NAME_LENGTH + 1))

As above, drop the + 1

> +		return -EINVAL;
> +
[..]
> +int pdr_handle_init(struct pdr_handle *pdr,
> +		    int (*status)(struct pdr_handle *pdr,
> +				  struct pdr_service *pds))
> +{
[..]
> +	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
> +	if (!pdr->servreg_wq)
> +		return -ENOMEM;
> +
> +	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq", WQ_HIGHPRI);

The two workqueues means that we should be able to call pdr->status()
rom two concurrent contexts, I don't think our clients will expect that.

> +	if (!pdr->indack_wq) {
> +		ret = -ENOMEM;
> +		goto destroy_servreg;
> +	}
> +

Regards,
Bjorn
