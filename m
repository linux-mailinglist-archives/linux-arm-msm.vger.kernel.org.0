Return-Path: <linux-arm-msm+bounces-62974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA80AECE07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2A117032F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376948460;
	Sun, 29 Jun 2025 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oECh7iqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692B1D6AA
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208322; cv=none; b=P3fnpA4+WHYXX1xPUzgzETnNUUQs8/IhwGhXhjpwuSsTilXwVDlxsIOqGgLYTJlFgC8sh++ZovaWBVvfJ7Pn3VVllzAbUDlzl0/Zmw9E12d36ixAwr/x80C5Xw5Zu6LUFlObUv9znklBPjrdbVsJA5Ufip445mMmuNKTVbMexb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208322; c=relaxed/simple;
	bh=50naptVv5s/TjZg67luS1eqO7P3Zc5AAOWnLTHPerZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqciqytiu6ZA1YK8/6MTEn1Grhk4dDB7ozTbXY38qH7N04gu0LahyTA0yAGYOK3VZVZvjNI+bvrUx6t1lTgBj5QNoYGDOVC00scZMYhbYRRHoBVtcaMwtoVVK63hatLWOxv79oE0Hr+VcZusiursGKEPAoAPnSlC2RchEJ2I1Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oECh7iqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TEfXYh001785
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U75yw7BMC/S6igk0SQ7PlAp8
	c+8TFboIWS9Vq7PTNB4=; b=oECh7iqWHwXVcfgXCPhAZwgrgIRSNp1O4g18tRPQ
	G+cquXTpg7+KbIZ4Bcle76waU/2UcVfVOpAYetxIiGcxg05xJoJptjI1n8+qfQkO
	crMlx/koLGQ6Nzsym5ASCe4ikNAhAp6YQkjnBAR6rvHGoSGnHqRWrn8jh202q/vK
	VVF+5OFC1mgxwRNBjQKH0uEeGPRnaQRZRrkhPDkQypXmPSNIFl7A1j6deZbC5Bek
	ydDRgJ2sYEmcY4gx8V1u57Ea0OKUOJMsM0kiLN2KmtwwXejR81YXUr6f1ayfHRG4
	Wz/h/Y91x3I/O1pDMB+1+VDZpjeDnanG/84dJY3teCxCog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2gt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:45:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso199470585a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208319; x=1751813119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U75yw7BMC/S6igk0SQ7PlAp8c+8TFboIWS9Vq7PTNB4=;
        b=jPkTv4kfEZUZd+N3rz8ewpV/A734VKC7hPbfOtXKnk2mHKWvn+MOa+2K71vsSA4dJL
         klVx/eomLggIUAE+u8L96T/7sBN5yAGmdrflyyj2DslZSiR7Q3EEZYnWhvr6BX16cPzx
         Sv1xWVgxTbKBmQQ1NunhIWKgwlpngAF34/vXYBDuu4ByHPNVkbunlpUNFKlj1G7DmSS+
         5dwuYnqpSGOU/DYj8sqySjKVazBrg4KUEmVlC3ak1fwEV5DHaOWBI+B+gZC1TuomvdbU
         DOEKM+sIX3ogcYxtS/mx9Plvpo3V7S4onwORWPxSQ/CXuuRdwHhvQkwV8+g6ON7tLUP8
         Rmiw==
X-Forwarded-Encrypted: i=1; AJvYcCW82BmGhbXyn8E+Iw2W6CC9Bml5pFf55VCAeLL9EhSOeH85ndgdsJ3xzKU6VKbdPXiJQtttzq6vhVBAh2YT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6h8Jsfx/HOuo/+W957x3fTeONwrg37Nn7f9Z3aRMEauEnHVj
	VxbOweKVZiOtFMZghX+15fyI+1HQJIoNDgYyYyJPOI6d0Cc2tSibb9AaWq60KW71eVwf117+S3w
	9JwaVNynR7VglG+/x/QHAEgiwa22YTRvcZ6LxQvtmrA1WS7K0AFsETUTox8lbbF6FQGho
X-Gm-Gg: ASbGnct4dQrllvZ6PeoX1NbftrV0v+vRYOb1vj8dR9I8pH57AnN9QepMifTX3aWx4hX
	OSL7AW5lPj5r0B91wQ/Lxkq94S6jYm398AH3zN3xIhZtt2KivedDZmNPlbuyptSXSyUuvxDsDPi
	dOvH8689krn8Wwz+S9cWSaxRvJ/of7llOsXqumhxoYyzls5bawB83L5ckerlBgsdO0whmqGO0/p
	yrAXK2towk2np6G4ybLBchsSFxupSoEtwfTYjwgr52CQ21Z5IPc6yCLFFNQXBzFdI8DFDKbiFkO
	w4hdkAcDh8MtmkwyZtL1OS68N0XH4HDVkkoDzOTNXkBhF3otMEBKtt71fjCmqjR0EiBEJaYjcBs
	G16259oxqf//rJTIbVRDnH7Ys8ud7qssXL80=
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d4439b9679mr1537817785a.53.1751208318636;
        Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYpAnwJ1rYQ1S233FYjwYu4oJCVh/e3dqa7Xz6LlKsV9YCedkRP+JE+l1W66OWbNHR1zgWw==
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d4439b9679mr1537812885a.53.1751208318157;
        Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cd99esm1137184e87.158.2025.06.29.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:45:17 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:45:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
Message-ID: <nij26lzoinzr3cbfmvwzigtxpsjibaudect3i772swbnmyuz5w@2jny5ie3oqw3>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nBBa_AplLn8xYv08PgjRz1iyVlq5aaDC
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=6861517f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zVdBlVQdkfp4bBuhmU0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nBBa_AplLn8xYv08PgjRz1iyVlq5aaDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNCBTYWx0ZWRfXyHmhNXXBIue0
 GDQ5s+hr67pokIQ05NAgN9lqa3/+IY9daQygtBBo1qE+NT8E4exZzOsMq5iXUzxR39PeX5Cigrx
 aLb4VYXnNqQfHQafIJaGSUHWX4ZfnjmjqRAzUNtOF9ZlbUfzO6GHXnPAnm3WENsjYt45DemQEgX
 43YIITEfLWN8vzAWIm8msgZi8iTUAtvRTYZGLw7GdVTnI3JxqU9YhxiGlM8UmUm+vzcfJg1nN7b
 X+F+7P7lMFPq6Lf7SLE3XJ9t2ZGtcbqN1rPB4oQLZgVTw36C33DElzfHDHoTGmtraFvx8WPwkBy
 OFDjyu+VapuI89ogGHvJUTaEzeRJ+8Jqs9/r4lzYlzE/b94JvvojeqmmHQ4FJsuptzfDrINuLrX
 6PkFVNJIMdwd6wAodCnRVo/pTYlBiNcri76l1O5Y25aTMCQJoTsuR5sRWAHbwptiG1YJqgXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=823 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290124

On Sun, Jun 29, 2025 at 06:58:41AM -0700, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/build.sh                   |  17 -
>  drivers/gpu/drm/ci/test.yml                   |  14 -
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  29 --
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 139 -------
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 350 ------------------
>  5 files changed, 549 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

