Return-Path: <linux-arm-msm+bounces-102818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIShFgah2mnR4QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:29:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AC3E1848
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FA44305659A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FD13BBA1B;
	Sat, 11 Apr 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu1+1z9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieyBigGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD23F36C9CC
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775935618; cv=none; b=ezc+tHd+6lhhmF0tCwxMbyr2Zhxjav9CwI0MIcEHrygJogCcou45KBsNVoMFKHSf0JItYCb8WTsVpO2SIfUR8H2UroOjl5M+IV9We/M3U0fdqnxdzUdm+ne9wZszMIeutmfmDbVrlQPIcsQvnTP3Do7uEok833W7cCJESM9RC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775935618; c=relaxed/simple;
	bh=CIeGBEbkd+27xf1c5e9mW0TfQ5k5knNImaACCVFTL9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbzOLmKreonHDMPCeIPz+FT7myH2XBcqPJATiwfKJlSYYIdhPQLKFw6K2824Y6neOdvLSxvK2bGYXJDb7++ahm7JRKf7zn0FKbsqkhvPiu2xTj2xcv4Ncv95S954Zb51jHdIbWJkiHjlzAXIbudBGj1zNxaS4AJ2FguwFeClaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu1+1z9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieyBigGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7unPM3336391
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E3IcyDvJ1i17Lur9ph/QOElg
	Ara1tTa7mfLQQ9nB/dg=; b=Pu1+1z9aL8b3lpAvgh09k2u/i2B9Fe/vxdR1KnEP
	AFovKI/USbqsdyIARr/OGiXOIjj+3f0XqFpIgNmONx4lv3DOkxQZJ5S15Dj341WE
	duZNfU6o8ff0AdQhcmimPnnjamYmkDVKDycbYpuTj6Up4XgheVwbnqeadDXmPnj2
	65pwN4wr6WfXCWrz5Y1qezC8UeJS8jw/0r43WF1zrrpCp3/jlyZ+ar5x7XUyrDGJ
	LcUa5qjKclHuO1BCclTKQZ8+y0nclmtDwK3c1FJuMeoR9GkkQDNPosis02dWvC5u
	eKnQU0x/MZ41uIiaqPWqHLXrjhDOg3WP5C73k8k7b3J2Mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8xv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:26:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d654ade33aso702376685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775935614; x=1776540414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3IcyDvJ1i17Lur9ph/QOElgAra1tTa7mfLQQ9nB/dg=;
        b=ieyBigGmKXqy7Lb+yJfWuPLcnealcQDT7XlAnDxheWoISCXxQ1/J0cREJAdTKp4aY8
         o7nnKi9IiBS8WR/SAs9t98akxelZB47SvjrgqQHcmDq7iuyStz2Luw3nNV9+DivX7aG0
         MBy/B/h/+/sqA6zCLBeiWWjayoZI6aoqncq8q0vqGunOUMnlhjKyCqhiju4C7BX0Y/DM
         TUVvb98752JvA7Um0aLEHJTJYeaFQkFLE6kTvoELxBz8Wddu+0u4KZHmek6S2D8wJddk
         MaUgkFPWWfIZkQOp8RG/xUv601b3UkwqenDwNUShbODcZ3jCqjXz0Y1YfOQO+WF2FdR+
         LA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775935614; x=1776540414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3IcyDvJ1i17Lur9ph/QOElgAra1tTa7mfLQQ9nB/dg=;
        b=cHfwRrG9kU+KFR+FO7WB/pK1sOiqG1Z+7s32eYN9DIrvT3A3j8jaNOyVjiW2r8qztD
         2O5UaWgRaMa6cYLnbUyn0b+AtELYYhAFDk8ymT6iglDiBuNmyKZCfSbOFBhPNJ6XReuQ
         ZEzNIHlzC+QVSuqVMZNZLRW15zukNfeqL2bKw16psMuWhF7Dc2EUdRJk/JV9cBebxWtD
         08FsG8BBCtOMMch0BET06p2OVRUm59W97BW9qtReYBkvFY/0Q6Z1tX2osdseEr93i9OE
         Sj1Utv70pMWU8bXyHWM81IuVK8AiD4Fdc1eINIwZEiG3HM1+DztOlxWxAJKfwPOyegV5
         bsKA==
X-Forwarded-Encrypted: i=1; AJvYcCVreqHjrv5miO9gHeNowGEpf/iJM515eJuzzY+E8pM46YJfVOm5D83n8953W4kqy1xuh4crZtnshGt5L4US@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36TGdpx/Iwv7VlnPnsWxZqU86zY6oKMZBHhBArzyB4lGCg71o
	xADC+vROt7tIPgdT7ku3pRC/WNbq4fAso+wlAS//OON2d5RRg1syH3/kD1W/Nk/b9O49LcnAejI
	C0IivU1tiOMEPh6+SjdPp/BKZL4svG9cD6TKeJtxNf/S3xqDaR6taeOdTreK4Q9lBbJZQ
X-Gm-Gg: AeBDieuowN/cwGJC+eXXgLD9uhDWxQewKAdXUCdCfW+AIpeC5G5VF/LIcNiYZjstOnl
	K6cGmtw8lkSaFJ7f8GpQ4ooqmdCFdCwGkVSZ0/DcI5g3ws6gdspXIFB8vuwbFFxDXiO6/FaBgBk
	gjdvX97/J/3Zfuj7BzPHvpjAb4gg3RA6zZzVP0YVxrCSETXBK2TAEZ+yF0BvQkPMAVdXsugtYBi
	Co+Qh0jeFQP04LTmJ2g0AcNmIcax004CYTh2eDiM8Au5NrOj2Gytj3os07MZgEm4/FAdathNc3K
	xR1Jd+CQP2HTb7l0XmRekrs8M0N6R+RYUJfj/gnzAPliwdt4Ef9rcWmwiGKVQM7veEwyKWD66Md
	AogozmFKZL+UB+L1q4bzgg1Ynxu4vPDrxUbEz2qtz5ybSsNFYDa7PBH/+RMqoyWmDj0K3+/oiOQ
	XOmaHZBSb3xTEgAfIg0ZssG6crVkxvGgVBEKo=
X-Received: by 2002:a05:622a:150:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50dc1b85089mr154121961cf.37.1775935613934;
        Sat, 11 Apr 2026 12:26:53 -0700 (PDT)
X-Received: by 2002:a05:622a:150:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50dc1b85089mr154121641cf.37.1775935613469;
        Sat, 11 Apr 2026 12:26:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492710ccsm14248581fa.7.2026.04.11.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:26:52 -0700 (PDT)
Date: Sat, 11 Apr 2026 22:26:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 39/39] drm/msm/dp: Add MST stream support for
 supported DP controllers
Message-ID: <lo66frdojl4l244h4zvo3g7p6saonytsf2mej7cvuwp6qc3ejr@pjsy577o2e4d>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-39-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-39-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69daa07e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=J3SxvE2sJgW6avChXnAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7iuXHq54PMx-oyoQk1CsctdmUCqJH8c5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE3NCBTYWx0ZWRfX7N/eN2MUWZw5
 kFavRV9ekI98COfqHq2vjnRwLwSV3//jr+yadaBaJVxIkgOb2LFS7tDCovqVf0YPmkpdp8hrP09
 yd/jTZC4Cvs/wDZRC6GhuWxvAVGDDhHBuur/qr2fECluXX3te7zAE+UYL3EFvUi0QxbsfJ5tmzo
 4woBr46JcknROzBHlKBXvxg281RS0BNi71oFQ7wTpo5AKjKcIX+yCFhDEPFpNolWc5kHJy1JGD/
 od6uePjSJ/WR6RqR+TNQFOgrnf2mOB14x1TnVXzpUgpAZGnGDBqcM1uHJRtsKkpu3yzNU/f2mL2
 4fjOPOMBJIwsv/SBIHjQnLUrSihzHDVx3rg+gwl6Hb1/MvSuG3mv3G2h/zsbHZQ2K67EjeYPpo7
 ViRyYqHXzqrdMz9SuNwJAERZeuSEgpvu1a9XA033bpkU8DqMfF46e0HQuKJn2AwOz+jj7I8zJla
 Bdnc9CIZiWkJM1MkHpw==
X-Proofpoint-GUID: 7iuXHq54PMx-oyoQk1CsctdmUCqJH8c5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110174
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102818-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF9AC3E1848
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:14PM +0800, Yongxing Mou wrote:
> Enables MST support for MSM DP controllers that support it, allowing each
> controller to handle up to two or four DisplayPort streams. All necessary
> MST support code was already implemented in the previous series of patches.

As I wrote earlier, we have this information in the DT. Please drop.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ca89e20b7563..f632b4f64ccc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -107,16 +107,21 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_glymur[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
> +	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
>  	{ .io_start = 0x0af6c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 4},
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}
> @@ -133,38 +138,47 @@ static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
>  	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sc8180x[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
>  	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sc8280xp[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> -	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},
> +	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
>  	{}
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

