Return-Path: <linux-arm-msm+bounces-69839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37970B2CFEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 01:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C3A520065
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 23:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C24A24C669;
	Tue, 19 Aug 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr3KqPQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5212441A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646154; cv=none; b=QpL863xsb1egdgp8qognGoObHgw1YmYQxzOcKlNDcz0WU+Jg1A89zf5QytYD7zI0xoHo4zjaFXvWKN7zISdbd3GXR4myk+KaiUWyELZjEJbgTjyg2IHPax9AlwYEgayeoBtRKAWOA3SadUdBv7ORqKNU5hmA5VVVoH4I+8K3HKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646154; c=relaxed/simple;
	bh=nlyN0emqFC5mah3+AEX+HhzrrRHCuhU8yafMr2P/Azk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcXkKAIcGTZtElaH330AJWmDN4eyFu2T5y+3idFdgUF9zSr4ioAYb0OXn3VEw9XeH9hHTkbig+W7wlViqDbDdpmTZkiLbttOPqY3vG3yTzzKGCIwjYJttIUyIkbyxCxUL2MjViIkFOQceP9L7Gu5P1Kae+yEJzuib7hOGv9o2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kr3KqPQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0v9E027413
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uXtfjUzzByf11+oWG4pmF8mNkBkkbpFfD4T
	0474ANBY=; b=kr3KqPQ2BQHM8y9CIGwXmvqiMqQObMhTD79qY4GbG9+5kLjJsmf
	xpUor5AIH/xYM78EW+1aJjagj8CJ9GvfJSKYTbVsdkZtjppE8Lz1jpRdidJ4AG0y
	NKvJj8FnI+AFb8wND1dbasNCdM5r3QyEXE6DK7qifZ9tXmOc1ndriLLHaAyzAd3L
	DEng6MW4Dg+5AHMCom5acBZFX8tDZdzSRd49gOYZlsI90ztEGjUHSrCj+TInoZgU
	LAdSdkgQZkyv2A2R8jC2jNDyDyq67HsdYVau2D3TyFMcGwI1wnKEkuM2SdilTEW1
	+nkQdaekBLqhadKUGlgi8yGQ0FVu3HZsghA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0th08fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581187c6so67362745ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755646150; x=1756250950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXtfjUzzByf11+oWG4pmF8mNkBkkbpFfD4T0474ANBY=;
        b=MvDkL24LwoJzDK0vMJYEhkZNUmilMQGQHq+wi+ZGCLQyV6kSchmN689qDbjpbqV+BH
         taSC5hLcH/VzIkvlSzdI2j98pECc7/EJv7LOvtMUeYJQqpj5dl4/mOLIToBVwPXiUKnk
         tB9kiCxTFKIy4I6vHAmblvgV59UTcpg3jERJT+18iPHK7qrChCtBWBdfENmlHTnTmPfA
         HUv9XxxtqSVWbthaFNGbZMjWPxWcJybjenYtwhqJTx8LfNjh+aqlgbupepw0cyCN4cf8
         DLjr2+n93ER0tLtuGcfU3mQ872Mjb9q61Raw/oYdCmFfh8hFHJVWf6UsrXQIJ52LYTQL
         I3Xw==
X-Gm-Message-State: AOJu0Yz00SZ59UOukvb5MiPIt80zqJK/KmTnrTQU/apMUesP3cuaOUIx
	M8INFqKrhdtaV9HXSx9G1huX5ivs6EL07U+YGs3ob+5PMHLpc6v2JOZFrp37O6uTuoETKD6JJ/f
	zQSUvt90fNY/5SRCBULTut2qXByRDFeaZd0tPSk8wZG5aRwylwTr7cFDL/ZmXiPDumVCr
X-Gm-Gg: ASbGncvhAs30Uqa68/4NRt4jAOX8V0ZfiExQFZ6wqQNsEUwxyeSsx7B0ox55s/CByXG
	C1t5pBew2yWH1JkQ78YJuMeaIlV5v9qm337PI+MJyNVNE24qyWmXNvzPUfXYHDRmuS1jqiQmJWt
	/xU5ZMVigrz35phYFSxhptpMl/aC1BI4zqAz9bI7dbc2uPX6g+ij5F9M8/Zkmr+J4SXLPQmQ9VL
	UdPW6vrjuG+uwsl/7KFTmSAcx01YjnEq7g6q2hlMZxnGNpFDdgjAdktnWPGTx1Sz2k+MsSJ/Vh4
	7IxWg+TUjTrlgrMeOJnLPCk1hVF3+VmEjq1yQeadCM6xPFhZp04=
X-Received: by 2002:a17:903:181:b0:242:89fd:48cc with SMTP id d9443c01a7336-245ef25b64fmr7800925ad.50.1755646150141;
        Tue, 19 Aug 2025 16:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqUzvFcXROWico6d5Pqt2w0AvN4+pGykRNe2nE6KgbOBguGbbEYaRHz4y5taRq3of+8i1TGQ==
X-Received: by 2002:a17:903:181:b0:242:89fd:48cc with SMTP id d9443c01a7336-245ef25b64fmr7800625ad.50.1755646149739;
        Tue, 19 Aug 2025 16:29:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51a97csm8052695ad.132.2025.08.19.16.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 16:29:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: A few GEM/VM_BIND fixes
Date: Tue, 19 Aug 2025 16:29:00 -0700
Message-ID: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX2NiLGaYjeJhO
 TkUMSJvoFcYL8z2aZD2apZN2aNKUk/JxtOBkB6JOypud4TfFVvDnHjHMUEGupbAhRUS4UoFzXWb
 vIx2hjFyHK2apPry0FfgFbCYH0AcOkyfWAYzP+X8mc6TREP9/3W//Y7mVr082LaScMinbF52imY
 L/+jBb2NI0x6EN+BprF3/85cBhrCXDL0lP6n38tjmFiBFrAMcgakw+zrwfQHXDlxYXxILE0ykjG
 iWYMiDFN9S52Sxn6xZimLf9iBbdy5StFdf5WRV7OhVGc+XRMjK4vLosEomLYXrCWslp9uYOmUiX
 gEA5CYDghF+E37QRIdT5Jp2OC9ANLevl1G8Q/XK0ThyYq0yvct0+uYdUh6lXAwIzuxKy2EcFIfT
 RYLAZueC+VOXeEryMN4UlzyGbwg/bA==
X-Authority-Analysis: v=2.4 cv=dI7/WOZb c=1 sm=1 tr=0 ts=68a508c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=7-57VTQsmsoFMMg7Vz0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EwV9uSaR88j-xY12yjRylx5NvdjrjwcY
X-Proofpoint-GUID: EwV9uSaR88j-xY12yjRylx5NvdjrjwcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

Fixes for a few issues found in vkd3d-proton testing.

Rob Clark (3):
  drm/msm: Fix obj leak in VM_BIND error path
  drm/msm: Fix missing VM_BIND offset/range validation
  drm/msm: Fix 32b size truncation

 drivers/gpu/drm/msm/msm_gem.c     | 17 ++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  6 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c | 31 +++++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 18 deletions(-)

-- 
2.50.1


