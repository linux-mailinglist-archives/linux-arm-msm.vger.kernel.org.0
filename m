Return-Path: <linux-arm-msm+bounces-23480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9DA91169D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 01:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB985283DAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 23:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1427314B973;
	Thu, 20 Jun 2024 23:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="otw82Qsi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE27143737;
	Thu, 20 Jun 2024 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925269; cv=none; b=NDKqeWCo5xRRmgtbTbUG3HuQ0SoA6/It23EOQe+hLr7j25jrxtWBop7UmzLdyfGbyGhCwx/0EVuyE6iJVlI9wI6UwFSHTbj10WZuaRi9Is3HAo2z/LPlRmuOthZWS34ost0tZhoBGerYR8APq0DFcjHPcfsO+BlC9bjOQCbQKzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925269; c=relaxed/simple;
	bh=pzBM1PHZr3Xs4jhT3Ktpq0fQhnaD/O8Ugj8BENPMuJw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLYqnERbyZw2yWRzCIrYx6fekmWSLA437v+vlMAczFdI2kHTjgS3P7eJVw46NNNdylhvhqFJi73l9xwzAMWS5e+7LCEV/kwSPIEpL7jdvGi2K+mC87esFk6vGI4mTq6+D7yUje0/sS9/cGJifJXsVm/tTe/91qg/ncUjawanmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=otw82Qsi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHB3Sc017545;
	Thu, 20 Jun 2024 23:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dxbEgIhDjf8fDdjSBajyTjLw
	lfvGFGxBGxWEomoN/40=; b=otw82QsibGRf/i0TayCI5smMpD5gWtWtR+g75ZNJ
	0BnSMPtOOShxuD0S/y0AsAbrtxndFpJWJlLQ8V6DMUQU11NeGwg2j/S1kWTmaLyG
	3It6X29i6SdbRC5cJ1BCSQSX47lF5BiORY4UUvz3+TsQF+b9D1OnRFJF0N3kLi6W
	QZngUYgUm69Hsj9h5//rcEbXkUGO4oyf8eE7cVhSbrJ6iWAsjof1ejr1NV8KllPo
	Dj+K41f3x+yhFvyeoi/vNW5jEdl1Z5kpiikdFq2KLQV4xu2xg/IWNliQFU5C/b5K
	R8ZSTif1j6QVBjPvgqfBQxSZ8jq9QruywIqmJtXneR4g7Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkr8vwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 23:14:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KNEA9s023500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 23:14:11 GMT
Received: from hu-eberman-lv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 16:14:07 -0700
Date: Thu, 20 Jun 2024 16:14:07 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Robert
 Marko" <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Maximilian Luz
	<luzmaximilian@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Alex Elder <elder@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v10 09/15] firmware: qcom: qseecom: convert to using the
 TZ allocator
Message-ID: <20240620160736589-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
 <20240527-shm-bridge-v10-9-ce7afaa58d3a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527-shm-bridge-v10-9-ce7afaa58d3a@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7vrxahxGfSur6y70SqnGC9m0a79_S_xx
X-Proofpoint-GUID: 7vrxahxGfSur6y70SqnGC9m0a79_S_xx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_10,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406200169

On Mon, May 27, 2024 at 02:54:59PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Drop the DMA mapping operations from qcom_scm_qseecom_app_send() and
> convert all users of it in the qseecom module to using the TZ allocator
> for creating SCM call buffers. As this is largely a module separate from
> the SCM driver, let's use a separate memory pool. Set the initial size to
> 4K and - if we run out - add twice the current amount to the pool.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

From the perspective of "does the conversion look good",

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

I don't have enough expertise in qseecom to say if anything else needed,
though.

Thanks,
Elliot

> ---
>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 256 +++++++++---------------
>  drivers/firmware/qcom/qcom_scm.c                |  17 +-
>  include/linux/firmware/qcom/qcom_qseecom.h      |   8 +-
>  include/linux/firmware/qcom/qcom_scm.h          |   8 +-
>  4 files changed, 117 insertions(+), 172 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> index bc550ad0dbe0..6fefa4fe80e8 100644
> --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> @@ -13,11 +13,14 @@
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/ucs2_string.h>
>  
>  #include <linux/firmware/qcom/qcom_qseecom.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_tzmem.h>
>  
>  /* -- Qualcomm "uefisecapp" interface definitions. -------------------------- */
>  
> @@ -272,6 +275,7 @@ struct qsee_rsp_uefi_query_variable_info {
>  struct qcuefi_client {
>  	struct qseecom_client *client;
>  	struct efivars efivars;
> +	struct qcom_tzmem_pool *mempool;
>  };
>  
>  static struct device *qcuefi_dev(struct qcuefi_client *qcuefi)
> @@ -293,12 +297,11 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
>  {
>  	struct qsee_req_uefi_get_variable *req_data;
>  	struct qsee_rsp_uefi_get_variable *rsp_data;
> +	void *cmd_buf __free(qcom_tzmem) = NULL;
>  	unsigned long buffer_size = *data_size;
> -	efi_status_t efi_status = EFI_SUCCESS;
>  	unsigned long name_length;
> -	dma_addr_t cmd_buf_dma;
> +	efi_status_t efi_status;
>  	size_t cmd_buf_size;
> -	void *cmd_buf;
>  	size_t guid_offs;
>  	size_t name_offs;
>  	size_t req_size;
> @@ -333,11 +336,9 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
>  		__reqdata_offs(rsp_size, &rsp_offs)
>  	);
>  
> -	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
> -	if (!cmd_buf) {
> -		efi_status = EFI_OUT_OF_RESOURCES;
> -		goto out;
> -	}
> +	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
> +	if (!cmd_buf)
> +		return EFI_OUT_OF_RESOURCES;
>  
>  	req_data = cmd_buf + req_offs;
>  	rsp_data = cmd_buf + rsp_offs;
> @@ -351,30 +352,22 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
>  	req_data->length = req_size;
>  
>  	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name, name_length);
> -	if (status < 0) {
> -		efi_status = EFI_INVALID_PARAMETER;
> -		goto out_free;
> -	}
> +	if (status < 0)
> +		return EFI_INVALID_PARAMETER;
>  
>  	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
>  
>  	status = qcom_qseecom_app_send(qcuefi->client,
> -				       cmd_buf_dma + req_offs, req_size,
> -				       cmd_buf_dma + rsp_offs, rsp_size);
> -	if (status) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +				       cmd_buf + req_offs, req_size,
> +				       cmd_buf + rsp_offs, rsp_size);
> +	if (status)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_VARIABLE) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_VARIABLE)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->length < sizeof(*rsp_data)) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->length < sizeof(*rsp_data))
> +		return EFI_DEVICE_ERROR;
>  
>  	if (rsp_data->status) {
>  		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
> @@ -388,18 +381,14 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
>  				*attributes = rsp_data->attributes;
>  		}
>  
> -		goto out_free;
> +		return qsee_uefi_status_to_efi(rsp_data->status);
>  	}
>  
> -	if (rsp_data->length > rsp_size) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->length > rsp_size)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->data_offset + rsp_data->data_size > rsp_data->length) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->data_offset + rsp_data->data_size > rsp_data->length)
> +		return EFI_DEVICE_ERROR;
>  
>  	/*
>  	 * Note: We need to set attributes and data size even if the buffer is
> @@ -422,22 +411,15 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
>  	if (attributes)
>  		*attributes = rsp_data->attributes;
>  
> -	if (buffer_size == 0 && !data) {
> -		efi_status = EFI_SUCCESS;
> -		goto out_free;
> -	}
> +	if (buffer_size == 0 && !data)
> +		return EFI_SUCCESS;
>  
> -	if (buffer_size < rsp_data->data_size) {
> -		efi_status = EFI_BUFFER_TOO_SMALL;
> -		goto out_free;
> -	}
> +	if (buffer_size < rsp_data->data_size)
> +		return EFI_BUFFER_TOO_SMALL;
>  
>  	memcpy(data, ((void *)rsp_data) + rsp_data->data_offset, rsp_data->data_size);
>  
> -out_free:
> -	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
> -out:
> -	return efi_status;
> +	return EFI_SUCCESS;
>  }
>  
>  static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const efi_char16_t *name,
> @@ -446,11 +428,9 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
>  {
>  	struct qsee_req_uefi_set_variable *req_data;
>  	struct qsee_rsp_uefi_set_variable *rsp_data;
> -	efi_status_t efi_status = EFI_SUCCESS;
> +	void *cmd_buf __free(qcom_tzmem) = NULL;
>  	unsigned long name_length;
> -	dma_addr_t cmd_buf_dma;
>  	size_t cmd_buf_size;
> -	void *cmd_buf;
>  	size_t name_offs;
>  	size_t guid_offs;
>  	size_t data_offs;
> @@ -486,11 +466,9 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
>  		__reqdata_offs(sizeof(*rsp_data), &rsp_offs)
>  	);
>  
> -	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
> -	if (!cmd_buf) {
> -		efi_status = EFI_OUT_OF_RESOURCES;
> -		goto out;
> -	}
> +	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
> +	if (!cmd_buf)
> +		return EFI_OUT_OF_RESOURCES;
>  
>  	req_data = cmd_buf + req_offs;
>  	rsp_data = cmd_buf + rsp_offs;
> @@ -506,10 +484,8 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
>  	req_data->length = req_size;
>  
>  	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name, name_length);
> -	if (status < 0) {
> -		efi_status = EFI_INVALID_PARAMETER;
> -		goto out_free;
> -	}
> +	if (status < 0)
> +		return EFI_INVALID_PARAMETER;
>  
>  	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
>  
> @@ -517,33 +493,24 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
>  		memcpy(((void *)req_data) + req_data->data_offset, data, req_data->data_size);
>  
>  	status = qcom_qseecom_app_send(qcuefi->client,
> -				       cmd_buf_dma + req_offs, req_size,
> -				       cmd_buf_dma + rsp_offs, sizeof(*rsp_data));
> -	if (status) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +				       cmd_buf + req_offs, req_size,
> +				       cmd_buf + rsp_offs, sizeof(*rsp_data));
> +	if (status)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->command_id != QSEE_CMD_UEFI_SET_VARIABLE) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->command_id != QSEE_CMD_UEFI_SET_VARIABLE)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->length != sizeof(*rsp_data)) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->length != sizeof(*rsp_data))
> +		return EFI_DEVICE_ERROR;
>  
>  	if (rsp_data->status) {
>  		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
>  			__func__, rsp_data->status);
> -		efi_status = qsee_uefi_status_to_efi(rsp_data->status);
> +		return qsee_uefi_status_to_efi(rsp_data->status);
>  	}
>  
> -out_free:
> -	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
> -out:
> -	return efi_status;
> +	return EFI_SUCCESS;
>  }
>  
>  static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
> @@ -552,10 +519,9 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
>  {
>  	struct qsee_req_uefi_get_next_variable *req_data;
>  	struct qsee_rsp_uefi_get_next_variable *rsp_data;
> -	efi_status_t efi_status = EFI_SUCCESS;
> -	dma_addr_t cmd_buf_dma;
> +	void *cmd_buf __free(qcom_tzmem) = NULL;
> +	efi_status_t efi_status;
>  	size_t cmd_buf_size;
> -	void *cmd_buf;
>  	size_t guid_offs;
>  	size_t name_offs;
>  	size_t req_size;
> @@ -587,11 +553,9 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
>  		__reqdata_offs(rsp_size, &rsp_offs)
>  	);
>  
> -	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
> -	if (!cmd_buf) {
> -		efi_status = EFI_OUT_OF_RESOURCES;
> -		goto out;
> -	}
> +	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
> +	if (!cmd_buf)
> +		return EFI_OUT_OF_RESOURCES;
>  
>  	req_data = cmd_buf + req_offs;
>  	rsp_data = cmd_buf + rsp_offs;
> @@ -606,28 +570,20 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
>  	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
>  	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name,
>  			      *name_size / sizeof(*name));
> -	if (status < 0) {
> -		efi_status = EFI_INVALID_PARAMETER;
> -		goto out_free;
> -	}
> +	if (status < 0)
> +		return EFI_INVALID_PARAMETER;
>  
>  	status = qcom_qseecom_app_send(qcuefi->client,
> -				       cmd_buf_dma + req_offs, req_size,
> -				       cmd_buf_dma + rsp_offs, rsp_size);
> -	if (status) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +				       cmd_buf + req_offs, req_size,
> +				       cmd_buf + rsp_offs, rsp_size);
> +	if (status)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_NEXT_VARIABLE) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_NEXT_VARIABLE)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->length < sizeof(*rsp_data)) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->length < sizeof(*rsp_data))
> +		return EFI_DEVICE_ERROR;
>  
>  	if (rsp_data->status) {
>  		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
> @@ -642,53 +598,40 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
>  		if (efi_status == EFI_BUFFER_TOO_SMALL)
>  			*name_size = rsp_data->name_size;
>  
> -		goto out_free;
> +		return efi_status;
>  	}
>  
> -	if (rsp_data->length > rsp_size) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->length > rsp_size)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->name_offset + rsp_data->name_size > rsp_data->length) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->name_offset + rsp_data->name_size > rsp_data->length)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->guid_offset + rsp_data->guid_size > rsp_data->length) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->guid_offset + rsp_data->guid_size > rsp_data->length)
> +		return EFI_DEVICE_ERROR;
>  
>  	if (rsp_data->name_size > *name_size) {
>  		*name_size = rsp_data->name_size;
> -		efi_status = EFI_BUFFER_TOO_SMALL;
> -		goto out_free;
> +		return EFI_BUFFER_TOO_SMALL;
>  	}
>  
> -	if (rsp_data->guid_size != sizeof(*guid)) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->guid_size != sizeof(*guid))
> +		return EFI_DEVICE_ERROR;
>  
>  	memcpy(guid, ((void *)rsp_data) + rsp_data->guid_offset, rsp_data->guid_size);
>  	status = ucs2_strscpy(name, ((void *)rsp_data) + rsp_data->name_offset,
>  			      rsp_data->name_size / sizeof(*name));
>  	*name_size = rsp_data->name_size;
>  
> -	if (status < 0) {
> +	if (status < 0)
>  		/*
>  		 * Return EFI_DEVICE_ERROR here because the buffer size should
>  		 * have already been validated above, causing this function to
>  		 * bail with EFI_BUFFER_TOO_SMALL.
>  		 */
> -		efi_status = EFI_DEVICE_ERROR;
> -	}
> +		return EFI_DEVICE_ERROR;
>  
> -out_free:
> -	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
> -out:
> -	return efi_status;
> +	return EFI_SUCCESS;
>  }
>  
>  static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi, u32 attr,
> @@ -697,10 +640,8 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
>  {
>  	struct qsee_req_uefi_query_variable_info *req_data;
>  	struct qsee_rsp_uefi_query_variable_info *rsp_data;
> -	efi_status_t efi_status = EFI_SUCCESS;
> -	dma_addr_t cmd_buf_dma;
> +	void *cmd_buf __free(qcom_tzmem) = NULL;
>  	size_t cmd_buf_size;
> -	void *cmd_buf;
>  	size_t req_offs;
>  	size_t rsp_offs;
>  	int status;
> @@ -710,11 +651,9 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
>  		__reqdata_offs(sizeof(*rsp_data), &rsp_offs)
>  	);
>  
> -	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
> -	if (!cmd_buf) {
> -		efi_status = EFI_OUT_OF_RESOURCES;
> -		goto out;
> -	}
> +	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
> +	if (!cmd_buf)
> +		return EFI_OUT_OF_RESOURCES;
>  
>  	req_data = cmd_buf + req_offs;
>  	rsp_data = cmd_buf + rsp_offs;
> @@ -724,28 +663,21 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
>  	req_data->length = sizeof(*req_data);
>  
>  	status = qcom_qseecom_app_send(qcuefi->client,
> -				       cmd_buf_dma + req_offs, sizeof(*req_data),
> -				       cmd_buf_dma + rsp_offs, sizeof(*rsp_data));
> -	if (status) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +				       cmd_buf + req_offs, sizeof(*req_data),
> +				       cmd_buf + rsp_offs, sizeof(*rsp_data));
> +	if (status)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->command_id != QSEE_CMD_UEFI_QUERY_VARIABLE_INFO) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->command_id != QSEE_CMD_UEFI_QUERY_VARIABLE_INFO)
> +		return EFI_DEVICE_ERROR;
>  
> -	if (rsp_data->length != sizeof(*rsp_data)) {
> -		efi_status = EFI_DEVICE_ERROR;
> -		goto out_free;
> -	}
> +	if (rsp_data->length != sizeof(*rsp_data))
> +		return EFI_DEVICE_ERROR;
>  
>  	if (rsp_data->status) {
>  		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
>  			__func__, rsp_data->status);
> -		efi_status = qsee_uefi_status_to_efi(rsp_data->status);
> -		goto out_free;
> +		return qsee_uefi_status_to_efi(rsp_data->status);
>  	}
>  
>  	if (storage_space)
> @@ -757,10 +689,7 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
>  	if (max_variable_size)
>  		*max_variable_size = rsp_data->max_variable_size;
>  
> -out_free:
> -	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
> -out:
> -	return efi_status;
> +	return EFI_SUCCESS;
>  }
>  
>  /* -- Global efivar interface. ---------------------------------------------- */
> @@ -871,6 +800,7 @@ static const struct efivar_operations qcom_efivar_ops = {
>  static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
>  				 const struct auxiliary_device_id *aux_dev_id)
>  {
> +	struct qcom_tzmem_pool_config pool_config;
>  	struct qcuefi_client *qcuefi;
>  	int status;
>  
> @@ -889,6 +819,16 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
>  	if (status)
>  		qcuefi_set_reference(NULL);
>  
> +	memset(&pool_config, 0, sizeof(pool_config));
> +	pool_config.initial_size = SZ_4K;
> +	pool_config.policy = QCOM_TZMEM_POLICY_MULTIPLIER;
> +	pool_config.increment = 2;
> +	pool_config.max_size = SZ_256K;
> +
> +	qcuefi->mempool = devm_qcom_tzmem_pool_new(&aux_dev->dev, &pool_config);
> +	if (IS_ERR(qcuefi->mempool))
> +		return PTR_ERR(qcuefi->mempool);
> +
>  	return status;
>  }
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 1b64a4f4d07d..04131e60b63a 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1588,9 +1588,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_get_id);
>  /**
>   * qcom_scm_qseecom_app_send() - Send to and receive data from a given QSEE app.
>   * @app_id:   The ID of the target app.
> - * @req:      DMA address of the request buffer sent to the app.
> + * @req:      Request buffer sent to the app (must be TZ memory)
>   * @req_size: Size of the request buffer.
> - * @rsp:      DMA address of the response buffer, written to by the app.
> + * @rsp:      Response buffer, written to by the app (must be TZ memory)
>   * @rsp_size: Size of the response buffer.
>   *
>   * Sends a request to the QSEE app associated with the given ID and read back
> @@ -1601,13 +1601,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_get_id);
>   *
>   * Return: Zero on success, nonzero on failure.
>   */
> -int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
> -			      dma_addr_t rsp, size_t rsp_size)
> +int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
> +			      void *rsp, size_t rsp_size)
>  {
>  	struct qcom_scm_qseecom_resp res = {};
>  	struct qcom_scm_desc desc = {};
> +	phys_addr_t req_phys;
> +	phys_addr_t rsp_phys;
>  	int status;
>  
> +	req_phys = qcom_tzmem_to_phys(req);
> +	rsp_phys = qcom_tzmem_to_phys(rsp);
> +
>  	desc.owner = QSEECOM_TZ_OWNER_TZ_APPS;
>  	desc.svc = QSEECOM_TZ_SVC_APP_ID_PLACEHOLDER;
>  	desc.cmd = QSEECOM_TZ_CMD_APP_SEND;
> @@ -1615,9 +1620,9 @@ int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
>  				     QCOM_SCM_RW, QCOM_SCM_VAL,
>  				     QCOM_SCM_RW, QCOM_SCM_VAL);
>  	desc.args[0] = app_id;
> -	desc.args[1] = req;
> +	desc.args[1] = req_phys;
>  	desc.args[2] = req_size;
> -	desc.args[3] = rsp;
> +	desc.args[3] = rsp_phys;
>  	desc.args[4] = rsp_size;
>  
>  	status = qcom_scm_qseecom_call(&desc, &res);
> diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
> index 366243ee9609..1dc5b3b50aa9 100644
> --- a/include/linux/firmware/qcom/qcom_qseecom.h
> +++ b/include/linux/firmware/qcom/qcom_qseecom.h
> @@ -73,9 +73,9 @@ static inline void qseecom_dma_free(struct qseecom_client *client, size_t size,
>  /**
>   * qcom_qseecom_app_send() - Send to and receive data from a given QSEE app.
>   * @client:   The QSEECOM client associated with the target app.
> - * @req:      DMA address of the request buffer sent to the app.
> + * @req:      Request buffer sent to the app (must be TZ memory).
>   * @req_size: Size of the request buffer.
> - * @rsp:      DMA address of the response buffer, written to by the app.
> + * @rsp:      Response buffer, written to by the app (must be TZ memory).
>   * @rsp_size: Size of the response buffer.
>   *
>   * Sends a request to the QSEE app associated with the given client and read
> @@ -90,8 +90,8 @@ static inline void qseecom_dma_free(struct qseecom_client *client, size_t size,
>   * Return: Zero on success, nonzero on failure.
>   */
>  static inline int qcom_qseecom_app_send(struct qseecom_client *client,
> -					dma_addr_t req, size_t req_size,
> -					dma_addr_t rsp, size_t rsp_size)
> +					void *req, size_t req_size,
> +					void *rsp, size_t rsp_size)
>  {
>  	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
>  }
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index aaa19f93ac43..2c51987fb70a 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -118,8 +118,8 @@ bool qcom_scm_lmh_dcvsh_available(void);
>  #ifdef CONFIG_QCOM_QSEECOM
>  
>  int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
> -int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
> -			      dma_addr_t rsp, size_t rsp_size);
> +int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
> +			      void *rsp, size_t rsp_size);
>  
>  #else /* CONFIG_QCOM_QSEECOM */
>  
> @@ -129,8 +129,8 @@ static inline int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
>  }
>  
>  static inline int qcom_scm_qseecom_app_send(u32 app_id,
> -					    dma_addr_t req, size_t req_size,
> -					    dma_addr_t rsp, size_t rsp_size)
> +					    void *req, size_t req_size,
> +					    void *rsp, size_t rsp_size)
>  {
>  	return -EINVAL;
>  }
> 
> -- 
> 2.43.0
> 

