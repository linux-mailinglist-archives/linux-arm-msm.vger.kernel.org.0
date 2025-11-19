Return-Path: <linux-arm-msm+bounces-82424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F3C6D1C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C070351C13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A61322547;
	Wed, 19 Nov 2025 07:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7hCn8jO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+UkjT2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A3C321442
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537349; cv=none; b=DLXDVCF9MK8Yfa/FwL9PpvwcySA1foUK7nEWmQUYNuza/n5rZTgQsUeQ/0TxoOGi2dWnkV1iqF1+2Un7uwUcwwyNAgMasbArVyzmW9qR3tjstAfJC/ajR0gvBy+3KOi5K0WCcLBDOM9RyjOfM/tLuXEHe1W7v9JWtW41s5vGq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537349; c=relaxed/simple;
	bh=ewTtdlM+ycukCeY2AVDnBWK0akizVQ43cPK6OLi6FP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phXjcpoWF+gxLGWcOe8/PeamlBgv1+MHiWz8es7GpqvJEP0ml5aqswmx05SM61vwvOZHnZrXsri4GA1nGjHI34oKk3T3XQZzz6Ys/ODykMO9qD/svc5HFR/Jo3RhEqWWqCLLb02GwnGRz0xlas1RQC2soBBKdvhNOiJSrkjk5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7hCn8jO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+UkjT2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4XZTr884819
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3DsLZ1FPHrZSruYCWz+tNPLe
	YmGcBuVVtHAcpOK5kqU=; b=L7hCn8jOFNCOdEq4+xSQP4S5U6BPf9bqK8E1/1cS
	hci1VfOLerJsWogWVbA4KDd1LBTlCQcv4K1u4UoiHB0vyNg+YX4+jjHk8YB4/BWa
	YlbVZfkR+xgAY5cikyjKsa2B+DBcjqOd9Yzwj2ki1veU31a/uHX3y2/Vl8o0iTC0
	EavnJ4WpOL7QJ5+XIe4Dc0vdxqEYPeMpmw5j2Xs5Iv+W7FnreQvaWC+p+7mU9q9W
	6b8LW4iRtbTbuiJts30NwDHldQnPKA4MdCXNo6eLStXxtuMpSDmyJVai23RkRDcO
	L1PcrSJklTlwOfyyLq0w2pWsH+/3nbRYTP+uri9X+Cth7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8ena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:29:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b244ef3ed4so859919985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537346; x=1764142146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3DsLZ1FPHrZSruYCWz+tNPLeYmGcBuVVtHAcpOK5kqU=;
        b=C+UkjT2ADzULMQT+ro69U8AI0tRlipzkri3/rG4uIO6M8Z4RhRSFGoo0pHtPZFXrDC
         NC1++o82eeqiozXmHLHLcSljsKnQzMDPKxHQ+IeYWWpoatrYUOGsJwjK13Hy7OVIp1me
         AjrmLD6AuA/y6hikmHItoAlBawEc5AlMvfDc/plwqP5wHQS7Goz+Gt+lxfH4TQ2oNHnb
         qNP8UTO0Pw5laLb9kFjMg3RbbdVfTk/5y7Ygfpe3XFqcUUAkWVDYakdnGhpeG8laBqfn
         weGCRWgjKmacnqopjQ2jfYzW6B6bzH43/HmPcdTAaki3N1t4mMIuf5crc9Y5VFlTXRHW
         V3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537346; x=1764142146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DsLZ1FPHrZSruYCWz+tNPLeYmGcBuVVtHAcpOK5kqU=;
        b=wF8suvvPKlFRnF3batYsJRzfU8MRf0otZjuaUxevnqwwEuxRl2JoR+rRe4Vq2ZgR41
         tJHhz/GM0edBSmASbW5gDnKwGkv93q7ke5B9ma8M4rHywS5qc/3cmz1zYphODOtl5NM9
         Wws9X5Ogkp5zKdBnQyZfs56re9CtF+6bdx0ZjaSeGhHLf01HJYPpnvYVjaOxlIGy2/tD
         qJSdgffaTa2yUzVf66UHDLpeWeMWNtR8TJPjgIV97eCig/KqcdZb7R11QdSUIA3RykwK
         HszFSZmqMAiweSGYbX9uqpHbqJg1YjoIRJyGfcZdQijzsB0vU51IFrB1YWPna30jI4sk
         7XEA==
X-Forwarded-Encrypted: i=1; AJvYcCVKO7dmMf1qDwLNWbmRBzMDpVc3vkRxq0cSIpF+vOI0/aGtbhh+g0xjT8AFj11P30p5ciX57WvCd48olfMp@vger.kernel.org
X-Gm-Message-State: AOJu0YxSq6/GCFmv7rH/3OjpZej9/+Dd9B/9ggs0ByGnZ1i64WmEFWFI
	aZLqSdpncJxxSeBbrebEspInUUgRk7cvWGfRD4AGQww5WbL0qi2B0Nj/iO+R1u/lCrCC5wKOw2S
	83Wi0qywtaQg8p5NpTt0f0M3MKfHr5VcpZjUWu5PAU4JYkEE4ROGlT0A2ycoZimbD6p6j
X-Gm-Gg: ASbGncvqsfwdfUOTQsiE26MvlFr7ARbXiKmscYDEjQ9inKzHddckpTalF2C4MSnIwiG
	Xjfcwzo4PJiI3E7BnN0/jUBgoom3Ln6F2tS3A7yReNq1Dj6YMTRnwEX0yH9ReG3h07NxZcPfVJ7
	05ivNtuQiF46wJQWcJTObvAnILUeA9pxROWXHhklZyvRGMvtVYePi/NFFsSkaRF9n7vX8TrfMJl
	yKzC0KxFIWyRp8be/Vd9ZEh13D5DI4Mw99lcQeRSpYPUm9MRQlowlN8BWWUBmb73PBZV7e9aOrF
	2XFgrGeAyqxRus9tZj30cOIOVGve0oBFmnPx4Uxd6daYndqNvtZBeredhv3rRFwwkEZJf4QkB7Z
	G0Wrgy49ttbyyU573FTqU2ZZrJh+b/0akG+X8iRtzlPLifoFuFo3alKSM3srtpvj44qpmsIelMv
	uKxMK+ZcjNc6Wt/AzQ39LXwkQ=
X-Received: by 2002:a05:620a:4624:b0:89f:27dc:6536 with SMTP id af79cd13be357-8b2c31b472fmr2374289285a.54.1763537345874;
        Tue, 18 Nov 2025 23:29:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKIqRUG0uKJ86GZa25Y/KflSonDJZP1+c4TBsaJcqeDzg8wuWNhhhKAJ7H9zoJRIHBmQBSbg==
X-Received: by 2002:a05:620a:4624:b0:89f:27dc:6536 with SMTP id af79cd13be357-8b2c31b472fmr2374287885a.54.1763537345431;
        Tue, 18 Nov 2025 23:29:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b9f7csm4464106e87.48.2025.11.18.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:29:04 -0800 (PST)
Date: Wed, 19 Nov 2025 09:29:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Message-ID: <d6oxprhyao6bajkhyqul333vkerfw4jekiwxpc6pwvul4sedb7@kmxuhqafna5j>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-5-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-5-317a2b400d8a@ixit.cz>
X-Proofpoint-ORIG-GUID: 3VtWqt0zvgNJG52Ez7-oirvNXw0u1MbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfX1++miaqj+IHD
 rYknenh2GBv1cG+0qpN5nWX05ozzlIizLs2/MuTri6viYYfPu8Akmazz6vBVvhfa4+Q8qdDzzwz
 iHN0D93oytnU1pSxZLTDEl23nzBCPeIUYcVSUpM0xU5EQZjzByxo8vCqa4gEj1bMh1g7vfzfdbH
 Wzoy2Q12nP/qcWreVqcx90c2Yrl+qokiiomCa/36s/4SDf4nXZsgMrAqXPbnQ4SxGDHtTAxrFa8
 g82wbMOZXGIZ3OOLd2PzbYxZNiPvBPLAihLORpnwN1tK9VYp3w+OUpcEd87fvILForf9yNTE222
 h67V7p12DL+YvXa+PFwqX7PRRZB7tyfeMuvTKmxosAkMh5qRf0uF0VCKW3l3Pd91xmsri2/P+Mz
 rVQvhkvVjArKKBT8gtgsQpGW9Z1h3Q==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d71c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-dl1TJHNn62xojq5CvEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3VtWqt0zvgNJG52Ez7-oirvNXw0u1MbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057

On Tue, Nov 18, 2025 at 12:30:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The drm_panel_remove should take care of disable/unprepare. Remove the
> manual call from the sw43408_remove function.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Missing Fixes: tag

> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index e5a8a9bb8d15c..d8481bdafd6dd 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -319,10 +319,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
>  	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
>  	int ret;
>  
> -	ret = sw43408_unprepare(&ctx->base);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", ret);
> -
>  	ret = mipi_dsi_detach(dsi);
>  	if (ret < 0)
>  		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

