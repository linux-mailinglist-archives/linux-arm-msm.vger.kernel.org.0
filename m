Return-Path: <linux-arm-msm+bounces-86413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBBBCDA56F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3489302B10C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DFA34A79B;
	Tue, 23 Dec 2025 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgYoSSOL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8WSC2py"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CC34250D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517830; cv=none; b=o515TcVJ3V4HlCdviHIxmxRYSTtNhKLoB6TPz1Kq3l+O/2U1FCul9dEfMmlYQvBxvLusi6/uzYDfaPzG750iGzlNpMc0Voo/rWhru/YOolWx0jlBdM2rESzRawtY3ZAb4Aro0USskvsPV7yiKiRnsIg8/E0djFDxQcprpxyfvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517830; c=relaxed/simple;
	bh=e/K6DJyyl5eVHoqNx1v+JovrfUBXHX3uwubb+kh0Xb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ibd3w+A60bBPdX9u6rXONEewPMWs/S2XwZ5CfLQy/3gtHLR5rkq+70XgTBF+XrpwEiPniM+4YmyoGBAJ550mxqJ7mQiIbWLghzE83Ies8tQNF/d48mnDUbdzWBFxQ/2+niYIBbXoJhS95R8jzVh+A/L6mGXOAdvdxCI+eAyGU1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgYoSSOL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8WSC2py; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCdjLh560003
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6711fFASqVFFcO30babn8Ac9
	FXFtPpK4wAQnIV54M9U=; b=bgYoSSOL1bFfni3jFsBe9+sXRnwMsZMJ9FYmJ5bv
	rtqPqQugQFxaf2VtQfocDQWuXMMrSAfnEiV8IXiWqiYKdHGR/TsWMvesej1Io5WO
	1q0/VwbXdLv1ZH76VsIHiWg9TrGV47VRJM13w8lbTRapnP7GThEO7z30MvP+gZtF
	Ou1BZvewXtnsIF673v8xJ7QFixq7gydbfTFNuxwzFBiB2MLOC+fAeR2OGkErWBXx
	5Vv/Tv6zyZjIsKeY03mlpa1ROxdSpIuMYPckUkeMkPWgYN0vXQKrSm1ilLa6Y1mr
	QUWL/QUvg9DiQKVKcNqSdUqK4LZzmbdGc0zD+BiU2tzmuQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cs6s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:23:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9413e6717f0so5033651241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766517827; x=1767122627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6711fFASqVFFcO30babn8Ac9FXFtPpK4wAQnIV54M9U=;
        b=j8WSC2pyVTD8upXpuVPhwvfXwDmWSUagzIY95jhtKADEFfMRsWk3ySGOrdUDwv0V5y
         GkST+1SbOafR3vlHZuhVgw3Gsu83WHxZilPJ8bNa+DQRnooKju+4wT9o5CgAEp72wW6A
         DTjNjI2OlPyob0NgRVDNxYkdF2fOm+qiJTQIy5GMu9Ewlicz97kbY9DoYMefJLkhpiOt
         iYQ+1bqK/ac/p9ujVII+B8L5nUzv+SXf/cj66317CPyr57wVy2rMGEDpGX2zXavlYA5G
         OtPGLjHzTN+f9kYZS2GAZ1tCRMCblHBTIRYzszvMCueFyB3f1Mu04cT4Cm9ov5Ib2Cmn
         yiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517827; x=1767122627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6711fFASqVFFcO30babn8Ac9FXFtPpK4wAQnIV54M9U=;
        b=LyUx/G5C3vPqFY3GfTlC6R8hf4SWRUBAorQQ5dqYsiw4WvuyoHki4Hc0huW03Mp+D0
         N7ypMqM6K7k7JmpxdqKo8H9vz1FaR/OTgHtpriBbeMjhn4wjEcO+Q+ViKm8OuXJ6jvg+
         +5FhaWOkrZDyo5IURfocqY9dWokIWSG+y829ZffUQHZyv22olcih48f37ZuSPaiqr2NJ
         DJ8mzUYIclzlHMWgc80/11Ecvh82WVvmP4jkXdBs427/VGvxwqyvCz+DlhYHcNy+gpaE
         WJONb5v85bTih3PA76Z2z4FF3XsvUrStTrSsHSmd9xmav/+0/1exdDMCzLRXcTOsMlrW
         +vow==
X-Forwarded-Encrypted: i=1; AJvYcCUtzr837UGKr+l8XauFHc1Yt+cpfRmuv88fwUpK2uXQI18BBYTFL215G9P4e05zWQ3XazlTGzDS6rE3gKGe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KCAdQNu9SUbq81X/6GxuhueDEaPAIrfixc1WjvX0bBPmhNXh
	9ctToMV2cedMKeQ1R04snEpvb/ttbjz03USv5QSCLVlWT6JeqIqOSNf/wZuBT/RTSmsHG2DANy8
	OMgMYuQW0ePizobkBzIfTMreJXPsH4p12nOsu8nsd8bhHoufAdM8AEZZTM+1CJEKrw/ns
X-Gm-Gg: AY/fxX5pFda+hrJuIVv2NBFVchfFPZnGeVks9YOtex5dwh45S1jTPGc0HfP9bw6YFwQ
	BUI0AUQIuwNhu0DVtePMMAiSf+wYff3JXzonf1+GyKkJxLQeXN+M2uEJsp908PgKBJp/DCydbYX
	WE1dPyEqFzTlK2nS2fqfeg8nARv8l7gJfJi3wNvo2Y3T6Xt7kzaONzJxXrHr1UmJh/7k4DLrYFv
	m4avlu0euZjKNj/SXYJy0zs8d1Gd4ZXi8+nuo3ll+EM+jhixyyNVaDscv/T7sHI2sSW6zfBlAAH
	h7oWJSrANKSd1SI7CUqCpfCMCa4cPYdVORiTPGKpRLLI+LZsKoXtd0XNSk4yEdPMvHJloQhTFSU
	r/r4FKq75/+0a8HIylsrW2XJoxYxYUAOqDsP5GE01BtkkioD574qDo6sIFcQegV9ceVbzSzrOcA
	bEP7vQjTXH+YZzwynS/Iwp4n4=
X-Received: by 2002:a05:6102:2c83:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5eb1a833fdamr5223556137.38.1766517827172;
        Tue, 23 Dec 2025 11:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUNWc8WnYvoieRgpOCF55sJG9m5/Nj46fDO+o3nr7Pds+CxLscWMwkVniQhLISh7zfdRyIpA==
X-Received: by 2002:a05:6102:2c83:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5eb1a833fdamr5223532137.38.1766517826704;
        Tue, 23 Dec 2025 11:23:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de761sm38621511fa.1.2025.12.23.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:23:44 -0800 (PST)
Date: Tue, 23 Dec 2025 21:23:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/8] thermal: Add Remote Proc cooling driver
Message-ID: <iz3e2ojepgjo4c36ibl5sfpw2oidkj7sao6o2jint4midgsynm@adhsfkukk2ba>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-2-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223123227.1317244-2-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-GUID: Ew954JwNsiMd1WYZ9XiWYnQclYAS9Pt0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MiBTYWx0ZWRfX0w8uIoeIQJ1P
 cnguDoDM3U9XGm83jNJhGAFLoikbYX/MELqeSR0OqIwNrPOXoqupkbwkMKzAQNSnk0VTLezsK5T
 74S+KnzPQsXQZ9z+iTeh+Wuz80Lvs8rGME24JDM5dVNkIU6i4Dqj0uGGZiDksyM3PF+bSdfKqQP
 HQ03wedjBcsMfW0w5E9x3Uggi+dIMDWmgD4xdUSBO3ElpZESpJFb59z8EHYVsxz7uxi9HJKBYd7
 jIzMDA66LGbNkGXuOo9ImmsbOHotZe+q8RRznk3xoWadpK9gUpsR4qYAHHQDdeiDmWwp2D9gaci
 v2GR9ifUILY0aSh+Q7Kgpw8MQFhRKu4Wx5yKfLcrX0A/d+ybEcd38NxD5QjdjvOehBkwZPEHilQ
 jCi42F/agok6VvkeBHljDNbBKUw49EFgLgpQYWEnM1OMOC5/E6sPPzjRyczfJUrkV9Re6nyBOsN
 T8DeNyaTQZEJsJbavrg==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694aec44 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=D6nbwq-aYW_yfCsrQPgA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Ew954JwNsiMd1WYZ9XiWYnQclYAS9Pt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230162

On Tue, Dec 23, 2025 at 06:02:20PM +0530, Gaurav Kohli wrote:
> Add a new generic driver for thermal cooling devices that control
> remote processors (modem, DSP, etc.) through various communication
> channels.
> 
> This driver provides an abstraction layer between the thermal
> subsystem and vendor-specific remote processor communication
> mechanisms.

This driver simply wraps 3 callbacks. Please explain in the commit
message, why do we need it? Why can't the consumer of this API simply
provide those callbacks directly?

> 
> Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  MAINTAINERS                          |   8 ++
>  drivers/thermal/Kconfig              |  11 ++
>  drivers/thermal/Makefile             |   2 +
>  drivers/thermal/remoteproc_cooling.c | 154 +++++++++++++++++++++++++++
>  include/linux/remoteproc_cooling.h   |  52 +++++++++
>  5 files changed, 227 insertions(+)
>  create mode 100644 drivers/thermal/remoteproc_cooling.c
>  create mode 100644 include/linux/remoteproc_cooling.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 679e5f11e672..c1ba87315cdf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25935,6 +25935,14 @@ F:	drivers/thermal/cpufreq_cooling.c
>  F:	drivers/thermal/cpuidle_cooling.c
>  F:	include/linux/cpu_cooling.h
>  
> +THERMAL/REMOTEPROC_COOLING
> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Supported
> +F:	drivers/thermal/remoteproc_cooling.c
> +F:	include/linux/remoteproc_cooling.h
> +
> +
>  THERMAL/POWER_ALLOCATOR
>  M:	Lukasz Luba <lukasz.luba@arm.com>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index b10080d61860..31e92be34387 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -229,6 +229,17 @@ config PCIE_THERMAL
>  
>  	  If you want this support, you should say Y here.
>  
> +
> +config REMOTEPROC_THERMAL
> +	bool "Remote processor cooling support"

Why this is 'bool' rather than 'tristate'?

> +	help
> +	  This implements a generic cooling mechanism for remote processors
> +	  (modem, DSP, etc.) that allows vendor-specific implementations to
> +	  register thermal cooling devices and provide callbacks for thermal
> +	  mitigation.
> +
> +	  If you want this support, you should say Y here.
> +
>  config THERMAL_EMULATION
>  	bool "Thermal emulation mode support"
>  	help
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index bb21e7ea7fc6..ae747dde54fe 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -34,6 +34,8 @@ thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += devfreq_cooling.o
>  
>  thermal_sys-$(CONFIG_PCIE_THERMAL) += pcie_cooling.o
>  
> +thermal_sys-$(CONFIG_REMOTEPROC_THERMAL) += remoteproc_cooling.o
> +
>  obj-$(CONFIG_K3_THERMAL)	+= k3_bandgap.o k3_j72xx_bandgap.o
>  # platform thermal drivers
>  obj-y				+= broadcom/
> diff --git a/drivers/thermal/remoteproc_cooling.c b/drivers/thermal/remoteproc_cooling.c
> new file mode 100644
> index 000000000000..a1f948cbde0f
> --- /dev/null
> +++ b/drivers/thermal/remoteproc_cooling.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Remote Processor Cooling Device
> + *
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/thermal.h>
> +
> +#define REMOTEPROC_PREFIX		"rproc_"
> +
> +struct remoteproc_cooling_ops {
> +	int (*get_max_level)(void *devdata, unsigned long *level);
> +	int (*get_cur_level)(void *devdata, unsigned long *level);
> +	int (*set_cur_level)(void *devdata, unsigned long level);
> +};
> +
> +/**
> + * struct remoteproc_cdev - Remote processor cooling device
> + * @cdev: Thermal cooling device handle
> + * @ops: Vendor-specific operation callbacks
> + * @devdata: Private data for vendor implementation
> + * @np: Device tree node associated with this cooling device
> + * @lock: Mutex to protect cooling device operations
> + */
> +struct remoteproc_cdev {
> +	struct thermal_cooling_device *cdev;
> +	const struct remoteproc_cooling_ops *ops;
> +	void *devdata;
> +	struct device_node *np;
> +	struct mutex lock;
> +};
> +
> +
> +/* Thermal cooling device callbacks */
> +
> +static int remoteproc_get_max_state(struct thermal_cooling_device *cdev,
> +				    unsigned long *state)
> +{
> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
> +	int ret;
> +
> +	if (!rproc_cdev || !rproc_cdev->ops)
> +		return -EINVAL;
> +
> +	mutex_lock(&rproc_cdev->lock);
> +	ret = rproc_cdev->ops->get_max_level(rproc_cdev->devdata, state);
> +	mutex_unlock(&rproc_cdev->lock);
> +
> +	return ret;
> +}
> +
> +static int remoteproc_get_cur_state(struct thermal_cooling_device *cdev,
> +				    unsigned long *state)
> +{
> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
> +	int ret;
> +
> +	if (!rproc_cdev || !rproc_cdev->ops)
> +		return -EINVAL;
> +
> +	mutex_lock(&rproc_cdev->lock);
> +	ret = rproc_cdev->ops->get_cur_level(rproc_cdev->devdata, state);
> +	mutex_unlock(&rproc_cdev->lock);
> +
> +	return ret;
> +}
> +
> +static int remoteproc_set_cur_state(struct thermal_cooling_device *cdev,
> +				    unsigned long state)
> +{
> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
> +	int ret;
> +
> +	if (!rproc_cdev || !rproc_cdev->ops)
> +		return -EINVAL;
> +
> +	mutex_lock(&rproc_cdev->lock);
> +	ret = rproc_cdev->ops->set_cur_level(rproc_cdev->devdata, state);
> +	mutex_unlock(&rproc_cdev->lock);
> +
> +	return ret;
> +}
> +
> +static const struct thermal_cooling_device_ops remoteproc_cooling_ops = {
> +	.get_max_state = remoteproc_get_max_state,
> +	.get_cur_state = remoteproc_get_cur_state,
> +	.set_cur_state = remoteproc_set_cur_state,
> +};
> +
> +struct remoteproc_cdev *
> +remoteproc_cooling_register(struct device_node *np,
> +			     const char *name, const struct remoteproc_cooling_ops *ops,
> +			     void *devdata)
> +{
> +	struct remoteproc_cdev *rproc_cdev;
> +	struct thermal_cooling_device *cdev;
> +	int ret;
> +
> +	if (!name || !ops) {
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
> +	if (!rproc_cdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rproc_cdev->ops = ops;
> +	rproc_cdev->devdata = devdata;
> +	rproc_cdev->np = np;
> +	mutex_init(&rproc_cdev->lock);
> +
> +	char *rproc_name __free(kfree) =
> +		kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
> +	/* Register with thermal framework */
> +	if (np) {
> +		cdev = thermal_of_cooling_device_register(np, rproc_name, rproc_cdev,
> +							  &remoteproc_cooling_ops);
> +	}
> +
> +	if (IS_ERR(cdev)) {
> +		ret = PTR_ERR(cdev);
> +		goto free_rproc_cdev;
> +	}

So, if np == NULL, we register nothing, but still return 0 (aka no
error). Why?

> +
> +	rproc_cdev->cdev = cdev;
> +
> +	return rproc_cdev;
> +
> +free_rproc_cdev:
> +	kfree(rproc_cdev);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(remoteproc_cooling_register);
> +
> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
> +{
> +	if (!rproc_cdev)
> +		return;
> +
> +	thermal_cooling_device_unregister(rproc_cdev->cdev);
> +	mutex_destroy(&rproc_cdev->lock);
> +	kfree(rproc_cdev);
> +}
> +EXPORT_SYMBOL_GPL(remoteproc_cooling_unregister);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Remote Processor Cooling Device");
> diff --git a/include/linux/remoteproc_cooling.h b/include/linux/remoteproc_cooling.h
> new file mode 100644
> index 000000000000..ef94019d220d
> --- /dev/null
> +++ b/include/linux/remoteproc_cooling.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Remote Processor Cooling Device
> + *
> + * Copyright (c) 2025, Qualcomm Innovation Center
> + */
> +
> +#ifndef __REMOTEPROC_COOLING_H__
> +#define __REMOTEPROC_COOLING_H__
> +
> +#include <linux/thermal.h>
> +
> +struct device;
> +struct device_node;
> +
> +struct remoteproc_cooling_ops {
> +	int (*get_max_level)(void *devdata, unsigned long *level);
> +	int (*get_cur_level)(void *devdata, unsigned long *level);
> +	int (*set_cur_level)(void *devdata, unsigned long level);
> +};
> +
> +struct remoteproc_cdev;
> +
> +#ifdef CONFIG_REMOTEPROC_THERMAL
> +
> +struct remoteproc_cdev *
> +remoteproc_cooling_register(struct device_node *np,
> +			     const char *name,
> +			     const struct remoteproc_cooling_ops *ops,
> +			     void *devdata);
> +
> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev);
> +
> +#else /* !CONFIG_REMOTEPROC_THERMAL */
> +
> +static inline struct remoteproc_cdev *
> +remoteproc_cooling_register(struct device_node *np,
> +			     const char *name,
> +			     const struct remoteproc_cooling_ops *ops,
> +			     void *devdata)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline void
> +remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
> +{
> +}
> +
> +#endif /* CONFIG_REMOTEPROC_THERMAL */
> +
> +#endif /* __REMOTEPROC_COOLING_H__ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

