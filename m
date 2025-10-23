Return-Path: <linux-arm-msm+bounces-78588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C3AC01107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBDDB561712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C5230BF55;
	Thu, 23 Oct 2025 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byzevInz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A091307AF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221691; cv=none; b=Ns/sKD57K6z4fkfb8EWG5AfFKrlPgcWpEAIFcP3j5ASpwPvpHA6hmGQ9PMLoKxku3XkyGVaYiO8LMB9H+2ynm+9nCJmwglE1yxD8fwfr70LKj5uUE9P+41wo5fyOBzdYRLk/kJOg0QHaD0zSZFaHAm46yigSuUoByVrBSxWzImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221691; c=relaxed/simple;
	bh=mKKZ+GisW4033CvpSmrHhhuLvqXiweE3YNZdMeZfmGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdg+F5QDjVtgpDV2Sd2/fO93vvVbBsJgzs4aNwtM5A9Mwipa5hy5W4Te6ExjwjeqYxAfgwMXC5rUbq36zl4D7m1RFTC3EQLKT3h0RfJ4I8vMoY9gbQNtJ59jhQJkJdFnQY5KigvqY82rAFl5rk+NX0JXETlDuzytoflutplR+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byzevInz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7x9fn019207
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5onFcSVtjASenfWYLyuXz7Ij
	aEZN0TDQOoqBl+QFROk=; b=byzevInzK3g9LUPjzm/e9hwxr+VfC64JLQt+UMkY
	xX55uPVmpIAkfnyLrD5ytJwSUlu5RgRuycTFZvu74Uf48yOs2eDSpi9BJbSMFH12
	qvnY6/dbeNVfHyU/EBWerTP3arsUgCXFSXD8ZKc2KhqBSCQWjUPlZSW7MLhTwCR+
	VE0/ozm9cGuQRGIBMaHc1r/dbD0RL7JmUdimgR0tFltGv46vWlYAO1co8tSHGBk4
	nKh2j0qAgU1QOXxdsMfzEIb/JjMCxgyY0VVq7RuMLiKNkdhwKkgo5AZKoBO0N3SR
	+f+J817Ms+IkI3IXKatVU8VG7IlEo3tATvPHOLVnuCViow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qj9ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:14:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a89c9750so26412381cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221682; x=1761826482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5onFcSVtjASenfWYLyuXz7IjaEZN0TDQOoqBl+QFROk=;
        b=xBi8XGC7RxSWdzoxs6T921WrTyBWBK2pXjeY+xwW2oPTqmbpNouCuj3melkoSAO2uo
         uZYKXt8nEfu67M4g4UWZ0c2GYJUdzZhB9f0AFjowEkQvpxFFF5PCbORDpqL7kLHsxK72
         /htAqPdeocTf9Ldy6LaB/rBNLdqQIeCQ43iyXn6AqhRk6jWVkKZ2aE+ytKpBuWC1buRk
         STRDN28/gkX3wyzhLQEisRCX1Imv7cXwKX1aqhacd7nJ1ZhlaXO9qjo8v1Jcemcgi4Ae
         k7LivTXM8WaOBu0nrUKR9R4dWHQE9+bWNK6vqCQekLu8R+n0MQjlCQGOoBCOfBj4Gu5h
         JaGw==
X-Forwarded-Encrypted: i=1; AJvYcCXX6MEINCYsz7TwrcWJXb1deYgSIBLw9k0/rE3BoH6Kpm/aSHWsTcFNWajpabagiL04WS+GD6B8+AOVXofK@vger.kernel.org
X-Gm-Message-State: AOJu0YyM2lazHKfRnzQN2T1wUAlGJ1Qfvg4DasSV32GG6AV2KcYOIlc+
	JdhC/OiImyh85u4Fj1PdIkxuJ9qzSiqG/9ObxEscVrp6IrFdyezIRW+SDC4DCec5ymnR89SRfUy
	peadcyKJs9D76n+tXvug8W2nabg0c2dcnjBQFNVWPs240ZcN9ftpAiJIEbgZEzJA7xGf+
X-Gm-Gg: ASbGnctmWtz0c9+BwZIcUh+wQ1TzmUa1E7YJiTNyjx8Tcz0W3dYS24O1rmpN7OaB5Bw
	aAeZcVAN+WoO1apTOjK10MtDSAIT/niJfZN06w51V8qCY/ryPl23ggWAoCP71cDgUw8oPULcXhs
	NNdazXtWMDpZnrJz0BycGz39vHQlEzwAZydTZkPJyhfH9aRcSEzlwhdoiaZvv8C8GcWRWlIAw3W
	8TOKE7f3nDyGDdNY52PWIw1VGzxOINGC9TmtMQTCO3BrIq4zyn8zv9boQXLM3RdRKpNoJd2LdCR
	YDOrxPbzwpqih+iL5remSuhZqCnxGDPr+0L/Ck0rHJGFpvEkAOGaFwNBEThhIfuj/Y4hNYbm0st
	7RQEhQYKWR5VcedGuUgktmB8Fnk1wCb7JpUT2Wsx+aQ2iyKzT2dfiJq1CzeXtxXflEGJXD1yTJG
	R2XndHtXTf0XF6
X-Received: by 2002:ac8:5ac6:0:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4e89d393b93mr314967021cf.66.1761221681933;
        Thu, 23 Oct 2025 05:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESzd2NTnn2inqqoUmN9EYSM5jAuMSd0Wq4bXLNw8lQEUOtptDq/50z8lDPp8MEtECsteYIdg==
X-Received: by 2002:ac8:5ac6:0:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4e89d393b93mr314966411cf.66.1761221681423;
        Thu, 23 Oct 2025 05:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d2c32fsm702012e87.89.2025.10.23.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:14:40 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX0ApBKJrjy5nA
 H2288789VQVA8A0ZIY4G4segCvLr5LWKEuxMPzQv1rkJUIl5II/0HYankz6KVyU3dBEtxFk5FQK
 Mg8XBjP6wSNYNPgP5bV+ekqmEFIKnoXpZoqJRUQ09XomEsXzNmdNC7TDJ11981bZa7W/Fb2Iuei
 7pZ87M5JscdsQoJ8Pcbplt5nNhW49Z2WD4yfCfv4dasDCAHe758vmIrCTkBcffizcNqGqopEqKN
 WtGQ1mBD9Wp1TVl+1TCN2OfJKxjyye2n29qPQ9Ki7ZGO4zU/3Bic3CpLwzGfUNksf9XdvOSuj8j
 +VvApDpqaP51mt6R6KTj3pobMS3f7nVWCJh4cWQUzpbVQptrmur/J8t1HyEytBM+rRdzIjt/YV+
 q6nOPbIh+W4lz/viWyGecTc7rYvlpg==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa1c33 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-jZqwlwB3PUYXKLUuVcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: AsvuPnJS2WWisRqN4B69riUOOquhmCip
X-Proofpoint-ORIG-GUID: AsvuPnJS2WWisRqN4B69riUOOquhmCip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> index d6a37d7e0cc6..7eda16e0c1f9 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> +				    1650000, 1950000);

This should be done in the DT. Limit the voltage per the user.

> +	if (ret < 0)
> +		return ret;
> +
>  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ctx->reset_gpio))
>  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

