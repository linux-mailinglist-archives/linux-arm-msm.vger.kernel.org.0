Return-Path: <linux-arm-msm+bounces-85019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E7CB56DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB96A3009109
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C691E2FD7AE;
	Thu, 11 Dec 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGMORa3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyWCfJCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4FC2F6597
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447041; cv=none; b=qX1I1pfhTXZTU0/oODGquel3I9zVJAqTDVu02xioNS8LQfi/v8UVdr9v7FBj9z8EAqOsNy/gxD/yWvF2ebxkk0iGckXYtmmI11xgmanS+AIJZFxk1zxtdPhnS1xWKPeWKfNwS49L/G8IZkJj2GTrlS+4V0QXn8shADrieCxn4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447041; c=relaxed/simple;
	bh=eaaCpyMI5gJRIY0y8iNjNydTK5JRo+vQyoZhOeho9zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjQObUcnTTVtHN1ZBA9I8qQalM7he+SuC7cWYU+SIQ8iNXWFct4DFxqmSNqfJsptcTnRBSZnGEB0me7CpjiAFAdvoa26MVs7Dk/scwPkzXAb7/s/FISKBf7U55YNkOx7zTYRQG7R5wE1isn0St5COsOfnf8QimCvvcuv1L8sgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGMORa3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyWCfJCG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZP9X898915
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe
	/Sb7eB2QeGBD5SBBMi4=; b=LGMORa3hIe0vRuX9KJi4+Vn1SOBH5IGz4RmQag6W
	h1EX1o3Ga3xKpb+G8FkdG1MbCFtO0bxLygomtve2Nsc4XZk/DydoTYmRtPBP/imw
	qqmarpbO0fOo7DHkT6c9qu8GvsFJuNpAldoE3ozfYkYjaRtXv6Lj0/3828V+3IAU
	NYuetnZjYgc1TeYBX5abJXlKZrkvdpsOIRMdSSS0RZjzc3yJlE/B0ErftH6Lqd0a
	ZTd4B+k5axibE9SmIOEEhXtBeaRs0Yc3ZTm1s7Be+x6YRGwier4GcNKQtXqrVcnI
	tJgP6pY8JMlFkTOBmAW8qYNfGt4lpiuQKTqTiU3GlITuaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpagn6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:57:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so15585811cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765447038; x=1766051838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
        b=dyWCfJCGqYLYtsGeuJqt7tRGpg4qp24CH2fiWmZ5avk8xolctjyAxG8ifkvBBREdwd
         2Uomb9h4/2B08ESJ4lKka7cnN6TmFig5HDMo3meXtkv3QHK//un9RYi/ScTtwvYTuDY8
         dEoi3C0OdJYalb4BR8wH1w/RHbyPFfdyH1yQ+dZCsTcS+/72FiIEHjSON93w4AiK+Vxl
         XAnP+cD4dCCtIT/SFdi9vasuXRCOpOpb0SvdzHyzXq0+/WmvF2309MZTx1fofVUIRi5m
         +UpxpQnoQow+knhVo0QlhxZex9G/KRdrgHREj/BDS2ca1JerwnkwKhyDtACIROUfklBY
         5sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447038; x=1766051838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
        b=T6/oLJFQ35EeyTi70tpPwohnK4vuOrwx674GiwaowDVe7nNV6AZK3UKDJHM13asVDW
         iE5x7Z1Abmf1t84g0bJOxUCpukeRhBoh+x9IE1noI9BM3HvC2FXtnRKrsUIDqoKapPrB
         yvIwbrrW4lbwh9oi2Bm85Gi3TXTnL8XpAeNcSYa1UEH9A8v80lJL12AfJb8aVv4bCvMH
         lU8b2j3DHWlBnfAUWPV6gVeKccf/c4NvmQymjulPk9gp0bBVR95IxioHlbuXlRKKFUD6
         lecxSWPBLtvIP1EU0QwUcfkeh0/TXUEvcbcI2oUbwaeb5DdFRzLsx+dUFd979pjOADAg
         NbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT3KGhaZXnoxCAX9hE3tW7FcuG4C8cPIJuPucqCx9YovgAoTj9AsnhY6GmjZofCb5ZEhJ2Xe7qXZ38CFK3@vger.kernel.org
X-Gm-Message-State: AOJu0YzguxOkwdcCfxC3uIrOTA1Qkfo2DU+yJe9HW2DzyDc2BOYcgMT9
	ptavdFN/TNOPx2qhK61JqZyU/s+Kto3p8Xtbv+rYIyLaCZy3T39F9aQ71jfMeTH8SvtmgueReYm
	BDT7xxQ5VtNl2Ao2YMUg1+7I5RmRLgirnHd33n4vzUls0wa4c+J8dVp8DCfQTDaJiglLr
X-Gm-Gg: AY/fxX7ibE+XaGN/M6wScQHSdVl4QrNzvZRD7rwVLb9kFHROQ8XiQDd/zB/pv2dM5mE
	0f3kQ7X8AXGCT3AkY2sGcmpkGB5fq+Za9GU+dW9gfIq7wOWQGnSitarO41bAoq5AnTdzGvPYCdp
	N57642F1ZyH3alzaAidWMe6tg2u8YUK68+JWMwzVsOvuZFh2MvKNV1og7LD+84VHlDm7F9TnYFh
	3BDTurmXde6eOHbk5yYsZs4ofkF9PgrXcd8MTAIklUAJ1BDZXguPqXedeYZMa3qULgzYJ0bVtev
	/UWrruykfpx4gL2l8MjYUt+9uYJABM1IboV54utKYRKaQuGAOCqAHF3gt1rmOEC6sl89yh4D9c/
	5w9bghwdV9lHcvPvAOJMAH30VpKUMpT4vGgnxBy7LSgZWXdlMcwrHAmlpEIreQw5a2u9S1Lm6zC
	1DTCRJ8Wkb+yPYdBrgMjzWvu8=
X-Received: by 2002:ac8:5987:0:b0:4ee:43e1:e591 with SMTP id d75a77b69052e-4f1b1b4813fmr74174131cf.58.1765447038318;
        Thu, 11 Dec 2025 01:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb5hUtfkJ4sz6QcApdznwiz9dx/Ohc/0AOpeR1lWkGWc4CTx0nRmG0uVUSAUkJYXAcmZnc8g==
X-Received: by 2002:ac8:5987:0:b0:4ee:43e1:e591 with SMTP id d75a77b69052e-4f1b1b4813fmr74173931cf.58.1765447037842;
        Thu, 11 Dec 2025 01:57:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379bdsm724574e87.2.2025.12.11.01.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:57:16 -0800 (PST)
Date: Thu, 11 Dec 2025 11:57:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Message-ID: <72epnkogfsguqyoefmfawqw7gr2molejceqe6rvunpcfrw3s6r@75wvtvd3btjd>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Proofpoint-ORIG-GUID: gX5umclDibzq8CJHgL9DYOkWbsbi0lMz
X-Proofpoint-GUID: gX5umclDibzq8CJHgL9DYOkWbsbi0lMz
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693a957f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NSBTYWx0ZWRfX6CCSKdoCVMDj
 HF9NoNeUTCuJzTYp0lWRgBBSTnk2bhibFP+PQV1L9h64EPMAT72mrzY8iEolTdhkmDQBKlkKmCB
 wLHNnTNuyBaqiNHFNv5kVAkE6jAmfDSyBvRKDTR7g0Gbrp7mHw3XjpmIYPK/0tF0qRJDP6rS+0i
 Ja0ZOASFQFukXj2AvAleCtWIMcL5bfwgmGYwGHYI68lWnRYjbkf/lT0NV1vPZocwVyKIXvet32R
 N9DnLZroI/MfBYHkxkQ0893bDhlfKvHZT39NUel7BNFN7aTEVTReGQhn0KqdxaWnyPuk/qGw2Md
 W3fpnFUKNDujPFJODzBpQ00Z6aoTGh3/RwYGLiddnwwBGAZ7ljsGVG3RLMelP7P2GIoDKnmV79C
 PHG0rfUfbzmZ0vBgvVrCWehP96wP8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110075

On Thu, Dec 11, 2025 at 12:36:30PM +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> Cc: stable@vger.kernel.org
> Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

