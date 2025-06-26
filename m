Return-Path: <linux-arm-msm+bounces-62693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E09AEA9F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9ED17E976
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 22:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FED213E74;
	Thu, 26 Jun 2025 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmLUJcLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C21917FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750978032; cv=none; b=b7AxY6mKLuRs00eY1TN8vM9VxsfUeDQGr+37c8vpD1QfcGVeEhvVOG45/Cau5z6k8xnkcUvPuAK/4TsvEFuadYunsNMZ8S4+0ha2Mf9rfi7GIdts3Z3T4+3ALC48o+YZnIkwKNd74Q9lnbmyI216HKZTu9TJq5B7MP/C/fE4rdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750978032; c=relaxed/simple;
	bh=k/WLttcj9Kp3cQ4uWeQLm05Crh8H/kiYV7NaB+9UZSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMpqQltxTWLMses6qb0M8jl0wiugwK8ccZa4fje7KgI8zyYMLrQLbj847OlzrdDUc40UVv0FVKW20eYBmhFp6q3ZuH3NpFD7g9kex487J53V/f+K9RsoOEz+F2sSHh4fVBDzwgKMLyKEtzaj7mZ94IeXJA9NNs6dNb6QHmJh/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmLUJcLS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKZpQe013183
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=; b=DmLUJcLS0w+IF4ju
	mlBGlsPbAW+fReM3XDpVtw5ER/J6uRpK7PbGvyeaQxUPwZtWRpBL/ajsNXUFfbQi
	aYoZmMoQw82RlY1HVAStmFw7q0ob8oNhYGpa+kBc7dayYbG6KO2J+c+n9TNjQ+TT
	5yHJEU5y05QWGaaBLGewI1FdFPDetApInyJuUI7aFmaay4Z/UMsoHU7wkCeT2m7E
	axP5Ju5NOUDA/woLlcrXbIcxSLoH+MqwU98WdW8tCMO+kG4J3LtBOw3Be/AeHSAw
	Bi6P/xeVKyW7CZHVpJFN1kHo/t/cxGuLH9hRUthSRM/KTwcjyiFOc5uI0H/SK+0n
	lWnrTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm23bwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:47:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so435307285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 15:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750978028; x=1751582828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=;
        b=eq0Pi3hIufC0LITixDUyel0n4+tuhbLJqoUmYAOiDxixQYD8W/nGXhyin8DdWW4BMB
         T1vMJN/QU6G4NfkGl8RK3iKL9gF4k3VVHEyqZzgPS0nJPenQND6VymyYGnbYSwL1Hwlv
         DCTv6anj2e5WdQGUACzZaoGrbjUlZzWqrVUgRoJPhV8Ry/VtwiTQDh99dn7zHHQHuNrn
         Y5CnsBj1IcnbM5kAnjE71UhasrVDHZ6LwKCnqQBa0KH4WiixXTmfHAWIJGvKb9zA6PRD
         JYIPu3DNDv2jMksVXuL1uNJqoIshzcGRqf0pEGftDCMIN/vNTdLOKkV7QUH28gI+36gd
         iViA==
X-Forwarded-Encrypted: i=1; AJvYcCUsd6KU3rp7kLiOKOe9uyAYfz8pPc2/iiFnMD9mRwSHSA++DRAXnv9O0C4f3SGKbEjM+eb/lpKsuFX2tT83@vger.kernel.org
X-Gm-Message-State: AOJu0YxMZflYnSWT6GmQdYTmOVtYoZZvvQSEZrtDz+E+km0akXtk2vBl
	zRDy9Oa8AUnO8qugTWw5WzuNU7zNW6m/sXsMk6t7DDYU8cSPQsH3KNRkHvWhYgwWCie7prr7TfK
	uTiUZBQPFs0pE8GVpVMYaab+7ZoFK3PjLTsUiv3OSZXu56qkmeAN6VWA4kWK36mRFvcFP
X-Gm-Gg: ASbGnctZjHywvoZ+929iqwwBmYZojq9wzb2AwzirSkxTaCV5/EcbyEU6FZ1ZftkIiro
	tB/bOKzC/Tu11pdPJAC/OVdug0yqdR0Fi+xhGImluWmbnD4g1f1y1cJhVmTdeLp8MmyI4XiANq6
	XteYnvRVmrpu9GFZbX4ORZdcZ0kWJwG8fBumxynA738lQW/ziPnUrvmcHEbAGq0+2qoEySP0DYW
	Fsgr5B5z8FxJeZPdymspvnazGm8GPLg47eD7mhuYlwlaY9HQnO/hnLD4Dqm7DGV9Xt59fd4K/KA
	sIfU7Cd+N8CGSzw/3Vpq6Yygxne6tZmW49WA5l35x/bRZZYAKtxeQSoLbo0dk9S68GCj9LKvQe+
	g2mNnPIaDvsE4tTTsgZ3grsrK/gop4DEVKQo=
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7d443992d51mr155164485a.32.1750978028099;
        Thu, 26 Jun 2025 15:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QvvBbuRQht/PX77z92dSw11SIpFRHu9NAfpMGbcKSTVTrTrYOF0CEnsJFm4LXzUIjnqOGg==
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7d443992d51mr155162685a.32.1750978027682;
        Thu, 26 Jun 2025 15:47:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24e4dasm185172e87.73.2025.06.26.15.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 15:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Fri, 27 Jun 2025 01:47:04 +0300
Message-Id: <175097802066.519545.3760408226884035937.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685dcded cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=yB-vDBVxPvN9sSdsvdIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HBj2Q36id7aF52bmXb7KlKyyrHnhPlzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5NSBTYWx0ZWRfXxWyW09NYZOQ/
 TCq0/AT5m9otFnPdPSEsf2LBcAcxZc6Uz26XnnDz1pVCqhXc/8qR54OcBlW9jsFBd0zx0ls/gJl
 tH7b/fP6it132SNo5RMvxMw9+f2vlry+UytbMXNhdDrosaMYSnJ3V1+KlFpVcpxCFfCTsHkqpXO
 gJPGA2+AzH9+zp5sY1PvZ0jpGpd8UVVyIZ72zAYgz1VeXqgxll9xULyI1p0qn+BZdvlN5fLLsr1
 vSqQs9uHULa9ZsiMV1MhTguhSSGr5SDfL3SwtTeCk6B4VHEHUQ30E5OAXo1k7nEgRWt6hQFdKMf
 FHGPDIUIDW03jL7Xt2A+vsEj/VPxC6pSOgJYm/MhCJ7Zn2VOCc2epqWPrpHJCZskQvOYEFHtp6V
 gQ4Poh5mZVJWHfvccqiXVpuPRMS6WJXO44tGx/59cKNlII3sapcQyqFd3QKtC1vFOjCJm3tC
X-Proofpoint-ORIG-GUID: HBj2Q36id7aF52bmXb7KlKyyrHnhPlzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260195

On Wed, 25 Jun 2025 10:37:09 -0700, Rob Clark wrote:
> GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
> fourcc's needed to import/export these formats, and/or create with gbm.
> 
> Rob Clark (2):
>   drm/fourcc: Add missing half-float formats
>   drm/fourcc: Add 32b float formats
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/fourcc: Add missing half-float formats
      commit: e04c3521df073b688b9e9e2213cd3c588e3b6e68
[2/2] drm/fourcc: Add 32b float formats
      commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38

Best regards,
-- 
With best wishes
Dmitry


