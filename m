Return-Path: <linux-arm-msm+bounces-75857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E8BB5A5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 01:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3634A2E25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 23:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D6F3BB44;
	Thu,  2 Oct 2025 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrWQ47R7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07C2BAF7
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 23:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759449471; cv=none; b=PUpqw9ed2FfV+URzL3CrUBDsKp21cR1T5SYm7qy+kPrmzoDgyYCpbyfCBRIH6k8LSBy+GohedhYmfgEjn05jHoT1iXIUqMi8AGqKuKjybJ7jD3oVWRZefB9TBot/4W8zllguP3GHhK66OpZDBurb8tmCYBLY/lC0dX0nd5CSLUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759449471; c=relaxed/simple;
	bh=bgT3hSLAPpI6ylw6xIFQ0tOWQoAvzGbHmZph6BNaMVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pP2+jDDnrYNeAlmRHfJdLng4v3KQVqjZvGprNN2r0PXxGVtJQJbHf84BCfvXveLuKggVo1Ke+hNzf0WwppWeBcraq49hkIiDkMnIS3cw4xvMxSoch1dcfe6oD81tsPsFEk+WmF4sBWjzwhWeiGcMLRRCxdGEynDMqMB9IVtgfGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrWQ47R7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592LlAFG001185
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 23:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PWeX3pwFQajV931yQ8BTkc
	33/7zopEsdK/riLLlmelc=; b=mrWQ47R7piAFE+oAXbyOprIKNRFSpSsulfDU6J
	m02E7BDjNnGccIUWtEOsamyFzuRA5bzM4b7E2WZKxtaqShRz5C8lNJizKSgJq9xP
	HMTxNeBMXXC42akbNZcaQDrsxzwH+g8eKjzFENGfA3YnnnPBkJGITSM3KXRLRO2L
	CyKLSKcWmfoduKOlhPNTS4NiyyN33+r5IfZhXjNzwjFF4Jj1yArImQlRaPudgKMr
	kx7NVmS7ilJvGlncEol4ISklkf5laxDkTQ0Qk6KnLCdteGHSZo+wEmTpCU16UnDU
	5VKlKoeSHiayoRll/x+e0Nn0p7v1geU0kIS4Mfeui26ayocQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x61fk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 23:57:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e90fe10feso20463735ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 16:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759449468; x=1760054268;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWeX3pwFQajV931yQ8BTkc33/7zopEsdK/riLLlmelc=;
        b=rEtVLfDjjdYBjYzMGe17lsUGtmB8XL16VqVINfDCWgfUxmzC62Wqx7HrnrishjAJfW
         OnvCPZGcmifiKBnd6ggPweCt4vI/0C9Dryrsl5us1qg/5HWEyRZ7a10kwvUQyfhCY+sl
         K2IKIiE7ZFM1MoLYnW66OD6XhezzQ6rGCtAjj+OkN+dFbiEUwJke/+Ix81jOkTuHw/lC
         wwNxhxPxzzrRWf7EA1vDIsIcSsTTWrdf88y5E2rmn59otW0IUlXO4y4K24Ig46iK79Ry
         EesTer1YAcVUeVD2p3UO72BRI3QJaaGi86GSm2OdcrypHRJ1EuJDtkOC9RBLIzwSjtXM
         TF7w==
X-Forwarded-Encrypted: i=1; AJvYcCVpmu48Ls+lMbZBaYiu6di6L78Qp7YsUxr5gI+BDBtDhsV89iMrhS90cyCgmhjlQgF5BHzgu05Ie3ceZMBd@vger.kernel.org
X-Gm-Message-State: AOJu0YxFv0cwhlCBZiUxkyc9e2pq4iNmKrKAb9i8htZd1/Q914aknYRz
	1CWdrhhJ80Y7Yi8LYU+spa+k+ispmQOcofRDyXeW8Mjw7DhHlPAC2w3M9DFv+AqNgnvapBaaJTM
	KORyfbemqZruNO0G9DoWWcn49vMHTtZHqr3iLwaAp1vw4e7QZdYs/ltjfZrhRJ2IOKAGB
X-Gm-Gg: ASbGncuyIQOAGNC0QQ8AyNPASsGKssttN8Kv66hX60Q/4iuQU1xgbGbfQ8DWVDmhjY9
	WB+azmLu0AhHBGWvL0CrOVb4RvGwtXkNqiw+PURT/3G/OKiW/OiEKUjpkvW02nGn2txMaOQnXcH
	oCej+wXvUFXIziOZI2XcoPc6LH32MZwzI8v1b67pTQN48XlLGpTwPtZ6qZV1RWNcRoqHolFlf0u
	OsWelUe22Z/feQ+AVz+p36dUebIbnXr4XLzr2ZjWgs81CgEpn0VZ+01UZ9wKSp9yyaIdQ5lsmWb
	aDXXVsE9XJJ1MRXAcEQIxxejh3UWQMSFQ1mGfDpNIxMlXMyjd5i04QnTSCcsj/WOAA3KqkewDyX
	lwHf+u9K/0fIqGsMa5/bIvBtcevS99A==
X-Received: by 2002:a17:903:b46:b0:28e:7fce:6685 with SMTP id d9443c01a7336-28e9a656975mr10213355ad.32.1759449467810;
        Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt+w1yH8tjJDlpzM77QlJgNO6+lvwpEnpefV0xzKNfgoby5Ecn/s4spLV3aQXIHkcWmUi6rA==
X-Received: by 2002:a17:903:b46:b0:28e:7fce:6685 with SMTP id d9443c01a7336-28e9a656975mr10213155ad.32.1759449467361;
        Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b845bsm32064985ad.79.2025.10.02.16.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 16:57:35 -0700
Subject: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG4R32gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwMj3cLSzBLdwuT8XF1TQyPTJDOTRAuzxEQloPqCotS0zAqwWdGxtbU
 AfC2RVFsAAAA=
X-Change-ID: 20251002-quit-qcom-5125b64a86aa
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759449466; l=1286;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=bgT3hSLAPpI6ylw6xIFQ0tOWQoAvzGbHmZph6BNaMVI=;
 b=l8iBum1BMYFVeRyUUElwyPpEZN2AqzHaItOorjlKbFsSKPlE/Wlbl3eMGu6V4Bszw4fBeLeAO
 FXoo6kQLfstDYB06w7tBX7xdwDLo2BfVlqwff9d5pHGZxwUF81ZnY8P
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: jZyO2nG51FqJ4Qxob0U33kerOQfSeFaX
X-Proofpoint-ORIG-GUID: jZyO2nG51FqJ4Qxob0U33kerOQfSeFaX
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68df117d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=KKAkSRfTAAAA:8
 a=69LWc1rl86c1DZQ69rIA:9 a=QEXdDO2ut3YA:10 a=2MHBSq50hwYA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX4fwt9ZFiO3LS
 avrFkm0n72qIjILDQj1IFbIgpx5MhtPLprYIAOOTO39qzwOjSrtzMECS8DK0Q49ypd8rM+gyZPi
 Fye2y56ABf8j3jYarylPomLrWFODJWTPRKs2OFOq19/1joSMqv08pP8ijzUz4n5F1syVr9dhQaC
 HrAJVyDUBGKJJ7rKMh0zTyZqrIa4eV6DWj5sW+6yDN7WZDUIWyTcrFYDblGavDOZ8SGiVFAKgqX
 XD+w2D2JT1Nc1R0+NFIwwbaJ3zYo3EkIMnHrr6WNXWJT1CAiG3jCzMkkt6YwAUeDus+YDPn/eei
 +kLS8iLrTOY6fAC/aUmP7iDiqXCRBZ3PNxtJRRQYIqauiYkvfrj3oVjmI65d184N0QtjibewwC0
 VI5Frbji9e+ZSQQFEfhHof22q8nB1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

My current email will stop working soon. Update my email address to
jesszhan0024@gmail.com

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7515a412e9..7a712ded8f9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
+R:	Jessica Zhang <jesszhan0024@gmail.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
 
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
+R:	Jessica Zhang <jesszhan0024@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251002-quit-qcom-5125b64a86aa

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


