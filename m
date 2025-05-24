Return-Path: <linux-arm-msm+bounces-59298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACDCAC308C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 19:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660793B8EE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 17:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183C11B3725;
	Sat, 24 May 2025 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I60MA9Wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740818132A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748106953; cv=none; b=cpm7SGsW/WCeDvB4G3Jle+8b3xOk1krjmH7NrxBZ0w8H2dYeTAo8a1uc5aCULRUIz0vJt27v0nD+59r9BKznsARovZOAxOUk6OLjGjbWUztgWs+pTNyxLTJEbEplgLWWQaWzIHDfIV03kyVkhpnAnmbVf86i6jM1qP1vtHHDmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748106953; c=relaxed/simple;
	bh=k8WsU7Kl8gGiw2twvpTg1c6BvC+MbJXbs5ZHnfLjSOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCnR7KZQpPOedeR5tixk7n7wm9yxa/zcryCMZSl7cf65jBynZ/XbXF17vSFg61mY+sn+6/26zNyuhme8ZA3SqOJPJfB6zpSTfxQh1/s/aH/MNjG/WUKN7DlnuDlafDbTiuJDIqtLQbVwpURnh+6SY96VCQ9DLWsKzdZ3QybtX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I60MA9Wa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OBWPRf005697
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 17:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HoKB7FoEFd+ZhxUTxnT07Hez
	elPHtrNEFYztHvSBeTM=; b=I60MA9WaCYrQl3K61kG7yKmYGl9ROeRwT/67lMeC
	reb+NGpNPyHnfdqVaAf2cBYgnc/1QzAhQbXQcHSHwwchJBZnWmucKKXIryhgowY4
	vk6Gs5AIVJ0mGfMgmpH7rDumAlHDYh0Lptcnm0vC4hYmrbm7L3rQ55sQ6vbyjS1V
	OLffzTCJkiDbWpEKWpUsTzVS/qN9w9j2JlwYhwlNbL1V5J6SfhXPY/PjmNHCsUTb
	Ei7Rc8o7Gnb63DjMuXrepEITpjmMZr3x9EKikdixyjPeukufEmRKuRwMRaKWH2wx
	5OWKO+ccedjgwHdCZJSP+R/WVHbKrU65gL28Nxpw3OsFsw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5q1rx06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 17:15:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c8a36dddso21268326d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748106949; x=1748711749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoKB7FoEFd+ZhxUTxnT07HezelPHtrNEFYztHvSBeTM=;
        b=dcuv8wCR7J7sTCgocAgPoR87XLYsw3byl1oLSJJVGkhDd00650y4oV8d4Ccpw5xFQT
         D39TaGEFbDNybPd4yXRpf/NXBZdcjUWkJ6DyiCxxBhOBBUHQymz/c+xM5RNI5tFiBJRj
         s0cR+8G1DmlYkSXtrsEXXwD0mYuXIqx9g4FdSJhs8ulEPfzOfUo46Rk2fnTTWIVWX8Vm
         oJkpecMa2jF09VTP/vcMuK9+o6xkH5DhP0AE/PujvQV7NrSPme7j7fxhHX+L046JR+aO
         emyQbZXmEHZ+bV1HHR99/5uGE2nyKPgOhCJf4yvyHOqBfP/b6WVU6vLnALUrYqN+/Llb
         4JzA==
X-Forwarded-Encrypted: i=1; AJvYcCUhCTOc4xAEquPOe2HQGLIffPAR9w6l4n9LR616cu6EMo0EomJJcRUKI8mEdrXqzMp44EafgR3JIyCiiZrx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2vzaZ1glhlNuDDIXuYLAdlvWoKgX5ifC8wAEEr/O2tqpF6uSs
	12YCm9ZMQv3zC4ZQGonwUG6pACCQshsjanyRR5Z6oZcV5d4fDjtB+AOMErKn+xR4ut26mSvXIGc
	/NAvk5LnJG4r3+IOBhPpSYipZ4MOjcmGJqBteC8AfrRz4svlc8el6vAyYgrC6rpBW7+rM
X-Gm-Gg: ASbGnct3TkuKzN5XF2QVFBuYO//nwdSJ+rExHG3ROqs1J6YtNVtdO/+YyAAYYyq1v4L
	jsfqdT7Ucjx8U/81S+OvwKDW4EHvWDdXh8JjN61ZkqwhofRgWgWAU77Dqn9kOx4FjYgDtn9tWTH
	4qFgTaPbBlYnqVJH5aLvGQWktbe/sKaVeD9PRhRzGbHwzFanc7/8d4P7U1zB0tdlB9Nwcl4i3Cz
	CPMHhiPgujJL3uH3o750wYbmcQKm2PC65XqyPYjG9lrItIarDFLyUd+g0yGaHZG4LQxZeZmrgNQ
	Y77IcCrVEHJb40STgx7EYWwJY5MU+trM+LmvYowyByWFZDAXGj/+dDFs2T8gL9GraOAjWvlbiXA
	=
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6fa9d28772fmr67452046d6.32.1748106948849;
        Sat, 24 May 2025 10:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIqkv1DDylW1b3GD2ViKAIAcTr7kO7D7YE6wGfo1Ri+34/iDrnom1wZeOY+am9JzCmMIPeew==
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6fa9d28772fmr67451546d6.32.1748106948491;
        Sat, 24 May 2025 10:15:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-552133120b8sm1112985e87.121.2025.05.24.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:15:46 -0700 (PDT)
Date: Sat, 24 May 2025 20:15:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-Proofpoint-GUID: yGUOdBguGkNbYQdGgry49HynqIVqs-3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE1OCBTYWx0ZWRfX3g4rOeoyMZvB
 tBFQMMnruA6uSGEa3/t46s+064WqCkMwaq6YeIe2VYhfl8YiiAapXN6Tk/JCkhFTqxnbhwKIoWr
 2cMXP8vJe7hUhx3g+mVYKG5dGHGJr1R9CippD45//BZkoizIFjw5hHrz6IQazXvcc/UJdaQy8aC
 t+FGMCekTMAcSSLAPCBSsuLhSjYIH7FRwpiQA4NYLMsgKWNlG0wzHZ1u/Dkr1KPLpM3l7YwmXlO
 rTK72G0tGqk2qT69GUmfirZQRaVRhgfRKpRZiHfIoZczX9eaOXwMFXEHW5R3s9gjUSwh8sPEnEg
 5OOh9k5SszT2KKQ60CSwf4fQYzVYuX95OVfJLReRPuWyrGICBRdu8VeCKITvJ90EPOD8I70S+sK
 dR/hFyNldoIK405GzvdWHWcJNoW0S3EbHv5MLiQwAKzBVbU65h0h6/kPlr7jo3qCesugyDDS
X-Proofpoint-ORIG-GUID: yGUOdBguGkNbYQdGgry49HynqIVqs-3j
X-Authority-Analysis: v=2.4 cv=FLcbx/os c=1 sm=1 tr=0 ts=6831fec5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=CEJotdllt_GKsxek9pwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=901 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240158

On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> From: Ryan Eatmon <reatmon@ti.com>
> 
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies
> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
> The files generated by gen_header.py include the source path to the
> input files and the build date. While this information can be useful,
> it inadvertently exposes build system configuration details in the
> binaries. This hinders binary reproducibility, as the output will
> vary if the build environment changes.
> 
> This change was originally submitted to the linux-yocto-dev kernel [1]
> to address binary reproducibility QA errors. However, the fix is generic 
> enough to be applicable to the mainline kernel and would benefit other 
> distributions as well. So proposing it here for broader inclusion.
> 
> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> ---
> Changes in v2:
> - Corrected author id
> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Rob, WDYT?

-- 
With best wishes
Dmitry

