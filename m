Return-Path: <linux-arm-msm+bounces-77638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB4EBE554E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9733B188560A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F892DBF49;
	Thu, 16 Oct 2025 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9b7Ms4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E614F112
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645559; cv=none; b=XuieVlS+G3xLVBQdcB4kPrLI2FeypMppjelMoFtwVvU8d58baTluGA69jbo4Ju9tQ0o+pVftdSue1iXUjZl35xNowdvkSozmSxxmunsEtMlh17Y3SDug2V3mDnerOEiH0bWhi48hFkhgBchgwC28/EgB1vC3sktOsoQ7q5uldjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645559; c=relaxed/simple;
	bh=Yc2rquSHNMuc1rfF+Wxo10/YY4Xo8KeVQbhx60ECIFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QD/yrECwRXHWCd7GDoxLE6sQZoOuNouJjdDKWzeLOYw6vI2YMuVM0WvRtD8SJ3OpXTGXibN8W2+wWjwSyLxFMB4UkvBzlwz28qxOqi+pWaB8xXBVKt27NEianzHI3jPyE62Fg7MrVYEIDhm4vYdH5FbiBGLseIIReK0uBlwnkMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9b7Ms4e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GFZFcG017408
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rejfN56i3rrzjApXLDYPUwGP
	UcfTw/rwEpayOvgqk+o=; b=V9b7Ms4elLH2vsKIynD39CNPVY23imAm6pnZxSZ6
	w6B68lYA7KolqhutrlwAGdYLIk6anj1Y0JV7icdl9ocbg6p04vCiFm5jTWH3NqQ4
	WO3R9KdxTuNKRYQf9LRZV7ZnI4ODCYM6Cl2G8AdGhprqywBib3t9U+Ufdj/esjgQ
	Sb7lt1TYqN3nRzblFQyi75BhxuviyHDs/IbQRarSRR+VgyNPzaed/L+UgtfIgLLH
	BnYYGJXancgmkSmf3ewOyO+Bs43KVbaY+jm6ump1+sxDZBBZLf/mhASB4pkvw3JJ
	JlUOQ1MkjNfL467rCoyvH0TTOuLNPiL3QadJwWZ+VPzPPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkhkwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:12:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8589058c6d1so191467585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645556; x=1761250356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rejfN56i3rrzjApXLDYPUwGPUcfTw/rwEpayOvgqk+o=;
        b=SrHFEAQ58XqQMbA55OgnEy/Wekd4vSJG2NVX+VgY0fMI5MKSwSDz12MJ5HRa/45RGM
         Q8Xez//oDL0cqqnQH46uWnuvGeMrrHosbPLhq2rUMGVo2Uk+I4v8H84sv46cY9thV96M
         yqLkz3QxIJRc6ltRAaQ4ttp/kO6YXoryNLiAvzFmenQhSXBfcFpCWQ0XqA0xB/pK2IAy
         CePIv938RnRTbyuhr91g0JWe9Ee/QA0ZjkDHQKFm4qMLQzSZ5z/32FCxPuJqge5NC/iZ
         ehlT3vJ1HkkHvfiEvlcqky+oysxVRw2WbCwsTADDKNVsJa4mZaIux59rZVVj6UZj938A
         KrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpRS7SEdFcbAv7CrOLnsHh99K4dzyV9K1w4q8F/IjBwIwq3FBXx7ti3wlM/pnvTi8wPoW27mxrSZfIqRhm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2u1987JRnHexE++LfDzlj8C04MT1W7Vy41TKWJetdrjJKFazM
	h90A21AvZhwx8f+ysgH/dl/iV35VRCt3Wnx8WzH28l8d83BLbN13jZtyJyzeABS/JU0XCU9UJBf
	XJnGKVxUowjbIt1Yg14TcYvBVxXhzt14RxlrWqi5gdnKgd7lOrKM6uPIAKERq39yWn1bV
X-Gm-Gg: ASbGncvEQ5sRP5Rx9dtE8vrB/FVrs80Uu7rEyvVAGaxfPAEAAfixK7Xu2QEmgoLqE0t
	C+dpuFHCEIkVHF0JoyylwKAdYiwYneDJzYUhXyiEBJbwhq3Wy9o27OrtREojRm45lYU88W6KFaW
	JocH5bp0EGWmpG8jOS6xZy3v5ZAVdQ2noDPwK4FY3N9M4aOIdx6fGOs5OwO34Bioa9U9KUwvCDg
	En6MMzhZpMLauer8PhKn/cg5KxYu2ErVo2qemkLX5a0lxU7Yc/uNy/zMP4TtqwgOfecZy/JubfU
	A7NJge5Q/ShZmpC3NjfwswOvy+dtb77XX9q1X3stciB6U9NADVNOO2K/CJvGjHUsyCbMOoFTan5
	qwgRcr8xwxiAzX4iYZtoxBFEUf8MJVL84S4i73bdDS2PGAeESn4osLam3EYS2lIuQQXoR0l9Qf+
	f2gMVVshJ2vEA=
X-Received: by 2002:a05:622a:312:b0:4e7:22c3:2f2a with SMTP id d75a77b69052e-4e89d3f374cmr20498661cf.76.1760645555953;
        Thu, 16 Oct 2025 13:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO5U0g7kRZ1LMCajGgW2ZKcTweTmabQ+ZEUOuyqtJjtkCMrjBTPjj6nQiRD8cUh2pksrXuYQ==
X-Received: by 2002:a05:622a:312:b0:4e7:22c3:2f2a with SMTP id d75a77b69052e-4e89d3f374cmr20498221cf.76.1760645555357;
        Thu, 16 Oct 2025 13:12:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e21sm7292388e87.2.2025.10.16.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:12:34 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:12:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <didkbltadu4ql6xcqtjrtf2iguody5bgy6mqlwtbyfgbambaii@mzofzymnfbju>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
X-Proofpoint-ORIG-GUID: MDVxvK7gWt2plRWmGHayKdA-L4-PIYnk
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f151b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=JZHlp33AlScNdFJXQgwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: MDVxvK7gWt2plRWmGHayKdA-L4-PIYnk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9bpyx6M5t9Hu
 II/Rar+D85f9zpreBpX8alS8cuP6A6cob7Yd0Swuk1tvsz9+ubMYBYOYhW9xwRON10momk0fIji
 TnWyNf/KaTHMpawMoTh+Q5P4On/w2m8KwXeU1De/23R/iXoGDjPJX1lyKQkrBBKVdSluB68qs/7
 Vvtzyqa34VNBLEnBuPWadWkVk+i6oULhQ84cOlODXcj3sYYPyjRjM8n//Qs7wZMX729V4ENTev3
 GLwfdrZT6JSh1dZvdx9AkL+bYNxMmOYlFRDglif15cAtHWq7y9l0JuZvFM+nEXuxsu5CvwLtQbL
 o1uSRocmWVEKmiAmJAeS2eZL2VwWgfbxZzZAGAJj2K/YVqU3adjnlPb7gJN/Tzfdz5Hnc2EpDOn
 CfK6FfrSFdlq3+GeGkq9ibxL8F44pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Thu, Oct 16, 2025 at 06:16:59PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> by OnePlus 6T device-tree.
> The reason is because DDIC itself without knowing the panel type used
> with it will not give the driver enough information about the panel used,
> as the panel cannot be autodetected.
> While would be more practical to support the original compatible,
> I would like to avoid it, to prevent confusing devs upstreaming DDICs.
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
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 399 +++++++++++++++++++++++
>  4 files changed, 414 insertions(+)
> 
> +
> +static const struct drm_display_mode ams641rw_mode = {
> +	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 72,
> +	.hsync_end = 1080 + 72 + 16,
> +	.htotal = 1080 + 72 + 16 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 32,
> +	.vsync_end = 2340 + 32 + 4,
> +	.vtotal = 2340 + 32 + 4 + 18,
> +	.width_mm = 68,
> +	.height_mm = 145,
> +};
> +
> +static int s6e3fc2x01_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &ams641rw_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);

drm_connector_helper_get_modes_fixed()

> +
> +	return 1;
> +}
> +
> +
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	/* samsung,s6e3fc2x01 will default to the AMS641RW mode (legacy) */
> +	{ .compatible = "samsung,s6e3fc2x01", .data = &ams641rw_mode },

Is there a need to probide this kind of legacy?

> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +

-- 
With best wishes
Dmitry

