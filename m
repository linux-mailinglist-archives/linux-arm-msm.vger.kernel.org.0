Return-Path: <linux-arm-msm+bounces-19964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7848C814E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 09:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B3E61C20FA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 07:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECA2168CC;
	Fri, 17 May 2024 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ur45jLTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E491A17552;
	Fri, 17 May 2024 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715930499; cv=none; b=JECgMJMXomj3m9aexBFt5YKUekYSN94Xv4YxNQoSc+NRYQmVr7SrUJQq936k6BeA/9LN+7H41Me0eDpkHwGA8Z4aN8H0GJcAghrGk4bHtIVXDGo93T49vWKkeq/Y5xGUTP+4ABaB2sZSP+NEx2664M+q80lnh2N93wzn9CPK+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715930499; c=relaxed/simple;
	bh=fFe9A+03pnKocm377PKFv9FBQBGD+nfpn00TMsnyDR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WRFMKzO8epS3JSTzntT3ryr9Ck8rLlXGajP7W4CyLKkxzAV0M/gHOZqNEe6fp7S9moCJvTx7V8T1WpC/4GB+7dJiM3Ix4IT1W0sVX3Kx33XJd++2MkJSxh5RenWFt/M3NeAybfMZYEQ1pW+3Fn/jX7FlClfp3SynyLoZWATeUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ur45jLTc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKMsIt008130;
	Fri, 17 May 2024 07:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=V13+1xk8KEU7CNK8QkeG0dJeVpQfsz+902pDd7kRldQ=; b=Ur
	45jLTcA8wi2c98jS/1YCUfhD4N7fuAAyAXzCbJHeQ2aXe0UfSWe7KGX9lea9pC+I
	6UlrYj8+qtoYfH7IzCYNJ7fJbO4VXAfWvkR1qH+VVs6hBEmTv+auRnmKPcvwlv5p
	7N7SPU4gjNJ+zB6TAAOciiRy+nZVzQfCPuu5t2o0qorTVqbMBNuJ4aKyD5vYJp5c
	832HI8pw06oDTvsUbLPGHD0s2uhbLJBhZzwcFoAq402plYGMpj2hMTAQspHXFTpJ
	wi1Il/xA0iG0MoZa1U2FmLzexIDkKPA4KU7xvpwYUo7PQr/XO03FaAvoi56NO/Ut
	NHdkF2z9734tSqfJEdrw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbfsts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 07:21:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44H7LIVB018736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 07:21:18 GMT
Received: from [10.216.53.65] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 00:21:11 -0700
Message-ID: <1238fa39-f0da-fb4c-0668-caa946505373@quicinc.com>
Date: Fri, 17 May 2024 12:51:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
Content-Language: en-US
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q7iFiLrN1qh9344l0MaOtp_Y2B9i4K0w
X-Proofpoint-ORIG-GUID: Q7iFiLrN1qh9344l0MaOtp_Y2B9i4K0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170056



On 5/17/2024 4:28 AM, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When remoteproc goes down unexpectedly this results in a state where any
> acquired hwspinlocks will remain locked possibly resulting in deadlock.
> In order to ensure all locks are freed we include a call to
> hwspin_lock_bust() during remoteproc shutdown.
> 
> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
> is used to take the hwspinlock. Remoteproc should use this id to try and
> bust the lock on remoteproc stop.
> 
> This edge case only occurs with q6v5_pas watchdog crashes. The error
> fatal case has handling to clear the hwspinlock before the error fatal
> interrupt is triggered.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 54d8005d40a3..57178fcb9aa3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -10,6 +10,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/firmware.h>
> +#include <linux/hwspinlock.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> @@ -52,6 +53,7 @@ struct adsp_data {
>   	const char *ssr_name;
>   	const char *sysmon_name;
>   	int ssctl_id;
> +	int hwlock_id;
>   
>   	int region_assign_idx;
>   	int region_assign_count;
> @@ -84,6 +86,9 @@ struct qcom_adsp {
>   	bool decrypt_shutdown;
>   	const char *info_name;
>   
> +	struct hwspinlock *hwlock;
> +	int hwlock_id;
> +
>   	const struct firmware *firmware;
>   	const struct firmware *dtb_firmware;
>   
> @@ -399,6 +404,12 @@ static int adsp_stop(struct rproc *rproc)
>   	if (handover)
>   		qcom_pas_handover(&adsp->q6v5);
>   
> +	if (adsp->hwlock) {
> +		ret = hwspin_lock_bust(adsp->hwlock, adsp->hwlock_id);
> +		if (ret)
> +			dev_info(adsp->dev, "failed to bust hwspinlock\n");
> +	}
> +

As you said above, you seem to cover only wdog case and fatal cases
are already handled at remote;

You are clearing here for both ? is this right understanding ?

-Mukesh

