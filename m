Return-Path: <linux-arm-msm+bounces-65712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D77B0AA37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 20:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516765A26F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC132E7F34;
	Fri, 18 Jul 2025 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8XqDrW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0B1F7575
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752863836; cv=none; b=C0WK++2O3c6b5D2YgOvZq7JzR+88yiZ4HfAtM9rdSXhwmWUu6dyz694YNwVfu4kXrz/YEsFiXko10ZIPiA9+Wqwvkv+t4jSK/d5NzHVizWrg4ImBE3GzlVUkiHxIe9Fmi8SX54+OTwUhr8S0fnTILJjvR9GShzYZYfH6GqiaBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752863836; c=relaxed/simple;
	bh=FD9HooRQCc+PXCUOKvmD24mEJXDixu8d1mCmEOHZHmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ibe6i68Q2Bmf8IcRFKfi0o+xYf6526+zw/BpK50XVN4aXlA/Fhw/NMccjmcs6z52215uB6CDMhOINMLFhmiPTy+tzpU9KpsPMwiZdtcVxEemgv9h8lWyD4EgeZXI8d4pbmwChCTfnm5aECtFWC38slh25E+FVglOunAyF/tYr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8XqDrW5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I94nxr032390
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 18:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ALPvAyKfQjtdHFgs68bECM2y
	VyHmmPwO24e9jJdHfv0=; b=P8XqDrW5iPG1Zr+qNYrNvxjbOiTer6Kt+/d6Vte1
	U/MkzM1dytcaMlu0aj78H5itvp5IMCpGjxy4Tr0j8VO6daAVabH7uLGgt70TvUit
	UjofSgTWIoF8kkxkMpum7buUxBLgxVGoko/N05tbu/R0p948qF3/4/vy6S8pkNnM
	zeR6189Rz37Cr/c2wJumOJ5j/DYZGwIxN+mp8qkBhfd3N5T+gODgkedqQW7ySpHP
	lI5pkGZdb44ABl6RHSCz4X2wfzp7fVtjK6+Hwcy+v981IgTMULCtGrMW37R8V1VF
	Y+8s2w9sWCBHf9o7RNJpZK0iQTgVJHcL3m3/rBu6N4+w1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38crrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 18:37:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e350826d99so319546585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752863832; x=1753468632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALPvAyKfQjtdHFgs68bECM2yVyHmmPwO24e9jJdHfv0=;
        b=YsKZcvKd5tNE5fxDjHorZvC0achjKaOoL/Jco10WjnIzI4JP3cgm4dVDhjo8o9QBys
         YuXJzh8GCMBkVVpBAue48Ow3tKsJxrKSsI+X0GW9r+oTwMVfvZI4IlFcxILxZWuqKmZY
         EVCXcyK4pqEbOAMc1D4ltetj+lL8/8tQE4TYARl/gaVJjNCfW85DvBEkLDDJRUvewjQK
         mMCJAcC1axJnGMmQeh3/EYLjaRmKk0OQdrN4LVSDkgz1qAlqtxtQLXsb4QP1NLdGVzJU
         BExKR+7Kw4NRRKUVXNUu9GqG7T34k55qp5SwxxMpjDj1G5m3ha1I9q0SjF9libNZa9UG
         o1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXhY80DmRYXu72wUATMPL42kqCEthz9k+6vBywxhK7VMX5x4F+thEWqfLqokrGmE7x7kRl7EpfZrqf5Tm9R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nD25tXL/GgvU/b/pD49ca0qxEiqEc7V9nZIQSku03R7g5UQy
	qVqUGOPG4g3Xc2VWuUbekCLpCRlR2ACUVSQrqxWkgxm5G/uWuK9T3iMUQZWfyZ5mWiEmsGmLXYD
	dZeaFmTmfTg3OyBplfMhyY5uE+uhmIgEqqNht2rF4hD/iOLOd0rLd1hRhR38VeApH+14a
X-Gm-Gg: ASbGncvhRFquNkmzqQUj+DlE0kmhiYDuwqpd9OWR4pQhPyvRI5/YgGcXYr2rPidAKpR
	XPboTMFcgAm/xI/Fp15wdnKuonlrx5GmGawXFzkzJj7F2nukd+tcHvPurZPhKsb3W5+Ib5vchr9
	WcZTQT8TY8oUXYdr6Qax8+9qPP98CpyaYyClu5bwdJPF37rOOoJBEzWDg23Z5+sPyP73z+o6N/3
	Le17Z1xuFhuMw1b83fU7D80WQjRa76DDkiM3PqfV13uF0xeFY6yAjO5Y+SOAkxbgP7v1xeEOtwY
	CJ0A9JaTM39+/mUls8D7oUCMXcx4g2UUGEV36pWl4Qad/1NxXR5FzM5/JoJrPKMCcJgbfvauJS4
	4fPZ0FEr2ULG2/aJG12z2dPPNSxtXkOZvIxu0/yhKRg/TkrGDQDn/
X-Received: by 2002:a05:620a:268d:b0:7e2:769a:c857 with SMTP id af79cd13be357-7e34335131amr1702166185a.1.1752863831609;
        Fri, 18 Jul 2025 11:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHElvVFF8dizfyr2Wk3GnhytPZl7LLlYnIUcaoY5rC3+dyUZxZapzDDTomhRW5XbvK70xXqrg==
X-Received: by 2002:a05:620a:268d:b0:7e2:769a:c857 with SMTP id af79cd13be357-7e34335131amr1702161085a.1.1752863831040;
        Fri, 18 Jul 2025 11:37:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d8db4sm2741471fa.74.2025.07.18.11.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 11:37:10 -0700 (PDT)
Date: Fri, 18 Jul 2025 21:37:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <y7xhfbiwkduo3lytb5gbukdu3yptx6uajtbngbspqbqkyt5dzo@gy62zoxwr6ah>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0NyBTYWx0ZWRfX7Nt/MqjSDX1F
 zkWGeGI6wFtyefIptcbeDMPjRzl46fh3epsK2beESqcYkh5blxmoJY13bMSrbRC/kW5654E7gXM
 CEY+IZRY/8+F//qoTy3YC9ommQonHFhZye58GkvUnneLBEjGVdO013ODh1Un3L86nbtube/L16K
 WJ2YMMYf231U7jdJaOuYU0WKBSRW7KNDj2yWNGZXK8NpQcly8bGM6K2Ddgry02mGA2W7XmjIJzk
 P3Sq7FXcNZqH3aqL3LiQ58M+9GRLwH7F7Tb+QG6IGwmVjOj2lKuxsPOFkAnOccHMAPKBmAHzQ2S
 IDKmV9UhvDB2+4CLWea2tymxRYn3uFgGMC3X5JiKXsKTshtMcMGCyEkyPxj1ELM29gsYNXAnG14
 P7SXpCxXqU7utkZysfAoh3LRvbwGoNGCBMhuYHBZce3LNvqD1sT1ZisI7AIiRNKqO5BJOCVt
X-Proofpoint-GUID: fzzwYmT7vz9yoJkFRm_Nwzdb9S_0n3it
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a9458 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vZ9_uWrtemhWx8VJ4wEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fzzwYmT7vz9yoJkFRm_Nwzdb9S_0n3it
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180147

On Thu, Jul 17, 2025 at 06:16:47PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
> 
> Remove the dependency on struct device and introduce support for
> Device Tree (DT) node-based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
>  include/linux/reboot-mode.h       |  2 +-
>  2 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>  
>  #define PREFIX "mode-"
>  
> @@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver
> + * @np: Pointer to device tree node
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
>  {
>  	struct mode_info *info;
>  	struct property *prop;
> -	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
>  	int ret;
>  
> +	if (!np)
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&reboot->head);
>  
>  	for_each_property_of_node(np, prop) {
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
>  
> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
>  		if (!info) {
>  			ret = -ENOMEM;
>  			goto error;
>  		}
>  
>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -				info->mode);
> -			devm_kfree(reboot->dev, info);
> +			pr_err("reboot mode %s without magic number\n", info->mode);
> +			kfree(info);
>  			continue;
>  		}
>  
> @@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		} else if (info->mode[0] == '\0') {
>  			kfree_const(info->mode);
>  			ret = -EINVAL;
> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -				prop->name);
> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>  			goto error;
>  		}
>  
> @@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
>  
>  	unregister_reboot_notifier(&reboot->reboot_notifier);
>  
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {

This feels liks a missing lock.

>  		kfree_const(info->mode);
> +		list_del(&info->list);

list_del should come before kfree, otherwise it's possible to access
freed memory while traversing the list.

> +		kfree(info);
> +	}
>  
>  	return 0;
>  }
> @@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
>  	if (!dr)
>  		return -ENOMEM;
>  
> -	rc = reboot_mode_register(reboot);
> +	rc = reboot_mode_register(reboot, reboot->dev->of_node);
>  	if (rc) {
>  		devres_free(dr);
>  		return rc;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -9,7 +9,7 @@ struct reboot_mode_driver {
>  	struct notifier_block reboot_notifier;
>  };
>  
> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>  int devm_reboot_mode_register(struct device *dev,
>  			      struct reboot_mode_driver *reboot);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

