Return-Path: <linux-arm-msm+bounces-54330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2896AA8974D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04813A423A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1467A27A913;
	Tue, 15 Apr 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqOpzx74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF327B4EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707606; cv=none; b=K+OrXKO9PDMeLEcGP4dKJm9AV35SrnjgEEQ2mOjcECZiIpdY9sIPaHB/ZsJJ/E6SJ3rqBQo8oHWUlx+2Zjozm6pDSOBWNwvO8/bpOCsdyTbQv09+p0P8jRhG3IfFvmWUbh7SfIBXHzJnMB95IMyo4SyFGJ2i5CoO3hJhpzFp6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707606; c=relaxed/simple;
	bh=vYXk1ZvF0LPWGAJ8cYQlfFO7JgFdQ0uW7P9M4pmdSZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvdbZZxCHrF7RjxaaP7SBPio3yG/YrkNlu3BrkfWCSMxdOZyxOMtDKplcNdtUDUXW0lZx57l99E+yiSyWrBWY984znQZoqfY7Kl0WGjluPYSFMcEqaEi467Snb+nMN46iZCTuLgM6NiCiRHQV/2ilrcnD6LwiRVFZEW4W7e5VZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqOpzx74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tMHD013244
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQfepw9ye4d/Sw6PIpGIUW7pKP12q7jW28+QB4VgaF8=; b=VqOpzx74DYeT39j4
	IPfoYHGjfM8ZDyDmQKnuleirjPOxyXlgWQ6xpEd/P6QqBaXZqfnhudoB9gPvBIxW
	1bX9/y2cbXRHL772rXQelfk+AwStp3BoD7NALIvNVLo5c2wsC4dr36IgyJBnPgh0
	8QM4WvT4kIAJb9EJlQ5grJ32Kkc6dn+PLOvh3MkwIBZKcvOmEBT6PK+fB58mqAKd
	x80lW0mfYPrg9FZwDReJ1fKr/8uyxiINA+zaLeXHEjyRj4c+VtYf/nVx8TpwcT6O
	nSYNmbVQOW4DOII+F1FR4KI/vBptvY+EuWoEAaQIZx3oIGdrPXwzZsQtX7euEbK+
	Htydbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fd28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:00:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54767e507so877342485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707602; x=1745312402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQfepw9ye4d/Sw6PIpGIUW7pKP12q7jW28+QB4VgaF8=;
        b=gNpIP6m1G7NhHvnKWuypwhYzgwrDuGUPFP5rrU57+LWCtGOwyuTaATyrNyvmLu+WKP
         Q7XeqD8AIYQbymo2ko2Gb1zI8lOqyL8UHAMc3gamLLIVWmmU7C1iWdA/IhyQZTi39zHe
         oJ0p9bDAyM0Cjjbjhlopc8c1nIMK/rQlkVEVOaD+/7rVKvGSGhTWAwwEeXG7yI1fjaj7
         1pK8rAi0zbezJMUjY8E3cVTQ1qssCzSdjYbumbOpM7T89MWNmb8Nvy9gUqxtCiy+9mc+
         YRJZ78lLBdeEvZp80LmNLdFYvpC0VpHN9y3MTwTDoavvOqh7BE51r6BzPJhtT1uhorbI
         rAeg==
X-Forwarded-Encrypted: i=1; AJvYcCU2L6bBMtEePlURbI0P9CDCA/dxoi81QlpRbLjjMj+cG4b8QTAVcIQJ11EKBDPi5gNxuhiVqYoftN1p0DaR@vger.kernel.org
X-Gm-Message-State: AOJu0YxzDit+zpffC6PGT6qy7binFxQSge3oC9J/04JtMlW8OdiB8eWZ
	dHKuaKInq3RzoiJt9KUKR7GnxK7Mn9c61U4OXJmdE5WVSYcER+QfADDruNiYzsZGnYfPOuErNpi
	AEtXYQx47vbv9MsoHM/bQaHy+ZJ4RH4FQSy050t6g/kBT2zTrpXqhXX7qf7ZHrIFQ
X-Gm-Gg: ASbGncs6632Yff9losgHk/a5J+De9c928B6JAwBnPh60de35Lk3Nxrcr2rbuxNhjPWf
	2TUhsdyNeKab5uMKLYAMTOuA/7v4uS+dR1fR3f2/MHkqxSK1EYsphmniWagp5Az3AQ35Md06uw2
	PacTOHCvjK/fBmFmrFm+kQV34UWLc4Ulu8uEeAmU3qnVdAfGhBDgNmNY0hua5fZmiBxGGnsX3oc
	l+aAZBZzUL2fckTU7vn8qKL7weNFiDhM8Ka/MmutLVfW8s0AVLVqcfJEpaZWfHHqKaHEelqmgQh
	8AOABa856ZZ0FhBgTdJmIScPjpmY9dUT/ES/OffZEQMoxod9+vnqdXqyinUMb7PaucnJWsAJAVU
	6LZ0NKzQBgW2a6satEoTgzMI7thBeHGl+9heT3P4pRYDSOtq1f0/6TGdHYaSh
X-Received: by 2002:a05:620a:170b:b0:7c5:55f9:4bbf with SMTP id af79cd13be357-7c7af0c0e77mr2367827685a.7.1744707601954;
        Tue, 15 Apr 2025 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESAyXoVLPjZgJIbP3L2JUlerT+JWqD6z0UX/136WNz5T6IEY76btFrfuYKR0NSWX/Mfql5Zg==
X-Received: by 2002:a05:620a:170b:b0:7c5:55f9:4bbf with SMTP id af79cd13be357-7c7af0c0e77mr2367822485a.7.1744707601439;
        Tue, 15 Apr 2025 02:00:01 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239708sm1356448e87.85.2025.04.15.01.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:00:00 -0700 (PDT)
Message-ID: <9f64ea5e-1b59-4522-b55a-d9b11e412ee5@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:59:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm: move wq handling to KMS code
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
 <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yqxtAXnea0Ms9aoqm9jGystEBiFZZHcf
X-Proofpoint-GUID: yqxtAXnea0Ms9aoqm9jGystEBiFZZHcf
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe2013 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vNUryEpXin0155aUV7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150061

On 14/04/2025 18:58, Rob Clark wrote:
> On Sun, Apr 13, 2025 at 9:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> The global workqueue is only used for vblanks inside KMS code. Move
>> allocation / flushing / deallcation of it to msm_kms.c
> 
> Maybe we should also just move the wq into struct msm_kms?

... together with several other KMS-only fields. I will take a look.

> 
> BR,
> -R
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
>>   drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
>>   2 files changed, 17 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d07a6d82ae21c965e 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
>>                          drm_atomic_helper_shutdown(ddev);
>>          }
>>
>> -       /* We must cancel and cleanup any pending vblank enable/disable
>> -        * work before msm_irq_uninstall() to avoid work re-enabling an
>> -        * irq after uninstall has disabled it.
>> -        */
>> -
>> -       flush_workqueue(priv->wq);
>> -
>>          msm_gem_shrinker_cleanup(ddev);
>>
>>          msm_perf_debugfs_cleanup(priv);
>> @@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
>>          ddev->dev_private = NULL;
>>          drm_dev_put(ddev);
>>
>> -       destroy_workqueue(priv->wq);
>> -
>>          return 0;
>>   }
>>
>> @@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>          ddev->dev_private = priv;
>>          priv->dev = ddev;
>>
>> -       priv->wq = alloc_ordered_workqueue("msm", 0);
>> -       if (!priv->wq) {
>> -               ret = -ENOMEM;
>> -               goto err_put_dev;
>> -       }
>> -
>>          INIT_LIST_HEAD(&priv->objects);
>>          mutex_init(&priv->obj_lock);
>>
>> @@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>          if (priv->kms_init) {
>>                  ret = drmm_mode_config_init(ddev);
>>                  if (ret)
>> -                       goto err_destroy_wq;
>> +                       goto err_put_dev;
>>          }
>>
>>          ret = msm_init_vram(ddev);
>>          if (ret)
>> -               goto err_destroy_wq;
>> +               goto err_put_dev;
>>
>>          dma_set_max_seg_size(dev, UINT_MAX);
>>
>> @@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>
>>   err_deinit_vram:
>>          msm_deinit_vram(ddev);
>> -err_destroy_wq:
>> -       destroy_workqueue(priv->wq);
>>   err_put_dev:
>>          drm_dev_put(ddev);
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfae04639ceb770353 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
>>
>>          BUG_ON(!kms);
>>
>> +       /* We must cancel and cleanup any pending vblank enable/disable
>> +        * work before msm_irq_uninstall() to avoid work re-enabling an
>> +        * irq after uninstall has disabled it.
>> +        */
>> +
>> +       flush_workqueue(priv->wq);
>> +
>>          /* clean up event worker threads */
>>          for (i = 0; i < priv->num_crtcs; i++) {
>>                  if (priv->event_thread[i].worker)
>> @@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
>>
>>          if (kms && kms->funcs)
>>                  kms->funcs->destroy(kms);
>> +
>> +       destroy_workqueue(priv->wq);
>>   }
>>
>>   int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>> @@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>          if (ret)
>>                  return ret;
>>
>> +       priv->wq = alloc_ordered_workqueue("msm", 0);
>> +       if (!priv->wq)
>> +               return -ENOMEM;
>> +
>>          ret = priv->kms_init(ddev);
>>          if (ret) {
>>                  DRM_DEV_ERROR(dev, "failed to load kms\n");
>> -               return ret;
>> +               goto err_msm_uninit;
>>          }
>>
>>          /* Enable normalization of plane zpos */
>> @@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>          return 0;
>>
>>   err_msm_uninit:
>> +       destroy_workqueue(priv->wq);
>>          return ret;
>>   }
>>
>>
>> --
>> 2.39.5
>>


-- 
With best wishes
Dmitry

