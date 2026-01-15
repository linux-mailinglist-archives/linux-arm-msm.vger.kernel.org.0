Return-Path: <linux-arm-msm+bounces-89142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB8D22D98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EE4630ACE97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974DD331A4F;
	Thu, 15 Jan 2026 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA4r2Aer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGKdxAx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A3330B2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462156; cv=none; b=oWpZUGGLCOgNOaLemIgPd1bo/e7DiLqLsayDeoLDANZZ2Q65Wj3XGgOnaxbcNNuIvDdhFhS/nc3dr15yIZMLqS0dlHobg8rwV1T6GABasMphtc0DHSayJz04MKBtpQwcOOVy2NU+ReNb6CH4YQn2cqshQ19AISzufKOhYhCs2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462156; c=relaxed/simple;
	bh=8TIpb1Vecd87DdarhQ45qjuuPLaThUggnFfuyV/O1a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0mamASe/fSkR56PEF/2jdVRbElrBtJ2Uy2ZyIy3sDQFZ6UJ4AMve/v7xWzew71FD1QZGPvrXsAS/EZF+QNbigGX1dAqTt/7kC2tqtitvBS3MvCmjYQ7G/bSXnIvQuyR/lRfgLYY+t0KhO4WjnSPBsOyjmhDMRJ6gLwgSu5J2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA4r2Aer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGKdxAx3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gUG31056584
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=; b=lA4r2Aer9hocwYNS
	HjpLjW/ZbQklU0LkL34P30bPINgLs3C+zfnTRAPoQOO7+A2KcFXLmB+Rl9pOfC9E
	Xf+Y6P0R+C+74Mkc/y+5P6cP/staUKk4Hj7x4kFUUAiQEdyD8PANWgpchqkbGiqZ
	s2NPitEpRtG33Gt6FUgijHIfNFHFaU4DWO6yuZyO9IaLTt19/9ouJP0Lqx4SGv15
	UKaKjnbp6mEbkpxzfrGG8VvOCBec2Rh1H7c33tMevKdpJ1eapCQYDhnQUauuz0pq
	XWQWZCtKx8b8xYXLU25PqQpmjFxNZiFeIugn6B8T51MTLgC/xgWO1DewUq9dXo1a
	nZcWXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d33ree-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a2ef071dso19293985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462153; x=1769066953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
        b=KGKdxAx3v23gQMwYBm4JmTvY/g/dpR9EUN3DQUJduU0pX7kwjsIY8F779REz0VeeXK
         Y+Sbt86UsmttHZ6fwrsicuTcY7jx3OyGDLj9cEuNptTNDkcp1A+O/UIfKu/3CaTmW3CC
         14lVfs4bMRv6pOdAzXKGzVlmnCFHcqKGQtTyz3pY7d2j4dOXmcA5BtflRc0MKSdCX3nM
         tdUZu6darsYhTofS39BzDPsn3qe+3BganYeBC91nkjFvTIiZssi/oSFDtihT/HTvv/cK
         fUDNoyMlic/8Wkmc/rwajg8UnMyE0bz7tHsbo8970l4A/hFgipuVNPCYXmR3D4rS1KjU
         vBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462153; x=1769066953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
        b=wYWb/Sz6lRnY+UR/pqAsAYM+g8AXXvUY92AaCTLhTwyk4fWv1zgMgOKY5p9tnQrXad
         8m2TxoIsQMXp6CuLV4UE+rxF474LewT6lhLRompasgv0S9b06WXp5PsNAFQ/wKYSPgXY
         ITs2EYuWZYBIDjqpvMXBdREuRanGl+15/Nlv/8tFtc2TloOuIEjDODoiVi00Yk8mUxUy
         cKZC8UmHAkpqngtNgLEq9DiUmnTnvo7EKQmdjoLAYKhXGrXi7178ly6EjAW9Sc1ijnZ5
         W7tVKdKNePoIrv/G/ZkTz+JOdAXwlxTYvQvkqf1YyBuHCTI6+TJzv+6lWnNBFGJhhjhm
         0P+g==
X-Gm-Message-State: AOJu0YyEY0jH9rnsfUhK4QDyhX4loibTxY24apc2v/id6jyKuvNF7c0E
	ueX9mLGk5twzZ3SzBvt5Q7m35Firwfo4StmEUs1ep0/3BWaY36LvowitBOvYQa1NChDx/+9gG6s
	A4oEyANZdfWIb7YNlP8qoNLryM+g7PvFOsZzxsEaSLysdTnD9Dg5R+AmoDsRyqjrYaVEk
X-Gm-Gg: AY/fxX5yDJFWXvbK/u40igOYUKpJOQjFDpCAxFrZtQ8Cy6EDLaJl1xbBKq1rERSc/a9
	di9SUMnAHkI32AfZWA3ccHCp/KmeSjUPml0kWY+oZDWc5TWZNotK3AdqvjdjZWVlJ5cQEmGtuCi
	43/fvTW9UqGay6YeYikVApPghwt0k0XU2R3tW7JraS3iSsosauIV1eW2hde8p/ZzV/YWHmfVG+c
	/175knZE3gThWAeDqfOd0eAIgxkiYH2+rWLaBU1cwRjx8sbll4bPtJr3DSZo+UX4XahF4AOHuK2
	j3i+7qT4fe/PXKZOYAZTIsuRcmBY07xUBAP9e9RuTnUuskfjeKMqDHsCy/KTnNuc3KmuwpeoUfE
	zTyALxMXZOIpmO5ouB7j3RMvSHE6XzXRlqF58XE6kkILVe5MFmEKX/WdXvmqudhbuQbDDMQqchZ
	exD3wL4ZgOgC6tQ8HbcjK28pE=
X-Received: by 2002:a05:620a:294e:b0:8b2:6eba:c42a with SMTP id af79cd13be357-8c52fbbee3bmr739900085a.61.1768462153289;
        Wed, 14 Jan 2026 23:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:294e:b0:8b2:6eba:c42a with SMTP id af79cd13be357-8c52fbbee3bmr739898485a.61.1768462152871;
        Wed, 14 Jan 2026 23:29:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:06 +0200
Subject: [PATCH v3 1/8] drm/msm/dp: fix HPD state status bit shift value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hzwfWK5+EPLPBOMgkg/4Azem10iuzkilPWoxif3rO60=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlol0OgRxZ1MBFNp0tkki7+qUT/NIE7YGEFzQfNJAcdZ69bi
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpaJdDAAoJEIs8ij4CKSjVhioH/13E
 FHzJE52YmAQhFdyvBSMPAFtSVssioEXr3PXm8t4IcDujo+95BTt4RPx4/7yzj54pddcI/MM1Gq+
 d6nwzkrWyio/F3OYxfwJQKr2tj6D5tMY7NPdi3/LAJYFmjs48i8lee27y5+6MKgcqjSe0LtkwvV
 G6p4AH8Cbrv3hcf2M9trNwSVgAwcxNpWIpD+ejGYV6kYIdig448hT6G4wJR5QW9txrADi8nfk8M
 ABr4khelULaQ57GFxVGGwYyz5iHpcuJQkUtEByILkOVFgnC9otGU7KZ+i7uPDd2Vl/2nez0gPXC
 1POFbvmkzvr/gJMNN2rqQaYba/jgW21luZtkPzY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ChAlPLiKrSIp7MsdrWfUfid9y1-D0UT-
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=69689749 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ChAlPLiKrSIp7MsdrWfUfid9y1-D0UT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX0SzBxtLT+x5k
 cJ4rnK3TQfz6nXB8BGmGpnQtA4aEoI+IK18R0x0kYmjT5BZQ/Pz8Wo4T/BwRb1gfSu+3ODXRyr4
 p6SEijZfQyXhfCiHl+O/qXmCFPmmJgViYsV1K9w//iiMNQ0hcyIRdsdr7XnAQ+DNJrQj6tGeVSS
 9fNm+UuHVR0AmdpiExR960qqedCf7VmAwZ9EFoMjmHHaenB6/63qZYDYfwt3SJFRJvueQAX8p9L
 tfaUlF7rpmXQNHh1cJ6r4lfqEXYWdWyMPdlJ7f/uIVntrGJU7i+FLM0uMMEwKc/RhGHXGvnPIJx
 tIWMQBQpvk5o2T/ZhyZ+PBLerDKDIwywUK+a8zoR9XITsCoJJ7ZlyFwBigy09QuXKxf0EgvZycf
 Ej6NIHtW1IGNIGKjYE1v5dTFuQVM/ubAQdlrDXxyUtImTnkwfKdG35Ix3dqHa6IzR7u4SeAXe9A
 J7InodQc3g/7ogW43Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150049

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3


