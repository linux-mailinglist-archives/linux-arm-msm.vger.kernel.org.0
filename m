Return-Path: <linux-arm-msm+bounces-14181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767F87C3D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 20:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E53BD1F22D7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 19:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0FB757F5;
	Thu, 14 Mar 2024 19:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i8Rw/x1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DBC1A38C6;
	Thu, 14 Mar 2024 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710445486; cv=none; b=WT/yjV+2GjpItHDPD9rgpLnCf2lGAsi/fy0dAu6rk9UbMp0hrKn09yD5kMeElvzkEFVaSvn/UqQkE+0MQKrfCI0ob5qxWrjvB9+MXEHGdUiKzydpPOISq910yw9fqL002/0FjVG/w64IQ2+dqQoff0Hx7EKDiUfXiJ9/ooftDxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710445486; c=relaxed/simple;
	bh=2VAFFvE8hC51NJbCKu5HHS9Y7CIO/4MUkYGNq6PZkCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hv0uFTgqJ3j5cbL5KbJju5PxCG4lmOH4rc+e2hm9ikj3P4srPUqjuKVuKPTiusTHxUEYr3l+RrGlM285IMyOAtY/mpC2cDFy7cBEdoX199iA/W4mMZLFq0BQKbj1WjW5RxOriyVCdYVBNKwUu42RW5vGNtj4iE9PkemUSIVc0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i8Rw/x1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42EEk30P012432;
	Thu, 14 Mar 2024 19:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iL933Rm0BkJfGjEMAYFzZvTqtHIowO4xPeKVSq4JyDM=; b=i8
	Rw/x1JuzIfzEf1SjVGejvBxv+spdeDzCUwLpN5YFV2UnII0wMyQRdZvHYgKwh+ET
	idlMlnRqdKr37GXvAb7adpPnJBDzcodHLnKDOR+9vhrHWnwpS+NfhEGt/XYP1pdw
	Q7OOa2RPfm7/lF7alW3Cn9VUF/2Fz8CScNoecQdvWoaMSLoLpqaQQ5NaTQFVKvlz
	638iQVshF0oqnF6NmaMENT/H0mbiTx85ReqQXHhZERvLuO7uGAfmClCEMf7xzFZA
	hQEP4dkxXAwNz5/QBnBNYkSEB2xTXGxW8IT4mCCdZgISI90Ds8A7KEFluhiczmMz
	yPI300v53YwoYcEY6Mlw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv0kjs20k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 19:44:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EJicVM017793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 19:44:38 GMT
Received: from [192.168.142.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 12:44:38 -0700
Message-ID: <714bb2ca-40ac-80a2-454f-021da3caa93d@quicinc.com>
Date: Thu, 14 Mar 2024 12:44:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HV-EZiQzJG9FvpTg3lfjZy4JAGsjsyZH
X-Proofpoint-ORIG-GUID: HV-EZiQzJG9FvpTg3lfjZy4JAGsjsyZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403140152



On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> +{
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&qcom_pdm_mutex);
> +
> +	if (qcom_pdm_server_added) {
> +		ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +				     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +		if (ret)
> +			goto err_out;
> +	}
> +
> +	for (i = 0; i < num_data; i++) {
> +		ret = qcom_pdm_add_domain_locked(data[i]);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +	if (ret) {
> +		pr_err("PDM: error adding server %d\n", ret);
> +		goto err;
> +	}
> +
> +	qcom_pdm_server_added = true;
> +
> +	mutex_unlock(&qcom_pdm_mutex);
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0)
> +		qcom_pdm_del_domain_locked(data[i]);
> +
> +	qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +		       SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +
> +err_out:
> +	mutex_unlock(&qcom_pdm_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pdm_add_domains);
> +
> +void qcom_pdm_del_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> +{
> +	int i;
> +
> +	mutex_lock(&qcom_pdm_mutex);
> +
> +	if (qcom_pdm_server_added) {
> +		qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +			       SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +	}

I am confused as to why we need to reset the qmi handle anytime
qcom_pdm_del_domains or qcom_pdm_add_domains is called. Is this to
trigger some kind of re-broadcast type notification to clients because
the service list has been updated?

My concern would be that this causes some kind of unintended side-effect
on the rprocs that are not restarting.

> +
> +	for (i = 0; i < num_data; i++)
> +		qcom_pdm_del_domain_locked(data[i]);
> +
> +	qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +		       SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +	qcom_pdm_server_added = true;
> +
> +	mutex_unlock(&qcom_pdm_mutex);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pdm_del_domains);
> +
> +static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
> +				     struct sockaddr_qrtr *sq,
> +				     struct qmi_txn *txn,
> +				     const void *decoded)
> +{
> +	const struct servreg_loc_get_domain_list_req *req = decoded;
> +	struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
> +	struct qcom_pdm_service *service;
> +	u32 offset;
> +	int ret;
> +
> +	offset = req->offset_valid ? req->offset : 0;
> +
> +	rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
> +	rsp->rsp.error = QMI_ERR_NONE_V01;
> +
> +	rsp->db_revision_valid = true;
> +	rsp->db_revision = 1;
> +
> +	rsp->total_domains_valid = true;
> +	rsp->total_domains = 0;
> +
> +	mutex_lock(&qcom_pdm_mutex);
> +
> +	service = qcom_pdm_find_locked(req->name);
> +	if (service) {
> +		struct qcom_pdm_domain *domain;
> +
> +		rsp->domain_list_valid = true;
> +		rsp->domain_list_len = 0;
> +
> +		list_for_each_entry(domain, &service->domains, list) {
> +			u32 i = rsp->total_domains++;
> +
> +			if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
> +				u32 j = rsp->domain_list_len++;
> +
> +				strscpy(rsp->domain_list[j].name, domain->name,
> +					sizeof(rsp->domain_list[i].name));
> +				rsp->domain_list[j].instance_id = domain->instance_id;
> +
> +				pr_debug("PDM: found %s / %d\n", domain->name,
> +					 domain->instance_id);
> +			}
> +		}
> +
> +	}
> +
> +	mutex_unlock(&qcom_pdm_mutex);
> +
> +	pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->name,
> +		 req->offset_valid ? req->offset : -1, rsp->domain_list_len, rsp->total_domains);
> +
> +	ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
> +				2658,
> +				servreg_loc_get_domain_list_resp_ei, rsp);

Other QMI clients like pdr_interface have macros for the message size.
Can we considering adding one instead of using 2658 directly?

> +	if (ret)
> +		pr_err("Error sending servreg response: %d\n", ret);
> +
> +	kfree(rsp);
> +}
> +
> +static void qcom_pdm_pfr(struct qmi_handle *qmi,
> +			 struct sockaddr_qrtr *sq,
> +			 struct qmi_txn *txn,
> +			 const void *decoded)
> +{
> +	const struct servreg_loc_pfr_req *req = decoded;
> +	struct servreg_loc_pfr_resp rsp = {};
> +	int ret;
> +
> +	pr_warn_ratelimited("PDM: service '%s' crash: '%s'\n", req->service, req->reason);
> +
> +	rsp.rsp.result = QMI_RESULT_SUCCESS_V01;
> +	rsp.rsp.error = QMI_ERR_NONE_V01;
> +
> +	ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_PFR,
> +				SERVREG_LOC_PFR_RESP_MSG_SIZE,
> +				servreg_loc_pfr_resp_ei, &rsp);
> +	if (ret)
> +		pr_err("Error sending servreg response: %d\n", ret);
> +}
> +
> diff --git a/drivers/soc/qcom/qcom_pdm_msg.h b/drivers/soc/qcom/qcom_pdm_msg.h
> new file mode 100644
> index 000000000000..e576b87c67c0
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_pdm_msg.h
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2018, Linaro Ltd.
> + * Copyright (c) 2016, Bjorn Andersson
> + */
> +
> +#ifndef __QMI_SERVREG_LOC_H__
> +#define __QMI_SERVREG_LOC_H__
> +

Should we update the header guards to reflect the new file name?

> +#include <linux/types.h>
> +#include <linux/soc/qcom/qmi.h>
> +
> +#define SERVREG_QMI_SERVICE 64
> +#define SERVREG_QMI_VERSION 257
> +#define SERVREG_QMI_INSTANCE 0
> +#define QMI_RESULT_SUCCESS 0
> +#define QMI_RESULT_FAILURE 1
> +#define QMI_ERR_NONE 0
> +#define QMI_ERR_INTERNAL 1
> +#define QMI_ERR_MALFORMED_MSG 2

I think these common QMI macro definitions are wrong. They should match
what is defined in <soc/qcom/qmi.h>. This is a bug in the userspace
pd-mapper header as well.

> +#endif
> diff --git a/include/linux/soc/qcom/pd_mapper.h b/include/linux/soc/qcom/pd_mapper.h
> new file mode 100644
> index 000000000000..86438b7ca6fe
> --- /dev/null
> +++ b/include/linux/soc/qcom/pd_mapper.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Qualcomm Protection Domain mapper
> + *
> + * Copyright (c) 2023 Linaro Ltd.
> + */
> +#ifndef __QCOM_PD_MAPPER__
> +#define __QCOM_PD_MAPPER__
> +
> +struct qcom_pdm_domain_data {
> +	const char *domain;
> +	u32 instance_id;
> +	/* NULL-terminated array */
> +	const char * services[];

s/char * services[]/char *services[]/

