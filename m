Return-Path: <linux-arm-msm+bounces-81015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22128C46CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 210583ABA8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE28A311951;
	Mon, 10 Nov 2025 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlhyogpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcGHFCyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE271E2307
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780401; cv=none; b=eGH7miz2I/9GotuU/KvqZIEsRU+upzS4znJclTCKYamKXwhM2xxDmNv5RbA5Hz8SrAG6UqrpmqR9Bl+yiuQybdB4L1klh/u6a1ohojgwiNGoxtSxx5Ub901fbMIMzjbjUrkTNoOKv11V1C8sQBLIQyKFFyCCqxzOHXO5gnECXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780401; c=relaxed/simple;
	bh=ljgHEIXiT8lNX5yz8OHOdFA0qZP4dFpfs4KtSrJbNBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY+fgPL/B8h5Lsnsm0k7O8mI9/jtWF1V/M0c+OEfYq4uYY8S+/p6Q16VoTQOkc9Rcd4+5Kr3Y65S+7s/+/r4JZz0ubqgQ6YE6umWOFMePRYbiOcROycKeM1B2rMxlePpcXL6LgmGW2Lv4T29zSOEnKZKnyOEcM6PDtR+dZUPSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlhyogpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcGHFCyI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8UKv51809202
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/kT7i0Ihoctdom4fEH3aWC9a
	n5ybuCaHFYLCL0sop1M=; b=FlhyogpE7wPpN592tW05g7jKvwX48dU36BnsArbo
	vwuM+DvTCbsyQyXMOnhk8hIl+7VM2/x8dRj+k9aXQYjqK2P+9WPGmFwW/eJ02UDx
	Slz4j7iUzzLoAXJewzSwdIl/1Bqdh6cqla34eEAj3BaeEx5UsPbvQPF13LoSv4UT
	mfYIjgb1fnxC2PXn0XzXwLJ+4IFTqTYUsPa93V0H/Ea2gdse2u3cFYMY8evaI6WH
	vozDMotMQhU+ND8/FZy4KZbbRI2jIL45MzInikjFuAPGiQFBKbbKZK25GnzgyG+q
	QTA3cF+4IAWasD9McpPnHZy1hxmMd0OstzQTnhhm8kguFw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1hya1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:13:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5533921eb2so2428410a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780398; x=1763385198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kT7i0Ihoctdom4fEH3aWC9an5ybuCaHFYLCL0sop1M=;
        b=DcGHFCyImmCwhsAqm1ty9yqKfFpAX+/CrTiUaNx2AQOhWDkh1pZHhAZ72qRVEV310f
         bW+6zK26Aal4clZjSqosgzbOAaaTDBMu+HbVN4hUFsOFzAtz6qX7N49OIi2kxrxtqypY
         hh8Z1fqxvVn/8O5iuBl+5QuK/8ySTYfOefodXggfj0596vhxKz0vtzFt/i1B/MSMEhQ3
         gWjDSilL2DYqkhudl9oj89yt2DojRr/8WikWijtnqh8DS0kWdYYGMmwzUvyzaYLvkMBo
         vkqAcY5mIAfwKlivvyd0hBSdrzxXVuKLQb3DYW8GqTCnXRQWbK2JAzf4U6cNKIofgaDC
         mfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780398; x=1763385198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kT7i0Ihoctdom4fEH3aWC9an5ybuCaHFYLCL0sop1M=;
        b=NxXo4MqYHSkKZsarJLRkV7Gy1fJCYeWq8no1p1yBzgCAHnZoNgoEslGsyumV7wptmx
         AEQoSIDTdVAlr4llg0317lILMIetYTy5ht+klgdWuzUD/Yt6CXbqg/ePyYFTfDIv6JtW
         h5I9iwnvH3V7+w0c2wvFMUqYwnLONkIbk6ZQUTbDD7C8tdd2Q4ahJEAa4FhxmYvkMEbk
         552sPnP6r2r2tUEzsuv2E822AcE6Lw5CetDt09Ig4fVppB5/31iExQ3as/YweJ0jTYyS
         hH9xM0ZyVUQ/Zy3ywR6l0d3ED5s8DLxmD4HhzTs+pw4lrZR29HrLdkupMnpglesu5i1b
         9xgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKkrbkZSTivJhSEcdKJjrhAtXVaV5/msm0SSNgtWaiBWJYIzw3qvxNMY0CjBHJ/9rpSk6lgELEmokKNq2r@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqIcW4UtmZhoq/2CwdXatk5eXTnhDLEkoAPf78PYQlHEc//lv
	H3qzXa0x0dJMmWoJtgNR0oxXSAKcfWCnFxpqFYIh5/AeXvGrQG1RR8wzrORwYeRhzMlXCNny6GP
	Fm0yN/US9X3VcsbQQH3uihe6WoNx+RPcaloxbWThFhXJXwt9cDVz4x2jfqf7hhUBraiGr
X-Gm-Gg: ASbGncv4Muj3CmuB8eGv5kKavr/Fm1E7X3n4kUb8Z7/JsqcoljHtpeGQ28+W1SM0oUC
	Dii4CHjnWXi0qOvzCDEiMOq8KKqqEQx565InWvGse7YmDKsQQotja5IfkL+bdra7wZbD63eCU/j
	/UGauynCc5AE4Nd997GDXEu8ciY7RvZC+Wh5CE7T7e+aHdRa2Ic5FTMsF+L/lyK7ELiUJ78ZVzk
	24plbQjXY54hghRpz4qOkX4oHgye2lbsO+l6lVCtEsbq57ut0M5zTYHcPt7AdzGhdWgC2EUFZGq
	dTaPMN8WDQuAndiyVVHI64oi9zlElpfY5L2oFNVa6RbjXE3g5+iain3kCJ6YuEEOQuRsPqw6u5s
	4/Ncwy+FQZS+L+9uvZ8aSO8aWcw==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id d9443c01a7336-297e56be50emr104174275ad.36.1762780398139;
        Mon, 10 Nov 2025 05:13:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHdjyokKySSYFRDdg05Amagw35XW8iq6WQtEkFKbKQOAtN9Zb/7lC1J+9iBU/Vh4YTanV4hg==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id d9443c01a7336-297e56be50emr104173615ad.36.1762780397386;
        Mon, 10 Nov 2025 05:13:17 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297dfcbe798sm82980845ad.19.2025.11.10.05.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:13:17 -0800 (PST)
Date: Mon, 10 Nov 2025 18:43:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v17 02/12] power: reset: reboot-mode: Add firmware node
 based registration
Message-ID: <20251110131306.tkrsfqeh6oa7ql2c@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNSBTYWx0ZWRfX4NYojLw/+lJK
 o/40rGjVi1uk18+nPFk0yTy7ZBs1yAl1n8dO1uKnzGeG8Do1k121BlDVyIZ+fJTy/vOe8Rf2xlO
 KBAfoiXwI+fo+QeVXOsgxtsjPATk0npYF9LKEYSOUsUI+mUxc7XLeO1P111lxhzIx8o/B7kKRVo
 Kg95lDkoTfv4qogbPFSe0XKfkcmqhr7GLLNk3fkrMzm5z7ObOu/8fXYq7GbZuf0vKZJZ5sAM8gx
 j71k5E9VlMFIkl0YAGZj/IbDMKdlWnnBQRU28j344Ormhm7lM9G1G1uumo55C9dTRQcxlKhc/6k
 bQgHrwKn0SI0kGIauDP2BmxRk6CTxnScKltAdWtRnMCFec1uzl9mZ7XXJT9DTku/wluO37fW7Eh
 JfnMreGNHaDkQgyw+ZM8ga/nzH7fag==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911e4ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JCwNVC6uTNxX--Ynj-UA:9
 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 2QQBOXwriwIc2uQAcInB1C0DFYevHwA8
X-Proofpoint-GUID: 2QQBOXwriwIc2uQAcInB1C0DFYevHwA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100115

On Sun, Nov 09, 2025 at 08:07:15PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties.
> 
> Remove the dependency on struct device and introduce support for
> firmware node (fwnode) based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 19 ++++++++++++++++---
>  include/linux/reboot-mode.h       |  4 +++-
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index ac4223794083f36960b2bd37a601b7e1f1872de5..eff60d6e04df2cb84ba59d38512654336f272f8a 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -8,10 +8,12 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>

nit: Looks like stray change and belongs to other patch

>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>  
>  #define PREFIX "mode-"
>  
> @@ -67,18 +69,26 @@ static int reboot_mode_notify(struct notifier_block *this,
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver
> + * @fwnode: Firmware node with reboot-mode configuration
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
>  {
>  	struct mode_info *info;
>  	struct mode_info *next;
> +	struct device_node *np;
>  	struct property *prop;
> -	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
>  	int ret;
>  
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	np = to_of_node(fwnode);
> +	if (!np)
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&reboot->head);
>  
>  	for_each_property_of_node(np, prop) {
> @@ -168,11 +178,14 @@ int devm_reboot_mode_register(struct device *dev,
>  	struct reboot_mode_driver **dr;
>  	int rc;
>  
> +	if (!reboot->dev || !reboot->dev->of_node)
> +		return -EINVAL;
> +
>  	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
>  	if (!dr)
>  		return -ENOMEM;
>  
> -	rc = reboot_mode_register(reboot);
> +	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
>  	if (rc) {
>  		devres_free(dr);
>  		return rc;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..22f707ade4ba93592823ea8718d467dbfc5ffd7c 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,6 +2,8 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
>  
> +#include <linux/fwnode.h>
> +
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> @@ -9,7 +11,7 @@ struct reboot_mode_driver {
>  	struct notifier_block reboot_notifier;
>  };
>  
> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>  int devm_reboot_mode_register(struct device *dev,
>  			      struct reboot_mode_driver *reboot);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

