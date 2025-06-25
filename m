Return-Path: <linux-arm-msm+bounces-62503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270FAE8B95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 696957A33FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85772D3A77;
	Wed, 25 Jun 2025 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgH7mbUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316729B214
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873044; cv=none; b=tBqeRA6ME/wAM6KLrw5Hx+zqkjXQ+VeB7KWJNaleEzkqevP5+21bwDmd3RcgtDTh5Qhu3hHQ+27SLOZIICRJOEM1atVjJrvYEsEqzoaYRgRSMLAaVhN/n8A03y8GNsEsR8wyIV+cUwDGoMsUQbHInYdzST8SohMGEEI2ncDhIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873044; c=relaxed/simple;
	bh=GaZeC3b19Lss9cuHmvYQt3eAyVG70HYyhb4xdv8u7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCloiWIEN/Lnjo3IWm0LigWVI5Y8Xkh/awazUzTD529GgjeWlK2YDMQCiUK/dOp6ABhvnV2WtplygDbQ6BTESGn4PCSNYkkq2gKbwAFDuMALUa1O/8zL+XPmWcB1YN04vH7tsp60TNIQTEtsd6AhvIeGUQOP1jQaSkJjfa9zjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgH7mbUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBLheu006109
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
	uErvpeQ4=; b=MgH7mbUOHHW/lCffajxpilJA4qxUyYlkCLaUuiZVb8aCA7+T6Fk
	ApFjTacpyfNDUEkCVTD/RUY17c+GfU+k71KWianbgGvyPooE5tUO88cXmtk6iUwP
	EhMnT9aFRyMss5zu8jaJaIlhKEgnCs/MLtK3Rgxy7R9lCa5HhtSpdfOf1kHkrJXY
	rrhTb879sZiDhCLQ5bOpdHRFBytz0o7HdwNa3/oPQAY4pEcscwtg6oI579IWj+up
	lHLYXhcHezStN9vNbPXXe5rwgCXHgYhNbrfaEaKCRQh2TqW+xpnDGZTC45CUK02x
	rOSInZa4dzgzWZfqmAtAS3p3W5WQ3G6DZVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggs27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3122368d82bso102723a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873039; x=1751477839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
        b=vVDIFGIia5qBBv1lgXhl3dTcHHmhGSoTWkNObXnOa2W+BPdR9AGl407UEl57t2h6rO
         vBrTz48f9IxWe6eWRohD9VQ0sWRtezGkbgWrXQXL7yh4S+95uhv6zBXtW552FinoCL6V
         Id96IycQodPfm5tccRRoSx/ZjeC9kLCGns3/oJ7vK7ZyR//QRBcEBxzD+8bi0y0VJHZ8
         0y2LbsWMrENziDfXoFaU+SmdZditXf2h35rbX1E7ZF7x7FIx/OG7KxawvAusFEpXJ+tz
         yGmDyZ9KQgUOjUADDjK/njoIdieUMdz9BjgvrVIfswtUQDNQjh9RrEd2R/vHk7MhEHLQ
         ZvIA==
X-Forwarded-Encrypted: i=1; AJvYcCXsfQxIgfWNZNgbmsdBQPWoPHrESHrr1Ve9atx/k+VTKtMltB/82qDuVJ2D/Z/mFKVlDQxSZLctwRgVUcCl@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3UWy8DOqjp2m1QXi3V3gxLmOfRCGDs59J4GGEF4wQLyaziKU
	CVNC0jLU3b7Ej8/Yw72kfnSWXER4uxqgdbcv0Nvs1w4bCzuH7qdQxzc4GqM25JR0LAHV3RpZx3r
	O1ATKMJlc88XJOQh+XGBGSIVITMRv1Xp7B2s+ZTNSFWyOKtDEBtMrrh8KGE9JXEYV3NjT
X-Gm-Gg: ASbGncvbx00Ri+AgPXBo7wEnhOrD4Fn+KIoH6W1NIlR6WuYhSHMgOWnIjWIyMDE77tk
	sbaL0ExTHrIgL0n/YBebzQoAdIJhwLHadoxRpRqSBEbMicm2Xr/hdnGH4cJhK1Q03snELRSR57i
	hcdngokW8ttXwUlFoVcWW/Cujg4UTnMd9t1ZFfD20PVgm/sK3GFydrw1B+tLBQXVGbgKvsSgcpO
	uFVBnn35IInLWYqJJCcvi4V4fUdktmuFULK/OnB1h9GLztzuULQepmNjUVe8+WrzynHL+6OSwoS
	VqJEnyO6QQVcAMox+qSepe+YK2xOyroz
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-315f268d07fmr5817789a91.27.1750873039541;
        Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMKQs3mspG8y9JNMpqoIf2y+cWR9YznGJpkP1ouykLoRzvg0upnUv8nTz+gS2rxDvr0WltPg==
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-315f268d07fmr5817746a91.27.1750873039081;
        Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53d9098sm2219224a91.31.2025.06.25.10.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:37:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Wed, 25 Jun 2025 10:37:09 -0700
Message-ID: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fEko2J4YJSo4KxloiLKbjS6_VlpVVWUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX2zzJc3SB/46l
 /U1aAEmgB9/QL7ShnGFktRT9BJY+woe3cEyzhpcWZpAXw2UyHTdmg6eKJ6GN2QpChluYJ7Qmah1
 oa3pEIerGQRF/vfd7cu04dCDG282TIAs7Rd9FzxIoCxS5/lFuJq6rpDNuzj9u/ifrVvtqfoJhkB
 2MsBhA+TvtzJmtU/MH2ZZa8RhqAS1fScWZ3MVDgWeQo1aTeoGn2LVqp22bN18QRLgzb9Gd5tfwG
 1csF4LICK08ZGleSDwf1NYWV182fjSKISmyf/GOuYSjeD7Q9xT7bYp88KjwJJmk7WYkvprOxBfC
 lv6ZqlNy5Vi0qjoFpwvqA9NwQIgfHWyxQLd4vkmOaKaXZL5M8H/vvasVmrxZ7Jr/VH1mdsl6Z9V
 VwLYxAVr4lOpOEyBrwgcXmMgryUBg9QNhUClxxY0Rgj42g2fLFOGFl+0jxX5cP+y1/dNeMcz
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c33d0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: fEko2J4YJSo4KxloiLKbjS6_VlpVVWUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=996 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0


