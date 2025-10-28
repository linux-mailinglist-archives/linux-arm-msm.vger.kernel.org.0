Return-Path: <linux-arm-msm+bounces-79293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B015C17045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85EA31891F10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEED3587A4;
	Tue, 28 Oct 2025 21:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBP3t+ws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLGqrvpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C23587A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686771; cv=none; b=M9laCOGkXMO59drD3IucyfybCmC0mPFEtqLiY8Haafc6VTJIPmIBeeJaEpc7MCkDR8jThUipiVxPETeML/jz0R3EoI5ilIatl1Pwm9IVmtW0U4Sq4SgUNh6F/w5WNR+PSm1ZRh6pI1FEXOf4qDdmA2wDZD7/0aRuBMMGLdcDRhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686771; c=relaxed/simple;
	bh=4hP7mUp6562MvODeJZ1YTDO+MZGFQF3RLB2pH0RdnJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke0MsieHK35s4HCAH+z7FD+KChoJ7kINn39U7jLrkTk0XORtg49oQP/kG2agv5qHX+O6l2+M96KEMbolw3OMVLpj1BLLpCitQT/5IaUxHJB+m6eMX1hIgeDLV9H5PDeZFX4V7KWlFdHd8YuG9PyQtutD5xQlPN6iD7oJak+yFPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBP3t+ws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLGqrvpd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlNDl2616878
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8ES5R4cKZbm2579FN/u91MD4
	liydQdt6c70evP352k8=; b=lBP3t+ws3HVpujM9Jh9orpxkun/mQgDlaSEi6xnH
	Ptw3GP8dO5uIgRkyg2ghxRhYkHlxS2Sv51+0/xBRPZsXmirXw///p4aFP5RVOXrh
	Jh2awRbjsnZQxgLeptxBVDEqhnJAGd3czALa137sA1zSAeFyDNKHkV9stX7lxyZe
	mD57fYcAlvQoP8eKW40mE1DoFk2ypVnn4ZPz3Mq5YEizu1fu9Qs2JM+GKC80Ye2V
	DvZ/DXRIrXk4R0zu/ExqS66kHa003dfXw8VIDL7rV/2TbRp3peyQg65C9i4d9OqG
	dXKX2GVpDILSZLlghT8E1lPmUIvfmLPBPXn6b9la9wd0hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y07qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:26:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88a5e70a7so10959051cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686768; x=1762291568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ES5R4cKZbm2579FN/u91MD4liydQdt6c70evP352k8=;
        b=LLGqrvpdeXeM9L/dF/6e+rpLbM0wf2/a1Wkz2+TrHLyM7zf3puOFl3nFe0xYHj8LPY
         +VQwvUzYt47GNWD9d3HK/wtvAILMir5IAfLuw44bsFIaLD/iDuTJ2RNBLS8WONV6l+Qq
         xvLYzDdZrwHbOcFlWzMyzDwzj2PZDCBoXzr4vu4wMzd3Pp58uuoo3tTwvHqQs8jc+pbt
         0cue45BBckA+lAPrE0goErSG/KuxZ2T2SzCT3U8mxj4GWhZLXOD1ffB8JM3i2TdXx6EK
         C4hqhHtNiDDNASLzAxlrLyMznbHZHwts8WrFLYOesfgh9p7yvHHwruOUzUm2Z8wJlmjo
         aT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686768; x=1762291568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ES5R4cKZbm2579FN/u91MD4liydQdt6c70evP352k8=;
        b=kQo9/SFnS5ybPZU4JQgK4524RUGY+Y9TXwq7EIRKdp1tXoQg7rsVZ8qGiOBq4R71HG
         mgAbX0XcfjgZgUT4Y7zvbmhiRvRNDHSJwG/xxkrvJtTwlGA1Ga8Q8vn3GtXI1BFRuJ9R
         HlD4MST3bgoQD/t4svs9Pjqgrb6M1WGrE4v9cxn1sVCRb+R13t+VqQj5KY7qLGhpOBW1
         CMsvUyANKuqUXdD7mzPT1CPApVIv4jnq92VsW2dWBtwQr3y65ui6Hr2nAXxDEWRl2f7O
         YT+7gNt8x42DlX2zygGeuAXpyrzd7GvXmwENQ5dgfcjS5x9qLErtqjijkjS37DskLUfu
         eAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr6yTl/gZLxq9hCgt5wAGEKmOrZrqQ5nIVCOArvfxH3IcPjuk6bwa8KmBPYW+DHatsky6AmootQ96bFvrL@vger.kernel.org
X-Gm-Message-State: AOJu0YydmrCHMh+4FqQIU1soo6YVH/gPfY00pHsM/zDebnzs7rMh0wgb
	QAVChT/bzLtDLvFugkLUu/DaRsxv0CuQnKMCbK8Vb/fEfqUYTvVJ7JoRl1nrAjXcNBCm8qvm64v
	D4zHKVzW5aBebTMKyUf3DaSTnVi7sMxr0sMnasN6whQYyGvZ5bPj3l0nvcFL7TCRJNKaL
X-Gm-Gg: ASbGncsW7T8QYKGJ3Yf7l7GDjwiforkgCx7Vx7c4tDgEKoopMSiAPCn0Q9fnwLqtaRi
	GSO2br+9H4jn+EPfKg8o804m5zfslCbkowW6zXaEYnbYTHO3PHJsGKd4RHGQBEM/GmD2O+iOuLX
	WlB/HsGmmijgpr+JboQpVQHcgt/gYvjbKvWhsySwq2oM+xWK3SWzdE0mT2lYFQFpzVz9sPSYwmv
	PRh5YFgdsKu6plO13+HZ2Z4Gu8tgX1ow4Y6WgyvnzPR5HmL+1wQjZi6nmq431XrcYEG6ZCtR5lX
	dsfZ1klVZkIv08fk7U30w5lJCpJemCIfTBGa0CzkjcmeS+jIjjXbL15MLDCtMSlXCZuTKymWzKn
	EfjeiHtHK5WwfBjH0wKXAn9udj/OckOgzqV4AqBZ/iqk2ofwVbaAqEZga4QmsR2oyLppe7bR1KO
	Fu/jDRSS688qI4
X-Received: by 2002:ac8:5d08:0:b0:4eb:a2ec:6e3e with SMTP id d75a77b69052e-4ed08a38b90mr56468201cf.28.1761686768009;
        Tue, 28 Oct 2025 14:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWUsXJar9zGCJLVEydJueQvaPH5F/340n2td2aCFEB4n8xD3QLcbXS00cSHPhDL3ce1u5lAg==
X-Received: by 2002:ac8:5d08:0:b0:4eb:a2ec:6e3e with SMTP id d75a77b69052e-4ed08a38b90mr56467891cf.28.1761686767566;
        Tue, 28 Oct 2025 14:26:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59309eedf50sm1607060e87.69.2025.10.28.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:26:05 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/msm/dpu: Fix pixel extension sub-sampling
Message-ID: <3eqazsv2f2or4l2xkyqetddxmfqmrejlskafgtvbnkfqoutv7y@cjnvezhfwloj>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=690134f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y3eLQpR3wbTgfGwADiYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: OEOz2DezdwMVForJEu6cSsJrIlaI2nNT
X-Proofpoint-ORIG-GUID: OEOz2DezdwMVForJEu6cSsJrIlaI2nNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX0Oy9Bv/QFeT0
 clG5yOwaMNV6S/bSIMpBHYdRhlCp490Hm+MkeNjm90dWHeDM+cOK9uvT2b2+k5Ir8fEIhaDCOtm
 9mllDV9xK4OqgEUNuNumBjFVPugvTEsLL0Ry3nyGCvMzHsu7KTcdD32JO9Cl2kfNpFYYukQe4hr
 8Y4FM8ezhNCOXdH1Pn2vIZ6EeqJWF+TObJCshtsP6iW9Ybd51GaslYDl5XtqZITC5fiQs3scdo/
 GDM50BeItSAn/preij2BnWge3+RGMEY5reahQQ6qdUnQFIqCpdSh4PB4biL7xMrBkr1chrr4cye
 4gwQs0buNfMMLfS901a5RfuRjj0bY8GrTtaASl2Z1fgy+rZfzSBPGRdE4BSKsz0tOhxTBaqixWb
 Q1w4b76CKZO07GTaHLzYiIIs0WY33Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180

On Fri, Oct 17, 2025 at 07:58:38PM +0000, Vladimir Lypak wrote:
> In _dpu_plane_setup_pixel_ext function instead of dividing just chroma
> source resolution once (component 1 and 2), second component is divided
> once more because src_w and src_h variable is reused between iterations.
> Third component receives wrong source resolution too (from component 2).
> To fix this introduce temporary variables for each iteration.
> 
> Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

