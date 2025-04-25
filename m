Return-Path: <linux-arm-msm+bounces-55688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F293A9CF8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 735E4189799D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B4E1F91C7;
	Fri, 25 Apr 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahs2hfek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8271F8AC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602138; cv=none; b=FdU9zSz1A6UWqeDXE1ixxaevyAcYsnunG5jEbeLBxuuG4ct+yhyHsROf9qQ5sNYB1R7/nuBNMATE3H/wg/KauKgoYf6zXVzolznw3sKj347f5cMcwTJ2D+Gk8mUWW8YneOuEHgR3qpg26lL5BEgZ0xX343DVwOv1JLUj77bjARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602138; c=relaxed/simple;
	bh=/i5UgcWLuEDxKiGtIu70t1Dk5KoukoStZknodJvuICY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdQ1hYv3QhmmcQ/iyLpPOsVRha163Zaq6vR8VF3o4qWAMLlzsb5KZv+OqSrZZWE+vRfAEGSnLda58u11RC9StlYZdoJJAHfhGCVwAPnT5GwfsFHT0WZ/8xbZEJNReJK+3Crj87+dqYlpaSRRHi9HX9wtt829HPY3OHUraC3J3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahs2hfek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwms011503
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wNWdbXwXrbDtrSyadfPM0NWB
	yZ/EPH1YzaI+3UejfXc=; b=ahs2hfekOdy1yU2lbV4V6CCJvQnikpM04vQAUvxg
	QzTJRJ1VBOyAarDBIJmCrm9VjlycRMRrVgeG2EDflH8reTYTtj+wVtRuPXarjOiL
	iVGoycP/EM9H4skx/5VB8JgsvzzG4GnmvOE4JPW3j30EQoMtCwnRx3hxZGpciU9N
	FaoqwwKwVFeihNC+7SFdgfUBz6hGYxu12+HdHKCpFTN/Ml1Ce3M/aijaJaBye3Dx
	i/V9cBbJezId0AFujLYuIGM6kqF8UaXJZlY22GvAskbIdVzToHIdNjfseqIrGIlE
	4Nz2DK+RoFfmjN7a/ejhNmOP+2ubz0R9ufwJhDAbcGGjlA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3sryt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:28:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f184b916so59175976d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602134; x=1746206934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNWdbXwXrbDtrSyadfPM0NWByZ/EPH1YzaI+3UejfXc=;
        b=cDw3TLysB4Nh1R8aTn7QYNHNa3UFzXRiXn2qVktznlhN/zW6yrNYMmOUSlf8tZtTg6
         irU1EI7m8zjAH1SRiGo8G74hzBSgLIJI4/DjboUw7IVb+lCY0cBWspKzBwank8mg0J/o
         dIqd5E1Rn7dBQFeigv4FjbQf7XF/2dO5ugjw/4ABTnfGcZ85jaKvTXSZ8xABQlaWGvxZ
         Wjtz16ZC6CUYQiyIKW1uY0QCqAwAjVWgpilaDU1D9CorTDSKQf+vzm/EzwdpQmDiyPNW
         nVe5fnV2iivwcCjvffNQWxL94Hw4SYuHk/i0Tk3mW3fV/nDQ3HVnp1smBLXT/B3cnP5U
         iymg==
X-Forwarded-Encrypted: i=1; AJvYcCX/oGu79HmrD9ZCvyUio73u9eoLz/9uPuubkN1oTtZqAGsXvmss+eEOmyBb2MdVpL5bcez04MdyLOwCjGIy@vger.kernel.org
X-Gm-Message-State: AOJu0YxRGzftE3K/StkfGQFYk9kyHITVtn9CJWL3UpyR45Hkcc4P9bR8
	koCEYmVlE+n5mkt++7U0pGDGIyWQhRIPnb3RSztL5ASCXzvJlAYlK7tvPzwfSu/x1U67XqliKyr
	Eb5IbqyoVrRXkwp8d8POJ+uFcII824Ulxah0BdqXUbSqK/sqotsgXYM7v+4g1SU3nXf/ENg81
X-Gm-Gg: ASbGncsNeMOwXTJTYYSjT4N/KbuxCodbQnJJHJV17KgcSYkt+Ady0SnqEcROKFPNDzu
	ZyWhClZWhYzFE8E1aOfdgVYvqoE2CA4biKrhI9PPRMua1tXdGruNsE0mxFr6k/mw/RLI8eJJ9IU
	6x7ZhzDQ4v+TbCWO7fufSrUQBfVVHL8VO0kOfosy74Sav1f07c6eHkT/XF2Cr1UKwjqFrelemYH
	yl6dnN1ygjiWAQ4UJx+GAR1z4EcOCmtzt8PtRgDclT69SwhDZKHPU7HdzHyO0mAVrVevIVLiIp3
	A0u8gJmO6bI8u666hZSllyEHgYZX0vgRchzSfFQU1qsocJENE/WWiailV3PF4DgVCtbq4QMw3LI
	=
X-Received: by 2002:ad4:4eaa:0:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f4d1f9106cmr3989246d6.28.1745602134008;
        Fri, 25 Apr 2025 10:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmS2ePYsS3k2muQIMSmFlLDqEKwljZc8U6Lp1km5vwYp5+1jw+OeLFxm9hhYBuztNaj7Ji3w==
X-Received: by 2002:ad4:4eaa:0:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f4d1f9106cmr3988706d6.28.1745602133574;
        Fri, 25 Apr 2025 10:28:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb48245sm8148011fa.37.2025.04.25.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:28:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:28:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eQIcJPRjqDqp_JcEY-a_NMV1YcbcgWy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX0pSN955Tqm+T uNQqBOfU3yKod8fdqOkuRAIN8T3oln5YU9RqN9UhNbAFXWJRdXzsTMpmsiluAv0U30RYpBWVYbV EtaAo9cxNsFRA0ljuytxQO0Ppxlwy3MXXRNmxhTVWo2o79oytuQg7u3h+C85LZWL8qOZbbfk8ES
 +csbRMBqAekfVjOv/G7iz48V9TlEZzais0rZoNppp9TEBIUs5SeisdUADkYYQcMOMxH546H88ep FoRFb071weLj2eOXDjm7ESrGvqrA7JzBQXKleHgs8MdtbSZbZcD5sgJbPyuZKN4Xf3LgeyoBOiz DBW5njw+d4GZ4e8RNAT3uMOr/USZL88b6QS6JqJEaca1RNcWpHV5ILj9oITSmfMKu5eZ200aU/5
 Fe6jq1jJv3E8zlFT6XQhW0gOrP7mq7zMNOWzpYycn91+9+yC6hhm3OR0mDc7rSX18/afLyfd
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bc657 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=GtH8KZfWUhV3EOIkiiEA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: eQIcJPRjqDqp_JcEY-a_NMV1YcbcgWy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
> Add the subpartfeature offset field to the socinfo structure
> which came for version 21 of socinfo structure.
> 
> Subpart_feat_offset is subpart like camera, display, etc.,
> and its internal feature available on a bin.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Added debugfs entry and described more about the field in commit.
> 
>  drivers/soc/qcom/socinfo.c       | 6 ++++++
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 5800ebf9ceea..bac1485f1b27 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -154,6 +154,7 @@ struct socinfo_params {
>  	u32 boot_cluster;
>  	u32 boot_core;
>  	u32 raw_package_type;
> +	u32 nsubpart_feat_array_offset;
>  };
>  
>  struct smem_image_version {
> @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 21):
> +		qcom_socinfo->info.nsubpart_feat_array_offset =
> +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
> +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.nsubpart_feat_array_offset);

An offset into what? If this provides additional data, then the data
should be visible in the debugfs. Not sure, what's the point in dumping
the offset here.

>  	case SOCINFO_VERSION(0, 20):
>  		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
>  		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index c4dae173cc30..3666870b7988 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -84,6 +84,8 @@ struct socinfo {
>  	__le32 boot_core;
>  	/* Version 20 */
>  	__le32 raw_package_type;
> +	/* Version 21 */
> +	__le32 nsubpart_feat_array_offset;
>  };
>  
>  /* Internal feature codes */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

