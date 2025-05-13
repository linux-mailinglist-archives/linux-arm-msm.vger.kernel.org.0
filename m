Return-Path: <linux-arm-msm+bounces-57753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACFAB5CD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDDB81B4365D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AB62AD0B;
	Tue, 13 May 2025 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXbIUyHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C47DA95
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747162308; cv=none; b=lBgSQMwX8/WNOzxFSElCK/R5Em52p/Y3gKtcbb2sQwhoC8f+S73hJjh50ZnjM5vsbBCSIp6O1cExAPAn0wq/3iIMfLU51lUg4/10+Rr1FomlEb3pDK/68aDQobo5yZY8E18Ehn4GtX7AX8WuKrXhZME7ES1q+K8Kiy1zsRfILAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747162308; c=relaxed/simple;
	bh=8aF340dgmVwMplRdL4mqUGNXBthPtGz9cX7S0m3V9yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lgTG0WamAcUVslFpi91jYFpIzJiR5Czt2R2I1NKZnlGOgxUNIqfXsrfRUwBMwe3zwZR0NRTjXxWFNqOj7zBZK9ud9KeN/g0xrWdnaxP0qNDZW9bmjfZrL0+3gaLvw8AJVJjVWSiQO8XnQ4KzftqWhBHRD/UBWp7YIHpmH9o0OPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXbIUyHY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRqhI012811
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=spJV8R8Bs+sSlbQ8ehRNXH
	ZILSzp5Uy8JZHgSPrWiv8=; b=GXbIUyHYlAsbf6jVpJqiOe6Phh4ElBlYzJLAwq
	ysariO3UGI6TChpuL6dGHd++bOyYxfaIDetkA7KlbAYwAkQFKzCsRi6QHiH3zfcS
	vZUfyfBtQBh4pPi8u4Lq93XVBxNmJKaZ9Ce+AKV4QaLhpjVTeTNBRNs5j05AKuAj
	XhPjsWGYFg89nZI/ajBQ41GwG2T2zjBnNJMYkVJGtsdNMR/rbYlAcMfN4Il0mv2I
	tgRKGnfFR/H8EiVNUqDtdG2Bj/W/iu8jk52iP+PluDCr6npI5Zr88aBFStTwzzjk
	h4qbPqZs/NO+Ny7ENpqWesvMCLfnC1H+6FrIASPs3JricA8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp82gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:51:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so1100664085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 11:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747162305; x=1747767105;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spJV8R8Bs+sSlbQ8ehRNXHZILSzp5Uy8JZHgSPrWiv8=;
        b=X171uISLYKtB0uR3S1xKWmIJvZKWApICJSTzfbTnFLNJDpeILVm5lHWCj+IR5XEiUC
         tr7CuGnNUxBpaeEyKuUAQyb4SLdZkMxPLV8aEFtxqX4Gdlsnd/pP+WTdTmuuWkOp/zVY
         bsH2LHpbDTpOWsNlF+cXifXdW3tvZ3kpeY2MW9ScI8HOE66fxv474OuDXbN4oFmY94fz
         TT7qRo1eLhzSVomoxeRlu6GlUKyMjUsIBYCRLtaRD5Hy7nPjXVxWmp795yzG0OO4+rjG
         JEpMLzDLZGwZw/ZyNJOgTJ3MQVI7tLiBar1LaEmGnnx/OtDN+SqEKDSY64HTduIqygcx
         ybiw==
X-Forwarded-Encrypted: i=1; AJvYcCXW/e10n+KrPNB770WxXfzq5mvuUezdGxDhlfODuugLYprKXTQpKjsCet4ABehDDtlUnh7dNcgELhKvwi2W@vger.kernel.org
X-Gm-Message-State: AOJu0YxM95vTiwGU5piUXoCNrGC8lVDaSUxtbrmXX2+9RQLLh3QPatfM
	wljDDGqEyKMWFtKQKvlH+eAtv0krKx3XTWaxEPO/qOQJRoqioYB8FLL92xp8OCOVMSksr3cqvgH
	coNXiAad4xIzXuOtnzd5aZCKVZP7LTFWkUU4pYKoXpgb43tbNoGpTjlGkqI9vjHzm
X-Gm-Gg: ASbGnctdDND+29+h1dso+5/MBpjf5g5rlJ+sJjos7uxbdRmK9AHLDbKBXkwu4RCXyKf
	dbhf+7wAjWgf/25RYAj4x1Tpvd9cGUO3B16S6KTTkuDqqbaNIN1UeDRj/2NFd52icz4ZZ1DfHYQ
	XgyFRO9o+h9gI0UIY4LEhA3zc4mzY0MMFtkczCmc8tBHVJ4eQ7eLH2fKCAelAUK9UzmZccV1x/g
	f2oRcobAC1XACRgfxqZHVHTgB33rOdMUd6BYadwRWhCkfmlcKNs6KL78UWGp1lsS+FbAS/YAgZ/
	85ncJP3FmlDrL6yLwqlNOu77bPHDvzwh2goOwD9OT2Fv5vPIvU9asR+W3sf2qwwUNh+1DiZEzOU
	wnV8dTRn1hI4OeuhfeEuZET8G
X-Received: by 2002:a05:620a:4551:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7cd28847654mr136577585a.40.1747162305171;
        Tue, 13 May 2025 11:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKPB9Lqd5DHIDqIUSv2k1KGjQ6LFo1CTuDOZKsPaobR2sbUqTntY/YEFbpxxNxBcCiVDzTVw==
X-Received: by 2002:a05:620a:4551:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7cd28847654mr136573085a.40.1747162304785;
        Tue, 13 May 2025 11:51:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf86fsm1958205e87.178.2025.05.13.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:51:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:51:41 +0300
Subject: [PATCH] drm/ci: disable sdm845 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-ci-disable-sdm845-v1-1-9c3ca7d0f24b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALyUI2gC/x3MSwqAMAwA0atI1gY0taJeRVzUNmrAHw2IIN7d4
 vItZh5QjsIKXfZA5EtUjj2hzDPwi9tnRgnJQAXZwpYGvWAQdePKqGFrKouTd1Qb2xK1DlJ3Rp7
 k/p/98L4fjmeyXGMAAAA=
X-Change-ID: 20250513-ci-disable-sdm845-fca26359229a
To: Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8aF340dgmVwMplRdL4mqUGNXBthPtGz9cX7S0m3V9yY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5S+1K1S5sW7YKw4EMKuEMPH6y1TiYRpCvxYJ
 tEhQgDB/s+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCOUvgAKCRCLPIo+Aiko
 1YMoB/0VrkkVQfRm3u7sOkHUgXVMQO4ygTDFfTGsUywrYYNzd7dvsEWrEs9myvn9POsj60lOkdS
 gmy55JITDFOdBESpZh05xg8ufrSYfPoYS5x+TXeWdcwHm2fqLrCbv9FsPZ1R7XN9meoKucdnYMc
 /A33AN946aNu2TzHmHl1BQE1zySRhw8HusxPDhxC3X9hc9Q3N481VdcTx12+4v3tfygxIB2PHsG
 FMgrsxaCF1Ls9pxeehzWXvp6OfKuPDPzwnIdU0C2s85M6JLq0RZWg28D9m/TLsMrKiC3cUnxPsf
 VY1jMTNV+7e3DZX37sdiM/aCVRlRU4eVSMeUwG3L117dT0NQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JTQu7wwvzimEy0oj983m4R9hPqGRtKRG
X-Proofpoint-ORIG-GUID: JTQu7wwvzimEy0oj983m4R9hPqGRtKRG
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=682394c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=O38deLNlhEFyGSD7h7sA:9 a=QEXdDO2ut3YA:10
 a=s5zKW874KtQA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE4MCBTYWx0ZWRfXwtaVdklHpO0f
 lCp6+XHFwlZuZXtAmu/P4wedBozqlF4HJqow+ZerlHwvUj3tAceXAmR5WpW+jofXNuOsKrsA6LM
 4fSmWF06kgjF9Ksl/EYvbS12ztS04nz3M8rsa1/8FxAJU2px9Usihcwyq3SY4XMoTeDE+y21QWV
 t3yh+Ef0e3UH014S5fDqDnmWwKsoJkoODLCkroU7pVgZPPaDRuK+w4JFGZPGaMq7ix/1I0QwXVJ
 PTumvMTn/BLovJ7JTY5rC2ZN+beiK6FgSlwMKHwRf8CZWKBBVBMNBmji6M4FxFysuXN8YHx4R6H
 txeynKLOIuKxeRhrXmjkj63olv91IyBoy4Rjhtvfak5rgJLxvJkuyxJmep5qUl9NlSXsSmMuRaw
 fgo8pe9kOUlsf8ZCBeGMAHfbuUFGafptwyC2G+KwdjH4lbP8KM06NI1l3/ztQs+8ypX+skgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=574 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130180

The SDM845 Cheeza runners are currently offline. Disable them until they
come back again.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/test.yml | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 84a25f0e783b6ca7f8a993c709d5a0fc86bf18d3..cc685833e8d2747dd21dc9a549c3d405431de8d0 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -180,19 +180,19 @@ msm:apq8096:
   script:
     - ./install/bare-metal/fastboot.sh || exit $?
 
-msm:sdm845:
-  extends:
-    - .baremetal-igt-arm64
-  stage: msm
-  parallel: 6
-  variables:
-    DEVICE_TYPE: sdm845-cheza-r3
-    DRIVER_NAME: msm
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
-    GPU_VERSION: sdm845
-    RUNNER_TAG: google-freedreno-cheza
-  script:
-    - ./install/bare-metal/cros-servo.sh || exit $?
+#msm:sdm845:
+#  extends:
+#    - .baremetal-igt-arm64
+#  stage: msm
+#  parallel: 6
+#  variables:
+#    DEVICE_TYPE: sdm845-cheza-r3
+#    DRIVER_NAME: msm
+#    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
+#    GPU_VERSION: sdm845
+#    RUNNER_TAG: google-freedreno-cheza
+#  script:
+#    - ./install/bare-metal/cros-servo.sh || exit $?
 
 msm:sm8350-hdk:
   extends:

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250513-ci-disable-sdm845-fca26359229a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


