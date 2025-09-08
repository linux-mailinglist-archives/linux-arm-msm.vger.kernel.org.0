Return-Path: <linux-arm-msm+bounces-72639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF5B499EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B366C1899537
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739CA28D83D;
	Mon,  8 Sep 2025 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bD2KKydy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01C28C840
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359832; cv=none; b=GttzF/tx40Te/uzeo/zU28fnEw9hkCzV9YYwNMIzNf6Ph6lWecVcxANbu6NCXJ/yPE0Vq8VauxUTp3Ldg+p8gu71y+2n7DERB1zV/zsQnWfG5OtjhL68U35uabmE27N1e70yb3jP7ziRe8iafkXjMYK5yCoV/r9CvGrhJypznBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359832; c=relaxed/simple;
	bh=1WFJr7YQvbq8VNUx6ycrIGIPBwbXuM0dZ15JKqwlK3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DkQ90M7v0mO3WZ3SWtRF3g3FfCzXbvhXNKpZL3wH/eGK0ABSE9K1Z5Pg0E05xR7TSCskeeKDS4s8sJSK/UiuSIQ5YFTqKrvJGsZuI7jvahfmfROUlhZ9FO2XbS0EGGqETP2rQhyB/DntBtHsEwniLOwLUyY8vIj/iTs4x4VH1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bD2KKydy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GEiNI031748
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DBYI1s0Kwcsc+/IUwfNSLMfLO+qO59pSIyk
	O91Hb1MA=; b=bD2KKydy0P6KX/3DNWpba6zELRUdSd7WvClpkUSAmJg/sT/0d2i
	9SUxhFAcksIG1o93lwlbVwxNU/SX0CGDd1i6WRmeWeNLfpS354JjMFQGuC6ejBsV
	+oa2NbkvX6kFWWuGP0D533F9pRyF+BDAfok9iOZC5FcCqWO39hKamZiauFBaXrzW
	uJ8YKwkignKXrthfIcRiL3Zg8Qi9fHDZioVsr5NNx9rI3cv310b5z35f+FU8QE55
	0dR2jLA4Xnstm1ECuMMdxyU7rH0uOFFNzKQrOVoM3BVhst70cSVnHqFO3p++lbwo
	AIO6GxSrH0yuWSmmfXN8g23cQ2C501arY+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a5n1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:30:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244570600a1so60580375ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757359829; x=1757964629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBYI1s0Kwcsc+/IUwfNSLMfLO+qO59pSIykO91Hb1MA=;
        b=gF0Beq56MBhg9FzplRWfFijU03YyKbNAgCOdLH9jN/tA0wiC28RIvss4uQk4l4vfn3
         p/eQ9VNAMVN+LBgIJH68EUaauLR1j5msviWSClEXBIPA1B2k5gl/FrnaQq79nnor2rTb
         gYiCJtqSZc1UyL15xhzVRvzbJ2W0+s4HOALqaueehPKXNfBbDibmAxY2hD3WZGaapFTa
         0mqUSAr9wEDrHNPbYWwTCko/VC2BnU8S0L/ETYf/xLuoycOjKkj/m0aqgHNe2mHvnUpn
         6f19eegXUK7vgYfalbNKuv3A/yTXlS6nRsqNyWzoOtCQNXJ6ZwcKJO478sa9CnGLiXoW
         Jhqw==
X-Forwarded-Encrypted: i=1; AJvYcCUSBLydfN8fvQCdXg6dJFFPeyDGjtNqGcYeJRWhaH+MaFpjVuDirVQ87OU8t/INmUp1wIToutlATDRFmOCJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6y1JeSkwk1zsisQDu1upsRlDeIfhiYm/bftLMFDI89JB29wQ
	SwNbnLtmnk2yH50yk4esc6Z0N8iHCsa205XvqhNILgRnpsYQHhecMFvdIg0wzguFMdD17XyQ8Iv
	7rk6WRgT2JWWGc4MhHQCLu7tnpDhusLzdxVU7nebgYhW8ilTBuxKzs5wE9HZG19SWFOJ/
X-Gm-Gg: ASbGncsWAZs2uCMXUiz8wYhmnBWgbgpMjvxwY4PDOfNweFBG6ATMlx6nOBiFqVG7TW7
	AE9KjyqOw//wTwr7ITilqqzqSoIW8j5vIxH/P4e1tR6Spxo56hGb3e+gFl/3nbVjesWam4vK3rT
	gS6D6GKGgg7CrjeiAqpWmvZu/MtCkj3tzZPc1OJiH5g83MbFjgrWrzw6v/IawS6JhvdqiLUxtLQ
	EOYVcK2uZ3HLWLoiXHBjK/bIRv2Gl3yWiKAViUB5pUUJtCpM4UikBEnacfKLRgGps3wQp/+IB2E
	WHtzhySsvvMg63QwkFfyyWhi+nL1kIXviVz6UJ8y45Nh+7MSZJ4=
X-Received: by 2002:a17:902:d58a:b0:24b:270e:56d4 with SMTP id d9443c01a7336-2517427c78amr113285355ad.4.1757359829210;
        Mon, 08 Sep 2025 12:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Ni+T7orgU9Tutacd+01JeovMGTrJRiaBNcvzJAbWLaTKOdvcEbz6Jlp0yDTmRpvFr6mVXg==
X-Received: by 2002:a17:902:d58a:b0:24b:270e:56d4 with SMTP id d9443c01a7336-2517427c78amr113285065ad.4.1757359828730;
        Mon, 08 Sep 2025 12:30:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24caffd7beesm136191685ad.121.2025.09.08.12.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:30:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/5] drm/msm/registers: gen_header.py and regs sync
Date: Mon,  8 Sep 2025 12:30:03 -0700
Message-ID: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bf2ed6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=E6oEVHbn0fKM42HpNhsA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 8PywLfEBSRbcmcpO3fuMDvMBV2UdCy6d
X-Proofpoint-ORIG-GUID: 8PywLfEBSRbcmcpO3fuMDvMBV2UdCy6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX99Yf1oiTnye1
 9s3RgjFN9v7rk8oQ3p/GPOSKCeIlh1GfT62uJXfBXFIyx8R9ciN33zU1LktbZcyM76b3m/OQDsm
 n/XLSPL0hY1HjjQI3l6FOUXoOsvibdvjuWR16PqVU+u0w0qI/XMKa/yEI+8+VpAILw+vd8NNDU5
 GJR8x7Jiaixa0zxlE0cQbKmJKZZFvn8SUYMlp6ZTGsoQ2C7Cd8PTuzgqnBZvDDR3qWXX+ldV0ge
 pWwXmbcjVpfXuA7kMt9WqRYbfv8ZLAYrIa5tDQhrqkvVHZs0Wh88lsPqaDz6smpig0YTcm1M1p+
 OPQS7oLlNXGQG4/PeQFfcxUyOtfOP7CD7TbW48TZf3LzGgnSe+m9iA1yHvma47hsX7JmxKJHMcn
 7NEYew8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

Now that https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37216
has synced kernel side changes back to mesa, this completes the round
trip by syncing mesa side changes back to the kernel.

Rob Clark (5):
  drm/msm/registers: Remove license/etc from generated headers
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE an array
  drm/msm/registers: Generate _HI/LO builders for reg64
  drm/msm/registers: Sync GPU registers from mesa

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  18 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   4 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
 .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
 .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
 .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
 drivers/gpu/drm/msm/registers/gen_header.py   | 201 ++---
 8 files changed, 639 insertions(+), 581 deletions(-)

-- 
2.51.0


