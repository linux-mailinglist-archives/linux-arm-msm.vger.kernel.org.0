Return-Path: <linux-arm-msm+bounces-73044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089EB52736
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B0437BA108
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17209256C61;
	Thu, 11 Sep 2025 03:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O88QfUT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88168241667
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562094; cv=none; b=NZ60zSZPx/1Nx9C0tRmApEHlRCRnfhZ+FVeusyq8+uLi41YL6KU4peItYGjifiQOtOfElVCMX9EBDPM/QJAMaBPEa2ohq7+7pyikp2xaKNnuXqkrPzPRhRTMR9qBh+REly0KKtEE/sxWOIyhprm/nMbU+utalAFXRLtErKqVDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562094; c=relaxed/simple;
	bh=PlNtUBn1m92e6j1roGLFXzYvk2/0ghYLEgBgH8NcnDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=foDAsbMO/XNeofCY6N+Nd23d1wIZ6RiGNQqkGo1W4LLDP9Ye7Dj0MEWowaaVDyXL48xGwv/LUd6+OiQnl8h4/uNuJKKpCw0p5cm6TURa9C2UyFW6512e34hWkyRPpzokZJ7mOIfgt4MBb+Ho9/J4QOEHHKkwW4O/HKQO3EWuVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O88QfUT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Iffr008248
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=; b=O88QfUT9GmAis5Ps
	Rd3Etve6sOMnGsOB1PoKeD8JHjerLUfP2tnBbArzZBPIyEuWUNXDvA90enzHZYIM
	jMDje6iPstBEmlMOQI0rDe8TGPMgSQ66X/hLrnByK0zob7QCeJHlUHP9PVPKnzPa
	RcC3Kvr248vdGcBYGqIDecQvOTyole3a9jungNRYUt4VFw+5F8QTQ82+JovIV5pY
	Q35cY677ctHy0L3+qubkkYTiZmCVZGMj9qJzY3hk0rLj6eOLDtL7r96VEgfcCR7M
	NMOtOdB5Fw0DLtcxbWyCJXKdIZuppx/BaG4rEIlxKmTIeUcbY8MEURsYwd/HohAH
	F8hwkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aappd9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24b0e137484so2429295ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562089; x=1758166889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=;
        b=IK6SgjPyP7C62qpPQBON95L5l6eE/cl0Z4UdtE4ExpFeY+I/hnF6YfAvH59jkCLo8G
         ri6lO9khLYEC4te/a2npWHMTDptMRmNQInngeUBBv3rtq6GcVlozNpFt8ojW/oo8LL7+
         0ifRKTVkazTcT2R8Zx+F1vmRd9gO91Hph8EJI8eN8OJcVWlxT3m4LBBPWwzgvQk4Er7B
         7sZc6mhprLj8WRAnQsDJCu21MX0Hq0u2PCL9EhsZscDDkidlkt5SMnFD9GSTuifrPBRU
         ep4BdNjBvWBRmb4jWCQv7DTdgqBwdvT0VPZlDsaPEIbQsjkZNSIB8GavrDEiefG4vrzZ
         06Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUkGG8casZO/Js0FrVz+pwVLCnOhCRW3j92T9wLdTjXtjJFYnbKrnNcr/e0T30yyzKGkQsNJz/iF/KYC8Vh@vger.kernel.org
X-Gm-Message-State: AOJu0YwxnxX+iPxfCUpUiHPnUWT+g2yE1kkQbHQiNewmWQCQa7AdMUxU
	DkehlBlcclzQ5AIyl23ihy9X0I+HMHOglstiqn7AUhlDZfTIms961h7QZsXUJWiC2AAdLlwC+I4
	Lz48PH5l1mz+bomggN5IiiX4manetTUhfYOGlRfPX6Iy/9HzvARss0RAGu9Hrq1sMgMQ=
X-Gm-Gg: ASbGncsWJwlKvntmTMNg8z3WgPI1wP1vHXbkrmeym+UxeJ+527fOsfUiBSLk2/t3dJn
	uCUFzQTQ/gsqpBYVDoys2IW3iYH1YykXmLUMUlmvd+VwjBtrelMTTMA5rrMDngHvgdbWNga5Q2E
	gEep1we/LHT7+uF2PEj+6ERlbrh2nsePjaes3rAxjXBJIF/PxNA2NAeWMUb73MH71T3UMZ7Ur/Q
	1SSSSRPSFePHtR1dW7Ayekppeq0u/2Bn4yXWWP5dlgQtZuBz3YibrU59Q4g3r/A0rpAIXUhY2g4
	XlKIITRM80ww+etkXCBa60KiiZKKmiPW+sMCfYXicVsBwwrn9urGABFuoIRtXkqP+iodk/zZVdA
	hUkdOXCgclnYQXmiJ5tDGgiw=
X-Received: by 2002:a17:903:2b04:b0:24e:13f6:22d with SMTP id d9443c01a7336-251722929d4mr290434655ad.36.1757562088993;
        Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKhpZZ7QQ2u4bajGkkm1KKWLUYyswJaL/iiPppE3MndRE8NjcBrWi4HRB5LTZP40i4NipFKg==
X-Received: by 2002:a17:903:2b04:b0:24e:13f6:22d with SMTP id d9443c01a7336-251722929d4mr290434315ad.36.1757562088589;
        Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:16 -0700
Subject: [PATCH v11 03/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-3-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c244ea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _lkhgfSgJ-YAAsB-Yo2KrRNyG_t1zXEx
X-Proofpoint-ORIG-GUID: _lkhgfSgJ-YAAsB-Yo2KrRNyG_t1zXEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX6dZyq7fxzAfS
 voDlFnDzzAdsegAgCV8xJhna8uMG1zwx687enqtRxL9vZ7vGFfTcZt221C7dNaJ7TppbSupKPNz
 eo/I4xrQylm4iqaghg84vTDBPp9HaFwqN0gbiGqy7ILuh92OvOZ6GayPZF6Pm8hv2y8NSwsmHGZ
 WXn9mpRocOLNYZ1KSteGOMeuXYpPjzm3yRZDDwCtUJkjF8qkNO96CjsYBOVzK/D/yP4IAyF/Ui8
 IB2MNw4AR470fa60Sz2Frp9V6iuZ7oszCfZGCsWA45bqmAqqZLHA1zbhdw55Ds/76zY8lWDi0ol
 frE6lexM8Z3BmU5AVD1FFmy+fZIwMQC6eowYPGapHCptNzE3bt0X8x9MAvolZiFkTW4QhokwpBm
 YR2l8rrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 807317d7b3c5..9fa042d80622 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -926,7 +926,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


