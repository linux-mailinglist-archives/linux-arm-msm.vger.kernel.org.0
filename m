Return-Path: <linux-arm-msm+bounces-86408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48571CDA51A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C8A3020C6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E4C2D3221;
	Tue, 23 Dec 2025 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnvF8WlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzKUoYgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AD62264DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517093; cv=none; b=KSuOPAm8a6I7loPZLAXGftX2JvFZLdj8F+v2wlq53WreWRW23AMX+KfPc1bHdyUU9aOqMO5NgIQ2NvekJvYhlmGQ1G2UJ7px8h2oZZbnNaZzvsu3G1S4Bdls1ufEUB3Snz9SzDLEiGc1KOecG64mBF9YZaVirUiTCIP5YCpCezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517093; c=relaxed/simple;
	bh=no2v/CrqUVU0OVkQnAZVHlcHLUM6041PBPoF/bxXEEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ3cm0nFnkKcrhcXyAM1pTplnkTNRQsEVERzkUyKM216G0UYtuD7otXMmeFP9rgET3dD7xszVxrChoR7WeUfs6oYGv4lH66GWWDAG/WT6qcYDzJwJUPd3SSRUHvepT1mO61/8wIsifwNZidYvkLgkTL4LtPNFgD1XuwRISEO75M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnvF8WlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzKUoYgM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHtL7c682292
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5WqlbIqMYypcu4zwIBS5ReRI
	kDgffTefGxU6lC8W+8s=; b=SnvF8WlKENCBEr0RDvn8Kphj5bLzhQPGXY557jvB
	ow+gxmpoHh7FsBJ0ZHkCjTSOHXSCtR5304AvKCNf+BHmWUJHEGie1dLin4NrCS9z
	KrA0JNY65MWCxMp+Xe29L5TU/1IPRdulUO6AieEyYWbMQ3oRLC4PJiP6j4bjgr/0
	22nMk4b4KcIPxAVlVbr3JQqDzwKAN5nWSuSqJC6hJay7/q8kW7Jw83xc4dDNW3Gk
	7QJQbn7MjANWiSJkXdY1V6s30SO/dQcVzUDy/rOjMmN/Ztc8N7sFeaSlJJWOoJMZ
	Ki36BR75vOs7MyLvkSQfHyzkYH//Rf7QNIdsiyEHXnzQAw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq06dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:11:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94128f1b13fso11250228241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766517090; x=1767121890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WqlbIqMYypcu4zwIBS5ReRIkDgffTefGxU6lC8W+8s=;
        b=XzKUoYgMTCPMVsBHMYoftj4XHh5NNY45Ku3tHt6lD8jnXN3E6bMy9hrsvMAutQn/Aa
         gZzBqxwQvGJryy6I9OtqZczs/lCABSgNjSPtyaxZTtH5JDeQztAsEdU0O3SPKJRhiGRW
         MheBmgoR5By6aG+PkGspuwuZPqv4myQsugOW1Oz+HNPa+x6a2ounBERijfV9snMZT2l1
         516KYDNoD98YmFkQEt1bD5CQKgV2r1OKPs3HClzG0hjJoxz5GKRYjPLdb/xpEXOMT3Jd
         WlUbhs0joaMDVE0fQYMetGsjnfFdZZ1BfUFr8OF4vbsD497IbslBdQy3P2D4oKaz3845
         /oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517090; x=1767121890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WqlbIqMYypcu4zwIBS5ReRIkDgffTefGxU6lC8W+8s=;
        b=RgguXeJK6hN+Je3kkwAJWp0E/Tq30g9+JLBC/X6OFZFzcrtCvnw1UI3MGiXpr/X3TL
         CP0sNW+oas7qX+Cr8wwqC/VgUNWQBUU/eswkGKQVbNejG0l4SSEMvGpq62CwZmj19f+Q
         mNov3wuPcZ5IXhfwoWhNTXLyRo/R9qqsKli4KqKLspJdlic0L2TDBh/KdNyROZZmeh7q
         WpBwa3YYvV5wK6xTppGGp4KpCHFqqjTD3da8PTh483TKT5z0uXMIGnX2lfinAjtyW7B3
         NMZ1w8g/Whu0+2cy1kDQhjCkGmTi/z+n7pALUBAai1XqeeJplDPvu65Fd2a9zHhkI1up
         kz4g==
X-Forwarded-Encrypted: i=1; AJvYcCW2SbUp1/Wkvvoa1lwlBBvUVzVihTJGj3ScKPr9EhWMF/t1Vji3lNtmwjMez9xZzqC1MzndASudc5BRmtKV@vger.kernel.org
X-Gm-Message-State: AOJu0YwW7e7I/A4iodVZIRrewyCOx2YLQytinmD60sh6Xgg2ydE+QZ5U
	Kw+vOlDCNSIkSBAKWdtdBw5gCk0pcZbew2OxyF9f6MLpmAwtiJCIqbEaYbIY5lUlur6d2gluciP
	ugVivfUXTaMT4/GQ8yV/HVWAofWGvmK0hG3IwDz753LO/QQ2YXYmVfEPWYGcJR+aNP/4F
X-Gm-Gg: AY/fxX4a1uWY8PU0QJcAnU2lGUfWwGKIChXEYOXl0/xLBMKxiw+6XLCiMQqcChUAHvq
	qH8bezoZdi+0OkYA5DM5SFBKwWyNM6RHD1vhrGoY07ABGvOop05Gxz48HwB0KTmRu+0seNtvF/M
	xQrtcCtzuV4UhcqVG+dp8ZgTsysn8tzscJYh2BxlDrNDkEaRq9kKGPdSTZKl0Zpwklg0d+POlhC
	wcg8DFSAsJf5+jrb25w20mwmP2peyjB9RTDJeHKIoXcLeyNv6Lts7gImxNkqCMrEkVIdsuoycyB
	b8HZusIS2kr+umoo2wxVi2Zp1WSSo9419S5vPX0bQmg7obEYdDLMrky402ORJnvD4tqnHu8/w0Y
	4/9VjR1oZodm2bE0vRNjrSNKrYZJWoBXWKjmpXxnuEICgXgLk4ChQwEl7BK7s1FmJDH00rxYdlR
	TxSrfeTQJm+Fs6inlFNVzxW7Q=
X-Received: by 2002:a05:6102:2d0c:b0:5db:d60a:6b2f with SMTP id ada2fe7eead31-5eb1a41db7dmr5302224137.0.1766517090195;
        Tue, 23 Dec 2025 11:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgx0jxpaUYoDI4pPd579ixs0cCDKJC1PyfNVK90hDHCm51byzGas8iZBANeyUIpCgP4OZKAg==
X-Received: by 2002:a05:6102:2d0c:b0:5db:d60a:6b2f with SMTP id ada2fe7eead31-5eb1a41db7dmr5302214137.0.1766517089792;
        Tue, 23 Dec 2025 11:11:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de6eesm38394521fa.6.2025.12.23.11.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:11:27 -0800 (PST)
Date: Tue, 23 Dec 2025 21:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
        ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Update copyright headers to yearless format
Message-ID: <s5uio2nrt2eyarutacxxqqleufvqdrltafchpmyptkhmvivugy@guqkrtzimfdp>
References: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KdPR2FkwzyxVF_8WodjT6KHQjBCy4bTm
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694ae963 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QhubHCdxnLeoQf_mCp4A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: KdPR2FkwzyxVF_8WodjT6KHQjBCy4bTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MCBTYWx0ZWRfX3N/Q4hr/0pNm
 5zQOL26iP4QP5DC2fVvYrVS4By9cUuheXHHgmiWPttVQuh8HvEVTlMHDdE22C9EOEaT+5VFYA7d
 5vqbmpHf3ipEIM6hEyTSBGeWuUAFUhQyJ3KuXScle35ipjJs0Ur/QBwVjWym5PN8Pg+DjfC8YlT
 j7OXi4N94cTt+owAFwNzju0lUQ1W41UwhzzyNiLxxfSUwthBvSQ6mtfkpD6zVRt+qlMRxrf7r/F
 LOZqf6JK5ZJrGFk6B7JTi4Qgl+n1O7F2Bt8RTiffvtDH21WIYyG5tCKVUt9Ub5X2mg+A0q4TcsA
 8tePNDrgd7ncgnW5knZ2YhLAAIsGFQuF8zqLyokLyFFR5Nj2mGxL/LC0P4ng8T1z9N9WjIHDLhD
 feIIRqO1ktYA8tqAPllHV0iPRbfoLIm4rbs4pm0z4kna3pAxVA0GRBv1uLAgLZDn8OP/VCl/Kgx
 /HTn1ToRYb1x7svVDgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230160

On Tue, Dec 23, 2025 at 06:24:25PM +0100, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Update copyright headers in accordance with Qualcomm's current
> legal policy.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 2 +-
>  drivers/accel/qaic/mhi_controller.h | 9 ++++-----
>  drivers/accel/qaic/qaic.h           | 9 ++++-----
>  drivers/accel/qaic/qaic_control.c   | 2 +-
>  drivers/accel/qaic/qaic_data.c      | 2 +-
>  drivers/accel/qaic/qaic_debugfs.c   | 2 +-
>  drivers/accel/qaic/qaic_debugfs.h   | 2 +-
>  drivers/accel/qaic/qaic_drv.c       | 2 +-
>  drivers/accel/qaic/qaic_ras.c       | 1 -
>  drivers/accel/qaic/qaic_ras.h       | 1 +
>  drivers/accel/qaic/qaic_ssr.c       | 2 +-
>  drivers/accel/qaic/qaic_ssr.h       | 9 ++++-----
>  drivers/accel/qaic/qaic_timesync.c  | 3 ++-
>  drivers/accel/qaic/qaic_timesync.h  | 7 +++----
>  drivers/accel/qaic/sahara.c         | 2 +-
>  drivers/accel/qaic/sahara.h         | 2 +-
>  16 files changed, 27 insertions(+), 30 deletions(-)
> 

I think, this is _exactly_ why we are switching to the year-less
strings, to reduce the extra noise. Unless we are required to do so, I
doubt there is a point in updating copyright headers just for the sake
of it.

-- 
With best wishes
Dmitry

