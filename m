Return-Path: <linux-arm-msm+bounces-52214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 329BCA6BE05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911F21897DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FC51D54CF;
	Fri, 21 Mar 2025 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/6WsxSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772D81991CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570017; cv=none; b=eD59kJIu/p61NHZGQHiYmcU9kZJLWv4+YP3VPhYE6p9wz6MiOhGdu0s+KmOqbHzR3JQY+Yxvlgg5FTcRfFHMHCFBjYayW0XnwQJd1zvmXnekVPJ3dZyprJNwtzUm+ncYsFG6PYghOFs8n8PQLlZvmz9FuZiBShbp//dqO+Su6e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570017; c=relaxed/simple;
	bh=eUb6pFAQJsgClBFqUN//SWMcT52YNoD/1rKlYn3NhwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqFxXvFgZCdxVLkYyrT5SRZp3OiQY92tY6VJzqMsENV3aMsyNlBr8YTREccNgOOKSzb4M65e5tQV/JTok3L771KdkT42rTs+rF7tfWGDpvy92KGi7QZRz97UIho7KbMWcYz9wcepvU0Ou/Omv6F5+KIuNNf9RkX7EIDDMeFFNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/6WsxSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATSEU015299
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xMZqwFdk5KSv8eArmzuOQClA
	gGlpgEE5tdbkxdpxDLQ=; b=h/6WsxSIpkBW/1vpvBD4bsmbgrPtvlQotX2E+c3P
	l6lUuTmlKhEoKuu1aFsMZLe+kZd72mFSYJyZQxtw5NnuS6SawRGqz+0sL31k5xqE
	YCTHuQKTtQrBVWupRyfq7nOGIUd5YKJbkHBByxPZWBHO31EF+wUbc0fUDGP9Ync8
	4b60IeJb8RzC4RQj6hqN2dITSuYivsSbTKi6Ev7lVfom1Rjc9UxtSP8SshRsyjuV
	9bUcTkeDeFhtQpAZAh/wJwIrUFMXWpBPmIHlB5W8GEZc2wJELyVkT/P7D9uPfoIm
	SnmSU5CEHREX/2k6N1Q7QH9QsXPs7L8AhgXeTIg1RBw6xg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngnd4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:13:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8feea216aso53903366d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 08:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570013; x=1743174813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMZqwFdk5KSv8eArmzuOQClAgGlpgEE5tdbkxdpxDLQ=;
        b=EkVbf/Q4y7z8h1NCSx3ta5YNdzZ3lDmz39g9ltzOBG9rkYnTg1Xcc2nqN6e1bsJurp
         bpcHHUook3IuHWHhS0h0PQ9HKJCkNB45UVBRy2JzKa916bYfTkFqby4vl7Sm8hBcudKK
         CTboH3iLr9/NwKZlCyPMF+VjVvsaAIiJgoNFJoEWX/YP5Wrmi7modCaKBNVnfgydpq5c
         oT+4IYR6sXZ6xMr7IUoqKO61MhMPvRDPFxyeIogG8+Nu1oLSvcr0iirJb8woRVgYJYev
         lcVhWdndEO9yHvcZLf7vnrfQFgj96Ply8GH0u9VE8FtWpaOVbqaBtGCd4d9MhZzR6La1
         tW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT9yxNiMsD0s6jPwzxUkI8wZP5QbwRRnjh01aO5pzOqVQDHC5RwINWQiFFFdDPObUwmLuZ52pPCCyvVteM@vger.kernel.org
X-Gm-Message-State: AOJu0YxjwPpvLxaVQYNC5uTaXPAwsVfSyNPGwdnsUnEpdFp+PgecnE02
	MXpDHwyPu5vzgu8JkndkqjML2YyLL3B9jG2XEmd73j8uChd1EWXBJJSIcEqbFbrPEjz8gVSOOll
	1KGfBOrtJUeAkomdiHW6xjBlqS51X0Z8qAyBCpdOZxJcMbJ+PQLEYNSA6MJjN69HF
X-Gm-Gg: ASbGncvfl1M8GX0+idL+RIqAwmhHqGKvFL6Zjju9UnGQQ8tbzg6a+47nVo2+0085VXe
	uEbgHu7aj8hVxOwRx5gjLtjG9aZOALxxgiiyu5ApkFjWCEa+ZffrvCLWXUr+Xzk6Iro64JNJiJD
	knwcrF6yGBnsFBLn0WAKFf4UDlsMiRsrzjPSBzo13b/F9/v1EF+R38qUD4mq5f36rVrxTUUV4SX
	X8S3GHI8B9piePxuOA3cWdIZk9Ds0wZZhmQaXflBC0bVfnQLKCXBmU4cxnOInbDLwSoXFJuvKgj
	9S8Uoz432wPPYMR+gIih3UTWMozhmCRKxzWUZYliqvGhUd1Mr/0ka/fWE/eRErdn/+GoCG7h4mA
	j0Q0=
X-Received: by 2002:a05:6214:2504:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6eb348e09bdmr117295146d6.4.1742570013188;
        Fri, 21 Mar 2025 08:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV2qUsrf8Ji8k4NQXXY0QZJ3uWE9bmcYzJL0crOi3WG2aGplZZOmwLfnoE3lH8ycAUmOl/vQ==
X-Received: by 2002:a05:6214:2504:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6eb348e09bdmr117294576d6.4.1742570012721;
        Fri, 21 Mar 2025 08:13:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f4f79sm2679021fa.77.2025.03.21.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:13:31 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:13:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/10] phy: phy-snps-eusb2: make repeater optional
Message-ID: <m6uabp57a2kskyspnrz65frcf7dqkljmdeffupqkcni5qbgya7@cwmdcac5eh52>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-7-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-GUID: IkuUkq76nNmK0lbATvaRs_8SHg29XFRe
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd821e cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zXIZtLy0MoHwQ1NDvSoA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IkuUkq76nNmK0lbATvaRs_8SHg29XFRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=701 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210111

On Fri, Mar 21, 2025 at 03:58:50PM +0200, Ivaylo Ivanov wrote:
> As described in the device tree bindings, it's not necessary for the
> SNPS eUSB2 phy to be connected to a repeater. In configurations where
> there are such instances, the driver probing fails and the usb
> controller does not work.
> 
> Make the repeater optional to avoid that, which also lets us use
> the eUSB2 phy when it's connected to a repeater that is not configurable
> by the kernel (for example it's missing a driver), as long as it has
> been configured beforehand (usually by the bootloader).
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

