Return-Path: <linux-arm-msm+bounces-58334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E2ABAFAE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 13:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3352918942D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A38B21577E;
	Sun, 18 May 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCX+a5hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D11E3DE8
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747566213; cv=none; b=ebncVyB0xsCaQZw0DElA4oGpBMtF3xm9zTB1DH4RZ8prPT65f/lko82YMyYBmiTqgauTZH7ZrC35iQG7m2cwxLlSMUE9P6BG6dOSiGxZb6COARnkFQY8dYTE8nKcmvItMNeYLdHbNJNLuDdEtgrb/CNagPXpC+gr1s8uZFyiqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747566213; c=relaxed/simple;
	bh=jKhYoXTiCVLVCQ8YtO1O7KlJsBewVo9GkOrWAqttTQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQ2ng1WJuxEiEbob0owb974uNSeMK2Jzu6QxtBdydkJy8WVsn6gWUJz37KHFzQix6MjOYvn0lQISvnszd9BMvDlngIF+kRe2yDjPDBeZGn75seOpyyfY1RfI1Cmda490n3PdCWs7zV6SxalwOPujAf/0YNgCy2e20QzCEMICqMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCX+a5hj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7Hq6U000876
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s7Zodl8u7V43jJfdZC59QA0w
	/oqjwY/2qontwKvBiL4=; b=hCX+a5hjc+O/br/Rtar7NXcE6lzauX3Tanqi7Ej8
	xfqDh3f97ksLoAjK9hhsgyNrqQmzrAWMHBHtAnIedBNbZE29CaruKf36zioACSSO
	IwPd9G4dYK2MlEhXrOQCpW1uhabTI9cy/X+x528AU9KVQoBisCnt0Fla4xK+Zc0u
	WgqWaab0HQSerutBpXX7CNXb3KyAevkjuPtj9/t08w7wov+7odVK1z1Rhkc2byWJ
	kDYp34VrUe6D97ztcPgeQ/MCufjwF0bkTFUdy0s0HnsSHPlJJTZ/VsV7+qPqB+P5
	hSEeiSoJtFWmdvVtzIIZJsDt10VgQD+/6cLW5HLb0BsXTw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju79v7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:03:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so28505406d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 04:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747566209; x=1748171009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7Zodl8u7V43jJfdZC59QA0w/oqjwY/2qontwKvBiL4=;
        b=KfqxHnQTB91PLGlsv/a4+buearJDu4XQ+HEBDj4XnmNX6pfKdJk4e0GkOlHpCmueUB
         rMs9c4vRoxptzzy/8YQ9WCPwnGjEC6mgpsTjSvDtOCjBTtSBnT+knQO+05Lmu1/1lUaG
         YAHdi0/Yu1uFIwPhJG5sMLn9wpCVR1fwXqCeT5LrwCYKKtGqM8U1+UCW9LnIWcbOOSHV
         PfRjMum7R37Ns1/h0Nr45J9rcPJRB01aMPWNhRqTpVBQj5N6YHuzTI8xqPQeeBl8NFii
         62k5oOa/wRyyK9LGiVg0Ettu3SSb6bNP/wzJRkBND3cYHapnJJVPyZb1RK92+d1+3G+b
         ZyOg==
X-Forwarded-Encrypted: i=1; AJvYcCXYE2aivKssfkY1HvXfuptRAA90RdyuWaMq3HmmI57bYsabU5/wggAlPYBs+bqVTF7S5nUuJobFK5Olbvm9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFEcc0htB7l2B78IisDL+EPdnSdEED6ENt+whvSLe7G1YySVzq
	LfJmPYqc4u2CObBzpSh5Px0vedKjG4ND9ETlKuToejiwJzEhziEYCWgMWaqAGOVF/uWoB4ipxPR
	//79VdRBMOxAgKp0TEkL13QetLgE3uTvkniYQM4fPSIu7S6Txw+YmNxENiVocQVvsnSjx
X-Gm-Gg: ASbGncu0TkBTXxavc03Td08F8Ch+RXgWa7qCh7GsAiEdjV4c6PD63cg+dx8O0EtXRO3
	1QNC2wFBm4vSnQeijF24fqZ90zkCLlz6+DGOYRx7IejJ2rJXtlCd7vQB9WIpDGEFtzSf7qLFGp5
	UMIsdoJuAN2uYjr2umh92TOiC93B9QtbvrWn/EQQhj1bbdhqIy0kwdQtzbwgWIefk2Bav5byweF
	gegjHcnDIJLj8AvR7RqYIyJWpFjJSxhlbFCodxshayK9leBO3Vvidy4Yh8FN8I/3DlGJ16deSBm
	vCvsWfaWv7hHgWh8WCEc67fLFwB3NiAdN3FfDoGmiV7A4ErITK4O2AeeB8sUlc+coikCdvFtg1A
	=
X-Received: by 2002:a05:6214:d6f:b0:6e8:ff46:b33e with SMTP id 6a1803df08f44-6f8b094a1b0mr164965706d6.37.1747566208734;
        Sun, 18 May 2025 04:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX9KX+BFsa3NUoYxEGR8XyvRdKkf0qln6ioT3s6rTaHSqkLSqf3cbumVbWxdH5ju6b5bIE3A==
X-Received: by 2002:a05:6214:d6f:b0:6e8:ff46:b33e with SMTP id 6a1803df08f44-6f8b094a1b0mr164965406d6.37.1747566208311;
        Sun, 18 May 2025 04:03:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b46d8sm14286041fa.17.2025.05.18.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:03:27 -0700 (PDT)
Date: Sun, 18 May 2025 14:03:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
References: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=6829be82 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OHL9Fh2E-Su--KGKRvQA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 7tCLh71I8WikMyLU1UudydYjEC7d_PVg
X-Proofpoint-GUID: 7tCLh71I8WikMyLU1UudydYjEC7d_PVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX1/Mh59tbEsFH
 SH2lmbaBqoH6RCJ6nS+5rqF2hMgR1/0WYQmRvrOUIO0heUWdylFdoLt+q/v+MFLV5dqzyLpZN+8
 Bk9a7dUhIcNSkhTtWQo4CvchlgQnXB3VzlrFV8a/ivaeSKg3vTxRXZ9ZUjNS4dEcYSvVoXcv270
 Gz4CgdFk62yxuQE19Jarg2S8e8GWpZGHSWJW+yxuhZhK4lubAkdMXGzO7mjs9e7Yng7DQ6Tnsyj
 ndHIfv9oC5JNXssw1mSP8khPIzUvEUM6Kuo1yx/5zJXdVVVtwjLIg15qjeIuQR4OiWeggY4hEgm
 rJAXK0NzAZEyYx9iftnM+el2a1eu3gQi2zzumH4ZN96vZG+NcvMkYfCE8/n8ePuy3PnkuWobNBo
 e0smd7Ny17HfI0NCuisnAht8ZDMGF9G0nfSR7HPJYx+E3cbRtaCrXGoTZhVuWUyywY6JhTKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

On Sat, May 17, 2025 at 12:54:32PM +0530, Ekansh Gupta wrote:
> During rpmsg_probe, fastrpc device nodes are created first, then
> channel specific resources are initialized, followed by
> of_platform_populate, which triggers context bank probing. This
> sequence can cause issues as applications might open the device
> node before channel resources are initialized or the session is
> available, leading to problems. For example, spin_lock is initialized
> after the device node creation, but it is used in device_open,
> potentially before initialization. Add a check in device_open for
> rpdev and update rpdev at the end of rpmsg_probe to resources are
> available before applications allocate sessions.

Can we fix this by registering the device node after initializing
channel resources?

> 
> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..40c7fa048ba7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	fdevice = miscdev_to_fdevice(filp->private_data);
>  	cctx = fdevice->cctx;
>  
> +	if (!cctx->rpdev)
> +		return -ENODEV;
> +
>  	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>  	if (!fl)
>  		return -ENOMEM;
> @@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	spin_lock_init(&data->lock);
>  	idr_init(&data->ctx_idr);
>  	data->domain_id = domain_id;
> -	data->rpdev = rpdev;
>  
>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>  	if (err)
>  		goto populate_error;
>  
> +	data->rpdev = rpdev;
> +
>  	return 0;
>  
>  populate_error:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

