Return-Path: <linux-arm-msm+bounces-60665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E45AD2325
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA23E162177
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2CC214232;
	Mon,  9 Jun 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLhvuV2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9420FABA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484739; cv=none; b=cDAby7ZTVpn9y4F4gRw7nfGHi1T8D+r+JhoMcaI/le/sqhJvQYcp2B5bdEtiahpqYjkYUdA2bX5V+wkcrgD3y5OpkhxSeOWeikDrW+BREsEfse2gZKB4ge3Ds6vSFwoECjgRXNyCQ6R40FgiCfExmDkQ/7sLWoYzF6jxaVSwHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484739; c=relaxed/simple;
	bh=oGQPDHyt8o5wmupzTzzqpDaFld/IFzmUGTmIhFY+rew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0AkHZRipqqpzn0L8IfSyVPNFL8RtbOqNNOC7KXORa8UG0Qc0YLJAtKD4O+YilZt24sQEYbpifpxiTUruWgcNGROtZv+7c9NNsesQZBObRY2aYLlJG0nV9rJLE2aJ3fmVp6ck6lRtyTZ7Ny18SDEdIkpvDXOSxk1HDtopEh8b3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLhvuV2z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599GkJL016292
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 15:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m/oHPEvdt3BMym8AUpjKM5ag
	08QdTTyK7Hp5/0bClSc=; b=mLhvuV2zbVR4/brQWwKuFElCWc2siOd6LjrZ54O8
	5c8qtXaINXFQjudluqcQOH/fKNAlGP5dMYJ6T2VaQWXtDBPz4eJdH2PeywhNfBdU
	H5Pk8GIv3o1f2yJpJItOW/v2u2gdVNWNjVDkUPDS2YEnsa0JHXB7THnXvkWqKL+L
	Q0pdwBfc3a5zlKKRcfUNdyzsINZhFBdnx9NL5dIRrM0ASaaTZ24Ogs6GXcFTCDA5
	VlOCTqL0GYw02L/RS8+k5fM5ua5qkGt2P4bUAVTVtASc5y3q482bu8wqy/jByh0F
	nbYKLEFjGNFFNiKT0Y/AD6F2qvrWXv4f4I6WWJmBQG0mAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75ttgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 15:58:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so264248085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 08:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484735; x=1750089535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/oHPEvdt3BMym8AUpjKM5ag08QdTTyK7Hp5/0bClSc=;
        b=iYCrNEZEJJguWvkdldk2urHucgaZLWCIdzRoezfFf8XPGSl5h5jScZTS3nokBDIA8Y
         ea/BQSLxojGpXEDYXnrSVXP9bVcw3KqDZs1u9FSmoaE762IcZjN8O/wNv7fyZbV1aTXG
         lcIscybXnboy3TagX0JIQRCqD56nVMKbBKGmK76GDNJsVaAybidTiILlFJNkSQUIfITh
         obhoEauooAAV4avz5ScQlcA61lTRjEpfshwD5l1SWazsHjjLKVddlMlW+VldTy3I+0Ix
         wpOobnQeKeQqgZ7ikZwPf1fbbcmqX3HMEnbvNZ1J4Ww9pfORl1WfWkaUupnta/XnOCI1
         RhUA==
X-Forwarded-Encrypted: i=1; AJvYcCWe18jIHPIe1vMzyv8pEREvcz5Nd+tRt1pgX3DCtW7aQn3qq1D8G5XaHoV0WZ1IBJnEQigMBhukSMW7V/VQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbLFp4LpXzFG1RRxsc4VOjbeMSZoBvOLRLeZGz3ejoshi0ox4
	IIsHgfbwPAzKRg0F0L1z0IzFiZFKcvUqI+PI3ImiVSH6afb5/pfqw2H945ZkleZ+VbShWZ7h8E1
	XoFkX2ZoDuDVRX1I2ub3lLnWGK/o8UmW+wpDCcaf6PnEZRH0Jwzeq1o89cE8IqNZ3AFTo
X-Gm-Gg: ASbGncssazVC+qTbDF+K7Sr1wlZH7AvL2OJo/SC1XBUpDxOmdO4kPe9PUZqxG5CBB6V
	pNhrYN0xsEW3b7VT61WuROERG1eD70NEXZgmge/dRS51yEq1JtMoW407/lZyXjTyE6t8Pl1uK15
	AEYexUU96zedWxsMi5TDLtuK03ZFFQg+5hClFvC3RbYb3QKGaXSczlWZsSIgCSp1h9WbLiIykIX
	lzPR5BxbfaN6Epvg8uGOy1OZGGNUDu8iPMrSkWN4pwsDUPYM09uMSurQAwK0StUU2XvklHYhT8Y
	XI5lKOe6Ml8CKdvum92PYjYHLv5iIJS1xu9rz4MMfRlAkjic6yUyUz1vIbG+C1z7dVFO3leEjQW
	RbXsY0x8sQg==
X-Received: by 2002:a05:620a:4385:b0:7c0:c469:d651 with SMTP id af79cd13be357-7d2298fe1d0mr1994330385a.57.1749484735418;
        Mon, 09 Jun 2025 08:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbNI21KBX497/aUWP6ZoFK3aYx+NQWMyhtvdoUvR9MJJt1pLIO3tvv8ZkDsXU7I0e7qf911g==
X-Received: by 2002:a05:620a:4385:b0:7c0:c469:d651 with SMTP id af79cd13be357-7d2298fe1d0mr1994326285a.57.1749484734962;
        Mon, 09 Jun 2025 08:58:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733280sm1218659e87.240.2025.06.09.08.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:58:54 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:58:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: fVhs9oofh4Pp1qBQU1euR-k7alhB2OY1
X-Proofpoint-ORIG-GUID: fVhs9oofh4Pp1qBQU1euR-k7alhB2OY1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfXyBhkqtNfJPWj
 O6j14qqsk5WU4D7iX8HSD6691tsWYujXVvxtDhVQQ+4opS+XjRD+00KNpexDfaoZW8NH9O8i6wz
 gGYkTVs93h+j6Az26fzkdVsBqaTbhNddDq3DAa83J2gDl5DmrO3V4LhKFdhpEk2mwfDSoclhJS6
 ockaXD+IK0FcfmY90w+jmkMn6+QtZMlxx/ddpXUEg3rb7Bj2MsleM5yNbOrr9yp0fBRtFmPalkh
 1aU+3bWO2JLi4wjmSXU43yBoPp+wDHlTVYz/us/w74WzsS8LhVFn2udVHtwvnjgmZOC4uDYsfF6
 oUGCBkXfx/4ppCnHXPRl/Vq5IF7DoQcQzPaqpwosTc6UvRaen6uqDwavQYa8nC3VCrfvmltqVqf
 LrY10YPMCDNukA/4huidzbQxFsoTzBTZUwPfuwpPI5lTo7j5wwxq9Z1i6dR03j9S6JEeS/A7
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=684704c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=a3mUzBo2FLGOTCIFHJAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090119

On Mon, Jun 09, 2025 at 08:21:45PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For MST cases, EDID is handled through AUX sideband messaging.
> Skip the EDID read during hotplug handle for MST cases.

Why? It makes sense to read it during the HPD processing, ping HDMI
codec, update CEC info, etc.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> -	if (rc)
> -		goto end;
> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

