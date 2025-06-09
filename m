Return-Path: <linux-arm-msm+bounces-60676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3DAD258A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E866516D559
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E3521D3F4;
	Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4EfG6uN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51C18DB34
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493488; cv=none; b=TZJKUK/W2R4S9dxBe2zotf0FPUEYgDr+qjHQuhKXEdaarYDJzJZLX3s5XSHWb9lnR23ub4Qx2OLS+sWnZftAlBaJOU4kw73gSPEcbbQ0shC2+HFXQyhOgOyj/8jkI8hLI8Oerc+SP66vBEacQLRbn/iy6Z8uaDhy/jrIN4wGU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493488; c=relaxed/simple;
	bh=d6cdoCj31eUk5F3VCUY2T8KQ/6Vk+ixc0GLCsL0N170=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJ1aI16s7CUnh3+/T7Fvdmx+fyDDLlxk1j5xhP2ET/6oyZ3dhGAd9AKx/94tYshxkMaXX0GWIFvN9VNMf92Qo/wBxhgbKqGAUjw8N9hFdDVoobt72Ihwxaozu6kyqdBYQvUMEFaV/8PAUqyAeblN8JfWB1tkG2MWW1hEeplKmqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4EfG6uN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559AFYw1009358
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqS
	HdRSlSds=; b=m4EfG6uNLOS3in7c9iB3D9yYaSBHOYE1bNwECfdGZ9rDht/MgGa
	BubiCZDzL3eHEL3wp40+CVWshA+T6MPwauhU1o89c2Aav+SmAb+vV7v2QjGi0kQq
	hbZF2muokddtS+Yt+YBQCymPWgUKnt5Q1YQ+3cvEufdgUSG+xwIBkfbroo7UGZQE
	AsJFQGIqNAaHl7GvgibvzHhnv3hPXPUhd4VZKoDDqDOMyAZWt5MgfiYuSbu7+jyy
	jXB0TUgxxPZoZaA7cAmfUbcMmTYaa5R1IV17OxOgdWADH35bL0glScLXihZP744+
	dS7aNzzfmsxgXSBqjk0L5/AR1geg9r0s/zQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9q1pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:24:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so2798226a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493483; x=1750098283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqSHdRSlSds=;
        b=tcvOuG5v2lhW9EWD71O6+Wp2wR2j8jNlb+mzZy0FcaFjSsCzsGS1HjntSCgF/Nx9nO
         W1AzGNRZuC6RA7r7qmWlX0A2vosmQb+U+MgDMjG2zuwo6l2eKK9ACEkK3u5GzFtXYKH6
         WkPBaeXRoPFi1P7/le62wAwT5Oq5kXgaen3QiZt2lgxhma3SjkC5MJZz7t4rlYsHFNSl
         Q+wplWbG+M1XWdcRyyOOWdLwE5F+FUBeqXqGmUf7WY9dG7HJzGjgLPd+DCzgPz8LRp4Y
         KRBS0mhoP+aEtQAaU5EUwSEuqGgTuy93dQvzgiMGWvqBczsEcrYzDKAgf8J4NpfxiI15
         xwUw==
X-Gm-Message-State: AOJu0YxxJh7agYlAGTC/5DQ3UFcZNa4dwOsrpnDhS45iOuhUxUZ079hu
	J8Verzuh0oKKXVDwm2disU+M7RW8VupFp1zSuAgSh8QQTYTsluW5i0s0vwOlRcIMmjxJfeXP83A
	9RnugzB6hMCEahZS+05+qSj7eoa2h5J5Xtp8BSFBM0mjJ1G5xG5BE1HbHzzy+hS+yJJmE
X-Gm-Gg: ASbGncsHRrZ4crEWrV5Gu3l/rRcnbbcyieuKlgxJVSQ0F7ewV3nUOZ5qzyQ/Gl30vCR
	UfbCk6H75CuFfUac0HzLXqIWDt7ofa05EDQnUNIM3GTRQWTVnnRkSmIG29gf/8dx613sxCpEdF+
	S4oFlr3aKI/EBgTSu1C0HgDRI3p9vT0ZXOwhVxMsLg1pbCP581y5JaPQ1/HKjJR7PL05RTUBgrO
	rZJH2CFWeYe6Y9fGQShKpNI0068l/CbwKiU2WPqaUy3hsY8SMvjMEUCzPPCYlocxfEhn1+WUhYE
	Qf161lL2oDGUttFPJUPtiDf+LPODXDBl
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-313472eb25cmr23479194a91.14.1749493482784;
        Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAvo/tjXFuiSwnF2ZVZMq2U5wnwRopkRd0199rUIbodRRW1lfymiGSTQN+R3i5xVj07EsO2g==
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-313472eb25cmr23479155a91.14.1749493482379;
        Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092640sm57210175ad.54.2025.06.09.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
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
Subject: [PATCH v2 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 11:24:34 -0700
Message-ID: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bM5USd9-mPMw7-x8CW2dsFWvXgB-NQCT
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=684726ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bM5USd9-mPMw7-x8CW2dsFWvXgB-NQCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX3GDENUQwe1cW
 ORRYFaIPnT0dFDhtX3y/rXPrT0gXNFNMoap8QRnFFYJPEQfKL5LkywDd51gm+DmmEOtUEdeC+RF
 nh7KWEdLVArVste2+55MDv+QmE69sbST9JP1Yu4YnRMG36XIw89DsuNj6J2h1for9S6UvI1s2H7
 M6mW7sUX33z0wViWuGv9nvAYFOO0eR360t36YH3jTdTkFOOybcbDRjkipUswr9Jec3f5SRcSG6T
 DWw0ehdsYty3+G8A25OmhGPfnA2nX/iQ2ZMTxEc0BMLNM1zLoSaLtanUEQh1qdmN6LeleJFa06W
 1F2XxzkKMIJ/nUBGs4Yb7/eOYwbM6FDPhME3y4MKzObqhMML9FlQ0/rZUrEVZnMlb/tQuFd4YMV
 EDs+LLMgDduKIqf5cqjUh+MvB5BC++A4+gSt+OEzRetZizsRoX9gjNJsUs9W9lLZHz/8fx4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=703 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090140

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

v2: use %pOF [Dmitry]

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


