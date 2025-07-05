Return-Path: <linux-arm-msm+bounces-63823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE75AFA08E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 16:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D801C217E8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B050F1E3DE5;
	Sat,  5 Jul 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Cck8wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE115A864
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727170; cv=none; b=pH3L34yEhNFaLvpf+BIVxaHDu+eVWH9ACcCaj5WePjGjA5WoAnAcX55+h6C8tYC0VcuwvSbwutRVotiKbB8eIJbT49DkL5qQnv9BuYDROaqzpIQd6MiNbIddGRqgI5AyNtSPzutjO/HQSfbh2LTQcaBTUOJ1XpkKZxeEacbLzB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727170; c=relaxed/simple;
	bh=+OLqFMLQ2E9Yuyqm46u9WWucG9SoqfAIE++hfZHHx98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnO4cSWgLMj7BU9GW5x8zeXosk+JfU+FaeZN/iLY8yee9ynKhhe0/RQFCVQPxVQiuHvsKzdNhmaw+UYLcsOZhbWr3nrfMqOxbQur/XljNrcXLd7piAjfTcvauQiDb1rXnC2RZRxO5L/YGo6+oVcIJdGDTz0ll3dn6bKtGez4DL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0Cck8wt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565AFhqo029880
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO
	9kNt3NIs=; b=N0Cck8wtDc7EnrDCJbHToUUiXO9o792UiS7byJnGVwqTEWCP9+3
	Ma0xf2YeIegYB6D8EUc8+QQhKVtIK54YRoRAxmxLYCmtgDy3HAYokW/HtVqQi9Gj
	iayIZQFEwXzdGsMv5Swh/gKeBcNjnyX3pf9yFPRmoJflMMW6Re+noQ84cEwDURJh
	+36WB4YX2wglhashcF3KLJN4VMgeqOoExc7kd4KmglP6yx3WAB3H6W3nb0AbaTNF
	5kErsDqtUg9g2OpmQjRYnYzHUQw2b6eObBI2IX72ENoVO319ApXK4GdpH3JVzX2T
	hDfqZc8CsatkYVXzCOVJe/ou05yQLE6uzFw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk15aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 14:52:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3184712fd8so1315806a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727167; x=1752331967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO9kNt3NIs=;
        b=GjvE4m7HB8R5vwehsY1ml/ARbMy8vkaokvBqGxPOL32w8QzlmUadg5P4BoILVtCPBz
         AlTRRotjXtfnlYj+SsTb9ss26/KTTSBGcOSEIRORRE4lvhlVABD7n2QB+KQNM9wKBbQ+
         KWINZVERPEnGtqBAl/nVxpSHJZT/mK/ANWSZzgX03B5/e3rWJfZ7SD/uPABiEEHBLzKA
         kxjuXH7QDFfwjzS2iGblq2+Fe6Ag1IVFSUoyLnGg4CqIzKhcHPU5m+iu3BEL9DS6Wpt7
         UuR3vjSSK/EC1gsWN4D7rmw2uFkSnZXpiUA/3YDpkVokCp1yvanFVUDKyw9P2rL5+yCz
         CQVQ==
X-Gm-Message-State: AOJu0YygDHlqr5XP9qy5LugkCHQQTGumoZClVlfea4zFZVXZ86Li9g7M
	w4xRlFHnksEcESYiie60OghcxNp6hli3XT/GAhgkYB+I1FZAXO/z8H0rPry46O9QPO0lvk8WvLO
	3Ltc8cAEaTF2OvCjgCYj9E0e2x2Od/FxF/IOSaRIiemjZZgekVq60hEjkJ+VHIE556lf1
X-Gm-Gg: ASbGnct4tp9yTb4Tg2+V4DeEEPWSqoNbXPUGkZhgJx7ZQCnmN5Mlc0QE/JTOV4olGon
	JH47HLy2RXR2w0AMqnWrg67jmPOm9kk4ONUghmhU96ckdVhLdh2Q43imsrJEiD/Pg/gQFZ1+3iG
	azP0W93RMoNupAD7cFwKGxX8FdBfFOqUkbiV/+7h6tC/2Tfv6A6Te9CqJ0uH/uVx6BSTo/rKRrG
	TfH0HmK2oqMBcMcYhN+S3GImjzh0VewPlV5+Vx8b12pAbQzOiPzuyKZNCJcuYbzjPX4Stm9/ZZS
	8UE6IvfSQa0DrlMlt2bRxLPYw6a4QhQx8w==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id d9443c01a7336-23c85d8feeamr79343385ad.9.1751727167233;
        Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGToGgDP5cFnl805R/32fydbC1Sf0Tg5kRY7KHuPW6KsQIBThC2Hu6p+geYPeaz7rf08KyEeA==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id d9443c01a7336-23c85d8feeamr79343145ad.9.1751727166863;
        Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a527sm43190135ad.26.2025.07.05.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Split gpu/kms cleanups
Date: Sat,  5 Jul 2025 07:52:39 -0700
Message-ID: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX76+xNHqORIn9
 DDylGUUnY4eEBK/XPL/OAARgLW6taVqmuIoAvysBDNcSxRbuGX05P98Y3sz2DWHH3ZfAjhJE5EZ
 ooRrZ3QFeYq3yzGIcG4xCrPCA/p9n3J0FF2psyij7+5nl+y4EIiTF+Q6bu6Y9CSBKwzL3ZzKeOq
 qGxcHB8gVzWjq/9xoSh+vZoIsVxWaMRAkuiq0fcnuk1ZvyN7mSJFdCHzy01/BcMvoCti5wx5CxC
 GFbdV7WjorR+y3WdgvQTT6WNglbhwH59SPY+VDAOpVpfjd2YiUam0pPHQaWEY5l8d4JZwdgQNTC
 PNRFpkSlL63iPMsYk234IxDPq8Rk0Xm6dRq3MvAyUuZ9eIQHKDU4Jy6ZSJomLdJHL1clJxB1jh8
 WEgmiCsNtDqimO+ugZCTh+PP+RA6dCNGTpyMS1DP17nETEgny9z2M0Mvfsp1ZWp2raezbfLR
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68693c40 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xicTdwmnyVa0YEs4s9gA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: r87s8kGUICL4uhm28pWh_d9dudwX07A1
X-Proofpoint-GUID: r87s8kGUICL4uhm28pWh_d9dudwX07A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=897 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097

Applies on top of https://lore.kernel.org/all/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com/

Rob Clark (2):
  drm/msm: Clean up split driver features
  drm/msm: Take the ioctls away from the KMS-only driver

 drivers/gpu/drm/msm/msm_drv.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

-- 
2.50.0


