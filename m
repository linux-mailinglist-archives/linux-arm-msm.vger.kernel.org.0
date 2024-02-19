Return-Path: <linux-arm-msm+bounces-11655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F100085A1A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACFB2283ABA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 11:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAE12AD39;
	Mon, 19 Feb 2024 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IaUvF/vP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43A286AE;
	Mon, 19 Feb 2024 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341066; cv=none; b=q52bmocM19xljMh7uIPGNuPaL7RTtbIJCYz53qRkmOcHm7ocHiP3IKsnPWZDfQaVn92Q46+9yz1L2QWsdaqA9KkQ0MOahBxJwQ1Z31YG335g91K+j4v2rAgMvsAUT8fTMhhO3m400iXFU8GWsMpVCdl03hCDPrkWO9K21WFlKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341066; c=relaxed/simple;
	bh=FzHCTH1/lwAXWNzDn9YmTVvU124kRkSDWB3i57YEXIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u+U6qrJ/HPLSDBiAf+k6koMwpu87Ej9JyK4sbYOS/ERw4casEJ+w0dfyDEXRm1B0WccHKIenhw9pUi6RcKrcPjpuZREto25yT5yTuSnFM956/QmeAuUg3/7L0VVjJXI6ABqEENzaJhhtQhZ9SfW7bdRiyWGbsayQpWzBLUOKAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IaUvF/vP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J4xXNw025538;
	Mon, 19 Feb 2024 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wJk9cnR0mHBU+skKBY4VWZ76aSl9OgmeXFpYlLWfDqY=; b=Ia
	UvF/vPXsNcQlu9uyWBzhLPqxJSqvOq+YNwAEi28iGNQ+mbVMzhrbNyq2LScl0DSG
	bmVYbWncbvJYW1Fz1k7oEhprPWedABtdLrHOhkVYt7m4U4GYjjdRlmktd4QWHxXJ
	lUcW3PLa0QHdGHXAKCpZupXCv9D8gkF6vXwdQDEj2r1aBi6GjUrxT8jnzLs4aH8e
	uZ/Cg2w5x4tNj64bsg7lRuuUdn+52EKVamHy+Uwh8yEIttwc0eRMhfWUbucdLjyL
	qpV9cQzRcbxc8OcRp7JisWKUjxtFjb7KGPMvUAD5Upd/qihDLNn6PWoT9RiGD/NK
	9WSsDLzVS9hCIj/IVO4g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3waqmdue8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 11:10:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41JBApbl020242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 11:10:51 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 19 Feb
 2024 03:10:48 -0800
Message-ID: <a57a0770-b344-57bc-540d-ced7f169687c@quicinc.com>
Date: Mon, 19 Feb 2024 16:40:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: qcom: drop the SC7180 Modem subsystem clock
 driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael
 Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
 <20240216-drop-sc7180-mss-v1-1-0a8dc8d71c0c@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20240216-drop-sc7180-mss-v1-1-0a8dc8d71c0c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AfncOdyr74QhzzH2xJn354J_uH5l-uft
X-Proofpoint-ORIG-GUID: AfncOdyr74QhzzH2xJn354J_uH5l-uft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_08,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402190084



On 2/16/24 16:44, Dmitry Baryshkov wrote:
> This driver has never been used in the DT files merged to the kernel.
> According to Sibi, it only worked on the pre-production devices. For the
> production devices this functionality has been moved to the firmware.
> 
> Drop the driver to remove possible confusion.
> 
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>

> ---
>   drivers/clk/qcom/Kconfig      |  10 ---
>   drivers/clk/qcom/Makefile     |   1 -
>   drivers/clk/qcom/mss-sc7180.c | 140 ------------------------------------------
>   3 files changed, 151 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 4580edbd13ea..8ab08e7b5b6c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -635,16 +635,6 @@ config SC_LPASS_CORECC_7280
>   	  Say Y if you want to use LPASS clocks and power domains of the LPASS
>   	  core clock controller.
>   

[...]

> -MODULE_LICENSE("GPL v2");
> 

