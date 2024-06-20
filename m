Return-Path: <linux-arm-msm+bounces-23476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16B911645
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 01:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC821C21ED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 23:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4522F143865;
	Thu, 20 Jun 2024 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PE08rfb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887977C6EB;
	Thu, 20 Jun 2024 23:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924741; cv=none; b=rmWUyhQC0+y5Nk4oVeiEP9liUQMb0VFRcTpnFsO4SQ5gMThQRuT89kMO1Pe6WER9iVSLaAkDDo+KhCCTDi5NQmHURseho2u6EuD6khF1cZRWyVG2BOitUdIzu4PI3t9te/Gjm4BnreKVmJotyt0mudjpxb042Jguq2IdBOXzdok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924741; c=relaxed/simple;
	bh=7VsZnX5qxiD5JwdvNvR75AwciqOVH27nSJGWssoWbpo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WujvTSMzjQI+f2T9pSWYehaP0/q5FOad7ZBYKV2Yz0qF/sQJzzAkO4JhClbmNVpW0LRVtQ1fCxqsdaLuoZKhA70Km5vqvoSfq4y66LJeKC4r97SuYpVqd6ahmqPtFDbNZVI83UF26gIrMb46vKElHJR8TGrNyBt1BIURqJOMIt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PE08rfb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBAFu023939;
	Thu, 20 Jun 2024 23:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SdhXCePHSoBJD0YMv3phwL7k
	t62KFN/abIbY/2C+QVE=; b=PE08rfb+/anfLTFASvMctyKduVUyKQVoDKGAq7NS
	XC/3sEFhyd/pHzmBtmsjvN3tw5Riqtvg1hXFx6HOo1ZANOvaPcKIZSgqwsWjs7GZ
	jOak/AAyGm/CneRUJH5k+pv/ClDGP5YN+yoQG+bvcmn3PI/Iu78E/1BvqI9NpACN
	SD4Ha2WfsEIbXeMOkp9DdjMg0QUNymiRcjNLigOypkC8XdePWdx45Spepzcy/uUz
	96uQBuC6r3Y/oOdL0BD1CTjgF9ywgWlOOoyZiHtLR4Ox3QeVh/BoqfhNpyLQwvZy
	LZlx9GMmxEJw3YqE3W/DX8q9byGGA9cXEFdwQRkRTeqo3Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrksrwd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 23:05:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KN5Kio032286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 23:05:20 GMT
Received: from hu-eberman-lv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 16:05:16 -0700
Date: Thu, 20 Jun 2024 16:05:16 -0700
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
Subject: Re: [PATCH v10 12/15] firmware: qcom: scm: add support for SHM
 bridge memory carveout
Message-ID: <20240620160341297-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
 <20240527-shm-bridge-v10-12-ce7afaa58d3a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527-shm-bridge-v10-12-ce7afaa58d3a@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EgakFB0fab-s37C0ZCJaLvOZmHKo_yuV
X-Proofpoint-GUID: EgakFB0fab-s37C0ZCJaLvOZmHKo_yuV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_10,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200169

On Mon, May 27, 2024 at 02:55:02PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Parse the "memory-region" property and - if present - use it to assign
> the dedicated reserved memory to the underlying DMA callbacks which will
> then allocate memory for the SCM calls from it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
>  drivers/firmware/qcom/qcom_scm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 94c34cde8179..c82957727650 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -23,6 +23,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/sizes.h>
> @@ -1942,6 +1943,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
>  		qcom_scm_disable_sdi();
>  
> +	ret = of_reserved_mem_device_init(__scm->dev);
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(__scm->dev, ret,
> +				     "Failed to setup the reserved memory region for TZ mem\n");
> +
>  	ret = qcom_tzmem_enable(__scm->dev);
>  	if (ret)
>  		return dev_err_probe(__scm->dev, ret,
> 
> -- 
> 2.43.0
> 

