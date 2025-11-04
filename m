Return-Path: <linux-arm-msm+bounces-80356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D5C33207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B74418C234C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C017220F37;
	Tue,  4 Nov 2025 22:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMqgrX31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrZwHjGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AC34D3AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762293779; cv=none; b=c1HzzE/XmikGuGfUdPH9aXEeDj9z/VYh5FCTyRHZDczg49dDG9sazjDP7qFhqsAOmuenA2Y18XwnFr+QLSOv9gwfFPVt0D5mvq6lxoGbQjTUcW/FJoW9rG7+ogSGhMeYZLFQ0qNuuo9EAhXBN7EHWyeDkHRyxLL1xVFDx2Lo5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762293779; c=relaxed/simple;
	bh=R6DWXIQtTgOVqyqFGntHzJ6y2K58e9q9hULx6A0wDQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGGNDjwbF+l7Cg1VRIsRDVZ2kzP2H93QhwlQkjpFak3nx49tQPIl4QmiXTOb4kuS1+s8FS9gAaN0DYLs0bRORy/k994QQfKEnlK9Uh+WQKH3JeH0+/x1djoprK023MwLZIzqCcoq7ayjCqr4I5rnyaiJ5tvdDVI0Epr5Eh9xoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMqgrX31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrZwHjGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfrlS2978831
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 22:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3
	SVmsTbes=; b=VMqgrX31AcZ6G8tskHhtcPsAKSqJb1QDPVri5FJT2oZ3JJZ1uGU
	romt4jBtJVRYRcXUU6hg/t4Wb7VVd2m2gXkP/GiYFJNzF8kM2Z3f2Cgn6xJgd16q
	PBwMUhJnvr91WMjQ1frIYeuq3D+qvxa+PzKbKiOqFSzxDrqzbFy0wB1SmZBPriPW
	+6nIIQTErlFKzjiFvwSeKFTC/+nu66nqh1M1aNHGygavkn0eeImd3WQeY4XoAbi4
	oGyQtxW72vAnuLjDRf2R5ciLXIFYYPIpfH0W4SJ/d8Jk9TDMH0JpS9yyzgzAB8NQ
	QAOJEyZm8j64Ywq5+Ck00vkTtbpPrBDr6Gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjsp5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 22:02:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295fbc7d4abso13365755ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762293776; x=1762898576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3SVmsTbes=;
        b=LrZwHjGDvx2I9inBA/A7gTW9OoUCQDzNr179R3aiDW69wOUyvBTlxCl1JFLMIxH4Qb
         UDHRjYfdLXJp9fBUhhrdeVrnHwtdRx1pB+WQkXMf1zdeN344+En0xtoHjQ9RduCMLlxo
         wnbIqfhtWhVkIsUbE4/wMZwqOlzpNoqgVzjN3ieCx4IJ+qVWhzBJDke2LgYuLC1MYBj9
         ZhXuB9E4Z4JgoLdJYJwk6QDlXstzlPG/0kUooeEcppnElPFUXSEO+MhCNvyfzd+cKdi/
         qWhwGu7a+fNJm5SI9AfrJ+LUEmtERxdq9WkoQi+mz5hv8VcJRWKKyvoYK4mc20BdlF9b
         SZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762293776; x=1762898576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3SVmsTbes=;
        b=GoDUaiOdmdPaQka0wgYRE6CnOnwu9b8T3O/yLw1YtVRXL8nyRe+WNk3/I/AY7xfNQ9
         5f9k1LXGdnJaFgCQjv6Ttxa4cRZSpOraKMq+CyoM6gW3h9ZhaRhvKt9iOGUaNXGVF6rt
         vTerOeLodA3UqqisUO4nXVrr0khGl2Q7Dq9hcxq67RdMUtnJ4f+mzPcYGfDT9ITCPzaJ
         qv3acvrogS1VyEL7caKbghprDHi3aun6oYPs4QXUisyGhqlbUZJ0pjPpfkFRt6xJZA+f
         JaSwhggUDo6ARnW4I07znKE9uUACoF6HjvLn810DGw/yUT3OEaJWOglkje7Vfk1YzbyX
         aL3g==
X-Gm-Message-State: AOJu0Yx1GzOqWu05xFR5xjfJBEgc4HnydGis2ZnHP+hPXTNhgVwMDfGe
	dZqy+9zjgR81kOJbqRavckMUJq2N46qn/46Zuc/96fceF0/WqsUt7CoXGJSp4Jsv5xHaaBQ6HLa
	cSx7CyB2b+rgXhYC64j+oLtRML7Ws0FefjDJWiwTnppnG33Mqwc4lmxd/nY6j4xeSaYKJ
X-Gm-Gg: ASbGncvWf/N6ewOJS1j8b7OpRkGMEcdVZG3H7oWWginzVKb+4VRgESCZYtq3bC8YhA2
	XTgtueIjRzCzyxpriFGUQqogcJP++tF0+0DTNClz7N85zsVDVXeq6t3uHIgA5FGX4knC0C6RR/N
	lMlRmGPA13P2JBxkd35nKR23vzoPLUUxjpTlHfgD3ucu/UgbHOYfePz/GfZZdYSCgArVVTmJwEI
	WFnYnCmuR5dCl9yvdzx1mKoiifulZYZNPI84nPwDBO/930JsgAr127ls5OjnStSCZPaOabkpOvf
	lGnVHoVduLAM4jbosv/m2S6ZZmrDIuh0qZQAU2xaN4aW+Lp7fYQJ8cV7+k0u7uN+nNADUYCek8F
	gxFSPa0z5Cw==
X-Received: by 2002:a17:902:fc48:b0:271:479d:3de2 with SMTP id d9443c01a7336-2962ad13fd2mr16326305ad.13.1762293776308;
        Tue, 04 Nov 2025 14:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFavk35ju6KTwN78IzRXYY+q07xxAOOCvfNpXlRntG/9emf8L8fCqQYtFVa2gtfvOtl9wk9DQ==
X-Received: by 2002:a17:902:fc48:b0:271:479d:3de2 with SMTP id d9443c01a7336-2962ad13fd2mr16326005ad.13.1762293775845;
        Tue, 04 Nov 2025 14:02:55 -0800 (PST)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a80459sm3394989a12.15.2025.11.04.14.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 14:02:55 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
Date: Tue,  4 Nov 2025 14:02:45 -0800
Message-ID: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690a7811 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=TbDdNxe2xOi8XIqjo84A:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: kSzek1gOFly-k-8_jXrYxl18DbM90nA-
X-Proofpoint-GUID: kSzek1gOFly-k-8_jXrYxl18DbM90nA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE4NSBTYWx0ZWRfXxbIdyyXKy2j8
 4KOdMsjt9A+Ib3qYhbchj4of/sgSodDjdCO5YOeeWRO2qibLRpawdO+rAHtQPOtbXB4a7SNkN7S
 9XEskdspyhvtOoRPTC91Wd8j+7uanV8MMucJ+b/2NcbJh2MFbYam+wwtspbSS88YsXL9Cr1TW+n
 bRM5W4BhHgjs17KSFfsobutigC1ePwGmG4ETk7g9anVON//9wDqfnIVMmHy/EfCya5x3Q2i7Sig
 73vnoFDhE4XplijPXYYeQY8hzd/lEKHMC7YdApGa+IeKyoHApPUVWkwB+iD/vtRJjbKEpBiN3Vc
 vEt6zM3zTU0JH7EgkuUB+XxNLN1toWhadGOiEMN/5ZtNDv1J6fNPvAg4EX2EV9cFdoXkOvrtbay
 f/A8HSnsiM7ttaTOEOGkiNQuAg4/NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040185

Akhil should be getting tagged to review GPU patches.

Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1083598bb2b6..033675aab0d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Konrad Dybcio <konradybcio@kernel.org>
+R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
-- 
2.51.1


