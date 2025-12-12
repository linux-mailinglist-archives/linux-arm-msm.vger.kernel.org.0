Return-Path: <linux-arm-msm+bounces-85117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1418CB9A45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 20:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22F9C301004B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 19:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AC913A88C;
	Fri, 12 Dec 2025 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwo5q2d6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwUnd1XZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2A3BB4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567843; cv=none; b=q2la+Pu5Nx/x+ETSJGYZUNECNfRysU7BFA4YrOmqWw2juMg0A8eTRIVx+lYO/R6nPHRDfpeWSZsIuQW2qSeugwuJ4wgPJyDok5ZA+jD2dWx/lm/pS0SZXRP4y7NCo7Ket7nWRPCXJzryiJNVBvSrvCRkEpKB9Gr+luN3Wp0H3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567843; c=relaxed/simple;
	bh=xo7mtTuFA1w1bqGaLMj0TSdSLllJXdGbDmxkXM4qWJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYdX2egHOjQKFg+j7jGWVdujefKrUwTo0Uk+39S2xxiJIOgk6aSxj7CJJlupa3e9uMRzWYE6uSXO2dhdvXtBmDuJHz02U+Kei3F7CYqgpGpmgqZM6ktkoi/06UnleqpGmRB7GdeuUTa/f/YeiCUDiNwX0A9nvoOQ80Rz9AQSJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwo5q2d6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwUnd1XZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC9tHFJ2456865
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RpYQzwzfK01E93JfsaezEbp9
	AcZKk8Zor6shJaI5MYg=; b=Zwo5q2d6g9jFEHWxi2zXyMiCP/bOJy3D/swhiKy1
	8VxawRbCQL5Z9xqcxyunwh+GDeMfCtGNjDu/kTAGD/Amt0cDFrkJnvBB6oayN3VO
	I4FFlEyq7zRY7kyvszV4Gvqj6ZQZQV8kyTu5AjIE3tDjVXkTAahXNRUDateplHu3
	DlKooLWbmNRh7bbvQ3wKGRs34uY5JZSyFMHuMcrnFrviiZuBlerl/SBPB68MlRVz
	STyPWbX+PKhpnv1fEx01CYuB293hvEASJ27hO/6hMD+mJz9rnH64qSyVMo4VO0RL
	+Ul91pWD+LnGfhKhSClRu1HjMa8Kx2/+oCra/EpRwFK3WQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04r8try8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:30:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5e563c429c4so1804543137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765567840; x=1766172640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpYQzwzfK01E93JfsaezEbp9AcZKk8Zor6shJaI5MYg=;
        b=MwUnd1XZELnU0qC02aC9hJG1E+pgcTg3F7uXfiItdFLGa0EaXY7Y5Ux8e+Ged1Loed
         o86or0qSjiKzAQA3MqyDzOdBO2iiMpHVxHdsaiDS5EB8f8smjbZ4avmQWyacM66pU/nb
         OXTjY+eWZthFe0lpsxtbsmQ7YfxcPVes0aEKHq2uAloF8yP1Tvp6/XLoTuvtxXN3ZD61
         RhTVyeBQhqaS2tY+p4JGgVpd1IjXO6oZuoE2gn+l1y84QK9MTnIsTg925EFZsz3QtiAx
         Rxp+7xm13/TiYmj5fYNw3+Iwa4Rdl9NdJXnpzW/F/h+UwccV/Gq4ydlhp1gRDhaVOQr9
         CY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567840; x=1766172640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpYQzwzfK01E93JfsaezEbp9AcZKk8Zor6shJaI5MYg=;
        b=CmYXJ3hMzEEzKFNRRZ0qWqdEm501Bam0VwqxEv0fjq7IlOszHx0c7PnyZPSo1HioWo
         2Vk5uHslOvRzcyYZB8Ef1uiuQMNCGrU9SYm1LVtUZsTos1znsmDZ5WAcGmlFmkpdh5Gj
         kv1D0EB8I0KhD7/IYoDfLsFcwQMteqVeez9FfkG5EirlLZMu0UYeK/oudbnqS26OuUY1
         rV/8b3RQ2ucTtfibxRcDvQEfEHdPNNPStzX3QIfeQKkOrg9TWDQpLtI3FORtEwRmtvSU
         VYDDeiaOtB/2SXoeD1+2XfFaN08n1Bn//zy1UaT536qIbqjdBZDMEJ+kbQtkMiTRH6YG
         osgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8vOEp8iZUNjOoE94BfHJoiHkhpMd0KHd+9wahhioV6POcjbzi3ppoD9MXuIiUHiRkWPgqZMGI0eJrpldB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/Tv48ZwAJZ0/7/I6fRPjGj5sUlqmTvJA9d7VL7co3EsJGF4R
	AB+ZwraVKZpU6gxMsEBPEINV8bWWfa7gAVd2fuL+BUj6zyQu+vahvpk0h5WHw1NrxldZ+Der0/N
	+dJzYiyK1c4n8vbdLrfDppp68EOj22qpqgOJI4SZYtjdo/bFaz0oq2jXeup0HQ272I3oh
X-Gm-Gg: AY/fxX55mSlDXInCZ7fbqpVBN4czDCM0FdsCYddO8p4AMZjn3i96iiLj1MmSJAOr73q
	P9E5YC9wS5+0ZhcR7btlBCl1vuKj8p21AnMA5Di7JpDGAAFVrnvZKYgGRULVo2s0j3PHET3NBMk
	dPFcJWS8Qopm/50sTpv/FUgBE2Qg08uc3FDRuOaXX4vjB2a4VsQ+ohRk+COUg8T+4qlxlR9uQeA
	RdSO1TdvhaVY2ohspbXAcHXWPU6e8+zGCnlOyTXOOE38FW/zpsZFzRxl4iEKEmUpyIkkgWRHa6T
	XPoHpnLAtXwPNLfy9yo2jpVyPP0Tcygqv/V4mMjsdgqSZJq4sPxFjA1/DycaNV4XGjCIcO5KYhO
	pHQcI1qRpQZRZGj/xFewya/IW/R39tIJSJMqrjTSlNEjWKlp7+h6dbZ5h09khvJ8/NjiKlaYVOt
	g2Y0QfQdr61eGZ+l783rDTM7w=
X-Received: by 2002:a05:6102:944:b0:5e5:6221:c5ae with SMTP id ada2fe7eead31-5e827475c6cmr1285356137.1.1765567839754;
        Fri, 12 Dec 2025 11:30:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbJWWHapZrIbDJxcwqs/vQNRFbYuXzORIv7+DyRlDotYAHLyI9QbsALvN1ceS9H9EMbR/eIQ==
X-Received: by 2002:a05:6102:944:b0:5e5:6221:c5ae with SMTP id ada2fe7eead31-5e827475c6cmr1285340137.1.1765567839293;
        Fri, 12 Dec 2025 11:30:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fd2c434ecsm6920721fa.48.2025.12.12.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 11:30:38 -0800 (PST)
Date: Fri, 12 Dec 2025 21:30:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Subject: Re: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on
 early suspend
Message-ID: <aktk3ofvgdusfo33kebaepfc2epyty36sltxxceaq5q2gy2kfz@6lki7itbthd5>
References: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e/ULiKp/ c=1 sm=1 tr=0 ts=693c6d60 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EWeZSZyDK3lWYzenonkA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: d4_og0XtktX_mFb4tWulpFrmhjcQ7Ixj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NiBTYWx0ZWRfX5UQRPlncZiyd
 VU842u555tHIYh6x4EP1G5qNGfgr297C9kx2LX3kaYeSN/jisqYujHkC3T+/1RcrZdIQSodMdXw
 8N2XpRZGAkwCV8LOckvGLXDdhBin+/CXkgb/ksKFP9D95fKePxFCn4UFhg4aGJm01eiVdA4H+zk
 IXolD+loNhJlnwfTvAH1jW+DOKCwc3woSjRd51NJz8GF3hOiqZPCCrkZx/B7wk/qZxXEUq5bBUy
 SZjjpzUvD3x1yA+gtLjP5HPHM7iE5kXJzrLZg3glu0bwFbwcRj1RhqEIlectXhAqx9ZVaOp25dd
 DWQ3t1NCqfsWi5xlCycfduynFS5phsM9Bf5KfsZQRWgGX2jmsEFeqd4d6JlT/66XJxzHLyvAxpY
 ZYB5VFLa2oeJlsnVoeom1A1IQ8TsfQ==
X-Proofpoint-GUID: d4_og0XtktX_mFb4tWulpFrmhjcQ7Ixj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120156

On Thu, Dec 11, 2025 at 04:35:36PM +0100, Loic Poulain wrote:
> Enabling runtime PM before attaching the QPHY instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> This causes a sporadic crash during boot:
> 
> ```
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> [...]
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> Workqueue: pm pm_runtime_work
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> lr : pm_generic_runtime_suspend+0x2c/0x44
> [...]
> ```
> 
> Attach the QPHY instance as driver data before enabling runtime PM to
> prevent NULL pointer dereference in runtime PM callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  v3: The phy-core expects parent's runtime-pm to be setup before creating
>      the phy, so move back runtime-pm to its initial location and
>      relocate dev_set_drvdata() instead.
> 
>  v2: Move runtime-pm enabling after dev_set_drvdata
>      use devm_pm_runtime_enable() to fix unbalanced enabling on removal
>      reword commit message
> 
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index b5514a32ff8f..6386d834b0e4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -1093,29 +1093,27 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>  		or->hsdisc_trim.override = true;
>  	}
>  
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> +	dev_set_drvdata(dev, qphy);
> +
>  	/*
> -	 * Prevent runtime pm from being ON by default. Users can enable
> -	 * it using power/control in sysfs.
> +	 * Enable runtime PM support, but forbid it by default.
> +	 * Users can allow it again via the power/control attribute in sysfs.
>  	 */
> +	pm_runtime_set_active(dev);
>  	pm_runtime_forbid(dev);

I think, this should be called after enabling runtime PM. Please correct
me if I'm wrong.

> +	devm_pm_runtime_enable(dev);

Missing error handling

>  
>  	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
>  	if (IS_ERR(generic_phy)) {
>  		ret = PTR_ERR(generic_phy);
>  		dev_err(dev, "failed to create phy, %d\n", ret);
> -		pm_runtime_disable(dev);
>  		return ret;
>  	}
>  	qphy->phy = generic_phy;
>  
> -	dev_set_drvdata(dev, qphy);
>  	phy_set_drvdata(generic_phy, qphy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider))
> -		pm_runtime_disable(dev);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

