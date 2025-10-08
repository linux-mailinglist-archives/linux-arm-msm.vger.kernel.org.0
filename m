Return-Path: <linux-arm-msm+bounces-76491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C14BC6649
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B55FC4ED604
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385242C11FC;
	Wed,  8 Oct 2025 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPKn5zfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C22C11E2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949965; cv=none; b=APL6Atkk2zL2dCB5woJtog6v+6uIRtmlE4GPA2TW0o+IfcYk4VEIFMS3KiVs/sHyyFngd97XJNU8pzK4sZ1le7np1/Ft3MO7Tqzyis4PulsoLZsGBvphzrUuII0YNnsmyulu3ZWFYTPcjLnZBK54ltVlFKCLvJ6cMdTjJzWpkfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949965; c=relaxed/simple;
	bh=pkKqRsIwDhc+RUJiMdhK9GH1Pl3ZLZDY4dZbArFqFqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/n7j/qioeG6O8aeDwFObw93NTYgA2DPIdfR99ZblW0X162+fug9XDqF8/pFM0AJ9/8Tla5g7zcOaO9KGpeU4WbWvepRdcFNzYq236vg9cvjml66OM7EN1JYqT9Lk8F7i3eDVJF+koU6GSBqd32xm3KbyhDDDjH5KPvJL4rwWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPKn5zfy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5LEo014389
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0UdkETRPI6ZWbVUbfsUgaXMe
	BnN/d50E+m0AcvlG3Bk=; b=aPKn5zfyCDXgHyxBiNSZBLkmEvt47oUi2RWDinGN
	uQyvvHaFX7LMl4N+6Xg7E0U3ZeVF21BWfHPP8/CZu+uu5h34dEKRoIbzQB8J0TiE
	DvOiVboPksV3SiAiPr6QtYJTignIEKkUErz5spHye4nfnnfOqKUBBAQoGQyTMiD3
	ZI4+mGUQUxc6mOcJVvXDWreZvdia3EDeMCn4p3gz5nnLqZMjoF+PwYiZKnDaCdDW
	hHwXINXjJlzCADrcoRbbyK468HCH703v1rkrq2SgJvhihFsk28r0YhAFs2+8Iok1
	tSkAzrPEffpnZnS+t63g3pd0//gAPGz7VU8cmZOD8FpGTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u0aew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:59:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d77ae03937so4748201cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949960; x=1760554760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UdkETRPI6ZWbVUbfsUgaXMeBnN/d50E+m0AcvlG3Bk=;
        b=dr7pCCfJvZPmgbrOg96AJFrx/0Iuho2Al5g9PUD2/rgDJViOeJMWg/2aXrTdMqm7q+
         qfQCginwZcoNYbhwjYLUsygKorrmB3QLMyrDlTGfb5rFlG3t9to1qYHUWiXw+RUqIXDb
         wCRJ5a+QBTphmAOp+VjVccKHYVUJqJ+c6fBINAMG+WTZZg7nT7MMzB5RR8QCJbVVhlAw
         aYaV5Zzjokpbd7/q3k5e7RrouftFpobWWLQSasLc7eKZEq7GlMDS8ItExUV7GVozkgeL
         SvHq+V3XtNrOPOJKxqSxNMCujEwiAep8/eJUOcHPTPN2/JAmEOYfCg75ShgCmtY6cfdP
         8FvA==
X-Forwarded-Encrypted: i=1; AJvYcCUpUF7078j9mZ+SEzSjJCFfKg2TB/PNE6NIeFHdSSxZT33/gNp4TSogk73180DlTwjn4eYwIS6dLFyFLbCs@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpNEwS9/HnAYB2YmFDsMxjXh6OSKE8FNevtS+dwbT0V7ZHao3
	Q22+iPg4gkUIhBYNfmm2CnmrGo1pj3uQe/yisFfeX9rJoGoVPJi/Y842tTql2ycTwuhtx7fbBS+
	RfbqCjlywBK+YdowQM8YBLGj56t4EW/n+bEU0I9cB9NgDjNBZZnCh45EsF1fIsHIPs5jP
X-Gm-Gg: ASbGncuiy7jtOjg7cxxxEieE8wr2x/yFkGyYy47Yj8dfRF3yZBkre9HrEPPDoWQxD7i
	Kq9SOgEVIPp0oG+Z1e+ZAPOHNMSNX8YDYcpor9ZyTPuOG2hRYEXHnj2F00F2FhUhAW8qCDqYALe
	h6zLeHiVD5U6s0NOm8HxMWbp9a1Em4ECsr4YSTbO6JQpfDc/M3rM4R7CDk4DmkRv2l9furB7Uqf
	cIC6y29UyEZN4B0y09ZK57+mmWl1cdH29IHN5w1cHe0YsW8uKMKOkxaLqwgrcT346fyqPDiQxQE
	spQOseswrs+UjLni+1y3Upjq3bDpTefwb/sZIVLrkCagJv0rWmCbfqIaGZXKJ5kBVYmtz04eKgP
	wb0vT2hKBrVXAduLG9YT7lvHlffcp+xr2o2/Nt+RmFsfH1n8BA4r3fqHYtQ==
X-Received: by 2002:a05:622a:1b24:b0:4e3:970:661a with SMTP id d75a77b69052e-4e6ead91fe2mr67087871cf.75.1759949960530;
        Wed, 08 Oct 2025 11:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXzhWAKXAgn1FOnUImvO0Ih0s0vnFPkEOMy8MA4cgd7lRzHdrWt6cw5JjIrgIzgwo4fpdJg==
X-Received: by 2002:a05:622a:1b24:b0:4e3:970:661a with SMTP id d75a77b69052e-4e6ead91fe2mr67087441cf.75.1759949960070;
        Wed, 08 Oct 2025 11:59:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00be6sm263748e87.23.2025.10.08.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:59:19 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:59:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <6yp5udhm2g42basxeyjnn3onfons2k2besxfqwemnqrafsai6q@tfr74bfz7s7t>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e6b489 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8 a=SYGtE8pA4Zq6nJvkfUIA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=MZguhEFr_PtxzKXayD1K:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: LBjNKBgNhzcZHEdL8648GFQCu0N4Q5c6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1v496KGiAOce
 hpfV92vU7x+Mnq7JA0olxPh1twnrw6cheR6RZlOvM4BDH+43OXRRWN3lHgC7czwgPVvwhwadVMI
 a2fu8BiqHvMbKFh893ZJPIVeVoGOi8/WDt2YDbgNaLMaf++vw+FXd4Mp5V6WnRGae5qBUccRP7v
 W9G2AZGUcq9QW3tOD7PffXm6Ppue0TAXiEIvT1RBwtJaqgiu6EEimK9PNQbsYmkfWncVCKSa9aB
 BFdfXkPafBEGJVydEG89n23cAHy/AU73PU+jaxVRwxQU5HW3KNFRK/Kso9s5Y5Q28upI33mc/DK
 7q6im96uPUlydRB73q2JfrFRp/ipSIVry6ZFsesZJ01QTOP+KV+iYmYT/N/V6zoDzI+0dsZZtqk
 myfhlzWqUu3oFqiBUnlenO4uDj7IGw==
X-Proofpoint-ORIG-GUID: LBjNKBgNhzcZHEdL8648GFQCu0N4Q5c6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 04:05:32PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  MAINTAINERS                                      |   1 +
>  drivers/gpu/drm/panel/Kconfig                    |  13 +
>  drivers/gpu/drm/panel/Makefile                   |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 402 +++++++++++++++++++++++
>  4 files changed, 417 insertions(+)
> 
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },

Again, why can't we use defined compatible here?

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +
> +static struct mipi_dsi_driver s6e3fc2x01_driver = {
> +	.probe = s6e3fc2x01_probe,
> +	.remove = s6e3fc2x01_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e3fc2x01",
> +		.of_match_table = s6e3fc2x01_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3fc2x01_driver);
> +
> +MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FC2X01 DDIC");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

