Return-Path: <linux-arm-msm+bounces-20672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E528D1255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 04:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749A72811EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 02:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105BEF4EB;
	Tue, 28 May 2024 02:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HxzAjUBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A8F9D6;
	Tue, 28 May 2024 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716865176; cv=none; b=UwpDrkC8geEUhL6jctbNkftxRGSNdkRsEFHqRPtvVUz3T66ypSkZJKMqp90Bk9o3YWYMp3GMWk2ILdEUr9c7ItTiYYO43hJH2/pfsmxo4cbk+6osLg2d8eBd/PVAVOmwHFrI2lb1U3Iyiw56d5tYhP8Yvx/h7CRXCFICHC5MRoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716865176; c=relaxed/simple;
	bh=UN5FMcN0Nsqb2owiOH8OKEjUPEPF+/qY/7U3tdLVF2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EfFxUHXpwEqyLveSKG5UnN+5mSxynJk2dtpamtA0opLdRDrQ7LmFq5VNVJZ7dP6d4Jr2vVVQXa+Wku49BzKzxMkx494od+yaTp/rUZ+IhosetR+uSyEBGuWFndn2xMNi3CSfVr02qBRnuBjmnS0FdDyl8brMnfE5f6YojNFqLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HxzAjUBV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RNksQa019022;
	Tue, 28 May 2024 02:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLwn/0F2qkiF8dG8n95JFErj+wpYK4ghprtyfDw+yjA=; b=HxzAjUBVeHcqL377
	ZnVED9P6zJPQSx3WuQnve56NyMQ1U0kVpZ5eQYgTzqRAHNkcf80ChyKBLHlr9IMi
	T2oZkdui9N/8J5fEAcxQ4P+uE6Fi/66mD6N2Dj5SnCWOkRT813jGof3CxeLUZm2O
	2/Tow2RMU0WLPnOIiNm1MlhQJdhHJ2LeBklczvVMrGHc6yM2EIzWu+IhTll6ezBn
	4OuCVSb1SM3e7+aiGFgc2EwaPJ23oTC+C2+kE/bwVx2fKOueBjkP1TH1ZKu0S6x/
	mVKv0DX9IgOa0pL/2uNqzptnWf7Ce4d/qlhzKjY3ZGad8mRbH83y9zAUodEHfhES
	Sgv8ig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h5061-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 02:59:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44S2xRcB026680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 02:59:27 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 May
 2024 19:59:23 -0700
Message-ID: <9c8fd579-e521-4091-81cc-bf693c60d712@quicinc.com>
Date: Tue, 28 May 2024 10:59:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] remoteproc: qcom_q6v5_pas: Add support for SA8775p
 ADSP, CDSP and GPDSP
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jassi Brar
	<jassisinghbrar@gmail.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Srini
 Kandagatla <srinivas.kandagatla@linaro.org>,
        Alex Elder <elder@kernel.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-3-8d24e3409daf@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-3-8d24e3409daf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Ec23MkmQ9BVoHjXfvxJkJv5ih3bpRtX
X-Proofpoint-ORIG-GUID: 7Ec23MkmQ9BVoHjXfvxJkJv5ih3bpRtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_06,2024-05-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280021



On 5/27/2024 4:43 PM, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 54d8005d40a3..16053aa99298 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -820,6 +820,23 @@ static const struct adsp_data adsp_resource_init = {
>   	.ssctl_id = 0x14,
>   };
>   
> +static const struct adsp_data sa8775p_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.minidump_id = 5,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"lcx",
> +		"lmx",
> +		NULL
> +	},
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +};
> +
>   static const struct adsp_data sdm845_adsp_resource_init = {
>   	.crash_reason_smem = 423,
>   	.firmware_name = "adsp.mdt",
> @@ -933,6 +950,42 @@ static const struct adsp_data cdsp_resource_init = {
>   	.ssctl_id = 0x17,
>   };
>   
> +static const struct adsp_data sa8775p_cdsp0_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp0.mdt",
> +	.pas_id = 18,
> +	.minidump_id = 7,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		"nsp0",

s/nsp0/nsp/

> +		NULL
> +	},
> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +};
> +
> +static const struct adsp_data sa8775p_cdsp1_resource = {
> +	.crash_reason_smem = 633,
> +	.firmware_name = "cdsp1.mdt",
> +	.pas_id = 30,
> +	.minidump_id = 20,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		"nsp1",

s/nsp1/nsp/

> +		NULL
> +	},
> +	.load_state = "nsp",
> +	.ssr_name = "cdsp1",
> +	.sysmon_name = "cdsp1",
> +	.ssctl_id = 0x20,
> +};
> +
>   static const struct adsp_data sdm845_cdsp_resource_init = {
>   	.crash_reason_smem = 601,
>   	.firmware_name = "cdsp.mdt",
> @@ -1074,6 +1127,40 @@ static const struct adsp_data sm8350_cdsp_resource = {
>   	.ssctl_id = 0x17,
>   };
>   
> +static const struct adsp_data sa8775p_gpdsp0_resource = {
> +	.crash_reason_smem = 640,
> +	.firmware_name = "gpdsp0.mdt",
> +	.pas_id = 39,
> +	.minidump_id = 21,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		NULL
> +	},
> +	.load_state = "gpdsp0",
> +	.ssr_name = "gpdsp0",
> +	.sysmon_name = "gpdsp0",
> +	.ssctl_id = 0x21,
> +};
> +
> +static const struct adsp_data sa8775p_gpdsp1_resource = {
> +	.crash_reason_smem = 641,
> +	.firmware_name = "gpdsp1.mdt",
> +	.pas_id = 40,
> +	.minidump_id = 22,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		NULL
> +	},
> +	.load_state = "gpdsp1",
> +	.ssr_name = "gpdsp1",
> +	.sysmon_name = "gpdsp1",
> +	.ssctl_id = 0x22,
> +};
> +
>   static const struct adsp_data mpss_resource_init = {
>   	.crash_reason_smem = 421,
>   	.firmware_name = "modem.mdt",
> @@ -1315,6 +1402,11 @@ static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>   	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>   	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> +	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
> +	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
> +	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
> +	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
> +	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
>   	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
>   	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
>   	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
> 

-- 
Thx and BRs,
Tengfei Fan

