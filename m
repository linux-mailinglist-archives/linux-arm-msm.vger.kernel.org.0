Return-Path: <linux-arm-msm+bounces-51622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59AA65279
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BD8916F1F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898F819D88B;
	Mon, 17 Mar 2025 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iu18zEvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0C23F439
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742220622; cv=none; b=dGoBilrTHYCtws0mdTCxwXSFJQ7B6s0yHdegehWuj8QwA4Up9oHU3Oaq9+GwU5t+aDJkBuQ5OOsPV4DdgS62IOZQWTOT6CYXsCwdv56h3JzEzty55gaj9tSzWIFLB73P7JXjTzoEPYOhbTrVfzMjL8ud0QkLMLeyGgfM4Mbi5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742220622; c=relaxed/simple;
	bh=ssUDbUiFnn88BjScFLsEQX0lhDOWLI9md+TzAjNLyIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kn98LdOjfHIIsSvpB0453WdxEWdhu1uQaLMmoJmU6k3WdmSrcu4hP0p8Ytr5Q34wNsfi4itXT03Cb7RLCuLhOeJM9CzRF/+XcOKPn/nz6Pd0VSVvlrfHfAvvkT2jl2OO7neECx6WDIt3diNbyXKWOklKP9su+ydmMU6qg6fcWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iu18zEvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HARDFG025388
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 14:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1449/WYbuYcaYwnkoadiFehF
	7dXcVB4TA3yA3L94cbU=; b=iu18zEvOu1bcysiTo7+4gc+ahaoAAWo0Bi0YKy8H
	RVs83kjtNbmUim4RzPzGi6PUzyvAvH2HQuKTAD4FOBpbHlrIgbr+Q5bazIIG1ipx
	dQ4KIERWD38Wq0EsOmr+AeMr3o003f6fZbcclnA5pfdrGJsevfwFQYI/aubHw/8n
	sn/c5bljdZWQYkdXgU8LMM1sv6/FjPm8UU7K0UyWI6Sv4cEk03vWeX8viefCnp6e
	hejao6Ve+SWZr1gALc4PLS22MVIQM84ZgW+YxDA4VE39HpKFTBxBTAI9MJ++dTip
	24zdzSiD7b4rbuKLnUdyd0wYbbZIiQD5tYgtIoHB5fdltg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4mxgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 14:10:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so838364785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 07:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220618; x=1742825418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1449/WYbuYcaYwnkoadiFehF7dXcVB4TA3yA3L94cbU=;
        b=faS/rvtHnmiknmZtudSjprapJ9cEaYWvpFskHaDqJJIqD+5PIoDprCReM1yUG8HmHh
         HqYCWEyBRHZeR8GR49UL5csc+oIb3nVlwmX35L9pcI6Lc0ZcYKQidJt3fLfZ4i2bUMok
         gfdEAMQErDYCuBVde9T0m3p6lU4rQLw76dYra3De8rAKzRjIWOrolobJPACAbM+vFCZ6
         TkofcSonYJ4m66vmft1mquSB1SygTkyV7s7HgyQw+nNnCnPbZOtqv5mIksM+H87Q+ALl
         XPzSTZ4fM2CK3hnlvxg2kW2pRqV4hB0s+zhEX6tZjmsIBayKY7Oy5ixjf5hl7RfHJ2uw
         JKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5am6kqsHVnn8zGvEGHrG1MHKZiAaQPXny+P4M5R/Y67RDLFAbsxTsjrML/Uo3b9I+PSm0yI0a+bVXJ6S4@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqA3VlYmcQ2wjpfftq5QqjS+aQuAhiMXl2+rLHgRBDnCaPlKT
	1hpZP3ga7gRBooG97tBm1kTKDi/+tafn0qO3zDGbpZnmFbdP2rkX0HhfDUlXLdjFcCnqhJekwQb
	IqsMUr05ZOuWUWgKEVZoksZReploYZxWVcBm4eAL0p4YC4+cBeGEW78ybaRvEkWuKTY3IeYRo
X-Gm-Gg: ASbGncsACj6nqRaVlTHg8YfFOLUO9fWaYbJPvEbyG2N6pAYKE03qvTf9HmamxN0HTkz
	V5rerfO+a8tTEqbn4azuCi/KBSQ6Ndy4Q+6tURgdUzVE3BLD9qcgRW3A51OlANRD+J6FXIbZ62S
	vw+8jbG5hLnAKlVlQMa/4/vsQl0IVM8PsWn6PevxhcI8AaqwLlqoaxRJBUqKly+iXw3g/TLGBYH
	/JPhC9je7tR/IMnkHJVUqRRnAjDefoycEvcPbQlQUtOU7kSAfqNZORydotvPmHdZ00uTGoUxQ+i
	8YQ3X4QqNL8krp1MMxZ8cwrr3obBvRKYjSfLMUGrJq4Itz+5ZH/vSVMwU842bfZw2oHUsTuLlDb
	6eQg=
X-Received: by 2002:a05:620a:4089:b0:7c5:6299:3da with SMTP id af79cd13be357-7c57c8fc7e7mr1286949085a.39.1742220618333;
        Mon, 17 Mar 2025 07:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFdSdzFzRlQMfyJs+MkA+3WBZa7mH06t7taxNZZWaQyeYqJOxUH7YxaZmqOhaAH+nbNuARg==
X-Received: by 2002:a05:620a:4089:b0:7c5:6299:3da with SMTP id af79cd13be357-7c57c8fc7e7mr1286945285a.39.1742220617964;
        Mon, 17 Mar 2025 07:10:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba882788sm1338685e87.183.2025.03.17.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 07:10:17 -0700 (PDT)
Date: Mon, 17 Mar 2025 16:10:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/15] drm/msm: Test for imported buffers with
 drm_gem_is_imported()
Message-ID: <xvlixbldl5phzstzayjwuf4c34x7ji2xts62m7dmnhmdcokoqs@2os7zdjrq2ft>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317131923.238374-7-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d82d4b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=RpfBGSZpqGWm18XDRZsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9CbMe0dTJvSPQXfN0-NiN12N7hNAlhfg
X-Proofpoint-GUID: 9CbMe0dTJvSPQXfN0-NiN12N7hNAlhfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_05,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=663 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170103

On Mon, Mar 17, 2025 at 02:06:44PM +0100, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_drv.c       | 2 +-
>  drivers/gpu/drm/msm/msm_gem.c       | 4 ++--
>  drivers/gpu/drm/msm/msm_gem.h       | 2 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

