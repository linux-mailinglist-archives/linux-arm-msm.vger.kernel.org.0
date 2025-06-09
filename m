Return-Path: <linux-arm-msm+bounces-60669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6BAD249D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 19:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3477B166034
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6726C218845;
	Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQZZDwDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D91F17E8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488690; cv=none; b=pSwvM5xEcAVUSp/6DOxibOe5HL+RTMXDiuccuJxzqMmlC040+pQJCYO/9qW6uYaU99IICUz7vr7PMLcPw8IELRNndm19wdene7EkrMUomRHanrLd0KNUc/fy8h12ItEV1KMsCB7brQZ1/z7T2UWYo6q8USvnwcyAZoOYWwUdQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488690; c=relaxed/simple;
	bh=00Vpg2cM4kpG4wplEINqGeb9mfPqt6YhjjoePbEq7Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNKNWwxtoN8nxkdIpEEstVhF9gX5NV2tum7kSRo8uSxe7k/f7mrNS+2o5P9CjSikAo7zVLqxEJl1QRmLeR1aYhVfE1zxgOSSBvrmlvrYAATFq22eeI2z7dCqXesol5zgbViJwywGgFS+3zTzJG7JMSkUi+Wr00e2QAYRHEgomf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQZZDwDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55996cLE014709
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 17:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCk
	yh8rjoSs=; b=OQZZDwDwH2F2uj8Ad6YMymHUDmheYoaaXO/AFlTxYlg/B4Z/kgM
	5FO7BgxoDHXIif3LYm8TfDLoPCYj0N7ZadCh5oVK9vIUFqyQbDriNWaiPlqa5NjW
	IzjMdYxVRxWmz4qfz9qBRWzGHpDhyX+OgCTtYF2vEwG3vt5UiWvGt3Woc9EXG9Hl
	8E2FcXOur6O2kma3J9eckjkv9/vfVJxmhKTMt+4qHXfi0GNEoPz12Xzs227szkfp
	iJeK3dg7u/WAqNcW3ttNryi5RTtLogzlGvYSNu5HEfZfgGdL5zQOrDO+uujZ2FtQ
	1sZ1mK+TVgv+wYBQYZhzq6+sReCnlPe3U9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66mdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 17:04:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2350804a43eso72672285ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488687; x=1750093487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCkyh8rjoSs=;
        b=MrOQw1uDsCC/oipk50M2gEinAAE9vBoJwcRDVdZwx0AUJZS1HeyqEL0v5q038osRbA
         2MtjaAutpJS8gStf18VABSNU3mUM+TZmPLlIB5bxOyV/o/bhOev3Tq5VR3yULOQx7vkk
         O52eztUJ33gQcaf1xYvMwhNFXLW7VOISVZBMnfisY6N+BVUj9OLn3Mt6ozLvCsILA9X+
         xzyJ/RaVz8/Uj7FvL2WWZLGVF8VHgKHdd3IWj3ZoXZRPGlh2v6iVPIa+C+woobd8IqRy
         OY69enqyEhzkGlraAdiKXjUqXrlWtq3BNJjVmmMpzKz57HhaKPzIiM+9nKKGhZ6wb1Y1
         8KdQ==
X-Gm-Message-State: AOJu0YwC9mu0rc6SXozCHymse8JCwhtFQMUFFQM/H2Rg2E5pAS+uDzfL
	UO9o6jKNDlNRrga8c4DD3w9aDAn2nuKG8V0E/mhOviIIX0srf4t957o6YiGxAJOwZms/QRcJtso
	8czr1b9pPxX2D5PYvmeXoho86lNb4ftSgP1zT5fT6IOf/DZtRmbw2EAzcHUf06v05gNJP
X-Gm-Gg: ASbGncuQynSuKQKTbB+7eKwBQQwjMTQo/DzGxjW0WXYUzGphfKK8ubxckRMRrPNoltH
	z8/wzm1nwBnVu+L9uy2f+3Ig4PsLJWjpcw8sTVAg8VMdKM2FqQDySWg4kBDLB9vos7bFWnNWa8l
	gZm0RTvL/Xl85yELcTAecQ6LQNBoCBuvw79LRK/RxHE6LAn3F3BjM5U/cg1H9reOF15G7trcEDi
	8U68c2JYPBFguXccgl+aQY5FF7ckgWxv9hgC3Ekw2l6K63Q/goIi0x1DE5YOBWP7EAdkjmH0/5L
	q8LBLutqL8xoh7XOWBqmNQ==
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id d9443c01a7336-23601d080damr167971625ad.18.1749488687109;
        Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFci88ZKpZFhTl9ad+qroQOgRxzN42L0DO94tMutIphra2Ct5pxyLzpOzusnoBC5stEEgN6GA==
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id d9443c01a7336-23601d080damr167971285ad.18.1749488686715;
        Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fccc4sm57380505ad.127.2025.06.09.10.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 10:04:33 -0700
Message-ID: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX45n3DKS+Ta3R
 OawefZW/Gvr4KljQ9E6qTP5tcyhHz58oKzoHxE4cLyZe8Y17T2FDi94ZxNIM0d5fwZAmfCNMBGt
 MOCCVR6zOs5KNfh0u1AjmToVflfopnibhEcty1M8ECr385J5T9XYkGus/QTebqabm2Ck28rh/LW
 zie6oTfVH0MbjiyibfF5aSwHf93hsDIj1wRI4kXR/9R6yo7hrzN4EdZDKn6wwDVdKQdGzqQJ5Df
 n5VhhZUORw12DyjDeZo0ppyndOZunBtZRbP1S1W24/Um29dok1jUY4W0+q117Tvz39lB2ADpWJC
 gYcj6Z7zN1/AENCH9P1k20vdxDa1eXFLSz7Lwds9n5JA3ZiBfHMJwY50uMzMvK3Lhbj0hV5nqg+
 8X1E5FHxnOlz037aKe1w8cVp8+qvIKvV+SAJzln+fmD/o4VbKnrjvqaOsBEhSQi/uPwqm8OM
X-Proofpoint-GUID: LlZUI8-RYuGzcXMpdYwlRcFBrdCnd98t
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68471430 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LlZUI8-RYuGzcXMpdYwlRcFBrdCnd98t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=744 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

Rob Clark (3):
  drm/msm: Rename add_components_mdp()
  drm/msm/adreno: Pass device_node to find_chipid()
  drm/msm/adreno: Check for recognized GPU before bind

 drivers/gpu/drm/msm/adreno/adreno_device.c | 39 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.49.0


