Return-Path: <linux-arm-msm+bounces-50757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1BA58A37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 03:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4F47A41A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 02:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46569A935;
	Mon, 10 Mar 2025 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U2pmVY9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A73AC1C;
	Mon, 10 Mar 2025 02:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741572491; cv=none; b=blHGBezK7OfSJZe4znVqkxbJaQt3ZVEdMG3oSGdKw5JEZYBwPLg6EMM+wBGuJxv9LrdsLRbB0cNhR7PdCKhswBluu5RXAlYQlvatKvLwNDOpqEMPArILSjNb8McXmD5+WxzvpmiO9GQXCbfmVZwKKNwv62U0ktFyYD6DVG7RNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741572491; c=relaxed/simple;
	bh=/tGWmOXbivb5zNvuTFTclGFaXPhT6zfGMpATD/sag6g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=uvcEzDUmwAwkIiLThEaNILZw+D8ZADX3tYyhk4OxJ373XW8a1gnUqd4vw/KHTyzGKJtSOruJ7T8Rbm8r/uwIYiCAnSZ6xLRe/SGDBjN+TDFNsbpJlvOuWWR7CTWNttXoCojlnWbWFNGbpweFcSL5aNLfjq0YhEmTIQbY0J3nfkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U2pmVY9j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529NTD0D029281;
	Mon, 10 Mar 2025 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErvMhDaeytDw3IwmawvixvMw91TjhNNARaeILM5HZbA=; b=U2pmVY9j9p2rAA7n
	x5Jno9GKAcRBHFWez5hHbnqkJMwV2nDKHl9kKIrWv+mbN/JnssO7k9DWeWYQ/SgH
	78sl+wA9cxnuvRdv4BREi25S8Ii/sBRw4vRc9bH0D/TPkEFgNugtN7g9F4tgyhaX
	bP0s85sljkeQqYuw09NvB+KRVXIsRyUqrpcT6nCDglyqlWlUF9eshh25IyyDZ87v
	4knAI6AczwYpWYCVAPyq0CHvV9247BSNhkkCiDYhMYHv9XnetUGZkqQo7hjH3+/L
	2gDanDjPFZwJWLbYvFO0Q8oW+yrE8xp9TNU1CX+t2A0ZLo+vJ0SJJFe0GuStt/lT
	Lzqj0A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6ab61m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:07:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A27vXo006762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:07:57 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Mar 2025
 19:07:54 -0700
Message-ID: <549b3e5e-5ee1-426f-b256-f3efc1dc4908@quicinc.com>
Date: Mon, 10 Mar 2025 10:07:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Coresight: Improve the method for passing through perf
 handle
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: "Tingwei Zhang (QUIC)" <quic_tingweiz@quicinc.com>,
        "Jinlong Mao (QUIC)"
	<quic_jinlmao@quicinc.com>,
        "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
References: <20250211062021.7013-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250211062021.7013-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67ce497e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=02J8pJ6TqhWp_VxCNtEA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HC_efWkp-fAxPKKfkF0xoehIirzKw_nw
X-Proofpoint-ORIG-GUID: HC_efWkp-fAxPKKfkF0xoehIirzKw_nw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=783 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100015



On 2/11/2025 2:20 PM, Jie Gan wrote:
> From: James Clark <james.clark@linaro.org>
> 
> Currently, the perf handle is being passed to the sink device as a void
> parameter with additional type conversion. Improve the method for
> passing perf handle parameter to make the code more readable.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> prerequisite-message-id: <20250207064213.2314482-5-quic_jiegan@quicinc.com>

Gentle ping. The dependency has applied.

Thanks,
Jie

> ---
>   drivers/hwtracing/coresight/coresight-core.c    |  8 ++++----
>   drivers/hwtracing/coresight/coresight-dummy.c   |  2 +-
>   drivers/hwtracing/coresight/coresight-etb10.c   |  7 +++----
>   drivers/hwtracing/coresight/coresight-priv.h    |  2 +-
>   drivers/hwtracing/coresight/coresight-tmc-etf.c |  8 ++++----
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 11 +++++------
>   drivers/hwtracing/coresight/coresight-tmc.h     |  2 +-
>   drivers/hwtracing/coresight/coresight-tpiu.c    |  2 +-
>   drivers/hwtracing/coresight/coresight-trbe.c    |  3 +--
>   drivers/hwtracing/coresight/ultrasoc-smb.c      |  7 +++----
>   include/linux/coresight.h                       |  2 +-
>   11 files changed, 25 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3bdd6ebd4b6e..9246b46bdc3b 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -272,9 +272,9 @@ void coresight_add_helper(struct coresight_device *csdev,
>   EXPORT_SYMBOL_GPL(coresight_add_helper);
>   
>   static int coresight_enable_sink(struct coresight_device *csdev,
> -				 enum cs_mode mode, void *data)
> +				 enum cs_mode mode, struct perf_output_handle *handle)
>   {
> -	return sink_ops(csdev)->enable(csdev, mode, data);
> +	return sink_ops(csdev)->enable(csdev, mode, handle);
>   }
>   
>   static void coresight_disable_sink(struct coresight_device *csdev)
> @@ -448,7 +448,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   }
>   
>   int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> -			  void *sink_data)
> +			  struct perf_output_handle *handle)
>   {
>   	int ret = 0;
>   	u32 type;
> @@ -478,7 +478,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
> -			ret = coresight_enable_sink(csdev, mode, sink_data);
> +			ret = coresight_enable_sink(csdev, mode, handle);
>   			/*
>   			 * Sink is the first component turned on. If we
>   			 * failed to enable the sink, there are no components
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index d9a811d44885..42de46949d73 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -51,7 +51,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused
>   }
>   
>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
> -				void *data)
> +				struct perf_output_handle *handle)
>   {
>   	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index aea9ac9c4bd0..e373b0f590bf 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -167,13 +167,12 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
>   	return ret;
>   }
>   
> -static int etb_enable_perf(struct coresight_device *csdev, void *data)
> +static int etb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
>   {
>   	int ret = 0;
>   	pid_t pid;
>   	unsigned long flags;
>   	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> @@ -224,7 +223,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data)
> +		      struct perf_output_handle *handle)
>   {
>   	int ret;
>   
> @@ -233,7 +232,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		ret = etb_enable_sysfs(csdev);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = etb_enable_perf(csdev, data);
> +		ret = etb_enable_perf(csdev, handle);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index c10dd3643854..eca06a89843f 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -134,7 +134,7 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   
>   void coresight_disable_path(struct coresight_path *path);
>   int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> -			  void *sink_data);
> +			  struct perf_output_handle *handle);
>   struct coresight_device *coresight_get_sink(struct coresight_path *path);
>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>   struct coresight_device *
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d4f641cd9de6..fdf1c2511d67 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -244,13 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
>   	return ret;
>   }
>   
> -static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
> +static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
> +				    struct perf_output_handle *handle)
>   {
>   	int ret = 0;
>   	pid_t pid;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> @@ -302,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int tmc_enable_etf_sink(struct coresight_device *csdev,
> -			       enum cs_mode mode, void *data)
> +			       enum cs_mode mode, struct perf_output_handle *handle)
>   {
>   	int ret;
>   
> @@ -311,7 +311,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
>   		ret = tmc_enable_etf_sink_sysfs(csdev);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = tmc_enable_etf_sink_perf(csdev, data);
> +		ret = tmc_enable_etf_sink_perf(csdev, handle);
>   		break;
>   	/* We shouldn't be here */
>   	default:
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f..2d0bd06bab2a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1252,9 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   }
>   
>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> -				   enum cs_mode mode, void *data)
> +				   enum cs_mode mode, struct perf_output_handle *handle)
>   {
> -	struct perf_output_handle *handle = data;
>   	struct etr_perf_buffer *etr_perf;
>   
>   	switch (mode) {
> @@ -1642,13 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
>   	return size;
>   }
>   
> -static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
> +static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
> +				    struct perf_output_handle *handle)
>   {
>   	int rc = 0;
>   	pid_t pid;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> @@ -1696,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
> -			       enum cs_mode mode, void *data)
> +			       enum cs_mode mode, struct perf_output_handle *handle)
>   {
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
>   		return tmc_enable_etr_sink_sysfs(csdev);
>   	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		return tmc_enable_etr_sink_perf(csdev, handle);
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 2671926be62a..e991afd43742 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -336,7 +336,7 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>   void tmc_etr_remove_catu_ops(void);
>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> -				   enum cs_mode mode, void *data);
> +				   enum cs_mode mode, struct perf_output_handle *handle);
>   extern const struct attribute_group coresight_etr_group;
>   
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 97ef36f03ec2..ccf463ac7bf5 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
>   }
>   
>   static int tpiu_enable(struct coresight_device *csdev, enum cs_mode mode,
> -		       void *__unused)
> +		       struct perf_output_handle *__unused)
>   {
>   	struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index fff67aac8418..a0914d10ed47 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1011,11 +1011,10 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   }
>   
>   static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
> -			   void *data)
> +			   struct perf_output_handle *handle)
>   {
>   	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> -	struct perf_output_handle *handle = data;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index dc3c9504dd7c..1574b5067206 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -213,10 +213,9 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
>   	coresight_set_mode(csdev, CS_MODE_SYSFS);
>   }
>   
> -static int smb_enable_perf(struct coresight_device *csdev, void *data)
> +static int smb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
>   {
>   	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   	pid_t pid;
>   
> @@ -240,7 +239,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data)
> +		      struct perf_output_handle *handle)
>   {
>   	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	int ret = 0;
> @@ -261,7 +260,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		smb_enable_sysfs(csdev);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = smb_enable_perf(csdev, data);
> +		ret = smb_enable_perf(csdev, handle);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 55bb825d509e..937a8d4f815b 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -363,7 +363,7 @@ enum cs_mode {
>    */
>   struct coresight_ops_sink {
>   	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data);
> +		      struct perf_output_handle *handle);
>   	int (*disable)(struct coresight_device *csdev);
>   	void *(*alloc_buffer)(struct coresight_device *csdev,
>   			      struct perf_event *event, void **pages,


