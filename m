Return-Path: <linux-arm-msm+bounces-14048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4187B53B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 823691F21DD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 23:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1AA59167;
	Wed, 13 Mar 2024 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DPb1TgVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306401A38DB;
	Wed, 13 Mar 2024 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710372931; cv=none; b=cQQBD0UDE7OgcgqrxuP912mZxvi2W52xomRH+Nu0U+Q+PLLOuHoI8ve8STbUAmga4FfF25tEXiUbFxJEMQZ2MUvYBetIeSpC2MxZcQjE1WMyG4g4RBts0RnlgJIW79RAYyEe1m5tuUZ+hqXSXpkoOswpYtfQNed4sWylkN4iHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710372931; c=relaxed/simple;
	bh=Z4wsRgTcB9Tuyme7jkJ30TZVZRuJCDanKTwrnQSHR48=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SETVbDv6jsKBOuf/cFHS3YHlRJhaXOruJkQh7VdBCup8CaEM3CGVAxxOhoycktGNc1uUpRo6QDYF56nOdJb9OpP4XZeqb1wZSo9Pi+Xa+GPWvhOo4gNc13UK11WRQi2oEzb8JbI6oZLIvDD1PMWw/PkQptW/cI6uwdiFvCbNpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DPb1TgVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DKNlnb019914;
	Wed, 13 Mar 2024 23:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SRA0+FCsBgitWMlVubXqcPii+ndab4G+gfadeHVyUEE=; b=DP
	b1TgVZVdEH9gN7/rMfyWlj91WES1dI1jOFMxLSock0idXgp0n9HvXt0rc1SkNH9C
	s6aTeC/sgT3NDRhjKNtEZ9xOnJA1Z6fHIIljcCQLynAamGVqkaZzrFFagehLtXn1
	nt7pO7p/eF29k9OpSXBRl0jqDdj5YCIIWecU7O7AjR6Zqnj1dlLmwEth/kX1uZSA
	EEm6B58DvUiAUOGyVaqizhfico+IkIrg+RiQC71OtdbKhPgGKpUSWTrCXWt7r4nR
	CPdVcmxDr4Chnlvl+taJ+9O96VOLIazKO5NGNsQk8vK2wdJyXg4AXz+5H/xVhh8u
	BdmeisGvmhCvG9YeC0sQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuggr0t8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 23:35:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DNZP0s022893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 23:35:25 GMT
Received: from [192.168.142.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 16:35:25 -0700
Message-ID: <0fd377a8-281d-634f-014b-509fd8dada98@quicinc.com>
Date: Wed, 13 Mar 2024 16:35:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] soc: qcom: pdr: protect locator_addr with the main
 mutex
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
 <20240311-qcom-pd-mapper-v4-1-24679cca5c24@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240311-qcom-pd-mapper-v4-1-24679cca5c24@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 730UKbsTu0jT9oKMJnw9p9xitRtdUfli
X-Proofpoint-ORIG-GUID: 730UKbsTu0jT9oKMJnw9p9xitRtdUfli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_10,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=691 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130179



On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> @@ -133,11 +133,13 @@ static int pdr_register_listener(struct pdr_handle *pdr,
>  	req.enable = enable;
>  	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
>  
> +	mutex_lock(&pdr->lock);
>  	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
>  			       &txn, SERVREG_REGISTER_LISTENER_REQ,
>  			       SERVREG_REGISTER_LISTENER_REQ_LEN,
>  			       servreg_register_listener_req_ei,
>  			       &req);
> +	mutex_unlock(&pdr->lock);
>  	if (ret < 0) {
>  		qmi_txn_cancel(&txn);
>  		return ret;
> 

Hi Dmitry,

What is the reason for taking the pdr lock here? The addr struct passed
into qmi_send_request is from the pdr_service. I think this is different
from the pdr_handle we are protecting in the other parts of the patch.

Thanks,
Chris

