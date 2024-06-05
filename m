Return-Path: <linux-arm-msm+bounces-21827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054D8FDA0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 00:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5642281CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270C215FA60;
	Wed,  5 Jun 2024 22:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ow8m+FnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9213BC3E;
	Wed,  5 Jun 2024 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627708; cv=none; b=hmufJCBcL0OTPcRui0xk20LW8SDC1L1py/uHDq940a4fzVCDtD8VlMsiKLZPBgnHqC+onhEbG79Wlq0z9JlokA07FiEfL5c3uqCkqCLf8CRwIOSaq4xEELSyTbThCAICzqPTiLb6XIh8egm/BH2Wl2hVTr7yH5x/n8s0BkOsIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627708; c=relaxed/simple;
	bh=SaKkEONMcXz5VuiwJ8gPQQzVNVB04hLirJVwtDBEQQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bV/SmgECsGz1IUo0Jd0oZSTKJhGbSuHPzK4tDPBPw2wyZkJbeE2odRwl8mgmT17hjL2vFY6J8Kfqx1ZYb1Q+k4VfaNOuhUj6KPwy4I4rToMd14NQ2q28Ss3lbp2iCE5bUKf8jiMDSAWzQ6P2dRV0aaMja35ICkgtJ0R7rQawFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ow8m+FnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1UFW031684;
	Wed, 5 Jun 2024 22:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5SNWx6UZouir9JNN7giO4PUeXl6JfqRb+48Qd1gCn4=; b=ow8m+FnDxYRPGzHp
	tRvFBGZ8B1i6M+7zVay1pEmG+z9zuFGt8BkYbFPI5QLEwvOixTvskS7fNrTzlXjw
	9Wj2G3Ne0CIYQftdsEmumugjPKVUNkk0VSjHzEvZaiePlqMif4sRVYEVTWwhTWQx
	2WUSPhl8uarn4obQXkUEAKMge018ZaC4OSrNxcNtC6VPzHVcifLmroNPcuYFrujX
	46iaAwNFGvSAe6TBjV0W8AXxMKmqwjESqPlqvfXhYL1LySdHaUETm+pW8vN3uEPW
	mPHQ+4lUUsAnNZOPcopzNKAQ1SHiUShhRBmFHQBpzk9RsaGqVZUX4P7sV3DbDiT6
	kSbhLw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjh3tt8rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 22:48:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455Mm9DB009493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 22:48:09 GMT
Received: from [10.110.119.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 15:48:08 -0700
Message-ID: <d9a2004a-0a3b-41a6-92a4-eea7b1b3f804@quicinc.com>
Date: Wed, 5 Jun 2024 15:48:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] soc: qcom: pdr: protect locator_addr with the main
 mutex
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        "Alexey
 Minnekhanov" <alexeymin@postmarketos.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
 <20240512-qcom-pd-mapper-v8-1-5ecbb276fcc0@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240512-qcom-pd-mapper-v8-1-5ecbb276fcc0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wqs08OC1n35NM-bPWOi_M7MKTo19eJng
X-Proofpoint-ORIG-GUID: Wqs08OC1n35NM-bPWOi_M7MKTo19eJng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050171

Hi Dmitry,

On 5/11/2024 2:56 PM, Dmitry Baryshkov wrote:
...
> @@ -76,12 +76,12 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
>   					      locator_hdl);
>   	struct pdr_service *pds;
>   
> +	mutex_lock(&pdr->lock);
>   	/* Create a local client port for QMI communication */
>   	pdr->locator_addr.sq_family = AF_QIPCRTR;
>   	pdr->locator_addr.sq_node = svc->node;
>   	pdr->locator_addr.sq_port = svc->port;
>   
> -	mutex_lock(&pdr->lock);
>   	pdr->locator_init_complete = true;
>   	mutex_unlock(&pdr->lock);
>   
> @@ -104,10 +104,10 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
>   
>   	mutex_lock(&pdr->lock);
>   	pdr->locator_init_complete = false;
> -	mutex_unlock(&pdr->lock);
>   
>   	pdr->locator_addr.sq_node = 0;
>   	pdr->locator_addr.sq_port = 0;
> +	mutex_unlock(&pdr->lock);
>   }
>   
>   static const struct qmi_ops pdr_locator_ops = {
> @@ -365,6 +365,7 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
>   	if (ret < 0)
>   		return ret;
>   
> +	mutex_lock(&pdr->lock);
>   	ret = qmi_send_request(&pdr->locator_hdl,
>   			       &pdr->locator_addr,
>   			       &txn, SERVREG_GET_DOMAIN_LIST_REQ,
> @@ -373,15 +374,16 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
>   			       req);
>   	if (ret < 0) {
>   		qmi_txn_cancel(&txn);
> -		return ret;
> +		goto err_unlock;
>   	}
>   
>   	ret = qmi_txn_wait(&txn, 5 * HZ);
>   	if (ret < 0) {
>   		pr_err("PDR: %s get domain list txn wait failed: %d\n",
>   		       req->service_name, ret);
> -		return ret;
> +		goto err_unlock;
>   	}
> +	mutex_unlock(&pdr->lock);

I'm not sure it is necessary to hold the the mutex during the 
qmi_txn_wait() since the only variable we are trying to protect is 
locator_addr.

Wouldn't this delay other work like new/del server notifications if this 
qmi service is delayed or non-responsive?

Thanks,
Chris

>   
>   	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
>   		pr_err("PDR: %s get domain list failed: 0x%x\n",
> @@ -390,6 +392,11 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
>   	}
>   
>   	return 0;
> +
> +err_unlock:
> +	mutex_unlock(&pdr->lock);
> +
> +	return ret;
>   }
>   

