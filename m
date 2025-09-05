Return-Path: <linux-arm-msm+bounces-72151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62008B44AC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20450586037
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E926B188000;
	Fri,  5 Sep 2025 00:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJ0Gktzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D2156F20
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032722; cv=none; b=iogWiii8Lvjg5Gt+XUNvNDJto7SF2wPHfHiBNYmNoYQUCwcRsOfrT8rkm/QSuy3mX/7+WYh54Za9d4wRYgz0eZ8LCtCdNihjWnDmOynOru6w0W2wxeDwoLDkrtDWmhOLGPGNz1zckO3cKdBBKdrsBfO8jDose6VCM85ua64l14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032722; c=relaxed/simple;
	bh=qW6/eOo9LKWtLOPcjncf4diY+DYlgQ8HDpWPicvkcCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HNV8tQErSs7fXL4X3yY2c36sL1kLgqSk2XCkv0uVpI+uVfPoImrN0YkkSzkA46RUnXVUwkUpoYNNdhDo4w0Kx7ERmr/P1ZyTbHx258UKWLq/yYoinqTmItwwowH8r7ftr6mx2fHBUMHt8+YUnrzagdDyhYTQ92SiC4o9JPCoyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJ0Gktzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HqExf031853
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZQ1S7RqBfWQLYYMNG1n1QH
	bTBVxy2xoCDvsUe2ZNd+8=; b=gJ0GktzcYf4HvI+MGTT4gqAMCiYFFojtqKgU9l
	y25gPSfo9ocuoB/gzNafYTZAKkl406vvvTGawoU5LNIiYrWzOnVnBFk0etWfe6z4
	sHi5jnHZsVh36WkbqroVwAuhDhqzSt+TBhLvSROD1O2lVj2uLmbnEDIl0rMUHkBm
	OO0g6IFgiSea+1ZY/uW8PRLcmP8NKCofbmFAQEL7RzMESdvhFDwXxdIlkf/5iyS4
	f87MVIqYvEYN77qW2fWmAa9PlFxGqHLrulGLoYacbuHP50DrGuVwhbFb1BuKmjBJ
	p3AkeeEr/lVdIydTae/qc5yFyCDO1Rx3pfyuX57wglqj2/ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw09bw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:38:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-80acebb7cb7so369160485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032719; x=1757637519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQ1S7RqBfWQLYYMNG1n1QHbTBVxy2xoCDvsUe2ZNd+8=;
        b=aT0BlVBpXugqLlmlqQcJO+b573/6J4mH6nU7G8d6g4bIAresEOjavGZNLkdLgoAt0I
         mNj0vRTF19KXKXRLT1rRw6yipPmzsRrlvjpR+rrNnv3RobVMaIBgafAtWaz8EvEK+V5j
         /gxLjsGOICAB8g16CQBLSw4sjCh9gzRNbayvH3zEpEaW3YRX1/6RBhfMJ26uj/nMmhQz
         ygGxOh0+2OmZBZ8gSMYdLV62OL016Ic0XAMVJ7Za5WtXlONqbq/ndCMH88DpQPCbFm7P
         gK/gHEa/1QV1zcWKRHO6/OUs1NrUUSlhyCUcT2y0qjvrcWjVQiOVhRjsxK5ESnV0HYuj
         gnlg==
X-Gm-Message-State: AOJu0YwdN2zMqVznjknBy5IT3vPK/jqAxq9AnhkYzbZksjmvps8dMkNA
	AHlpJl9V34BvzYmN/6/QOKMQgapXrAmdRv2Kg5Sf4Y1uMZ5w5DvH5dubP/dLCqp+LFP9qvD6V+l
	uIJXHvzBxcCHXrcs1t59xBJBwz6jwPsoyk7ZbEqNorRYQdrphUtxvxJJMiwgMQQo/npnu
X-Gm-Gg: ASbGnctG7fRK0vmGZZLDMjwcPLe0pnHFO29/iUgGWb1ExN2NbfYoet03/gYNpyXKUwP
	ov2eFf0x08SM3rKGmJv6sjXu9dI/z8mFxGI/Nv5qU8Gpvu2dcKFSQf/4Ye2lOzwSx9Rgdo6rMG5
	DWs0I5s8B2m88ewklAB1waKf3UxlSRlU3EJOthSmGTw/bv0NRDJQI1GDmfSKMKfAw3W+jZwdBt4
	+4rh3/B/WUnB/BMEqqeK1Pti92JHpyLpSC9ixJ5ED7J8tWU3ep2hLJK+qf43Omuk/oD6DDVoikD
	8CphG/qjf+HPL+YiB6nT6+TXkPrAN4zr081fLC7QcVPvB/vBNHXZ3A2c9uOoumgfSEVPUzTG7jV
	6WrsFboaOM7zuu5Mgf/1F2IZiUcMa/ciEJacTKzV6VUuQ06971QCB
X-Received: by 2002:a05:6214:19cc:b0:716:ba73:8b72 with SMTP id 6a1803df08f44-716ba738bf2mr270613986d6.19.1757032719214;
        Thu, 04 Sep 2025 17:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH78jS1CC6gp64q9CeCchmxo9IKoMvJ1QZpZ/tTHVE199OLsf88wLnqSYWQo27SKv7RW7GqeQ==
X-Received: by 2002:a05:6214:19cc:b0:716:ba73:8b72 with SMTP id 6a1803df08f44-716ba738bf2mr270613576d6.19.1757032718742;
        Thu, 04 Sep 2025 17:38:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:38:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/12] drm/msm/dpu: rework format handling code
Date: Fri, 05 Sep 2025 03:38:29 +0300
Message-Id: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUxumgC/22MQQ6CMBBFr0JmbckUIaIr72FYtHQqTSyFDhAN6
 d2trN385P3kvR2YoiOGW7FDpM2xC2OG6lRAP6jxScKZzFBh1eAFG2GmVdgQvVpYoGkU1UYqqa+
 QjSmSde+j9ugyD46XED9HfJO/939nkwJFjRa1Pkvd9u09MJfzql598L7MA11K6Qv9ISfSrQAAA
 A==
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qW6/eOo9LKWtLOPcjncf4diY+DYlgQ8HDpWPicvkcCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEI34ZWt8/uxOCCrSdZPDQoLW0OQwNEl574P
 Bda+7JrzIuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCAAKCRCLPIo+Aiko
 1e3fB/sGKF68MD3l94OTzkHkplbqwsQrimwI8MrePyZDA0gRkuJ0n9rx+IjpmfrO6IfDDzUqKJa
 FAuZpjx9SdSP2qmXlwDXCwww4iSqrnFngy/BEiaY0RvhqeAFN7fY7pgmwBE8Jds1qzVyFexPbzn
 9CoNJ1J8JxNRWaeJ1t7HdF6oqTCH2yqYFkR9U2a4h5LhnNRIHXUtdHFX4wI1EMrb9NOjGphlTxO
 nS+YWShKQ+31Eqw1NDyUxyia5j/P2ewl4dS8WuqM8b0jcIPEmBRjXQb5QIZ53IYHBwxh8Z2/TlK
 U5CP94rpkwYGshLBdhDtsPIZ3EyA4siwQFts1f2UyO5toXTw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tlaCOIDG7hECVQ4SrvdiVTaXWZpKAcHT
X-Proofpoint-ORIG-GUID: tlaCOIDG7hECVQ4SrvdiVTaXWZpKAcHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX7CXHiY9nMeXd
 LfoFcHyeEAHaWm6TpcYdi+5abhpIlmz2EiDp2bOsmaWagr7lA+H7Mo/buSVVWN8hIY6H3kGnVWQ
 UzvpZjo/+zUvm0GBbEb21qJMxeHNqIgraiJkXZwS/nPZ+QvCRYlmZO87DogcaOOcvg7g56O2aM2
 ceKC7BpgRQ1kLvKXtZFO23noOqoNjG3yW/BEXnFoTWxqpJCZCnOHpuhVFxvnZK7rOcgeyMHy1UG
 wPr7fEYn153SHtNCyXBnXjymi8NTR0htleOkr4hLt5X6fZrj5KNhBcGA/34+ZPXEqek5gr3OEmW
 WVbQRV6gKiXoGOWMajefHMxQiknwcQ6E5dTc0AFzaes+DT+F01nrcR3LRhaL8WNybrxYXuSqWI0
 hHkz36kJ
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68ba3110 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ilABv6Z8GYNuw7svrMYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped DX flag from the tiled NV12 format structure (Jessica)
- Changed round_up(foo, 192) to the roundup() as the former one is
  supposed to be used with power of 2 argument (Jessica)
- Fixed undefined varuables warning in
  _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
  condition (LKP)
- Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com

---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  613 +++++++------
 3 files changed, 390 insertions(+), 1552 deletions(-)
---
base-commit: 9be5c47908e669db4934ef9c129b28bbc879a8be
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry


