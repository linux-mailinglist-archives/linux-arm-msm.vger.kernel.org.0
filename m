Return-Path: <linux-arm-msm+bounces-59231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 813DFAC2806
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20E207B0135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 16:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A757297134;
	Fri, 23 May 2025 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodJLXA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9B297126
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748019608; cv=none; b=hlKP3l4Zoa1lF9sGJ6Qq1k/IrKLmehXfgHXPDR3eE7WuoIJw36U5l0fqO+aufJRpNFVSrd941ZQ0lxev1Z1IE02JYuDUr+hm32RuWsQj+uetew8Ga83mxRbfbYImAQOsagw12cj/5nRnQAtR0VSyQe1RqI3vPgdCXxYTAzaBpYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748019608; c=relaxed/simple;
	bh=PqAUDpTHg12/haxztSOdHwLW4aW3aRIP8fiQ1P4X6jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEVjxJ810T1Yfz5zEyO/zAp2+htvYXwFgR0Ax1kWCf+j50PYoIQEpPXWjnyDsdw8tEEWM3iajlxMNTxD++Q5REU+8fDPIOoETa495WizUhnRvRwieMFXyX96uweaV1OEwNbu5tm5Q7NGIEzXOCz4RohGIQ/PeIkbFJLtIUeoVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RodJLXA7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCgYEl028470
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maOR1rPHKMjhU6q4YVbFSzEd
	jGLm86V7mh+z2Dssfhk=; b=RodJLXA7sxKKqUjE7fZ1XL8GGX5MZDuJodF3bNjV
	+hBLj/uhAA9Aaxbc7VEGvBPlHkRTYN8TpgwfDdMGgYu+9syM/t4JerfrgxDosajl
	VHJkJaGGS848/wrQjLJarXprVSKC/8Fn4F81gViF192SAP/+juDbU9jCt4cZvRVC
	to6DXaz2FK9PoVNmY9k16l74amWNEK1N3OlH6x+Th+IQL1U4ac9a6+sQCRahNh7b
	tVoTtayd2cj+QgZhRFrXnXwlAByXS7VDe66fk3fCR/1os6m4QMc/QdPfQaGN0ZX/
	u+wWy/xpMkh2TH5CoUVn7C6edA6obfN3CA3q40EC2UMlMQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts0n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:00:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c461eea3so765416d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019604; x=1748624404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maOR1rPHKMjhU6q4YVbFSzEdjGLm86V7mh+z2Dssfhk=;
        b=flhyc6fU9dGMHIG6ShGpr8V+eX4alsYoQ8VI1adCpaRY/rQR2JYYg14L4yVuL3mHdP
         fEmjQ9y4uy4WbQQmjTxlDeetfC6TyVjzCyopO7SlQO6w90HiuAsfHqCOJnqYkIJIVDLC
         VsUryLIGbcZcdYwaATL0H5qYt+JxK3M8Mo1EfzmjNcIlDkoe+Cmrussx4vbpsI8UKSlu
         C0RDg0mGe5hIIXQoNgyRIgqAMzbVBuulWQ0j4s/cZfKTdrn5mN+EuqXXO9JCXavHGwve
         9g5nxSe24TyAr5lEd1Yrhspt21WSuBirZBUMGeEDu0nedvKh1auV6V9SNR9VmQm8D5a3
         loSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfOiMnKvjbGZ9oTFmqna8S1odpcGA/vWvLzZaui8Nrijyx6GaYRs6RS/cm8wE6RobU8GoMLK0zUpJT7GNM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8b2i17n5jYdFOXulg2tcSzOYN3sYy9IJ1QavB6xR4U9H9Fk6+
	RB9qggynvSXIpcSK6wM0iTZDzgNd+bqvgnoRjOcs64WSSql0Yp84lXyL0cC7FL8i4sxZv3/75p8
	FX2lHbhuBAyzMyNMkQui9agEdxuTJ7PoYisxJP8qpu4nVH5yYfh5eXc7M4f1VkOBplkik
X-Gm-Gg: ASbGnctK+38ZRQUOkcIb+l8DzWeMtvxNhw44sokOaGzg2VtLqegsn6AOpg9j/0VJpci
	9E4i+Pw+Ve6HCYlpIOfFFG1NnIA+sJy/bA6i7y1AosKDl12MC5oC6jCSLlCmWbJ3iuc61EIltOM
	IONnbQ8tD4cCocyGAaH84twZyljzeNHjuI4okU9YgKh9XcUKqtSqHyXLA6Z1DJf8KUy1c2DtB2q
	6TQ/VjiJFb5+o6wXV+P2OrMlYV/qWDnnXx1i34qZMK5J0A3JWJFTbi+d8QZE738HCQHcqD4PSxV
	mqK+AxTLproGNnaiGWJne7hM6Da10xhHKuGAJqkcRZ89EEifrteqfHKvja1MuLeskjJSsIrR0c8
	=
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id 6a1803df08f44-6fa9cff2ef4mr5010216d6.2.1748019604274;
        Fri, 23 May 2025 10:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCYdw0GZtJvLCfXO1X8zZftyGhiXHFblI6F3g2GPsnCAihhW1dYilfd6/MVO03PSiywr0fMA==
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id 6a1803df08f44-6fa9cff2ef4mr5009886d6.2.1748019603916;
        Fri, 23 May 2025 10:00:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f3666fsm3935508e87.104.2025.05.23.10.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:00:03 -0700 (PDT)
Date: Fri, 23 May 2025 20:00:01 +0300
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
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830a995 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=dkGs_W1-f6rb9hiwgxYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Xn17jEaSkeJWnHZTCw3J9GRIGxhH2yvm
X-Proofpoint-GUID: Xn17jEaSkeJWnHZTCw3J9GRIGxhH2yvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NSBTYWx0ZWRfX/IuPhh//L5Uq
 TUFKR4dADu7/KaIFjmTjbUF4x+TTZP08c01/+2F+dOtDuMGBZ9NSqSmX3nXzVBDzE1zhu53tw+C
 zcwXTp8MDHW6y2wwkkCVNxGlluwHYKUstMZHbYhxwqAWuLRM0pRH/W/iMVL4f+DNrzpb3IzKmPZ
 038M27dGM9jr1MU93rr9HxBnd6ntUZvMvixIpyW8RuQr/Xf4HQRoMDc+fDIXvsEejDL8Zwjmm0T
 xv6eC87Vk5nRDeoo2Jaxiq6iMxzb8tycO3+SQyns7pVDmjpDiZLF1yKV/nM61hhdUlHm1CqHjP9
 AEpRv7iOXAqB5dOFNkQvHm4OdRfOSE0H+GKF4XoQtOHKNo8o9oACqUpL1cPsW54A53qNzCHQ48G
 U+CNfEzF+AqPAO6nEMZ5GZ3E5gr6Mqu4lLHF1ZklBi+1/4gazG7e3E6xrlqXVTq1cCgWOe38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=346 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230155

On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies

You are not the author of this patch. Why did you drop authorshop
information when picking it up and resending?

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

-- 
With best wishes
Dmitry

