Return-Path: <linux-arm-msm+bounces-52892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39421A76F17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 22:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9DF188CBBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 20:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AC3218EB1;
	Mon, 31 Mar 2025 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBJvjflR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05231D5174
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452590; cv=none; b=GHMu2w4wMw4QVx0VH49pz5VJywd8dGrGYpwEbnsUOyrMIcgzeZ2oaNlbUU7VGzFSKP0NRKFvWZBSDVg8TVwySVmyO3YPWbP7/Sux5/BB4jWy/ldzQKLNDH7VyWehFaJl8jKg3YaLsJEBszIafbjyJvudJmP2h1PHZPmqF6FPOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452590; c=relaxed/simple;
	bh=2GfGlNKbYEd6eGd8KETFvs5J/4h7n1NwKtdRzeRnc5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXbpfO2Be/0wuY7SpyPFZn/7lqSXzrI6WQIHgJYRbGMUZkugVjqNcqSaDG8xyoz7W3oK5gZCOaL017xckt+DyM2TxKuIUdQsfCKkRcPNBU9XkEo4wYApYReuXLx3qOX9PzFPaFY3ZbcAEJ/RiAYpDp+Mi5l4pOETQIpJHn8g2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBJvjflR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKCtVX019810
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 20:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/XDH4np/11kTXmxJhc43+oag
	MOQJnczYYqLJy3cdvic=; b=KBJvjflRmuDdRLdfTA89gJtezMY912+9wModq5w/
	+b0yGderQ9faUPoMJV2sKTHYL4gSGLcqrYRh6xrv3PLUwKaIul+sImZLawy4kuBX
	VaFpGrf3iF7lyRsdu5sGrPPMhf+OIZrfB5oGD8AgUgHcCh9q+ZToHxWLUylbxWF6
	s162OJMAzC0ZaFGCLXGX0zVzdWC3l0XWsIUcPlcAl+jnknWcX8DUXjTSndZOH0/U
	V1jfeblkBKAnySt94ZD0n91novqsa60pAFsVMZz8VSuIcUbNcRQnAKpkHZZyOGeS
	875ke73XIJcta+bOQUZjfHerJjFpmmMtADNhhkTIpmawzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1vn80hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 20:23:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so459643885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 13:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452586; x=1744057386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDH4np/11kTXmxJhc43+oagMOQJnczYYqLJy3cdvic=;
        b=FANajT2WiZHZw5ZyOEFVx5JZmJTtYby9DRutAWtd/WHPXOycvAlICo6r5yni7yt2YX
         WX6r4/gyKn8kK1pYom6kaO2kmRQGgeQMSdqXyyLkT+NVvalw1ftH/rzUDj0QumttQliM
         oAkdl1WK3P/xFT0dPzd+jec750jxGaeBxf+DWUPrz6RKsvEmEamVRwg9juTJ7DrPC4S+
         DAnJ5bLgUcPQhEjZvuIwDP9VKK8INjA1Iza17bG4Uh2OMpUNpagKH+ikR8yhS1zNhErh
         T32bGKTzA4/SWOwIKSunegBNKljqM6051HfyapHN0w9LJx0+oxSd+YOR+2DZnbXYT0oK
         CPHg==
X-Forwarded-Encrypted: i=1; AJvYcCVAFQO8sP3GdDqGpE/7LeMtJYHF8f0PC5TfwKLlO7bTNJ6xR+5AdX3TsgRrSoiaysPWA3yHwIypEXWbaVSU@vger.kernel.org
X-Gm-Message-State: AOJu0YzVstwQm6etnqgGidiv4aIYGpuS6w57QwNXtzjYmb7feXN2don4
	DuhbKkp5mbhjNEi/ceC/zBrNFrAYaLtUjL0wOcvcJrMscIEZ9sfnxTt2C/q+jK9jQJc1Sgx9auv
	FtGtgaeBlyWcKLpwdyULIQ+KvgI1zigiIniiwC9bXR05uvMZsK/6BH95ovJXnNGiS
X-Gm-Gg: ASbGnctBvGKyh26cUvEX94LZgc4amE6+eIxsHbffCJfGuieR2Xn5IW4rVBwu6nf39Xy
	7W6Z9bDKHSOwoDqFW6P8rKNLwnMuqIHCeS6iom9WLaU44pzDQKMb2mjOZ9VVftdrP+DHYrFHB5U
	ZmIzDQTYrbjCFeJxcMjf27DTtgusVE3UaeuuzhPjbMl3QjRtqKnUzvfLBuJAqs5/UzuRk/5AXmC
	wNLfNdjPTNHNywINyeUMq5snDjIPmfNKW2B9GWTzk5puKNRiJuswaQUEJ65WPza7lb0rnT13s04
	euZFstJTpNFVkcXhRhUu1fl1NDZ3yEFRduu2ii56IQ+aopytOBla51Adg6C2b91dbzgGwrvi9xB
	UlZk=
X-Received: by 2002:a05:620a:2a03:b0:7c5:6375:144c with SMTP id af79cd13be357-7c69071e2cbmr1183408385a.23.1743452586611;
        Mon, 31 Mar 2025 13:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYPejo3kER5dNDXDvNgrSMesprgR2DDS2npUVvqdvd1MymJqIcUXKNSnahqXjg6Ltaa4Rclg==
X-Received: by 2002:a05:620a:2a03:b0:7c5:6375:144c with SMTP id af79cd13be357-7c69071e2cbmr1183404185a.23.1743452586084;
        Mon, 31 Mar 2025 13:23:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1ab6sm1203757e87.97.2025.03.31.13.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:23:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 23:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <rub2lfc27qef33iziydwd4qoaxia3ycs4iq7o7hujfaccznma7@hyavk23v7rbh>
References: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
X-Authority-Analysis: v=2.4 cv=UL3dHDfy c=1 sm=1 tr=0 ts=67eaf9ab cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cQ1TuvgcctVPKzGXpFYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PS5x6bAdzP75Bkwes_BLcmY0pHTPGIRi
X-Proofpoint-GUID: PS5x6bAdzP75Bkwes_BLcmY0pHTPGIRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=968 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310141

On Mon, Mar 31, 2025 at 10:16:54PM +0800, Henry Martin wrote:
> devm_kasprintf() return NULL if memory allocation fails. Currently,
> wled_configure() does not check for this case, leading to a possible NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
> characters.
> 
>  drivers/video/backlight/qcom-wled.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

