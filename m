Return-Path: <linux-arm-msm+bounces-62502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146CAE8B91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE534189CBD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504B32C3274;
	Wed, 25 Jun 2025 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwloIaqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED7C3074AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873044; cv=none; b=BMy6wQM0XAYBe9EiSAXG4B4Z3Mr34TqYMuck5u7yo48uX8ttIaEK4btpWAI9t+UDNkdpuKH+huDHFLRqdqhIsjIy9Ess4USVsHtYXRUQZ/45e+BSk6oQvWJstK5SFdJxwEan0a0C9N02dGN3wzn2bOBSX0/Sqv7mL6y6LRGrBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873044; c=relaxed/simple;
	bh=7CoLpKlmz/QGjr31AKeTMJknZT5fUDMYKkXULdIt2Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtGcU/D4gKIfFyKEWKkkAMj2EC1pKRTZGWZ/qpSdnyqqjXxQ3JNNAR7WuVYQarAsCcsuTds4OxpEm3c9nffzj4EgpX3eonzFxwe7u1xpbIgu2jhvw1ghmgGi4urcXD92rzKjftkLpUc7hV5iZOmp1JSVrvG4YENFwiWq6TGn5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwloIaqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBH1qA015731
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L3IkuLMHxBT
	vbI+yz+IctwdTPNqPbXWCWa1wtpGui48=; b=VwloIaqYjPnsCDbew6FnKFsRP2k
	zWH1+upcU0ueRhEgPIQ/2T9l4y8v06qiu3ncrrPihAaCWKO+GkmprCMQ0ySuD/f1
	SIVl8B/5uTq/i1MPyjdcx4LZeQOU/00hw4UUhLh127/+tuyrbjUuQdFyQFHJNK13
	KpGeKgKMfRMGxlPzbRtvBptBfq2Z0e4jGrLDqTgX4lQPga0mxfbbPm+k4e1ERYoB
	u+1SZqHRm465Xarn39lxM/TdlVdvcY24u/GKjMMdGZBbZwB6a6DSj4o831m5xoSN
	EGya8NUKx4JB69Bzorsde4Z4nHAITx0d2PVhavSqVXttGyNCBf3q2IVX5tw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5surb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 17:37:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74858256d38so137881b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873041; x=1751477841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3IkuLMHxBTvbI+yz+IctwdTPNqPbXWCWa1wtpGui48=;
        b=b8epn15idJkzn3qS5ZZ+1rUXG4lh7/LRqj4b4wQg7932Gok4GaRFEHd8Ib8FdCyV2u
         mFuFxd1ZRKke843kIGsvRNkTZrDAhUkfZAfXfnaLZsrhr+nBkkOjQu+Q9qkODPnHqOII
         uw79b0HJgVpy9tu4vai7cuaAg1NrU4j3FQswrBxQvqfR8CV5nLcq+yloVtrZVK9zNClg
         Z57Rg8WwMN1AHVqmzwAVCvhhs7WR5l7KoKDVfHVQh9G3OzM3exqS15tPlsg/DgLP+IGQ
         BUeFJzIMjjmxuadnWKMa6MAUZf6RhVoNm1eohZtxJ0yg8LzaeU/cp7ddXLPC0C9cFYAT
         Cerg==
X-Forwarded-Encrypted: i=1; AJvYcCU5OkFBGslJdLLp/6lDM2KMN51Q6kaMGug81ULoRf2XQ+8Vi4WPe9b207BW9jMfVHafAlKVuoMoBJATkP6x@vger.kernel.org
X-Gm-Message-State: AOJu0YwsSKxm/vjjgNtifMNtE/aErhpx5EtB+yoa3Lech8l5yXjgQSTA
	3L0dhQ8a3vbvZEFF4DpiYYBlsKcw7pdksY8Qp0F+/DZMlIkFi3XP5Dnha5PSTbJcM6f1JJAiXlO
	upPSfVNt2gHos4Ns7kIkLy32UfJ0WCPFf99Sm2AHDvBgbuXjmbPPPAAcsgEwTllLyRpVJ
X-Gm-Gg: ASbGnctCUmRRPx4N+Xc1IGNui/Y7DvGZiUtu3vRjLR8hbKvZaZrzqzvR0asE2QIaWiT
	3sqViUkN+5tV+o0P7VcYvWHB4xwg05nwDQltEsuPvnvzyN34Vr0lYThtpgesljaL+Ro9e/+6k/E
	iBlMoyB7TfOvU2lkQTDqwxNtysDYhPbNl0vn06h911aZkfSopc48pRLLj8mrwvZHWUsKvY9YHnx
	a0QrBtb75K3BHEtwsvlDL5y7do6vp4ZO3Ct8lwVZreSLq320E0DSBLx/c4YkocbcwNtOri4MzB+
	aO7DKI9leC7UTXX7Y3cEE2/qhuvtA27X
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id d2e1a72fcca58-74ad446b920mr6496017b3a.6.1750873040850;
        Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaPLQjjw1Mco1AYfNaO1hktOiz7kntJ0uT+EkN12nTw8n3p877U5Ag/TwdHyi0A1rBcURknA==
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id d2e1a72fcca58-74ad446b920mr6495985b3a.6.1750873040378;
        Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e09e1csm4775934b3a.5.2025.06.25.10.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/fourcc: Add missing half-float formats
Date: Wed, 25 Jun 2025 10:37:10 -0700
Message-ID: <20250625173712.116446-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oagvXgJZEHL58eNQbA1yp2Ho37t1gkQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEyOSBTYWx0ZWRfX4rwjxNSJNDQl
 fVKMk03Q1NagRvl4pToPxE6da7RohCJ1zFSldtOkh2M8+ML+05J0f3m46vDN6OveMQk4iLvA0ze
 eQQ6+hcwGUqir54VkW1Fn1ePwZX+qQouF3/lamYHPOr0YwmuRU/khJmmN6DPym88bbjTSxb8/aH
 +Km8RTr9lO0vrkz/IBHq1U7wBWcmW5FoqdozoSUOI+N/yOZq/1JhEP6wHnG806yjf/h7E522h6s
 /9QX+RtMV7jRa9s/JBKi3Ojp+vLhYsYlUd/R49w19smppH7rVrzczHBY3upPFhe6fZ6RgjJcK5F
 Wh73h9/PrWe38XAFRkyrI0HORXAQBXS2ihOa1oMR6u4XWhJdMJNEVdAaaCWDrNFThR/IUSLSAt2
 8CPA/1q5lyUgqR41SKkqEmQaw2wh5OhUX7/ZLvBwW0ItKPCyXV4hjTwTPJ0wBejpBaOr/EyT
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c33d1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: oagvXgJZEHL58eNQbA1yp2Ho37t1gkQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250129

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..3560ca1ffb8b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -218,7 +218,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +228,10 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0


