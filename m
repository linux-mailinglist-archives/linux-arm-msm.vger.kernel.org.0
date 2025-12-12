Return-Path: <linux-arm-msm+bounces-85113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C736ACB9A15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 20:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D29C3082364
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 19:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7DE2C2357;
	Fri, 12 Dec 2025 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/olJt25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRtBNeP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D22D23BCFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567174; cv=none; b=cbqQMd0HugyeCg2fALvxqfJg+t8Stu/HINZUeJhejOQMNnOK0OBQLly3Y0H0C9oYXqjPWxxIVZv/oWQwrDB+ONqBe+CiS9YoDwhfjFXOUXExEYiwQrrJVJP9dcvarU8CskG0HWhutWUeLSg3FeZgggV//ngyYoEJwL3vzVcYii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567174; c=relaxed/simple;
	bh=gozoBVYxSj3BxH7M5VBKBHNQepOb1nUN1NoXmdUKVzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIaXj5mLCCAmDsgx6qbVhiWChZjxuVsEAftn0jTp4hIUu0YbbTdeR3vcW1B4D/td6TJGW4ZB9yn2+hwUQGHY4GR5Omwa4kBtr3mAtw1Y/kqkW6d79moGdSDuJBTwhPWXRRge0ElK1qjmBsQnrCsLf/Hz+tCABCct3saNMca6Flc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/olJt25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRtBNeP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC96pKY2694754
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VFHq9AdrnCnqpQQmivEx7dz
	tLAAGyebz4TQLsTW3cs=; b=J/olJt25ZaPyQN/1uqmaxI72rB4NOoEJrTjbphOZ
	HiaGYYqjpPZbdrQXMWNjl3aH2i0ESNS2SPSVVExq6oQcB7VR+CPHPABSNTXrGGDS
	tG6/8G9POrRTEezvPJJtcXeXqYhEskq9GoQmBpYyTyftMf3UTot+PwMxqRVXRly3
	aicOvRiw73/OCfCxmqWlbuvfDcpbLCIS/dzVYZEFQNvxkxQMakOcGhVK3mV/4b9B
	BhSDSis43TflpV+SSBMrmARsKobtiAOrIFbK35OH5CnbqJKLDfb683hZ9tBDN9sq
	MYVRw3WaHmPPkKniSZOBRoyXjkoljB/QHfxmC48TJLRpTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04av2w3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:19:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b7686f0fso26779261cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 11:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765567171; x=1766171971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+VFHq9AdrnCnqpQQmivEx7dztLAAGyebz4TQLsTW3cs=;
        b=XRtBNeP+eh4tqXXqYes0GfbV9ebRUORKkmaBVOu4ReFfeSPdx/bE95MpUWRnTctego
         AfI7n5apf5cI4KKYxMcE9p3wjoclSaRkLvjyKEMl62eirFXBKzWyn2UZNSI3o6ihf1zD
         nIf8vRwm7GRMOjjqP7P5lzNvUtGDKAp6Wr8K+8p1eg0cSxoQKWK1QF2SqAiur7rvuJfU
         k9ws4pholol16WiDO8SK0ziGo8Q4VFBQM8p5MPiZ3uP8giDlkezwV4FsCkjmjil3NOsb
         b/tZGEInANhDYVvKMuBDl/+xlBliYHQw4GOXQvTT6dtKp8gK4MRINVplfidQpDcpETRK
         8rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567171; x=1766171971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VFHq9AdrnCnqpQQmivEx7dztLAAGyebz4TQLsTW3cs=;
        b=lbc0++Hpv4VXJcQe3eCiJoaP2aHu0GZqTRyuKAl1h6QyrESWNaex0yz3ZwqoLvqbft
         46Od1dEJFTscTC3s8SEax+BM8bnC7V7TRpOJNnLtlDMB3j2zZG5engHlSoxY1Vf3AhHz
         X/TFKSTi6PsJSiUZobnwAVgANUHBpyN1J5aW8u4xR43gQH27hemDT/wE6mtmE4MMOhH8
         xc5ku5W9lGdM+5zyfXxMpBNJDbx/zwD+2V+0rDX1OU99DZpMgv50VGY3981v9hEfGTYT
         CjeLFel+JwtbcibS0ls0jTxm7stIzuEYlZFgOagTl+bo2wK17+juUflrGt3zQtRH5qV3
         SoHg==
X-Forwarded-Encrypted: i=1; AJvYcCWeCZuuaHOAhZhLm3dAqhGUYPPuUkxM4AN7lNmWxXhXVJ2THF8fciwwDq+rRLpAdHSbEVKVPwzIxdA7lKv9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0zxni56xblk7mz+wAw5GuBfH8oAdJaDyBbP2qeYDTEUATKEB
	AJZFiscPJz+5OhDzRKOATg5Z9JjRLd5xRosYhq2kwbAJpxrHTuL79mEZLNU8tG1uMbUZWSd4sCF
	iYVgBHtCEU/ipPLrxU6D7nD0Zb4TL61NiJU7Da5l03a6bJPDi26/GKLIkaq/AVzFD5z+c
X-Gm-Gg: AY/fxX5YOALpN67uPFFl2ptAT4pQBJJq/5w8XkSENR07OXAtR6R7Q2D8Ju09rE84zSe
	6qSp52wam5+YqeNXJ/03q6TxeufobgfSFXSHw/usz98suZsgVExDb3ec/wfsU2+l2rVRk/xv5BA
	Vo8N+aQn0SXWpvB0edoB+422rPRAX+IwWmiZOsvh3GvQsDyKgG0H5Mc62ShDYdDuB7FMVqfYZlc
	sAvMz3dXPN7QavwVJbReQVej13tn8o35b+VdvJD7VYl5wWQf75NrwmQFx1Ri7GkdOvgnJdqByMh
	eSRX5UxDP3gLDl6q0O78Dy+Bhk/H2bv2sv5/yuiKxG00gni2KxaNnlGGHo7kwzBF3wUC32gHkEZ
	7l+PNuKd4GPQhh0gouVw5fALsSzGpf7DF5xwd0gqQWfJCYoLbnvcn/HhbpiwFSraVyE2abDi2Ok
	rjNiBSzyMfq/dyA2eX+IJQDlY=
X-Received: by 2002:a05:622a:110e:b0:4ed:b570:2d4c with SMTP id d75a77b69052e-4f1d059d4a9mr40481481cf.43.1765567169277;
        Fri, 12 Dec 2025 11:19:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf7f+EZQpVVJo0fUnrpPdzMfLHydkeMtcY2eOvAy/WYv8Sk2FDBRRWYZulUPTT2ZkcK0JSrA==
X-Received: by 2002:a05:622a:110e:b0:4ed:b570:2d4c with SMTP id d75a77b69052e-4f1d059d4a9mr40480761cf.43.1765567168555;
        Fri, 12 Dec 2025 11:19:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3197e0fsm2191872e87.89.2025.12.12.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 11:19:27 -0800 (PST)
Date: Fri, 12 Dec 2025 21:19:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Haris Wu <bymark256@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: aoss: avoid registering cooling for NULL cdev
Message-ID: <wrhci3yl5sf5anxbykxcdr3nttoucbvfa3ztgtjrh2y3tik6xr@vf244m7it6se>
References: <20251212023610.13918-1-bymark256@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212023610.13918-1-bymark256@gmail.com>
X-Authority-Analysis: v=2.4 cv=VMzQXtPX c=1 sm=1 tr=0 ts=693c6ac3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=dKwAaemyiaJvZPpB_-EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8Z4Ejb7x6pmKy6etcxBS91GLrvuxIZzY
X-Proofpoint-ORIG-GUID: 8Z4Ejb7x6pmKy6etcxBS91GLrvuxIZzY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NCBTYWx0ZWRfX0znTP+HK7aa1
 4PV2/jx8C/CXl3yzmLIj9o+XNZ+x6rxKnxuvyKid0DZklAuAUYkwntZ628ca9rZOh5Xeg39gzjx
 JBp4gAMWInGrHHYdXcZifukgYS+5SkiD9yLe+P5DQkE7NS+HekVRop7jNF1/g2ouo7X003lzUD5
 e5FC82NnuPFGUIYISvOjmWBVG+HFVYkbCpFmv/2NmzNmqIw3Sb4JgJVr9SC0ZR+pC2PB8t88US6
 wrxoL8D/mrihGxM5GRXtSn08XnaR2Wb8TJ4Xvzg6pkbdEPJ0O10a60PVl+XLjj4DW2gkIlhzxJ+
 L2zRXPJDzy7BOg7NyDLBqDLIBqUn9x+0aJa9vOX3JdZ3pwQh74zrs3W0DfJhN0ItMcrzesPOGy4
 6Y9VkqFlOk4U2JN0S9rHokGd3C08RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120154

On Fri, Dec 12, 2025 at 10:36:10AM +0800, Haris Wu wrote:
> When PTR_ERR_OR_ZERO points to NULL, it returns 0. In this case, if
> (ret) does not meet expectations. Now, qmp_cooling_device_add returns
> NODEV for both failure and NULL, and returns 0 for success.
> 
> Signed-off-by: Haris Wu <bymark256@gmail.com>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

NAK, devm_thermal_of_cooling_device_register() can't return NULL. It
returns either a valid device pointer or an error pointer.

> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index a543ab9be..ac411343d 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -386,11 +386,13 @@ static int qmp_cooling_device_add(struct qmp *qmp,
>  				cdev_name,
>  				qmp_cdev, &qmp_cooling_device_ops);
>  
> -	if (IS_ERR(qmp_cdev->cdev))
> +	if (IS_ERR_OR_NULL(qmp_cdev->cdev)) {
>  		dev_err(qmp->dev, "unable to register %s cooling device\n",
>  			cdev_name);
> +		return -ENODEV;
> +	}
>  
> -	return PTR_ERR_OR_ZERO(qmp_cdev->cdev);
> +	return 0;
>  }
>  
>  static int qmp_cooling_devices_register(struct qmp *qmp)
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

