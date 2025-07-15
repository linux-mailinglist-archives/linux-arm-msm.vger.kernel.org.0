Return-Path: <linux-arm-msm+bounces-65109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62895B069FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 01:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD0A1AA1975
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 23:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2C62571C3;
	Tue, 15 Jul 2025 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ke/TAz21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5262BE645
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752622851; cv=none; b=DeBejUi6V7tkI4IPe+Go9MzZwdKUL3nG0ro3svOn5DspblRKYMTAPhgTqAjjlJztAkFVonbhd6AP2NA4C57bNihg6qNk6Htjy/7416rfsX70gpHSIYpKnHrjX4cH9KxWdjl39gAlg5Foxe295ur2NbiP1G4TLos+JRaXozuTzWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752622851; c=relaxed/simple;
	bh=LrPqnDq/SpvFDLZ7HSbGNtZeDMrK/0XptXrDEMlwKiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAXu1tMEfF9IMD+zEc/mEWSaxTFnaVFRRvqG7v6EK0N8IOF4zhh78iWCnux/Itm9B/AfdfQcgPLA6y+dXQVD/LmpJeooXCssOQ3QkBEnbROwtRwQN8Gp524YPnq0GM9AhRRxcyDIHJZIXZVI9x6HvXFk/bk7AqO3Ui0WD6MPgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ke/TAz21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDEqK003273
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 23:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U74p2NgokusBYICtX+RuOyJ/0ZE3xSV0oX91XuR8eNw=; b=ke/TAz21O+HjjcTw
	SlaGcYjyLsajIpFyU7Kq9fVWzI3pBXIM6yDYkXoxirJwGLy7GDuH8qe2gnv36SLj
	bYX/XvAqfgI+fFsaoZYzEZKMc/RWLn3Y3c8TywRYqs0gj/YU1o+i0dP/fwn7TmCT
	+ZTsAmrJXfPnC/r3o2GgR0c2TgEh8fY9r9A4pcrpE1K/SKhwLBC0UUYb4Ke8Rg9v
	EDLGheYUGiKpQr5+csF761XIFOPc8FKjuYp6QksIhTSRHy9kpdtjfXJ7Q0VBg9Uo
	8wn4Qv/GuhdrigYlzJDhJMsOisF0/lBB64aMTbhakpLFjeIq7gBCXdrNbWbwXjy2
	zf82xA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drmthq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 23:40:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso9864127a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 16:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752622848; x=1753227648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U74p2NgokusBYICtX+RuOyJ/0ZE3xSV0oX91XuR8eNw=;
        b=W/MOZ5Gl3UeJ3OJldQF1uOzmAeQIOC2pEn+YlX3axpda85d21myN4MziHm4j3Rfg8J
         rajsHFxQlD2dR7fjNF2vStGj4hF5BmGo5tHZQmLDTq81/zajP3nf4+YQsC8BweIqL8Kg
         Jz0lzUHkReypExX4uNXPBjUtNjm5fuop+wL6QGkrZXaISUvf/Pny5teQOk4gEfrQO2xe
         x9JSLxuC4K2wOoSLv4xlKBOuxe8E2TPWL7gBnfSHcaL/3WuTPE2h8CJn6VR6NOFDgvXn
         jCdEH/koD2bsvtThfOkfgOKtf4c3ghRlsHKq6bwSVvwtMatnottHMSIX89qqlI2LSaGI
         TCTg==
X-Gm-Message-State: AOJu0YzLMNArMQX1oS12Wr8aVNcdEcMhxHR/YP1yWCfvtydwyIksMpzn
	wePoROYUlcSqFH52v7v0cewrmgdrW87ZEnYVkioYhrKAwM/vQH8qcOdKeL6mDxt0UMypm5zCN6g
	t2JQf1n9t2ftZNm+FxNIeNeweTs4jv+CQqWLrwUxP4s9MIQbYunWqQgbgMnkIF1gMTMaf
X-Gm-Gg: ASbGnct69GkhkGG1QQPAkvAvPEbdUqOMK0uv89yge6aooVvosxwerkj5F8P5tsZWCv8
	VoL98oXgN0joP1eXps142vK1KtaN5fJZNIDxcEgjFvF5Sg0JTackrPuyGlUPOjlDuVost3lQgSe
	zwaaTKFkj+4qFPtd+B8UT+0J7ULieBWxBe9fYvLlCCRvQEshhL9K8FWRIPwu5qUEpeWtuPD77PK
	5JU+3+x/vNGFJ2YSoiFSnRTK9oXHmfnIrhe6A4Nal3Y7quLxUxangQJ5A+unbImuUELjobdCOiL
	wTysWoENi3cy0ozFYJBR6xM5UT4tLUOrhYgq1rYWStoHZ7CBFunGjPnA2BcQur904DNn6KkyYed
	PECuwmuaSrycoGjX/vz10sQ==
X-Received: by 2002:a17:90b:4f47:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-31c9f489b00mr504217a91.32.1752622848216;
        Tue, 15 Jul 2025 16:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTTJbpQZuVeL9T10AqTmZygZig9Img276JHEdkFxvJJ/A1KoaAeYTrUG70jqOz6RxoHxwmBA==
X-Received: by 2002:a17:90b:4f47:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-31c9f489b00mr504193a91.32.1752622847720;
        Tue, 15 Jul 2025 16:40:47 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6c5660sm12492300a12.48.2025.07.15.16.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 16:40:47 -0700 (PDT)
Message-ID: <5ff344a4-cbc5-45a6-9258-9d51c73c24e0@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:40:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: efluuDxWG19tvoj-Li4cs2geSqbsJGYS
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6876e701 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kWyCMJcj1dDTDgwf64UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: efluuDxWG19tvoj-Li4cs2geSqbsJGYS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOSBTYWx0ZWRfXwBeTqlxERxmL
 t1WvPsJvtwuYXCS+/7a/5Q5eTDj/PG5R/358B2Obnz66h8Ffu4wHaxk8nQRjDZCfsHr6VMqJ1BX
 368/abvIwG+t2S39fdC1F4z969JXrV0th2gGAOuTZMc/w9kd6Uk4wmN4DkdM31YT6Gj2YHn/oMF
 u08LqxWGJPZelovHhNaNNqtDzqiw0qEU/2+rumk8a1/BCjWXenbIBHRb4rhl3Pxtr1EjqQPMRhI
 3+E6+BTofWw2WskwHw8chpIdOk2Sr2qFzfJAjzLwR8LeKPjkxGzm0grYroDbSb4+vrzJfUsdYtK
 II/7Z+EboUK6/QGErKWLSepg8LQtyJJbF6fBhNY6i0NlmOBadIPsSAQZLYKm1f/hNgEDq4NAiZm
 4k/FaI2RdhAutK2goi2NaTI3wfzGhCiPUxBQG3FF55TsDO9llssOhqMvzG3SMmeFE1LaH1m0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=845 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150219



On 7/15/2025 10:28 AM, Dmitry Baryshkov wrote:
> Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
> too, in addition to CRTC height.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..c722f54e71b03b78f3de82fec4f2d291d95bbba3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1162,7 +1162,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   	if (!old_plane_state || !old_plane_state->fb ||
>   	    old_plane_state->src_w != plane_state->src_w ||
>   	    old_plane_state->src_h != plane_state->src_h ||
> -	    old_plane_state->src_w != plane_state->src_w ||
> +	    old_plane_state->crtc_w != plane_state->crtc_w ||
>   	    old_plane_state->crtc_h != plane_state->crtc_h ||
>   	    msm_framebuffer_format(old_plane_state->fb) !=
>   	    msm_framebuffer_format(plane_state->fb))
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08
> 
> Best regards,


