Return-Path: <linux-arm-msm+bounces-24057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA1915B3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 02:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73E61F227C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 00:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036273C482;
	Tue, 25 Jun 2024 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i6FhGy1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E533B7A8;
	Tue, 25 Jun 2024 00:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719276766; cv=none; b=q9EGVaYeWt7J7zBQdRTsR7s54qUiWVehQSDdqDSE8hcp6ftcUlbnAkcNsZWLyO7yJTlb7KQE3aN+GKJJMvLFGV0H7v3ejNTGmZn9AYOjrcKuAjtyO5W3erHkJ3nNHuo3hONPfNPsffzFuhvZDpYvBatmalrvlQuzjDaELzt54f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719276766; c=relaxed/simple;
	bh=So/F8y4HqDbzH8FjFEYDBRG0qxp7bBgvTlG4bt4waM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rvb5Pul65+FyX5VN1HzubLQD/0o+Q6yx8NMUqoDQuuTlmf+kX92xkCTIP5joMLW3zHUnXSp+ctjCSvZY2Qz5aLzuBpeEkEUaibBiQg+cw9kT8+Krf4OMer37JI7RNVuqZdcs9/kLATyGNBmyjiqkhCvUaEgKoNjaQ8MOJzGDg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i6FhGy1F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OK1G8d014014;
	Tue, 25 Jun 2024 00:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04HLdGB3gU2fUKwtvgGY38yKf3y7Y0bAlY+VaLngquU=; b=i6FhGy1FSqOuMgeg
	/MFUfQ3YRWEqE100/UuKpp7nna6QP3zq6Q7AimKzSvS/upF/Frwh5Ydr2LzfKjKA
	QmznfexsjAZjURdql49MPA/ZKEAk/dtl07TYLV4ydKEjcBLM65Iv2wJ5VENmaRHo
	wmRbB1GWevOzc3z89WMECIhL9Af2Fqm/G8yNL2305oBumC6YE9Om+hR6wUE5ULw9
	jsIHaWRvRBhIOt68ZZE9xuOWzL0FUDPvxRhGBzDincckzSW/8MvLsKo4Z0uR0uvL
	5JUL9iomQ1xS6ZDNoH+mYn8Q6QPwSv1oXo5uZJxSJx6C1uQrXBD4gMFHCV88Fr+E
	vG61Zw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnxgw07f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 00:52:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P0qadO028669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 00:52:36 GMT
Received: from [10.71.112.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 17:52:35 -0700
Message-ID: <80a475ab-827d-4c9f-a82f-64fc1fcaf6dc@quicinc.com>
Date: Mon, 24 Jun 2024 17:52:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] soc: qcom: pdr: protect locator_addr with the main
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
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
 <20240622-qcom-pd-mapper-v9-1-a84ee3591c8e@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240622-qcom-pd-mapper-v9-1-a84ee3591c8e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oAPi9LXyEJp1DIT4q6U5qsz6Whasfloe
X-Proofpoint-ORIG-GUID: oAPi9LXyEJp1DIT4q6U5qsz6Whasfloe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_21,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=996 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250005



On 6/21/2024 3:03 PM, Dmitry Baryshkov wrote:
> If the service locator server is restarted fast enough, the PDR can
> rewrite locator_addr fields concurrently. Protect them by placing
> modification of those fields under the main pdr->lock.
> 
> Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

