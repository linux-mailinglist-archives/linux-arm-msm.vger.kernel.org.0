Return-Path: <linux-arm-msm+bounces-81991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CCC619A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 54302353EF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 17:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83002264D3;
	Sun, 16 Nov 2025 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy+1mUrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLfqin73"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD961EF0B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763314219; cv=none; b=oJAvx7Al0nRLVJwrTI1Po+7SnV7OnxXZB52xNCa45QklAHpd/QQ7UAlpRDgpGCReMFZ22tU+RIy4gw+/o98so+9BTazx+v1YloKb/JgAsP9FEziN/pSi9ZsC4QMmoOewwSe5rReEzzYYAAy6tmEMlCS5ieG/VSem4hFEhvsTvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763314219; c=relaxed/simple;
	bh=rLIUzVpvtF2bKeD+QR5GRO0v0gT2j/S1FxeNqI/VsUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpytHSawZ/C6L+/4opkxn5Bvc6Xn9OYU3JYknz/tek4Dt+qQFs0OSGOeXz2j8xfHR3sAyFQ+7NSwGUKRuNzb0kecfGDUUCibJO89X2girTvAxid1Ng1Lvj3TgAAsqh4MBJvZGfYj4F1Mm7Kl+qYZ5AWK7aPW7UGLOc9oupMYZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy+1mUrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLfqin73; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGCPXZF1339063
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QpRDHGpl1qT5quq98HG8Wg1a
	Mh2E0WQlAnm/n9VxUrI=; b=Dy+1mUrRCwjfx8L/7K9e6CVGvSv3FXb+R1xOUTdc
	4ER3hHgMVN5Jz24vvd+m15YMWvoXlQ8m2PukLCrsH9ADFdrYdMNRbnCYDwu4ii49
	AKHfS+ByHkm/T7JEndttcuUhnm2Ab7kXNdwOGWSuZxPKZKM6HepTKjG6NnX1Ir8+
	2TgVEJ97MWJVu2R8U64P/SloSz+wyJEcKxr0bSzm38l7USeJsy8AcaJAWPyeSfco
	pP7yO9UHX09lTmNNu6IJKuZgmAIcMvt9VCtuIhbXRhArUdS5OjJjYSV+zZDh/Oq6
	kIGtj8eY7Ze97oOhg2GwCVxaN/1E07Een9uXXx1SFZgfNA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5ae3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:30:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88236bcdfc4so103602816d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 09:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763314216; x=1763919016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpRDHGpl1qT5quq98HG8Wg1aMh2E0WQlAnm/n9VxUrI=;
        b=iLfqin73xsxafstrHXecrivVgJkWWDpI8gq9UguQYCyXxkQpEORDxV/kuf/zX/Qk12
         RZnBpUk8IjmGKxWrDX9BHunh9SZD3IlfG7R5jfV2/SsziJQLxT6eL0JDwrWigsPbXzqV
         4IEeo64OYg1mUHcN93HxkXVyfLoJC5yjcS+XTPemMQD4YhpITMiDCqlrQ0ZRLmkbx5M4
         PZd+5uue3kGg1bCwTXp8o+owZQmQp3dsSCUiOg2of9J9HVo0Y4XiKGckUyWj0aI4rogm
         M/0XO5qNFPhoIxlldD/os0YfMr1OEynXEX+eWlhIB8S35qENSzyUsbhiNM6lQY0da230
         MdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763314216; x=1763919016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpRDHGpl1qT5quq98HG8Wg1aMh2E0WQlAnm/n9VxUrI=;
        b=M1oy9H7W9bAibhAq4Vw/NRizggtbf+SPQnv5c2BSo3B6iSK9/iNXnQluowAwETyaos
         AvYTt0ksb6y7KTftm8wlPnUKGrnMj9Dsad+lWVHoKRKIc4nFxrdf3knalocpLki8TAuq
         5MJt4GJq8RrVtrjIczBC8r04VpeXuDfCRbMJILu13dzFDs0nH7J5sUS/pcNtDO3vA3Fy
         Za79WtQHeI7dl3ZFB+7tv1ZCwtjFRuPbWanuFCgC4MG6xi8BVW9B0EM3qcDTCp3DjTXT
         FmujNiNJs8rzdyKTunCSneXWGvJMBJMpiqMAZ68PzkCPKMPRkghPG0yKiPfmu16hIaH2
         aOqA==
X-Forwarded-Encrypted: i=1; AJvYcCWjXpGHM4PgUAidXVvtdqPgd1k6o9uYlu/XiQt5/7E7rotYNsigagIvHPKdCNORJu9zVh7xz75VM1+/Q7XJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUaQQomWXkgAiP+DJyrF52VNI9ZQm6I6dFlP8fI4QkYOBVpiAj
	HbTKwd45cJ+KpSQB0tEcQwTiWn3SV7TU/Th1GopYP0o19Ty9x+tD4ZUHbOdQu3QC63YTREo03mP
	8/2Oc7GPpGhRLK9N1r/EpM9lMeI8G2K5o+rl/cXDteHIo9rrJvS2qCc80dr0dQN1D9nAA
X-Gm-Gg: ASbGnct70V9U+Aa2aHjC5eeCG2oBMFCJXYg54VANb+jGxZW6G/m+W43q3Yi1msf2GOB
	zYQZuGnbWK8/3GhmKBS6daqn1f5MEO1dk81HsN9BB9gWXITAgpakg3qdhYt3AnEFiJ4NOqkYkci
	DxCgGJdIrS7bwK0ai4DFPchbarZe9EKARSdsI0sW7WOuVUanIdnoR+IuTeQP0VpCQR+Hzzw/1jx
	SqExvjpbF+BS2eYVH/Hs72FEnJnwt7Hc23hlRrrfAk7Pnx+GD2b9pzqBUSIW3gj7HBJpM8807AF
	3oOoLQDalgDjeQvThknEdQO5xggU6p7w5yeFNbGgqWT24uSfzfZmCsCIEaAIheJM5hv+BwFgyBJ
	qhm+DasjdJE+ItmJOd+uhtHQSK9mCs8i8gH1/SmRcrw68e6/Y5r5Du4L4M88cyKACHxM1N4cjz0
	iXbQzV6JZtUD0i
X-Received: by 2002:a05:620a:294a:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8b2eae0be74mr198741385a.19.1763314216409;
        Sun, 16 Nov 2025 09:30:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuqqDIWmmV48P/IbEy/yagen7lKWupdKBUw0Q4ll39gz4EIjYybj1UFJ8Ia9tQNRLOsVTrvg==
X-Received: by 2002:a05:620a:294a:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8b2eae0be74mr198738785a.19.1763314215893;
        Sun, 16 Nov 2025 09:30:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b32fdsm2555671e87.34.2025.11.16.09.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:30:15 -0800 (PST)
Date: Sun, 16 Nov 2025 19:30:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alexey.klimov@linaro.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Fix error handling in pm4125 audio codec
 driver
Message-ID: <ogsbudy3yezzbazyg47m5oy7lxllfh7rjwn44z3mksw3jlee2q@ep5xllgyfxkh>
References: <20251116033716.29369-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116033716.29369-1-make24@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0NCBTYWx0ZWRfX+se5FRsZSpoo
 ljs3d2NCfo6T4omyxMB+9+aseQP4VRavx19FZXmy/7ck/M1Q+/0t3A6a4Z6Vt/Lc5bZEXvr74vD
 N2CjytPEhScIrUcUZrUhxrMTZZibpid+An24/NHQD8RgkHEnd4kf392C8mVUQLesm3/u8BKCqIW
 h4jybKF2n7UUgQjJOTarhgRvR/NsGibcCJfCKOYCvDepBRUlefykA0J7glExwvm25zq/xnYhtC4
 DswBGV79ceHFyllwdgWEPc2OuVLb7UUyZ2cB0449LWP9Ot88A9Htw9ijCACqU3aiS8zgSP6eho4
 AbA3kPG2+umihSdkmAlFBa0ypa155tXcHjltcDx3GWRjR96oK287XFDQOpfNKaD07e9IVhq8dlO
 2SG2pB3Ke1sHu1iLmzrwHcAmOeNUXA==
X-Proofpoint-GUID: L2hrnIbews2eAL4ophIz-g3w-aVd4_G0
X-Proofpoint-ORIG-GUID: L2hrnIbews2eAL4ophIz-g3w-aVd4_G0
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691a0a29 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-HseujzHLsh4AEBK8acA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160144

On Sun, Nov 16, 2025 at 11:37:16AM +0800, Ma Ke wrote:
> pm4125_bind() acquires references through pm4125_sdw_device_get() but
> fails to release them in error paths and during normal unbind
> operations. This could result in reference count leaks, preventing
> proper cleanup and potentially causing resource exhaustion over
> multiple bind/unbind cycles.
> 
> Calling path: pm4125_sdw_device_get() -> bus_find_device_by_of_node()
> -> bus_find_device() -> get_device.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  sound/soc/codecs/pm4125.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

