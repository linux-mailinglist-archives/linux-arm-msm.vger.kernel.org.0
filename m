Return-Path: <linux-arm-msm+bounces-84071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCBC9B556
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 12:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E1489344542
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3075B296BA5;
	Tue,  2 Dec 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkHd8Z01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWtctqRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7A310774
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675822; cv=none; b=C+EPUkuYtpasi0a1ESP1hnaQhhpAxPJthYgiyDdWUOW0as60SQw/8IQJ99IUEHl8RPzF8Tt1N8sCnUfldRwQdW3IzfuEhIJxOyebGCKD4VOVHhKUd5D+PSNw0RjEJszFgElzDA9DcrsqXJpEGjJ9T6AnFrOTWyWj2CfvDQgT0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675822; c=relaxed/simple;
	bh=pluaelgn4p+k5diGNWc3B17XYfw3IIjfgjWCXXW3ZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StzuGdD0KSzdN2VEsx9dcg3PsOs4WU4uGqE8A9aLTi5cllts3GoIWqrmqtPUpmMpj1/RpRHD3OauKDIduugS2IEFzW9TZ+GpEVd3dq+gGRpG7nVp6oX9A2ALIS+8gZ2YhaKE8+5Kw3BSKsZMBEsUaScH5oXi+0YhiVs+nogSl8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkHd8Z01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWtctqRn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B27LmHo2692318
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 11:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/RDp3pox0N8680TFcCEYQ5W6
	VkqTlAK+exsmEfnbXGM=; b=FkHd8Z01EAbTWPWCL6J+LhhYKMAL8iMHxTQDPSJH
	GxDMPM4/aYs77lrv/dPW3TjvEscnrtq2dpO/d6k4d/5gXR7WsB8Tf32CbiEFL6XJ
	G+D0UkoFN5UmKzaiTtFi3wZLUn68lJAFt/IuMAl6ED4l409Z6mPiLjnWRkI8AGs2
	kXuCWE2+sJZctt7T5/Ll7p824U6RNOp/Mn60V3DbpWW588TJtK89T42QSjPrx9Tf
	zC3OcwNOg+QiP6/Ioxk/a9D16njO/aUFhNdiZ2hoRK3aZjFqSwTFFnaz8X8Gp1mq
	uGl11pqfbxq+GeXhpoJmrZputDD/Ly0jatiK73BhxHY7ew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asun90tpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 11:43:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e66542afso143034445ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764675819; x=1765280619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RDp3pox0N8680TFcCEYQ5W6VkqTlAK+exsmEfnbXGM=;
        b=AWtctqRn+m/BkzZsgBT9tTnhXgqagPuPqxYlIGlampHJyY0ULmIAO39BkWZFaBvPZT
         WS7m3+lpjDyHTWqkjehEgu8k/o0KuC9hiNQYvnCfnxCu6ipa8qR76m5pMjwbr2joiS0r
         wvXblibStwV/ks0qglMAEmIPkfAY3lteYqpMKrsiqXpBY7RpYai+xNuWXyL6OTBovT2R
         QVEApCUHLdvgKFt66SMJdAHVwLrV9i4iOTi53rnY9Uf/viMK9PD2pWk7NvPrc4WmP3k3
         Mt8ASEJ1Nwjh/gsowisttZ9SZJffybp7UsqG6sMdOA3vT1HoI+6iMlB3da5jXGjfFIcv
         IDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764675819; x=1765280619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RDp3pox0N8680TFcCEYQ5W6VkqTlAK+exsmEfnbXGM=;
        b=PAPMZkKVtn9UebFi47/M6KbyNI9fKIyxMBiLrv1MNC1d1NgWESkWfbzFhceay4lcJh
         /tEXZHGR5PzEcCU52WpXZlDq9i10z/n+mFeQACg4oXBovWEKV7pIQf5C5LA8uppToU3h
         Mz0dHjUHrgf+spw7U+rr8bFYA28LfJ1LeA1CWJPgnyEftpRJnpbwQFPXZIZf1Mn7inV8
         ru5wPYM75914ZHRTiDdXoLWXhxS1t1taeIlqBd0fyNX30I8SC9UvujfSIZ+E7kX4nIza
         hArm6eTx8ZFAlnkKzgHjHFIbxzW5BuHIw8cX8ZkuuCJTk06KQaIG3fGfQrflm7Lf3wIi
         tS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnAeiKJPoY53S749lp7LCT6CSZ6+FYxOl+2XLBhfQL1Fbrp/7lXM9Zj9kLZjoh9bd6qJ4lV08iAOnPj2km@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZU0UeKGcKsOtY+wTEXHhI6x91EMBVC7eqPdgpqYQ7+uEnlRR
	ci8s80ry1Ctusjzx6HCtKvck9zg9nsodj7VnZJjdYtTO2nlUL6zfgNzXpggi/hklhvyayOKqbSd
	zAlnUmqo1fBAH/9YU5LK2H+SwTIsWm+zvazrRA/JaqQsiCw2jS5/811Qa4nW9qfUGc1CbUkjU02
	93
X-Gm-Gg: ASbGncu1ifQx9fP9QHdqDbUN+NohmNtKdYkZHoPJBBucVUHFO+jJBFBIhHfDW1LvEn7
	mbBDBosk7gaGMDTaAATE5k6QN4OJgiPiZ/WXnRcN96Sy50Ftl1DGSMpGjZNIlL3XVDu1cEzoOf8
	1vqmHi4CBcqEMX5fFantBvCgadsX0D708ouEV17+HI828o7CEWjjsvMPg1hbhmYkC+UYikMXcoa
	YMvisv+B4wlMARJTkOFCKdybGJldDUBUtaAUhEeqM9X/KJBAPJ+C7xplNLy/+BSlb3Lmzx4FnMa
	iRK+XfapaVfRrRqtlJI6yX54YoE+4IpZq/P65slN5trtJsR/vRO6I6KcQNTAMeG6VDiI6P8aNpf
	1QT7pNbDZETF5Q/T2O41tufbXhcaW9eAe55Ev
X-Received: by 2002:a17:903:2412:b0:295:592f:94a3 with SMTP id d9443c01a7336-29bab1c5abemr318893055ad.48.1764675818401;
        Tue, 02 Dec 2025 03:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaNgAt8mAu7PBE13IH2ecH+6FK3N/etxWUUSsM2q5MX6tD6UtaIfQ3DcaYrMd5U/VwxLbmrQ==
X-Received: by 2002:a17:903:2412:b0:295:592f:94a3 with SMTP id d9443c01a7336-29bab1c5abemr318892805ad.48.1764675817797;
        Tue, 02 Dec 2025 03:43:37 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce478762sm150423425ad.45.2025.12.02.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:43:37 -0800 (PST)
Date: Tue, 2 Dec 2025 17:13:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Message-ID: <20251202114332.wlc2vdd2phslndek@hu-mojha-hyd.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
 <20251130-multi_waitq_scm-v10-1-5a5f2f05a417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-multi_waitq_scm-v10-1-5a5f2f05a417@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA5NCBTYWx0ZWRfX/0NcMyqOVgaY
 C3NaqXDvm62lyHBSKKteh9GJiycr6EKF69kSr6P5pGfZoenluT/7fEmC6u1PflPJ4d8jtGqgJ2E
 Sm12/7zHbrlPKiN+x0r7OprmKXFHpbyWCg3j6Cbk+QefrI/6jCx4F9NtDLCDSN90zUf9CQ8cFgh
 LET3uUzQDFQqM6Aj4OUBeiYNjReh+dNZEASGGlHEeAjjurjWnaK2JI617jZ1pP+9Tn1fd6/1KZY
 Mb13ybDUfMr5SSYWqP8/V80QpNRq/OdWPDsfWe0fdis7FR5JZwp3cDeJqexPTzJY3lWeTdqJwFA
 6PyOjscvnleEYu91pi3E1UanvbvVKzVZLA0dqLtAifAl/DMabwXfeNCtUuDtSlwQ+Wp5UtWLPyD
 pb9OWAP+n8FnuWvFxcQxuEzfhi9Kag==
X-Authority-Analysis: v=2.4 cv=DKOCIiNb c=1 sm=1 tr=0 ts=692ed0eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=vvwy-7zJ-b-ZoqmjjUYA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dU7EJPSpGcPoKfXp0Y5J3eGC8F5NfGeg
X-Proofpoint-ORIG-GUID: dU7EJPSpGcPoKfXp0Y5J3eGC8F5NfGeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020094

On Sun, Nov 30, 2025 at 08:11:02PM +0530, Shivendra Pratap wrote:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> 
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
> qcom_scm_fill_irq_fwspec_params(). This Linux IRQ number is then
> supplied to the threaded_irq call.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

LGTM, incase you are going to sent another spin of this..

> ---
>  drivers/firmware/qcom/qcom_scm.c | 60 +++++++++++++++++++++++++++++++++++++++-
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b127944fe112f453cae9cbc40c06cae..79ab1707f71b0157835deaea6309f33016e3de8c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -29,12 +29,18 @@
>  #include <linux/reset-controller.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>

At most places, where this header is used there is a line feed
before it, if the header before it is not from dt-bindings.

>  
>  #include "qcom_scm.h"
>  #include "qcom_tzmem.h"
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
> @@ -2223,6 +2229,55 @@ bool qcom_scm_is_available(void)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_is_available);
>  
> +static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 hwirq)
> +{
> +	if (hwirq >= GIC_SPI_BASE && hwirq <= GIC_MAX_SPI) {
> +		fwspec->param[0] = GIC_SPI;
> +		fwspec->param[1] = hwirq - GIC_SPI_BASE;
> +	} else if (hwirq >= GIC_ESPI_BASE && hwirq <= GIC_MAX_ESPI) {
> +		fwspec->param[0] = GIC_ESPI;
> +		fwspec->param[1] = hwirq - GIC_ESPI_BASE;
> +	} else {
> +		WARN(1, "Unexpected hwirq: %d\n", hwirq);
> +		return -ENXIO;
> +	}

line feed after } would make it look better..

> +	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
> +	fwspec->param_count = 3;
> +
> +	return 0;
> +}
> +
> +static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
> +{
> +	struct device_node *parent_irq_node;

after desc ?

> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct irq_fwspec fwspec;
> +	struct qcom_scm_res res;
> +	u32 hwirq;
> +	int ret;
> +
> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	hwirq = res.result[1] & GENMASK(15, 0);
> +

redundant line feed ?

> +	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
> +	if (ret)
> +		return ret;

Line feed needed here after return or } ?

> +	parent_irq_node = of_irq_find_parent(scm->dev->of_node);
> +	if (!parent_irq_node)
> +		return -ENODEV;
> +
> +	fwspec.fwnode = of_fwnode_handle(parent_irq_node);
> +
> +	return irq_create_fwspec_mapping(&fwspec);
> +}
> +
>  static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
>  {
>  	/* FW currently only supports a single wq_ctx (zero).
> @@ -2396,7 +2451,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
>  				     "Failed to create the SCM memory pool\n");
>  
> -	irq = platform_get_irq_optional(pdev, 0);
> +	irq = qcom_scm_get_waitq_irq(scm);
> +	if (irq < 0)
> +		irq = platform_get_irq_optional(pdev, 0);
> +
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
>  			return irq;
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..8b1e2ea18a59ac143907a381b73236148bace189 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -152,6 +152,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_SVC_WAITQ			0x24
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
> +#define QCOM_SCM_WAITQ_GET_INFO		0x04
>  
>  #define QCOM_SCM_SVC_GPU			0x28
>  #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
> 
> -- 
> 2.34.1
> 

With all the above changes,

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

