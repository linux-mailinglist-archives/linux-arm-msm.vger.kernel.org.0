Return-Path: <linux-arm-msm+bounces-46995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD5A29F19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 04:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D59B0168128
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 03:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1D68634E;
	Thu,  6 Feb 2025 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nFpn3g7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D641A32;
	Thu,  6 Feb 2025 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810961; cv=none; b=ZSLDi8x81QXYaqQdC42fay8ZZ7LpU5a1cKUnzZdQrdE4KGBAhng1guBDPBU1RHDfmw/LnpXm5MZUl/ILqrdLHa16GCb4CUJj6Dew/ngGx5NojR9HSSNGD+RZnj8gKh0L2Ft0cHY0b5lOMQmm75HQ8Uoa+g5BSwIuomSDY5TR7CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810961; c=relaxed/simple;
	bh=Vpb/Gv/V8K4Fr4ooV9o4E0MsNTbInRLIHALIN9MvC7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CWAWlz3oxn7g04rV4jRSHKhDA5lhaih0nc1GCSib5T3EaiF6GEoN1zXrnwfM37zNzlQuYm4Rpc6UK6cE7NG3JtCei93vbH4yJrsbXzLq1yHgkGTjY/ytYiBDtARg3gzwb6ZjTHUcZxj8KfRJNzUdahtD/1lK2hB4B4uhbIO5kGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nFpn3g7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVZTT025697;
	Thu, 6 Feb 2025 03:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLxbx/nj42e6JMussUsdWLIhc8HBAJuOSMQgaUV5rQw=; b=nFpn3g7Rlp2gEb5T
	BGrfaRZEqChbdwTVe0CeDSDMndPRY0HNBQTGhj8P+mv7k9eqF8OEOd3x3i/29anI
	4XRVj4b2bUbLA9GSDx/8lIVC/TRyScFUTXW1vrqJ1dKzE27DucsI4RRlz4QfcPQG
	cIU93jlkH9g3EGM048bn3D9pKo6o6L2+K+mwwdj9ITz3tXOOpflbf58d32fL9d1y
	dUacoDZaE7XuFwwbN1wEeVto2BtkM10bKuibzuRaa0+IDGE8dEW4cHeRs2g0C+QJ
	Iy0WbzKbUOBPJD1crxT0aBJa04k2V/tiW7TDcBi3dIToa5kUYmRJHzCaGcZacf8x
	NxURcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txhjh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 03:02:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51632E5V011710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 03:02:14 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 19:02:09 -0800
Message-ID: <85bdaa4d-3805-4ae3-917e-7258a131741c@quicinc.com>
Date: Thu, 6 Feb 2025 11:02:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] coresight: Don't save handle in path
To: James Clark <james.clark@linaro.org>
CC: <quic_tingweiz@quicinc.com>, <quic_jinlmao@quicinc.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <suzuki.poulose@arm.com>,
        <mike.leach@linaro.org>, <alexander.shishkin@linux.intel.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
 <20250131163617.1730505-2-james.clark@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250131163617.1730505-2-james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x8euQjM_bQbwdRonxwX2XFsS68pl114M
X-Proofpoint-GUID: x8euQjM_bQbwdRonxwX2XFsS68pl114M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=642 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060022



On 2/1/2025 12:36 AM, James Clark wrote:
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-core.c     | 10 +++++-----
>   drivers/hwtracing/coresight/coresight-dummy.c    |  2 +-
>   drivers/hwtracing/coresight/coresight-etb10.c    |  8 +++-----
>   drivers/hwtracing/coresight/coresight-etm-perf.c |  3 +--
>   drivers/hwtracing/coresight/coresight-priv.h     |  4 ++--
>   drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
>   drivers/hwtracing/coresight/coresight-tmc-etf.c  |  9 ++++-----
>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 13 +++++--------
>   drivers/hwtracing/coresight/coresight-tmc.h      |  2 +-
>   drivers/hwtracing/coresight/coresight-tpiu.c     |  2 +-
>   drivers/hwtracing/coresight/coresight-trbe.c     |  4 +---
>   drivers/hwtracing/coresight/ultrasoc-smb.c       |  8 +++-----
>   include/linux/coresight.h                        |  2 +-
>   13 files changed, 29 insertions(+), 40 deletions(-)
> 

Hi James

I removed the handle from coresight_path and placed these codes in a 
separate patch. However, I believe this change is not related to the 
CTCU driver or coresight_path. Therefore, I suggest we submit it 
independently.

Thanks,
Jie


> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 11d5d5320b1a..253ef02fde12 100644
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
> @@ -448,7 +448,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   	return 0;
>   }
>   
> -int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
> +int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode,
> +			  struct perf_output_handle *handle)
>   {
>   	int ret = 0;
>   	u32 type;
> @@ -479,7 +480,7 @@ int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
>   
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
> -			ret = coresight_enable_sink(csdev, mode, cs_path);
> +			ret = coresight_enable_sink(csdev, mode, handle);
>   			/*
>   			 * Sink is the first component turned on. If we
>   			 * failed to enable the sink, there are no components
> @@ -807,7 +808,6 @@ void coresight_release_path(struct coresight_path *cs_path)
>   		kfree(nd);
>   	}
>   
> -	cs_path->handle = NULL;
>   	kfree(cs_path->path);
>   	kfree(cs_path);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index dfcf24e9c49a..6f86d33efef4 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -54,7 +54,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, enum cs_mode mo
>   }
>   
>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
> -				void *data)
> +				struct perf_output_handle *handle)
>   {
>   	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 05430d8931d1..e373b0f590bf 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -167,14 +167,12 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
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
> -	struct coresight_path *cs_path = (struct coresight_path *)data;
> -	struct perf_output_handle *handle = cs_path->handle;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> @@ -225,7 +223,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data)
> +		      struct perf_output_handle *handle)
>   {
>   	int ret;
>   
> @@ -234,7 +232,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		ret = etb_enable_sysfs(csdev);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = etb_enable_perf(csdev, data);
> +		ret = etb_enable_perf(csdev, handle);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index b6765abb0a26..0fad9968c2c0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -501,9 +501,8 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	if (WARN_ON_ONCE(!sink))
>   		goto fail_end_stop;
>   
> -	cs_path->handle = handle;
>   	/* Nothing will happen without a path */
> -	if (coresight_enable_path(cs_path, CS_MODE_PERF))
> +	if (coresight_enable_path(cs_path, CS_MODE_PERF, handle))
>   		goto fail_end_stop;
>   
>   	/* Finally enable the tracer */
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 8e02a222b9f8..7bd43304f461 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -112,7 +112,6 @@ struct cs_buffers {
>    * @trace_id:		trace_id of the whole path.
>    */
>   struct coresight_path {
> -	struct perf_output_handle	*handle;
>   	struct list_head		*path;
>   	u8				trace_id;
>   };
> @@ -142,7 +141,8 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   }
>   
>   void coresight_disable_path(struct coresight_path *cs_path);
> -int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode);
> +int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode,
> +			  struct perf_output_handle *handle);
>   struct coresight_device *coresight_get_sink(struct list_head *path);
>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>   struct coresight_device *
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index 04e76cc1bfdf..f9a6b838726c 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -209,7 +209,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> -	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS);
> +	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS, NULL);
>   	if (ret)
>   		goto err_path;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index e6b07f917556..fdf1c2511d67 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -244,14 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
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
> -	struct coresight_path *cs_path= (struct coresight_path *)data;
> -	struct perf_output_handle *handle = cs_path->handle;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> @@ -303,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int tmc_enable_etf_sink(struct coresight_device *csdev,
> -			       enum cs_mode mode, void *data)
> +			       enum cs_mode mode, struct perf_output_handle *handle)
>   {
>   	int ret;
>   
> @@ -312,7 +311,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
>   		ret = tmc_enable_etf_sink_sysfs(csdev);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = tmc_enable_etf_sink_perf(csdev, data);
> +		ret = tmc_enable_etf_sink_perf(csdev, handle);
>   		break;
>   	/* We shouldn't be here */
>   	default:
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 82a872882e24..2d0bd06bab2a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1252,10 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   }
>   
>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> -				   enum cs_mode mode, void *data)
> +				   enum cs_mode mode, struct perf_output_handle *handle)
>   {
> -	struct coresight_path *cs_path = (struct coresight_path *)data;
> -	struct perf_output_handle *handle = cs_path->handle;
>   	struct etr_perf_buffer *etr_perf;
>   
>   	switch (mode) {
> @@ -1643,14 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
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
> -	struct coresight_path *cs_path = (struct coresight_path *)data;
> -	struct perf_output_handle *handle = cs_path->handle;
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> @@ -1698,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
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
> index 5005efd88a66..997d5976d2d2 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1009,12 +1009,10 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   }
>   
>   static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
> -			   void *data)
> +			   struct perf_output_handle *handle)
>   {
>   	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> -	struct coresight_path *cs_path = (struct coresight_path *)data;
> -	struct perf_output_handle *handle = cs_path->handle;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index 9be88394b3bb..1574b5067206 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -213,11 +213,9 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
>   	coresight_set_mode(csdev, CS_MODE_SYSFS);
>   }
>   
> -static int smb_enable_perf(struct coresight_device *csdev, void *data)
> +static int smb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
>   {
>   	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct coresight_path *cs_path = (struct coresight_path *)data;
> -	struct perf_output_handle *handle = cs_path->handle;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   	pid_t pid;
>   
> @@ -241,7 +239,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
>   }
>   
>   static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data)
> +		      struct perf_output_handle *handle)
>   {
>   	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	int ret = 0;
> @@ -262,7 +260,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		smb_enable_sysfs(csdev);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = smb_enable_perf(csdev, data);
> +		ret = smb_enable_perf(csdev, handle);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 87f9baa7fefe..a859fc00eef9 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -353,7 +353,7 @@ enum cs_mode {
>    */
>   struct coresight_ops_sink {
>   	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data);
> +		      struct perf_output_handle *handle);
>   	int (*disable)(struct coresight_device *csdev);
>   	void *(*alloc_buffer)(struct coresight_device *csdev,
>   			      struct perf_event *event, void **pages,


