Return-Path: <linux-arm-msm+bounces-61888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB37FAE1DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 16:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F6B167901
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 14:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF72128E578;
	Fri, 20 Jun 2025 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl3GmeIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0760D28DF50
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430605; cv=none; b=UbKAvtGpvI7YNqdRAEpDXNBTCh4RwMa7GqcTv1qHMSNUR7OUCScOXFCs4XdVB9ShTbGBiWLP+su7APfgjbZnY/knQTU0esH/ecdWbgJVEIkIcVS61BHXIAXlt9RGzm7Chj4dQWKTRogtf/snyRcI8um5iS589pduUglvtGniYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430605; c=relaxed/simple;
	bh=GaZeC3b19Lss9cuHmvYQt3eAyVG70HYyhb4xdv8u7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADYZ7rHQk0QPnqbA5u6kpX2D6sElAEv6YvOnyZlnzMwFeLrsK2+zHBbwfbjfnGF9SHKRQ+h5ZC5mprMxWQduCKD4ZjGLxP7d1AgowwloegUzK5zecS6UTUHqneWWWYMRy6Rbz82ZZXUi4xnglS9ZpaesH+Eg8OEfQNl0mQ8eXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl3GmeIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K6JoWM003269
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
	uErvpeQ4=; b=Zl3GmeIuf0dgfyvT0aSr9VnNCZ/6LpbW5f9OlDK4aCKSHamBuJz
	uPMG4E/kYChX8HWWeUK4RdZwyZdp16pbU9ZqiVF3ZO8p5oOSLCYli7BqmPl5A89Z
	n+WvQpRnjPXFmJvQeawf1PEwUxD2Qc+Thy/HsfOqWhOwjf/yMv3UWDEbjs3owgz6
	ua0YL+WHP7uD6us0YZHYgbrszrukHrC1Nz1eiDI2qpbSC1sHp8Gqm8H1wrLSilYr
	q6iaeu91vOIZi8CkaI7SE5rD9jucllprKZ6mowldd3+nRBPwIED8TlTY8uQe7NzG
	kvYifR59cDNOP+Qoaq/4V3mUii4UFLMXLAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23fjk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:43:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234fedd3e51so19586255ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430601; x=1751035401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
        b=q6KeFni1mpdxGNm3GBz9axJz4kz5Lo1gzdXGjHMhuiSFjqy0bDgBvMOp4Ri9/Q8h98
         fYvLs0nXG/bvmtACrxEpf9QVAyfD1VkTtPulTGLqLz6fUE1xEo9LoIzTsdr45tvLcNQW
         nYrbtilpUZJcg+U45NIT9dYIbeZ9pTJdIkGNUJb1FFQfWBR0W65xYZuL6h3C5jOcFc5k
         VNEp+fA5BA5s/O7m0ZEAYTo7S2fEWlivkLD13JI1OUCg6X4r5B4CRjM14DaQ9KnDbvjo
         KPHm9BoIanvOeEgzZAQq0kGHkCoTRMoYW4QSjTL7NV0cHsLgvUpZoBlrq9r+Aa19G8xs
         Idkw==
X-Gm-Message-State: AOJu0YwipBrUFWDEm5Lub7sQmUBrxJHvuOWas43/yJf4/UJkR3Ecg875
	L0t+FpIp5BqCMwNxacuAMx/l2crMdNR3MKq+pz393d3+wHD7NmfKHhdhAGi+xP8wwKXIAr2Vlgf
	e0nmO+4oPlrXcETBW11RPHJ+cjF7E0C4j2MS41e2EvQbv9FR+Z2i7HsleBY+fnororeeX
X-Gm-Gg: ASbGncsj7HcHyj1FdUSvnBgFaj+Kunwhk50EltmT2uQSuVmF8qg6SmasJsMdYIVvtcv
	Xs1KxKlD+zUsru2gtwfi0GCX5r7N2JJ3nATQYMfFKnB/O0TuTA3UIchea/nkDH4cdAD9Qx0xhbT
	1N6kvHFO0D4fjMxaPkjwLri2VUMyUcLh81ZSI8vLucjK51jbjhE7MWhLjxTXw4hYyg3hMBvW8a0
	DekN1JV+QuXS4OKbtTolUE4Wr++zVFT+nXXOLXDrxs9yfuIxLfn1VYWLP6/aWNHzod5DpcKPr8R
	CRM8OXkuHfp4Im2xBSpjIaDQl0/4t50r
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id d9443c01a7336-237d997f3eamr46312785ad.37.1750430601392;
        Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKsJtreskCbpXvBM14rVJruFPEilAe5QcPvqswZYUDdmFWdwF5fK+Gys5jp5oB13njFvevOQ==
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id d9443c01a7336-237d997f3eamr46312525ad.37.1750430601017;
        Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83fc120sm19865865ad.87.2025.06.20.07.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/fourcc: Add additional float formats
Date: Fri, 20 Jun 2025 07:43:07 -0700
Message-ID: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ERjRXR5vJxxF-ZnpXuqPST2cdANweszB
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6855738a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX0PuwDjK5FM/y
 bpl90d4LxN380iTwpZ8DSjEbbee/4liMV4zYv789C66cbWy3QLPFUuzQijSVyLfiqM9v2vFTy3v
 DOuYLtsw28AJaW5duoOuohxgMNQYeCe0rVlVjcwiTiDwItwYEReN/WEw25TQnp6+DoaLtGThSi0
 YCyEbXzmc3LJp+ESMVF33F7lRdgGI99FVahc8Bc/5HRL/vZQKIRCi1z9BEukVSzFjeySo30wZSf
 GROy9H1UgnKtfX/KiArvszNzkwcrok2YWBg6UI4SYx7z+M3Ux8jc7RandnkZ3kXpXjziVrvjvfd
 xGTIDtJCicoR1Bp0cXKyNbk8hO9YffbFpffNqSPGwDg0LKqx7uQAKdLhtkGfbTP1Y9hV3zvZAWG
 xzhh31eP4X8pF8sB8hNt9ZTVdgZw5pRiJJJRYIeuWK/R6/2FcG/Q7s6IA7dNIZLfkabVB52a
X-Proofpoint-GUID: ERjRXR5vJxxF-ZnpXuqPST2cdANweszB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=998 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0


