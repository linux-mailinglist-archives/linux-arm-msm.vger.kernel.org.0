Return-Path: <linux-arm-msm+bounces-14063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E2187B5AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A7051F22592
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EE58F5B;
	Thu, 14 Mar 2024 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X33rL/TB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBE8F55;
	Thu, 14 Mar 2024 00:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374604; cv=none; b=JS+AbMwdCG1WgDxDsdJOSN8enrIg6QoETnEwmxpBnGXjc50QUANog/JDg6RwSeDOwbZ3hoU2WcM/NPwujSbkof6QRcKY2FjgZl19+du3wc1Py02W6M3RPZ4Ki7+cC/LP3zDn3ionNxVe45u2no6qQTk28QWkNgoQDrZLR2stY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374604; c=relaxed/simple;
	bh=/G2Jhes5u7tVMOOVN3zuQSpf6UA1M3TBZbekVkGJxgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZyvtZUOJSFhKLIW9xKO1IeBuJ3LM8NlBBiOxF2uHsdcXmIG/X+8dtM4rTGI0nPbMOEFo75wSZ7rCy+BTbP8QIvEABziIsINNeaPImGmaxBrpfUr3CRsM0hbvSBO5WCGth+/VM2MsTGirOVyBGVDMGIanaGyXer+zAvX4btRZxTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X33rL/TB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DNXpeZ024078;
	Thu, 14 Mar 2024 00:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JFderygkt3ks9IlL6vKhQjD/18XjzK34SiqlfyvluJI=; b=X3
	3rL/TBAvHxTzPRCziDhWMwiy06Wop8XUeKsuDPXTZShxJGj3YwtL83iEP/giBJAB
	DlSvywW+YIBUJX5xfS79EWNrUbiCdYwTwJRfwgWVkoZQViSzVkOXctW+4KTYoTGi
	63i4OZrk2ZyTO/IgwYXoV5yvBFmvc5YPU2yd1HpCTf6xHgurc4F7AIK53QAmgPqO
	yS6bGVyKdNDq663stQ+l/FzrBs0HmhXc8PWljyWhMgRd3fLtaY5uFyUY26WWk8uZ
	gF0E4aHnRC4UVNCqR/3wNa6R2Jnpln00sD3WcAklWKv7GAdAN7EU3qsCgDYYmUmX
	OfOeIBVgae1xJxy/V3qQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wugq18td9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 00:03:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42E03HsR028403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 00:03:17 GMT
Received: from [192.168.142.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 17:03:16 -0700
Message-ID: <9785a6e6-3700-0b89-b4b5-7981ed5bdd38@quicinc.com>
Date: Wed, 13 Mar 2024 17:03:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running
 service
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
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uWBDKNAjpVjE16DBm5EgxqiCLRbH2ZMO
X-Proofpoint-GUID: uWBDKNAjpVjE16DBm5EgxqiCLRbH2ZMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_11,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=718 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130182



On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> +/**
> + * qmi_del_server() - register a service with the name service

s/register/deregister/g

> + * @qmi:	qmi handle
> + * @service:	type of the service
> + * @instance:	instance of the service
> + * @version:	version of the service
> + *
> + * Remove registration of the service with the name service. This notifies
> + * clients that they should no longer send messages to the client associated
> + * with @qmi.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
> +		   unsigned int version, unsigned int instance)
> +{
> +	struct qmi_service *svc;
> +	struct qmi_service *tmp;
> +
> +	list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
> +		if (svc->service != service ||
> +		    svc->version != version ||
> +		    svc->instance != instance)
> +			continue;
> +
> +		qmi_send_del_server(qmi, svc);
> +		list_del(&svc->list_node);
> +		kfree(svc);
> +
> +		return 0;
> +	}
> +

is list_for_each_entry_safe required if we stop iterating and return
after we find the first instance of the service?

> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(qmi_del_server);

