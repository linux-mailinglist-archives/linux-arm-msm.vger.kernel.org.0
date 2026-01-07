Return-Path: <linux-arm-msm+bounces-87894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D3CFE13E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99726300251A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7059E327C09;
	Wed,  7 Jan 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG3/1cJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwItux6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FC31B81C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792108; cv=none; b=N4YJnyygFgz57AtiAmSRJXwqe6nyMNSxSSlnVSWUf9rsxnaIWsyw9O9zGc4LdGZVrPa1TkVCpRjtSu6WXrlb/b8loMjbgPsPJCCRmb95wPuDonxgnnIB61DNmAzn4g1U36HYZ0uzY6PamHgTbMAOJJ6/u/zLene+gSfN9h2030c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792108; c=relaxed/simple;
	bh=4bqClnwejNRr2RjR96oVIn3k16CgqSCqqMFStdfbhtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX4QLUoQLOtiSXnwdYgaQLSVhFi9onuRBxfW+v93XCt/9/PEzor0EYhGbVrBOfDnKry7RMl9H1N/1lLJO2/HpF52gxbt+J4BnARqve1z8VFxuq066AQFcJRLJSXPyvRvJ9tVQpDWQj8ElDXqDqGEzEA2fiak7WJO3xc3yL7Mht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG3/1cJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwItux6a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dpad2593277
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=js9vOdGwDOtrz/HNGFuhKMtQ
	9O5QjU14j2FRmChcdtk=; b=kG3/1cJ1P7ELpcYi4U9ELqLxZVjt72LrO+o8b368
	fi93VpPDiEfi+45Q2CtKwzWuPFKqWY+Mh2EiPw5vd8Vpm2XRAuWkxK31fv+YNbrk
	OSJ4rpTVpu9hHJ7SkXwiYFRpfkTeY9luQTuQ2KYP2RGa+UHizmcikgcC/Zs/WuwF
	kfShAdfmGYD4ImRzKeBScibWpKKQLsGDz07GG52n2IAAbm5UrKb3Ois9v/A5PYBF
	mcHPsICzCwQTnNNr+3AxzepT3h5cb29NlRt3Z5jjNDBDNULEmobYyiKrsOtWKWt+
	IOpcqT84fcn771H2LtNgspTmUV0Pw4g90RXS66kMNU24Dg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn290mh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 13:21:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f5265a39dso3127941241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767792105; x=1768396905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=FwItux6aUBOuNL47Wm5HJ8cpIXUAaTpr/7jyyB7PNrOEcZ0P6jqFKUqYyS0fxMTtse
         ZrUg/mmiN/+V6qnLWbJ+oX4rujld4ti0QxS0F91ZglfJlRhyjl8oo4iCSr7g4UmIYicr
         wBY17xxgeEVi4LcJ5BLgmYfaf2TKijqbp6Uwfj1N5MwX687OYANcrxPzoKEwDgpGwTEr
         zNp9KCg1qHrUxdQM+zguTS/Vo+pSibnFOjREoVXqt8ZYFIZmUot/TO6FmsbQjb13/CYt
         bcAJgArnJ4On02MMKYiyXGZ2zB0v4AexUPDoFTFAO89UPy2nNh1rqIGYYVt/3rESlNk6
         oIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792105; x=1768396905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=Nl3e1L+vQJbxVbM4HWDokPdrS/gXFeiCvDAMv8qh7Dgjur3EB1bmwlYTfY1cZM76NF
         IZwXYhGbu2CSqtO/QYj7zG1z95Lm0XFsZmaEmqy1GKsbvzeJpFPVAp4xUxi4wo9zTI0N
         ch953ipNWbAOlgSC0orB3n/S3ej/SlXMdWUQACf/FbH8OJEbV4qs2OIjie9RYjhtDD+Z
         322DjTa86qpsC164M94rXkejpfT0QIHtJiu35pxNwiKYEfrHcgIYEGDdvh/mcOFXzr8Z
         bSIB4NiRugsGrWETateV7bCbJRvoY25I/qw4C6GyoZ3hcdIuo73Ayj9Nhm2vPXgjEnTa
         Pk6A==
X-Forwarded-Encrypted: i=1; AJvYcCUO0RPAYYSd1QQU+uRH9Jy9n9iXSAigsnfH5IpHkKGXyRRNhoUaS9qbVDpEwSXj+nxBrV8jkd03WPIVTLDM@vger.kernel.org
X-Gm-Message-State: AOJu0YziS0y/KtxDb4ZybufKYfsQJVCNbuv7CTdoPYodLXUom+GJ+zLQ
	swRvx0ocYEVAxVPW++ktAVZ4BhSfBLmwU8cG3ZxOtvfPm3l/cF2lJN+aQ4Tp1VOyMAkCYR2I2Qz
	Tdd0S2+oIag7HRELQLBX6prI3+vacwX0SfaqpuRqc+a9YlcALM4jkJNkQaRZcFXW5aZof
X-Gm-Gg: AY/fxX6wqQS5lCwMscqWz46CehBZ4pcce0j+1apA9q7IMMFRws7e1Im78tWq1UxIZbr
	SXZtBJRJ1aj3Pv77opaPotx3G6cOeKgq1vBnwXgUCwtCoOSCEnF4BD2f0ztFtGJ1RuHuyVkL4Zu
	rpGJDoxkqqgCUljUejvge4ZoUSmzpXZQzBN32LqntHzRkVYvJ+IFUShVzizF3EtAkImrCAIUreG
	xUzmZ5yv2bRCAGLC6PjQ3JN/hFDtY7dac8/M+lsgmq5mO+crokyC7T+I3VNWl5HfQPC5fAONNan
	CbZfAR8J2QCQZK5EnZ35Cp2oC1H7TgxTrQN+shz0aDLLk79dvYz+2X2rGq8ceNKxJNTWUY2yiPg
	8AaxmyMz/EkbevJjj41UrUYn+fwEz4Sx/kYJ5W//NuG+ahVFVpW+yiwVU9lGpG26WinYjN31ta1
	/Y8Ix1wxYocmJGBkpmzhr8KAs=
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097420137.0.1767792104879;
        Wed, 07 Jan 2026 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NXBDg7wVXP/zTsrowEn5NsyiVqeMK7cDHudpgAqGMWRN5e4UR1GPSBvYkE7wBgLCTq0Y4g==
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097376137.0.1767792102812;
        Wed, 07 Jan 2026 05:21:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm10295211fa.34.2026.01.07.05.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:21:40 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <mccxwmemwxp4fcyjiu3zofuydk5ahmhnluqucwau5a6aiw67xr@52gynmrblml3>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
 <20260107-fascinating-boa-of-fertility-1886a0@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-fascinating-boa-of-fertility-1886a0@houat>
X-Proofpoint-ORIG-GUID: -JUaZTBo1D6ke_GZb6geUm4yFQ_5fHqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfX+hRIah0oAMjo
 KIBFu/gNOBxqc81cGmFKtDA0oW6dn2vDtzYh+aEXK4WkUgKl1qI2tGXJ/gmgdzB4YMho4pLWOKf
 R7giMBdNX6/mnwYgLLZq33Yfo2SulKBNDoFPE3L/eMacM6Gna+CcQSQttoDbsgxpBms05OaqqgM
 amcS260mWX14y5zeFoBRXz4pqP8zVySkv1YA6tPNrOtxR38m6TPjL0pwvErLmizjhV/TwFw201z
 rrtuTixicxrdr4dEjPnC6BRmrNOA07MS7jIMzfCyM1INaJUyge1q+zGcKWy7WBMMzJU8+WYOtkt
 kVftNWtxQEp0SRbJ3ufufQNOIVNSnn3OyJg3PxoI4BBQstyaKBtGzWmJGzg7a3ewQUIQ609M9yH
 Z/v4ODFS+tpJxu6d+Tdurphg99AGm/Y7boN1ErivAUXeFlctGErbU01BGlCV8nLofggA7Rc1FQp
 hrkL68EDdq9/UIoiJfQ==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e5dea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3wq6KaL0rsEoTcXXugkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: -JUaZTBo1D6ke_GZb6geUm4yFQ_5fHqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070102

On Wed, Jan 07, 2026 at 01:50:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> > Updating the InfoFrame if it can not be sent over the wire makes no
> > sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> > and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> > an error if Audio InfoFrame callbacks are not implemented.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIRC, audio infoframes are mandatory if you send audio over the cable,
> so maybe we should do like you did for drmm_connector_hdmi_init and
> error in drm_connector_hdmi_audio_init if we don't have the proper
> write_infoframe hook set?

HDMI hosts can be sending Audio InfoFrames in some other way (think
about LT9611UXC, which manages infoframes on its own).

-- 
With best wishes
Dmitry

