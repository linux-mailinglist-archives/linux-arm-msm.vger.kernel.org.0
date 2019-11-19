Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89ECE1021E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 11:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfKSKSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 05:18:41 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:42210
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725798AbfKSKSl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 05:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574158719;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=tNouUf24fwWMn7xrLtC0xiqQw6My/pamIPrS/CwXCVU=;
        b=fbMr32Z+2KOctSQxn1IaK1Ka7KZNdTfhC5ESuQ4mWuxQ9oCSv+ZCQjmUj9tLIDqt
        s0NMJeN6B/HAUL3+krpAdsLbg5J9CeLIZNP1N68za3hmCi63aJkTpGTBQ7SLWSXArZN
        dZ3SejiiYzGJzr5D/PxovAZBJi7PItxHIQOK/AiQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574158719;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=tNouUf24fwWMn7xrLtC0xiqQw6My/pamIPrS/CwXCVU=;
        b=hs7mA+a4C5cotjT834fm0Ml304cFi4gseeut889PyMq00j0qQ0L/KVKtg/R4MsZx
        tsdbgYPaZPiJfKIHBFRrKbERzdSNUOa0+tKtP0k+oNWXVq8UGq8pZnFIpVRgsGGUxs+
        o48dvKiX8KajwzC95bV5CstZFB/TRPZR/7ytk+l0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Nov 2019 10:18:39 +0000
From:   sibis@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
In-Reply-To: <20191119064026.GE18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9be5e-1d6bbe06-4bab-434d-9040-ebfa3918b213-000000@us-west-2.amazonses.com>
 <20191119064026.GE18024@yoga>
Message-ID: <0101016e832bd805-a23a4f93-58ea-4a5f-94f7-d2d1d32b9d25-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.19-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,
Thanks for taking the time to
review the series :)

On 2019-11-19 12:10, Bjorn Andersson wrote:
> On Mon 18 Nov 06:27 PST 2019, Sibi Sankar wrote:
>> diff --git a/drivers/soc/qcom/pdr_interface.c 
>> b/drivers/soc/qcom/pdr_interface.c
> [..]
>> +static void pdr_indack_work(struct work_struct *work)
>> +{
>> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
>> +					      indack_work);
>> +	struct pdr_list_node *ind, *tmp;
>> +	struct pdr_service *pds;
>> +
>> +	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
>> +		pds = ind->pds;
>> +		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
> 
> So when we et a ind_cb with the new status, we need to send an ack
> request, which will result in a response, just to confirm that we got
> the event?
> 
> Seems like we should fix the qmi code to make it possible to send a
> request from the indication handler and then we could simply ignore the

yeah maybe having a provision
to send custom requests back on
indication would be the way
to go. Not all indication need
to be services with requests.

> response. Or do we need to not pdr->status() until we get the response
> for some reason?

adsp waits on the ack response for
a fixed duration and seems to throw
a fatal err is the ack is not
serviced. Hence holding back pd->status
till we service the ack here.

> 
> 
> Regardless, I'm fine with scheduling this for now...
> 
>> +		pdr->status(pdr, pds);
>> +		list_del(&ind->node);
>> +		kfree(ind);
>> +	}
>> +}
>> +
>> +static void pdr_servreg_ind_cb(struct qmi_handle *qmi,
>> +			       struct sockaddr_qrtr *sq,
>> +			       struct qmi_txn *txn, const void *data)
>> +{
>> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
>> +					      servreg_client);
>> +	const struct servreg_state_updated_ind *ind_msg = data;
>> +	struct pdr_list_node *ind;
>> +	struct pdr_service *pds;
>> +
>> +	if (!ind_msg || !ind_msg->service_path ||
>> +	    strlen(ind_msg->service_path) > (SERVREG_NAME_LENGTH + 1))
>> +		return;
>> +
>> +	list_for_each_entry(pds, &pdr->lookups, node) {
>> +		if (!strcmp(pds->service_path, ind_msg->service_path))
>> +			goto found;
>> +	}
>> +	return;
>> +
>> +found:
>> +	pds->state = ind_msg->curr_state;
>> +
>> +	ind = kzalloc(sizeof(*ind), GFP_KERNEL);
>> +	if (!ind)
>> +		return;
>> +
>> +	pr_info("PDR: Indication received from %s, state: 0x%x, trans-id: 
>> %d\n",
>> +		ind_msg->service_path, ind_msg->curr_state,
>> +		ind_msg->transaction_id);
>> +
>> +	ind->transaction_id = ind_msg->transaction_id;
>> +	ind->pds = pds;
>> +
>> +	mutex_lock(&pdr->list_lock);
>> +	list_add_tail(&ind->node, &pdr->indack_list);
>> +	mutex_unlock(&pdr->list_lock);
>> +
>> +	queue_work(pdr->indack_wq, &pdr->indack_work);
>> +}
>> +
>> +static struct qmi_msg_handler qmi_indication_handler[] = {
>> +	{
>> +		.type = QMI_INDICATION,
>> +		.msg_id = SERVREG_STATE_UPDATED_IND_ID,
>> +		.ei = servreg_state_updated_ind_ei,
>> +		.decoded_size = sizeof(struct servreg_state_updated_ind),
>> +		.fn = pdr_servreg_ind_cb,
>> +	},
>> +	{}
>> +};
>> +
>> +static int pdr_get_domain_list(struct servreg_get_domain_list_req 
>> *req,
>> +			       struct servreg_get_domain_list_resp *resp,
>> +			       struct pdr_handle *pdr)
>> +{
>> +	struct qmi_txn txn;
>> +	int ret;
>> +
>> +	ret = qmi_txn_init(&pdr->servloc_client, &txn,
>> +			   servreg_get_domain_list_resp_ei, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = qmi_send_request(&pdr->servloc_client,
>> +			       &pdr->servloc_addr,
>> +			       &txn, SERVREG_GET_DOMAIN_LIST_REQ,
>> +			       SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN,
>> +			       servreg_get_domain_list_req_ei,
>> +			       req);
>> +	if (ret < 0) {
>> +		qmi_txn_cancel(&txn);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_txn_wait(&txn, 5 * HZ);
>> +	if (ret < 0) {
>> +		pr_err("PDR: %s get domain list txn wait failed: %d\n",
>> +		       req->service_name, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Check the response */
>> +	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
>> +		pr_err("PDR: %s get domain list failed: 0x%x\n",
>> +		       req->service_name, resp->resp.error);
>> +		return -EREMOTEIO;
>> +	}
>> +
>> +	return ret;
> 
> ret here will be the number of bytes decoded, but you really only care
> about if this was an error or not. So I would suggest that you just
> return 0 here.

yeah will return 0

> 
>> +}
>> +
>> +static int pdr_locate_service(struct pdr_handle *pdr, struct 
>> pdr_service *pds)
>> +{
>> +	struct servreg_get_domain_list_resp *resp = NULL;
>> +	struct servreg_get_domain_list_req req;
>> +	int db_rev_count = 0, domains_read = 0;
>> +	struct servreg_location_entry *entry;
>> +	int ret, i;
>> +
>> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
>> +	if (!resp)
>> +		return -ENOMEM;
>> +
>> +	/* Prepare req message */
>> +	strcpy(req.service_name, pds->service_name);
>> +	req.domain_offset_valid = true;
>> +	req.domain_offset = 0;
>> +
>> +	do {
>> +		req.domain_offset = domains_read;
>> +		ret = pdr_get_domain_list(&req, resp, pdr);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		if (!domains_read)
>> +			db_rev_count = resp->db_rev_count;
>> +
>> +		if (db_rev_count != resp->db_rev_count) {
>> +			ret = -EAGAIN;
>> +			goto out;
>> +		}
>> +
>> +		for (i = domains_read; i < resp->domain_list_len; i++) {
>> +			entry = &resp->domain_list[i];
>> +
>> +			if (strlen(entry->name) > (SERVREG_NAME_LENGTH + 1))
> 
> In the event that the incoming string isn't NUL-terminated this will 
> run
> off the array.
> 
> if (strnlen(entry->name, SERVREG_NAME_LENGTH + 1) == 
> SERVREG_NAME_LENGTH + 1)
> 
> or perhaps, relying on sizeof instead of duplicating the knowledge that
> it is SERVREG_NAME_LENGTH + 1:
> 
> if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))

yeah I'll use ^^ then or maybe switch
to a strncpy to further simplify things.

> 
>> +				continue;
>> +
>> +			if (!strcmp(entry->name, pds->service_path)) {
>> +				pds->service_data_valid = entry->service_data_valid;
>> +				pds->service_data = entry->service_data;
>> +				pds->instance = entry->instance;
>> +				goto out;
>> +			}
>> +		}
>> +
>> +		/* Update ret to indicate that the service is not yet found */
>> +		ret = -EINVAL;
>> +
>> +		/* Always read total_domains from the response msg */
>> +		if (resp->domain_list_len >  resp->total_domains)
> 
> Double space after '>'

thanks for catching this

> 
>> +			resp->domain_list_len = resp->total_domains;
>> +
>> +		domains_read += resp->domain_list_len;
>> +	} while (domains_read < resp->total_domains);
>> +out:
>> +	kfree(resp);
>> +	return ret;
>> +}
>> +
>> +static void pdr_servloc_work(struct work_struct *work)
>> +{
>> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
>> +					      servloc_work);
>> +	struct pdr_list_node *servloc, *tmp;
>> +	struct pdr_service *pds;
>> +	int ret;
>> +
>> +	list_for_each_entry_safe(servloc, tmp, &pdr->servloc_list, node) {
>> +		pds = servloc->pds;
>> +
>> +		/* wait for PD Mapper to come up */
>> +		ret = wait_for_completion_timeout(&pdr->locator_available, 10 * 
>> HZ);
> 
> Afaict this means that we will only look for the locator during the 10
> seconds that follows a pdr_add_lookup().
> 
> How about changing this so that you bail before the loop if the locator
> hasn't showed up yet and schedule this worker when the locator is
> registered?

yes makes sense, will do that.
But by doing this the client
will have to track timeouts
for lookups.

> 
>> +		if (!ret) {
>> +			pr_err("PDR: SERVICE LOCATOR service wait failed\n");
>> +			ret = -ETIMEDOUT;
>> +			goto err;
>> +		}
>> +
>> +		ret = pdr_locate_service(pdr, pds);
>> +		if (ret < 0) {
>> +			pr_err("PDR: service lookup for %s failed: %d\n",
>> +			       pds->service_name, ret);
>> +			goto err;
>> +		}
>> +
>> +		qmi_add_lookup(&pdr->servreg_client, pds->service, 1,
>> +			       pds->instance);
>> +err:
>> +		list_del(&servloc->node);
>> +		kfree(servloc);
>> +
>> +		/* cleanup pds on error */
>> +		if (ret < 0) {
>> +			pds->state = SERVREG_LOCATOR_ERR;
>> +			pdr->status(pdr, pds);
>> +			list_del(&pds->node);
>> +			kfree(pds);
>> +		}
>> +	}
>> +}
> [..]
>> +int pdr_add_lookup(struct pdr_handle *pdr, const char *service_name,
>> +		   const char *service_path)
>> +{
>> +	struct pdr_service *pds, *pds_iter, *tmp;
>> +	struct pdr_list_node *servloc;
>> +	int ret;
>> +
>> +	if (!service_name || strlen(service_name) > (SERVREG_NAME_LENGTH + 
>> 1) ||
>> +	    !service_path || strlen(service_path) > (SERVREG_NAME_LENGTH + 
>> 1))
> 
> When strlen(x) == SERVREG_NAME_LENGTH + 1 your strcpy below would write
> SERVREG_NAME_LENGTH + 2 bytes to service_name and service_path, so drop
> the + 1 from the comparisons.

yes will do that

> 
>> +		return -EINVAL;
>> +
>> +	servloc = kzalloc(sizeof(*servloc), GFP_KERNEL);
>> +	if (!servloc)
>> +		return -ENOMEM;
>> +
>> +	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
>> +	if (!pds) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	pds->service = SERVREG_NOTIFIER_SERVICE;
>> +	strcpy(pds->service_name, service_name);
>> +	strcpy(pds->service_path, service_path);
> [..]
>> +int pdr_restart_pd(struct pdr_handle *pdr, const char *service_path)
>> +{
>> +	struct servreg_restart_pd_req req;
>> +	struct servreg_restart_pd_resp resp;
>> +	struct pdr_service *pds = NULL, *pds_iter, *tmp;
>> +	struct qmi_txn txn;
>> +	int ret;
>> +
>> +	if (!service_path || strlen(service_path) > (SERVREG_NAME_LENGTH + 
>> 1))
> 
> As above, drop the + 1

ditto

> 
>> +		return -EINVAL;
>> +
> [..]
>> +int pdr_handle_init(struct pdr_handle *pdr,
>> +		    int (*status)(struct pdr_handle *pdr,
>> +				  struct pdr_service *pds))
>> +{
> [..]
>> +	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
>> +	if (!pdr->servreg_wq)
>> +		return -ENOMEM;
>> +
>> +	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq", 
>> WQ_HIGHPRI);
> 
> The two workqueues means that we should be able to call pdr->status()
> rom two concurrent contexts, I don't think our clients will expect 
> that.
> 

would creating another ordered wq to
relay all the pd->status make sense?

>> +	if (!pdr->indack_wq) {
>> +		ret = -ENOMEM;
>> +		goto destroy_servreg;
>> +	}
>> +
> 
> Regards,
> Bjorn
