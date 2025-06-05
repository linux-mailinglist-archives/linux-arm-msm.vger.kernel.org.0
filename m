Return-Path: <linux-arm-msm+bounces-60412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D348ACF741
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA813AF6A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC25289E35;
	Thu,  5 Jun 2025 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXA9Wbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83B27F165
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148439; cv=none; b=aGUuP77h8hCffkLkhGGLHEeBZxrBAytnL6iQVjeDzvc7SaZmExUF9uNSFf4NBHvA4gLAkjNDT94gFewlSivxDtgXqgHXwLEwHZBSUcnaNxhTlrtQDXutzuabn7RObXR/6H+z/CQYwR2icQsI18+feBqNtxc7rj+KF3fIJW45MVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148439; c=relaxed/simple;
	bh=Yc9/xrKw3NesAc8iIakavO1+bxkLrBo6rWFNSTz0mhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6Z7oCone7HI9AwTtNl9qL5yUMlKjusJEX3astux45+dbh5pXRRhat3GtoI25k8ySbE55qe5ZXYB8lO149XkINN9dSWrxtt2YxzlQcFRvRf5bD7s1TBk+1toX7sm9ULHIgyi4KVfDmbc5KT8Ay3/fMc79YGvt4zizEXk6MTOuSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceXA9Wbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559JsZI028418
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
	O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=ceXA9WbuldePiP1fwN6+udy+e1k
	zqyUbAgBYusWJWfHYY4kfFm/K0aawt/sYiW1G8BSm2EE0nTADmh60oO7FVz0vQMR
	z/tF0PAbx7foEOk99mZtnt4zHGmpblk0em+WjnIKT6Zc74UFxpG3rXjmBWPpsLZE
	W60X/0laxlF+KYplboT16JvyXU6EAApu3SPYzU3f/43CDr7TSQa/eWApHT3uV6fW
	5EJmuRZ+J6pX9bLeQfeEhhs920qfkyS777SN2amt0KYFv2EUYfo+vpzzESp/BGB9
	hQfgixpIwqPw9LEG+Q7YY4/Hxkf6xl5cdU4uRviMZgtv+uUqIFgr3mh2o2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wg0ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742a091d290so996817b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148402; x=1749753202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
        b=az8kQcmWOiil/IogpG8nuQYJeNL8VAfk4V8K8iDLieLQBmFrsYh54fmigKXhaCaCnS
         PlK5LmpTAvT8yknCjq3xmuWod1je22/mee1fBl7WdRigxvZRx+O9p2hopvEqOE5YUQYH
         RqzRkYBYd186kGh80R5N2ZjXWMWUe1pXPFV1Iz6JuWEGjJ1mQjKWTY8+5S6aXrmRXyjk
         Bw4mbOI4TEv5NEhVTY5+iOQ0gzEQqs2rTfkh/qw9A4RHV2fJeqq/EyyXA7tqELFj/TlE
         HHvEc3zckrZbtpjlFZydBoS2INgVn7hS/sFZAhtgO4jXmV7ymEohFgyqQt1dFPzuWHuN
         96yg==
X-Forwarded-Encrypted: i=1; AJvYcCWYCiVNs12vtLnR33kQeU1G7ZlQOyDd3lmukCznd99oztCH/w7pQuLmGqK184Z+dXS/lgjEPIFB/kYul+6c@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHIPvXdXSTYojGuaiwGNeCEPsDkIt32tlpOv2JwM/5fVg8Qwr
	iv6ILbKyrZz695C9Yo2QlvBZb3kDoXLpFZAbjqwlKHdyBFQvsEWe9ySw5B4E8hqHKR4ebQOIr4H
	3LLyyBo2YDRUhjWGxfQarUlDq4RSJ46ppLA9SMT48iK8e+UDmbtRMmTvhfJ0t8qjxo8NBAkCaEd
	3a
X-Gm-Gg: ASbGncsJXrDcmryqhE1it8rBV24TOrRDMcIp94uxkwZ57Mz8IQta848lyXlYEcxH/Dn
	dk1ZmWOtGvvFXBVRk7gY4/gUe/WBf8ejV3BmWfPrdIJ2xtOV/pvHrQLYhmbOHFFXlKCJptCx9Yn
	8IprZ4NI0KcmnR/S/jje8Suj5W1AbETetG0OQjFEMEiD+79/smU6ECkzNEXBwxWHZ1W+umfURhD
	fAIB1IjdPOLXfqYHG7Bjj+Y2ecwa00ABNqp+obPwKw9v7GH4bMsqruBa/8945ahz/D3tzlBvAOD
	ZpNgKAip08rRaBlmEJEXvw==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-74827e80628mr887813b3a.10.1749148402076;
        Thu, 05 Jun 2025 11:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBuTKC6/naA3f/kWh7qz2oby28B2fruyWvYz+LKZRKvKVwuNe4K9bJXRX956fiwilQlAHacg==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-74827e80628mr887775b3a.10.1749148401687;
        Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeaba2esm13094969b3a.49.2025.06.05.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 38/40] drm/msm: Bump UAPI version
Date: Thu,  5 Jun 2025 11:29:23 -0700
Message-ID: <20250605183111.163594-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0qywwC3eKaT0ZZyxIWMYGIYWnopPdXIo
X-Proofpoint-GUID: 0qywwC3eKaT0ZZyxIWMYGIYWnopPdXIo
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6841e313 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfXw6+CJkZK0liA
 EAXjEd4zBmJG4H4ARYWkcOxwgJOXPR4RUoDHxK1v5mPF2P3r8k9OWyNoATL+iCyPEftpMMke5wE
 1kLu0aeL5TdnIOtguyhG3Zg+rgZABXqhATPVHRWOIg1PFuLuho5NndeJdLUD787WDggctI4W3if
 uEsdG9r6PmR9Wqj/H0eyxoXc5gMYnGuNQzI3eCENYOImjpmmG/mOXXCgqieMrRoqwMnB+h7nPYz
 lbHFWIINMOB1ACfWqYu2YFascoI+w8o6TKq2D58+UIcrviFLFxU+lOdo3eVIGcZr9TrDazm03Yi
 euvqm4liVgHIvT4uyyOXjsLKnkHb5FsU520US/rCjPnD89voadHgckoeJXFeJIJwh5CYgU8TsY2
 oaFCgL9VEA1R82w1rHy8QeWp44YZCMxOvZm8t2oZ9sW1NFmqCtyIaWzGPfd315d7ULWbPQyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0


