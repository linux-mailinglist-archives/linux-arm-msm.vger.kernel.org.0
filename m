Return-Path: <linux-arm-msm+bounces-88406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C177BD0FAFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 20:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFFB4302015D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 19:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214B4350D46;
	Sun, 11 Jan 2026 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOe/hHQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BElZdGFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4318212554
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768160882; cv=none; b=kDJV8Sp6vvHeAztyTyAHpRJieEkU+wVh5/t06WDZZlqxTbfQ2vMztC/N+bawuuaa1HeaF3GG2HhitB/ualCPg25QpITDMWDcr43hxq19zx4zpH2hvQTmBsXvpT/q35+kQlqByCOVxSLu2iMcYO9RixNgGy+gQoez85jIsI7ilzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768160882; c=relaxed/simple;
	bh=QEegyf9Fq+JSgHm1AsTASX1xndvT0N+A5ZpMC6kp0bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoFfM9joTp/EfLMlOKCyGxCyg8IWwrWPX7tA1gkNJmXLluV1a5uW1rV7ytPorI9BfRiTGqqBKkQ1jM+qUBsMtS9N8Xems3dM7mqQMeYuz+6R0YrXHYgFKD2YI+dT8F+OgXT19oKkwzcN8XHM+4XrZns8RIdg03gUVsEM4msM0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOe/hHQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BElZdGFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BEgqwp2644299
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nHiuDw2ddVdplP6yKW07d/vD
	1vfZYK+QAtQpgOAY57E=; b=MOe/hHQfWkK4mMxK6JYzQ0oEPnwa3tCDYNEK88dF
	9HMPoItIEilTqDFMg+GMBFnrrn03Bd3j12yAphOvufVzteKTKI7HyATOjazmKsjy
	5GrWXiOtY3wsso/cfsCPan3lS6aUaRi9xJm4/MggweAvxb18Rtz7+HcDL/s32xyx
	D5YykDhiXwQXviQaS4ylTXunkvx9nD2g2dyrwxZWGjh9oH5RVsp9TUbkrAaE96jN
	17I6pluA7gec12qswGVD0y63eAOfLA1HdX+k0qeL1Zm8kEJoa6MsJBS+nK5yglUq
	o4g475K9Ahv96X5Hdf5EPSTCoTMHLTrRnyQC4Kjh6B9Qrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxtbp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:48:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2bcf21a58so1588772085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 11:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768160879; x=1768765679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nHiuDw2ddVdplP6yKW07d/vD1vfZYK+QAtQpgOAY57E=;
        b=BElZdGFrmsWmIJy6opEMy+fXldzWp+Mn49FjsSmmrbEx4OYNLTjSGkonlKy/7jjXPL
         qVcwbd1+tSYWpVh1GG86BXT3cb8NuJBCR8yd7oQ4N5iVqLLvNMB/cflZgEOkfKmv/2sm
         kMy9MttK5CghAXvUWPaBSw5vWLz0PQKWBEj739iPU92tDpLpmgY/fO+fZHs5uXQgAHbX
         qiZHKNBO7a6VS+s7OVkNY7jHvot5NqY9vKlv/Kx5Hv4/2MOx6vjAIQGRZNp8NBLX+jXB
         +8a9ozVAVn2Oeha7oaLvLFE/i9R5szqW7fWnweB+SnVQ6Onu8kt2vLNJx2vfEwsFzbh4
         e2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768160879; x=1768765679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHiuDw2ddVdplP6yKW07d/vD1vfZYK+QAtQpgOAY57E=;
        b=jf9aRO4z4Kol2C18XexuBgeJuPeyGb/xZRUK3hHKAcVNMrVCA0oieWBxJYZygVnwJP
         TVVzY4IuWQJw6ju9Kl3Mb2eM09t+H0DXuQmMAbVhcyajoQWScAExDyf4Wo50q+xti4mK
         YejpgECT1oZybqaX5KMOAvHUpyOJAMwPSweEVIbmxQItljDLBf5jsIgQJxkGSONVgs1Q
         u3X9+TKCqsuNw2/dD0g8O9XhE+gyYN8H7ZOOdgdc0GEGMbI8d8zk1e9pYZRLas5NxaEF
         1k5mHdm17WBpKwnEySr4o7vi29hkIDC3D854UAioZiEV1gNPcOZhL6SemsoqCYTl64Ko
         Ynwg==
X-Forwarded-Encrypted: i=1; AJvYcCWa57MAxQGlTGVH3Z9CrGyusqRgx6CvB+bWJn5SCnj4Ngtb2NnONOOBe97bxmLczLwSxReaDx6YDr6yeWfL@vger.kernel.org
X-Gm-Message-State: AOJu0YyKKpv7OIkpO74B93WUyN8p7DZUYLIMloSkzcx2D+16+qj9K+jk
	E6swzKyfGkA37yKUtC4EN6ToRD++ei4jyjXDKfgHD9Kt0ckSBLKNMku8GxKLgpYn+6fcK3uE4R/
	UqIgRZJXn22leKD+lnaf1pnudrgKN71yLOQA3FADZRXL6Vr6054vjJ9NJdzyMt51JXNvp
X-Gm-Gg: AY/fxX5l6Bb9wdt4jHlQarr4FLBLPN4Dg0Y00PLdJKG+1AyWOK7CBCAAtaV2iBuv9J/
	YyeXF5rf5bKlRTU5GMLGaHBVDoZL0xyZuWyjhD81PV3ZkyS7o9tNcFbFDyHCdnezRuZtjHyz2ph
	EkPfcHe4AVJ5tpaZX8sGTy3mdtg5EKgiwbLLJBw41vH/o9jrCw03GxqnPBxdqB6tTvS3Ld8U9sn
	XStBf/zt575Y3aK3flz4u25lVGj7pTiEZWvQcnEqMgWWb71FmMNYAUMro75nQHW2rMAFv4kqVsM
	SueXz0j9tTPvmcu2T82LmA41hrqsO7PulsfvRC9y75oeAxI4Ej2aGteU1xazKCdlVkDz7c6DQB6
	Pg8xPII8rVqY7ERjAspMXAlk6RTpcXeYssFLk6dtcHvpM8p88kESR+17sGdwrVVHDRg6KxioelE
	YQZ2eHTuy6E8z7vfwQytBrPzQ=
X-Received: by 2002:a05:620a:700f:b0:8b9:d2cc:cded with SMTP id af79cd13be357-8c389405df9mr2383025285a.52.1768160879067;
        Sun, 11 Jan 2026 11:47:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDCTqIV5A/Kps7KvN8SKHD2JgyGpaNC2Byph943oUYpCROuAJrFdT7F0C1u9yeY8Tx7vh+ew==
X-Received: by 2002:a05:620a:700f:b0:8b9:d2cc:cded with SMTP id af79cd13be357-8c389405df9mr2383022485a.52.1768160878647;
        Sun, 11 Jan 2026 11:47:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9bddsm35110761fa.25.2026.01.11.11.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 11:47:56 -0800 (PST)
Date: Sun, 11 Jan 2026 21:47:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: edp: Fix NULL pointer dereference for phy
 v6 (x1e80100)
Message-ID: <bpji45n6zlf4exfvrup7otsr5vpwntxtbjoothjcv672e6liun@maqmiutfh5aa>
References: <20260111083317.604754-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111083317.604754-1-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6963fe70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VNNG1rxki-YFVapEYJsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VBlq50D_NHs6II96v6Lvp8vvv3qZE2k5
X-Proofpoint-ORIG-GUID: VBlq50D_NHs6II96v6Lvp8vvv3qZE2k5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE4MiBTYWx0ZWRfX4I8lhxp1uxfP
 /Y59JGXEUGcSy3ujQ2mSObxWyhnGoXBHfAYazSbmw/n44evGsPnt1XjLLu6UYogt1qCna2buo4G
 G2jdYbHO9yvJGFe9NPmJc8v2+n2Jcg6NmVetoFDDf1HTXbul1OG9wscIR2vzfXtTSkCSgyQynaU
 d52pg8STzGFJF4lRiq+ajL3mG4xPqwvJxYp7KWcuRLWBVpEbKMk3Z+PlD6rK9men1zqdfVpRhaq
 eIdl6EoSmBFgGtaMWdccVjMZcsz0krCjeEFcakiwZiq73hLHN+fkZ6uP088SgoB24xOnXJHxfCr
 5kEHUEeZfia4fgd6V0ptoVVg9olExuoDkuhq11zvucIYzr30gXRGxa0qjzDQRXCkBFN+mdJrITE
 BnA7AoxmPbSkplosKXQWK99qRhw8J3HF4cixPkXkvYCBB+5PfsuEyHaz0SXndZWE3x1hithvJWI
 L/rZ1i8KqutzA+B2IZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110182

On Sun, Jan 11, 2026 at 05:25:59AM -0300, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: pull R-b, reuse v4 function as suggested by Konrad
> v1: https://lore.kernel.org/all/20260109045214.5983-1-val@packett.cool/
> 
>  drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

