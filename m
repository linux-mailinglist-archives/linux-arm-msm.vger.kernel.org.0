Return-Path: <linux-arm-msm+bounces-65825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE9B0B7B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 20:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299791899339
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 18:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D776D221FC0;
	Sun, 20 Jul 2025 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKjn9yuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C859221DA8
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753037040; cv=none; b=pN97YsXWgeia+ldYloccyMK+SWsu8yRfTw54+8AYx25v2A1IOWZKzph4YCSwut0TZF2i8uaDUeiRACXc4MfsNon9uEovQl28g1/jsi3w2Q4Chumr5BUNfDhBw7zKY7YmBc/AyeoOGihfh7FbrgjRn2rernDmaCTHVhFNCG0AGV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753037040; c=relaxed/simple;
	bh=Dtnj65qGAU/bEcaBcIJGLO5spuU0SWL74QmsOuDmy2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syCGg0hN6Vz/q6r8mPpRnu9C/gah5zKRdj4gWbOM0N75QxyP8MvyZwK2pXRvxS6hz2WYXbJY2bv+rcNbXV1mKAYB0tJolcvlaDP0OHGsqBCj9IkahwHOoz+VwvN//S6IVwVnYCKVQi9ToAk5azUpOSHnIc3X3oUKjkxaQSJ4QS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKjn9yuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KFe8MG006858
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 18:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7DGjbmN9sPVvKAeVUnrmEAYM
	XlcKkrf96eMlLVCBSP8=; b=YKjn9yuCwhTXrwZmhQAlmdmkiMhJwCC3zO19Pqes
	fm5b1b8PrWR3WgOyoteZO8pn8s96wQMWh9YExZHY4P5knYn2N+wCNZZePBdGdW32
	lPmEteEpb2XCQkIBu7tXJSzWI/skpYItlzUje7st0v//pSi14AGgXSKYmeOCxMwv
	DBt5rjE72KAjyB4fQAHUsJWTcF+I348ot7YtMGGhuM94OyHsL3vaosCCT6XYjDrv
	UNoTtKw+r9adxaRvekTw2H1d3sk5hQlTQcjyNQYhxGw+NFYEqMT7ZzTWxy0uf08K
	juBZWBJEyKC5LebRNNHJMDVIVuqO8GQJjZWcd0VpnmSpjw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v2jsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 18:43:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e32b9398e4so488821985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 11:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753037037; x=1753641837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DGjbmN9sPVvKAeVUnrmEAYMXlcKkrf96eMlLVCBSP8=;
        b=FviNfA6lCKJbazAOnhzy2o3gCDPK7nLMeE6z/WMyhsi/n4rp6i+EyF5DxvE/0SeaG1
         GTaVtRvGkdNYS4r5uUGpLsk7irRhxub6hlmceRWAhPK3yPB2BtNATC61W3ruWDHSXVdn
         KyjEOB9Ks83TulKweCZsDGbvLk5lRLFNjQaRHUox2w2X6aCjQlNjBIqn+3VQ0M8rqZri
         A/dcVO7E1ferRdx1BkTgnGjA7QiueeVrQAx9mYRQ9tQZSD+TvxeYr6einna89GByIFAt
         gQ+Kv96RmmiTUimqUbls3ItpIvLqXKo9Vb/gOOm0DJ52oAYAfsBmMv5Rjs05lr9VNMcL
         WaYw==
X-Forwarded-Encrypted: i=1; AJvYcCW4KO0vw2BPn5r9oTsvu45jw3QrSkdOUbxA4858iOMx2kPdz+ykj9qEWkmp6jBvrhIEZ25SzDezZEI37gsW@vger.kernel.org
X-Gm-Message-State: AOJu0YweGoZoQpc1jWKSe03djSxoUVtoW7kFFzF1lEH8T8MypNv0JsXu
	vITI6qR5UqmWfiDmcQhWDLYB7Z78eZ3Dd1rKEFss6wMhMOC20lX3x+UEnzKC4HcDrUYR4IVXjhF
	xk4fwTT7fjli73bygcURi179JXG5CME+2b4HZrh4tdIfWWAHILnLydCLGwHbu+a+UkG+H
X-Gm-Gg: ASbGnctciOWfeM4MUfcAWNxuNf43bgs5T7d0XhjGYVcCV6dxjZEloEMRKCnbPWJvH2g
	sgq1bWRO8foARJxLGgF8HS0oeCwXFgmvaFlkFhN+2lFvZhGX8BDhIpMpaUwZBjkiKhxAQHMTvSz
	j35Su0tziqZcYVBK9z/LP2ojXOEmHnVW4p0R8p/L1ugEkIbWQ0Y51xbni1UxE77RAVt4MpdcuF1
	yGw6wp9rTUYpNM/aSWLqZxN5miv6aj91/xen80dkPwGcU7srJh4fBnrNYMMUM5cWdJXhW3leo7v
	puNWrbZLYeEKLzfU8KQa+HV6FKkEL8NHIF4Wlxu+X5zvqxFk80WDhRN2VVu3+XckDocdna8siR2
	QqKsCVSrSPxG7DjxdcPalKFh0o7oG00vcy23MzJhSerdnDWPQ6+qo
X-Received: by 2002:a05:620a:28c6:b0:7e2:b955:c2f8 with SMTP id af79cd13be357-7e343615de3mr2383895885a.41.1753037036653;
        Sun, 20 Jul 2025 11:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKbzT9Pz+u7y26dS37ikzmepswmyTtfuYp7Ru3WXjYRaeG4jYtpnsywS5C/gVypdLhcPj5dA==
X-Received: by 2002:a05:620a:28c6:b0:7e2:b955:c2f8 with SMTP id af79cd13be357-7e343615de3mr2383892985a.41.1753037036107;
        Sun, 20 Jul 2025 11:43:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d911c9sm1220334e87.147.2025.07.20.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:43:53 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:43:52 +0300
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
Message-ID: <ciaouxjcluhxj4hi24ajc4yr3r4xwqd36donieazxood23hcne@sjmwbabkdeuq>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
 <y7xhfbiwkduo3lytb5gbukdu3yptx6uajtbngbspqbqkyt5dzo@gy62zoxwr6ah>
 <54eaf8e8-2b4d-b0bd-b65f-1262e72a54dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54eaf8e8-2b4d-b0bd-b65f-1262e72a54dd@oss.qualcomm.com>
X-Proofpoint-GUID: w84T9Zj_bplsw1U3bh5-YvckfJjDrdRH
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687d38ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=s3nfzRnEEBKEZTuRKrAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE4MCBTYWx0ZWRfX2US9Xt5OpbW1
 6qA3j5y4VxjfaaR9xG3whs7zb749X/urUQB/spSlimUC4ZFoAdw/C+aXTbyL52hP0r6ntZkKAi0
 zsUqHK61EMZiwCHH8i74T14/KBn/iiIWKdH0SVDfuRxrSH/HkFjvoj8LS1ZPXESDtjDu3pPUMCK
 tiovhoEVM3yxtOb0yZZgitCW1/VlUBeJw8vnMPmbHEKETBQD0l5Jgc3Jkyd2L8s/OjBAGc6dCoS
 nC/ANhpT0BgFDUN//pqfEsn+iwxHjgKPW+u9tTxgsIqkNixZfCjqDvbXMncFJsbxw0oEhLfBHHM
 +TpV0h2TOOJctipEB+9LkPv7fXR87UQDqondLMjEJfwSyTvPdnBlog5CHhmTuoaREStH9zfHy8k
 Aze1yQQQ+pHYrkUO/Jo6iLms/cPF/KA6VYiyZbMXGnEUMeXNeGM8Q+k8cAhkaAuVFMK9SvuO
X-Proofpoint-ORIG-GUID: w84T9Zj_bplsw1U3bh5-YvckfJjDrdRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200180

On Sat, Jul 19, 2025 at 09:05:16PM +0530, Shivendra Pratap wrote:
> 
> 
> On 7/19/2025 12:07 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 17, 2025 at 06:16:47PM +0530, Shivendra Pratap wrote:
> >> The reboot-mode driver does not have a strict requirement for
> >> device-based registration. It primarily uses the device's of_node
> >> to read mode-<cmd> properties and the device pointer for logging.
> >>
> >> Remove the dependency on struct device and introduce support for
> >> Device Tree (DT) node-based registration. This enables drivers
> >> that are not associated with a struct device to leverage the
> >> reboot-mode framework.
> >>
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> >>  drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
> >>  include/linux/reboot-mode.h       |  2 +-
> >>  2 files changed, 20 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> >> index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
> >> --- a/drivers/power/reset/reboot-mode.c
> >> +++ b/drivers/power/reset/reboot-mode.c
> >> @@ -3,13 +3,17 @@
> >>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
> >>   */
> >>  
> >> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> >> +
> >>  #include <linux/device.h>
> >>  #include <linux/init.h>
> >>  #include <linux/kernel.h>
> >> +#include <linux/list.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of.h>
> >>  #include <linux/reboot.h>
> >>  #include <linux/reboot-mode.h>
> >> +#include <linux/slab.h>
> >>  
> >>  #define PREFIX "mode-"
> >>  
> >> @@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
> >>  /**
> >>   * reboot_mode_register - register a reboot mode driver
> >>   * @reboot: reboot mode driver
> >> + * @np: Pointer to device tree node
> >>   *
> >>   * Returns: 0 on success or a negative error code on failure.
> >>   */
> >> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> >> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
> >>  {
> >>  	struct mode_info *info;
> >>  	struct property *prop;
> >> -	struct device_node *np = reboot->dev->of_node;
> >>  	size_t len = strlen(PREFIX);
> >>  	int ret;
> >>  
> >> +	if (!np)
> >> +		return -EINVAL;
> >> +
> >>  	INIT_LIST_HEAD(&reboot->head);
> >>  
> >>  	for_each_property_of_node(np, prop) {
> >>  		if (strncmp(prop->name, PREFIX, len))
> >>  			continue;
> >>  
> >> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> >> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
> >>  		if (!info) {
> >>  			ret = -ENOMEM;
> >>  			goto error;
> >>  		}
> >>  
> >>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
> >> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> >> -				info->mode);
> >> -			devm_kfree(reboot->dev, info);
> >> +			pr_err("reboot mode %s without magic number\n", info->mode);
> >> +			kfree(info);
> >>  			continue;
> >>  		}
> >>  
> >> @@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
> >>  		} else if (info->mode[0] == '\0') {
> >>  			kfree_const(info->mode);
> >>  			ret = -EINVAL;
> >> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> >> -				prop->name);
> >> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
> >>  			goto error;
> >>  		}
> >>  
> >> @@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
> >>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
> >>  {
> >>  	struct mode_info *info;
> >> +	struct mode_info *next;
> >>  
> >>  	unregister_reboot_notifier(&reboot->reboot_notifier);
> >>  
> >> -	list_for_each_entry(info, &reboot->head, list)
> >> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> > 
> > This feels liks a missing lock.
> Should we add a lock here? The list will mostly be fully created only
> once at the time of registration.

Does it matter? The code should be correct. List traversal should be
protected by the lock in all the cases.

> - thanks.
> > 
> >>  		kfree_const(info->mode);
> >> +		list_del(&info->list);
> > 
> > list_del should come before kfree, otherwise it's possible to access
> > freed memory while traversing the list.
> sure. will make it list_del(&info->list) and then kfree_const(info->mode).
> - thanks.
> > 
> >> +		kfree(info);
> >> +	}
> >>  
> >>  	return 0;
> >>  }
> >> @@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
> >>  	if (!dr)
> >>  		return -ENOMEM;
> >>  
> >> -	rc = reboot_mode_register(reboot);
> >> +	rc = reboot_mode_register(reboot, reboot->dev->of_node);
> >>  	if (rc) {
> >>  		devres_free(dr);
> >>  		return rc;
> >> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> >> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
> >> --- a/include/linux/reboot-mode.h
> >> +++ b/include/linux/reboot-mode.h
> >> @@ -9,7 +9,7 @@ struct reboot_mode_driver {
> >>  	struct notifier_block reboot_notifier;
> >>  };
> >>  
> >> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> >> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
> >>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
> >>  int devm_reboot_mode_register(struct device *dev,
> >>  			      struct reboot_mode_driver *reboot);
> >>
> >> -- 
> >> 2.34.1
> >>
> > 

-- 
With best wishes
Dmitry

