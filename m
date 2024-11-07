Return-Path: <linux-arm-msm+bounces-37190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666D9BFD7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 06:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81772824EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 05:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC90E56C;
	Thu,  7 Nov 2024 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YMo5vkdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664323CE;
	Thu,  7 Nov 2024 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730955740; cv=none; b=eMWAwAV0ie3eeulPLaJxnK4t5KBcN9bwUz3ALyBwEGgHgQ+Wfts2qZuerm+L5inwvuMIwYVj3mp7T+xRKj1RwNzicDFaQeNw0aQFpjBMT9NCEIskeBIRWh2R0UxLV4/eXNs4y+k8eGmzicMLmT+zG6kCtOh9L4Nwju18CEgmQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730955740; c=relaxed/simple;
	bh=lNTIsQqxU/Efmiw+KyFg62vRx98WWe+uJjsnDk2iF+E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtKmhxFBQ1UsPXw61C5uN8CRCNcEUREFK5nIw+529N8aJZ05x9ir1GppvKWD+fUHOuVc5QrPe4hYQWMJknaw7zMMQ3EqJxHDQD7+paNQKkGuDgzlNEHuBJ7qWfXaAOSjjryGoXnaf0G8hQx1IBgDqnz+0rRjoVIEZ6PMaj3ubBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YMo5vkdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Ff6Tt010504;
	Thu, 7 Nov 2024 05:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WgaiKBR4nxQ2B469qCDJbKf6
	OQgydChhdv2wKc8Rj3Q=; b=YMo5vkduT6zNuNqZ+qfWmzRMZDZFij1lDrFrcM5W
	vCE5l1XnLqDdkgC1XcIxor54TD+KlG1x3nhKZkf7WPkSXU5IAjN6knigVeFaK3Xa
	hCNaBpUYXCBVrYrPK5UqXTI0uLbqPZYP13nqKEkjRgYdH2dZz1k9xAkcWdUuEhlf
	ZVL2MnJ1y4cbXnizikBbOkqdtJ9u4Z1HJvA0fLo/WGeJ4kyBLXEybnrMKtSfta30
	Xq6QqzdY0i7DH84KugyoPv9lfrs8m+zgXpINnTyaBxblxMnfmIcFuoLyx12rbbhX
	2tTi+8xtpIBO0syQ+6PLnOh5gU4GUFJDan0ZOkGEMgrI2w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qn73d8ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 05:02:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A752E09000383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 05:02:14 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 21:02:09 -0800
Date: Thu, 7 Nov 2024 10:32:06 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Message-ID: <7f57a3ea-9225-4c4a-ac81-de49f0a3582c@quicinc.com>
References: <cover.1730735881.git.quic_uchalich@quicinc.com>
 <c8179357049e3ee800194de50225d076ed3fba7a.1730735881.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c8179357049e3ee800194de50225d076ed3fba7a.1730735881.git.quic_uchalich@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ux_fdH0sIQTIRgI9dv-Q-IQbaSaFlUsH
X-Proofpoint-GUID: Ux_fdH0sIQTIRgI9dv-Q-IQbaSaFlUsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070036

On Mon, Nov 04, 2024 at 08:20:55AM -0800, Unnathi Chalicheemala wrote:
> Bootloader and firmware for SM8650 and older chipsets expect node
> name as "qcom_scm", in order to patch the wait queue IRQ information.
> However, DeviceTree uses node name "scm" and this mismatch prevents
> firmware from correctly identifying waitqueue IRQ information. Waitqueue
> IRQ is used for signaling between secure and non-secure worlds.
> 
> To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
> hardware IRQ number to be used from firmware instead of relying on data
> provided by devicetree, thereby bypassing the DeviceTree node name
> mismatch.
> 
> This hardware IRQ number is converted to a Linux IRQ number using newly
> defined fill_irq_fwspec_params(). This Linux IRQ number is then supplied
> to the threaded_irq call.
> 
> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 52 +++++++++++++++++++++++++++++++-
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..ec1205474a3a 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -11,6 +11,7 @@
>  #include <linux/completion.h>
>  #include <linux/cpumask.h>
>  #include <linux/dma-mapping.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
> @@ -35,6 +36,11 @@
>  
>  static u32 download_mode;
>  
> +#define GIC_SPI_BASE        32
> +#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
> +#define GIC_ESPI_BASE     4096
> +#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
> +
>  struct qcom_scm {
>  	struct device *dev;
>  	struct clk *core_clk;
> @@ -1830,6 +1836,50 @@ bool qcom_scm_is_available(void)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_is_available);
>  
> +static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
> +{
> +	if (virq >= GIC_SPI_BASE && virq <= GIC_SPI_MAX) {
> +		fwspec->param[0] = GIC_SPI;
> +		fwspec->param[1] = virq - GIC_SPI_BASE;
> +	} else if (virq >= GIC_ESPI_BASE && virq <= GIC_ESPI_MAX) {
> +		fwspec->param[0] = GIC_ESPI;
> +		fwspec->param[1] = virq - GIC_ESPI_BASE;
> +	} else {
> +		WARN(1, "Unexpected virq: %d\n", virq);
> +		return -ENXIO;
> +	}
> +	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
> +	fwspec->param_count = 3;
> +
> +	return 0;
> +}
> +
> +static int qcom_scm_get_waitq_irq(void)
> +{
> +	int ret;
> +	u32 hwirq;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +	struct irq_fwspec fwspec;
> +
> +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +

What would be the return value on older firmware where WAITQ_GET_INFO
command is not supported? See below comment on the expected return
value from qcom_scm_get_waitq_irq().

> +	fwspec.fwnode = of_node_to_fwnode(__scm->dev->of_node);
> +	hwirq = res.result[1] & GENMASK(15, 0);
> +	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
> +	if (ret)
> +		return ret;
> +	ret = irq_create_fwspec_mapping(&fwspec);
> +
> +	return ret;
> +}
> +
>  static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
>  {
>  	/* FW currently only supports a single wq_ctx (zero).
> @@ -1986,7 +2036,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Let all above stores be available after this */
>  	smp_store_release(&__scm, scm);
>  
> -	irq = platform_get_irq_optional(pdev, 0);
> +	irq = qcom_scm_get_waitq_irq();
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
>  			return irq;

Here we fail probe for any return value other than -ENXIO, would that
cause problems with older firmware?

Thanks,
Pavan

