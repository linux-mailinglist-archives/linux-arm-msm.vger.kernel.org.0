Return-Path: <linux-arm-msm+bounces-14202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13487C6DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 01:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2EA1F22154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 00:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCAAD518;
	Fri, 15 Mar 2024 00:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c4D42RWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28DAD502;
	Fri, 15 Mar 2024 00:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710464273; cv=none; b=rFmHFnLc4uzr/4fnfJ5fhZseJ1Do8vxVEMeGtt7JDs+gm2m1O5GLgwX4LoOzrqmBRuyXhX12bgOSPTr1D7meuHWkBJju/A2fG7UmrTYGndKCBUQz5ENPCbkWW96fuFBQUrhM1fhvZoN+KyP+oxljyDIFrV/8ET90fL6ikR3UZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710464273; c=relaxed/simple;
	bh=j13QLgYOb0kS6R4/5VVu1Oe7voHpWamm9OhFQVr8rYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BUU4SsKA6WXoZCscPJpfwKAIayHsp6dAfdfMr+KiNLhmGdeLDmlaorQdkW+tUtUjcqm/LSJx+KK4Cpm8EqOi9HundUOOtjZ3buBhdHoN2GvEAZyvSSMVYYeAXGjHqaDmEy6MqTUhUXgdq5ciRe9E3A8YF3tiQSCx6Xby6NOjFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c4D42RWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F0ttIU013083;
	Fri, 15 Mar 2024 00:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5d1KXGqIP2/Z3YcymowfRnlD39KGKaYWq2ZynjnQd/c=; b=c4
	D42RWCg+Ol7I9EPApkYXYBZrMeIVLYsEDMRNb6x+XP0lXTSl8xZtxbjgptZ+7WhJ
	huv0JI5qYSX4J/xq75cgU0jtqbgudRs43wy8cDN2cpw0zSJlrzfd6DDhqgtd2AST
	jD7HE6QKUeaG4Gb1V0dMsyGSBN6XfxYvMBkYDQz/KsvHFPD/jwc+0CQuhjFiNmj1
	El1cN9VKJR0+rSdoExVG6iI1rXUHbUhMDuHC8fmBPQGh4axSfA+LnY7PWptWyFQ5
	3fWXq6gG5yVzLc6M/ht2JfXEtAsxw3fvw2wW5S8MhVC0Em4R/pwx/YRLqywZfRo/
	c9SkK1Agq2HHAFIAyWww==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wva0eg78f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 00:57:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42F0vdDK025745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 00:57:39 GMT
Received: from [192.168.142.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 17:57:39 -0700
Message-ID: <f4e2c00e-b669-9827-a480-5670ef9711c0@quicinc.com>
Date: Thu, 14 Mar 2024 17:57:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
 <714bb2ca-40ac-80a2-454f-021da3caa93d@quicinc.com>
 <CAA8EJpokFA=s5uhrb-OxH=BigfAP7jZ_K5z1FXJ0p1h3h3_CLQ@mail.gmail.com>
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <CAA8EJpokFA=s5uhrb-OxH=BigfAP7jZ_K5z1FXJ0p1h3h3_CLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0O-ACVdpDIGBArFSKUVHPQYtnS7kncoo
X-Proofpoint-GUID: 0O-ACVdpDIGBArFSKUVHPQYtnS7kncoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150004



On 3/14/2024 2:30 PM, Dmitry Baryshkov wrote:
> On Thu, 14 Mar 2024 at 21:44, Chris Lew <quic_clew@quicinc.com> wrote:
>>
>>
>>
>> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
>>> +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
>>> +{
>>> +     int ret;
>>> +     int i;
>>> +
>>> +     mutex_lock(&qcom_pdm_mutex);
>>> +
>>> +     if (qcom_pdm_server_added) {
>>> +             ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
>>> +                                  SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>>> +             if (ret)
>>> +                     goto err_out;
>>> +     }
>>> +
>>> +     for (i = 0; i < num_data; i++) {
>>> +             ret = qcom_pdm_add_domain_locked(data[i]);
>>> +             if (ret)
>>> +                     goto err;
>>> +     }
>>> +
>>> +     ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
>>> +                          SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>>> +     if (ret) {
>>> +             pr_err("PDM: error adding server %d\n", ret);
>>> +             goto err;
>>> +     }
>>> +
>>> +     qcom_pdm_server_added = true;
>>> +
>>> +     mutex_unlock(&qcom_pdm_mutex);
>>> +
>>> +     return 0;
>>> +
>>> +err:
>>> +     while (--i >= 0)
>>> +             qcom_pdm_del_domain_locked(data[i]);
>>> +
>>> +     qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
>>> +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>>> +
>>> +err_out:
>>> +     mutex_unlock(&qcom_pdm_mutex);
>>> +
>>> +     return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_pdm_add_domains);
>>> +
>>> +void qcom_pdm_del_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
>>> +{
>>> +     int i;
>>> +
>>> +     mutex_lock(&qcom_pdm_mutex);
>>> +
>>> +     if (qcom_pdm_server_added) {
>>> +             qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
>>> +                            SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>>> +     }
>>
>> I am confused as to why we need to reset the qmi handle anytime
>> qcom_pdm_del_domains or qcom_pdm_add_domains is called. Is this to
>> trigger some kind of re-broadcast type notification to clients because
>> the service list has been updated?
> 
> Yes. Otherwise clients like pmic-glink will miss new domains.
> 
>>
>> My concern would be that this causes some kind of unintended side-effect
>> on the rprocs that are not restarting.
> 
> Well, an alternative is to match machine compatible strings and to
> build a full list of domains right from the beginning.
> 

Ok, thanks for clarifying. I spoke to some of the firmware developers
and a quick scan seems to indicate their handling is robust enough to
handle this. It is a change in expected behavior but I think the current
approach is reasonable.

>>
>>> +
>>> +     for (i = 0; i < num_data; i++)
>>> +             qcom_pdm_del_domain_locked(data[i]);
>>> +
>>> +     qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
>>> +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>>> +     qcom_pdm_server_added = true;
>>> +
>>> +     mutex_unlock(&qcom_pdm_mutex);
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_pdm_del_domains);
>>> +
>>> +static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
>>> +                                  struct sockaddr_qrtr *sq,
>>> +                                  struct qmi_txn *txn,
>>> +                                  const void *decoded)
>>> +{
>>> +     const struct servreg_loc_get_domain_list_req *req = decoded;
>>> +     struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
>>> +     struct qcom_pdm_service *service;
>>> +     u32 offset;
>>> +     int ret;
>>> +
>>> +     offset = req->offset_valid ? req->offset : 0;
>>> +
>>> +     rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
>>> +     rsp->rsp.error = QMI_ERR_NONE_V01;
>>> +
>>> +     rsp->db_revision_valid = true;
>>> +     rsp->db_revision = 1;
>>> +
>>> +     rsp->total_domains_valid = true;
>>> +     rsp->total_domains = 0;
>>> +
>>> +     mutex_lock(&qcom_pdm_mutex);
>>> +
>>> +     service = qcom_pdm_find_locked(req->name);
>>> +     if (service) {
>>> +             struct qcom_pdm_domain *domain;
>>> +
>>> +             rsp->domain_list_valid = true;
>>> +             rsp->domain_list_len = 0;
>>> +
>>> +             list_for_each_entry(domain, &service->domains, list) {
>>> +                     u32 i = rsp->total_domains++;
>>> +
>>> +                     if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
>>> +                             u32 j = rsp->domain_list_len++;
>>> +
>>> +                             strscpy(rsp->domain_list[j].name, domain->name,
>>> +                                     sizeof(rsp->domain_list[i].name));
>>> +                             rsp->domain_list[j].instance_id = domain->instance_id;
>>> +
>>> +                             pr_debug("PDM: found %s / %d\n", domain->name,
>>> +                                      domain->instance_id);
>>> +                     }
>>> +             }
>>> +
>>> +     }
>>> +
>>> +     mutex_unlock(&qcom_pdm_mutex);
>>> +
>>> +     pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->name,
>>> +              req->offset_valid ? req->offset : -1, rsp->domain_list_len, rsp->total_domains);
>>> +
>>> +     ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
>>> +                             2658,
>>> +                             servreg_loc_get_domain_list_resp_ei, rsp);
>>
>> Other QMI clients like pdr_interface have macros for the message size.
>> Can we considering adding one instead of using 2658 directly?
> 
> 
> Ack
> 
>>
>>> +     if (ret)
>>> +             pr_err("Error sending servreg response: %d\n", ret);
>>> +
>>> +     kfree(rsp);
>>> +}
>>> +
>>> +static void qcom_pdm_pfr(struct qmi_handle *qmi,
>>> +                      struct sockaddr_qrtr *sq,
>>> +                      struct qmi_txn *txn,
>>> +                      const void *decoded)
>>> +{
>>> +     const struct servreg_loc_pfr_req *req = decoded;
>>> +     struct servreg_loc_pfr_resp rsp = {};
>>> +     int ret;
>>> +
>>> +     pr_warn_ratelimited("PDM: service '%s' crash: '%s'\n", req->service, req->reason);
>>> +
>>> +     rsp.rsp.result = QMI_RESULT_SUCCESS_V01;
>>> +     rsp.rsp.error = QMI_ERR_NONE_V01;
>>> +
>>> +     ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_PFR,
>>> +                             SERVREG_LOC_PFR_RESP_MSG_SIZE,
>>> +                             servreg_loc_pfr_resp_ei, &rsp);
>>> +     if (ret)
>>> +             pr_err("Error sending servreg response: %d\n", ret);
>>> +}
>>> +
>>> diff --git a/drivers/soc/qcom/qcom_pdm_msg.h b/drivers/soc/qcom/qcom_pdm_msg.h
>>> new file mode 100644
>>> index 000000000000..e576b87c67c0
>>> --- /dev/null
>>> +++ b/drivers/soc/qcom/qcom_pdm_msg.h
>>> @@ -0,0 +1,66 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2018, Linaro Ltd.
>>> + * Copyright (c) 2016, Bjorn Andersson
>>> + */
>>> +
>>> +#ifndef __QMI_SERVREG_LOC_H__
>>> +#define __QMI_SERVREG_LOC_H__
>>> +
>>
>> Should we update the header guards to reflect the new file name?
> 
> Ack
> 
>>
>>> +#include <linux/types.h>
>>> +#include <linux/soc/qcom/qmi.h>
>>> +
>>> +#define SERVREG_QMI_SERVICE 64
>>> +#define SERVREG_QMI_VERSION 257
>>> +#define SERVREG_QMI_INSTANCE 0
>>> +#define QMI_RESULT_SUCCESS 0
>>> +#define QMI_RESULT_FAILURE 1
>>> +#define QMI_ERR_NONE 0
>>> +#define QMI_ERR_INTERNAL 1
>>> +#define QMI_ERR_MALFORMED_MSG 2
>>
>> I think these common QMI macro definitions are wrong. They should match
>> what is defined in <soc/qcom/qmi.h>. This is a bug in the userspace
>> pd-mapper header as well.
> 
> Ack
> 
>>
>>> +#endif
>>> diff --git a/include/linux/soc/qcom/pd_mapper.h b/include/linux/soc/qcom/pd_mapper.h
>>> new file mode 100644
>>> index 000000000000..86438b7ca6fe
>>> --- /dev/null
>>> +++ b/include/linux/soc/qcom/pd_mapper.h
>>> @@ -0,0 +1,39 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Qualcomm Protection Domain mapper
>>> + *
>>> + * Copyright (c) 2023 Linaro Ltd.
>>> + */
>>> +#ifndef __QCOM_PD_MAPPER__
>>> +#define __QCOM_PD_MAPPER__
>>> +
>>> +struct qcom_pdm_domain_data {
>>> +     const char *domain;
>>> +     u32 instance_id;
>>> +     /* NULL-terminated array */
>>> +     const char * services[];
>>
>> s/char * services[]/char *services[]/
> 
> 
> 

