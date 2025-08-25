Return-Path: <linux-arm-msm+bounces-70771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C05B34DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC5C4870E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49A8299A85;
	Mon, 25 Aug 2025 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnqMBaHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DD728D8E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157117; cv=none; b=mwd59Ic2qE9RT0t8ybfFJso6s/qmW3oP1EpZDyJ7q4H6HaGOxXXQrcvmuQfihVU2zeoIIWyftJ+ceKKupLxySw+H6GAK/xaRJG+vgKlz/9z+hQ5fyESHD3Hi6YvzphkGHkoU5ZeeFE+vZ8B3e/x87KrGncA7OCrGY1KSklxEALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157117; c=relaxed/simple;
	bh=5r4MZoj0Y5JzU2+2IPZhkOGCJXBlDRhkwuEZBX4Z+xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBzbQ4I2fXguReoRdgYaYeNvLW1+U5h1zQxSKlnbZgKCM7YFsH4+FqGkr9OW+a9beGnHyWPo5Yz437kdO1ZvdLh9T0i7n2UCl6g+u56YpFlyXCGWj6EuJvMAxlSb8DSFuKnUBkySBd7goJ5+v6tzE1+E+vzG3szk/iUtSAyRK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnqMBaHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFfI2i005929
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QkdYyByc4qu2z3KivFhAjolM
	bNa7uS7Ln2Vatot7HuI=; b=nnqMBaHhCoIZuQmlmcrujNwKLGlo9GshRQFAxeNU
	4vylH8cKvMtUWWFI1ddEmpSMjNhpINqsN+TsNR8ucOVrKo43CbeGn54aUHeutiWI
	4xuMTNz649EhZ83SyTtXrFykuoVEu++gmwvUEHqpZFDItF9PTbze4yDk4q7PY1Qh
	qDa51+eGeeObAmirYJx2fqGDc6eIdY8yyhy02nhS81vpj4513NPF2jrXrqSOIgh6
	AhNAISH+3NI7ZzGdYWXGS1DQAseOC3f6oHhbaez/KJ/RTpx+6/kcgCDdgY38Pc6z
	oAz856XtwAsgxMKqkvl9mKU9CBxrGnnAV3r/Ft7jT5qmAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpervjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:25:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d903d04dbso94275386d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756157114; x=1756761914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkdYyByc4qu2z3KivFhAjolMbNa7uS7Ln2Vatot7HuI=;
        b=WwCrPqtgrCFtlV9kygkdHfPJXlnCDUaaJys7D7RiPdw7B66u9QN+KnY5DT+jDFKYnM
         q5fX6UMTOr0lZwZwrf9kbqBl1Ied1Td3qF/onXo/S4AnQLXF+/UuO0PRpqueHHhDB5M9
         OcfOboNGxUr57fN4utdd0Kb4tc/DZRAbN0XEPVpy1ViEEofYI0i8Vv3so220iGRXBXH0
         Vxukz+jAepid2P3COooCpkHuBnBuSUfzKH3WRdVbt3JO/3+moz5+tfCXctsvSavx5znm
         j7aC+dyV25uk/17Dq31TMjZP4aXPzMnNTVhVHzKZ/zYclWReJp1bB73zqtAe0wrd7IoR
         1obg==
X-Forwarded-Encrypted: i=1; AJvYcCWB8dDpGWoCtf7AD3iWIPjYF9uUTPAvatKoTThdLj5CCgwPsMG8bYU53L/9X3DcskNBs2Z7C9DtRIpcb7bp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kdFdD6UnwvpjFLefcuadaRU9Nc6flHV0EZ5aReOta3EoymaG
	kW1RNxTLHSnwO5yIh71lW8ZlZ+f1Cna8ked+lri4muUrQ4EYUt0P+KvfL3P6pkUhl1u4Jno6zrF
	SlLJpTBSPS3M9WgLBgaX7blMGgruA0lsYOn2QHrsBvl6C2PKUHlp+KeMNBGnJsmxWe7Va
X-Gm-Gg: ASbGnctqjr/sHbJP0JzkGe2yzx4EjPTmizpN+g0nUTbp6Zu95vuxQLREnnS40ymI/1O
	+Nv8QDehNek6yHSxPOp42u5ZFLtH3NQDgRXuqCfzqrhmo5jcTb9UsAz/PgxfSz6DktHvXhGNgxi
	EzmP2u39dSruWTJ8XDw97Gpvvdwc6PGRCC8ZX4xZ0nnZGv6ynixXttsQ5+d9xRKE7v6mBQjaAM1
	sk8a3Jj993VxFA9UIEDfarBzdmjHzVxMPxW3ZMf4Ko//N6NH8odXdstSY9q/gtir33np/T+oloc
	RHFNpH4fscIpCeYH8Df32OQ8Z2f1Vyh5Co9Js922INE7A/9VYaS1WhQbd5wnpsQcCGuashOW30D
	RqqtBf/qEL0W5IMzb9R7jHLY8ctj5reXj8jzZFozcT82jH89bU7i+
X-Received: by 2002:a05:6214:5194:b0:70d:bdd2:7cbd with SMTP id 6a1803df08f44-70dbdd285e5mr57898396d6.43.1756157114367;
        Mon, 25 Aug 2025 14:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq2rEu+6ixuxBMxYQ8u/Pd+yFWmby54+NU+NTEPnzzeO9/1ZQ/Y0I6iBmqPcH1qtql2z3huA==
X-Received: by 2002:a05:6214:5194:b0:70d:bdd2:7cbd with SMTP id 6a1803df08f44-70dbdd285e5mr57898016d6.43.1756157113775;
        Mon, 25 Aug 2025 14:25:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35ca730bsm1836015e87.148.2025.08.25.14.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 14:25:12 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 19/38] drm/msm/dp: no need to update tu calculation
 for mst
Message-ID: <c3e7aemrnvf57rupfegdetprztvrjyn3setvh7xorehm3wtxjn@mm5brbolt4zg>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: vLNIDeAr990kDifUxphrUgvjd6vXHNW4
X-Proofpoint-ORIG-GUID: vLNIDeAr990kDifUxphrUgvjd6vXHNW4
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68acd4bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rNJhjsDl-Jf4-vzM-zAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX2s3T9xSzEFd0
 9Vn0P+Y9oeC+/MZI9Y+mz6KfVbohDOFuLJbc8/3W96ih6TluQtF0fGHy32nGUnXLZxjPUx0wTgm
 g39RblZ+spUImI4DPm8Na20ZUDKlPjLIIeE0AuInD1GK1LXpOgf7dknwrenaeJLuf0DMBVqxrso
 vMOaGxswcdkozkXUAjurWwZj0uFug1yK/zBWjy06ifCHg8ACdJdOpLaojRX0NQCtzX4mA7YQXCW
 vuOBp/xpNhP5FWLML2iZvnQQwU8s/q/Gk5h9vSiQ9XCMv8Y2WSa5J8/ePg3eDUtB5dUNxgPGNdP
 pNxFxOhfduq/I2eqxYo72DYqzXTdxIjBP6dsRcr4yNexlrmOj7ag8jG1M5dVtszV8SnssL0KGsB
 y6vbKkpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Mon, Aug 25, 2025 at 10:16:05PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP stream is transmitted in transfer units only for SST
> case there is no need to calculate and program TU parameters

comma before 'there'.

> for MST case. Skip the TU programming for MST cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d562377a8d2846099bf0f8757128978a162745c3..c313a3b4853a1571c43a9f3c9e981fbc22d51d55 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2685,7 +2685,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
>  
> -	msm_dp_ctrl_setup_tr_unit(ctrl);
> +	if (!ctrl->mst_active)
> +		msm_dp_ctrl_setup_tr_unit(ctrl);
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

