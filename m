Return-Path: <linux-arm-msm+bounces-53100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08615A7A3AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 15:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD506188C69B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 13:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8526024E4A6;
	Thu,  3 Apr 2025 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2laoKAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C732524E00C
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686820; cv=none; b=DwFVpsSoe+/w92MT+ApoPhiEGVD/rM0c0gdGfGXp4XCsvYSfyL8T6pDqGqJTPOm4v0QlHNl1iDapj2MAfSW5kRqdem4u+vQ55Zkrw18YVs3C24e0CKYo/Xkjr/hVNLuXPNYvhmj6t9yslHNPQ+JW4ZVyyqW5Trw0JvH+VovkVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686820; c=relaxed/simple;
	bh=4UXV55D5E+H6TMtvnN0wpDmx34Ixoq6zIgrCe9ek8Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqnJd7XtaDh7DAgsFTe9HuxoI5uqFPRmHvmXMJdK4r+sXnfvsarA/Pu4xuVHK2VZ8QVjLT3WRURJb2DXalyw8QBfqItXtwIP9qm9be8Ikl1KvHn1uqRn032ATnvEz1oWK2AGDd3NSiWCdftLR93ufgyiU1kKBzjVkakd1xSW4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2laoKAe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339ruQs021444
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 13:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LB70BJhIJ9nick3PUS819gLe
	WF3jTLiD0aFEbtE48eY=; b=f2laoKAetenZ7mjOf0TW1z061ADqfahMoXmT/0k2
	r4xQ9skOcFUsYllGMxni4nuN/6Pbv0IvEfq+lIcOmq8NxvNbe3cXpOa9K7JQeBCC
	+tamh8qTVbOq4aRi4feT6k+6KTGyPkpc0XBe/wAWjH+0iz6SUrAdEOi82KVfVGiG
	nYg5C3uf++NPYTmP7ZfZ4R8HzIsDHGgWVkOS+GPOSicPNNxa8YB+59GsI+DPrrmJ
	0tiT2BPstRoTepEl+stV4LLnnZ4tlD2u4yJxzinmxAIawHjsVUZqQ33DUl2pC/4V
	KujDl/pu7iZa2jyjtYkkZgS5cp8cuCT68qyKjnOGay9bUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sbxy279d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 13:26:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f7210995so183636785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 06:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686816; x=1744291616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LB70BJhIJ9nick3PUS819gLeWF3jTLiD0aFEbtE48eY=;
        b=dnf+Vr7+bVNkJeKvPbQW6YW4tpGAPrqEhd1XH9KLA2u+08lEd0n3TWhLwVorPvRZ44
         cyhafGFtgyp382MCglcQcjrokxbUboR36hosGkPzr2qJSkF97+9+r8o0wK4578/ycUsq
         /zj3xJUuD1bZQfKoETF40KkpNsYY1bZ4Kk1iuUekzM3rj1JBA92YqUWHGcqHo/YaBkc2
         zMXAkP5yUd4dJHcKcYpuoK7KvJzfFS8ZLYCu0b08tFAn6CF053zVgsJnABnI2/NzPjs5
         6riPact5VFO1HY5uBdPnKzvU0sZoJAsH1AIWka7AZc96Xj7wyVlkACKUzp6RA3aSCSTT
         i8vw==
X-Forwarded-Encrypted: i=1; AJvYcCVIHWM7FoxJ2cqM8DyQ8cHib+QLRVGMe7TK/X6t513ETA/v3IRWtVxYXbN2Z56ewR+ctL5ECHp5tkmSvuj0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7USVd4nxayfM+76ICYrITREiD+lKu6pWGFV07al8DJuRpExNl
	RqP1BOEo0ezsuuhCxy1H/8TeT3UMpZnBwzcjq2PHTcM7tk5wbtJTDN4bJ716QcIXjtJxbr67Qz7
	b/wPyaoCJ4MTmraZFKPOzVRpjA1p83RFtgaHzA2T3RsBZ15XZ11eiA2tYs1MOeXgm
X-Gm-Gg: ASbGncsdrM200xlj0t4pDPsoYQ446EWo4ZQzDeu3s3j/VLPCuSneUTAYqnKoCCsxn3z
	/Dg+i6oBYUy01g8YVCcAGURqIijbWRjBePoqvzaVJhRtqW2WeGRsC414hyAqjprRFGjyn94s3B4
	zu3klXxvFrYa177ho7UfvcvtBzEF5mJsdB3vG2dpUz3WuvDtaSMTHbTqOOUV1RMqarJIJp7bS2K
	4VqQNrp5AYmhX46SCPQmO7mkiZ34Yc//MpN15hnfAjErrLVU6CsLBVBGFdVPatcHdZ1ipA+5ILV
	AR69fPQIVXjJNj5ujuW4pu6TFz1rtjgfDuTL5goQnVjiIovHU4iekG+yEv7208GvKr+Uql3imS3
	cr3A=
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c76c9c0c8bmr527678985a.18.1743686816452;
        Thu, 03 Apr 2025 06:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFatznasd8BW/kd0W0ZZtY8M0I+aTh8Ks7eY6cLGkHy+GyZA2Kdm0ociaqWKYTfTkDL5hrKAg==
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c76c9c0c8bmr527675385a.18.1743686816087;
        Thu, 03 Apr 2025 06:26:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm2134281fa.61.2025.04.03.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:26:55 -0700 (PDT)
Date: Thu, 3 Apr 2025 16:26:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Message-ID: <ggullym7srgx7ucnrsi6vhtdmhesgsxaxsnijywfpxo6uclnwz@vamc36efaxr3>
References: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
 <20250403124247.7313-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403124247.7313-2-srinivas.kandagatla@linaro.org>
X-Proofpoint-GUID: GLzbmg1vv8b5Op2hIl_VcEaXVydDSkrp
X-Proofpoint-ORIG-GUID: GLzbmg1vv8b5Op2hIl_VcEaXVydDSkrp
X-Authority-Analysis: v=2.4 cv=PNAP+eqC c=1 sm=1 tr=0 ts=67ee8ca1 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7saLMaS6oewID-XHOwYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=895 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030060

On Thu, Apr 03, 2025 at 01:42:46PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Currently the VI feedback rate is set to fixed 8K, fix this by getting
> the correct rate from params_rate.
> 
> Without this patch incorrect rate will be set on the VI feedback
> recording resulting in rate miss match and audio artifacts.
> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Cc: stable@vger.kernel.org
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

