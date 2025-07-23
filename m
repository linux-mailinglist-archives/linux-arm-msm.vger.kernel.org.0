Return-Path: <linux-arm-msm+bounces-66352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D55B0FB7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE1F1887DD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 20:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31523235045;
	Wed, 23 Jul 2025 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWRprqyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D4C233155
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753302515; cv=none; b=LYpihfaCG+kDRTmny6TXeBXOO5d3ATDquwhvIH53Gh3eSxxGeOwKbMEV2vHiryYpVyB3J1vbO6FEggpE7pBhLWetX17eIpSkbEOlJQqYJqVkb/VpySpzWGlIoSGxjm1BMh4XW7F1N0n8FjO7D2jkq/bFll+QEofCiuH4pXwadxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753302515; c=relaxed/simple;
	bh=PdFs9Ar+XFr5veBMSdS8XtU2Y2/xk3F20fQwPwQyMYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOBE+m6BW+8gYG+xiVUADATSJPQiO54/PAIUEXEwChp9cugLkufIjRae2A9WMRPWQdRHyG6lWmFpaiJcH05mFtfWFdhB+73ZvGqoh7YkZaJTlRGiN5L7iDA+zZqVWOHEcujJ4HxXyffrjblJGZGxA6gbFJS0QDxy1bTMzeedWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWRprqyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHLrQV007873
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fQlGpsNQCbK1gjPImdLDa8PKdhHdOTCgiKm
	ZdGjhm48=; b=lWRprqykiY3dNoJHCUDUIwgJjbf1PQBoUiRCpySgHHpmhBXAiLq
	nEUHtjsHFTqhcG17+u03DD89DwkcL6OBRQW9qQTzf4Fc4f709XF7nCC1CHWFkn4e
	432y9D52/PQ9zHewR9SrYaJXwKuJIWtazzjK8HjyeaYl7ZE1cqwouS0hrHjcbBtT
	TYIOirFTwKWnCXrAgGKYFCR3ZAg22mt/X/e3M4C3z1mt+FdrhkFsVGG9ZUAYf5VW
	b99JQeqzPRYxXvOFieUhbR+/Wzg3cViQwhB8ulU0H+coEqLERF28n1HkzpvhTuEP
	c9TmQ9VFHKTTfIqtugwNQW+39zKou0BI6Xg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qefh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31220ecc586so211783a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753302511; x=1753907311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQlGpsNQCbK1gjPImdLDa8PKdhHdOTCgiKmZdGjhm48=;
        b=wtIxNhM8tSbtX+uk+s3E0tn2srZg4LWpG1kpXtG6LUlKsO8PEulrbz+xg0oQR+OycI
         1YBhVHRhjoHhstMRr21LwMNH0tsDrmDRL2QtJ/yUJYoI6cg/zwE+UomMcbqVlmlwf/DO
         8Ex8hr/JP/5D3NiOyhRUc4tfL67RtCU7DyCIQJoyFMLpe2fHySErL/CFhlp5gUrZEona
         DepRk01uWYDZ87fnwN8tbeFEiQ5BbCKDXhfUhcpOEQDHGhFY5LojvGPuH/BaclcfKcqF
         6NG5WDRyxrhZl8BfA44XSZlfeugGURgARlWapx8uwxY4VJZU/b1mAlSg46romHh4Xna9
         X+bA==
X-Gm-Message-State: AOJu0YzQDk6W/Dx0o6wbpNJ0ZYLyAOb0f75OpViQlMeYUUhie75jXM3f
	alY/sc7C9bLEmikAod8eOIpnkaf8dV5u6AYz+kgp6wrXnHg50LOZK89HeNf7bp1RsLyI32Dd6y2
	nsDQFPpJGdtdhyAV/0TYIo9tzWmgGvEofMxN2qj/8SVNRwtpppGFiAQB6XCpwM0OIDInQ
X-Gm-Gg: ASbGnct54z8gBas65YBxpKHm3kIXkgTKaxB2cYHl0zw+lRpSyZ22tejvM8MOhAqiE69
	NbWLzPvIE7LmAMMheiGLes8XwhbyUrx3D8d+GDsAGAkQq4ttpVOGq72VbNetsfvXNp4sJ6SIsIy
	FGFH3XzXQrlhG6ycvqHUVSvhYGDrkt1UlaS9YbqbJMt/28SXwn2RY0J0NBiYZqlHeNQ9NNxrM1r
	RTMYwCGyoD0petB7fhijbKd8I/aedApUC0OGc1uRPuHBmLprfXfbGi5ogD5fR6skJx5vDSTCrPz
	1V4RZ08dlIvyibp2JYJVYf80luvB5RbYtBrjoohrUMAlhHD/EUg=
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-31e506ef502mr5027768a91.5.1753302510561;
        Wed, 23 Jul 2025 13:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY+35JICM9OLufVbYH7sIKIs/Pmj3SRnQsimqXzP4nhKSKMC/sT77ExrMVchp76VtVysP5aQ==
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-31e506ef502mr5027735a91.5.1753302509999;
        Wed, 23 Jul 2025 13:28:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e51b93862sm2307868a91.34.2025.07.23.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 13:28:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Defer fd_install()
Date: Wed, 23 Jul 2025 13:28:21 -0700
Message-ID: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NCBTYWx0ZWRfX8pUeF+vCOmGM
 a2156ngvxB9A7jubWd4Ee+oNKcyn+Q4UpYdtDOm4FEA5c4MF4BR+/fo+4i4B8xxnCg9OgN2qjof
 ee78IzV/jU1LLaFnSuAy60YDEIWerTqVEVO+W1aU9BISRGo7Dv7E8xE0OP+XNaH/DOYI+pRIkXa
 LI0xS1a0522V3EGcIRbKdncLlZMlDB0PE6KCuHzjPMIMswirTstSWQ7of0m/VgEDQaoIsoST1u1
 4Kv1/BgzHUmh5bsmw0zMA0Qqj2ijiS7o7ufGIxZ4zPxUR5kEJq6YncDLVjLtG7w3PR/qQnyaD9x
 oXUeXlrIlxqmP2YOY0p/69WXjm7QC3k4R68+M9A/zx+WgTcbn2LgNQwoVr/M0Up6QKuJw3pkpYq
 5MGwn39PxO2hi9mJcQifAxLyIWMM2gJZbwQAJX25xT9ODrxALQgkR18mhpN+UaWY0DqOlyZj
X-Proofpoint-ORIG-GUID: pCimo24xJY0nSnf30XfWraMPoeMKEiRk
X-Proofpoint-GUID: pCimo24xJY0nSnf30XfWraMPoeMKEiRk
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688145ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=jOvuQKYuLspqWEp0sh4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230174

The first patch fixes an issue that Dan Carpenter reported in
https://lore.kernel.org/all/55953f27-0762-4ef2-8dda-3208b34a5c75@sabinyo.mountain/
and the second fixes the same issue in the more recently introduced
VM_BIND ioctl.

Rob Clark (2):
  drm/msm: Defer fd_install in SUBMIT ioctl
  drm/msm: Defer fd_install in VM_BIND ioctl

 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++-------
 drivers/gpu/drm/msm/msm_gem_vma.c    | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.50.1


