Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A49128BBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2019 22:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLUVkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Dec 2019 16:40:52 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51677 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbfLUVkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Dec 2019 16:40:51 -0500
Received: by mail-pj1-f68.google.com with SMTP id j11so5706071pjs.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2019 13:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LGWQJSvA0/7fk0KUCH2MHc8dab74INZEO7GGMxK4N+8=;
        b=fw5Xpa0EDyZdNnjlwZD90r8OOBDjNz0BAfUXY0QnuLrYCWslhR7MI3yRrpfsWZ+e3m
         duzxaFP/ZVEQrlTIMAkbCx5P2/HU8U8ycPiH98ILk2VveuawujnvQYN86hqILi8kfFbX
         L5FxbuH441aX8+iqiPgl7jEZvVv5DqNsE9KiDazCw/4Vck7pPQypcFk3QaHHL3YbMnZg
         ppVmz+6TBAWggJA2vqH78G6B1UH+3RRI00ne+NC0OhfZPUCq6fOxg9kdawWRFXwNPFUQ
         DEr9qVyYP74mxg+vECAJkwuceyT8ipnH5ZZA3cvTyZ4Ih7zDSptaRH3ngOawDyUIEypP
         zpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LGWQJSvA0/7fk0KUCH2MHc8dab74INZEO7GGMxK4N+8=;
        b=NY0FayBzdxz0R4bQ6S0AtFVEaKYy7DdZrDRxGb9cL82G8Y0N0SawLZadCSM4IoiGB9
         zo4Hz/ZO7MKnKCMsJ82tDogxLx5LUkZ81Azof+VBzZWkjUnxZfkq/5wE3lroiXOI+nzr
         o0svrPNC4khWZlQFMZYc1hM/8EEyGrdvRjHN78k8fDGKOzrI7up5sm4M9L3MtsmB+a05
         GSr+NnwASjmwQgtXwswmrKFbdmWY1B8a7wHWqPYP5VM1HM+7s1e1gMZkgS6FjqBC/k0e
         87Vgc5QQuotlPzE3vOiH9OgCT5ji5xfVSSCFvhYAxQSN5YiYSxfJ6Q9FQd2KrVu51VwV
         A4jg==
X-Gm-Message-State: APjAAAXn3dI2RXa56rSxmd4qZ+7N2kWS2x+JzcV0IOY73S/iKha113KW
        jRvTLmc0SD0GdElsAqRJQ8A8OQ==
X-Google-Smtp-Source: APXvYqyqAat3fFQkyJsIz3uhzkfROsOiAOpiUDaNFTcn1K8WPYg2fFHNCcQSGuyHPy5N6XiozhLyAg==
X-Received: by 2002:a17:90a:b10a:: with SMTP id z10mr25366225pjq.115.1576964450030;
        Sat, 21 Dec 2019 13:40:50 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u18sm16965146pgn.9.2019.12.21.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 13:40:49 -0800 (PST)
Date:   Sat, 21 Dec 2019 13:40:37 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20191221214037.GC1908628@ripper>
References: <20191220172019.11774-1-sibis@codeaurora.org>
 <20191220172019.11774-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220172019.11774-2-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 20 Dec 09:20 PST 2019, Sibi Sankar wrote:

> Qualcomm SoCs (starting with MSM8998) allow for multiple protection domains
> to run on the same Q6 sub-system. This allows for services like ATH10K WLAN
> FW to have their own separate address space and crash/recover without
> disrupting the modem and other PDs running on the same sub-system. The PDR
> helpers introduces an abstraction that allows for tracking/controlling the
> life cycle of protection domains running on various Q6 sub-systems.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig         |   5 +
>  drivers/soc/qcom/Makefile        |   1 +
>  drivers/soc/qcom/pdr_interface.c | 691 +++++++++++++++++++++++++++++++
>  drivers/soc/qcom/pdr_internal.h  | 375 +++++++++++++++++
>  include/linux/soc/qcom/pdr.h     | 105 +++++
>  include/linux/soc/qcom/qmi.h     |   1 +
>  6 files changed, 1178 insertions(+)
>  create mode 100644 drivers/soc/qcom/pdr_interface.c
>  create mode 100644 drivers/soc/qcom/pdr_internal.h
>  create mode 100644 include/linux/soc/qcom/pdr.h
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 79d826553ac82..5c4e76837f59b 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -76,6 +76,11 @@ config QCOM_OCMEM
>            requirements. This is typically used by the GPU, camera/video, and
>            audio components on some Snapdragon SoCs.
>  
> +config QCOM_PDR_HELPERS
> +	tristate
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select QCOM_QMI_HELPERS
> +
>  config QCOM_PM
>  	bool "Qualcomm Power Management"
>  	depends on ARCH_QCOM && !ARM64
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 9fb35c8a495e1..5d6b83dc58e82 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
>  obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
>  obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
>  obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
> +obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
>  obj-$(CONFIG_QCOM_PM)	+=	spm.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>  qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> new file mode 100644
> index 0000000000000..2cfe012edd2f2
> --- /dev/null
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -0,0 +1,691 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/qrtr.h>
> +#include <linux/string.h>
> +#include <linux/workqueue.h>
> +
> +#include "pdr_internal.h"
> +
> +struct pdr_list_node {
> +	u16 transaction_id;
> +	struct pdr_service *pds;
> +	struct list_head node;
> +};
> +
> +static int servreg_locator_new_server(struct qmi_handle *qmi,
> +				      struct qmi_service *svc)
> +{
> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> +					      servloc_client);
> +
> +	/* Create a Local client port for QMI communication */
> +	pdr->servloc_addr.sq_family = AF_QIPCRTR;
> +	pdr->servloc_addr.sq_node = svc->node;
> +	pdr->servloc_addr.sq_port = svc->port;
> +
> +	complete_all(&pdr->locator_available);
> +
> +	/* Restart service locator work to service pending lookup requests */

I think you should drop first half of this sentence, it's captured quite
well by "Service pending lookup requests".

> +	schedule_work(&pdr->servloc_work);
> +
> +	return 0;
> +}
> +
> +static void servreg_locator_del_server(struct qmi_handle *qmi,
> +				       struct qmi_service *svc)
> +{
> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> +					      servloc_client);
> +

Perhaps invalidate pdr->servloc_addr?

> +	reinit_completion(&pdr->locator_available);
> +}
> +
> +static struct qmi_ops service_locator_ops = {
> +	.new_server = servreg_locator_new_server,
> +	.del_server = servreg_locator_del_server,
> +};
> +
> +static int pdr_register_listener(struct pdr_handle *pdr,
> +				 struct pdr_service *pds,
> +				 bool enable)
> +{
> +	struct servreg_register_listener_resp resp;
> +	struct servreg_register_listener_req req;
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	ret = qmi_txn_init(&pdr->servreg_client, &txn,
> +			   servreg_register_listener_resp_ei,
> +			   &resp);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	req.enable = enable;
> +	strcpy(req.service_path, pds->service_path);
> +
> +	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
> +			       &txn, SERVREG_REGISTER_LISTENER_REQ,
> +			       SERVREG_REGISTER_LISTENER_REQ_LEN,
> +			       servreg_register_listener_req_ei,
> +			       &req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, 5 * HZ);

We should fix the helpers so that it's possible to handle this
asynchronously, there's no reason to do these in sequence and risk
having a faulty remote service block all other registrations.

But we can do that in an incremental effort after landing this.

> +	if (ret < 0) {
> +		pr_err("PDR: %s register listener txn wait failed: %d\n",
> +		       pds->service_path, ret);
> +		return ret;
> +	}
> +
> +	/* Check the response */
> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> +		pr_err("PDR: %s register listener failed: 0x%x\n",
> +		       pds->service_path, resp.resp.error);
> +		return ret;
> +	}
> +
> +	if ((int)resp.curr_state < INT_MIN || (int)resp.curr_state > INT_MAX)
> +		pr_err("PDR: %s notification state invalid: 0x%x\n",
> +		       pds->service_path, resp.curr_state);
> +
> +	pds->state = resp.curr_state;
> +
> +	return 0;
> +}
> +
> +static void pdr_servreg_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      servreg_work);
> +	struct pdr_list_node *servreg, *tmp;
> +	struct pdr_service *pds;
> +

You're holding list_lock for insertions into servreg_list, but not
during traversal and removal of entries.

> +	list_for_each_entry_safe(servreg, tmp, &pdr->servreg_list, node) {
> +		pds = servreg->pds;
> +		pdr_register_listener(pdr, pds, true);
> +		mutex_lock(&pdr->status_lock);
> +		pdr->status(pdr, pds);
> +		mutex_unlock(&pdr->status_lock);
> +		list_del(&servreg->node);
> +		kfree(servreg);
> +	}

So you have servloc_list for tracking pds entries that needs to be
looked up when the service locator becomes available and then you have
servreg_list for tracking pds entries where the remote service has shown
up.

As argued below in pdr_add_lookup() I think it would be better to have a
single list of pds entries and keep track of when service_connected is
going high and a SERVREG_REGISTER_LISTENER_REQ needs to be sent out.

> +}
> +
> +static int servreg_notifier_new_server(struct qmi_handle *qmi,
> +				       struct qmi_service *svc)
> +{
> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> +					      servreg_client);
> +	struct pdr_list_node *servreg;
> +	struct pdr_service *pds, *tmp;
> +
> +	/* Create a Local client port for QMI communication */
> +	pdr->servreg_addr.sq_family = AF_QIPCRTR;
> +	pdr->servreg_addr.sq_node = svc->node;
> +	pdr->servreg_addr.sq_port = svc->port;
> +
> +	servreg = kzalloc(sizeof(*servreg), GFP_KERNEL);
> +	if (!servreg)
> +		return -ENOMEM;
> +
> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
> +		if (pds->service == svc->service &&
> +		    pds->instance == svc->instance) {
> +			pds->service_connected = true;
> +			servreg->pds = pds;
> +			mutex_lock(&pdr->list_lock);
> +			list_add_tail(&servreg->node, &pdr->servreg_list);
> +			mutex_unlock(&pdr->list_lock);
> +			break;
> +		}
> +	}
> +
> +	queue_work(pdr->servreg_wq, &pdr->servreg_work);
> +
> +	return 0;
> +}
> +
> +static void pdr_servdel_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      servdel_work);
> +	struct pdr_list_node *servreg, *tmp;
> +	struct pdr_service *pds;
> +
> +	list_for_each_entry_safe(servreg, tmp, &pdr->servdel_list, node) {
> +		pds = servreg->pds;
> +		pds->service_connected = false;
> +		pds->state = SERVREG_SERVICE_STATE_DOWN;
> +		mutex_lock(&pdr->status_lock);
> +		pdr->status(pdr, pds);
> +		mutex_unlock(&pdr->status_lock);
> +		list_del(&servreg->node);
> +		kfree(servreg);
> +	}
> +}
> +
> +static void servreg_notifier_del_server(struct qmi_handle *qmi,
> +					struct qmi_service *svc)
> +{
> +	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> +					      servreg_client);
> +	struct pdr_list_node *servreg;
> +	struct pdr_service *pds, *tmp;
> +
> +	servreg = kzalloc(sizeof(*servreg), GFP_KERNEL);
> +	if (!servreg)
> +		return;
> +
> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
> +		if (pds->service == svc->service &&
> +		    pds->instance == svc->instance) {
> +			servreg->pds = pds;

Again, I believe that updating the state of the notifier and then
schedule a single worker would simplify the driver.

> +			mutex_lock(&pdr->list_lock);
> +			list_add_tail(&servreg->node, &pdr->servdel_list);
> +			mutex_unlock(&pdr->list_lock);
> +			break;
> +		}
> +	}
> +
> +	queue_work(pdr->servreg_wq, &pdr->servdel_work);
> +}
> +
> +static struct qmi_ops service_notifier_ops = {
> +	.new_server = servreg_notifier_new_server,
> +	.del_server = servreg_notifier_del_server,
> +};
> +
> +static int pdr_send_indack_msg(struct pdr_handle *pdr, struct pdr_service *pds,
> +			       u16 tid)
> +{
> +	struct servreg_set_ack_resp resp;
> +	struct servreg_set_ack_req req;
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	ret = qmi_txn_init(&pdr->servreg_client, &txn, servreg_set_ack_resp_ei,
> +			   &resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	req.transaction_id = tid;
> +	strcpy(req.service_path, pds->service_path);
> +
> +	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
> +			       &txn, SERVREG_SET_ACK_REQ,
> +			       SERVREG_SET_ACK_REQ_LEN,
> +			       servreg_set_ack_req_ei,
> +			       &req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, 5 * HZ);
> +	if (ret < 0) {
> +		pr_err("PDR: %s indication ack txn wait failed: %d\n",
> +		       pds->service_path, ret);
> +		return ret;
> +	}
> +
> +	/* Check the response */
> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01)
> +		pr_err("PDR: %s indication ack failed: 0x%x\n",
> +		       pds->service_path, resp.resp.error);

What happens if we don't get a successful result back in a timely manner
here? Should we draw the conclusion that the remote side is dead?

If we're just "ignoring" the reply I think you should skip waiting for
it... I.e. just cancel the txn and return immediately...

> +
> +	return 0;
> +}
> +
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
> +		mutex_lock(&pdr->status_lock);
> +		pdr->status(pdr, pds);
> +		mutex_unlock(&pdr->status_lock);
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
> +	    strlen(ind_msg->service_path) > SERVREG_NAME_LENGTH)
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
> +	return 0;
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
> +			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))
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
> +		if (resp->domain_list_len > resp->total_domains)
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
> +	/* Wait for PD Mapper to come up */
> +	ret = wait_for_completion_timeout(&pdr->locator_available, 5 * HZ);

servloc_work is scheduled either when the service locator is coming up
or when a new client is registered.

In the first case locator_available will be completed right before, so
the only case where this won't just go through is if the service locator
disappears before this function is scheduled. In this case you'll sit
here and wait for 5 seconds, for an add notification, which would
schedule the worker again.

In the other case, where a pdr client is registered before the service
locator is registered, either the service locator is becoming available
before the worker is scheduled, or you'll wait for up to 5 seconds on it
being registered. But it being registered would schedule this function
anyways.

So I think rather than the completion you could check if the service
locator is present and fail immediately otherwise.

> +	if (!ret) {
> +		pr_warn("PDR: SERVICE LOCATOR service wait timed out\n");
> +		return;
> +	}
> +

You're holding list_lock when inserting into servloc_list, but not when
traversing or removing entries from it.

> +	list_for_each_entry_safe(servloc, tmp, &pdr->servloc_list, node) {
> +		pds = servloc->pds;
> +
> +		ret = pdr_locate_service(pdr, pds);
> +		if (ret < 0) {
> +			/* Notify Lookup failed */
> +			mutex_lock(&pdr->status_lock);
> +			pdr->status(pdr, pds);

Is the purpose of this to notify the driver that we have a service
locator, but it does not know about the particular service?

I think you need to distinguish between the "we don't have information
about this service in the json files" and "something went wrong in the
lookup" - in which case you should try to recover/retry.

> +			mutex_unlock(&pdr->status_lock);
> +			pr_err("PDR: service lookup for %s failed: %d\n",
> +			       pds->service_name, ret);
> +			list_del(&pds->node);
> +			kfree(pds);
> +		} else {
> +			qmi_add_lookup(&pdr->servreg_client, pds->service, 1,
> +				       pds->instance);
> +		}
> +
> +		list_del(&servloc->node);
> +		kfree(servloc);
> +	}
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
> +	struct pdr_list_node *servloc;
> +	int ret;
> +
> +	if (!service_name || strlen(service_name) > SERVREG_NAME_LENGTH ||
> +	    !service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
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
> +	servloc->pds = pds;
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
> +		if (!strcmp(pds_iter->service_path, service_path)) {
> +			mutex_unlock(&pdr->list_lock);
> +			ret = -EALREADY;
> +			goto err;
> +		}
> +	}
> +
> +	list_add(&pds->node, &pdr->lookups);
> +	list_add(&servloc->node, &pdr->servloc_list);

Rather than having servloc_list contain the list of entries from the
lookups list that needs to be locked up, how about just keeping some
state flag in the pds; e.g. need-servreg-locator-lookup,
need-qmi-lookup?

I believe this would simplify the reasoning about this driver and would
allow you to express cases such as servreg-location succeeds but
qmi_add_lookup() for some reason failed and needs to be retried.

> +	mutex_unlock(&pdr->list_lock);
> +
> +	schedule_work(&pdr->servloc_work);
> +
> +	return 0;
> +err:
> +	kfree(pds);
> +	kfree(servloc);
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
> +	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
> +		if (!pds_iter->service_connected)
> +			continue;
> +
> +		if (!strcmp(pds_iter->service_path, service_path)) {
> +			pds = pds_iter;
> +			break;
> +		}
> +	}
> +
> +	if (!pds)
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
> +
> +/**
> + * pdr_handle_init() - initialize the PDR client handle
> + * @pdr:	PDR client handle
> + * @status:	function to be called on PD state change
> + *
> + * Initializes the PDR client handle to allow for tracking/restart of PDs.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int pdr_handle_init(struct pdr_handle *pdr,
> +		    void (*status)(struct pdr_handle *pdr,
> +				   struct pdr_service *pds))
> +{
> +	int ret;
> +
> +	if (!status)
> +		return -EINVAL;
> +
> +	pdr->status = *status;
> +
> +	mutex_init(&pdr->list_lock);
> +	mutex_init(&pdr->status_lock);
> +	init_completion(&pdr->locator_available);
> +
> +	INIT_LIST_HEAD(&pdr->lookups);
> +	INIT_LIST_HEAD(&pdr->servloc_list);
> +	INIT_LIST_HEAD(&pdr->servreg_list);
> +	INIT_LIST_HEAD(&pdr->servdel_list);
> +	INIT_LIST_HEAD(&pdr->indack_list);
> +
> +	INIT_WORK(&pdr->servloc_work, pdr_servloc_work);
> +	INIT_WORK(&pdr->servreg_work, pdr_servreg_work);
> +	INIT_WORK(&pdr->servdel_work, pdr_servdel_work);
> +	INIT_WORK(&pdr->indack_work, pdr_indack_work);
> +
> +	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
> +	if (!pdr->servreg_wq)
> +		return -ENOMEM;
> +
> +	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq", WQ_HIGHPRI);
> +	if (!pdr->indack_wq) {
> +		ret = -ENOMEM;
> +		goto destroy_servreg;
> +	}
> +
> +	ret = qmi_handle_init(&pdr->servloc_client,
> +			      SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
> +			      &service_locator_ops, NULL);
> +	if (ret < 0)
> +		goto destroy_indack;
> +
> +	ret = qmi_handle_init(&pdr->servreg_client,
> +			      SERVREG_STATE_UPDATED_IND_MAX_LEN,
> +			      &service_notifier_ops, qmi_indication_handler);
> +	if (ret < 0)
> +		goto release_handle;
> +
> +	qmi_add_lookup(&pdr->servloc_client, SERVREG_LOCATOR_SERVICE, 1, 1);
> +
> +	return 0;
> +
> +release_handle:
> +	qmi_handle_release(&pdr->servloc_client);
> +destroy_indack:
> +	destroy_workqueue(pdr->indack_wq);
> +destroy_servreg:
> +	destroy_workqueue(pdr->servreg_wq);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(pdr_handle_init);
> +
> +/**
> + * pdr_handle_release() - release the PDR client handle
> + * @pdr:	PDR client handle
> + *
> + * Cleans up pending tracking requests and releases the underlying qmi handles.
> + */
> +void pdr_handle_release(struct pdr_handle *pdr)
> +{
> +	struct pdr_service *pds, *tmp;
> +
> +	qmi_handle_release(&pdr->servloc_client);
> +	qmi_handle_release(&pdr->servreg_client);

Aren't the workers operating on the qmi handles until you've cancelled
them below?

> +
> +	cancel_work_sync(&pdr->servloc_work);
> +	cancel_work_sync(&pdr->servreg_work);
> +	cancel_work_sync(&pdr->servdel_work);
> +	cancel_work_sync(&pdr->indack_work);
> +
> +	destroy_workqueue(pdr->servreg_wq);
> +	destroy_workqueue(pdr->indack_wq);
> +
> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
> +		list_del(&pds->node);
> +		kfree(pds);
> +	}

So wouldn't it make sense to drop all pds entries, then cancel all the
work, then release the qmi handles?

> +}

Regards,
Bjorn
